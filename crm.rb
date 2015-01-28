require 'sinatra'
require_relative 'contact'
require_relative 'rolodex'

$rolodex = Rolodex.new

get '/' do
	@crm_app = "My CRM"
  erb :index
end

get '/contacts' do
	erb :contacts
end

get '/contacts/new_contact' do
  erb :new_contact
end

post '/contacts' do
  new_contact = Contact.new(params[:first_name], params[:last_name], params[:email], params[:note])
  $rolodex.add_contact(new_contact)
  redirect to('/contacts')
end

get '/contacts/:id/edit' do 
@contact = $rolodex.find_contact(params[:id])
erb :edit
end


