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
    arreglo_de_entrada = ["ind", "dol,1000,15,20"]
    inversor_resultante = manejador.devolver_inversor_con_inversiones_asignadas(arreglo_de_entrada)
    impuesto = Impuesto.new()
    inversor_resultante.recaudar_ganancias_brutas()
    expect(inversor_resultante.ganancias_brutas).to eq 333.33333333333337
    expect(impuesto.calcular_impuesto(inversor_resultante.tipo, inversor_resultante.ganancias_brutas)).to eq 0

  end

  it 'Ejemplo completo 3' do
    manejador = ManejadorDeAplicacion.new()
    arreglo_de_entrada = ["ind","pft,365,10,500000","pfp,365,300,40,100000","dol,100000,18,27"]
    inversor_resultante = manejador.devolver_inversor_con_inversiones_asignadas(arreglo_de_entrada)
    inversor_resultante.recaudar_ganancias_brutas()
    expect(inversor_resultante.ganancias_brutas).to eq 120000
    impuesto = Impuesto.new()
    expect(impuesto.calcular_impuesto(inversor_resultante.tipo, inversor_resultante.ganancias_brutas)).to eq 9600

  end

  it 'Ejemplo completo 1' do
    manejador = ManejadorDeAplicacion.new()
    arreglo_de_entrada = ["ind","dol,1000,20,28"]
    inversor_resultante = manejador.devolver_inversor_con_inversiones_asignadas(arreglo_de_entrada)

    inversor_resultante.recaudar_ganancias_brutas()
    expect(inversor_resultante.tipo).to eq "individuo"
    expect(inversor_resultante.ganancias_brutas).to eq 400
    impuesto = Impuesto.new()
    expect(impuesto.calcular_impuesto(inversor_resultante.tipo, inversor_resultante.ganancias_brutas)).to eq 0

  end

  it 'Ejemplo completo 2' do
    manejador = ManejadorDeAplicacion.new()
    arreglo_de_entrada = ["emp","dol,20000,20,28","pft,90,40,250000"]
    inversor_resultante = manejador.devolver_inversor_con_inversiones_asignadas(arreglo_de_entrada)

    inversor_resultante.recaudar_ganancias_brutas()
    expect(inversor_resultante.tipo).to eq "empresa"
    expect(inversor_resultante.ganancias_brutas).to eq 32657.5
    impuesto = Impuesto.new()
    expect(impuesto.calcular_impuesto(inversor_resultante.tipo, inversor_resultante.ganancias_brutas)).to eq 1632.875

  end

end
