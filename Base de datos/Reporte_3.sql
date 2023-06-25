SELECT O."Nombre", Ca."Fecha", COUNT(*) AS total_usos
FROM "Objeto" AS O
JOIN "Combate" AS Ca ON O."Nombre" = Ca."N_Objeto"
GROUP BY O."Nombre", Ca."Fecha"
ORDER BY total_usos DESC
LIMIT 5;