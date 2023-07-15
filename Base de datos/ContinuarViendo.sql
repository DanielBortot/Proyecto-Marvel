SELECT H.*
FROM "Historial" AS H
JOIN (
  SELECT "N_Titulo", MAX("Id_Hist") AS max_id_hist
  FROM "Historial"
  GROUP BY "N_Titulo"
) AS HMax ON H."N_Titulo" = HMax."N_Titulo" AND H."Id_Hist" = HMax.max_id_hist
WHERE H."Tiempo_Reproduccion" > 5

