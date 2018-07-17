require 'rspec'
require_relative '../model/plazo_fijo_precancelable'
require_relative '../excepciones/excepcion_diferencia_plazos_invalida'
require_relative '../excepciones/excepcion_interes_negativo'
require_relative '../excepciones/excepcion_plazo_invalido'

describe 'Plazo Fijo Precancelable' do

  it 'crear una inversion de tipo Plazo Fijo Precancelable y devolver su monto' do

    plazo_fijo_precancelable = PlazoFijoPrecancelable.new(90,90, 10.0, 100000.0)
    expect(plazo_fijo_precancelable.monto).to eq 100000.0
  end

  it 'crear una inversion de tipo Plazo Fijo Precancelable y devolver su interes' do

    plazo_fijo_precancelable = PlazoFijoPrecancelable.new(90,90, 10.0, 100000.0)
    expect(plazo_fijo_precancelable.interes).to eq 10.0
  end

  it 'crear una inversion de tipo Plazo Fijo Precancelable y devolver su plazo' do

    plazo_fijo_precancelable = PlazoFijoPrecancelable.new(90,90, 10.0, 100000.0)
    expect(plazo_fijo_precancelable.plazo).to eq 90
  end

  it "la obtencion de ganancia de un plazo fijo Precancelable de 90, 10, 100000 debe ser de 2465.8" do

    plazo_fijo_precancelable = PlazoFijoPrecancelable.new(90,90, 10.0, 100000.0)
    expect(plazo_fijo_precancelable.obtener_ganancia()).to eq 2465.8
  end

  it "la obtencion de ganancia de un plazo fijo Precancelable cortando el plazo de 90, 10, 100000 debe ser de 1222.9" do

    plazo_fijo_precancelable = PlazoFijoPrecancelable.new(90,45, 10.0, 100000.0)
    expect(plazo_fijo_precancelable.obtener_ganancia()).to eq 1232.9
  end

  it "Si se intenta crear un plazo fijo precancelable con un plazo_real mayor al plazo,
   se levanta una excepcion de tipo ExcepcionDiferenciaDePlazosInvalida " do
    expect{PlazoFijoPrecancelable.new(90,100,10,50000)}.to raise_exception(ExcepcionDiferenciaDePlazosInvalida)
  end

  it "Si se intenta crear un plazo fijo precancelable con un interes negativo, se levanta una excepcion
  ExcepcionInteresNegativo " do
    expect{PlazoFijoPrecancelable.new(90,10,-10,50000)}.to raise_exception(ExcepcionInteresNegativo)
  end

  it "Si se intenta crear un plazo fijo precancelable con plazo o plazo_final menor a 0,
  se levanta una excepcion ExcepcionPlazoInvalido " do
    expect{PlazoFijoPrecancelable.new(-5,-10,10,50000)}.to raise_exception(ExcepcionPlazoInvalido)
    expect{PlazoFijoPrecancelable.new(-10,-12,10,50000)}.to raise_exception(ExcepcionPlazoInvalido)
  end

end
