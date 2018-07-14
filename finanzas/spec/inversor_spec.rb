require 'rspec'
require_relative '../model/inversor'
require_relative '../model/compra_dolares'
require_relative '../model/plazo_fijo'
require_relative '../model/plazo_fijo_precancelable'

describe 'Inversor' do
    it "El inversor devuelve la ganancia bruta de una inversion de compra de dolares" do

      inversor = Inversor.new("emp")
      compra_dolares = CompraDolares.new(1000, 7.0, 10.0)
      inversor.invertir(compra_dolares)
      inversor.recaudar_ganancias_brutas()
      expect(inversor.ganancias_brutas).to eq 3000.0

    end

    it "El inversor devuelve la ganancia bruta de una inversion de un plazo fijo" do

      inversor = Inversor.new("ind")
      plazo_fijo = PlazoFijo.new(365, 10, 2000)
      inversor.invertir(plazo_fijo)
      inversor.recaudar_ganancias_brutas()
      expect(inversor.ganancias_brutas).to eq 200

    end

    it "Crear inversor y devolver su tipo" do

      inversor = Inversor.new("ind")
      inversor_2 = Inversor.new("emp")

      expect(inversor.tipo).to eq "individuo"
      expect(inversor_2.tipo).to eq "empresa"
    end

    it "Una empresa invierte en plazo fijo precancelable y lo
    retira antes de la fecha inicial, llevándose sólo el 50% de los intereses prefijados, 496.26" do

      inversor = Inversor.new("emp")
      plazo_fijo_precancelable = PlazoFijoPrecancelable.new(121,50,30, 10000)
      inversor.invertir(plazo_fijo_precancelable)
      expect(inversor.recaudar_ganancias_brutas()).to eq 497.26
    end

end
