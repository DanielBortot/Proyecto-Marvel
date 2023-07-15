SELECT DISTINCT Me.* FROM "Medio" AS Me JOIN "Esta" AS E ON (Me."Titulo" = E."N_Titulo")
WHERE (Me."Titulo" NOT IN (SELECT "N_Titulo" FROM "Historial")) AND
	  (E."N_Personaje" IN (SELECT "N_Personaje" FROM "Esta" AS Es JOIN "Medio" AS Med ON (Es."N_Titulo" = Med."Titulo")
						   WHERE Med."Titulo" IN (SELECT H."N_Titulo" FROM "Historial" AS H JOIN "Medio" AS Mo ON (H."N_Titulo" = Mo."Titulo")							
												  WHERE ((H."Calificacion" IN (SELECT "Calificacion" FROM "Historial"
																			  WHERE ("Id_Hist" = (SELECT MAX("Id_Hist") FROM "Historial") AND ("Calificacion" > 3)))) AND (H."Id_Perfil" = 6)) AND (Mo."Duracion" = H."Tiempo_Reproduccion"))))