object huevoRepostero {
  method calorias() = 750
  method esDeChocolateBlanco() = true
  method esDeChocolateAmargo() = false
}

object huevoMixto {
  method calorias() = 900
  method esDeChocolateBlanco() = true
  method esDeChocolateAmargo() = false 
}

object conejo {
  var property peso = 100
  method calorias() = 10 * peso
  method esDeChocolateBlanco() = false
  method esDeChocolateAmargo() = true
}

object blisterHuevitos {
    var property cantidad = 1
    method calorias() = 100 * cantidad + cantidad.div(5)*150
  method esDeChocolateBlanco() = cantidad >= 5
  method esDeChocolateAmargo() = false
}

object matrioshka {
    var property decoracion = flor
    var property huevoEnInterior = huevoRepostero
    method calorias() = 3000 + decoracion.calorias() + huevoEnInterior.calorias()
    method esDeChocolateAmargo() = true
    method esDeChocolateBlanco() = huevoEnInterior.esDeChocolateBlanco()
}

object flor {
    var property petalos = 1
    method calorias() = petalos * 100
}

object arbol {
    method calorias() = 150
}

object juego {
    const huevosEscondidos = []
    method agregarHuevos(listaDeHuevos) {huevosEscondidos.addAll(listaDeHuevos)}
    method cuantosFaltanEncontrar() = huevosEscondidos.size()
    method cuantosConChocoBlanco() = huevosEscondidos.count({h=>h.esDeChocolateBlanco()})
    method cuantosConChocoBlancoSinCount() = self.losDeChocolateBlanco().size()
    method aunNoFueEncontrado(unHuevo) = huevosEscondidos.contains(unHuevo)
    method encontrarUnHuevoPor(unHuevo,unChico) {
        if(self.aunNoFueEncontrado(unHuevo)) {
            unChico.comer(unHuevo)
            huevosEscondidos.remove(unHuevo)
        }
    }
    method encontrarPrimerHuevoPor(unChico) {
        if(not huevosEscondidos.isEmpty()) {
            self.encontrarUnHuevoPor(huevosEscondidos.first(),unChico)
        }
    }
    method encontrarRestantesPor(unChico) {
        huevosEscondidos.forEach({h=>self.encontrarUnHuevoPor(h, unChico)})
    }
    
    method losDeChocolateBlanco() = huevosEscondidos.filter({h=>h.esDeChocolateBlanco()})
    method elDeMayorCalorias() = if(!huevosEscondidos.isEmpty()) huevosEscondidos.max({h=>h.calorias()})
}

object ana {
    const huevosEncontrados = []
    method comer(unHuevo) {
        huevosEncontrados.add(unHuevo)
    }
    method estaEnfermo() =
        self.caloriasConsumidas() > 5000 ||
        self.comioDeChocoBlanco()

    method caloriasConsumidas() = huevosEncontrados.sum({h=>h.calorias()})
    method comioDeChocoBlanco() = huevosEncontrados.any({h=>h.esDeChocolateBlanco()})
}

object jose {
    var ultimoHuevoComido = huevoRepostero
    method comer(unHuevo) {ultimoHuevoComido=unHuevo}
    method estaEnfermo() = ultimoHuevoComido.esDeChocolateAmargo()
}

object tito {
    method comer(unHuevo) {}
    method estaEnfermo() = false
}