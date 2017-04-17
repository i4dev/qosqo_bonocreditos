class BonocreditosController < ApplicationController
  unloadable
  before_filter :find_project


  def index
    @rol=Role.find_by_name('Scrum Team')
    @alumnos=[]
    @project.children.each do |subproject|
      subproject.members.each do |member|
        @alumnos<<member.user if member.roles.include?(@rol)
      end
    end
    @alumnos.uniq!
  end

  private

  def find_project
    @project=Project.find(params[:id])
  end
end
