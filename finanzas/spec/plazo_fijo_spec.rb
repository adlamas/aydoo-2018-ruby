require 'rspec'
require_relative '../model/inversor'
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

end
