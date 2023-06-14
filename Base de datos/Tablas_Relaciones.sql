-- Table: public.Aparece

-- DROP TABLE IF EXISTS public."Aparece";

CREATE TABLE IF NOT EXISTS public."Aparece"
(
    "N_Organizacion" text COLLATE pg_catalog."default" NOT NULL,
    "N_Titulo" text COLLATE pg_catalog."default" NOT NULL,
    "Estado" text COLLATE pg_catalog."default" NOT NULL,
    "Rol" text COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "Aparece_pkey" PRIMARY KEY ("N_Organizacion", "N_Titulo"),
    CONSTRAINT "Aparece_N_Organizacion_fkey" FOREIGN KEY ("N_Organizacion")
        REFERENCES public."Organizacion" ("Nombre") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT "Aparece_N_Titulo_fkey" FOREIGN KEY ("N_Titulo")
        REFERENCES public."Medio" ("Titulo") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT "Aparece_Rol_check" CHECK ("Rol" = 'Antagonista'::text OR "Rol" = 'Protagonista'::text OR "Rol" = 'Secundario'::text)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."Aparece"
    OWNER to postgres;
	
-- Table: public.Combate

-- DROP TABLE IF EXISTS public."Combate";

CREATE TABLE IF NOT EXISTS public."Combate"
(
    "N_Personaje" text COLLATE pg_catalog."default" NOT NULL,
    "N_Poder" text COLLATE pg_catalog."default" NOT NULL,
    "N_Objeto" text COLLATE pg_catalog."default" NOT NULL,
    "Lugar" text COLLATE pg_catalog."default" NOT NULL,
    "Fecha" date NOT NULL,
    CONSTRAINT "Combate_pkey" PRIMARY KEY ("N_Personaje", "N_Poder", "N_Objeto"),
    CONSTRAINT "Combate_N_Objeto_fkey" FOREIGN KEY ("N_Objeto")
        REFERENCES public."Objeto" ("Nombre") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT "Combate_N_Personaje_fkey" FOREIGN KEY ("N_Personaje")
        REFERENCES public."Personaje" ("Nombre") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT "Combate_N_Poder_fkey" FOREIGN KEY ("N_Poder")
        REFERENCES public."Poder" ("Nombre") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."Combate"
    OWNER to postgres;
	
-- Table: public.Crea

-- DROP TABLE IF EXISTS public."Crea";

CREATE TABLE IF NOT EXISTS public."Crea"
(
    "N_Personaje" text COLLATE pg_catalog."default" NOT NULL,
    "N_Objeto" text COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "Crea_pkey" PRIMARY KEY ("N_Personaje", "N_Objeto"),
    CONSTRAINT "Crea_N_Objeto_fkey" FOREIGN KEY ("N_Objeto")
        REFERENCES public."Objeto" ("Nombre") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT "Crea_N_Personaje_fkey" FOREIGN KEY ("N_Personaje")
        REFERENCES public."Personaje" ("Nombre") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."Crea"
    OWNER to postgres;	
	
-- Table: public.Enfrenta

-- DROP TABLE IF EXISTS public."Enfrenta";

CREATE TABLE IF NOT EXISTS public."Enfrenta"
(
    "N_Heroe" text COLLATE pg_catalog."default" NOT NULL,
    "N_Villano" text COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "Enfrenta_pkey" PRIMARY KEY ("N_Heroe", "N_Villano"),
    CONSTRAINT "Enfrenta_N_Heroe_fkey" FOREIGN KEY ("N_Heroe")
        REFERENCES public."Heroe" ("N_Heroe") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT "Enfrenta_N_Villano_fkey" FOREIGN KEY ("N_Villano")
        REFERENCES public."Villano" ("N_Villano") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."Enfrenta"
    OWNER to postgres;
	
-- Table: public.Esta

-- DROP TABLE IF EXISTS public."Esta";

CREATE TABLE IF NOT EXISTS public."Esta"
(
    "N_Personaje" text COLLATE pg_catalog."default" NOT NULL,
    "N_Titulo" text COLLATE pg_catalog."default" NOT NULL,
    "Tipo_Actor" text COLLATE pg_catalog."default" NOT NULL,
    "Rol" text COLLATE pg_catalog."default" NOT NULL,
    "Actor" text COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "Esta_pkey" PRIMARY KEY ("N_Personaje", "N_Titulo"),
    CONSTRAINT "Esta_N_Personaje_fkey" FOREIGN KEY ("N_Personaje")
        REFERENCES public."Personaje" ("Nombre") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT "Esta_N_Titulo_fkey" FOREIGN KEY ("N_Titulo")
        REFERENCES public."Medio" ("Titulo") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT "Esta_Rol_check" CHECK ("Rol" = 'Antagonista'::text OR "Rol" = 'Protagonista'::text OR "Rol" = 'Secundario'::text),
    CONSTRAINT "Esta_Tipo_Actor_check" CHECK ("Tipo_Actor" = 'Interpretado'::text OR "Tipo_Actor" = 'Presta su voz'::text)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."Esta"
    OWNER to postgres;
	
-- Table: public.Historial

-- DROP TABLE IF EXISTS public."Historial";

CREATE TABLE IF NOT EXISTS public."Historial"
(
    "N_Titulo" text COLLATE pg_catalog."default" NOT NULL,
    "Id_Perfil" integer NOT NULL,
    "Calificacion" integer NOT NULL,
    "Hora_Inicio" date NOT NULL,
    "Hora_Fin" date NOT NULL,
    CONSTRAINT "Historial_pkey" PRIMARY KEY ("N_Titulo", "Id_Perfil"),
    CONSTRAINT "Historial_Id_Perfil_fkey" FOREIGN KEY ("Id_Perfil")
        REFERENCES public."Perfil" ("Id_Perfil") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT "Historial_N_Titulo_fkey" FOREIGN KEY ("N_Titulo")
        REFERENCES public."Medio" ("Titulo") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT "Historial_Calificacion_check" CHECK ("Calificacion" >= 1 AND "Calificacion" <= 5)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."Historial"
    OWNER to postgres;
	
-- Table: public.Pertenece

-- DROP TABLE IF EXISTS public."Pertenece";

CREATE TABLE IF NOT EXISTS public."Pertenece"
(
    "N_Organizacion" text COLLATE pg_catalog."default" NOT NULL,
    "N_Personaje" text COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "Pertenece_pkey" PRIMARY KEY ("N_Organizacion", "N_Personaje"),
    CONSTRAINT "Pertenece_N_Organizacion_fkey" FOREIGN KEY ("N_Organizacion")
        REFERENCES public."Organizacion" ("Nombre") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT "Pertenece_N_Personaje_fkey" FOREIGN KEY ("N_Personaje")
        REFERENCES public."Personaje" ("Nombre") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."Pertenece"
    OWNER to postgres;

-- Table: public.Posee

-- DROP TABLE IF EXISTS public."Posee";

CREATE TABLE IF NOT EXISTS public."Posee"
(
    "N_Personaje" text COLLATE pg_catalog."default" NOT NULL,
    "N_Poder" text COLLATE pg_catalog."default" NOT NULL,
    "Obtencion" text COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "Posee_pkey" PRIMARY KEY ("N_Personaje", "N_Poder"),
    CONSTRAINT "Posee_N_Personaje_fkey" FOREIGN KEY ("N_Personaje")
        REFERENCES public."Personaje" ("Nombre") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT "Posee_N_Poder_fkey" FOREIGN KEY ("N_Poder")
        REFERENCES public."Poder" ("Nombre") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT "Posee_Obtencion_check" CHECK ("Obtencion" = 'Natural'::text OR "Obtencion" = 'Artificial'::text OR "Obtencion" = 'Hereditario'::text)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."Posee"
    OWNER to postgres;
	
-- Table: public.RelacionadoHer

-- DROP TABLE IF EXISTS public."RelacionadoHer";

CREATE TABLE IF NOT EXISTS public."RelacionadoHer"
(
    "N_Civil" text COLLATE pg_catalog."default" NOT NULL,
    "N_Heroe" text COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "RelacionadoHer_pkey" PRIMARY KEY ("N_Civil", "N_Heroe"),
    CONSTRAINT "RelacionadoHer_N_Civil_fkey" FOREIGN KEY ("N_Civil")
        REFERENCES public."Civil" ("N_Civil") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT "RelacionadoHer_N_Heroe_fkey" FOREIGN KEY ("N_Heroe")
        REFERENCES public."Heroe" ("N_Heroe") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."RelacionadoHer"
    OWNER to postgres;
	
-- Table: public.RelacionadoVill

-- DROP TABLE IF EXISTS public."RelacionadoVill";

CREATE TABLE IF NOT EXISTS public."RelacionadoVill"
(
    "N_Civil" text COLLATE pg_catalog."default" NOT NULL,
    "N_Villano" text COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "RelacionadoVill_pkey" PRIMARY KEY ("N_Civil", "N_Villano"),
    CONSTRAINT "RelacionadoVill_N_Civil_fkey" FOREIGN KEY ("N_Civil")
        REFERENCES public."Civil" ("N_Civil") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT "RelacionadoVill_N_Villano_fkey" FOREIGN KEY ("N_Villano")
        REFERENCES public."Villano" ("N_Villano") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."RelacionadoVill"
    OWNER to postgres;	