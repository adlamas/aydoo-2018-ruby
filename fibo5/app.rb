require 'sinatra'
require 'json'

get '/fibonacci/:N' do

  #arreglo = ["i","asf",0,"x"]
  #arreglo_mayor = {"lista" => arreglo}
  #return arreglo_mayor.to_json()

  return "#{params[:N]}"
end
