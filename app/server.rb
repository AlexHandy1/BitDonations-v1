#REQUIRE TOP LEVEL FILES/ GEMS
require 'sinatra'
require 'data_mapper'
require 'sinatra/partial'
require 'rack-flash'
require 'blockchain'

#REQUIRE MODELS

require_relative 'models/donor'
require_relative 'models/entrepreneur'
require_relative 'models/transaction'
require_relative 'database_setup'

#REQUIRE CONTROLLERS/ HELPERS
require_relative 'helpers/application'
require_relative 'helpers/confirmation_email'
require_relative 'controllers/application'
require_relative 'controllers/ent'
require_relative 'controllers/donate'
require_relative 'controllers/donor'


#SET-UP SINATRA
enable :sessions
set :session_secret, 'super_secret'
set :public_folder, 'public'
use Rack::Flash