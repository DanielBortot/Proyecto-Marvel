SELECT distinct Pd.* 
FROM "Posee" AS Po JOIN "Poder" AS Pd ON (Po."N_Poder" = Pd."Nombre")
WHERE ((Po."Obtencion" = 'Hereditario') AND (Po."N_Poder" LIKE  'Super%') AND 
	   (Po."N_Personaje" IN (SELECT "N_Villano" 
						  FROM "Villano" 
						  GROUP BY "N_Villano" 
						  HAVING COUNT(*) < 2))) 
	   
	   
	   
	   	 