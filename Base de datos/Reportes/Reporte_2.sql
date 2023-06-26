SELECT * 
FROM "Serie"
WHERE "N_Episodios" > (SELECT AVG("N_Episodios")
					   FROM "Serie")