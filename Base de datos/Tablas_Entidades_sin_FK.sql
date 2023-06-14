-- Table: public.Creador

-- DROP TABLE IF EXISTS public."Creador";

CREATE TABLE IF NOT EXISTS public."Creador"
(
    "Nom_Creador" text COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "Creador_pkey" PRIMARY KEY ("Nom_Creador")
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."Creador"
    OWNER to postgres;
	
	
	
-- Table: public.Medio

-- DROP TABLE IF EXISTS public."Medio";

CREATE TABLE IF NOT EXISTS public."Medio"
(
    "Titulo" text COLLATE pg_catalog."default" NOT NULL,
    "Fecha_Estreno" date NOT NULL,
    "Compania" text COLLATE pg_catalog."default" NOT NULL,
    "Rating" integer NOT NULL,
    "Sinopsis" text COLLATE pg_catalog."default" NOT NULL,
    "Imagen" text COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "Medio_pkey" PRIMARY KEY ("Titulo"),
    CONSTRAINT "Medio_Imagen_key" UNIQUE ("Imagen"),
    CONSTRAINT "Medio_Rating_check" CHECK ("Rating" >= 1 AND "Rating" <= 5)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."Medio"
    OWNER to postgres;

-- Table: public.Nacionalidad

-- DROP TABLE IF EXISTS public."Nacionalidad";

CREATE TABLE IF NOT EXISTS public."Nacionalidad"
(
    "Nac" text COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "Nacionalidad_pkey" PRIMARY KEY ("Nac")
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."Nacionalidad"
    OWNER to postgres;
	
-- Table: public.Ocupacion

-- DROP TABLE IF EXISTS public."Ocupacion";

CREATE TABLE IF NOT EXISTS public."Ocupacion"
(
    "Ocup" text COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "Ocupacion_pkey" PRIMARY KEY ("Ocup")
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."Ocupacion"
    OWNER to postgres;	



-- Table: public.Pais

-- DROP TABLE IF EXISTS public."Pais";

CREATE TABLE IF NOT EXISTS public."Pais"
(
    "Id_Pais" integer NOT NULL,
    "Nombre" text COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "Pais_pkey" PRIMARY KEY ("Id_Pais")
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."Pais"
    OWNER to postgres;
	
-- Table: public.Personaje

-- DROP TABLE IF EXISTS public."Personaje";

CREATE TABLE IF NOT EXISTS public."Personaje"
(
    "Nombre" text COLLATE pg_catalog."default" NOT NULL,
    "Genero" text COLLATE pg_catalog."default",
    "Color_Ojos" text COLLATE pg_catalog."default",
    "Color_Pelo" text COLLATE pg_catalog."default",
    "Nom_Comic" text COLLATE pg_catalog."default" NOT NULL,
    "E_Marital" text COLLATE pg_catalog."default" NOT NULL,
    imagen text COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "Personaje_pkey" PRIMARY KEY ("Nombre"),
    CONSTRAINT "Personaje_Nombre_key" UNIQUE ("Nombre"),
    CONSTRAINT "Personaje_Color_Ojos_check" CHECK ("Color_Ojos" !~~ '%0%'::text AND "Color_Ojos" !~~ '%1%'::text AND "Color_Ojos" !~~ '%2%'::text AND "Color_Ojos" !~~ '%3%'::text AND "Color_Ojos" !~~ '%4%'::text AND "Color_Ojos" !~~ '%5%'::text AND "Color_Ojos" !~~ '%6%'::text AND "Color_Ojos" !~~ '%7%'::text AND "Color_Ojos" !~~ '%8%'::text AND "Color_Ojos" !~~ '%9%'::text),
    CONSTRAINT "Personaje_Color_Pelo_check" CHECK ("Color_Pelo" !~~ '%0%'::text AND "Color_Pelo" !~~ '%1%'::text AND "Color_Pelo" !~~ '%2%'::text AND "Color_Pelo" !~~ '%3%'::text AND "Color_Pelo" !~~ '%4%'::text AND "Color_Pelo" !~~ '%5%'::text AND "Color_Pelo" !~~ '%6%'::text AND "Color_Pelo" !~~ '%7%'::text AND "Color_Pelo" !~~ '%8%'::text AND "Color_Pelo" !~~ '%9%'::text),
    CONSTRAINT "Personaje_E_Marital_check" CHECK ("E_Marital" = 'Soltero'::text OR "E_Marital" = 'Casado'::text OR "E_Marital" = 'Viudo'::text OR "E_Marital" = 'Divorciado'::text),
    CONSTRAINT "Personaje_Genero_check" CHECK ("Genero" = 'M'::text OR "Genero" = 'F'::text OR "Genero" = 'Desc'::text OR "Genero" = 'Otro'::text)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."Personaje"
    OWNER to postgres;
	
-- Table: public.Poder

-- DROP TABLE IF EXISTS public."Poder";

CREATE TABLE IF NOT EXISTS public."Poder"
(
    "Nombre" text COLLATE pg_catalog."default" NOT NULL,
    "Imagen" text COLLATE pg_catalog."default" NOT NULL,
    "Descripcion" text COLLATE pg_catalog."default",
    CONSTRAINT "Poder_pkey" PRIMARY KEY ("Nombre"),
    CONSTRAINT "Poder_Imagen_key" UNIQUE ("Imagen")
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."Poder"
    OWNER to postgres;	
	
-- Table: public.Suscripcion

-- DROP TABLE IF EXISTS public."Suscripcion";

CREATE TABLE IF NOT EXISTS public."Suscripcion"
(
    "ID" integer NOT NULL,
    "Tarifa" real NOT NULL,
    "Descripcion" text COLLATE pg_catalog."default" NOT NULL,
    "Tipo" text COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "Suscripcion_pkey" PRIMARY KEY ("ID"),
    CONSTRAINT "Suscripcion_Tarifa_check" CHECK ("Tarifa" >= 0::double precision),
    CONSTRAINT "Suscripcion_Tipo_check" CHECK ("Tipo" = 'Gold'::text OR "Tipo" = 'Vip'::text OR "Tipo" = 'Premium'::text OR "Tipo" = 'Free'::text)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."Suscripcion"
    OWNER to postgres;	
	
-- Table: public.Tarjeta

-- DROP TABLE IF EXISTS public."Tarjeta";

CREATE TABLE IF NOT EXISTS public."Tarjeta"
(
    "N_Tarjeta" text COLLATE pg_catalog."default" NOT NULL,
    "Cod_Seguridad" integer NOT NULL,
    "Fecha_Ven" date NOT NULL,
    CONSTRAINT "Tarjeta_pkey" PRIMARY KEY ("N_Tarjeta"),
    CONSTRAINT "Tarjeta_N_Tarjeta_key" UNIQUE ("N_Tarjeta"),
    CONSTRAINT "Tarjeta_Cod_Seguridad_check" CHECK ("Cod_Seguridad" >= 100 AND "Cod_Seguridad" <= 999)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."Tarjeta"
    OWNER to postgres;	
