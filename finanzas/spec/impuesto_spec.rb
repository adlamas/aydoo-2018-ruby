require 'rspec'
require_relative '../model/inversor'
require_relative '../model/impuesto'
require_relative '../model/compra_dolares'

describe "Impuesto" do


  it "El impuesto para un individuo que tiene de ganancia entre 0 y 50.000 con su inversion debe ser del 0" do
    inversor = Inversor.new("ind")
    impuesto = Impuesto.new(inversor)
    compra_dolares = CompraDolares.new(1000, 7.0, 10.0)
    inversor.invertir(compra_dolares)
    inversor.recaudar_ganancias_brutas()
    expect(impuesto.calcular_tasa()).to eq 0
  end


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
end
