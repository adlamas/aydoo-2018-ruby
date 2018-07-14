require_relative 'inversion'

class PlazoFijoPrecancelable < Inversion

  attr_accessor :plazo,:plazo_real, :interes

  def initialize(plazo, plazo_real,interes,monto)
    super(monto)
    @plazo = plazo
    @plazo_real = plazo_real
    @interes = interes.round(4)
  end

  def obtener_interes_por_dias_de_plazo_totales()
    porcentaje_de_anio = (365.0/@plazo)
    porcentaje_de_interes_por_dias = 100.0/porcentaje_de_anio
    interes_final_a_cobrar = ((porcentaje_de_interes_por_dias*@interes)/100.0 ).round(4)

    return interes_final_a_cobrar
  end

  def obtener_ganancia()
    tipo_interes = 1;
    if(@plazo_real < @plazo)
      tipo_interes = 2
    end

    return (((obtener_interes_por_dias_de_plazo_totales() / tipo_interes) * @monto)/100)
  end

end
