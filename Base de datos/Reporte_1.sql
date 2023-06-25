SELECT Pe."Nombre"
FROM "Personaje" AS Pe
LEFT JOIN "Heroe" AS H ON Pe."Nombre" = H."N_Heroe"
LEFT JOIN "Villano" AS V ON Pe."Nombre" = V."N_Villano"
WHERE Pe."Nombre" IN (
    SELECT "N_Personaje"
    FROM "Posee"
    WHERE "Obtencion" = 'Artificial'
)
AND Pe."Nombre" IN (
    SELECT "N_Personaje"
    FROM "Pertenece"
    WHERE "Cod_Cargo" = 100
)
AND (H."N_Heroe" IS NOT NULL OR V."N_Villano" IS NOT NULL);