#REQUIRE TOP LEVEL FILES/ GEMS
require 'sinatra'
require 'data_mapper'
require 'sinatra/partial'
require 'rack-flash'

#REQUIRE MODELS

require_relative 'models/donor'
require_relative 'models/entrepreneur'
#will add transactions
require_relative 'database_setup'

#REQUIRE CONTROLLERS/ HELPERS

require_relative 'controllers/application'


#SET-UP SINATRA
enable :sessions
set :session_secret, 'super_secret'
use Rack::Flash