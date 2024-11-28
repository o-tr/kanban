Redmine::Plugin.register :kanban do
  name 'Kanban plugin'
  author 'ootr'
  description 'Kanban plugin for redmine 6.x original: https://github.com/happy-se-life/kanban'
  version '0.0.12'
  url 'https://github.com/o-tr/kanban'
  author_url 'https://github.com/o-tr'

  # Display application common menu
  menu :application_menu, :display_menu_link, { :controller => 'kanban', :action => 'index' }, :caption => :kanban_menu_caption, :if => Proc.new { User.current.logged? }

  # Display menu at project page
  menu :project_menu, :display_menu_link, { :controller => 'kanban', :action => 'index' }, :caption => :kanban_menu_caption, :param => :project_id

  # Enable permission for each project
  project_module :kanban do
    permission :display_menu_link, {:kanban => [:index]}
 end
end
