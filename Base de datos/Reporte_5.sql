SELECT * FROM "Pelicula"
WHERE (("Duracion" > 150) 
	   AND ("Tipo" = 'Animacion') 
	   AND ("Ganancia" >= (SELECT AVG ("Ganancia")
						  FROM "Pelicula"
						  WHERE "Tipo" = 'Animacion')))
ORDER BY "Coste"						  