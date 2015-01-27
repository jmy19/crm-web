require 'sinatra'

get '/' do
	@crm_app = "My CRM"
  erb :index
end