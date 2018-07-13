require 'rspec'
require_relative '../model/inversor'
require_relative '../model/compra_dolares'

describe 'Inversor' do
    it "El inversor toma la ganancia de una inversion de compra de dolares" do

      inversor = Inversor.new()
      compra_dolares = CompraDolares.new(1000, 7.0, 10.0)
      inversor.invertir(compra_dolares)
      expect(inversor.obtener_ganancias).to eq 3000.0

    end

end
