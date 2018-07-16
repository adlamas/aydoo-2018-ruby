
class ExcepcionInversionNoExistente < Exception

  def initialize(msg="La inversion que quieres crear, no existe")
    puts msg
  end
end
