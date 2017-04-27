class BonocreditosController < ApplicationController
  unloadable
  before_filter :find_project


  def index

    @alumnos=[]
    if @project.parent && @project.parent.module_enabled?(:qosqo_bonocreditos) #si => proyecto es padre y el modulo bonocreditos está activado
      @rol=Role.find_by_id(@project.parent.bonocredito_student_role_id) #entonces => rol = Rol que se defina en el campo student_role_id de bonocredito
      if @rol.nil? #si => campo está vacío
        @rol=Role.find_by_name('Scrum Team') #entonces => rol = Scrum Team
      end
      @project.members.each do |member| # Por cada miembro del proyecto hacer
        if member.roles.include?(@rol) #Si => el rol del miembro es 'Scrum Team'
          bonos_cyc=@project.issues.where(assigned_to_id: member.user_id, tipo_bonocredito:"Conferencias y Congresos", tracker_id: @project.parent.bonocredito_tracker_id).sum(:bonocreditos).to_i
          bonos_rs=@project.issues.where(assigned_to_id: member.user_id, tipo_bonocredito:"Responsabilidad Social", tracker_id: @project.parent.bonocredito_tracker_id).sum(:bonocreditos).to_i
          bonos_sdi=@project.issues.where(assigned_to_id: member.user_id, tipo_bonocredito:"Semana de la Ingeniería", tracker_id: @project.parent.bonocredito_tracker_id).sum(:bonocreditos).to_i
          total=bonos_rs+bonos_cyc+bonos_sdi
          @alumnos<<{user: member.user, bonos_cyc: bonos_cyc, bonos_rs: bonos_rs, bonos_sdi: bonos_sdi, total: total, project: @project}
        end
      end
    else
      @rol=Role.find_by_id(@project.bonocredito_student_role_id)
      if @rol.nil?
        @rol=Role.find_by_name('Scrum Team')
      end
      @project.children.each do |subproject|
        unless !subproject.active? #Solo entra a analizar los miembros en proyectos activos, no cerrados!!
          subproject.members.each do |member|
            if member.roles.include?(@rol)
              bonos_cyc=subproject.issues.where(assigned_to_id: member.user_id, tipo_bonocredito:"Conferencias y Congresos", tracker_id: @project.bonocredito_tracker_id).sum(:bonocreditos).to_i
              bonos_rs=subproject.issues.where(assigned_to_id: member.user_id, tipo_bonocredito:"Responsabilidad Social", tracker_id: @project.bonocredito_tracker_id).sum(:bonocreditos).to_i
              bonos_sdi=subproject.issues.where(assigned_to_id: member.user_id, tipo_bonocredito:"Semana de la Ingeniería", tracker_id: @project.bonocredito_tracker_id).sum(:bonocreditos).to_i
              total=bonos_rs+bonos_cyc+bonos_sdi
              @alumnos<<{user: member.user, bonos_cyc: bonos_cyc, bonos_rs: bonos_rs, bonos_sdi: bonos_sdi, total: total, project: subproject}
            end
          end
        end
      end
    end

    #@alumnos.uniq!
  end

  private

  def find_project
    @project=Project.find(params[:id])
  end
end
