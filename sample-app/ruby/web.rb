require 'sinatra'

PASTES = {}

get '/' do
  erb :new
end

post '/' do
  id = sprintf("%x", rand(9999999999999))
  PASTES[id] = params[:data]
  redirect "/#{id}"
end

get '/:id' do
  @paste = PASTES[params[:id]]
  erb :show
end

