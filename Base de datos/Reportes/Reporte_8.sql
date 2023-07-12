SELECT *
FROM "Personaje"
WHERE "Nombre" IN (SELECT "N_Personaje" FROM "Esta"
				  	WHERE "N_Titulo" IN (SELECT Me."Titulo" FROM "Medio" AS Me JOIN "Pelicula" AS  Pe ON (Me."Titulo" = Pe."T_Pelicula")																 			   
										 WHERE (Pe."Tipo" = 'Animacion'))
				  						 OR "N_Titulo" IN (SELECT Me."Titulo" FROM "Medio" AS Me JOIN "Serie" AS  S ON (Me."Titulo" = S."T_Serie")
										 WHERE (S."Tipo" = 'Animacion')))
	  AND "Nombre" IN (SELECT "N_Heroe" FROM "Heroe")
	  AND "Genero" = 'F';