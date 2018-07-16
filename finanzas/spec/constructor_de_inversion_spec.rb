require 'rspec'
require_relative '../model/constructor_de_inversion'
require_relative '../model/compra_dolares'
require_relative '../model/plazo_fijo'
require_relative '../model/plazo_fijo_precancelable'

describe 'ConstructorDeInversion' do

  it 'crear una inversion de dolares mediante el constructor de inversion y devolver sus atributos' do
    constructor = ConstructorDeInversion.new()
    compra_dolares = constructor.construir_inversiones("dol,1000, 20.0, 28.0")
    expect(compra_dolares.monto).to eq 1000
    expect(compra_dolares.cotizacion_inicial).to eq 20
    expect(compra_dolares.cotizacion_final).to eq 28
    expect(compra_dolares.class).to eq CompraDolares
  end

  it 'crear un plazo fijo mediante el constructor de inversion y devolver sus atributos' do
    constructor = ConstructorDeInversion.new()
    compra_dolares = constructor.construir_inversiones("dol,1000, 20.0, 28.0")
    expect(compra_dolares.monto).to eq 1000
    expect(compra_dolares.cotizacion_inicial).to eq 20
    expect(compra_dolares.cotizacion_final).to eq 28
    expect(compra_dolares.class).to eq CompraDolares
  end

end
