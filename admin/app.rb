class Admin < Padrino::Application
  register Padrino::Mailer
  register Padrino::Helpers
  register Padrino::Admin::AccessControl

  ##
  # Application configuration options
  #
  # set :raise_errors, true     # Raise exceptions (will stop application) (default for test)
  # set :dump_errors, true      # Exception backtraces are written to STDERR (default for production/development)
  # set :show_exceptions, true  # Shows a stack trace in browser (default for development)
  # set :logging, true          # Logging in STDOUT for development and file for production (default only for development)
  # set :public, "foo/bar"      # Location for static assets (default root/public)
  # set :reload, false          # Reload application files (default in development)
  # set :default_builder, "foo" # Set a custom form builder (default 'StandardFormBuilder')
  # set :locale_path, "bar"     # Set path for I18n translations (default your_app/locales)
  # disable :sessions           # Disabled sessions by default (enable if needed)
  # disable :flash              # Disables rack-flash (enabled by default if Rack::Flash is defined)
  # layout  :my_layout          # Layout can be in views/layouts/foo.ext or views/foo.ext (default :application)
  #
  set :login_page, "/admin/sessions/new"
  disable :store_location

  access_control.roles_for :any do |role|
    role.protect "/"
    role.allow "/sessions"
  end

  access_control.roles_for :admin do |role|
    role.project_module :votes, "/votes"
    role.project_module :users, "/users"
    role.project_module :teams, "/teams"
    role.project_module :supporters, "/supporters"
    role.project_module :candidates, "/candidates"
    role.project_module :auditions, "/auditions"
    role.project_module :accounts, "/accounts"
  end
end