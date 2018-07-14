require 'rspec'
require_relative '../model/inversor'
require_relative '../model/impuesto'
require_relative '../model/compra_dolares'
require_relative '../model/plazo_fijo'
require_relative '../model/plazo_fijo_precancelable'

describe "Impuesto" do

  it "el impuesto de individuo de una ganancia de 80000 debe ser de 5" do
    impuesto = Impuesto.new()

    expect(impuesto.impuesto_a_individuo(80000)).to eq 5
  end

  it "el impuesto de individuo de una ganancia de 50000 debe ser de 5" do
    impuesto = Impuesto.new()

    expect(impuesto.impuesto_a_individuo(50000)).to eq 5
  end

  it "el impuesto de individuo de una ganancia de 1050000 debe ser de 10" do
    impuesto = Impuesto.new()

    expect(impuesto.impuesto_a_individuo(1050000)).to eq 10
  end

  it "El impuesto de una empresa que obtiene una ganancia de 50000 tiene que ser de 10" do
    impuesto = Impuesto.new()

    expect(impuesto.impuesto_a_empresa(50000)).to eq 10
  end

  it "El impuesto de una empresa que obtiene una ganancia de 499999.9999 tiene que ser de 15" do
    impuesto = Impuesto.new()

    expect(impuesto.impuesto_a_empresa(499999.9999)).to eq 15
  end

  it "El impuesto de una empresa que obtiene una ganancia de 100000 tiene que ser de 15" do
    impuesto = Impuesto.new()

    expect(impuesto.impuesto_a_empresa(100000)).to eq 15
  end

  it "El impuesto de una empresa que obtiene una ganancia de 99999.9999 tiene que ser de 10" do
    impuesto = Impuesto.new()

    expect(impuesto.impuesto_a_empresa(99999.9999)).to eq 10
  end

  it "El impuesto de una empresa que obtiene una ganancia de 10000000 tiene que ser de 20" do
    impuesto = Impuesto.new()

    expect(impuesto.impuesto_a_empresa(10000000)).to eq 20
  end

  it "El impuesto de una empresa que obtiene una ganancia de 500000 o más tiene que ser de 20" do
    impuesto = Impuesto.new()

    expect(impuesto.impuesto_a_empresa(500000)).to eq 20
  end

  it "El impuesto de un inviduo que obtiene una ganancia de 500000 o más tiene que ser de 10" do
    impuesto = Impuesto.new()

    expect(impuesto.impuesto_a_individuo(500000)).to eq 10
  end

  it "El impuesto de un inviduo que obtiene una ganancia de mas de 500000 o más tiene que ser de 10" do
    impuesto = Impuesto.new()

    expect(impuesto.impuesto_a_individuo(600000)).to eq 10
  end

end
