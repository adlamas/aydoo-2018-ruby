require 'sinatra'
require 'json'
require 'sinatra/json'

class EncargadoDeRespuesta
  def self.responder(numero, estructura)
    if(estructura.is_a? Array)
      datos = Hash.new();
      respuesta = Hash.new();
      datos["limite"] = numero;
      datos["lista"] = estructura;
      respuesta["fibonacci"] = datos;
      return respuesta;
    else
      datos = Hash.new();
      respuesta = Hash.new();
      datos["limite"] = numero;
      datos["sumatoria"] = estructura;
      respuesta["fibonacci"] = datos;
      return respuesta;
    end

  end

end
