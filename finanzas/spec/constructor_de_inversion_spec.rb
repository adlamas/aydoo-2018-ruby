require 'rspec'
require_relative '../model/constructor_de_inversion'
require_relative '../model/compra_dolares'
require_relative '../model/plazo_fijo'
require_relative '../model/plazo_fijo_precancelable'

describe 'ConstructorDeInversion' do

  it 'Se crea una inversion de compra de dolares mediante el constructor de inversion y deberia devolver sus atributos' do
    constructor = ConstructorDeInversion.new()
    compra_dolares = constructor.construir_inversion("dol,1000,20.0,28.0")
    expect(compra_dolares.monto).to eq 1000
    expect(compra_dolares.cotizacion_inicial).to eq 20
    expect(compra_dolares.cotizacion_final).to eq 28
    expect(compra_dolares.class).to eq CompraDolares
  end

  it 'Se crea una inversion de plazo fijo mediante el constructor de inversion y deberia devolver sus atributos' do
    constructor = ConstructorDeInversion.new()
    plazo_fijo = constructor.construir_inversion("pft,90, 10.00, 100000.00")
    expect(plazo_fijo.monto).to eq 100000
    expect(plazo_fijo.interes).to eq 10
    expect(plazo_fijo.plazo).to eq 90
    expect(plazo_fijo.class).to eq PlazoFijo
  end

  it 'Se crea una inversion de plazo fijo precancelable mediante el constructor de inversion y deberia devolver sus atributos' do
    constructor = ConstructorDeInversion.new()
    plazo_fijo_precancelable = constructor.construir_inversion("pfp,365,300,40,100000")
    expect(plazo_fijo_precancelable.monto).to eq 100000
    expect(plazo_fijo_precancelable.interes).to eq 40
    expect(plazo_fijo_precancelable.plazo).to eq 365
    expect(plazo_fijo_precancelable.plazo_real).to eq 300
    expect(plazo_fijo_precancelable.class).to eq PlazoFijoPrecancelable
  end

end
