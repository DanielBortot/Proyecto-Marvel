SELECT "N_Objeto", COUNT ("N_Objeto")
FROM (SELECT "N_Objeto", "Fecha"
	  FROM  "Combate" 
      GROUP BY "N_Objeto", "Fecha") AS FOO
GROUP BY "N_Objeto"
ORDER BY COUNT("N_Objeto") DESC
LIMIT 5;
