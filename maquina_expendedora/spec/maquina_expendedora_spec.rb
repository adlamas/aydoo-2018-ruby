require 'rspec'
require_relative '../model/MaquinaExpendedoraDeBebidas'
require_relative '../model/Vaso'

describe "Test" do

  let(:un_vaso) { Vaso.new }

  subject { MaquinaExpendedoraDeBebidas.new }

  it 'deberia hacer cafe con leche con 10 de azucar' do
    cantidad_azucar = 10

    subject.hacer_cafe_con_leche_con_n_de_azucar(un_vaso, cantidad_azucar)

    expect(un_vaso.cantidad_de_azucar).to eq cantidad_azucar
    expect(un_vaso.tiene_cafe?).to be_truthy
    expect(un_vaso.tiene_azucar?).to be_truthy
    expect(un_vaso.tiene_te?).to be_falsey
  end

end
