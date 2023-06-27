SELECT Pe.*,Me."Fecha_Estreno" 
FROM "Pelicula" AS Pe JOIN "Medio" AS Me
ON (Pe."T_Pelicula" = Me."Titulo")
WHERE ((Pe."Duracion" > 150) 
	   AND (Pe."Tipo" = 'Animacion') 
	   AND (Pe."Ganancia" >= (SELECT AVG ("Ganancia")
						  	  FROM "Pelicula"
						      WHERE "Tipo" = 'Animacion')))
ORDER BY Pe."Coste",Me."Fecha_Estreno"			  