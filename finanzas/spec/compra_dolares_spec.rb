require 'rspec'
require_relative '../model/compra_dolares'

describe 'Plazo Fijo' do

  it 'crear una inversion de dolares y devolver su monto' do
    compra_dolares = CompraDolares.new(100000, 19.0, 27.0)
    expect(compra_dolares.monto).to eq 100000
  end

  it 'crear una inversion de dolares y devolver su cotizacion_inicial' do
    compra_dolares = CompraDolares.new(100000, 19.0, 27.0)
    expect(compra_dolares.cotizacion_inicial).to eq 19.0
  end

  it 'crear una inversion de dolares y devolver su cotizacion_final' do
    compra_dolares = CompraDolares.new(100000, 19.0, 27.0)
    expect(compra_dolares.cotizacion_final).to eq 27.0
  end

end
