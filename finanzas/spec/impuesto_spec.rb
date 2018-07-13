require 'rspec'
require_relative '../model/inversor'
require_relative '../model/impuesto'

describe "Impuesto" do

=begin
  it "El impuesto para una empresa que gana entre 20.000 y 50.000 con su inversion debe ser del 5" do
    inversor = Inversor.new("ind")
    impuesto = Impuesto.new()
    compra_dolares = CompraDolares.new(1000, 7.0, 10.0)
    inversor.invertir(compra_dolares)
    inversor.recaudar_ganancias_brutas()
    impuesto.calcular_tasa(inversor)
    expect(impuesto.tasa).to eq 5
  end
=end

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

  it "el impuesto de individuo de una ganancia de 1050000 debe ser de 8" do
    inversor = Inversor.new("ind")
    impuesto = Impuesto.new(inversor)

    expect(impuesto.impuesto_a_individuo(1050000)).to eq 10
  end
end
