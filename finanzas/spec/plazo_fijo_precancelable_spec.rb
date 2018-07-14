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

  it "la obtencion de ganancia de un plazo fijo Precancelable de 90, 10, 100000 debe ser de 2465.8" do

    plazo_fijo_precancelable = PlazoFijoPrecancelable.new(90, 10.0, 100000.0)
    expect(plazo_fijo_precancelable.obtener_ganancia_a_fin_de_plazo).to eq 2465.8
  end

  it "la obtencion de ganancia de un plazo fijo Precancelable cortando el plazo de 90, 10, 100000 debe ser de 1222.8" do

    plazo_fijo_precancelable = PlazoFijoPrecancelable.new(90, 10.0, 100000.0)
    expect(plazo_fijo_precancelable.obtener_ganancia_cortando_plazo).to eq 1232.9
  end

end
