require_relative "model/manejador_de_aplicacion"
require_relative "model/impuesto"

begin
  impuesto = Impuesto.new()
  manejador_de_aplicacion = ManejadorDeAplicacion.new()
  inversor = manejador_de_aplicacion.devolver_inversor_con_inversiones_asignadas(ARGV)
  inversor.recaudar_ganancias_brutas()
  ganancias = inversor.ganancias_brutas
  impuesto_a_ganancias = impuesto.calcular_impuesto(inversor.tipo,inversor.ganancias_brutas)

  puts "ganancia: #{ganancias}, impuesto: #{impuesto_a_ganancias}"
rescue Exception
end
