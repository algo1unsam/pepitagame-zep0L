import pepita.*
import wollok.game.*
object nido {
	var property position = game.at(7, 8)
	method image() = "nido.png"

	method teEncontro(ave) {
		game.say(ave, "  ** WINNER!! **  ")
		game.schedule(2000, { game.stop() })
	}
}
object silvestre {
	method image() = "silvestre.png" 
	method position() = game.at(pepita.position().x().max(3),0) //sigue la posicion en X de pepita sii es >=3 
	
	method teEncontro(ave) {
		/*game.say(ave, "  PERDI!  ")
		game.schedule(2000, { game.stop() })}*/  
		ave.laMoricion()  
	}
}
