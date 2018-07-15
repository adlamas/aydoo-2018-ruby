require 'rspec'
require_relative '../model/inversor'
require_relative '../model/compra_dolares'
require_relative '../model/plazo_fijo'
require_relative '../model/plazo_fijo_precancelable'
require_relative '../excepciones/excepcion_tipo_inversor_invalido'

describe 'Inversor' do
    it "El inversor devuelve la ganancia bruta de una inversion de compra de dolares" do

      inversor = Inversor.new("emp")
      compra_dolares = CompraDolares.new(1000, 7.0, 10.0)
      inversor.invertir(compra_dolares)
      inversor.recaudar_ganancias_brutas()
      expect(inversor.ganancias_brutas).to eq 428.57142857142867

    end

    it "La ganancia bruta de un inversor de una inversion de 2000 en un plazo fijo de
     365 dias con 10 de intereses es 200" do

      inversor = Inversor.new("ind")
      plazo_fijo = PlazoFijo.new(365, 10, 2000)
      inversor.invertir(plazo_fijo)
      inversor.recaudar_ganancias_brutas()
      expect(inversor.ganancias_brutas).to eq 200

    end

    it "La ganancia bruta de un inversor de un plazo fijo precancelable de 10000 de monto a 365 dias 10 de
    intereses retirados antes es de 500 " do

    inversor = Inversor.new("ind")
    plazo_fijo = PlazoFijoPrecancelable.new(365,200, 10, 10000)
    inversor.invertir(plazo_fijo)
    inversor.recaudar_ganancias_brutas()
    expect(inversor.ganancias_brutas).to eq 500

    end

    it "La ganancia bruta de un inversor de un plazo fijo precancelable de 10000 de monto a 365 dias
    y 10 de intereses retirados a tiempo es de 1000" do

      inversor = Inversor.new("ind")
      plazo_fijo = PlazoFijoPrecancelable.new(365,365, 10, 10000)
      inversor.invertir(plazo_fijo)
      inversor.recaudar_ganancias_brutas()
      expect(inversor.ganancias_brutas).to eq 1000

    end

    it "Crear inversor y devolver su tipo" do

      inversor = Inversor.new("ind")
      inversor_2 = Inversor.new("emp")

      expect(inversor.tipo).to eq "individuo"
      expect(inversor_2.tipo).to eq "empresa"
    end

    it "Una empresa invierte en plazo fijo precancelable y lo retira antes de la fecha inicial,
    llevándose sólo el 50% de los intereses prefijados, con lo que serían 497.26 de ganancias brutas" do

      inversor = Inversor.new("emp")
      plazo_fijo_precancelable = PlazoFijoPrecancelable.new(121,50,30, 10000)
      inversor.invertir(plazo_fijo_precancelable)
      expect(inversor.recaudar_ganancias_brutas()).to eq 497.26
    end

    it "Si intentamos crear un inversor que no sea de tipo 'ind' o 'emp', se levanta una excepcion" do
      expect{Inversor.new("sarasa")}.to raise_exception(ExcepcionTipoInversorInvalido)
    end

    it "Las ganancias de la entrada 'ind pft,365,10,500000 pfp,365,300,40,100000 dol,100000,18,27' son 120000" do
      inversor = Inversor.new("ind")
      plazo_fijo_precancelable = PlazoFijoPrecancelable.new(365,300,40,100000)
      compra_dolares = CompraDolares.new(100000,18,27)
      plazo_fijo = PlazoFijo.new(365,10,500000)
      inversor.invertir(plazo_fijo_precancelable)
      inversor.invertir(plazo_fijo)
      inversor.invertir(compra_dolares)
      inversor.recaudar_ganancias_brutas()
      expect(inversor.ganancias_brutas).to eq 120000

    end

    it "El impuesto a las ganancias de la entrada 'ind pft,365,10,500000 pfp,365,300,40,100000 dol,100000,18,27' es de 8" do
      inversor = Inversor.new("ind")
      plazo_fijo_precancelable = PlazoFijoPrecancelable.new(365,300,40,100000)
      compra_dolares = CompraDolares.new(100000,18,27)
      plazo_fijo = PlazoFijo.new(365,10,500000)
      impuesto = Impuesto.new()
      inversor.invertir(plazo_fijo_precancelable)
      inversor.invertir(plazo_fijo)
      inversor.invertir(compra_dolares)
      inversor.recaudar_ganancias_brutas()
      tasa = impuesto.calcular_tasa(inversor,inversor.ganancias_brutas)
      expect(tasa).to eq 8

    end

    it "Las ganancias de la entrada 'emp dol,20000,20,28 pft,90,40,250000' son de 32657,5" do
      inversor = Inversor.new("emp")
      compra_dolares = CompraDolares.new(20000,20,28)
      plazo_fijo = PlazoFijo.new(90,40,250000)
      inversor.invertir(plazo_fijo)
      inversor.invertir(compra_dolares)
      inversor.recaudar_ganancias_brutas()
      expect(inversor.ganancias_brutas).to eq 32657.5
    end

    it "El impuesto a las ganancias de la entrada 'emp dol,20000,20,28 pft,90,40,250000' es de 1632,9" do
      inversor = Inversor.new("emp")
      compra_dolares = CompraDolares.new(20000,20,28)
      plazo_fijo = PlazoFijo.new(90,40,250000)
      impuesto = Impuesto.new()
      inversor.invertir(plazo_fijo)
      inversor.invertir(compra_dolares)
      inversor.recaudar_ganancias_brutas()
      impuesto = impuesto.calcular_tasa(inversor,inversor.ganancias_brutas)
      expect(impuesto).to eq 1632.875
    end

end
