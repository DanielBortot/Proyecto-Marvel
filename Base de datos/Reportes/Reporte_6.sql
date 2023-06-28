SELECT Pd.*
FROM "Posee" AS Po JOIN "Poder" AS Pd ON (Po."N_Poder" = Pd."Nombre")
					JOIN "Villano" AS V ON (Po."N_Personaje" = V."N_Villano")
WHERE (Po."Obtencion" = 'Hereditario') AND (Po."N_Poder" LIKE  'Super%')
GROUP BY Pd."Nombre"
HAVING 	COUNT (V."N_Villano") > 2

