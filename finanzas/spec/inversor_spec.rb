require 'rspec'
require_relative '../model/inversor'
require_relative '../model/compra_dolares'
require_relative '../model/plazo_fijo'

describe 'Inversor' do
    it "El inversor devuelve la ganancia de una inversion de compra de dolares" do

      inversor = Inversor.new()
      compra_dolares = CompraDolares.new(1000, 7.0, 10.0)
      inversor.invertir(compra_dolares)
      inversor.recaudar_ganancias()
      expect(inversor.ganancias).to eq 3000.0

    end

    it "El inversor devuelve la ganancia de una inversion de un plazo fijo" do

      inversor = Inversor.new()
      plazo_fijo = PlazoFijo.new(365, 10, 2000)
      inversor.invertir(plazo_fijo)
      inversor.recaudar_ganancias()
      expect(inversor.ganancias).to eq 200

    end

end
