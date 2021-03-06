require 'bundler'
Bundler.require
require_relative 'gossip'

class ApplicationController < Sinatra::Base 

 
#apperler le html new_gossip.erb et luis donner l'adresse
get '/gossips/new' do
  erb :new_gossip
end

#Pour recuperer le puts de l'input de la page new_gossip.erb
post '/gossips/new/' do 
  Gossip.new(params["gossip_author"], params["gossip_content"]).save
  redirect '/gossips/new'
  end

  
#pour appeler une des gets de l'index 
  get '/' do
    erb :index, locals: {gossips: Gossip.all}
  end

  #Creer des pages dynamiques en utilisant id
  get '/hello/:id' do
    "Hello #{params['id']}!"
    end

 # affichage dynamique du gossip par id
post '/hello/:id/edit' do
  puts Gossip.all(params[:id])
end
  
end


=begin
    get '/' do
        "<html><head><title>The Gossip Project</title></head><body><h1>Mon super site de gossip !</h1></body></html>"
      end
    
      # Cela permet d’exécuter le code de la classe sans avoir à écrire un ApplicationController.new.perform en bas du fichier.
      #run! if app_file == $0
    end
=end

