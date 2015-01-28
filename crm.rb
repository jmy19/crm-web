require 'sinatra'
require_relative 'contact'
require_relative 'rolodex'

$rolodex = Rolodex.new

get '/' do
	@title = "My CRM"
	@crm_app = "My CRM"
  erb :index
end

get '/contacts' do
	@title = "Contacts"
	erb :contacts
end

get '/contacts/new_contact' do
	@title = "New Contact"
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


