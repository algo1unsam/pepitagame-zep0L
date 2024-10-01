import niveles.*
import extras.*
import wollok.game.*

object pepita {

	var property energia = 100
	var property position = game.origin()

	method morida() = (self.position() == silvestre.position())// pepita morida si toca al gato
		
	method image() {
		return if (self.estaEnElNido()) {"pepita-grande.png" }
			else if (self.morida() or self.estaCansada()) {"pepita-gris.png"}//pepita color gris si esta morida, o si esta cansada
				else  "pepita.png"
	}

method come(comida) {
		if (self.position() == comida.position()) {
			energia = energia + comida.energiaQueOtorga()
			game.removeVisual(comida)
		}
	}

	method vola(kms) {energia = energia - kms * 9}

	method energiaPepita() { if (self.energia() > 40){
		game.removeVisual(energiaPepita2)
		game.addVisual(energiaPepita1)
		}else {
			game.removeVisual(energiaPepita1)
			game.addVisual(energiaPepita2)
			}
		
	}
	method laMoricion() {
		game.removeVisual(energiaPepita1)
		game.removeVisual(energiaPepita2)
		game.removeVisual(nido)
		game.removeVisual(silvestre)
		game.addVisual(loser)
		game.schedule(2000, { game.stop() })
	}
	method irA(nuevaPosicion) {
			if ((nuevaPosicion.x().between(0,game.width()-1)) && (nuevaPosicion.y().between(0,game.height()-1))){ // PARA QUE NO SE VAYA DE LA PANTALLA
				if (self.energia() > 0) {
					self.vola(position.distance(nuevaPosicion))
					position = nuevaPosicion
					self.energiaPepita()
				}else {self.laMoricion()}
			}
	}

	method estaCansada() {return energia <= 0}

	method estaEnElNido() {return position == nido.position()}

	method estaEnElSuelo() {return position.y() == 0}

	method gravedad(nuevaPosicion) {if(self.position().y() > 0){position = nuevaPosicion}}
}

