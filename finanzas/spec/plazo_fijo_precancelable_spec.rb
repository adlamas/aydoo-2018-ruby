require 'rspec'
require_relative '../model/plazo_fijo_precancelable'

describe 'Plazo Fijo Precancelable' do

  it 'crear una inversion de tipo Plazo Fijo Precancelable y devolver su monto' do

    plazo_fijo_precancelable = PlazoFijoPrecancelable.new(90, 10.0, 100000.0)
    expect(plazo_fijo_precancelable.monto).to eq 100000.0
  end

  it 'crear una inversion de tipo Plazo Fijo Precancelable y devolver su interes' do

    plazo_fijo_precancelable = PlazoFijoPrecancelable.new(90, 10.0, 100000.0)
    expect(plazo_fijo_precancelable.interes).to eq 10.0
  end

  it 'crear una inversion de tipo Plazo Fijo Precancelable y devolver su plazo' do

    plazo_fijo_precancelable = PlazoFijoPrecancelable.new(90, 10.0, 100000.0)
    expect(plazo_fijo_precancelable.plazo).to eq 90
  end

end
