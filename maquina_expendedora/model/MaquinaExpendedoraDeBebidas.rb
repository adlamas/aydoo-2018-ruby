
class MaquinaExpendedoraDeBebidas

  def hacer_cafe_con_leche_con_n_de_azucar(vaso, cantidad_de_azucar)
    vaso.agregar_azucar(cantidad_de_azucar)
    vaso.agregar_cafe()
  end

  def hacer_te_con_leche_con_n_de_azucar(vaso, cantidad_azucar)

  end

  def hacer_cafe_con_n_de_azucar(vaso, cantidad_azucar)
    vaso.agregar_azucar(cantidad_azucar)
    vaso.agregar_cafe()

  end

end
