
class ExcepcionTipoInversorInvalido < Exception

  def initialize(msg="El inversor solo puede ser una empresa o un individuo")
    puts msg
  end
end
