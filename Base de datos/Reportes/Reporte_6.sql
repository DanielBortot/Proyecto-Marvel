SELECT * 
FROM "Posee" 
WHERE (("Obtencion" = 'Hereditario') AND ("N_Poder" LIKE  'Super%') AND 
	   ("N_Personaje" IN (SELECT "N_Villano" 
						  FROM "Villano" 
						  GROUP BY "N_Villano" 
						  HAVING COUNT(*) < 2))) 
	   
	   
	   
	   	 