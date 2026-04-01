class Canzone:

	def __init__(self, cantante, titolo):
		
		self.cantante = cantante;
		self.titolo = titolo;
	
	def __str__(self):
		return f"Canzone [cantante={self.cantante}, titolo={self.titolo}]"
	


def calcola_media(voto1, voto2):
    return (voto1 + voto2) / 2