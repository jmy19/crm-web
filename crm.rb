require 'sinatra'

get '/' do
	@crm_app = "My CRM"
  erb :index
end

get '/contacts' do
	erb :contacts
end

get '/contacts/new' do
  erb :new
end