
-- Table: public.Ciudad

-- DROP TABLE IF EXISTS public."Ciudad";

CREATE TABLE IF NOT EXISTS public."Ciudad"
(
    "Id_Ciudad" integer NOT NULL,
    "Nombre" text COLLATE pg_catalog."default" NOT NULL,
    "Id_Estado" integer NOT NULL,
    CONSTRAINT "Ciudad_pkey" PRIMARY KEY ("Id_Ciudad"),
    CONSTRAINT "Ciudad_Id_Estado_fkey" FOREIGN KEY ("Id_Estado")
        REFERENCES public."Estado" ("Id_Estado") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."Ciudad"
    OWNER to postgres;
	
-- Table: public.Civil

-- DROP TABLE IF EXISTS public."Civil";

CREATE TABLE IF NOT EXISTS public."Civil"
(
    "N_Civil" text COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "Civil_pkey" PRIMARY KEY ("N_Civil"),
    CONSTRAINT "Civil_N_Civil_fkey" FOREIGN KEY ("N_Civil")
        REFERENCES public."Personaje" ("Nombre") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."Civil"
    OWNER to postgres;
	
	
-- Table: public.Estado

-- DROP TABLE IF EXISTS public."Estado";

CREATE TABLE IF NOT EXISTS public."Estado"
(
    "Id_Estado" integer NOT NULL,
    "Nombre" text COLLATE pg_catalog."default" NOT NULL,
    "Id_Pais" integer NOT NULL,
    CONSTRAINT "Estado_pkey" PRIMARY KEY ("Id_Estado"),
    CONSTRAINT "Estado_Id_Pais_fkey" FOREIGN KEY ("Id_Pais")
        REFERENCES public."Pais" ("Id_Pais") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."Estado"
    OWNER to postgres;
	
-- Table: public.Heroe

-- DROP TABLE IF EXISTS public."Heroe";

CREATE TABLE IF NOT EXISTS public."Heroe"
(
    "N_Heroe" text COLLATE pg_catalog."default" NOT NULL,
    "Alias" text COLLATE pg_catalog."default" NOT NULL,
    "Logotipo" text COLLATE pg_catalog."default",
    "Color_Traje" text COLLATE pg_catalog."default",
    "Archienemigo" text COLLATE pg_catalog."default",
    CONSTRAINT "Heroe_Alias_key" UNIQUE ("Alias"),
    CONSTRAINT "Heroe_Logotipo_key" UNIQUE ("Logotipo"),
    CONSTRAINT "Heroe_N_Heroe_key" UNIQUE ("N_Heroe"),
    CONSTRAINT "Heroe_Archienemigo_fkey" FOREIGN KEY ("Archienemigo")
        REFERENCES public."Villano" ("N_Villano") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT "Heroe_N_Heroe_fkey" FOREIGN KEY ("N_Heroe")
        REFERENCES public."Personaje" ("Nombre") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT "Heroe_Color_Traje_check" CHECK ("Color_Traje" !~~ '%0%'::text AND "Color_Traje" !~~ '%1%'::text AND "Color_Traje" !~~ '%2%'::text AND "Color_Traje" !~~ '%3%'::text AND "Color_Traje" !~~ '%4%'::text AND "Color_Traje" !~~ '%5%'::text AND "Color_Traje" !~~ '%6%'::text AND "Color_Traje" !~~ '%7%'::text AND "Color_Traje" !~~ '%8%'::text AND "Color_Traje" !~~ '%9%'::text)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."Heroe"
    OWNER to postgres;
	
-- Table: public.Juego

-- DROP TABLE IF EXISTS public."Juego";

CREATE TABLE IF NOT EXISTS public."Juego"
(
    "T_Juego" text COLLATE pg_catalog."default" NOT NULL,
    "Distribuidor" text COLLATE pg_catalog."default" NOT NULL,
    "Tipo" text COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "Juego_pkey" PRIMARY KEY ("T_Juego"),
    CONSTRAINT "Juego_T_Juego_fkey" FOREIGN KEY ("T_Juego")
        REFERENCES public."Medio" ("Titulo") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."Juego"
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
	
-- Table: public.Objeto

-- DROP TABLE IF EXISTS public."Objeto";

CREATE TABLE IF NOT EXISTS public."Objeto"
(
    "Nombre" text COLLATE pg_catalog."default" NOT NULL,
    "Descripcion" text COLLATE pg_catalog."default",
    "Material" text COLLATE pg_catalog."default",
    "Tipo" text COLLATE pg_catalog."default" NOT NULL,
    "Imagen" text COLLATE pg_catalog."default" NOT NULL,
    "N_Personaje" text COLLATE pg_catalog."default",
    CONSTRAINT "Objeto_pkey" PRIMARY KEY ("Nombre"),
    CONSTRAINT "Objeto_Imagen_key" UNIQUE ("Imagen"),
    CONSTRAINT "Objeto_N_Personaje_fkey" FOREIGN KEY ("N_Personaje")
        REFERENCES public."Personaje" ("Nombre") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."Objeto"
    OWNER to postgres;
	
	
-- Table: public.Organizacion

-- DROP TABLE IF EXISTS public."Organizacion";

CREATE TABLE IF NOT EXISTS public."Organizacion"
(
    "Nombre" text COLLATE pg_catalog."default" NOT NULL,
    "Eslogan" text COLLATE pg_catalog."default",
    "Lider" text COLLATE pg_catalog."default" NOT NULL,
    "Fundador" text COLLATE pg_catalog."default" NOT NULL,
    "Tipo" text COLLATE pg_catalog."default",
    "Nom_Comic" text COLLATE pg_catalog."default" NOT NULL,
    "Imagen" text COLLATE pg_catalog."default" NOT NULL,
    "Objetivo" text COLLATE pg_catalog."default",
    "Lugar_Creacion" text COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "Organizacion_pkey" PRIMARY KEY ("Nombre"),
    CONSTRAINT "Organizacion_Fundador_key" UNIQUE ("Fundador"),
    CONSTRAINT "Organizacion_Imagen_key" UNIQUE ("Imagen"),
    CONSTRAINT "Organizacion_Lider_key" UNIQUE ("Lider"),
    CONSTRAINT "Organizacion_Fundador_fkey" FOREIGN KEY ("Fundador")
        REFERENCES public."Personaje" ("Nombre") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT "Organizacion_Lider_fkey" FOREIGN KEY ("Lider")
        REFERENCES public."Personaje" ("Nombre") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."Organizacion"
    OWNER to postgres;
	
	
-- Table: public.Pelicula

-- DROP TABLE IF EXISTS public."Pelicula";

CREATE TABLE IF NOT EXISTS public."Pelicula"
(
    "T_Pelicula" text COLLATE pg_catalog."default" NOT NULL,
    "Director" text COLLATE pg_catalog."default" NOT NULL,
    "Duracion" integer NOT NULL,
    "Coste" integer NOT NULL,
    "Ganancia" integer NOT NULL,
    "Distribuidor" text COLLATE pg_catalog."default",
    CONSTRAINT "Pelicula_pkey" PRIMARY KEY ("T_Pelicula"),
    CONSTRAINT "Pelicula_T_Pelicula_fkey" FOREIGN KEY ("T_Pelicula")
        REFERENCES public."Medio" ("Titulo") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT "Pelicula_Coste_check" CHECK ("Coste" > 0),
    CONSTRAINT "Pelicula_Duracion_check" CHECK ("Duracion" > 0),
    CONSTRAINT "Pelicula_Ganancia_check" CHECK ("Ganancia" > 0)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."Pelicula"
    OWNER to postgres;
	
-- Table: public.Perfil

-- DROP TABLE IF EXISTS public."Perfil";

CREATE TABLE IF NOT EXISTS public."Perfil"
(
    "Id_Perfil" integer NOT NULL DEFAULT nextval('"Perfil_Id_Perfil_seq"'::regclass),
    "Dispositivo" text COLLATE pg_catalog."default" NOT NULL,
    "Nombre" text COLLATE pg_catalog."default" NOT NULL,
    "Idioma" text COLLATE pg_catalog."default" NOT NULL,
    "Email" text COLLATE pg_catalog."default" NOT NULL,
    "Imagen" text COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "Perfil_pkey" PRIMARY KEY ("Id_Perfil"),
    CONSTRAINT "Perfil_Imagen_key" UNIQUE ("Imagen"),
    CONSTRAINT "Perfil_Email_fkey" FOREIGN KEY ("Email")
        REFERENCES public."Usuario" ("Email") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT "Perfil_Id_Perfil_check" CHECK ("Id_Perfil" >= 0)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."Perfil"
    OWNER to postgres;
	
-- Table: public.Pers_Creador

-- DROP TABLE IF EXISTS public."Pers_Creador";

CREATE TABLE IF NOT EXISTS public."Pers_Creador"
(
    "N_Personaje" text COLLATE pg_catalog."default" NOT NULL,
    "N_Creador" text COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "Pers_Creador_pkey" PRIMARY KEY ("N_Personaje", "N_Creador"),
    CONSTRAINT "Pers_Creador_N_Creador_fkey" FOREIGN KEY ("N_Creador")
        REFERENCES public."Creador" ("Nom_Creador") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT "Pers_Creador_N_Personaje_fkey" FOREIGN KEY ("N_Personaje")
        REFERENCES public."Personaje" ("Nombre") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."Pers_Creador"
    OWNER to postgres;
	
-- Table: public.Pers_Nac

-- DROP TABLE IF EXISTS public."Pers_Nac";

CREATE TABLE IF NOT EXISTS public."Pers_Nac"
(
    "N_Personaje" text COLLATE pg_catalog."default" NOT NULL,
    "Nacionalidad" text COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "Pers_Nac_pkey" PRIMARY KEY ("N_Personaje", "Nacionalidad"),
    CONSTRAINT "Pers_Nac_N_Personaje_fkey" FOREIGN KEY ("N_Personaje")
        REFERENCES public."Personaje" ("Nombre") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT "Pers_Nac_Nacionalidad_fkey" FOREIGN KEY ("Nacionalidad")
        REFERENCES public."Nacionalidad" ("Nac") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."Pers_Nac"
    OWNER to postgres;
	
-- Table: public.Pers_Oc

-- DROP TABLE IF EXISTS public."Pers_Oc";

CREATE TABLE IF NOT EXISTS public."Pers_Oc"
(
    "N_Personaje" text COLLATE pg_catalog."default" NOT NULL,
    "Ocupacion" text COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "Pers_Oc_pkey" PRIMARY KEY ("N_Personaje", "Ocupacion"),
    CONSTRAINT "Pers_Oc_N_Personaje_fkey" FOREIGN KEY ("N_Personaje")
        REFERENCES public."Personaje" ("Nombre") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT "Pers_Oc_Ocupacion_fkey" FOREIGN KEY ("Ocupacion")
        REFERENCES public."Ocupacion" ("Ocup") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."Pers_Oc"
    OWNER to postgres;
	
-- Table: public.Plat_Juego

-- DROP TABLE IF EXISTS public."Plat_Juego";

CREATE TABLE IF NOT EXISTS public."Plat_Juego"
(
    "T_Juego" text COLLATE pg_catalog."default" NOT NULL,
    "Plataforma" text COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "Plat_Juego_pkey" PRIMARY KEY ("T_Juego", "Plataforma"),
    CONSTRAINT "Plat_Juego_Plataforma_fkey" FOREIGN KEY ("Plataforma")
        REFERENCES public."Plataforma" (nombre) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT "Plat_Juego_T_Juego_fkey" FOREIGN KEY ("T_Juego")
        REFERENCES public."Juego" ("T_Juego") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."Plat_Juego"
    OWNER to postgres;
	

-- Table: public.Sede

-- DROP TABLE IF EXISTS public."Sede";

CREATE TABLE IF NOT EXISTS public."Sede"
(
    "Nombre" text COLLATE pg_catalog."default" NOT NULL,
    "Tipo_Edif" text COLLATE pg_catalog."default",
    "Ubicacion" text COLLATE pg_catalog."default" NOT NULL,
    "Imagen" text COLLATE pg_catalog."default" NOT NULL,
    "N_Org" text COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "Sede_pkey" PRIMARY KEY ("Nombre", "N_Org"),
    CONSTRAINT "Sede_Imagen_key" UNIQUE ("Imagen"),
    CONSTRAINT "Sede_Nombre_key" UNIQUE ("Nombre"),
    CONSTRAINT "Sede_N_Org_fkey" FOREIGN KEY ("N_Org")
        REFERENCES public."Organizacion" ("Nombre") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."Sede"
    OWNER to postgres;
	
-- Table: public.Serie

-- DROP TABLE IF EXISTS public."Serie";

CREATE TABLE IF NOT EXISTS public."Serie"
(
    "T_Serie" text COLLATE pg_catalog."default" NOT NULL,
    "N_Episodios" integer NOT NULL,
    "Creador" text COLLATE pg_catalog."default" NOT NULL,
    "Canal" text COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "Serie_pkey" PRIMARY KEY ("T_Serie"),
    CONSTRAINT "Serie_T_Serie_fkey" FOREIGN KEY ("T_Serie")
        REFERENCES public."Medio" ("Titulo") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."Serie"
    OWNER to postgres;
	
-- Table: public.Usuario

-- DROP TABLE IF EXISTS public."Usuario";

CREATE TABLE IF NOT EXISTS public."Usuario"
(
    "Email" text COLLATE pg_catalog."default" NOT NULL,
    "Contrasena" text COLLATE pg_catalog."default" NOT NULL,
    "Nombre" text COLLATE pg_catalog."default" NOT NULL,
    "Apellido" text COLLATE pg_catalog."default" NOT NULL,
    "Fecha_Nac" date NOT NULL,
    "Fecha_Creacion" date NOT NULL,
    "Id_Suscripcion" integer NOT NULL,
    "Direccion" integer NOT NULL,
    "N_Tarjeta" text COLLATE pg_catalog."default",
    CONSTRAINT "Usuario_pkey" PRIMARY KEY ("Email"),
    CONSTRAINT "Usuario_Apellido_key" UNIQUE ("Apellido"),
    CONSTRAINT "Usuario_Nombre_key" UNIQUE ("Nombre"),
    CONSTRAINT "Usuario_Direccion_fkey" FOREIGN KEY ("Direccion")
        REFERENCES public."Ciudad" ("Id_Ciudad") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT "Usuario_Id_Suscripcion_fkey" FOREIGN KEY ("Id_Suscripcion")
        REFERENCES public."Suscripcion" ("ID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT "Usuario_N_Tarjeta_fkey" FOREIGN KEY ("N_Tarjeta")
        REFERENCES public."Tarjeta" ("N_Tarjeta") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT "Usuario_Email_check" CHECK ("Email" ~~ '%@%'::text AND "Email" ~~ '%.%'::text)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."Usuario"
    OWNER to postgres;
	
-- Table: public.Villano

-- DROP TABLE IF EXISTS public."Villano";

CREATE TABLE IF NOT EXISTS public."Villano"
(
    "N_Villano" text COLLATE pg_catalog."default" NOT NULL,
    "Alias" text COLLATE pg_catalog."default" NOT NULL,
    "Objetivo" text COLLATE pg_catalog."default",
    CONSTRAINT "Villano_pkey" PRIMARY KEY ("N_Villano"),
    CONSTRAINT "Villano_Alias_key" UNIQUE ("Alias"),
    CONSTRAINT "Villano_N_Villano_fkey" FOREIGN KEY ("N_Villano")
        REFERENCES public."Personaje" ("Nombre") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."Villano"
    OWNER to postgres;	
	
	
	
	