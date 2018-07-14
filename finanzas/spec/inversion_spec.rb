require 'rspec'
require_relative '../model/inversor'
require_relative '../model/inversion'

describe 'Plazo Fijo' do

  it 'crear una inversion devolver su monto' do
    inversion = Inversion.new(100000)
    expect(inversion.monto).to eq 100000
  end

  it "crear una inversion de saldo negativo produce una excepcion 'monto_invalido'" do

    expect{Inversion.new(-20)}.to raise_exception(ExcepcionMontoInvalido)
  end


end
