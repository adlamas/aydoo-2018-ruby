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
      expect(inversor.obtener_impuesto_ganancia_de_inversion()).to eq 0
    end

    it "Devolver la ganancia neta y el porcentaje del impuesto de una compra de dolares a 1000, 7, 10 de una empresa" do
      inversor = Inversor.new("emp")
      compra_dolares = CompraDolares.new(1000, 7.0, 10.0)
      impuesto = Impuesto.new()
      compra_dolares.agregar_impuesto(impuesto)
      inversor.invertir(compra_dolares)
      inversor.recaudar_ganancias_brutas()
      expect(inversor.ganancias_brutas).to eq 3000
      expect(inversor.obtener_impuesto_ganancia_de_inversion()).to eq 0
    end

  end
