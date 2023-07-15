SELECT "N_Personaje", "N_Titulo" FROM "Esta"
WHERE ("N_Titulo" IN (SELECT Me."Titulo" FROM "Medio" AS Me JOIN "Pelicula" AS  Pe ON (Me."Titulo" = Pe."T_Pelicula")																 			   
					 WHERE (Pe."Tipo" = 'Animacion'))
	  OR "N_Titulo" IN (SELECT Me."Titulo" FROM "Medio" AS Me JOIN "Serie" AS  S ON (Me."Titulo" = S."T_Serie")
						WHERE (S."Tipo" = 'Animacion')))
	  AND ("N_Personaje" IN (SELECT "N_Heroe" FROM "Heroe"))
	  AND ("N_Personaje" IN (SELECT "Nombre" FROM "Personaje" WHERE "Genero" = 'F'));