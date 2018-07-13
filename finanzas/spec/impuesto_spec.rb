require 'rspec'
require_relative '../model/inversor'
require_relative '../model/impuesto'
require_relative '../model/compra_dolares'
require_relative '../model/plazo_fijo'

describe "Impuesto" do

  it "el impuesto de individuo de una ganancia de 80000 debe ser de 5" do
    inversor = Inversor.new("ind")
    impuesto = Impuesto.new(inversor)

    expect(impuesto.impuesto_a_individuo(80000)).to eq 5
  end

  it "el impuesto de individuo de una ganancia de 50000 debe ser de 5" do
    inversor = Inversor.new("ind")
    impuesto = Impuesto.new(inversor)

    expect(impuesto.impuesto_a_individuo(50000)).to eq 5
  end

  it "el impuesto de individuo de una ganancia de 1050000 debe ser de 10" do
    inversor = Inversor.new("ind")
    impuesto = Impuesto.new(inversor)

    expect(impuesto.impuesto_a_individuo(1050000)).to eq 10
  end

  it "El impuesto para un individuo que tiene de ganancia entre 0 y 50.000 con su inversion de dolares debe ser del 0" do
    inversor = Inversor.new("ind")
    impuesto = Impuesto.new(inversor)
    compra_dolares = CompraDolares.new(1000, 7.0, 10.0)
    inversor.invertir(compra_dolares)
    inversor.recaudar_ganancias_brutas()
    expect(impuesto.calcular_tasa()).to eq 0
  end

  it "El impuesto para un individuo que tiene de ganancia entre 50.000 y 100.000 con su plazo fijo debe ser del 5" do
    inversor = Inversor.new("ind")
    impuesto = Impuesto.new(inversor)
    compra_dolares = PlazoFijo.new(365, 60, 100000)
    inversor.invertir(compra_dolares)
    inversor.recaudar_ganancias_brutas()
    expect(impuesto.calcular_tasa()).to eq 5
  end
end
