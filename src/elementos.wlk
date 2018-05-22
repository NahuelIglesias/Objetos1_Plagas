import plagas.*


class Elemento {
	method esBueno()
	method esAtacado(plagaX)
}

class Hogar inherits Elemento {
	var confort = 15
	var mugre = 5
	
	method mugre() = mugre
	
	override method esBueno() {
		return mugre <= (confort/2)
	}
	
	override method esAtacado(plagaX) {
		mugre += plagaX.nivelDanio()
	}
}

class Huerta inherits Elemento {
	var produccion = 9
	var valorX = 0 //desconocido, se sabe que es el mismo para todas las huertas
	
	method produccion() = produccion
	
	override method esBueno() {
		return produccion > valorX
	}
	
	override method esAtacado(plagaX) {
		produccion -= plagaX.nivelDanio() + if(plagaX.transmiteEnfermedades()) {10} else {0}
	}
}

class Mascota inherits Elemento {
	var salud = 100
	
	method salud() = salud
	
	override method esBueno() {
		return salud > 15
	}
	
	override method esAtacado(plagaX) {
		salud -= if(plagaX.transmiteEnfermedades()) {plagaX.nivelDanio()} else {0}
	}
}