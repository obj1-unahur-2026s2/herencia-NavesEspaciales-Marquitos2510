class Nave{
      var velocidad
      var direccion
      var combustible 

      method cargarCombustible(cantidad){
          combustible = combustible + cantidad
      }

      method descargarCombustible(cantidad){
          combustible = combustible - cantidad
      }

      method saberVelocidad(){
          return velocidad
      }

      method saberDireccion(){
          return direccion
      }

      method acelerar(valor){     
        velocidad = (velocidad + valor).max(100000)
      }

      method desacelerar(valor){
        velocidad = (velocidad - valor).max(0)
      }

      method irHaciaElSol(){
          direccion = 10
      }

      method escaparDelSol(){
          direccion = -10
      }

      method ponerseParaleloAlSol(){
          direccion = 0
      }

      method acercarseUnPocoAlSol(){
          direccion = (direccion + 1).max(10)
      }

      method alejarseUnPocoDelSol(){
          direccion = (direccion - 1).min(-10)
      }

      method prepararViaje(){
        self.cargarCombustible(30000)
        self.acelerar(5000)
       }


}


class NaveBaliza inherits Nave{
    var baliza

    method cambiarColorDeBaliza(colorNuevo){
      baliza = colorNuevo
    }

    override method prepararViaje(){
        self.cambiarColorDeBaliza("verde")
        self.ponerseParaleloAlSol()
    }



}

class NavePasajeros inherits Nave{
    const cantidadDePasajeros = 0
    var racionesDeBebida
    var racionesDeComida

    method cargarRacionesDeBebida(cantidad){
        racionesDeBebida += cantidad
    }

    method cargarRacionesDeComida(cantidad){
        racionesDeComida += cantidad
    }

   method descargarRacionesDeBebida(cantidad){
        racionesDeBebida -= cantidad
    }

    method descargarRacionesDeComida(cantidad){
        racionesDeComida -= cantidad
    }

    override method prepararViaje(){
        self.cargarRacionesDeBebida(6)
        self.cargarRacionesDeComida(4)
        self.acercarseUnPocoAlSol()
    }




}

class NavesDeCombate inherits Nave{

  var estadoV = true
  var estadoM = false
  var mensajes = []
  
 
  method ponerseVisible(){
    estadoV = not self.estaInvisible() 
  }

  method ponerseInvisible(){
    estadoV = self.estaInvisible()
  }

  method estaInvisible() {
    return true
  }

  method desplegarMisiles(){
    estadoM = self.misilesDesplegados()
  }

  method replegarMisiles(){
    estadoM = not self.misilesDesplegados()
  }

  method misilesDesplegados(){
    return true
  }

  method emitirMensaje(mensaje){

    mensajes.add(mensaje)
    return mensaje
  }


  method mensajesEmitidos(){
    return "mensajes enviados:" + {mensajes}
  }

  method primerMensajeEmitido(){
    return mensajes[0]
  }

  method ultimoMensajeEmitido(){
    return mensajes[-1]
  }

  method esEscueta(){
    if (mensajes.size() > 30){
      return "es escueta"
    }
    else{
      return "no es escueta"
    }

  }

  method emitioMensaje(mensaje){
    return mensajes.any(mensaje)
  }

  override method prepararViaje(){
    self.replegarMisiles()
    self.acelerar(15000 )
    self.emitirMensaje("Saliendo en misión")
  }

}

class NaveHospital inherits NavePasajeros{
  
  var tienePreparadoQuirofano = false

  method prepararQuirofano(){
    tienePreparadoQuirofano = true
  }

}

class NaveCombateSigilosa inherits NavesDeCombate{
  
  
}