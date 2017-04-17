class ProjectHooks < Redmine::Hook::ViewListener
  render_on(:view_projects_form, partial: 'hooks/project_form')
  render_on(:view_issues_form_details_bottom, partial: 'hooks/issue_form')
  render_on(:view_issues_show_details_bottom, partial: 'hooks/issue_show')
end
