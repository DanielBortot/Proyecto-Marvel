SELECT U."Email", U."Nombre", U."Apellido", U."Fecha_Nac" 
FROM "Usuario" U JOIN "Suscripcion" S
ON (U."Id_Suscripcion" = S."ID")
WHERE ((S."Tipo" = 'Vip') AND (U."Direccion" IN (SELECT "Id_Ciudad"
											  FROM "Ciudad"
											  WHERE "Id_Estado" IN (SELECT "Id_Estado"
																   FROM "Estado"
																   WHERE "Id_Pais" IN (SELECT "Id_Pais"
																					  FROM "Pais"
																					  WHERE "Nombre" = 'Venezuela')))))