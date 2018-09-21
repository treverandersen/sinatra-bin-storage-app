require './config/environment'

if ActiveRecord::Base.connection.migration_context.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

require_relative 'app/controllers/users_controller'
require_relative 'app/controllers/bins_controller'
require_relative 'app/controllers/loads_controller'

use Rack::MethodOverride

use UsersController 
use BinsController
use LoadsController
run ApplicationController