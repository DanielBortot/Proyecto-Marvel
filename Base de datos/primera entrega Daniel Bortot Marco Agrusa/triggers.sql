CREATE OR REPLACE FUNCTION public.archienemigo()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$
DECLARE narchi INTEGER;
BEGIN

SELECT COUNT(*) INTO narchi FROM "Heroe" WHERE "Archienemigo" = NEW."Archienemigo";

IF narchi > 0 THEN
	RAISE EXCEPTION 'Solo puede existir un archienemigo por heroe';
END IF;

RETURN NEW;
END;
$BODY$;

ALTER FUNCTION public.archienemigo()
    OWNER TO postgres;


CREATE OR REPLACE FUNCTION public.emarital()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$
BEGIN

IF new."E_Marital" != 'Soltero' AND new."E_Marital" != 'Casado' AND new."E_Marital" != 'Viudo' AND new."E_Marital" != 'Divorciado' THEN
	RAISE EXCEPTION 'El genero debe ser "M", "F", "Desc", "Otro"';
END IF;

RETURN NEW;
END;
$BODY$;

ALTER FUNCTION public.emarital()
    OWNER TO postgres;


CREATE OR REPLACE FUNCTION public.ganancia_perdida()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$
begin

if new."Ganancia" < new."Coste" then
	raise exception 'Las perdidas de la pelicula son mayores a sus ganancias';
end if;
return new;
end;
$BODY$;

ALTER FUNCTION public.ganancia_perdida()
    OWNER TO postgres;


CREATE OR REPLACE FUNCTION public.genero()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$
DECLARE generot TEXT;
BEGIN

IF new."Genero" != 'M' AND new."Genero" != 'F' AND new."Genero" != 'Desc' AND new."Genero" != 'Otro' THEN
	RAISE EXCEPTION 'El genero debe ser "M", "F", "Desc", "Otro"';
END IF;

RETURN NEW;
END;
$BODY$;

ALTER FUNCTION public.genero()
    OWNER TO postgres;


CREATE OR REPLACE FUNCTION public.numcalificacion()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$
DECLARE ncalif INTEGER;
BEGIN

IF new."Calificacion" < 1 OR new."Calificacion" > 5 THEN
	RAISE EXCEPTION 'La calificacion debe ser un numero entre 1 y 5';
END IF;

RETURN NEW;
END;
$BODY$;

ALTER FUNCTION public.numcalificacion()
    OWNER TO postgres;


CREATE OR REPLACE FUNCTION public.numperf()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$
DECLARE perfilcount INTEGER;
BEGIN
SELECT COUNT(*) INTO perfilcount FROM "Perfil" WHERE "Email" =NEW."Email";

IF perfilcount = 5 THEN
	RAISE EXCEPTION 'Solo pueden existir 5 perfiles por usuario';
END IF;

RETURN NEW;
END
$BODY$;

ALTER FUNCTION public.numperf()
    OWNER TO postgres;


CREATE OR REPLACE FUNCTION public.numrating()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$
BEGIN

IF new."Rating" < 1 OR new."Rating" > 5 THEN
	RAISE EXCEPTION 'El rating debe ser un numero entre 1 y 5';
END IF;

RETURN NEW;
END;
$BODY$;

ALTER FUNCTION public.numrating()
    OWNER TO postgres;


CREATE OR REPLACE FUNCTION public.numusuarios()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$
declare num integer;
begin

select count(*) into num from "Usuario" where "Nombre" = new."Nombre" or "Apellido" = new."Apellido";

if num > 0 then
	raise exception 'No pueden existir varios usuarios con el mismo nombre o apellido';
end if;
return new;
end;
$BODY$;

ALTER FUNCTION public.numusuarios()
    OWNER TO postgres;


CREATE OR REPLACE FUNCTION public.rolpersonaje()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$
begin

if new."Rol" != 'Antagonista' AND new."Rol" != 'Protagonista' AND new."Rol" != 'Secundario' then
	raise exception 'Un personaje solo puede ser "Protagonista", "Antagonista" o "Secundario"';
end if;
return new;
end;
$BODY$;

ALTER FUNCTION public.rolpersonaje()
    OWNER TO postgres;


CREATE OR REPLACE FUNCTION public.tipoactor()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$
begin

if new."Tipo_Actor" != 'Interpreta' AND new."Tipo_Actor" != 'Presta su voz' then
	raise exception 'Un actor solo puede Interpretar un personaje o Prestar su Voz';
end if;
return new;
end;
$BODY$;

ALTER FUNCTION public.tipoactor()
    OWNER TO postgres;

CREATE OR REPLACE FUNCTION public.tiposuscripciones()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$
declare tipo text;
declare num integer;
declare tarifa real;
begin

select count(*) into num from "Suscripcion";

if num = 5 then
	raise exception 'Solo pueden existir 4 tipos de suscripciones';
end if;
if new."Tipo" != 'Gold' and new."Tipo" != 'Premium' and new."Tipo" != 'Vip' and new."Tipo" != 'Free' then
	raise exception 'Solo existen las suscripciones Vip, Gold, Premium y Free';
end if;
return new;
end;
$BODY$;

ALTER FUNCTION public.tiposuscripciones()
    OWNER TO postgres;