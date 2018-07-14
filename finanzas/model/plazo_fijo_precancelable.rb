require_relative 'inversion'
require_relative '../excepciones/excepcion_diferencia_plazos_invalida'
require_relative '../excepciones/excepcion_interes_negativo'
require_relative '../excepciones/excepcion_plazo_invalido'

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
    porcentaje_del_interes_inicial = 1;
    if(@plazo_real < @plazo)
      porcentaje_del_interes_inicial = 2
    end

    return (((obtener_interes_por_dias_de_plazo_totales() / porcentaje_del_interes_inicial) * @monto)/100)
  end

end
