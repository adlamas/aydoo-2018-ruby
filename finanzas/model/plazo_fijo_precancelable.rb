require_relative 'inversion'

class PlazoFijoPrecancelable < Inversion

  attr_accessor :plazo, :interes

  def initialize(plazo,interes,monto)
    super(monto)
    @plazo = plazo
    @interes = interes.round(4)
  end

end
