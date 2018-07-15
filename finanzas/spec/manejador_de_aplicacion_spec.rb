require 'rspec'
require_relative '../model/manejador_de_aplicacion'
require_relative '../model/compra_dolares'
require_relative '../model/impuesto'
require_relative '../model/inversion'
require_relative '../model/inversor'
require_relative '../model/plazo_fijo_precancelable'
require_relative '../model/plazo_fijo'


describe 'Manejador De Aplicacion' do

  it 'Construimos un inversor desde el manejador e imprimimos su tipo' do
    manejador = ManejadorDeAplicacion.new()
    inversor_resultante = manejador.devolver_inversor_con_inversion_asignada("ind","dol,1000,15,20")
    inversor_resultante.recaudar_ganancias_brutas()
    expect(inversor_resultante.tipo).to eq "individuo"
    expect(inversor_resultante.ganancias_brutas).to eq 5000

  end

end
