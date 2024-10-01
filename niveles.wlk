import pepita.*
import comidas.*
import extras.*
import wollok.game.*

object loser {
    method position() = game.center()
    method text() = "------------- GAME OVER - PEPITA MURIO -------------"
    method textColor() = "FF0000FF"
}

object energiaPepita1{
	const property position = game.at(4.5, 9)
	method text() = "Energia Pepita: " + pepita.energia()
	method textColor() = "00FF00FF" 
}
object energiaPepita2{
	const property position = game.at(4.5, 9)
	method text() = "Energia Pepita: " + pepita.energia()
	method textColor() = "FF0000FF" 
}
object tutorial1 {

	method iniciar() {
		game.addVisual(nido)
		game.addVisual(silvestre)
		game.addVisualCharacter(pepita)
	}

}

object tutorial2 {

	method iniciar() {
		game.addVisual(manzana)
		game.addVisual(alpiste)
		game.addVisual(nido)
		game.addVisual(silvestre)
		game.addVisual(pepita)
		config.configurarTeclas()
	}

}

object tutorial3 {

	method iniciar() {
		game.addVisual(manzana)
		game.addVisual(alpiste)
		game.addVisual(nido)
		game.addVisual(silvestre)
		game.addVisual(pepita)
		config.configurarTeclas()
		config.configurarColisiones()
		config.configurarGravedad()
	}

}

object config {

	method configurarTeclas() {
		keyboard.left().onPressDo({ pepita.irA(pepita.position().left(1)) })
		keyboard.right().onPressDo({ pepita.irA(pepita.position().right(1))})
		keyboard.down().onPressDo({ pepita.irA(pepita.position().down(1)) })
		keyboard.up().onPressDo({ pepita.irA(pepita.position().up(1))})
		keyboard.c().onPressDo({ pepita.come(game.uniqueCollider(pepita)) })
	}
	
	method configurarColisiones() {
		game.onCollideDo(pepita, { algo => algo.teEncontro(pepita) })
	}
	method configurarGravedad() {
		game.onTick(1500, "gravedad", { pepita.gravedad(pepita.position().down(0.5))}) // le modifique lo que pedia a 1500 milisegundos - 0.5 BAJA
	}
}