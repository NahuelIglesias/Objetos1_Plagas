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
	
	method produccion() = produccion
	
	override method esBueno() {
		return produccion > parametrosHuerta.valorStandart()
	}
	
	override method esAtacado(plagaX) {
		produccion -= plagaX.nivelDanio() + if(plagaX.transmiteEnfermedades()) {10} else {0}
	}
}

object parametrosHuerta { //auxiliar para huerta, determina valor universal
	var valorStandart = 0
	
	method valorStandart() = valorStandart
	
	method cambiarValorStandart(valor) {
		valorStandart = valor
	}
}

class Mascota inherits Elemento {
	var salud = 100
	
	method salud() = salud
	
	override method esBueno() {
		return salud > 15
	}
	
	override method esAtacado(plagaX) {
		salud -= self.restarSalud(plagaX)
		salud = salud.max(0)
	}
	
	method restarSalud(plagaY) {
		return if (plagaY.transmiteEnfermedades()) {
			plagaY.nivelDanio()
		} else {0}
	}
}