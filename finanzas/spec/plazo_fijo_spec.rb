require 'rspec'
require_relative '../model/plazo_fijo'

describe 'Plazo Fijo' do

  it 'crear una inversion de tipo Plazo Fijo y devolver su monto' do

    plazo_fijo = PlazoFijo.new(90, 10.0, 100000.0)
    expect(plazo_fijo.monto).to eq 100000.0
  end

  it 'crear una inversion de tipo Plazo Fijo y devolver su interes' do

    plazo_fijo = PlazoFijo.new(90, 10.0, 100000.0)
    expect(plazo_fijo.interes).to eq 10.0
  end

  it 'crear una inversion de tipo Plazo Fijo y devolver su plazo' do

    plazo_fijo = PlazoFijo.new(90, 10.0, 100000.0)
    expect(plazo_fijo.plazo).to eq 90
  end

  it "devolver interes total por los dias de plazo" do
    plazo_fijo = PlazoFijo.new(90, 10.00, 100000.00)
    expect(plazo_fijo.obtener_interes_por_dias_de_plazo).to eq 2.4658
  end

  it "devolver ganancia de plazo fijo" do
    plazo_fijo = PlazoFijo.new(90, 10.00, 100000.00)
    expect(plazo_fijo.obtener_ganancia).to eq 2465.8
  end

  it "Si se intenta crear un plazo fijo con un interes negativo, se levanta una excepcion
  ExcepcionInteresNegativo " do
    expect{PlazoFijo.new(90,-10,50000)}.to raise_exception(ExcepcionInteresNegativo)
  end

  it "Si se intenta crear un plazo fijo con plazo o plazo_final menor a 0,
  se levanta una excepcion ExcepcionPlazoInvalido " do
    expect{PlazoFijo.new(-5,10,50000)}.to raise_exception(ExcepcionPlazoInvalido)
  end

end
