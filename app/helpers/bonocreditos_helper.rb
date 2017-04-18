module BonocreditosHelper
  def clase_bonocredito(valor)
    if valor>5
      return "green"
    else
      return "red"
    end
  end

  def clase_bonocredito_alumno(alumno)
    if alumno[:bonos_cyc]>5 && alumno[:bonos_rs]>5 && alumno[:bonos_sdi]>5
      return "green"
    else
      return ""
    end
  end
end
