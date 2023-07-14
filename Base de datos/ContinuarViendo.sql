SELECT Me.* FROM "Medio" AS Me JOIN "Historial" AS H ON (Me."Titulo" = H."N_Titulo")
WHERE	(Me."Duracion" > H."Tiempo_Reproduccion") AND (H."Tiempo_Reproduccion" > 5)