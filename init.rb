require 'redmine'
require 'project_hooks'
ActionDispatch::Callbacks.to_prepare do
    require_dependency 'issue'
    Issue.send(:include, IssuePatch)
    require_dependency 'project'
    Project.send(:include, ProjectPatch)
    require_dependency 'issue_query'
    IssueQuery.send(:include, IssueQueryPatch)
end

Redmine::Plugin.register :qosqo_bonocreditos do
  name 'Qosqo Bonocréditos plugin'
  author 'Eduardo S. Terrones & Martín Roberto Tolava '
  description 'Visualizar la cantidad de bonocréditos de alumnos. Para aprobar la materia Proyecto de Ing. Sistemas de Información de UTN-FRT'
  version '0.0.1'
  url 'https://github.com/i4dev/qosqo_bonocreditos'
  author_url 'http://www.github.com/i4dev'

  project_module :qosqo_bonocreditos do
    permission :view_bonocreditos, {:bonocreditos => [:index]}
    permission :set_bonocreditos, {:issues => [:index]}
  end

  menu :project_menu, :bonocreditos, { controller: 'bonocreditos', action: 'index' },
    caption: :'menu_label',
    after: :activity,
    params: :project_id
end
