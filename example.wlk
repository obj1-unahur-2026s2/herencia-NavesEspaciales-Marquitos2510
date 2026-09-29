class Nave{
      var velocidad
      var direccion

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
    const cantidadDePasajeros
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
    //return mensajes (?)
  }




}