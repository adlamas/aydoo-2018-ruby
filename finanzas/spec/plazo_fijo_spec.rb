require 'rspec'
require_relative '../model/inversor'
require_relative '../model/plazo_fijo'

describe 'Plazo Fijo' do

  it 'crear una inversion de tipo Plazo Fijo y devolver su monto' do

    plazo_fijo = PlazoFijo.new(90, 10, 100000)
    expect(plazo_fijo.monto).to eq 100000
  end

end
