class BonocreditosController < ApplicationController
  unloadable
  before_filter :find_project


  def index
    @rol=Role.find_by_name('Scrum Team')
    @alumnos=[]
    @project.children.each do |subproject|
      subproject.members.each do |member|
        if member.roles.include?(@rol)
          bonos_cyc=subproject.issues.where(assigned_to_id: member.user_id, tipo_bonocredito:"Conferencias y Congresos", tracker_id: @project.bonocredito_tracker_id).sum(:bonocreditos).to_i
          bonos_rs=subproject.issues.where(assigned_to_id: member.user_id, tipo_bonocredito:"Responsabilidad Social", tracker_id: @project.bonocredito_tracker_id).sum(:bonocreditos).to_i
          bonos_sdi=subproject.issues.where(assigned_to_id: member.user_id, tipo_bonocredito:"Semana de la Ingeniería", tracker_id: @project.bonocredito_tracker_id).sum(:bonocreditos).to_i
          total=bonos_rs+bonos_cyc+bonos_sdi
          @alumnos<<{user: member.user, bonos_cyc: bonos_cyc, bonos_rs: bonos_rs, bonos_sdi: bonos_sdi, total: total}
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
