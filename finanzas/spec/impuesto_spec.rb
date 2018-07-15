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

  it "El impuesto para un individuo que tiene de ganancia entre 0 y 50.000 con su inversion de dolares debe ser del 0" do
    inversor = Inversor.new("ind")
    impuesto = Impuesto.new()
    compra_dolares = CompraDolares.new(1000, 7.0, 10.0)
    inversor.invertir(compra_dolares)
    inversor.recaudar_ganancias_brutas()

    expect(impuesto.calcular_tasa(inversor,inversor.ganancias_brutas)).to eq 0
  end

  it "El impuesto para un individuo que tiene de ganancia entre 50.000 y 100.000 con su plazo fijo debe ser del 5" do
    inversor = Inversor.new("ind")
    impuesto = Impuesto.new()
    plazo_fijo = PlazoFijo.new(365, 60, 100000)
    inversor.invertir(plazo_fijo)
    inversor.recaudar_ganancias_brutas()
    expect(impuesto.calcular_tasa(inversor,inversor.ganancias_brutas)).to eq 5
  end

  it "El impuesto para una empresa que obtene de ganancia entre 100.000 y 500.000 con su plazo fijo es del 15" do

    inversor = Inversor.new("emp")
    plazo_fijo = PlazoFijo.new(365, 20, 1000000)
    inversor.invertir(plazo_fijo)
    inversor.recaudar_ganancias_brutas()
    impuesto = Impuesto.new()
    expect(impuesto.calcular_tasa(inversor,inversor.ganancias_brutas)).to eq 15
  end

  it "El impuesto para una empresa que obtene de ganancia entre 50.000 y 100.000 con su plazo fijo es del 10" do

    inversor = Inversor.new("emp")
    plazo_fijo = PlazoFijo.new(365, 20, 300000)
    inversor.invertir(plazo_fijo)
    inversor.recaudar_ganancias_brutas()
    impuesto = Impuesto.new()
    expect(impuesto.calcular_tasa(inversor,inversor.ganancias_brutas)).to eq 10
  end

  it "El impuesto para una empresa que invierte en un plazo fijo precancelable 999999.9999999999 y
  lo retira anticipadamente es de 15 y sus ganancias de 100000 " do
    inversor = Inversor.new("emp")
    plazo_fijo_precancelable = PlazoFijoPrecancelable.new(730,500, 10.0, 999999.9999999999)
    inversor.invertir(plazo_fijo_precancelable)
    inversor.recaudar_ganancias_brutas()
    impuesto = Impuesto.new()
    expect(inversor.ganancias_brutas).to eq 100000.0
    expect(impuesto.calcular_tasa(inversor,inversor.ganancias_brutas)).to eq 15
  end

end
