import elementos.*


class Plaga {
	var poblacion = 100
	
	method poblacion() = poblacion
	
	method nivelDanio() {
		return poblacion
	}
	
	method transmiteEnfermedades()
	
	method atacar(elementoX) {
		elementoX.esAtacado(self)
		poblacion += (poblacion*0.1)
	}
}

class Cucarachas inherits Plaga {
	
	override method nivelDanio() {
		return super()/2
	}
	
	override method transmiteEnfermedades() {
		return poblacion > 500
	}
}

class Pulgas inherits Plaga {
	
	override method nivelDanio() {
		return super()*2
	}
	
	override method transmiteEnfermedades() {
		return true
	}
}

class Garrapatas inherits Pulgas {
	//funciona de la misma forma que las pulgas
	
	override method atacar(elementoX) {
		elementoX.esAtacado(self)
		poblacion += (poblacion*0.2)
	}
}

class Mosquitos inherits Plaga {
	const transmiteEnfermedades = false
	
	override method transmiteEnfermedades() {
		return transmiteEnfermedades
	}
}