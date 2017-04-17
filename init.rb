require 'redmine'
require 'project_hooks'
ActionDispatch::Callbacks.to_prepare do
    require_dependency 'issue'
    Issue.send(:include, IssuePatch)
    require_dependency 'project'
    Project.send(:include, ProjectPatch)
end

Redmine::Plugin.register :qosqo_bonocreditos do
  name 'Qosqo Bonocreditos plugin'
  author 'Eduardo S. Terrones & Martín Roberto Tolava '
  description 'Visualizar la cantidad de bonocréditos de alumnos. Para aprobar la materia Proyecto de Ing. Sistemas de Información de UTN-FRT'
  version '0.0.1'
  url 'http://github.com'
  author_url 'http://project.i4dev.com.ar'

  project_module :qosqo_bonocreditos do
      permission :view_bonocreditos, {:bonocreditos => [:index]}
  end

  menu :project_menu, :bonocreditos, { controller: 'bonocreditos', action: 'index' },
    caption: :'menu_label',
    after: :activity,
    params: :project_id
end
