require 'sinatra'
require_relative 'contact'
require_relative 'rolodex'

$rolodex = Rolodex.new

$rolodex.add_contact(Contact.new("Johnny", "Bravo", "johnny@bitmakerlabs.com", "Rockstar"))

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

get '/contacts/1000' do 
@contact = $rolodex.find_contact(1000)
erb :show_contact
end


