require 'rspec'
require_relative '../model/compra_dolares'

describe 'Plazo Fijo' do

  it 'crear una inversion de dolares y devolver su monto' do
    compra_dolares = CompraDolares.new(1000, 20.0, 28.0)
    expect(compra_dolares.monto).to eq 1000
  end

  it 'crear una inversion de dolares y devolver su cotizacion_inicial' do
    compra_dolares = CompraDolares.new(100000, 19.0, 27.0)
    expect(compra_dolares.cotizacion_inicial).to eq 19.0
  end

  it 'crear una inversion de dolares y devolver su cotizacion_final' do
    compra_dolares = CompraDolares.new(100000, 19.0, 27.0)
    expect(compra_dolares.cotizacion_final).to eq 27.0
  end

  it 'La ganancia de una inversion de compra de dolares con monto 1000, cot _i 20 y cot_f 28 debería ser de 400' do
    compra_dolares = CompraDolares.new(1000, 20.0, 28.0)
    expect(compra_dolares.obtener_ganancia).to eq 400
  end

end
