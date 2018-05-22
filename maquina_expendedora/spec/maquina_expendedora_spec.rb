require 'rspec'
require_relative '../model/MaquinaExpendedoraDeBebidas'
require_relative '../model/Vaso'

describe "Test" do

  let(:un_vaso) { Vaso.new }
  subject { MaquinaExpendedoraDeBebidas.new }

  it "poner 2 de azucar al vaso" do
    cantidad_azucar = 2
    un_vaso.agregar_azucar(cantidad_azucar)
    expect(un_vaso.cantidad_de_azucar).to eq 2

  end

  it "poner cafe con dos de azucar" do
    cantidad_azucar = 2
    subject.hacer_cafe_con_n_de_azucar(un_vaso, cantidad_azucar)
    expect(un_vaso.cantidad_de_azucar).to eq 2
    expect(un_vaso.tiene_cafe?).to be_truthy

  end

  it "poner azucar y no cafe" do
    cantidad_azucar = 2
    un_vaso.agregar_azucar(cantidad_azucar)
    expect(un_vaso.tiene_cafe?).to be_falsey
  end

  it "poner te" do
    un_vaso.agregar_te()
    expect(un_vaso.tiene_te?).to be_truthy
  end

  it "poner te y tres de azucar" do
    un_vaso.agregar_te()
    un_vaso.agregar_azucar(3)

    expect(un_vaso.tiene_te?).to be_truthy
    expect(un_vaso.cantidad_de_azucar).to eq 3
  end

  it "poner leche" do
    un_vaso.agregar_leche()
    expect(un_vaso.tiene_leche?).to be_truthy
  end

=begin
  it 'deberia hacer cafe con leche con 10 de azucar' do
    cantidad_azucar = 10

    subject.hacer_cafe_con_leche_con_n_de_azucar(un_vaso, cantidad_azucar)

    expect(un_vaso.cantidad_de_azucar).to eq cantidad_azucar
    expect(un_vaso.tiene_cafe?).to be_truthy
    expect(un_vaso.tiene_azucar?).to be_truthy
    expect(un_vaso.tiene_te?).to be_falsey
  end


  it 'deberia hacer te con leche con 0 de azucar' do
    cantidad_azucar = 0

    subject.hacer_te_con_leche_con_n_de_azucar(un_vaso, cantidad_azucar)

    expect(un_vaso.cantidad_de_azucar).to eq cantidad_azucar
    expect(un_vaso.tiene_cafe?).to be_falsey
    expect(un_vaso.tiene_azucar?).to be_falsey
    expect(un_vaso.tiene_te?).to be_truthy
  end
=end



end
