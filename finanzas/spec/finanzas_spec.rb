require 'rspec'
require_relative '../model/inversor'
require_relative '../model/compra_dolares'
require_relative '../model/plazo_fijo'
require_relative '../model/plazo_fijo_precancelable'
require_relative '../model/impuesto'

describe 'Inversor' do
    it "Devolver la ganancia neta y el porcentaje del impuesto de una compra de dolares a 1000, 7, 10 de una empresa" do
      inversor = Inversor.new("emp")
      compra_dolares = CompraDolares.new(1000, 7.0, 10.0)
      impuesto = Impuesto.new()
      compra_dolares.agregar_impuesto(impuesto)
      inversor.invertir(compra_dolares)
      inversor.recaudar_ganancias_brutas()
      expect(inversor.ganancias_brutas).to eq 3000
      expect(inversor.obtener_impuesto_a_ganancia_de_inversion()).to eq 0
    end

    it "Devolver la ganancia neta y el porcentaje del impuesto de un plazo fijo de plazo 200, monto 1000000, interes 10
     de una empresa" do

      inversor = Inversor.new("emp")
      plazo_fijo = PlazoFijo.new(200, 10, 1000000)
      impuesto = Impuesto.new()
      plazo_fijo.agregar_impuesto(impuesto)
      inversor.invertir(plazo_fijo)
      inversor.recaudar_ganancias_brutas()
      expect(inversor.ganancias_brutas).to eq 54795
      expect(inversor.obtener_impuesto_a_ganancia_de_inversion()).to eq 10
    end

    it "Devolver la ganancia neta y el porcentaje del impuesto de un plazo fijo de plazo 365, monto 100000, interes 10
     de una empresa" do

      inversor = Inversor.new("emp")
      plazo_fijo = PlazoFijo.new(365, 10, 100000)
      impuesto = Impuesto.new()
      plazo_fijo.agregar_impuesto(impuesto)
      inversor.invertir(plazo_fijo)
      inversor.recaudar_ganancias_brutas()
      expect(inversor.ganancias_brutas).to eq 10000
      expect(inversor.obtener_impuesto_a_ganancia_de_inversion()).to eq 0
    end

    it "El impuesto a un plazo fijo precancelable de empresa de monto 500000, plazo 200, plazo real 150 y interes de 20 es 5
    ya que su ganancias brutas son de 27397.25" do

      inversor = Inversor.new("emp")
      plazo_fijo_precancelable = PlazoFijoPrecancelable.new(200, 150, 20, 500000)
      impuesto = Impuesto.new()
      plazo_fijo_precancelable.agregar_impuesto(impuesto)
      inversor.invertir(plazo_fijo_precancelable)
      inversor.recaudar_ganancias_brutas()
      expect(inversor.ganancias_brutas).to eq 27397.25
      expect(inversor.obtener_impuesto_a_ganancia_de_inversion()).to eq 5

    end

    it "El impuesto a un plazo fijo de individuo de monto 5000000, plazo 200, plazo real 150 y interes de 20 es 8
    ya que su ganancias brutas son de 273972.5" do

      inversor = Inversor.new("ind")
      plazo_fijo_precancelable = PlazoFijoPrecancelable.new(200, 150, 20, 5000000)
      impuesto = Impuesto.new()
      plazo_fijo_precancelable.agregar_impuesto(impuesto)
      inversor.invertir(plazo_fijo_precancelable)
      inversor.recaudar_ganancias_brutas()
      expect(inversor.ganancias_brutas).to eq 273972.5
      expect(inversor.obtener_impuesto_a_ganancia_de_inversion()).to eq 8

    end

    it "El impuesto a una compra de dolares de individuo de monto 50000, cot inicial 10, cot final 23 cot es 8
    ya que su ganancias brutas son de 273972.5" do

      inversor = Inversor.new("ind")
      compra_dolares = CompraDolares.new(50000,10,23)
      impuesto = Impuesto.new()
      compra_dolares.agregar_impuesto(impuesto)
      inversor.invertir(compra_dolares)
      inversor.recaudar_ganancias_brutas()
      expect(inversor.ganancias_brutas).to eq 650000
      expect(inversor.obtener_impuesto_a_ganancia_de_inversion()).to eq 10

    end

    it "El impuesto a un plazo fijo precancelable de individuo de monto 400000, plazo 100, plazo real 100 y interes de 10 es 5
    ya que su ganancias brutas son de 27397.25" do

    inversor = Inversor.new("ind")
    plazo_fijo_precancelable = PlazoFijoPrecancelable.new(100, 100, 50, 400000)
    impuesto = Impuesto.new()
    plazo_fijo_precancelable.agregar_impuesto(impuesto)
    inversor.invertir(plazo_fijo_precancelable)
    inversor.recaudar_ganancias_brutas()
    expect(inversor.ganancias_brutas).to eq 54794.4
    expect(inversor.obtener_impuesto_a_ganancia_de_inversion()).to eq 5

    end

  end
