--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3
-- Dumped by pg_dump version 15.3

-- Started on 2023-06-26 18:58:57

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 257 (class 1255 OID 24643)
-- Name: archienemigo(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.archienemigo() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE narchi INTEGER;
BEGIN

SELECT COUNT(*) INTO narchi FROM "Heroe" WHERE "Archienemigo" = NEW."Archienemigo";

IF narchi > 0 THEN
	RAISE EXCEPTION 'Solo puede existir un archienemigo por heroe';
END IF;

RETURN NEW;
END;
$$;


ALTER FUNCTION public.archienemigo() OWNER TO postgres;

--
-- TOC entry 258 (class 1255 OID 24644)
-- Name: emarital(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.emarital() RETURNS trigger
    LANGUAGE plpgsql
    AS $$BEGIN

IF new."E_Marital" != 'Soltero' AND new."E_Marital" != 'Casado' AND new."E_Marital" != 'Viudo' AND new."E_Marital" != 'Divorciado' THEN
	RAISE EXCEPTION 'El genero debe ser "M", "F", "Desc", "Otro"';
END IF;

RETURN NEW;
END;
$$;


ALTER FUNCTION public.emarital() OWNER TO postgres;

--
-- TOC entry 259 (class 1255 OID 24645)
-- Name: ganancia_perdida(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.ganancia_perdida() RETURNS trigger
    LANGUAGE plpgsql
    AS $$begin

if new."Ganancia" < new."Coste" then
	raise exception 'Las perdidas de la pelicula son mayores a sus ganancias';
end if;
return new;
end;
$$;


ALTER FUNCTION public.ganancia_perdida() OWNER TO postgres;

--
-- TOC entry 260 (class 1255 OID 24646)
-- Name: genero(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.genero() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE generot TEXT;
BEGIN

IF new."Genero" != 'M' AND new."Genero" != 'F' AND new."Genero" != 'Desc' AND new."Genero" != 'Otro' THEN
	RAISE EXCEPTION 'El genero debe ser "M", "F", "Desc", "Otro"';
END IF;

RETURN NEW;
END;
$$;


ALTER FUNCTION public.genero() OWNER TO postgres;

--
-- TOC entry 261 (class 1255 OID 24647)
-- Name: numcalificacion(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.numcalificacion() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE ncalif INTEGER;
BEGIN

IF new."Calificacion" < 1 OR new."Calificacion" > 5 THEN
	RAISE EXCEPTION 'La calificacion debe ser un numero entre 1 y 5';
END IF;

RETURN NEW;
END;
$$;


ALTER FUNCTION public.numcalificacion() OWNER TO postgres;

--
-- TOC entry 262 (class 1255 OID 24648)
-- Name: numperf(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.numperf() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE perfilcount INTEGER;
BEGIN
SELECT COUNT(*) INTO perfilcount FROM "Perfil" WHERE "Email" =NEW."Email";

IF perfilcount = 5 THEN
	RAISE EXCEPTION 'Solo pueden existir 5 perfiles por usuario';
END IF;

RETURN NEW;
END
$$;


ALTER FUNCTION public.numperf() OWNER TO postgres;

--
-- TOC entry 263 (class 1255 OID 24649)
-- Name: numrating(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.numrating() RETURNS trigger
    LANGUAGE plpgsql
    AS $$BEGIN

IF new."Rating" < 1 OR new."Rating" > 5 THEN
	RAISE EXCEPTION 'El rating debe ser un numero entre 1 y 5';
END IF;

RETURN NEW;
END;
$$;


ALTER FUNCTION public.numrating() OWNER TO postgres;

--
-- TOC entry 264 (class 1255 OID 24650)
-- Name: numusuarios(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.numusuarios() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
declare num integer;
begin

select count(*) into num from "Usuario" where "Nombre" = new."Nombre" or "Apellido" = new."Apellido";

if num > 0 then
	raise exception 'No pueden existir varios usuarios con el mismo nombre o apellido';
end if;
return new;
end;
$$;


ALTER FUNCTION public.numusuarios() OWNER TO postgres;

--
-- TOC entry 265 (class 1255 OID 24651)
-- Name: rolpersonaje(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.rolpersonaje() RETURNS trigger
    LANGUAGE plpgsql
    AS $$begin

if new."Rol" != 'Antagonista' AND new."Rol" != 'Protagonista' AND new."Rol" != 'Secundario' then
	raise exception 'Un personaje solo puede ser "Protagonista", "Antagonista" o "Secundario"';
end if;
return new;
end;
$$;


ALTER FUNCTION public.rolpersonaje() OWNER TO postgres;

--
-- TOC entry 267 (class 1255 OID 24652)
-- Name: tipoactor(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.tipoactor() RETURNS trigger
    LANGUAGE plpgsql
    AS $$begin

if new."Tipo_Actor" != 'Interpretado' AND new."Tipo_Actor" != 'Presta su voz' then
	raise exception 'Un actor solo puede Interpretar un personaje o Prestar su Voz';
end if;
return new;
end;
$$;


ALTER FUNCTION public.tipoactor() OWNER TO postgres;

--
-- TOC entry 266 (class 1255 OID 24653)
-- Name: tiposuscripciones(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.tiposuscripciones() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
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
$$;


ALTER FUNCTION public.tiposuscripciones() OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 214 (class 1259 OID 24654)
-- Name: Aparece; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Aparece" (
    "N_Organizacion" text NOT NULL,
    "N_Titulo" text NOT NULL,
    "Estado" text NOT NULL,
    "Rol" text NOT NULL,
    CONSTRAINT "Aparece_Rol_check" CHECK ((("Rol" = 'Antagonista'::text) OR ("Rol" = 'Protagonista'::text) OR ("Rol" = 'Secundario'::text)))
);


ALTER TABLE public."Aparece" OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 24660)
-- Name: Cargo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Cargo" (
    "Cod_Cargo" integer NOT NULL,
    "Descripcion" text NOT NULL
);


ALTER TABLE public."Cargo" OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 24665)
-- Name: Cargo_Cod_Cargo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Cargo_Cod_Cargo_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Cargo_Cod_Cargo_seq" OWNER TO postgres;

--
-- TOC entry 3717 (class 0 OID 0)
-- Dependencies: 216
-- Name: Cargo_Cod_Cargo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Cargo_Cod_Cargo_seq" OWNED BY public."Cargo"."Cod_Cargo";


--
-- TOC entry 217 (class 1259 OID 24666)
-- Name: Ciudad; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Ciudad" (
    "Id_Ciudad" integer NOT NULL,
    "Nombre" text NOT NULL,
    "Id_Estado" integer NOT NULL
);


ALTER TABLE public."Ciudad" OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 24671)
-- Name: Ciudad_Id_Ciudad_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Ciudad_Id_Ciudad_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Ciudad_Id_Ciudad_seq" OWNER TO postgres;

--
-- TOC entry 3718 (class 0 OID 0)
-- Dependencies: 218
-- Name: Ciudad_Id_Ciudad_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Ciudad_Id_Ciudad_seq" OWNED BY public."Ciudad"."Id_Ciudad";


--
-- TOC entry 219 (class 1259 OID 24672)
-- Name: Civil; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Civil" (
    "N_Civil" text NOT NULL
);


ALTER TABLE public."Civil" OWNER TO postgres;

--
-- TOC entry 256 (class 1259 OID 25538)
-- Name: Combate; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Combate" (
    "N_Personaje" text NOT NULL,
    "N_Poder" text NOT NULL,
    "N_Objeto" text NOT NULL,
    "Fecha" date NOT NULL,
    "Lugar" text NOT NULL
);


ALTER TABLE public."Combate" OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 24682)
-- Name: Crea; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Crea" (
    "N_Personaje" text NOT NULL,
    "N_Objeto" text NOT NULL
);


ALTER TABLE public."Crea" OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 24687)
-- Name: Creador; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Creador" (
    "Nom_Creador" text NOT NULL
);


ALTER TABLE public."Creador" OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 24692)
-- Name: Enfrenta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Enfrenta" (
    "N_Heroe" text NOT NULL,
    "N_Villano" text NOT NULL
);


ALTER TABLE public."Enfrenta" OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 24697)
-- Name: Esta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Esta" (
    "N_Personaje" text NOT NULL,
    "N_Titulo" text NOT NULL,
    "Tipo_Actor" text NOT NULL,
    "Rol" text NOT NULL,
    "Actor" text NOT NULL,
    CONSTRAINT "Esta_Rol_check" CHECK ((("Rol" = 'Antagonista'::text) OR ("Rol" = 'Protagonista'::text) OR ("Rol" = 'Secundario'::text))),
    CONSTRAINT "Esta_Tipo_Actor_check" CHECK ((("Tipo_Actor" = 'Interpretado'::text) OR ("Tipo_Actor" = 'Presta su voz'::text)))
);


ALTER TABLE public."Esta" OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 24704)
-- Name: Estado; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Estado" (
    "Id_Estado" integer NOT NULL,
    "Nombre" text NOT NULL,
    "Id_Pais" integer NOT NULL
);


ALTER TABLE public."Estado" OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 24709)
-- Name: Estado_Id_Estado_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Estado_Id_Estado_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Estado_Id_Estado_seq" OWNER TO postgres;

--
-- TOC entry 3719 (class 0 OID 0)
-- Dependencies: 225
-- Name: Estado_Id_Estado_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Estado_Id_Estado_seq" OWNED BY public."Estado"."Id_Estado";


--
-- TOC entry 226 (class 1259 OID 24710)
-- Name: Heroe; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Heroe" (
    "N_Heroe" text NOT NULL,
    "Alias" text NOT NULL,
    "Logotipo" text,
    "Color_Traje" text,
    "Archienemigo" text,
    CONSTRAINT "Heroe_Color_Traje_check" CHECK ((("Color_Traje" !~~ '%0%'::text) AND ("Color_Traje" !~~ '%1%'::text) AND ("Color_Traje" !~~ '%2%'::text) AND ("Color_Traje" !~~ '%3%'::text) AND ("Color_Traje" !~~ '%4%'::text) AND ("Color_Traje" !~~ '%5%'::text) AND ("Color_Traje" !~~ '%6%'::text) AND ("Color_Traje" !~~ '%7%'::text) AND ("Color_Traje" !~~ '%8%'::text) AND ("Color_Traje" !~~ '%9%'::text)))
);


ALTER TABLE public."Heroe" OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 24716)
-- Name: Historial; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Historial" (
    "N_Titulo" text NOT NULL,
    "Id_Perfil" integer NOT NULL,
    "Calificacion" integer NOT NULL,
    "Hora_Inicio" date NOT NULL,
    "Hora_Fin" date NOT NULL,
    CONSTRAINT "Historial_Calificacion_check" CHECK ((("Calificacion" >= 1) AND ("Calificacion" <= 5)))
);


ALTER TABLE public."Historial" OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 24722)
-- Name: Juego; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Juego" (
    "T_Juego" text NOT NULL,
    "Distribuidor" text NOT NULL,
    "Tipo" text NOT NULL
);


ALTER TABLE public."Juego" OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 24727)
-- Name: Medio; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Medio" (
    "Titulo" text NOT NULL,
    "Fecha_Estreno" date NOT NULL,
    "Compania" text NOT NULL,
    "Rating" integer NOT NULL,
    "Sinopsis" text NOT NULL,
    "Imagen" text NOT NULL,
    CONSTRAINT "Medio_Rating_check" CHECK ((("Rating" >= 1) AND ("Rating" <= 5)))
);


ALTER TABLE public."Medio" OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 24733)
-- Name: Nacionalidad; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Nacionalidad" (
    "Nac" text NOT NULL
);


ALTER TABLE public."Nacionalidad" OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 24738)
-- Name: Objeto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Objeto" (
    "Nombre" text NOT NULL,
    "Descripcion" text,
    "Material" text,
    "Tipo" text NOT NULL,
    "Imagen" text NOT NULL,
    "N_Personaje" text
);


ALTER TABLE public."Objeto" OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 24743)
-- Name: Ocupacion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Ocupacion" (
    "Ocup" text NOT NULL
);


ALTER TABLE public."Ocupacion" OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 24748)
-- Name: Organizacion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Organizacion" (
    "Nombre" text NOT NULL,
    "Eslogan" text,
    "Lider" text NOT NULL,
    "Fundador" text NOT NULL,
    "Tipo" text,
    "Nom_Comic" text NOT NULL,
    "Imagen" text NOT NULL,
    "Objetivo" text,
    "Lugar_Creacion" text NOT NULL
);


ALTER TABLE public."Organizacion" OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 24753)
-- Name: Pais; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Pais" (
    "Id_Pais" integer NOT NULL,
    "Nombre" text NOT NULL
);


ALTER TABLE public."Pais" OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 24758)
-- Name: Pais_Id_Pais_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Pais_Id_Pais_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Pais_Id_Pais_seq" OWNER TO postgres;

--
-- TOC entry 3720 (class 0 OID 0)
-- Dependencies: 235
-- Name: Pais_Id_Pais_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Pais_Id_Pais_seq" OWNED BY public."Pais"."Id_Pais";


--
-- TOC entry 236 (class 1259 OID 24759)
-- Name: Pelicula; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Pelicula" (
    "T_Pelicula" text NOT NULL,
    "Director" text NOT NULL,
    "Duracion" integer NOT NULL,
    "Coste" integer NOT NULL,
    "Ganancia" integer NOT NULL,
    "Distribuidor" text,
    "Tipo" text,
    CONSTRAINT "Pelicula_Coste_check" CHECK (("Coste" > 0)),
    CONSTRAINT "Pelicula_Duracion_check" CHECK (("Duracion" > 0)),
    CONSTRAINT "Pelicula_Ganancia_check" CHECK (("Ganancia" > 0))
);


ALTER TABLE public."Pelicula" OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 24767)
-- Name: Perfil; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Perfil" (
    "Id_Perfil" integer NOT NULL,
    "Dispositivo" text NOT NULL,
    "Nombre" text NOT NULL,
    "Idioma" text NOT NULL,
    "Email" text NOT NULL,
    "Imagen" integer NOT NULL,
    CONSTRAINT "Perfil_Id_Perfil_check" CHECK (("Id_Perfil" >= 0))
);


ALTER TABLE public."Perfil" OWNER TO postgres;

--
-- TOC entry 238 (class 1259 OID 24773)
-- Name: Perfil_Id_Perfil_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Perfil_Id_Perfil_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Perfil_Id_Perfil_seq" OWNER TO postgres;

--
-- TOC entry 3721 (class 0 OID 0)
-- Dependencies: 238
-- Name: Perfil_Id_Perfil_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Perfil_Id_Perfil_seq" OWNED BY public."Perfil"."Id_Perfil";


--
-- TOC entry 239 (class 1259 OID 24774)
-- Name: Pers_Creador; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Pers_Creador" (
    "N_Personaje" text NOT NULL,
    "N_Creador" text NOT NULL
);


ALTER TABLE public."Pers_Creador" OWNER TO postgres;

--
-- TOC entry 240 (class 1259 OID 24779)
-- Name: Pers_Nac; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Pers_Nac" (
    "N_Personaje" text NOT NULL,
    "Nacionalidad" text NOT NULL
);


ALTER TABLE public."Pers_Nac" OWNER TO postgres;

--
-- TOC entry 241 (class 1259 OID 24784)
-- Name: Pers_Oc; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Pers_Oc" (
    "N_Personaje" text NOT NULL,
    "Ocupacion" text NOT NULL
);


ALTER TABLE public."Pers_Oc" OWNER TO postgres;

--
-- TOC entry 242 (class 1259 OID 24789)
-- Name: Personaje; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Personaje" (
    "Nombre" text NOT NULL,
    "Genero" text,
    "Color_Ojos" text,
    "Color_Pelo" text,
    "Nom_Comic" text NOT NULL,
    "E_Marital" text NOT NULL,
    imagen text NOT NULL,
    CONSTRAINT "Personaje_Color_Ojos_check" CHECK ((("Color_Ojos" !~~ '%0%'::text) AND ("Color_Ojos" !~~ '%1%'::text) AND ("Color_Ojos" !~~ '%2%'::text) AND ("Color_Ojos" !~~ '%3%'::text) AND ("Color_Ojos" !~~ '%4%'::text) AND ("Color_Ojos" !~~ '%5%'::text) AND ("Color_Ojos" !~~ '%6%'::text) AND ("Color_Ojos" !~~ '%7%'::text) AND ("Color_Ojos" !~~ '%8%'::text) AND ("Color_Ojos" !~~ '%9%'::text))),
    CONSTRAINT "Personaje_Color_Pelo_check" CHECK ((("Color_Pelo" !~~ '%0%'::text) AND ("Color_Pelo" !~~ '%1%'::text) AND ("Color_Pelo" !~~ '%2%'::text) AND ("Color_Pelo" !~~ '%3%'::text) AND ("Color_Pelo" !~~ '%4%'::text) AND ("Color_Pelo" !~~ '%5%'::text) AND ("Color_Pelo" !~~ '%6%'::text) AND ("Color_Pelo" !~~ '%7%'::text) AND ("Color_Pelo" !~~ '%8%'::text) AND ("Color_Pelo" !~~ '%9%'::text))),
    CONSTRAINT "Personaje_E_Marital_check" CHECK ((("E_Marital" = 'Soltero'::text) OR ("E_Marital" = 'Casado'::text) OR ("E_Marital" = 'Viudo'::text) OR ("E_Marital" = 'Divorciado'::text))),
    CONSTRAINT "Personaje_Genero_check" CHECK ((("Genero" = 'M'::text) OR ("Genero" = 'F'::text) OR ("Genero" = 'Desc'::text) OR ("Genero" = 'Otro'::text)))
);


ALTER TABLE public."Personaje" OWNER TO postgres;

--
-- TOC entry 243 (class 1259 OID 24798)
-- Name: Pertenece; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Pertenece" (
    "N_Personaje" text NOT NULL,
    "N_Organizacion" text NOT NULL,
    "Cod_Cargo" integer NOT NULL
);


ALTER TABLE public."Pertenece" OWNER TO postgres;

--
-- TOC entry 244 (class 1259 OID 24803)
-- Name: Plat_Juego; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Plat_Juego" (
    "T_Juego" text NOT NULL,
    "Plataforma" text NOT NULL
);


ALTER TABLE public."Plat_Juego" OWNER TO postgres;

--
-- TOC entry 245 (class 1259 OID 24808)
-- Name: Plataforma; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Plataforma" (
    nombre text NOT NULL
);


ALTER TABLE public."Plataforma" OWNER TO postgres;

--
-- TOC entry 246 (class 1259 OID 24813)
-- Name: Poder; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Poder" (
    "Nombre" text NOT NULL,
    "Imagen" text NOT NULL,
    "Descripcion" text
);


ALTER TABLE public."Poder" OWNER TO postgres;

--
-- TOC entry 247 (class 1259 OID 24818)
-- Name: Posee; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Posee" (
    "N_Personaje" text NOT NULL,
    "N_Poder" text NOT NULL,
    "Obtencion" text NOT NULL,
    CONSTRAINT "Posee_Obtencion_check" CHECK ((("Obtencion" = 'Natural'::text) OR ("Obtencion" = 'Artificial'::text) OR ("Obtencion" = 'Hereditario'::text)))
);


ALTER TABLE public."Posee" OWNER TO postgres;

--
-- TOC entry 248 (class 1259 OID 24824)
-- Name: RelacionadoHer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."RelacionadoHer" (
    "N_Civil" text NOT NULL,
    "N_Heroe" text NOT NULL
);


ALTER TABLE public."RelacionadoHer" OWNER TO postgres;

--
-- TOC entry 249 (class 1259 OID 24829)
-- Name: RelacionadoVill; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."RelacionadoVill" (
    "N_Civil" text NOT NULL,
    "N_Villano" text NOT NULL
);


ALTER TABLE public."RelacionadoVill" OWNER TO postgres;

--
-- TOC entry 250 (class 1259 OID 24834)
-- Name: Sede; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Sede" (
    "Nombre" text NOT NULL,
    "Tipo_Edif" text,
    "Ubicacion" text NOT NULL,
    "Imagen" text NOT NULL,
    "N_Org" text NOT NULL
);


ALTER TABLE public."Sede" OWNER TO postgres;

--
-- TOC entry 251 (class 1259 OID 24839)
-- Name: Serie; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Serie" (
    "T_Serie" text NOT NULL,
    "N_Episodios" integer NOT NULL,
    "Creador" text NOT NULL,
    "Canal" text NOT NULL
);


ALTER TABLE public."Serie" OWNER TO postgres;

--
-- TOC entry 252 (class 1259 OID 24844)
-- Name: Suscripcion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Suscripcion" (
    "ID" integer NOT NULL,
    "Tarifa" real NOT NULL,
    "Descripcion" text NOT NULL,
    "Tipo" text NOT NULL,
    CONSTRAINT "Suscripcion_Tarifa_check" CHECK (("Tarifa" >= (0)::double precision)),
    CONSTRAINT "Suscripcion_Tipo_check" CHECK ((("Tipo" = 'Gold'::text) OR ("Tipo" = 'Vip'::text) OR ("Tipo" = 'Premium'::text) OR ("Tipo" = 'Free'::text)))
);


ALTER TABLE public."Suscripcion" OWNER TO postgres;

--
-- TOC entry 253 (class 1259 OID 24851)
-- Name: Tarjeta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Tarjeta" (
    "N_Tarjeta" text NOT NULL,
    "Cod_Seguridad" integer NOT NULL,
    "Fecha_Ven" date NOT NULL,
    CONSTRAINT "Tarjeta_Cod_Seguridad_check" CHECK ((("Cod_Seguridad" >= 100) AND ("Cod_Seguridad" <= 999))),
    CONSTRAINT "Tarjeta_N_Tarjeta_check" CHECK ((char_length("N_Tarjeta") = 16))
);


ALTER TABLE public."Tarjeta" OWNER TO postgres;

--
-- TOC entry 254 (class 1259 OID 24858)
-- Name: Usuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Usuario" (
    "Email" text NOT NULL,
    "Contrasena" text NOT NULL,
    "Nombre" text NOT NULL,
    "Apellido" text NOT NULL,
    "Fecha_Nac" date NOT NULL,
    "Fecha_Creacion" date NOT NULL,
    "Id_Suscripcion" integer NOT NULL,
    "N_Tarjeta" text,
    "Direccion" integer NOT NULL,
    CONSTRAINT "Usuario_Email_check" CHECK ((("Email" ~~ '%@%'::text) AND ("Email" ~~ '%.%'::text)))
);


ALTER TABLE public."Usuario" OWNER TO postgres;

--
-- TOC entry 255 (class 1259 OID 24864)
-- Name: Villano; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Villano" (
    "N_Villano" text NOT NULL,
    "Alias" text NOT NULL,
    "Objetivo" text
);


ALTER TABLE public."Villano" OWNER TO postgres;

--
-- TOC entry 3336 (class 2604 OID 24869)
-- Name: Cargo Cod_Cargo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Cargo" ALTER COLUMN "Cod_Cargo" SET DEFAULT nextval('public."Cargo_Cod_Cargo_seq"'::regclass);


--
-- TOC entry 3337 (class 2604 OID 24870)
-- Name: Ciudad Id_Ciudad; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Ciudad" ALTER COLUMN "Id_Ciudad" SET DEFAULT nextval('public."Ciudad_Id_Ciudad_seq"'::regclass);


--
-- TOC entry 3338 (class 2604 OID 24871)
-- Name: Estado Id_Estado; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Estado" ALTER COLUMN "Id_Estado" SET DEFAULT nextval('public."Estado_Id_Estado_seq"'::regclass);


--
-- TOC entry 3339 (class 2604 OID 24872)
-- Name: Pais Id_Pais; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Pais" ALTER COLUMN "Id_Pais" SET DEFAULT nextval('public."Pais_Id_Pais_seq"'::regclass);


--
-- TOC entry 3340 (class 2604 OID 24873)
-- Name: Perfil Id_Perfil; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Perfil" ALTER COLUMN "Id_Perfil" SET DEFAULT nextval('public."Perfil_Id_Perfil_seq"'::regclass);


--
-- TOC entry 3669 (class 0 OID 24654)
-- Dependencies: 214
-- Data for Name: Aparece; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Aparece" ("N_Organizacion", "N_Titulo", "Estado", "Rol") VALUES ('Vengadores', 'Los Vengadores', 'Activo', 'Protagonista');
INSERT INTO public."Aparece" ("N_Organizacion", "N_Titulo", "Estado", "Rol") VALUES ('SHIELD', 'Los Vengadores', 'Activo', 'Secundario');
INSERT INTO public."Aparece" ("N_Organizacion", "N_Titulo", "Estado", "Rol") VALUES ('SHIELD', 'Iron Man 2', 'Activo', 'Secundario');
INSERT INTO public."Aparece" ("N_Organizacion", "N_Titulo", "Estado", "Rol") VALUES ('Hydra', 'Capitán América: el primer vengador', 'Activo', 'Antagonista');
INSERT INTO public."Aparece" ("N_Organizacion", "N_Titulo", "Estado", "Rol") VALUES ('Vengadores', 'Los Vengadores 2: La era de ultron', 'Activo', 'Protagonista');
INSERT INTO public."Aparece" ("N_Organizacion", "N_Titulo", "Estado", "Rol") VALUES ('SHIELD', 'Capitán América: El soldado del invierno', 'Activo', 'Secundario');
INSERT INTO public."Aparece" ("N_Organizacion", "N_Titulo", "Estado", "Rol") VALUES ('Hydra', 'Capitán América: El soldado del invierno', 'Activo', 'Antagonista');
INSERT INTO public."Aparece" ("N_Organizacion", "N_Titulo", "Estado", "Rol") VALUES ('Guardianes de la Galaxia', 'Guardianes de la Galaxia', 'Activa', 'Protagonista');


--
-- TOC entry 3670 (class 0 OID 24660)
-- Dependencies: 215
-- Data for Name: Cargo; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Cargo" ("Cod_Cargo", "Descripcion") VALUES (100, 'Lider');
INSERT INTO public."Cargo" ("Cod_Cargo", "Descripcion") VALUES (101, 'Cofundador');
INSERT INTO public."Cargo" ("Cod_Cargo", "Descripcion") VALUES (102, 'Agente');
INSERT INTO public."Cargo" ("Cod_Cargo", "Descripcion") VALUES (103, 'Profesor');


--
-- TOC entry 3672 (class 0 OID 24666)
-- Dependencies: 217
-- Data for Name: Ciudad; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Ciudad" ("Id_Ciudad", "Nombre", "Id_Estado") VALUES (111, 'Caracas', 11);
INSERT INTO public."Ciudad" ("Id_Ciudad", "Nombre", "Id_Estado") VALUES (112, 'Ciudad de Bogota', 12);
INSERT INTO public."Ciudad" ("Id_Ciudad", "Nombre", "Id_Estado") VALUES (113, 'Los Teques', 21);
INSERT INTO public."Ciudad" ("Id_Ciudad", "Nombre", "Id_Estado") VALUES (114, 'Caldas', 22);


--
-- TOC entry 3674 (class 0 OID 24672)
-- Dependencies: 219
-- Data for Name: Civil; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Civil" ("N_Civil") VALUES ('Eitri');
INSERT INTO public."Civil" ("N_Civil") VALUES ('Howard Stark');


--
-- TOC entry 3711 (class 0 OID 25538)
-- Dependencies: 256
-- Data for Name: Combate; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Combate" ("N_Personaje", "N_Poder", "N_Objeto", "Fecha", "Lugar") VALUES ('Thor Odinson', 'Manipulación de la electricidad', 'Mjolnir', '2011-04-17', 'Nuevo México');
INSERT INTO public."Combate" ("N_Personaje", "N_Poder", "N_Objeto", "Fecha", "Lugar") VALUES ('Thor Odinson', 'Super Fuerza', 'Mjolnir', '2011-04-17', 'Nuevo México');
INSERT INTO public."Combate" ("N_Personaje", "N_Poder", "N_Objeto", "Fecha", "Lugar") VALUES ('Thor Odinson', 'Manipulación de la electricidad', 'Mjolnir', '2012-05-04', 'Nueva York');
INSERT INTO public."Combate" ("N_Personaje", "N_Poder", "N_Objeto", "Fecha", "Lugar") VALUES ('Thor Odinson', 'Super Fuerza', 'Mjolnir', '2012-05-04', 'Nueva York');
INSERT INTO public."Combate" ("N_Personaje", "N_Poder", "N_Objeto", "Fecha", "Lugar") VALUES ('Thor Odinson', 'Volar', 'Mjolnir', '2012-05-04', 'Nueva York');
INSERT INTO public."Combate" ("N_Personaje", "N_Poder", "N_Objeto", "Fecha", "Lugar") VALUES ('Tony Stark', 'No Poder', 'Mark III', '2012-05-04', 'Nueva York');
INSERT INTO public."Combate" ("N_Personaje", "N_Poder", "N_Objeto", "Fecha", "Lugar") VALUES ('Tony Stark', 'No Poder', 'Mark III', '2010-04-28', 'Nueva York');
INSERT INTO public."Combate" ("N_Personaje", "N_Poder", "N_Objeto", "Fecha", "Lugar") VALUES ('Tony Stark', 'No Poder', 'Mark III', '2008-02-05', 'Los Angeles');
INSERT INTO public."Combate" ("N_Personaje", "N_Poder", "N_Objeto", "Fecha", "Lugar") VALUES ('Loki Laufeyson', 'Super Fuerza', 'Cetro de Loki', '2012-05-04', 'Nueva York');
INSERT INTO public."Combate" ("N_Personaje", "N_Poder", "N_Objeto", "Fecha", "Lugar") VALUES ('Loki Laufeyson', 'Ilusionista', 'Cetro de Loki', '2012-05-04', 'Nueva York');
INSERT INTO public."Combate" ("N_Personaje", "N_Poder", "N_Objeto", "Fecha", "Lugar") VALUES ('Steve Rogers', 'Super Fuerza', 'Escudo del Capitán América', '2012-05-04', 'Nueva York');
INSERT INTO public."Combate" ("N_Personaje", "N_Poder", "N_Objeto", "Fecha", "Lugar") VALUES ('Steve Rogers', 'Super Fuerza', 'Escudo del Capitán América', '1945-04-22', 'Alemania');
INSERT INTO public."Combate" ("N_Personaje", "N_Poder", "N_Objeto", "Fecha", "Lugar") VALUES ('Johann Schmidt', 'Super Fuerza', 'No Objeto', '1945-04-22', 'Alemania');
INSERT INTO public."Combate" ("N_Personaje", "N_Poder", "N_Objeto", "Fecha", "Lugar") VALUES ('Clint Barton', 'No Poder', 'Arco Compuesto', '2012-05-04', 'Nueva York');
INSERT INTO public."Combate" ("N_Personaje", "N_Poder", "N_Objeto", "Fecha", "Lugar") VALUES ('Peter Quill', 'No Poder', 'Gema del Poder', '2014-07-21', 'Xandar');
INSERT INTO public."Combate" ("N_Personaje", "N_Poder", "N_Objeto", "Fecha", "Lugar") VALUES ('Tony Stark', 'No Poder', 'Mark III', '2013-05-03', 'Los Angeles');
INSERT INTO public."Combate" ("N_Personaje", "N_Poder", "N_Objeto", "Fecha", "Lugar") VALUES ('Tony Stark', 'No Poder', 'Mark III', '2015-05-01', 'Sokovia');
INSERT INTO public."Combate" ("N_Personaje", "N_Poder", "N_Objeto", "Fecha", "Lugar") VALUES ('Thor Odinson', 'Super Fuerza', 'Mjolnir', '2013-11-08', 'Londres');
INSERT INTO public."Combate" ("N_Personaje", "N_Poder", "N_Objeto", "Fecha", "Lugar") VALUES ('Thor Odinson', 'Volar', 'Mjolnir', '2013-11-08', 'Londres');
INSERT INTO public."Combate" ("N_Personaje", "N_Poder", "N_Objeto", "Fecha", "Lugar") VALUES ('Thor Odinson', 'Manipulación de la electricidad', 'Mjolnir', '2013-11-08', 'Londres');
INSERT INTO public."Combate" ("N_Personaje", "N_Poder", "N_Objeto", "Fecha", "Lugar") VALUES ('Thor Odinson', 'Super Fuerza', 'Mjolnir', '2015-05-01', 'Sokovia');
INSERT INTO public."Combate" ("N_Personaje", "N_Poder", "N_Objeto", "Fecha", "Lugar") VALUES ('Thor Odinson', 'Volar', 'Mjolnir', '2015-05-01', 'Sokovia');
INSERT INTO public."Combate" ("N_Personaje", "N_Poder", "N_Objeto", "Fecha", "Lugar") VALUES ('Thor Odinson', 'Manipulación de la electricidad', 'Mjolnir', '2015-05-01', 'Sokovia');
INSERT INTO public."Combate" ("N_Personaje", "N_Poder", "N_Objeto", "Fecha", "Lugar") VALUES ('Steve Rogers', 'Super Fuerza', 'Escudo del Capitán América', '2014-04-04', 'Washinton');
INSERT INTO public."Combate" ("N_Personaje", "N_Poder", "N_Objeto", "Fecha", "Lugar") VALUES ('Steve Rogers', 'Super Fuerza', 'Escudo del Capitán América', '2015-05-01', 'Sokovia');
INSERT INTO public."Combate" ("N_Personaje", "N_Poder", "N_Objeto", "Fecha", "Lugar") VALUES ('Clint Barton', 'No Poder', 'Arco Compuesto', '2015-05-01', 'Sokovia');


--
-- TOC entry 3675 (class 0 OID 24682)
-- Dependencies: 220
-- Data for Name: Crea; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Crea" ("N_Personaje", "N_Objeto") VALUES ('Tony Stark', 'Mark III');
INSERT INTO public."Crea" ("N_Personaje", "N_Objeto") VALUES ('Eitri', 'Mjolnir');
INSERT INTO public."Crea" ("N_Personaje", "N_Objeto") VALUES ('Howard Stark', 'Escudo del Capitán América');
INSERT INTO public."Crea" ("N_Personaje", "N_Objeto") VALUES ('Obadiah Stane', 'IM Mark Uno');
INSERT INTO public."Crea" ("N_Personaje", "N_Objeto") VALUES ('Otto Octavius', 'Arnes de pulpo');


--
-- TOC entry 3676 (class 0 OID 24687)
-- Dependencies: 221
-- Data for Name: Creador; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Creador" ("Nom_Creador") VALUES ('Stan Lee');
INSERT INTO public."Creador" ("Nom_Creador") VALUES ('Larry Lieber');
INSERT INTO public."Creador" ("Nom_Creador") VALUES ('Joe Simon');
INSERT INTO public."Creador" ("Nom_Creador") VALUES ('Jack Kirby');
INSERT INTO public."Creador" ("Nom_Creador") VALUES ('Don Rico');
INSERT INTO public."Creador" ("Nom_Creador") VALUES ('Don Heck');
INSERT INTO public."Creador" ("Nom_Creador") VALUES ('Brian Michael Bendis');
INSERT INTO public."Creador" ("Nom_Creador") VALUES ('David Finch');
INSERT INTO public."Creador" ("Nom_Creador") VALUES ('Len Wein');
INSERT INTO public."Creador" ("Nom_Creador") VALUES ('John Romita');
INSERT INTO public."Creador" ("Nom_Creador") VALUES ('Tony Stark');
INSERT INTO public."Creador" ("Nom_Creador") VALUES ('Eitri');
INSERT INTO public."Creador" ("Nom_Creador") VALUES ('Dave Cockrum');
INSERT INTO public."Creador" ("Nom_Creador") VALUES ('Steve Ditko');
INSERT INTO public."Creador" ("Nom_Creador") VALUES ('Gil Kane');
INSERT INTO public."Creador" ("Nom_Creador") VALUES ('Dennis O Niel');
INSERT INTO public."Creador" ("Nom_Creador") VALUES ('Archie Goodwin');
INSERT INTO public."Creador" ("Nom_Creador") VALUES ('David Michelinie');


--
-- TOC entry 3677 (class 0 OID 24692)
-- Dependencies: 222
-- Data for Name: Enfrenta; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3678 (class 0 OID 24697)
-- Dependencies: 223
-- Data for Name: Esta; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") VALUES ('Tony Stark', 'Iron Man', 'Interpretado', 'Protagonista', 'Robert Downey Jr');
INSERT INTO public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") VALUES ('Tony Stark', 'Iron Man 2', 'Interpretado', 'Protagonista', 'Robert Downey Jr');
INSERT INTO public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") VALUES ('Tony Stark', 'Los Vengadores', 'Interpretado', 'Protagonista', 'Robert Downey Jr');
INSERT INTO public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") VALUES ('Bruce Banner', 'The Incredible Hulk', 'Interpretado', 'Protagonista', 'Edward Norton');
INSERT INTO public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") VALUES ('Bruce Banner', 'Los Vengadores', 'Interpretado', 'Protagonista', 'Mark Ruffalo');
INSERT INTO public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") VALUES ('Thor Odinson', 'Thor', 'Interpretado', 'Protagonista', 'Chris Hemsworth');
INSERT INTO public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") VALUES ('Steve Rogers', 'Capitán América: el primer vengador', 'Interpretado', 'Protagonista', 'Chris Evans');
INSERT INTO public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") VALUES ('Steve Rogers', 'Los Vengadores', 'Interpretado', 'Protagonista', 'Chris Evans');
INSERT INTO public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") VALUES ('Thor Odinson', 'Los Vengadores', 'Interpretado', 'Protagonista', 'Chris Evans');
INSERT INTO public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") VALUES ('Natasha Romanoff', 'Iron Man 2', 'Interpretado', 'Secundario', 'Scarlett Johansson');
INSERT INTO public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") VALUES ('Natasha Romanoff', 'Los Vengadores', 'Interpretado', 'Protagonista', 'Scarlett Johansson');
INSERT INTO public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") VALUES ('Clint Barton', 'Los Vengadores', 'Interpretado', 'Protagonista', 'Jeremy Renner');
INSERT INTO public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") VALUES ('Nicholas Fury', 'Iron Man 2', 'Interpretado', 'Secundario', 'Samuel L Jackson');
INSERT INTO public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") VALUES ('Nicholas Fury', 'Los Vengadores', 'Interpretado', 'Secundario', 'Samuel L Jackson');
INSERT INTO public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") VALUES ('Maria Hill', 'Los Vengadores', 'Interpretado', 'Secundario', 'Cobie Smulders');
INSERT INTO public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") VALUES ('Emil Blonsky', 'The Incredible Hulk', 'Interpretado', 'Antagonista', 'Tim Roth');
INSERT INTO public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") VALUES ('Johann Schmidt', 'Capitán América: el primer vengador', 'Interpretado', 'Antagonista', 'Hugo Weaving');
INSERT INTO public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") VALUES ('Loki Laufeyson', 'Thor', 'Interpretado', 'Secundario', 'Tom Hiddleston');
INSERT INTO public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") VALUES ('Loki Laufeyson', 'Los Vengadores', 'Interpretado', 'Antagonista', 'Tom Hiddleston');
INSERT INTO public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") VALUES ('Obadiah Stane', 'Iron Man', 'Interpretado', 'Antagonista', 'Jeff Bridges');
INSERT INTO public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") VALUES ('Matt Murdock', 'Marvels The Defenders', 'Interpretado', 'Protagonista', 'Charlie Cox');
INSERT INTO public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") VALUES ('Jessica Jones', 'Marvels The Defenders', 'Interpretado', 'Protagonista', 'Krysten Ritter');
INSERT INTO public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") VALUES ('Jessica Jones', 'Marvels Jessica Jones', 'Interpretado', 'Protagonista', 'Krysten Ritter');
INSERT INTO public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") VALUES ('Luke Cage', 'Marvels The Defenders', 'Interpretado', 'Protagonista', 'Mike Colter');
INSERT INTO public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") VALUES ('Luke Cage', 'Marvels Luke Cage', 'Interpretado', 'Protagonista', 'Mike Colter');
INSERT INTO public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") VALUES ('Daniel Rand', 'Marvels The Defenders', 'Interpretado', 'Protagonista', 'Finn Jones');
INSERT INTO public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") VALUES ('Daniel Rand', 'Marvels Iron Fist', 'Interpretado', 'Protagonista', 'Finn Jones');
INSERT INTO public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") VALUES ('Frank Castle', 'Marvels The Punisher', 'Interpretado', 'Protagonista', 'Jon Bernthal');
INSERT INTO public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") VALUES ('Matt Murdock', 'Marvels Daredevil', 'Interpretado', 'Protagonista', 'Charlie Cox');
INSERT INTO public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") VALUES ('Frank Castle', 'Marvels Daredevil', 'Interpretado', 'Secundario', 'Jon Bernthal');
INSERT INTO public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") VALUES ('Wilson Fisk', 'Marvels Daredevil', 'Interpretado', 'Antagonista', 'Vincent Donofrio');
INSERT INTO public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") VALUES ('Tony Stark', 'Iron Man 3', 'Interpretado', 'Protagonista', 'Robert Downey Jr');
INSERT INTO public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") VALUES ('Thor Odinson', 'Thor: Un mundo oscuro', 'Interpretado', 'Protagonista', 'Chris Hemsworth');
INSERT INTO public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") VALUES ('Steve Rogers', 'Capitán América: El soldado del invierno', 'Interpretado', 'Protagonista', 'Chris Evans');
INSERT INTO public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") VALUES ('Natasha Romanoff', 'Capitán América: El soldado del invierno', 'Interpretado', 'Secundario', 'Scarlett Johansson');
INSERT INTO public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") VALUES ('Natasha Romanoff', 'Los Vengadores 2: La era de ultron', 'Interpretado', 'Protagonista', 'Scarlett Johansson');
INSERT INTO public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") VALUES ('Steve Rogers', 'Los Vengadores 2: La era de ultron', 'Interpretado', 'Protagonista', 'Chris Evans');
INSERT INTO public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") VALUES ('Tony Stark', 'Los Vengadores 2: La era de ultron', 'Interpretado', 'Protagonista', 'Robert Downey Jr');
INSERT INTO public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") VALUES ('Thor Odinson', 'Los Vengadores 2: La era de ultron', 'Interpretado', 'Protagonista', 'Chris Hemsworth');
INSERT INTO public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") VALUES ('Clint Barton', 'Los Vengadores 2: La era de ultron', 'Interpretado', 'Protagonista', 'Jeremy Renner');
INSERT INTO public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") VALUES ('Bruce Banner', 'Los Vengadores 2: La era de ultron', 'Interpretado', 'Protagonista', 'Mark Ruffalo');
INSERT INTO public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") VALUES ('Peter Quill', 'Guardianes de la Galaxia', 'Interpretado', 'Protagonista', 'Chris Pratt');
INSERT INTO public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") VALUES ('Gamora', 'Guardianes de la Galaxia', 'Interpretado', 'Protagonista', 'Zoe Seldaña');
INSERT INTO public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") VALUES ('Drax', 'Guardianes de la Galaxia', 'Interpretado', 'Protagonista', 'Dave Bautista');
INSERT INTO public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") VALUES ('Groot', 'Guardianes de la Galaxia', 'Presta su voz', 'Protagonista', 'Vin Diesel');
INSERT INTO public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") VALUES ('Ratchet', 'Guardianes de la Galaxia', 'Presta su voz', 'Protagonista', 'Bradley Cooper');
INSERT INTO public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") VALUES ('Ronan', 'Guardianes de la Galaxia', 'Interpretado', 'Antagonista', 'Lee Pace');
INSERT INTO public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") VALUES ('Nebula', 'Guardianes de la Galaxia', 'Interpretado', 'Secundario', 'Karen Gillan');


--
-- TOC entry 3679 (class 0 OID 24704)
-- Dependencies: 224
-- Data for Name: Estado; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Estado" ("Id_Estado", "Nombre", "Id_Pais") VALUES (11, 'Distrito Capital', 1);
INSERT INTO public."Estado" ("Id_Estado", "Nombre", "Id_Pais") VALUES (21, 'Miranda', 1);
INSERT INTO public."Estado" ("Id_Estado", "Nombre", "Id_Pais") VALUES (12, 'Bogota', 2);
INSERT INTO public."Estado" ("Id_Estado", "Nombre", "Id_Pais") VALUES (22, 'Medellin', 2);


--
-- TOC entry 3681 (class 0 OID 24710)
-- Dependencies: 226
-- Data for Name: Heroe; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Heroe" ("N_Heroe", "Alias", "Logotipo", "Color_Traje", "Archienemigo") VALUES ('Tony Stark', 'Iron Man', NULL, 'Rojo y Dorado', NULL);
INSERT INTO public."Heroe" ("N_Heroe", "Alias", "Logotipo", "Color_Traje", "Archienemigo") VALUES ('Clint Barton', 'Ojo de Halcón', NULL, 'Morado y Negro', NULL);
INSERT INTO public."Heroe" ("N_Heroe", "Alias", "Logotipo", "Color_Traje", "Archienemigo") VALUES ('Nicholas Fury', 'Nick Fury', NULL, 'Negro', NULL);
INSERT INTO public."Heroe" ("N_Heroe", "Alias", "Logotipo", "Color_Traje", "Archienemigo") VALUES ('Maria Hill', 'Comandante Maria Hill', NULL, 'Negro', NULL);
INSERT INTO public."Heroe" ("N_Heroe", "Alias", "Logotipo", "Color_Traje", "Archienemigo") VALUES ('Sharon Carter', 'Agente 13', NULL, 'Blanco', NULL);
INSERT INTO public."Heroe" ("N_Heroe", "Alias", "Logotipo", "Color_Traje", "Archienemigo") VALUES ('Charles Xavier', 'Profesor X', NULL, 'Negro', NULL);
INSERT INTO public."Heroe" ("N_Heroe", "Alias", "Logotipo", "Color_Traje", "Archienemigo") VALUES ('Logan Howlett', 'Wolverine', NULL, 'Amarillo y Negro', NULL);
INSERT INTO public."Heroe" ("N_Heroe", "Alias", "Logotipo", "Color_Traje", "Archienemigo") VALUES ('Ororo Munroe', 'Tormenta', NULL, 'Negro', NULL);
INSERT INTO public."Heroe" ("N_Heroe", "Alias", "Logotipo", "Color_Traje", "Archienemigo") VALUES ('Jessica Jones', 'Jessica Jones', 'imagen jessica', 'Negro', NULL);
INSERT INTO public."Heroe" ("N_Heroe", "Alias", "Logotipo", "Color_Traje", "Archienemigo") VALUES ('Luke Cage', 'Luke Cage', 'imagen luke', 'amarillo', NULL);
INSERT INTO public."Heroe" ("N_Heroe", "Alias", "Logotipo", "Color_Traje", "Archienemigo") VALUES ('Daniel Rand', 'Iron Fist', 'imagen fist', 'Amarillo y Verde', NULL);
INSERT INTO public."Heroe" ("N_Heroe", "Alias", "Logotipo", "Color_Traje", "Archienemigo") VALUES ('Frank Castle', 'Punisher', 'imagen punisher', 'Negro y Blanco', NULL);
INSERT INTO public."Heroe" ("N_Heroe", "Alias", "Logotipo", "Color_Traje", "Archienemigo") VALUES ('Steve Rogers', 'Capitan America', NULL, 'Azul, Blanco y Rojo', 'Johann Schmidt');
INSERT INTO public."Heroe" ("N_Heroe", "Alias", "Logotipo", "Color_Traje", "Archienemigo") VALUES ('Matt Murdock', 'Daredevil', 'imagen daredevil', 'Rojo', 'Wilson Fisk');
INSERT INTO public."Heroe" ("N_Heroe", "Alias", "Logotipo", "Color_Traje", "Archienemigo") VALUES ('Bruce Banner', 'Hulk', NULL, 'Morado', 'Emil Blonsky');
INSERT INTO public."Heroe" ("N_Heroe", "Alias", "Logotipo", "Color_Traje", "Archienemigo") VALUES ('Thor Odinson', 'Thor', NULL, 'Azul, Negro y Rojo', 'Loki Laufeyson');
INSERT INTO public."Heroe" ("N_Heroe", "Alias", "Logotipo", "Color_Traje", "Archienemigo") VALUES ('Natasha Romanoff', 'Viuda Negra', NULL, 'Negro', 'Antonia Dreykov');
INSERT INTO public."Heroe" ("N_Heroe", "Alias", "Logotipo", "Color_Traje", "Archienemigo") VALUES ('Peter Parker', 'Spiderman', NULL, 'Rojo y Azul', 'Otto Octavius');
INSERT INTO public."Heroe" ("N_Heroe", "Alias", "Logotipo", "Color_Traje", "Archienemigo") VALUES ('Peter Quill', 'Star Lord', 'imagen sl', 'Rojo', NULL);
INSERT INTO public."Heroe" ("N_Heroe", "Alias", "Logotipo", "Color_Traje", "Archienemigo") VALUES ('Gamora', 'Gamora', 'imagen ga', 'Morado', NULL);
INSERT INTO public."Heroe" ("N_Heroe", "Alias", "Logotipo", "Color_Traje", "Archienemigo") VALUES ('Drax', 'Drax el Destructor', 'imagen da', 'Negro', NULL);
INSERT INTO public."Heroe" ("N_Heroe", "Alias", "Logotipo", "Color_Traje", "Archienemigo") VALUES ('Groot', 'Groot', 'imagen g', 'Marron', NULL);
INSERT INTO public."Heroe" ("N_Heroe", "Alias", "Logotipo", "Color_Traje", "Archienemigo") VALUES ('Ratchet', 'Ratchet ', 'imagen ra', 'Naranja', NULL);


--
-- TOC entry 3682 (class 0 OID 24716)
-- Dependencies: 227
-- Data for Name: Historial; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3683 (class 0 OID 24722)
-- Dependencies: 228
-- Data for Name: Juego; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3684 (class 0 OID 24727)
-- Dependencies: 229
-- Data for Name: Medio; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Medio" ("Titulo", "Fecha_Estreno", "Compania", "Rating", "Sinopsis", "Imagen") VALUES ('hola', '2023-01-01', 'dsd', 3, 'sdsd', 'fsdfdsfds');
INSERT INTO public."Medio" ("Titulo", "Fecha_Estreno", "Compania", "Rating", "Sinopsis", "Imagen") VALUES ('Iron Man', '2008-02-05', 'Marvel Studios', 5, 'Tony Stark, un genio millonario y fabricante de armas, es secuestrado y obligado a construir un arma devastadora. En cambio, crea una poderosa armadura para escapar. Después de regresar a casa, decide usar su tecnología para convertirse en Iron Man y luchar contra el mal.', 'https://i.redd.it/jecuohkqknl61.jpg');
INSERT INTO public."Medio" ("Titulo", "Fecha_Estreno", "Compania", "Rating", "Sinopsis", "Imagen") VALUES ('The Incredible Hulk', '2008-06-13', 'Marvel Studios', 5, 'Bruce Banner, un científico que se transforma en un monstruo verde cuando está enojado, busca una cura mientras es perseguido por el gobierno y lucha contra el Abominable Hulk en una batalla épica.', 'https://m.media-amazon.com/images/M/MV5BMmM3NjJiYjAtMzVkNC00MjA1LTk3NzgtMDdmYjNhZDFhYTM0XkEyXkFqcGdeQXVyODc0OTEyNDU@._V1_QL75_UY562_CR19,0,380,562_.jpg');
INSERT INTO public."Medio" ("Titulo", "Fecha_Estreno", "Compania", "Rating", "Sinopsis", "Imagen") VALUES ('Thor', '2011-04-17', 'Marvel Studios', 4, 'Thor, el poderoso dios del trueno, es desterrado a la Tierra y debe aprender humildad para poder recuperar su martillo mágico, Mjolnir, y enfrentarse a su hermano Loki, quien busca desatar el caos y tomar el trono de Asgard.', 'https://www.imdb.com/title/tt0800369/mediaviewer/rm1794733824/?ref_=tt_ov_i');
INSERT INTO public."Medio" ("Titulo", "Fecha_Estreno", "Compania", "Rating", "Sinopsis", "Imagen") VALUES ('Capitán América: el primer vengador', '2011-07-22', 'Marvel Studios', 4, 'Steve Rogers, un joven débil y frágil, se ofrece como voluntario para un experimento que lo transforma en el supersoldado Capitán América. Lidera un equipo de soldados para luchar contra la organización malvada Hydra y su líder, Cráneo Rojo, durante la Segunda Guerra Mundial.', 'https://1.bp.blogspot.com/_VbI2qfEJLI4/TUx2j_3e4KI/AAAAAAAAH28/grsbhLyZZbc/s1600/captainamericaposter2.jpg');
INSERT INTO public."Medio" ("Titulo", "Fecha_Estreno", "Compania", "Rating", "Sinopsis", "Imagen") VALUES ('Los Vengadores', '2012-05-04', 'Marvel Studios', 5, 'Los héroes de Marvel, como Iron Man, Capitán América, Thor y Hulk, se unen bajo la dirección de Nick Fury para formar los Vengadores. Juntos, luchan contra Loki y su ejército alienígena, que amenazan con conquistar la Tierra.', 'https://www.themoviedb.org/t/p/w220_and_h330_face/RYMX2wcKCBAr24UyPD7xwmjaTn.jpg');
INSERT INTO public."Medio" ("Titulo", "Fecha_Estreno", "Compania", "Rating", "Sinopsis", "Imagen") VALUES ('Iron Man 2', '2010-04-28', 'Marvel Studios', 4, 'Tony Stark, conocido como Iron Man, se enfrenta a nuevos desafíos mientras lucha contra su propia mortalidad y los planes de un villano que busca venganza. Mientras tanto, debe proteger su tecnología y encontrar un reemplazo para su reactor arc.', 'https://m.media-amazon.com/images/I/71VZVXPhmKL.__AC_SX300_SY300_QL70_FMwebp_.jpg');
INSERT INTO public."Medio" ("Titulo", "Fecha_Estreno", "Compania", "Rating", "Sinopsis", "Imagen") VALUES ('Marvels The Punisher', '2017-11-17', 'ABC Studios', 3, 'Frank Castle, un ex marine convertido en vigilante, busca venganza contra los responsables del asesinato de su familia. A medida que desmantela una conspiración criminal, se enfrenta a su pasado y a su propia moralidad mientras lucha incansablemente para hacer justicia de la única manera que conoce: la violencia.', 'imagen the punshier');
INSERT INTO public."Medio" ("Titulo", "Fecha_Estreno", "Compania", "Rating", "Sinopsis", "Imagen") VALUES ('Marvels Iron Fist', '2017-03-18', 'ABC Studios', 2, 'Danny Rand, un joven multimillonario que fue dado por muerto en un accidente de avión, regresa a Nueva York después de años de entrenamiento en artes marciales en la ciudad mística de Kun-Lun. Ahora posee el poder del Puño de Hierro y lucha contra los enemigos que amenazan su ciudad y su legado familiar.', 'imagen iron fist');
INSERT INTO public."Medio" ("Titulo", "Fecha_Estreno", "Compania", "Rating", "Sinopsis", "Imagen") VALUES ('Marvels Luke Cage', '2016-09-30', 'ABC Studios', 4, 'Luke Cage, un hombre con una piel impenetrable y una fuerza sobrehumana, se convierte en un héroe de Harlem después de un experimento fallido. Mientras protege su vecindario, debe enfrentarse a peligrosos enemigos, incluyendo a Cottonmouth y Diamondback, y lidiar con su pasado traumático.', 'imagen luke cage');
INSERT INTO public."Medio" ("Titulo", "Fecha_Estreno", "Compania", "Rating", "Sinopsis", "Imagen") VALUES ('Marvels Jessica Jones', '2015-11-20', 'ABC Studios', 4, 'Jessica Jones, una detective privada con habilidades superhumanas, lucha contra sus propios demonios mientras utiliza sus poderes para resolver casos. Su pasado oscuro vuelve a perseguirla cuando se enfrenta a Kilgrave, un manipulador con el poder de controlar mentes. Jessica debe confrontar sus traumas y detener a Kilgrave antes de que cause más daño.', 'imagen jessica jones');
INSERT INTO public."Medio" ("Titulo", "Fecha_Estreno", "Compania", "Rating", "Sinopsis", "Imagen") VALUES ('Marvels The Defenders', '2017-08-18', 'ABC Studios', 4, 'Los héroes de Nueva York, Daredevil, Jessica Jones, Luke Cage y Iron Fist, unen fuerzas para enfrentarse a una amenaza común. Juntos, forman el equipo conocido como "The Defenders" y luchan contra la organización criminal conocida como La Mano, que busca destruir la ciudad. Cada héroe debe superar sus diferencias y trabajar en equipo para proteger a Nueva York.', 'imagen the defenders');
INSERT INTO public."Medio" ("Titulo", "Fecha_Estreno", "Compania", "Rating", "Sinopsis", "Imagen") VALUES ('Spiderman: Un nuevo universo', '2018-12-14', 'Sony Pictures Animation', 5, 'Spierman decubre que hay un multiverso de spidermans', 'imagen de spiderman');
INSERT INTO public."Medio" ("Titulo", "Fecha_Estreno", "Compania", "Rating", "Sinopsis", "Imagen") VALUES ('Iron Man: Surge el tecnivoro', '2013-04-16', 'Madhouse', 3, 'Iron Man se enfrenta a un enemigo nunca antes visto', 'imagen de iron man');
INSERT INTO public."Medio" ("Titulo", "Fecha_Estreno", "Compania", "Rating", "Sinopsis", "Imagen") VALUES ('Ultimate Avengers 2: Rise of the Panther', '2006-08-08', 'MLG Productions', 4, 'Los vengadores se tendran que reunir una vez mas para defender al mundo de una nueva amenaza.', 'imagen de los vengadores animada');
INSERT INTO public."Medio" ("Titulo", "Fecha_Estreno", "Compania", "Rating", "Sinopsis", "Imagen") VALUES ('Marvels Daredevil', '2015-04-10', 'ABC Studios', 5, 'Matt Murdock, un abogado ciego, lleva una doble vida como el justiciero enmascarado Daredevil, luchando contra el crimen en las calles de Hells Kitchen. Enfrenta a poderosos enemigos, incluyendo a Kingpin, mientras equilibra su vida personal y su deber de proteger a los inocentes.', 'imagen daredevil');
INSERT INTO public."Medio" ("Titulo", "Fecha_Estreno", "Compania", "Rating", "Sinopsis", "Imagen") VALUES ('Iron Man 3', '2013-05-03', 'Marvel Studios', 4, 'Tony Stark, también conocido como Iron Man, se enfrenta a un enemigo misterioso llamado El Mandarín, quien amenaza su vida y todo lo que él representa. Enfrentando desafíos personales y enfrentándose a la destrucción de su mundo, Tony debe confiar en su ingenio y su armadura para proteger a sus seres queridos y salvar el día.', 'imagen ironman3');
INSERT INTO public."Medio" ("Titulo", "Fecha_Estreno", "Compania", "Rating", "Sinopsis", "Imagen") VALUES ('Thor: Un mundo oscuro', '2013-11-08', 'Marvel Studios', 3, 'Thor debe enfrentarse a una antigua raza de elfos oscuros liderada por Malekith, quien busca sumir al universo en la oscuridad eterna. Thor se une a su hermano Loki en una peligrosa alianza para detener la amenaza y proteger a su amada, Jane Foster, mientras luchan por el destino de los Nueve Reinos.', 'imagen thor 2');
INSERT INTO public."Medio" ("Titulo", "Fecha_Estreno", "Compania", "Rating", "Sinopsis", "Imagen") VALUES ('Capitán América: El soldado del invierno', '2014-04-04', 'Marvel Studios', 5, 'El Capitán América, Steve Rogers, se encuentra con una conspiración dentro de S.H.I.E.L.D. y debe enfrentarse a la corrupción y la infiltración de Hydra en la organización. Con la ayuda de la Viuda Negra y Falcon, lucha por desenmascarar a los traidores y salvar al mundo de un plan maligno.', 'imagen ca 2');
INSERT INTO public."Medio" ("Titulo", "Fecha_Estreno", "Compania", "Rating", "Sinopsis", "Imagen") VALUES ('Guardianes de la Galaxia', '2014-08-01', 'Marvel Studios', 5, '
Peter Quill, un aventurero espacial conocido como Star-Lord, se une a un grupo improbable de delincuentes, incluyendo a Gamora, Drax, Rocket y Groot, para proteger una poderosa gema del infinito de caer en manos equivocadas. Juntos, se embarcan en una misión cósmica llena de acción, humor y emociones, convirtiéndose en los legendarios Guardianes de la Galaxia.', 'imagen gdlg');
INSERT INTO public."Medio" ("Titulo", "Fecha_Estreno", "Compania", "Rating", "Sinopsis", "Imagen") VALUES ('Los Vengadores 2: La era de ultron', '2015-05-01', 'Marvel Studios', 4, 'Los Vengadores se reúnen nuevamente para enfrentarse a Ultron, una inteligencia artificial decidida a erradicar a la humanidad. Mientras luchan contra este nuevo enemigo, también deben confrontar sus propios conflictos internos y trabajar en equipo para proteger al mundo de la destrucción total.', 'imagen av 2');
INSERT INTO public."Medio" ("Titulo", "Fecha_Estreno", "Compania", "Rating", "Sinopsis", "Imagen") VALUES ('Antman', '2015-07-17', 'Marvel Studios', 4, 'Scott Lang, un ladrón con habilidades extraordinarias, se convierte en el nuevo Ant-Man bajo la tutela del Dr. Hank Pym. Utilizando un traje que le permite encogerse y aumentar su fuerza, Scott debe llevar a cabo un robo para salvar el mundo de una amenaza tecnológica y demostrar que puede ser un héroe digno.', 'imagen am');


--
-- TOC entry 3685 (class 0 OID 24733)
-- Dependencies: 230
-- Data for Name: Nacionalidad; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Nacionalidad" ("Nac") VALUES ('Estadounidense');
INSERT INTO public."Nacionalidad" ("Nac") VALUES ('Asgardiano');
INSERT INTO public."Nacionalidad" ("Nac") VALUES ('Ruso');
INSERT INTO public."Nacionalidad" ("Nac") VALUES ('Británico');
INSERT INTO public."Nacionalidad" ("Nac") VALUES ('Canadiense');
INSERT INTO public."Nacionalidad" ("Nac") VALUES ('Wakanda');
INSERT INTO public."Nacionalidad" ("Nac") VALUES ('Croata');
INSERT INTO public."Nacionalidad" ("Nac") VALUES ('Aleman');
INSERT INTO public."Nacionalidad" ("Nac") VALUES ('Jotunheim');


--
-- TOC entry 3686 (class 0 OID 24738)
-- Dependencies: 231
-- Data for Name: Objeto; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Objeto" ("Nombre", "Descripcion", "Material", "Tipo", "Imagen", "N_Personaje") VALUES ('Mark III', 'Primera armadura funcional', 'Alenacion de ritanio y oro', 'Armadura', 'https://static.wikia.nocookie.net/marvelcinematicuniverse/images/d/dc/Iron_Man_-_Mark_III.png/revision/latest/scale-to-width-down/204?cb=20171203054542&path-prefix=es', 'Tony Stark');
INSERT INTO public."Objeto" ("Nombre", "Descripcion", "Material", "Tipo", "Imagen", "N_Personaje") VALUES ('Mjolnir', 'Martillo mágico', 'Uru', 'Arma', 'https://cdn.webshopapp.com/shops/305440/files/334090082/600x600x2/thor-mjolnir-hammer-full-metal-hammer.jpg', 'Thor Odinson');
INSERT INTO public."Objeto" ("Nombre", "Descripcion", "Material", "Tipo", "Imagen", "N_Personaje") VALUES ('Escudo del Capitán América', 'Escudo circular indestructible', 'Vibranio', 'Escudo', 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e5/CapAward.png/320px-CapAward.png', 'Steve Rogers');
INSERT INTO public."Objeto" ("Nombre", "Descripcion", "Material", "Tipo", "Imagen", "N_Personaje") VALUES ('No Objeto', NULL, NULL, 'No aplica', 'No aplica', NULL);
INSERT INTO public."Objeto" ("Nombre", "Descripcion", "Material", "Tipo", "Imagen", "N_Personaje") VALUES ('IM Mark Uno', 'Exoesqueleto militar de alta capacidad', 'Acero Omnio', 'Armadura', 'imagen monger', 'Obadiah Stane');
INSERT INTO public."Objeto" ("Nombre", "Descripcion", "Material", "Tipo", "Imagen", "N_Personaje") VALUES ('Arco de Ojo de Halcón', 'Arco de poleas con una variedad de flechas para cada ocación.', 'Fibra de Carbono', 'Arma', 'Imagen arco', 'Clint Barton');
INSERT INTO public."Objeto" ("Nombre", "Descripcion", "Material", "Tipo", "Imagen", "N_Personaje") VALUES ('Arnes de pulpo', 'Arnes con cuatro brazos mecánicos', 'Titanio', 'Armadura', 'Imagen de arnes', 'Otto Octavius');
INSERT INTO public."Objeto" ("Nombre", "Descripcion", "Material", "Tipo", "Imagen", "N_Personaje") VALUES ('Cetro de Loki', 'Arma Chitauri que poseía la Gema de la Mente en su interior', 'Desconocido', 'Arma', 'Imagen del cetro', 'Loki Laufeyson');
INSERT INTO public."Objeto" ("Nombre", "Descripcion", "Material", "Tipo", "Imagen", "N_Personaje") VALUES ('Arco Compuesto', 'Arco de polea con diferentes funcionalidades', 'Titanio', 'Arma', 'Imagen de Arco', 'Clint Barton');
INSERT INTO public."Objeto" ("Nombre", "Descripcion", "Material", "Tipo", "Imagen", "N_Personaje") VALUES ('Gema del Poder', 'Gema del infinito del poder', 'Desconocido', 'Artefacto', 'igp', NULL);


--
-- TOC entry 3687 (class 0 OID 24743)
-- Dependencies: 232
-- Data for Name: Ocupacion; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Ocupacion" ("Ocup") VALUES ('Ingeniero');
INSERT INTO public."Ocupacion" ("Ocup") VALUES ('Militar');
INSERT INTO public."Ocupacion" ("Ocup") VALUES ('Dios');
INSERT INTO public."Ocupacion" ("Ocup") VALUES ('Científico');
INSERT INTO public."Ocupacion" ("Ocup") VALUES ('Espía');
INSERT INTO public."Ocupacion" ("Ocup") VALUES ('Agente');
INSERT INTO public."Ocupacion" ("Ocup") VALUES ('Profesor');
INSERT INTO public."Ocupacion" ("Ocup") VALUES ('Fotógrafo');
INSERT INTO public."Ocupacion" ("Ocup") VALUES ('Criminal');
INSERT INTO public."Ocupacion" ("Ocup") VALUES ('Terrorista');
INSERT INTO public."Ocupacion" ("Ocup") VALUES ('Empresario');
INSERT INTO public."Ocupacion" ("Ocup") VALUES ('Abogado');
INSERT INTO public."Ocupacion" ("Ocup") VALUES ('Vigilante');
INSERT INTO public."Ocupacion" ("Ocup") VALUES ('Investigador Privado');
INSERT INTO public."Ocupacion" ("Ocup") VALUES ('Mercenario');
INSERT INTO public."Ocupacion" ("Ocup") VALUES ('Mafioso');


--
-- TOC entry 3688 (class 0 OID 24748)
-- Dependencies: 233
-- Data for Name: Organizacion; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Organizacion" ("Nombre", "Eslogan", "Lider", "Fundador", "Tipo", "Nom_Comic", "Imagen", "Objetivo", "Lugar_Creacion") VALUES ('Hydra', 'Si se corta una cabeza, dos mas tomaran su lugar', 'Johann Schmidt', 'Johann Schmidt', 'Militar', 'Strange Tales #135', 'imagen', 'Dominar el mundo', 'Alemania');
INSERT INTO public."Organizacion" ("Nombre", "Eslogan", "Lider", "Fundador", "Tipo", "Nom_Comic", "Imagen", "Objetivo", "Lugar_Creacion") VALUES ('Vengadores', 'Si no podemos salvarlos, da por seguro que los vengaremos', 'Tony Stark', 'Tony Stark', 'Grupo de superheroes', 'The Avengers #1', 'https://upload.wikimedia.org/wikipedia/en/2/2b/Avengers_%28Marvel_Comics%29_vol_3_num_38.jpg', 'Salvar el mundo', 'Estados Unidos');
INSERT INTO public."Organizacion" ("Nombre", "Eslogan", "Lider", "Fundador", "Tipo", "Nom_Comic", "Imagen", "Objetivo", "Lugar_Creacion") VALUES ('SHIELD', 'Sistema Homologado de Inteligencia, Espionaje, Logística, y Defensa.', 'Nicholas Fury', 'Howard Stark', 'Agencia de inteligencia', 'Strange Tales #135', 'https://i.pinimg.com/originals/70/d1/8d/70d18dc11298dc928d60ddfead03b768.jpg', 'Investigar posibles amenazas en el mundo', 'Estados Unidos');
INSERT INTO public."Organizacion" ("Nombre", "Eslogan", "Lider", "Fundador", "Tipo", "Nom_Comic", "Imagen", "Objetivo", "Lugar_Creacion") VALUES ('X-Men', '"Bienvenido a los X-Men. Espero que sobrevivas a la experiencia".', 'Charles Xavier', 'Charles Xavier', 'Escuela para jovenes mutantes', 'X-Men #1', 'https://static.wikia.nocookie.net/marvel/images/6/6b/X-Men.jpg/revision/latest?cb=20101213233550&path-prefix=es', 'Proteger los derechos de los mutantes', 'Estados Unidos');
INSERT INTO public."Organizacion" ("Nombre", "Eslogan", "Lider", "Fundador", "Tipo", "Nom_Comic", "Imagen", "Objetivo", "Lugar_Creacion") VALUES ('Guardianes de la Galaxia', 'Ése tipo, allí. Necesito su pierna ortopédica.', 'Peter Quill', 'Peter Quill', 'Mercenarios', 'Marvel Super-Heroes # 18', 'Imagen de gg', 'Salvar la galaxia', 'Xandar');


--
-- TOC entry 3689 (class 0 OID 24753)
-- Dependencies: 234
-- Data for Name: Pais; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Pais" ("Id_Pais", "Nombre") VALUES (1, 'Venezuela');
INSERT INTO public."Pais" ("Id_Pais", "Nombre") VALUES (2, 'Colombia');


--
-- TOC entry 3691 (class 0 OID 24759)
-- Dependencies: 236
-- Data for Name: Pelicula; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Pelicula" ("T_Pelicula", "Director", "Duracion", "Coste", "Ganancia", "Distribuidor", "Tipo") VALUES ('Capitán América: el primer vengador', 'Joe Johnston', 124, 140, 371, 'Paramount Pictures', 'Live Action');
INSERT INTO public."Pelicula" ("T_Pelicula", "Director", "Duracion", "Coste", "Ganancia", "Distribuidor", "Tipo") VALUES ('Iron Man 2', 'Jon Favreau', 124, 200, 624, 'Paramount Pictures', 'Live Action');
INSERT INTO public."Pelicula" ("T_Pelicula", "Director", "Duracion", "Coste", "Ganancia", "Distribuidor", "Tipo") VALUES ('Los Vengadores', 'Joss Whedon', 143, 220, 1520, 'Walt Disney Studios', 'Live Action');
INSERT INTO public."Pelicula" ("T_Pelicula", "Director", "Duracion", "Coste", "Ganancia", "Distribuidor", "Tipo") VALUES ('The Incredible Hulk', 'Louis Leterrier', 112, 150, 264, 'Universal Pictures', 'Live Action');
INSERT INTO public."Pelicula" ("T_Pelicula", "Director", "Duracion", "Coste", "Ganancia", "Distribuidor", "Tipo") VALUES ('Thor', 'Kenneth Branargh', 115, 150, 450, 'Paramount Pictures', 'Live Action');
INSERT INTO public."Pelicula" ("T_Pelicula", "Director", "Duracion", "Coste", "Ganancia", "Distribuidor", "Tipo") VALUES ('Spiderman: Un nuevo universo', 'Peter Ramsey', 160, 90, 375, 'Sony Pictues Releasing', 'Animacion');
INSERT INTO public."Pelicula" ("T_Pelicula", "Director", "Duracion", "Coste", "Ganancia", "Distribuidor", "Tipo") VALUES ('Iron Man', 'Jon Favreau', 160, 140, 585, 'Paramount Pictures', 'Live Action');
INSERT INTO public."Pelicula" ("T_Pelicula", "Director", "Duracion", "Coste", "Ganancia", "Distribuidor", "Tipo") VALUES ('Iron Man: Surge el tecnivoro', 'Hiroshi Hamasaki', 88, 25, 60, 'Sony Pictues Releasing', 'Animacion');
INSERT INTO public."Pelicula" ("T_Pelicula", "Director", "Duracion", "Coste", "Ganancia", "Distribuidor", "Tipo") VALUES ('Ultimate Avengers 2: Rise of the Panther', 'Will Meugniot', 170, 10, 400, 'Lion Gate Entertainmnet', 'Animacion');
INSERT INTO public."Pelicula" ("T_Pelicula", "Director", "Duracion", "Coste", "Ganancia", "Distribuidor", "Tipo") VALUES ('Iron Man 3', 'Jon Favreau', 131, 200, 1215, 'Walt Disney Studios', 'Live Action');
INSERT INTO public."Pelicula" ("T_Pelicula", "Director", "Duracion", "Coste", "Ganancia", "Distribuidor", "Tipo") VALUES ('Thor: Un mundo oscuro', 'Alan Taylor', 112, 250, 645, 'Walt Disney Studios', 'Live Action');
INSERT INTO public."Pelicula" ("T_Pelicula", "Director", "Duracion", "Coste", "Ganancia", "Distribuidor", "Tipo") VALUES ('Capitán América: El soldado del invierno', 'Anthony Russo', 136, 170, 714, 'Walt Disney Studios', 'Live Action');
INSERT INTO public."Pelicula" ("T_Pelicula", "Director", "Duracion", "Coste", "Ganancia", "Distribuidor", "Tipo") VALUES ('Guardianes de la Galaxia', 'James Gunn', 122, 200, 773, 'Walt Disney Studios', 'Live Action');
INSERT INTO public."Pelicula" ("T_Pelicula", "Director", "Duracion", "Coste", "Ganancia", "Distribuidor", "Tipo") VALUES ('Los Vengadores 2: La era de ultron', 'Joss Whedon', 141, 316, 1405, 'Walt Disney Studios', 'Live Action');
INSERT INTO public."Pelicula" ("T_Pelicula", "Director", "Duracion", "Coste", "Ganancia", "Distribuidor", "Tipo") VALUES ('Antman', 'Peyton reed', 117, 169, 519, 'Walt Disney Studios', 'Live Action');


--
-- TOC entry 3692 (class 0 OID 24767)
-- Dependencies: 237
-- Data for Name: Perfil; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Perfil" ("Id_Perfil", "Dispositivo", "Nombre", "Idioma", "Email", "Imagen") VALUES (1, 'Televisor', 'Daniel', 'Chino', 'bortotdaniel@gmail.com', 8);
INSERT INTO public."Perfil" ("Id_Perfil", "Dispositivo", "Nombre", "Idioma", "Email", "Imagen") VALUES (2, 'Computadora', 'yuyuy', 'Frances', 'bortotdaniel@gmail.com', 9);
INSERT INTO public."Perfil" ("Id_Perfil", "Dispositivo", "Nombre", "Idioma", "Email", "Imagen") VALUES (3, 'Computadora', 'Marco', 'Espanol', 'usu1@ejemplo.com', 3);
INSERT INTO public."Perfil" ("Id_Perfil", "Dispositivo", "Nombre", "Idioma", "Email", "Imagen") VALUES (4, 'Telefono', 'PerfilUno', 'Espanol', 'usu2@ejemplo.com', 10);
INSERT INTO public."Perfil" ("Id_Perfil", "Dispositivo", "Nombre", "Idioma", "Email", "Imagen") VALUES (5, 'Tablet', 'Natalia', 'Ingles', 'usu2@ejemplo.com', 9);


--
-- TOC entry 3694 (class 0 OID 24774)
-- Dependencies: 239
-- Data for Name: Pers_Creador; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Pers_Creador" ("N_Personaje", "N_Creador") VALUES ('Tony Stark', 'Stan Lee');
INSERT INTO public."Pers_Creador" ("N_Personaje", "N_Creador") VALUES ('Tony Stark', 'Larry Lieber');
INSERT INTO public."Pers_Creador" ("N_Personaje", "N_Creador") VALUES ('Tony Stark', 'Joe Simon');
INSERT INTO public."Pers_Creador" ("N_Personaje", "N_Creador") VALUES ('Tony Stark', 'Jack Kirby');
INSERT INTO public."Pers_Creador" ("N_Personaje", "N_Creador") VALUES ('Thor Odinson', 'Larry Lieber');
INSERT INTO public."Pers_Creador" ("N_Personaje", "N_Creador") VALUES ('Thor Odinson', 'Jack Kirby');
INSERT INTO public."Pers_Creador" ("N_Personaje", "N_Creador") VALUES ('Thor Odinson', 'Stan Lee');
INSERT INTO public."Pers_Creador" ("N_Personaje", "N_Creador") VALUES ('Bruce Banner', 'Jack Kirby');
INSERT INTO public."Pers_Creador" ("N_Personaje", "N_Creador") VALUES ('Bruce Banner', 'Stan Lee');
INSERT INTO public."Pers_Creador" ("N_Personaje", "N_Creador") VALUES ('Natasha Romanoff', 'Don Rico');
INSERT INTO public."Pers_Creador" ("N_Personaje", "N_Creador") VALUES ('Natasha Romanoff', 'Stan Lee');
INSERT INTO public."Pers_Creador" ("N_Personaje", "N_Creador") VALUES ('Natasha Romanoff', 'Don Heck');
INSERT INTO public."Pers_Creador" ("N_Personaje", "N_Creador") VALUES ('Nicholas Fury', 'Jack Kirby');
INSERT INTO public."Pers_Creador" ("N_Personaje", "N_Creador") VALUES ('Nicholas Fury', 'Stan Lee');
INSERT INTO public."Pers_Creador" ("N_Personaje", "N_Creador") VALUES ('Maria Hill', 'David Finch');
INSERT INTO public."Pers_Creador" ("N_Personaje", "N_Creador") VALUES ('Maria Hill', 'Brian Michael Bendis');
INSERT INTO public."Pers_Creador" ("N_Personaje", "N_Creador") VALUES ('Sharon Carter', 'Stan Lee');
INSERT INTO public."Pers_Creador" ("N_Personaje", "N_Creador") VALUES ('Sharon Carter', 'Jack Kirby');
INSERT INTO public."Pers_Creador" ("N_Personaje", "N_Creador") VALUES ('Charles Xavier', 'Stan Lee');
INSERT INTO public."Pers_Creador" ("N_Personaje", "N_Creador") VALUES ('Charles Xavier', 'Jack Kirby');
INSERT INTO public."Pers_Creador" ("N_Personaje", "N_Creador") VALUES ('Logan Howlett', 'Len Wein');
INSERT INTO public."Pers_Creador" ("N_Personaje", "N_Creador") VALUES ('Logan Howlett', 'John Romita');
INSERT INTO public."Pers_Creador" ("N_Personaje", "N_Creador") VALUES ('Ororo Munroe', 'Len Wein');
INSERT INTO public."Pers_Creador" ("N_Personaje", "N_Creador") VALUES ('Ororo Munroe', 'Dave Cockrum');
INSERT INTO public."Pers_Creador" ("N_Personaje", "N_Creador") VALUES ('Peter Parker', 'Stan Lee');
INSERT INTO public."Pers_Creador" ("N_Personaje", "N_Creador") VALUES ('Peter Parker', 'Steve Ditko');
INSERT INTO public."Pers_Creador" ("N_Personaje", "N_Creador") VALUES ('Emil Blonsky', 'Gil Kane');
INSERT INTO public."Pers_Creador" ("N_Personaje", "N_Creador") VALUES ('Johann Schmidt', 'Joe Simon');
INSERT INTO public."Pers_Creador" ("N_Personaje", "N_Creador") VALUES ('Johann Schmidt', 'Jack Kirby');
INSERT INTO public."Pers_Creador" ("N_Personaje", "N_Creador") VALUES ('Helmut Zemo', 'Stan Lee');
INSERT INTO public."Pers_Creador" ("N_Personaje", "N_Creador") VALUES ('Helmut Zemo', 'Jack Kirby');
INSERT INTO public."Pers_Creador" ("N_Personaje", "N_Creador") VALUES ('Loki Laufeyson', 'Stan Lee');
INSERT INTO public."Pers_Creador" ("N_Personaje", "N_Creador") VALUES ('Loki Laufeyson', 'Jack Kirby');
INSERT INTO public."Pers_Creador" ("N_Personaje", "N_Creador") VALUES ('Loki Laufeyson', 'Larry Lieber');
INSERT INTO public."Pers_Creador" ("N_Personaje", "N_Creador") VALUES ('Obadiah Stane', 'Dennis O Niel');
INSERT INTO public."Pers_Creador" ("N_Personaje", "N_Creador") VALUES ('Hela Odinson', 'Stan Lee');
INSERT INTO public."Pers_Creador" ("N_Personaje", "N_Creador") VALUES ('Hela Odinson', 'Jack Kirby');
INSERT INTO public."Pers_Creador" ("N_Personaje", "N_Creador") VALUES ('Matt Murdock', 'Stan Lee');
INSERT INTO public."Pers_Creador" ("N_Personaje", "N_Creador") VALUES ('Jessica Jones', 'Brian Michael Bendis');
INSERT INTO public."Pers_Creador" ("N_Personaje", "N_Creador") VALUES ('Luke Cage', 'Archie Goodwin');
INSERT INTO public."Pers_Creador" ("N_Personaje", "N_Creador") VALUES ('Luke Cage', 'John Romita');
INSERT INTO public."Pers_Creador" ("N_Personaje", "N_Creador") VALUES ('Daniel Rand', 'Gil Kane');
INSERT INTO public."Pers_Creador" ("N_Personaje", "N_Creador") VALUES ('Frank Castle', 'John Romita');
INSERT INTO public."Pers_Creador" ("N_Personaje", "N_Creador") VALUES ('Wilson Fisk', 'John Romita');
INSERT INTO public."Pers_Creador" ("N_Personaje", "N_Creador") VALUES ('Wilson Fisk', 'Stan Lee');
INSERT INTO public."Pers_Creador" ("N_Personaje", "N_Creador") VALUES ('Antonia Dreykov', 'David Michelinie');


--
-- TOC entry 3695 (class 0 OID 24779)
-- Dependencies: 240
-- Data for Name: Pers_Nac; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Pers_Nac" ("N_Personaje", "Nacionalidad") VALUES ('Tony Stark', 'Estadounidense');
INSERT INTO public."Pers_Nac" ("N_Personaje", "Nacionalidad") VALUES ('Steve Rogers', 'Estadounidense');
INSERT INTO public."Pers_Nac" ("N_Personaje", "Nacionalidad") VALUES ('Thor Odinson', 'Asgardiano');
INSERT INTO public."Pers_Nac" ("N_Personaje", "Nacionalidad") VALUES ('Bruce Banner', 'Estadounidense');
INSERT INTO public."Pers_Nac" ("N_Personaje", "Nacionalidad") VALUES ('Natasha Romanoff', 'Ruso');
INSERT INTO public."Pers_Nac" ("N_Personaje", "Nacionalidad") VALUES ('Nicholas Fury', 'Estadounidense');
INSERT INTO public."Pers_Nac" ("N_Personaje", "Nacionalidad") VALUES ('Maria Hill', 'Estadounidense');
INSERT INTO public."Pers_Nac" ("N_Personaje", "Nacionalidad") VALUES ('Sharon Carter', 'Estadounidense');
INSERT INTO public."Pers_Nac" ("N_Personaje", "Nacionalidad") VALUES ('Charles Xavier', 'Británico');
INSERT INTO public."Pers_Nac" ("N_Personaje", "Nacionalidad") VALUES ('Logan Howlett', 'Canadiense');
INSERT INTO public."Pers_Nac" ("N_Personaje", "Nacionalidad") VALUES ('Ororo Munroe', 'Estadounidense');
INSERT INTO public."Pers_Nac" ("N_Personaje", "Nacionalidad") VALUES ('Ororo Munroe', 'Wakanda');
INSERT INTO public."Pers_Nac" ("N_Personaje", "Nacionalidad") VALUES ('Peter Parker', 'Estadounidense');
INSERT INTO public."Pers_Nac" ("N_Personaje", "Nacionalidad") VALUES ('Emil Blonsky', 'Croata');
INSERT INTO public."Pers_Nac" ("N_Personaje", "Nacionalidad") VALUES ('Helmut Zemo', 'Aleman');
INSERT INTO public."Pers_Nac" ("N_Personaje", "Nacionalidad") VALUES ('Johann Schmidt', 'Aleman');
INSERT INTO public."Pers_Nac" ("N_Personaje", "Nacionalidad") VALUES ('Loki Laufeyson', 'Asgardiano');
INSERT INTO public."Pers_Nac" ("N_Personaje", "Nacionalidad") VALUES ('Loki Laufeyson', 'Jotunheim');
INSERT INTO public."Pers_Nac" ("N_Personaje", "Nacionalidad") VALUES ('Obadiah Stane', 'Estadounidense');
INSERT INTO public."Pers_Nac" ("N_Personaje", "Nacionalidad") VALUES ('Obadiah Stane', 'Asgardiano');
INSERT INTO public."Pers_Nac" ("N_Personaje", "Nacionalidad") VALUES ('Matt Murdock', 'Estadounidense');
INSERT INTO public."Pers_Nac" ("N_Personaje", "Nacionalidad") VALUES ('Jessica Jones', 'Estadounidense');
INSERT INTO public."Pers_Nac" ("N_Personaje", "Nacionalidad") VALUES ('Luke Cage', 'Estadounidense');
INSERT INTO public."Pers_Nac" ("N_Personaje", "Nacionalidad") VALUES ('Daniel Rand', 'Estadounidense');
INSERT INTO public."Pers_Nac" ("N_Personaje", "Nacionalidad") VALUES ('Frank Castle', 'Estadounidense');
INSERT INTO public."Pers_Nac" ("N_Personaje", "Nacionalidad") VALUES ('Wilson Fisk', 'Estadounidense');
INSERT INTO public."Pers_Nac" ("N_Personaje", "Nacionalidad") VALUES ('Antonia Dreykov', 'Ruso');


--
-- TOC entry 3696 (class 0 OID 24784)
-- Dependencies: 241
-- Data for Name: Pers_Oc; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Pers_Oc" ("N_Personaje", "Ocupacion") VALUES ('Tony Stark', 'Ingeniero');
INSERT INTO public."Pers_Oc" ("N_Personaje", "Ocupacion") VALUES ('Steve Rogers', 'Militar');
INSERT INTO public."Pers_Oc" ("N_Personaje", "Ocupacion") VALUES ('Thor Odinson', 'Dios');
INSERT INTO public."Pers_Oc" ("N_Personaje", "Ocupacion") VALUES ('Bruce Banner', 'Científico');
INSERT INTO public."Pers_Oc" ("N_Personaje", "Ocupacion") VALUES ('Natasha Romanoff', 'Espía');
INSERT INTO public."Pers_Oc" ("N_Personaje", "Ocupacion") VALUES ('Nicholas Fury', 'Espía');
INSERT INTO public."Pers_Oc" ("N_Personaje", "Ocupacion") VALUES ('Maria Hill', 'Agente');
INSERT INTO public."Pers_Oc" ("N_Personaje", "Ocupacion") VALUES ('Sharon Carter', 'Agente');
INSERT INTO public."Pers_Oc" ("N_Personaje", "Ocupacion") VALUES ('Charles Xavier', 'Profesor');
INSERT INTO public."Pers_Oc" ("N_Personaje", "Ocupacion") VALUES ('Logan Howlett', 'Militar');
INSERT INTO public."Pers_Oc" ("N_Personaje", "Ocupacion") VALUES ('Peter Parker', 'Fotógrafo');
INSERT INTO public."Pers_Oc" ("N_Personaje", "Ocupacion") VALUES ('Emil Blonsky', 'Espía');
INSERT INTO public."Pers_Oc" ("N_Personaje", "Ocupacion") VALUES ('Emil Blonsky', 'Criminal');
INSERT INTO public."Pers_Oc" ("N_Personaje", "Ocupacion") VALUES ('Johann Schmidt', 'Terrorista');
INSERT INTO public."Pers_Oc" ("N_Personaje", "Ocupacion") VALUES ('Johann Schmidt', 'Criminal');
INSERT INTO public."Pers_Oc" ("N_Personaje", "Ocupacion") VALUES ('Johann Schmidt', 'Militar');
INSERT INTO public."Pers_Oc" ("N_Personaje", "Ocupacion") VALUES ('Helmut Zemo', 'Espía');
INSERT INTO public."Pers_Oc" ("N_Personaje", "Ocupacion") VALUES ('Obadiah Stane', 'Empresario');
INSERT INTO public."Pers_Oc" ("N_Personaje", "Ocupacion") VALUES ('Hela Odinson', 'Dios');
INSERT INTO public."Pers_Oc" ("N_Personaje", "Ocupacion") VALUES ('Loki Laufeyson', 'Dios');
INSERT INTO public."Pers_Oc" ("N_Personaje", "Ocupacion") VALUES ('Matt Murdock', 'Abogado');
INSERT INTO public."Pers_Oc" ("N_Personaje", "Ocupacion") VALUES ('Matt Murdock', 'Vigilante');
INSERT INTO public."Pers_Oc" ("N_Personaje", "Ocupacion") VALUES ('Jessica Jones', 'Investigador Privado');
INSERT INTO public."Pers_Oc" ("N_Personaje", "Ocupacion") VALUES ('Luke Cage', 'Investigador Privado');
INSERT INTO public."Pers_Oc" ("N_Personaje", "Ocupacion") VALUES ('Luke Cage', 'Mercenario');
INSERT INTO public."Pers_Oc" ("N_Personaje", "Ocupacion") VALUES ('Daniel Rand', 'Vigilante');
INSERT INTO public."Pers_Oc" ("N_Personaje", "Ocupacion") VALUES ('Frank Castle', 'Vigilante');
INSERT INTO public."Pers_Oc" ("N_Personaje", "Ocupacion") VALUES ('Frank Castle', 'Militar');
INSERT INTO public."Pers_Oc" ("N_Personaje", "Ocupacion") VALUES ('Frank Castle', 'Mercenario');
INSERT INTO public."Pers_Oc" ("N_Personaje", "Ocupacion") VALUES ('Wilson Fisk', 'Empresario');
INSERT INTO public."Pers_Oc" ("N_Personaje", "Ocupacion") VALUES ('Wilson Fisk', 'Mafioso');
INSERT INTO public."Pers_Oc" ("N_Personaje", "Ocupacion") VALUES ('Daniel Rand', 'Empresario');
INSERT INTO public."Pers_Oc" ("N_Personaje", "Ocupacion") VALUES ('Antonia Dreykov', 'Militar');
INSERT INTO public."Pers_Oc" ("N_Personaje", "Ocupacion") VALUES ('Antonia Dreykov', 'Mercenario');


--
-- TOC entry 3697 (class 0 OID 24789)
-- Dependencies: 242
-- Data for Name: Personaje; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Personaje" ("Nombre", "Genero", "Color_Ojos", "Color_Pelo", "Nom_Comic", "E_Marital", imagen) VALUES ('Tony Stark', 'M', 'Marrones', 'Negro', 'Tales of Suspense #39', 'Casado', 'https://static.wikia.nocookie.net/marveldatabase/images/0/0a/Iron_Man_Vol_6_1_Brooks_Variant_Textless.jpg/revision/latest/scale-to-width-down/1200?cb=20211207231858');
INSERT INTO public."Personaje" ("Nombre", "Genero", "Color_Ojos", "Color_Pelo", "Nom_Comic", "E_Marital", imagen) VALUES ('Steve Rogers', 'M', 'Azul', 'Rubio', 'Capitan America Comics #1', 'Soltero', 'https://static.wikia.nocookie.net/marvelcomicsenciclopedia/images/3/3f/Capitan_america.png/revision/latest?cb=20120607203316');
INSERT INTO public."Personaje" ("Nombre", "Genero", "Color_Ojos", "Color_Pelo", "Nom_Comic", "E_Marital", imagen) VALUES ('Thor Odinson', 'M', 'Azul', 'Rubio', 'Journy into Mystery #83', 'Soltero', 'https://upload.wikimedia.org/wikipedia/en/1/17/Thor_by_Olivier_Coipel.png');
INSERT INTO public."Personaje" ("Nombre", "Genero", "Color_Ojos", "Color_Pelo", "Nom_Comic", "E_Marital", imagen) VALUES ('Bruce Banner', 'M', 'Marron', 'Marron', 'Incredible Hulk #1', 'Soltero', 'https://upload.wikimedia.org/wikipedia/en/a/aa/Hulk_%28circa_2019%29.png');
INSERT INTO public."Personaje" ("Nombre", "Genero", "Color_Ojos", "Color_Pelo", "Nom_Comic", "E_Marital", imagen) VALUES ('Natasha Romanoff', 'F', 'Azul', 'Rojo', 'Tales of Suspense #52', 'Soltero', 'https://www.sideshow.com/cdn-cgi/image/quality=90,f=auto/https://www.sideshow.com/storage/product-images/501155FAL/black-widow_marvel_silo.png');
INSERT INTO public."Personaje" ("Nombre", "Genero", "Color_Ojos", "Color_Pelo", "Nom_Comic", "E_Marital", imagen) VALUES ('Clint Barton', 'M', 'Azul', 'Rubio', 'Tales of Suspense #57', 'Casado', 'https://upload.wikimedia.org/wikipedia/en/9/99/Hawkeye_%28Clinton_Barton%29.png');
INSERT INTO public."Personaje" ("Nombre", "Genero", "Color_Ojos", "Color_Pelo", "Nom_Comic", "E_Marital", imagen) VALUES ('Nicholas Fury', 'M', 'Marron', 'No posee', 'Sgt. Fury and his Howling Commandos #1', 'Casado', 'https://cdn.marvel.com/content/1x/fury2023001_cov.jpg');
INSERT INTO public."Personaje" ("Nombre", "Genero", "Color_Ojos", "Color_Pelo", "Nom_Comic", "E_Marital", imagen) VALUES ('Maria Hill', 'F', 'Verdes', 'Marron', 'Los Nuevos Vengadores #4', 'Soltero', 'https://static.wikia.nocookie.net/marveldatabase/images/4/4b/Maria_Hill_%28Earth-616%29_from_Avengers_World_Vol_1_14_001.png/revision/latest?cb=20150220062849');
INSERT INTO public."Personaje" ("Nombre", "Genero", "Color_Ojos", "Color_Pelo", "Nom_Comic", "E_Marital", imagen) VALUES ('Sharon Carter', 'F', 'Marron', 'Rubio', 'Tales of Suspense #75', 'Viudo', 'https://static.wikia.nocookie.net/marveldatabase/images/6/6c/Sharon_Carter_%28Earth-616%29_from_Captain_America_Sentinel_of_Liberty_Vol_2_11_001.jpg/revision/latest?cb=20230415234335');
INSERT INTO public."Personaje" ("Nombre", "Genero", "Color_Ojos", "Color_Pelo", "Nom_Comic", "E_Marital", imagen) VALUES ('Charles Xavier', 'M', 'Marron', 'No tiene', 'X-Men #1', 'Casado', 'https://static.wikia.nocookie.net/marveldatabase/images/c/cc/Old_Man_Logan_Vol_2_26_X-Men_Trading_Card_Variant_Textless.jpg/revision/latest?cb=20170611175302');
INSERT INTO public."Personaje" ("Nombre", "Genero", "Color_Ojos", "Color_Pelo", "Nom_Comic", "E_Marital", imagen) VALUES ('Logan Howlett', 'M', 'Azul', 'Negro', 'The Incredible Hulk #180', 'Viudo', 'https://qph.cf2.quoracdn.net/main-qimg-05f66e9374d638d4d30d0d85323a34e0-lq');
INSERT INTO public."Personaje" ("Nombre", "Genero", "Color_Ojos", "Color_Pelo", "Nom_Comic", "E_Marital", imagen) VALUES ('Eitri', 'M', 'Verde', 'Marron', 'The Mighty Thor Annual #11', 'Viudo', 'https://static.wikia.nocookie.net/marveldatabase/images/d/d2/Eitri_%28Earth-8096%29_from_Avengers_Earth%27s_Mightiest_Heroes_%28animated_series%29_Season_2_8.png/revision/latest/scale-to-width-down/342?cb=20201027005035');
INSERT INTO public."Personaje" ("Nombre", "Genero", "Color_Ojos", "Color_Pelo", "Nom_Comic", "E_Marital", imagen) VALUES ('Howard Stark', 'M', 'Marron', 'Negro', 'Iron Man #28', 'Viudo', 'https://upload.wikimedia.org/wikipedia/en/thumb/a/ab/Howard_Stark_%28Earth-616%29_from_S.H.I.E.L.D._Vol_1_1_page_03.jpg/200px-Howard_Stark_%28Earth-616%29_from_S.H.I.E.L.D._Vol_1_1_page_03.jpg');
INSERT INTO public."Personaje" ("Nombre", "Genero", "Color_Ojos", "Color_Pelo", "Nom_Comic", "E_Marital", imagen) VALUES ('Ororo Munroe', 'F', 'Azul', 'Blanco', 'Giant Size X-Men #1', 'Divorciado', 'https://images.squarespace-cdn.com/content/v1/5ce432b1f9d2be000134d8ae/1602089815064-0A5YIMROARBPPNBQXKII/Storm+LEGAL.jpg?format=750w');
INSERT INTO public."Personaje" ("Nombre", "Genero", "Color_Ojos", "Color_Pelo", "Nom_Comic", "E_Marital", imagen) VALUES ('Peter Parker', 'M', 'Marron', 'Marron', 'Amazing Fantasy #15', 'Soltero', 'imagen');
INSERT INTO public."Personaje" ("Nombre", "Genero", "Color_Ojos", "Color_Pelo", "Nom_Comic", "E_Marital", imagen) VALUES ('Emil Blonsky', 'M', 'Verde', 'Marron', 'Tales to Astonish #90', 'Casado', 'imagen');
INSERT INTO public."Personaje" ("Nombre", "Genero", "Color_Ojos", "Color_Pelo", "Nom_Comic", "E_Marital", imagen) VALUES ('Johann Schmidt', 'M', 'Azul', 'No tiene', 'Capitán América Comics #7', 'Viudo', 'imagen');
INSERT INTO public."Personaje" ("Nombre", "Genero", "Color_Ojos", "Color_Pelo", "Nom_Comic", "E_Marital", imagen) VALUES ('Helmut Zemo', 'M', 'Azul', 'Rubio', 'Captain America #168', 'Viudo', 'imagen');
INSERT INTO public."Personaje" ("Nombre", "Genero", "Color_Ojos", "Color_Pelo", "Nom_Comic", "E_Marital", imagen) VALUES ('Loki Laufeyson', 'M', 'Verde', 'Negro', 'Journey into Mistery #85', 'Soltero', 'imagen');
INSERT INTO public."Personaje" ("Nombre", "Genero", "Color_Ojos", "Color_Pelo", "Nom_Comic", "E_Marital", imagen) VALUES ('Obadiah Stane', 'M', 'Marron', 'No tiene', 'Iron Man #163', 'Divorciado', 'imagen');
INSERT INTO public."Personaje" ("Nombre", "Genero", "Color_Ojos", "Color_Pelo", "Nom_Comic", "E_Marital", imagen) VALUES ('Hela Odinson', 'F', 'Verdes', 'Negro', 'Journey into Mystery #102', 'Soltero', 'imagen');
INSERT INTO public."Personaje" ("Nombre", "Genero", "Color_Ojos", "Color_Pelo", "Nom_Comic", "E_Marital", imagen) VALUES ('Matt Murdock', 'M', 'Blanco', 'Marron', 'Daredevil #1', 'Divorciado', 'imagen de daredevil');
INSERT INTO public."Personaje" ("Nombre", "Genero", "Color_Ojos", "Color_Pelo", "Nom_Comic", "E_Marital", imagen) VALUES ('Jessica Jones', 'F', 'Verde', 'Negro', 'Alias #1', 'Casado', 'imagen de jessica');
INSERT INTO public."Personaje" ("Nombre", "Genero", "Color_Ojos", "Color_Pelo", "Nom_Comic", "E_Marital", imagen) VALUES ('Luke Cage', 'M', 'Marron', 'No tiene', 'Luke Cage, Hero for Hire #1', 'Casado', 'imagen de luke');
INSERT INTO public."Personaje" ("Nombre", "Genero", "Color_Ojos", "Color_Pelo", "Nom_Comic", "E_Marital", imagen) VALUES ('Daniel Rand', 'M', 'Azul', 'Rubio', 'Marvel Premiere #15', 'Casado', 'imagen de iron fist');
INSERT INTO public."Personaje" ("Nombre", "Genero", "Color_Ojos", "Color_Pelo", "Nom_Comic", "E_Marital", imagen) VALUES ('Frank Castle', 'M', 'Marron', 'Negro', 'The Amazing Spiderman #129', 'Viudo', 'imagen de punisher');
INSERT INTO public."Personaje" ("Nombre", "Genero", "Color_Ojos", "Color_Pelo", "Nom_Comic", "E_Marital", imagen) VALUES ('Wilson Fisk', 'M', 'Marron', 'No tiene', 'The Amazing Spiderman #50', 'Casado', 'imagen de wilson');
INSERT INTO public."Personaje" ("Nombre", "Genero", "Color_Ojos", "Color_Pelo", "Nom_Comic", "E_Marital", imagen) VALUES ('Antonia Dreykov', 'F', 'Marron', 'Marron', 'The Avengers Vol. 1 #195', 'Soltero', 'Imagen Taskmaster');
INSERT INTO public."Personaje" ("Nombre", "Genero", "Color_Ojos", "Color_Pelo", "Nom_Comic", "E_Marital", imagen) VALUES ('Otto Octavius', 'M', 'Marron', 'Marron', 'The Amazing Spiderman #3', 'Viudo', 'Imagen octopus');
INSERT INTO public."Personaje" ("Nombre", "Genero", "Color_Ojos", "Color_Pelo", "Nom_Comic", "E_Marital", imagen) VALUES ('Peter Quill', 'M', 'Azul', 'Rubio', 'Marvel Preview #4', 'Casado', 'Imagen de starlord');
INSERT INTO public."Personaje" ("Nombre", "Genero", "Color_Ojos", "Color_Pelo", "Nom_Comic", "E_Marital", imagen) VALUES ('Gamora', 'F', 'Marron', 'Rojo', 'Strange Tales #4', 'Casado', 'Imagen de Gamora');
INSERT INTO public."Personaje" ("Nombre", "Genero", "Color_Ojos", "Color_Pelo", "Nom_Comic", "E_Marital", imagen) VALUES ('Drax', 'M', 'Marron', 'No tiene', 'Iron Man #55', 'Viudo', 'Imagen de Drax');
INSERT INTO public."Personaje" ("Nombre", "Genero", "Color_Ojos", "Color_Pelo", "Nom_Comic", "E_Marital", imagen) VALUES ('Groot', 'M', 'Verde', 'No tiene', 'Tales of Astonish #13', 'Soltero', 'Imagen de Groot');
INSERT INTO public."Personaje" ("Nombre", "Genero", "Color_Ojos", "Color_Pelo", "Nom_Comic", "E_Marital", imagen) VALUES ('Ratchet', 'M', 'Amarillo', 'Gris', 'Marvel Preview', 'Soltero', 'Imagen de Ratchet');
INSERT INTO public."Personaje" ("Nombre", "Genero", "Color_Ojos", "Color_Pelo", "Nom_Comic", "E_Marital", imagen) VALUES ('Ronan', 'M', 'Morado', 'No tiene', 'Fantastic Four #65', 'Casado', 'Imagen de Ronan');
INSERT INTO public."Personaje" ("Nombre", "Genero", "Color_Ojos", "Color_Pelo", "Nom_Comic", "E_Marital", imagen) VALUES ('Nebula', 'F', 'Azul', 'No tiene', 'Avengers #257', 'Soltero', 'Imagen de Nebula');
INSERT INTO public."Personaje" ("Nombre", "Genero", "Color_Ojos", "Color_Pelo", "Nom_Comic", "E_Marital", imagen) VALUES ('Namor', 'M', 'Marron', 'Negro', 'Marvel Comics #1', 'Casado', 'Imagen de namor');


--
-- TOC entry 3698 (class 0 OID 24798)
-- Dependencies: 243
-- Data for Name: Pertenece; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Pertenece" ("N_Personaje", "N_Organizacion", "Cod_Cargo") VALUES ('Tony Stark', 'Vengadores', 100);
INSERT INTO public."Pertenece" ("N_Personaje", "N_Organizacion", "Cod_Cargo") VALUES ('Thor Odinson', 'Vengadores', 101);
INSERT INTO public."Pertenece" ("N_Personaje", "N_Organizacion", "Cod_Cargo") VALUES ('Bruce Banner', 'Vengadores', 101);
INSERT INTO public."Pertenece" ("N_Personaje", "N_Organizacion", "Cod_Cargo") VALUES ('Natasha Romanoff', 'Vengadores', 101);
INSERT INTO public."Pertenece" ("N_Personaje", "N_Organizacion", "Cod_Cargo") VALUES ('Clint Barton', 'Vengadores', 101);
INSERT INTO public."Pertenece" ("N_Personaje", "N_Organizacion", "Cod_Cargo") VALUES ('Nicholas Fury', 'SHIELD', 100);
INSERT INTO public."Pertenece" ("N_Personaje", "N_Organizacion", "Cod_Cargo") VALUES ('Maria Hill', 'SHIELD', 102);
INSERT INTO public."Pertenece" ("N_Personaje", "N_Organizacion", "Cod_Cargo") VALUES ('Sharon Carter', 'SHIELD', 102);
INSERT INTO public."Pertenece" ("N_Personaje", "N_Organizacion", "Cod_Cargo") VALUES ('Charles Xavier', 'X-Men', 100);
INSERT INTO public."Pertenece" ("N_Personaje", "N_Organizacion", "Cod_Cargo") VALUES ('Logan Howlett', 'X-Men', 103);
INSERT INTO public."Pertenece" ("N_Personaje", "N_Organizacion", "Cod_Cargo") VALUES ('Johann Schmidt', 'Hydra', 100);
INSERT INTO public."Pertenece" ("N_Personaje", "N_Organizacion", "Cod_Cargo") VALUES ('Helmut Zemo', 'Hydra', 102);
INSERT INTO public."Pertenece" ("N_Personaje", "N_Organizacion", "Cod_Cargo") VALUES ('Steve Rogers', 'Vengadores', 100);
INSERT INTO public."Pertenece" ("N_Personaje", "N_Organizacion", "Cod_Cargo") VALUES ('Peter Quill', 'Guardianes de la Galaxia', 100);
INSERT INTO public."Pertenece" ("N_Personaje", "N_Organizacion", "Cod_Cargo") VALUES ('Gamora', 'Guardianes de la Galaxia', 101);
INSERT INTO public."Pertenece" ("N_Personaje", "N_Organizacion", "Cod_Cargo") VALUES ('Drax', 'Guardianes de la Galaxia', 101);
INSERT INTO public."Pertenece" ("N_Personaje", "N_Organizacion", "Cod_Cargo") VALUES ('Groot', 'Guardianes de la Galaxia', 101);
INSERT INTO public."Pertenece" ("N_Personaje", "N_Organizacion", "Cod_Cargo") VALUES ('Ratchet', 'Guardianes de la Galaxia', 101);


--
-- TOC entry 3699 (class 0 OID 24803)
-- Dependencies: 244
-- Data for Name: Plat_Juego; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3700 (class 0 OID 24808)
-- Dependencies: 245
-- Data for Name: Plataforma; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Plataforma" (nombre) VALUES ('PC');
INSERT INTO public."Plataforma" (nombre) VALUES ('PlayStation 3');
INSERT INTO public."Plataforma" (nombre) VALUES ('PlayStation 4');
INSERT INTO public."Plataforma" (nombre) VALUES ('PlayStation 5');
INSERT INTO public."Plataforma" (nombre) VALUES ('Xbox 360');
INSERT INTO public."Plataforma" (nombre) VALUES ('Xbox One');
INSERT INTO public."Plataforma" (nombre) VALUES ('Xbox Serie X');
INSERT INTO public."Plataforma" (nombre) VALUES ('Nintendo Wii');
INSERT INTO public."Plataforma" (nombre) VALUES ('Nintendo Wii U');
INSERT INTO public."Plataforma" (nombre) VALUES ('Nintendo Switch');


--
-- TOC entry 3701 (class 0 OID 24813)
-- Dependencies: 246
-- Data for Name: Poder; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Poder" ("Nombre", "Imagen", "Descripcion") VALUES ('Super Fuerza', 'imagen super fuerza', 'Aumento en la fuerza fisica del usuario');
INSERT INTO public."Poder" ("Nombre", "Imagen", "Descripcion") VALUES ('Super Velocidad', 'imagen super velocidad', 'Aumento en la velocidad de movimiento del usuario');
INSERT INTO public."Poder" ("Nombre", "Imagen", "Descripcion") VALUES ('Manipulación de la electricidad', 'imagen manipulacion electricidad', 'El usuario puede manipular a voluntad la electricidad');
INSERT INTO public."Poder" ("Nombre", "Imagen", "Descripcion") VALUES ('Volar', 'imagen volar', 'El usuario puede volar');
INSERT INTO public."Poder" ("Nombre", "Imagen", "Descripcion") VALUES ('Regeneración', 'imagen regeneracion', 'El usuario tiene un factor curativo que aumenta la regeneración de heridas');
INSERT INTO public."Poder" ("Nombre", "Imagen", "Descripcion") VALUES ('Telepatía', 'imagen telepatia', 'El usuario puede leer mentes y proyectar sus propios pensamientos a la mente de otros.');
INSERT INTO public."Poder" ("Nombre", "Imagen", "Descripcion") VALUES ('Garras Retráctiles', 'imagen de garras retractiles', 'El usuario puede extraer garras a voluntad de su cuerpo.');
INSERT INTO public."Poder" ("Nombre", "Imagen", "Descripcion") VALUES ('Super Sentidos', 'imagen super sentidos', 'Los sentidos del usuario estan sobre el nivel de un humano normal.');
INSERT INTO public."Poder" ("Nombre", "Imagen", "Descripcion") VALUES ('Esqueleto metálico', 'imagen esqueleto metalico', 'El esqueleto del usuario esta cubierto por una aleación metalica.');
INSERT INTO public."Poder" ("Nombre", "Imagen", "Descripcion") VALUES ('Manipulación del clima', 'imagen manipulacion clima', 'El usuario puede controlar el clima a voluntad');
INSERT INTO public."Poder" ("Nombre", "Imagen", "Descripcion") VALUES ('Respiración subacuatica', 'imagen', 'El usuario puede respirar bajo la superficie acuatica con total normalidad.');
INSERT INTO public."Poder" ("Nombre", "Imagen", "Descripcion") VALUES ('Ilusionista', 'imagen ilusion', 'Habilidad que tiene el usuario para crear ilusiones que puedan alterar la forma de objetos o de si mismo.');
INSERT INTO public."Poder" ("Nombre", "Imagen", "Descripcion") VALUES ('Magia Negra', 'imagen magia negra', 'Magia obscura prohibida');
INSERT INTO public."Poder" ("Nombre", "Imagen", "Descripcion") VALUES ('No Poder', 'No aplica', 'No aplica');
INSERT INTO public."Poder" ("Nombre", "Imagen", "Descripcion") VALUES ('Visión de sonar', 'imagen de sonar', 'El usuario puede ver por el rebote de las ondas de sonido sin tener que usar la vista.');
INSERT INTO public."Poder" ("Nombre", "Imagen", "Descripcion") VALUES ('Fuerza Sobrehumana', 'imagen de fuerza sobrehumana', 'El usuario puede tiene fuerza física sobre las capacidades humanas.');
INSERT INTO public."Poder" ("Nombre", "Imagen", "Descripcion") VALUES ('Resistencia Sobrehumana', 'imagen de resistencia sobrehumana', 'El usuario puede tiene resistencia física sobre las capacidades humanas.');
INSERT INTO public."Poder" ("Nombre", "Imagen", "Descripcion") VALUES ('Velocidad Sobrehumana', 'imagen de velocidad sobrehumana', 'El usuario puede tiene velocidad física sobre las capacidades humanas.');
INSERT INTO public."Poder" ("Nombre", "Imagen", "Descripcion") VALUES ('Super Resistencia', 'imagen de super resistencia', 'El usuario posee una resisitencia física ilimitada.');
INSERT INTO public."Poder" ("Nombre", "Imagen", "Descripcion") VALUES ('Puño de Hierro', 'imagen de puno de hierro', 'El usuario puede canalizar si chi en un solo punto de su mano, al golpear, la energia incrementa el impacto varias veces.');
INSERT INTO public."Poder" ("Nombre", "Imagen", "Descripcion") VALUES ('Chi', 'imagen de chi', 'El usuario puedde manipular la energia espiritual dentro de si.');


--
-- TOC entry 3702 (class 0 OID 24818)
-- Dependencies: 247
-- Data for Name: Posee; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Posee" ("N_Personaje", "N_Poder", "Obtencion") VALUES ('Thor Odinson', 'Super Fuerza', 'Hereditario');
INSERT INTO public."Posee" ("N_Personaje", "N_Poder", "Obtencion") VALUES ('Thor Odinson', 'Super Velocidad', 'Hereditario');
INSERT INTO public."Posee" ("N_Personaje", "N_Poder", "Obtencion") VALUES ('Thor Odinson', 'Regeneración', 'Hereditario');
INSERT INTO public."Posee" ("N_Personaje", "N_Poder", "Obtencion") VALUES ('Thor Odinson', 'Manipulación de la electricidad', 'Hereditario');
INSERT INTO public."Posee" ("N_Personaje", "N_Poder", "Obtencion") VALUES ('Thor Odinson', 'Volar', 'Artificial');
INSERT INTO public."Posee" ("N_Personaje", "N_Poder", "Obtencion") VALUES ('Bruce Banner', 'Super Fuerza', 'Artificial');
INSERT INTO public."Posee" ("N_Personaje", "N_Poder", "Obtencion") VALUES ('Bruce Banner', 'Regeneración', 'Artificial');
INSERT INTO public."Posee" ("N_Personaje", "N_Poder", "Obtencion") VALUES ('Bruce Banner', 'Super Velocidad', 'Artificial');
INSERT INTO public."Posee" ("N_Personaje", "N_Poder", "Obtencion") VALUES ('Steve Rogers', 'Super Velocidad', 'Artificial');
INSERT INTO public."Posee" ("N_Personaje", "N_Poder", "Obtencion") VALUES ('Steve Rogers', 'Super Fuerza', 'Artificial');
INSERT INTO public."Posee" ("N_Personaje", "N_Poder", "Obtencion") VALUES ('Steve Rogers', 'Regeneración', 'Artificial');
INSERT INTO public."Posee" ("N_Personaje", "N_Poder", "Obtencion") VALUES ('Charles Xavier', 'Telepatía', 'Natural');
INSERT INTO public."Posee" ("N_Personaje", "N_Poder", "Obtencion") VALUES ('Logan Howlett', 'Regeneración', 'Natural');
INSERT INTO public."Posee" ("N_Personaje", "N_Poder", "Obtencion") VALUES ('Logan Howlett', 'Garras Retráctiles', 'Natural');
INSERT INTO public."Posee" ("N_Personaje", "N_Poder", "Obtencion") VALUES ('Logan Howlett', 'Esqueleto metálico', 'Artificial');
INSERT INTO public."Posee" ("N_Personaje", "N_Poder", "Obtencion") VALUES ('Ororo Munroe', 'Manipulación del clima', 'Natural');
INSERT INTO public."Posee" ("N_Personaje", "N_Poder", "Obtencion") VALUES ('Ororo Munroe', 'Volar', 'Natural');
INSERT INTO public."Posee" ("N_Personaje", "N_Poder", "Obtencion") VALUES ('Peter Parker', 'Super Fuerza', 'Artificial');
INSERT INTO public."Posee" ("N_Personaje", "N_Poder", "Obtencion") VALUES ('Emil Blonsky', 'Super Fuerza', 'Artificial');
INSERT INTO public."Posee" ("N_Personaje", "N_Poder", "Obtencion") VALUES ('Emil Blonsky', 'Super Velocidad', 'Artificial');
INSERT INTO public."Posee" ("N_Personaje", "N_Poder", "Obtencion") VALUES ('Emil Blonsky', 'Regeneración', 'Artificial');
INSERT INTO public."Posee" ("N_Personaje", "N_Poder", "Obtencion") VALUES ('Emil Blonsky', 'Respiración subacuatica', 'Artificial');
INSERT INTO public."Posee" ("N_Personaje", "N_Poder", "Obtencion") VALUES ('Johann Schmidt', 'Super Fuerza', 'Artificial');
INSERT INTO public."Posee" ("N_Personaje", "N_Poder", "Obtencion") VALUES ('Loki Laufeyson', 'Super Fuerza', 'Hereditario');
INSERT INTO public."Posee" ("N_Personaje", "N_Poder", "Obtencion") VALUES ('Loki Laufeyson', 'Ilusionista', 'Hereditario');
INSERT INTO public."Posee" ("N_Personaje", "N_Poder", "Obtencion") VALUES ('Hela Odinson', 'Super Fuerza', 'Hereditario');
INSERT INTO public."Posee" ("N_Personaje", "N_Poder", "Obtencion") VALUES ('Hela Odinson', 'Ilusionista', 'Hereditario');
INSERT INTO public."Posee" ("N_Personaje", "N_Poder", "Obtencion") VALUES ('Hela Odinson', 'Magia Negra', 'Natural');
INSERT INTO public."Posee" ("N_Personaje", "N_Poder", "Obtencion") VALUES ('Johann Schmidt', 'Super Velocidad', 'Artificial');
INSERT INTO public."Posee" ("N_Personaje", "N_Poder", "Obtencion") VALUES ('Johann Schmidt', 'Regeneración', 'Artificial');
INSERT INTO public."Posee" ("N_Personaje", "N_Poder", "Obtencion") VALUES ('Matt Murdock', 'Visión de sonar', 'Natural');
INSERT INTO public."Posee" ("N_Personaje", "N_Poder", "Obtencion") VALUES ('Jessica Jones', 'Fuerza Sobrehumana', 'Artificial');
INSERT INTO public."Posee" ("N_Personaje", "N_Poder", "Obtencion") VALUES ('Jessica Jones', 'Resistencia Sobrehumana', 'Artificial');
INSERT INTO public."Posee" ("N_Personaje", "N_Poder", "Obtencion") VALUES ('Jessica Jones', 'Volar', 'Artificial');
INSERT INTO public."Posee" ("N_Personaje", "N_Poder", "Obtencion") VALUES ('Luke Cage', 'Fuerza Sobrehumana', 'Artificial');
INSERT INTO public."Posee" ("N_Personaje", "N_Poder", "Obtencion") VALUES ('Jessica Jones', 'Super Resistencia', 'Artificial');
INSERT INTO public."Posee" ("N_Personaje", "N_Poder", "Obtencion") VALUES ('Luke Cage', 'Regeneración', 'Artificial');
INSERT INTO public."Posee" ("N_Personaje", "N_Poder", "Obtencion") VALUES ('Daniel Rand', 'Puño de Hierro', 'Natural');
INSERT INTO public."Posee" ("N_Personaje", "N_Poder", "Obtencion") VALUES ('Daniel Rand', 'Chi', 'Natural');
INSERT INTO public."Posee" ("N_Personaje", "N_Poder", "Obtencion") VALUES ('Namor', 'Super Fuerza', 'Hereditario');
INSERT INTO public."Posee" ("N_Personaje", "N_Poder", "Obtencion") VALUES ('Namor', 'Volar', 'Natural');
INSERT INTO public."Posee" ("N_Personaje", "N_Poder", "Obtencion") VALUES ('Namor', 'Respiración subacuatica', 'Hereditario');


--
-- TOC entry 3703 (class 0 OID 24824)
-- Dependencies: 248
-- Data for Name: RelacionadoHer; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."RelacionadoHer" ("N_Civil", "N_Heroe") VALUES ('Howard Stark', 'Tony Stark');
INSERT INTO public."RelacionadoHer" ("N_Civil", "N_Heroe") VALUES ('Eitri', 'Thor Odinson');


--
-- TOC entry 3704 (class 0 OID 24829)
-- Dependencies: 249
-- Data for Name: RelacionadoVill; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3705 (class 0 OID 24834)
-- Dependencies: 250
-- Data for Name: Sede; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3706 (class 0 OID 24839)
-- Dependencies: 251
-- Data for Name: Serie; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Serie" ("T_Serie", "N_Episodios", "Creador", "Canal") VALUES ('Marvels The Punisher', 26, 'Steve Lightfoot', 'Netflix');
INSERT INTO public."Serie" ("T_Serie", "N_Episodios", "Creador", "Canal") VALUES ('Marvels Iron Fist', 23, 'Scott Buck', 'Netflix');
INSERT INTO public."Serie" ("T_Serie", "N_Episodios", "Creador", "Canal") VALUES ('Marvels Luke Cage', 26, 'Cheo Hodari Coker', 'Netflix');
INSERT INTO public."Serie" ("T_Serie", "N_Episodios", "Creador", "Canal") VALUES ('Marvels Jessica Jones', 39, 'Melissa Rosenberg', 'Netflix');
INSERT INTO public."Serie" ("T_Serie", "N_Episodios", "Creador", "Canal") VALUES ('Marvels The Defenders', 8, 'Marco Ramirez', 'Netflix');
INSERT INTO public."Serie" ("T_Serie", "N_Episodios", "Creador", "Canal") VALUES ('Marvels Daredevil', 39, 'Drew Goddard', 'Netflix');


--
-- TOC entry 3707 (class 0 OID 24844)
-- Dependencies: 252
-- Data for Name: Suscripcion; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Suscripcion" ("ID", "Tarifa", "Descripcion", "Tipo") VALUES (1, 5.99, 'Gold', 'Gold');
INSERT INTO public."Suscripcion" ("ID", "Tarifa", "Descripcion", "Tipo") VALUES (2, 9.99, 'Premium', 'Premium');
INSERT INTO public."Suscripcion" ("ID", "Tarifa", "Descripcion", "Tipo") VALUES (3, 14.99, 'Vip', 'Vip');
INSERT INTO public."Suscripcion" ("ID", "Tarifa", "Descripcion", "Tipo") VALUES (4, 0, 'Free', 'Free');


--
-- TOC entry 3708 (class 0 OID 24851)
-- Dependencies: 253
-- Data for Name: Tarjeta; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Tarjeta" ("N_Tarjeta", "Cod_Seguridad", "Fecha_Ven") VALUES ('9876543211001111', 434, '2023-06-15');
INSERT INTO public."Tarjeta" ("N_Tarjeta", "Cod_Seguridad", "Fecha_Ven") VALUES ('3343423434324243', 434, '2023-06-29');
INSERT INTO public."Tarjeta" ("N_Tarjeta", "Cod_Seguridad", "Fecha_Ven") VALUES ('1234456789101111', 232, '2023-06-30');
INSERT INTO public."Tarjeta" ("N_Tarjeta", "Cod_Seguridad", "Fecha_Ven") VALUES ('1000100010001000', 100, '2024-01-01');
INSERT INTO public."Tarjeta" ("N_Tarjeta", "Cod_Seguridad", "Fecha_Ven") VALUES ('2000200020002000', 200, '2024-01-01');
INSERT INTO public."Tarjeta" ("N_Tarjeta", "Cod_Seguridad", "Fecha_Ven") VALUES ('3000300030003000', 300, '2024-01-01');


--
-- TOC entry 3709 (class 0 OID 24858)
-- Dependencies: 254
-- Data for Name: Usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Usuario" ("Email", "Contrasena", "Nombre", "Apellido", "Fecha_Nac", "Fecha_Creacion", "Id_Suscripcion", "N_Tarjeta", "Direccion") VALUES ('bortotdaniel@gmail.com', '300902', 'Daniel', 'Bortot', '2023-06-15', '2023-06-14', 1, '9876543211001111', 111);
INSERT INTO public."Usuario" ("Email", "Contrasena", "Nombre", "Apellido", "Fecha_Nac", "Fecha_Creacion", "Id_Suscripcion", "N_Tarjeta", "Direccion") VALUES ('usu2@ejemplo.com', '5678', 'nombre_usu2', 'apellido_usu2', '1990-01-01', '2023-01-01', 4, NULL, 111);
INSERT INTO public."Usuario" ("Email", "Contrasena", "Nombre", "Apellido", "Fecha_Nac", "Fecha_Creacion", "Id_Suscripcion", "N_Tarjeta", "Direccion") VALUES ('dabortot.21@est.ucab.edu.ve', '180370', 'Marco', 'Agrusa', '2023-06-21', '2023-06-14', 2, '1234456789101111', 111);
INSERT INTO public."Usuario" ("Email", "Contrasena", "Nombre", "Apellido", "Fecha_Nac", "Fecha_Creacion", "Id_Suscripcion", "N_Tarjeta", "Direccion") VALUES ('usu1@ejemplo.com', '1234', 'nombre_usu1', 'apellido_usu1', '1990-01-01', '2023-01-01', 3, NULL, 111);
INSERT INTO public."Usuario" ("Email", "Contrasena", "Nombre", "Apellido", "Fecha_Nac", "Fecha_Creacion", "Id_Suscripcion", "N_Tarjeta", "Direccion") VALUES ('usu7@ejemplo.com', '5678', 'nombre_usu7', 'apellido_usu7', '1990-01-01', '2023-01-01', 4, NULL, 111);
INSERT INTO public."Usuario" ("Email", "Contrasena", "Nombre", "Apellido", "Fecha_Nac", "Fecha_Creacion", "Id_Suscripcion", "N_Tarjeta", "Direccion") VALUES ('usu3@ejemplo.com', '8765', 'nombre_usu3', 'apellido_usu3', '1990-01-01', '2023-01-01', 3, NULL, 111);
INSERT INTO public."Usuario" ("Email", "Contrasena", "Nombre", "Apellido", "Fecha_Nac", "Fecha_Creacion", "Id_Suscripcion", "N_Tarjeta", "Direccion") VALUES ('usu4@ejemplo.com', '4321', 'nombre_usu4', 'apellido_usu4', '1990-01-01', '2023-01-01', 3, NULL, 112);
INSERT INTO public."Usuario" ("Email", "Contrasena", "Nombre", "Apellido", "Fecha_Nac", "Fecha_Creacion", "Id_Suscripcion", "N_Tarjeta", "Direccion") VALUES ('usu5@ejemplo.com', '1010', 'nombre_usu5', 'apellido_usu5', '1990-01-01', '2023-01-01', 2, NULL, 112);
INSERT INTO public."Usuario" ("Email", "Contrasena", "Nombre", "Apellido", "Fecha_Nac", "Fecha_Creacion", "Id_Suscripcion", "N_Tarjeta", "Direccion") VALUES ('usu6@ejemplo.com', '1020', 'nombre_usu6', 'apellido_usu6', '1990-01-01', '2023-01-01', 3, NULL, 111);


--
-- TOC entry 3710 (class 0 OID 24864)
-- Dependencies: 255
-- Data for Name: Villano; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Villano" ("N_Villano", "Alias", "Objetivo") VALUES ('Emil Blonsky', 'Abominación', 'Derrotar a Hulk');
INSERT INTO public."Villano" ("N_Villano", "Alias", "Objetivo") VALUES ('Johann Schmidt', 'Craneo Rojo', 'Dominar el mundo');
INSERT INTO public."Villano" ("N_Villano", "Alias", "Objetivo") VALUES ('Helmut Zemo', 'Baron Zemo', 'Vengarse de los vengadores');
INSERT INTO public."Villano" ("N_Villano", "Alias", "Objetivo") VALUES ('Loki Laufeyson', 'Loki', 'Hacer travesuras a su hermano Thor');
INSERT INTO public."Villano" ("N_Villano", "Alias", "Objetivo") VALUES ('Obadiah Stane', 'Iron Monger', 'Adueñarse de Stark Industries');
INSERT INTO public."Villano" ("N_Villano", "Alias", "Objetivo") VALUES ('Hela Odinson', 'Hela', 'Ser la reina de Asgard');
INSERT INTO public."Villano" ("N_Villano", "Alias", "Objetivo") VALUES ('Wilson Fisk', 'Kingpin', 'Ser el jefe de la mafia más poderoso de Nueva York');
INSERT INTO public."Villano" ("N_Villano", "Alias", "Objetivo") VALUES ('Antonia Dreykov', 'Taskmaster', 'Obedecer ordenes de sus superiores');
INSERT INTO public."Villano" ("N_Villano", "Alias", "Objetivo") VALUES ('Otto Octavius', 'Doctor Octopus', 'Continuar sus investigaciones');
INSERT INTO public."Villano" ("N_Villano", "Alias", "Objetivo") VALUES ('Ronan', 'Ronan el Acusador', 'Complaser a su maestro Thanos');
INSERT INTO public."Villano" ("N_Villano", "Alias", "Objetivo") VALUES ('Nebula', 'Nebula', 'Superar a su hermana Gamora');
INSERT INTO public."Villano" ("N_Villano", "Alias", "Objetivo") VALUES ('Namor', 'Namor', 'Proteger a su pueblo');


--
-- TOC entry 3722 (class 0 OID 0)
-- Dependencies: 216
-- Name: Cargo_Cod_Cargo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Cargo_Cod_Cargo_seq"', 1, false);


--
-- TOC entry 3723 (class 0 OID 0)
-- Dependencies: 218
-- Name: Ciudad_Id_Ciudad_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Ciudad_Id_Ciudad_seq"', 4, true);


--
-- TOC entry 3724 (class 0 OID 0)
-- Dependencies: 225
-- Name: Estado_Id_Estado_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Estado_Id_Estado_seq"', 3, true);


--
-- TOC entry 3725 (class 0 OID 0)
-- Dependencies: 235
-- Name: Pais_Id_Pais_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Pais_Id_Pais_seq"', 2, true);


--
-- TOC entry 3726 (class 0 OID 0)
-- Dependencies: 238
-- Name: Perfil_Id_Perfil_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Perfil_Id_Perfil_seq"', 5, true);


--
-- TOC entry 3363 (class 2606 OID 24875)
-- Name: Aparece Aparece_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Aparece"
    ADD CONSTRAINT "Aparece_pkey" PRIMARY KEY ("N_Organizacion", "N_Titulo");


--
-- TOC entry 3365 (class 2606 OID 24877)
-- Name: Cargo Cargo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Cargo"
    ADD CONSTRAINT "Cargo_pkey" PRIMARY KEY ("Cod_Cargo");


--
-- TOC entry 3367 (class 2606 OID 24879)
-- Name: Ciudad Ciudad_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Ciudad"
    ADD CONSTRAINT "Ciudad_pkey" PRIMARY KEY ("Id_Ciudad");


--
-- TOC entry 3369 (class 2606 OID 24881)
-- Name: Civil Civil_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Civil"
    ADD CONSTRAINT "Civil_pkey" PRIMARY KEY ("N_Civil");


--
-- TOC entry 3469 (class 2606 OID 25544)
-- Name: Combate Combate_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Combate"
    ADD CONSTRAINT "Combate_pkey" PRIMARY KEY ("N_Personaje", "N_Poder", "N_Objeto", "Fecha");


--
-- TOC entry 3371 (class 2606 OID 24885)
-- Name: Crea Crea_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Crea"
    ADD CONSTRAINT "Crea_pkey" PRIMARY KEY ("N_Personaje", "N_Objeto");


--
-- TOC entry 3373 (class 2606 OID 24887)
-- Name: Creador Creador_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Creador"
    ADD CONSTRAINT "Creador_pkey" PRIMARY KEY ("Nom_Creador");


--
-- TOC entry 3375 (class 2606 OID 24889)
-- Name: Enfrenta Enfrenta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Enfrenta"
    ADD CONSTRAINT "Enfrenta_pkey" PRIMARY KEY ("N_Heroe", "N_Villano");


--
-- TOC entry 3377 (class 2606 OID 24891)
-- Name: Esta Esta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Esta"
    ADD CONSTRAINT "Esta_pkey" PRIMARY KEY ("N_Personaje", "N_Titulo");


--
-- TOC entry 3379 (class 2606 OID 24893)
-- Name: Estado Estado_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Estado"
    ADD CONSTRAINT "Estado_pkey" PRIMARY KEY ("Id_Estado");


--
-- TOC entry 3381 (class 2606 OID 24895)
-- Name: Heroe Heroe_Alias_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Heroe"
    ADD CONSTRAINT "Heroe_Alias_key" UNIQUE ("Alias");


--
-- TOC entry 3383 (class 2606 OID 24897)
-- Name: Heroe Heroe_Logotipo_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Heroe"
    ADD CONSTRAINT "Heroe_Logotipo_key" UNIQUE ("Logotipo");


--
-- TOC entry 3385 (class 2606 OID 24899)
-- Name: Heroe Heroe_N_Heroe_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Heroe"
    ADD CONSTRAINT "Heroe_N_Heroe_key" UNIQUE ("N_Heroe");


--
-- TOC entry 3387 (class 2606 OID 24901)
-- Name: Historial Historial_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Historial"
    ADD CONSTRAINT "Historial_pkey" PRIMARY KEY ("N_Titulo", "Id_Perfil");


--
-- TOC entry 3389 (class 2606 OID 24903)
-- Name: Juego Juego_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Juego"
    ADD CONSTRAINT "Juego_pkey" PRIMARY KEY ("T_Juego");


--
-- TOC entry 3391 (class 2606 OID 24905)
-- Name: Medio Medio_Imagen_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Medio"
    ADD CONSTRAINT "Medio_Imagen_key" UNIQUE ("Imagen");


--
-- TOC entry 3393 (class 2606 OID 24907)
-- Name: Medio Medio_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Medio"
    ADD CONSTRAINT "Medio_pkey" PRIMARY KEY ("Titulo");


--
-- TOC entry 3395 (class 2606 OID 24909)
-- Name: Nacionalidad Nacionalidad_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Nacionalidad"
    ADD CONSTRAINT "Nacionalidad_pkey" PRIMARY KEY ("Nac");


--
-- TOC entry 3397 (class 2606 OID 24911)
-- Name: Objeto Objeto_Imagen_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Objeto"
    ADD CONSTRAINT "Objeto_Imagen_key" UNIQUE ("Imagen");


--
-- TOC entry 3399 (class 2606 OID 24913)
-- Name: Objeto Objeto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Objeto"
    ADD CONSTRAINT "Objeto_pkey" PRIMARY KEY ("Nombre");


--
-- TOC entry 3401 (class 2606 OID 24915)
-- Name: Ocupacion Ocupacion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Ocupacion"
    ADD CONSTRAINT "Ocupacion_pkey" PRIMARY KEY ("Ocup");


--
-- TOC entry 3403 (class 2606 OID 24917)
-- Name: Organizacion Organizacion_Fundador_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Organizacion"
    ADD CONSTRAINT "Organizacion_Fundador_key" UNIQUE ("Fundador");


--
-- TOC entry 3405 (class 2606 OID 24919)
-- Name: Organizacion Organizacion_Imagen_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Organizacion"
    ADD CONSTRAINT "Organizacion_Imagen_key" UNIQUE ("Imagen");


--
-- TOC entry 3407 (class 2606 OID 24921)
-- Name: Organizacion Organizacion_Lider_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Organizacion"
    ADD CONSTRAINT "Organizacion_Lider_key" UNIQUE ("Lider");


--
-- TOC entry 3409 (class 2606 OID 24923)
-- Name: Organizacion Organizacion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Organizacion"
    ADD CONSTRAINT "Organizacion_pkey" PRIMARY KEY ("Nombre");


--
-- TOC entry 3411 (class 2606 OID 24925)
-- Name: Pais Pais_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Pais"
    ADD CONSTRAINT "Pais_pkey" PRIMARY KEY ("Id_Pais");


--
-- TOC entry 3350 (class 2606 OID 25537)
-- Name: Pelicula Pelicula_Tipo_check; Type: CHECK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE public."Pelicula"
    ADD CONSTRAINT "Pelicula_Tipo_check" CHECK ((("Tipo" = 'Animacion'::text) OR ("Tipo" = 'Live Action'::text))) NOT VALID;


--
-- TOC entry 3413 (class 2606 OID 24927)
-- Name: Pelicula Pelicula_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Pelicula"
    ADD CONSTRAINT "Pelicula_pkey" PRIMARY KEY ("T_Pelicula");


--
-- TOC entry 3415 (class 2606 OID 24929)
-- Name: Perfil Perfil_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Perfil"
    ADD CONSTRAINT "Perfil_pkey" PRIMARY KEY ("Id_Perfil");


--
-- TOC entry 3417 (class 2606 OID 24931)
-- Name: Pers_Creador Pers_Creador_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Pers_Creador"
    ADD CONSTRAINT "Pers_Creador_pkey" PRIMARY KEY ("N_Personaje", "N_Creador");


--
-- TOC entry 3419 (class 2606 OID 24933)
-- Name: Pers_Nac Pers_Nac_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Pers_Nac"
    ADD CONSTRAINT "Pers_Nac_pkey" PRIMARY KEY ("N_Personaje", "Nacionalidad");


--
-- TOC entry 3421 (class 2606 OID 24935)
-- Name: Pers_Oc Pers_Oc_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Pers_Oc"
    ADD CONSTRAINT "Pers_Oc_pkey" PRIMARY KEY ("N_Personaje", "Ocupacion");


--
-- TOC entry 3423 (class 2606 OID 24937)
-- Name: Personaje Personaje_Nombre_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Personaje"
    ADD CONSTRAINT "Personaje_Nombre_key" UNIQUE ("Nombre");


--
-- TOC entry 3425 (class 2606 OID 24939)
-- Name: Personaje Personaje_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Personaje"
    ADD CONSTRAINT "Personaje_pkey" PRIMARY KEY ("Nombre");


--
-- TOC entry 3427 (class 2606 OID 24941)
-- Name: Pertenece Pertenece_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Pertenece"
    ADD CONSTRAINT "Pertenece_pkey" PRIMARY KEY ("N_Personaje", "N_Organizacion", "Cod_Cargo");


--
-- TOC entry 3429 (class 2606 OID 24943)
-- Name: Plat_Juego Plat_Juego_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Plat_Juego"
    ADD CONSTRAINT "Plat_Juego_pkey" PRIMARY KEY ("T_Juego", "Plataforma");


--
-- TOC entry 3431 (class 2606 OID 24945)
-- Name: Plataforma Plataforma_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Plataforma"
    ADD CONSTRAINT "Plataforma_pkey" PRIMARY KEY (nombre);


--
-- TOC entry 3433 (class 2606 OID 24947)
-- Name: Poder Poder_Imagen_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Poder"
    ADD CONSTRAINT "Poder_Imagen_key" UNIQUE ("Imagen");


--
-- TOC entry 3435 (class 2606 OID 24949)
-- Name: Poder Poder_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Poder"
    ADD CONSTRAINT "Poder_pkey" PRIMARY KEY ("Nombre");


--
-- TOC entry 3437 (class 2606 OID 24951)
-- Name: Posee Posee_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Posee"
    ADD CONSTRAINT "Posee_pkey" PRIMARY KEY ("N_Personaje", "N_Poder");


--
-- TOC entry 3439 (class 2606 OID 24953)
-- Name: RelacionadoHer RelacionadoHer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RelacionadoHer"
    ADD CONSTRAINT "RelacionadoHer_pkey" PRIMARY KEY ("N_Civil", "N_Heroe");


--
-- TOC entry 3441 (class 2606 OID 24955)
-- Name: RelacionadoVill RelacionadoVill_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RelacionadoVill"
    ADD CONSTRAINT "RelacionadoVill_pkey" PRIMARY KEY ("N_Civil", "N_Villano");


--
-- TOC entry 3443 (class 2606 OID 24957)
-- Name: Sede Sede_Imagen_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Sede"
    ADD CONSTRAINT "Sede_Imagen_key" UNIQUE ("Imagen");


--
-- TOC entry 3445 (class 2606 OID 24959)
-- Name: Sede Sede_Nombre_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Sede"
    ADD CONSTRAINT "Sede_Nombre_key" UNIQUE ("Nombre");


--
-- TOC entry 3447 (class 2606 OID 24961)
-- Name: Sede Sede_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Sede"
    ADD CONSTRAINT "Sede_pkey" PRIMARY KEY ("Nombre", "N_Org");


--
-- TOC entry 3449 (class 2606 OID 24963)
-- Name: Serie Serie_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Serie"
    ADD CONSTRAINT "Serie_pkey" PRIMARY KEY ("T_Serie");


--
-- TOC entry 3451 (class 2606 OID 24965)
-- Name: Suscripcion Suscripcion_Tipo_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Suscripcion"
    ADD CONSTRAINT "Suscripcion_Tipo_key" UNIQUE ("Tipo");


--
-- TOC entry 3453 (class 2606 OID 24967)
-- Name: Suscripcion Suscripcion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Suscripcion"
    ADD CONSTRAINT "Suscripcion_pkey" PRIMARY KEY ("ID");


--
-- TOC entry 3455 (class 2606 OID 24969)
-- Name: Tarjeta Tarjeta_N_Tarjeta_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Tarjeta"
    ADD CONSTRAINT "Tarjeta_N_Tarjeta_key" UNIQUE ("N_Tarjeta");


--
-- TOC entry 3457 (class 2606 OID 24971)
-- Name: Tarjeta Tarjeta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Tarjeta"
    ADD CONSTRAINT "Tarjeta_pkey" PRIMARY KEY ("N_Tarjeta");


--
-- TOC entry 3459 (class 2606 OID 24973)
-- Name: Usuario Usuario_Apellido_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Usuario"
    ADD CONSTRAINT "Usuario_Apellido_key" UNIQUE ("Apellido");


--
-- TOC entry 3461 (class 2606 OID 24975)
-- Name: Usuario Usuario_Nombre_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Usuario"
    ADD CONSTRAINT "Usuario_Nombre_key" UNIQUE ("Nombre");


--
-- TOC entry 3463 (class 2606 OID 24977)
-- Name: Usuario Usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Usuario"
    ADD CONSTRAINT "Usuario_pkey" PRIMARY KEY ("Email");


--
-- TOC entry 3465 (class 2606 OID 24979)
-- Name: Villano Villano_Alias_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Villano"
    ADD CONSTRAINT "Villano_Alias_key" UNIQUE ("Alias");


--
-- TOC entry 3467 (class 2606 OID 24981)
-- Name: Villano Villano_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Villano"
    ADD CONSTRAINT "Villano_pkey" PRIMARY KEY ("N_Villano");


--
-- TOC entry 3519 (class 2620 OID 24982)
-- Name: Heroe archienemigo_trigger; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER archienemigo_trigger BEFORE INSERT OR UPDATE ON public."Heroe" FOR EACH ROW EXECUTE FUNCTION public.archienemigo();


--
-- TOC entry 3520 (class 2620 OID 24983)
-- Name: Historial calificacion_trigger; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER calificacion_trigger BEFORE INSERT OR UPDATE ON public."Historial" FOR EACH ROW EXECUTE FUNCTION public.numcalificacion();


--
-- TOC entry 3523 (class 2620 OID 24984)
-- Name: Personaje emarital_trigger; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER emarital_trigger BEFORE INSERT OR UPDATE ON public."Personaje" FOR EACH ROW EXECUTE FUNCTION public.emarital();


--
-- TOC entry 3522 (class 2620 OID 24985)
-- Name: Pelicula ganancia_perdida_trigger; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER ganancia_perdida_trigger BEFORE INSERT OR UPDATE ON public."Pelicula" FOR EACH ROW EXECUTE FUNCTION public.ganancia_perdida();


--
-- TOC entry 3524 (class 2620 OID 24986)
-- Name: Personaje genero_trigger; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER genero_trigger BEFORE INSERT OR UPDATE ON public."Personaje" FOR EACH ROW EXECUTE FUNCTION public.genero();


--
-- TOC entry 3526 (class 2620 OID 24987)
-- Name: Usuario numusuarios_trigger; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER numusuarios_trigger BEFORE INSERT OR UPDATE ON public."Usuario" FOR EACH ROW EXECUTE FUNCTION public.numusuarios();


--
-- TOC entry 3521 (class 2620 OID 24988)
-- Name: Medio rating_trigger; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER rating_trigger BEFORE INSERT OR UPDATE ON public."Medio" FOR EACH ROW EXECUTE FUNCTION public.numrating();


--
-- TOC entry 3517 (class 2620 OID 24989)
-- Name: Esta rolpersonaje_trigger; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER rolpersonaje_trigger BEFORE INSERT OR UPDATE ON public."Esta" FOR EACH ROW EXECUTE FUNCTION public.rolpersonaje();


--
-- TOC entry 3518 (class 2620 OID 24990)
-- Name: Esta tipoactor_trigger; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER tipoactor_trigger BEFORE INSERT OR UPDATE ON public."Esta" FOR EACH ROW EXECUTE FUNCTION public.tipoactor();


--
-- TOC entry 3525 (class 2620 OID 24991)
-- Name: Suscripcion tiposuscripciones_trigger; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER tiposuscripciones_trigger BEFORE INSERT OR UPDATE ON public."Suscripcion" FOR EACH ROW EXECUTE FUNCTION public.tiposuscripciones();


--
-- TOC entry 3470 (class 2606 OID 25297)
-- Name: Aparece Aparece_N_Organizacion_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Aparece"
    ADD CONSTRAINT "Aparece_N_Organizacion_fkey" FOREIGN KEY ("N_Organizacion") REFERENCES public."Organizacion"("Nombre") ON UPDATE CASCADE NOT VALID;


--
-- TOC entry 3471 (class 2606 OID 25302)
-- Name: Aparece Aparece_N_Titulo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Aparece"
    ADD CONSTRAINT "Aparece_N_Titulo_fkey" FOREIGN KEY ("N_Titulo") REFERENCES public."Medio"("Titulo") ON UPDATE CASCADE NOT VALID;


--
-- TOC entry 3472 (class 2606 OID 25522)
-- Name: Ciudad Ciudad_Id_Estado_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Ciudad"
    ADD CONSTRAINT "Ciudad_Id_Estado_fkey" FOREIGN KEY ("Id_Estado") REFERENCES public."Estado"("Id_Estado") ON UPDATE CASCADE NOT VALID;


--
-- TOC entry 3473 (class 2606 OID 25307)
-- Name: Civil Civil_N_Civil_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Civil"
    ADD CONSTRAINT "Civil_N_Civil_fkey" FOREIGN KEY ("N_Civil") REFERENCES public."Personaje"("Nombre") ON UPDATE CASCADE NOT VALID;


--
-- TOC entry 3514 (class 2606 OID 25555)
-- Name: Combate Combate_N_Objeto_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Combate"
    ADD CONSTRAINT "Combate_N_Objeto_fkey" FOREIGN KEY ("N_Objeto") REFERENCES public."Objeto"("Nombre") ON UPDATE CASCADE;


--
-- TOC entry 3515 (class 2606 OID 25545)
-- Name: Combate Combate_N_Personaje_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Combate"
    ADD CONSTRAINT "Combate_N_Personaje_fkey" FOREIGN KEY ("N_Personaje") REFERENCES public."Personaje"("Nombre") ON UPDATE CASCADE;


--
-- TOC entry 3516 (class 2606 OID 25550)
-- Name: Combate Combate_N_Poder_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Combate"
    ADD CONSTRAINT "Combate_N_Poder_fkey" FOREIGN KEY ("N_Poder") REFERENCES public."Poder"("Nombre") ON UPDATE CASCADE;


--
-- TOC entry 3474 (class 2606 OID 25327)
-- Name: Crea Crea_N_Objeto_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Crea"
    ADD CONSTRAINT "Crea_N_Objeto_fkey" FOREIGN KEY ("N_Objeto") REFERENCES public."Objeto"("Nombre") ON UPDATE CASCADE NOT VALID;


--
-- TOC entry 3475 (class 2606 OID 25332)
-- Name: Crea Crea_N_Personaje_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Crea"
    ADD CONSTRAINT "Crea_N_Personaje_fkey" FOREIGN KEY ("N_Personaje") REFERENCES public."Personaje"("Nombre") ON UPDATE CASCADE NOT VALID;


--
-- TOC entry 3476 (class 2606 OID 25337)
-- Name: Enfrenta Enfrenta_N_Heroe_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Enfrenta"
    ADD CONSTRAINT "Enfrenta_N_Heroe_fkey" FOREIGN KEY ("N_Heroe") REFERENCES public."Heroe"("N_Heroe") ON UPDATE CASCADE NOT VALID;


--
-- TOC entry 3477 (class 2606 OID 25342)
-- Name: Enfrenta Enfrenta_N_Villano_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Enfrenta"
    ADD CONSTRAINT "Enfrenta_N_Villano_fkey" FOREIGN KEY ("N_Villano") REFERENCES public."Villano"("N_Villano") ON UPDATE CASCADE NOT VALID;


--
-- TOC entry 3478 (class 2606 OID 25347)
-- Name: Esta Esta_N_Personaje_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Esta"
    ADD CONSTRAINT "Esta_N_Personaje_fkey" FOREIGN KEY ("N_Personaje") REFERENCES public."Personaje"("Nombre") ON UPDATE CASCADE NOT VALID;


--
-- TOC entry 3479 (class 2606 OID 25352)
-- Name: Esta Esta_N_Titulo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Esta"
    ADD CONSTRAINT "Esta_N_Titulo_fkey" FOREIGN KEY ("N_Titulo") REFERENCES public."Medio"("Titulo") ON UPDATE CASCADE NOT VALID;


--
-- TOC entry 3480 (class 2606 OID 25527)
-- Name: Estado Estado_Id_Pais_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Estado"
    ADD CONSTRAINT "Estado_Id_Pais_fkey" FOREIGN KEY ("Id_Pais") REFERENCES public."Pais"("Id_Pais") ON UPDATE CASCADE NOT VALID;


--
-- TOC entry 3481 (class 2606 OID 25357)
-- Name: Heroe Heroe_Archienemigo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Heroe"
    ADD CONSTRAINT "Heroe_Archienemigo_fkey" FOREIGN KEY ("Archienemigo") REFERENCES public."Villano"("N_Villano") ON UPDATE CASCADE NOT VALID;


--
-- TOC entry 3482 (class 2606 OID 25362)
-- Name: Heroe Heroe_N_Heroe_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Heroe"
    ADD CONSTRAINT "Heroe_N_Heroe_fkey" FOREIGN KEY ("N_Heroe") REFERENCES public."Personaje"("Nombre") ON UPDATE CASCADE NOT VALID;


--
-- TOC entry 3483 (class 2606 OID 25392)
-- Name: Historial Historial_Id_Perfil_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Historial"
    ADD CONSTRAINT "Historial_Id_Perfil_fkey" FOREIGN KEY ("Id_Perfil") REFERENCES public."Perfil"("Id_Perfil") ON UPDATE CASCADE NOT VALID;


--
-- TOC entry 3484 (class 2606 OID 25387)
-- Name: Historial Historial_N_Titulo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Historial"
    ADD CONSTRAINT "Historial_N_Titulo_fkey" FOREIGN KEY ("N_Titulo") REFERENCES public."Medio"("Titulo") ON UPDATE CASCADE NOT VALID;


--
-- TOC entry 3485 (class 2606 OID 25367)
-- Name: Juego Juego_T_Juego_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Juego"
    ADD CONSTRAINT "Juego_T_Juego_fkey" FOREIGN KEY ("T_Juego") REFERENCES public."Medio"("Titulo") ON UPDATE CASCADE NOT VALID;


--
-- TOC entry 3509 (class 2606 OID 25497)
-- Name: Serie Medio_T_Serie_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Serie"
    ADD CONSTRAINT "Medio_T_Serie_fkey" FOREIGN KEY ("T_Serie") REFERENCES public."Medio"("Titulo") ON UPDATE CASCADE NOT VALID;


--
-- TOC entry 3486 (class 2606 OID 25532)
-- Name: Objeto Objeto_N_Personaje_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Objeto"
    ADD CONSTRAINT "Objeto_N_Personaje_fkey" FOREIGN KEY ("N_Personaje") REFERENCES public."Personaje"("Nombre") ON UPDATE CASCADE NOT VALID;


--
-- TOC entry 3487 (class 2606 OID 25565)
-- Name: Organizacion Organizacion_Fundador_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Organizacion"
    ADD CONSTRAINT "Organizacion_Fundador_fkey" FOREIGN KEY ("Fundador") REFERENCES public."Personaje"("Nombre") ON UPDATE CASCADE NOT VALID;


--
-- TOC entry 3488 (class 2606 OID 25560)
-- Name: Organizacion Organizacion_Lider_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Organizacion"
    ADD CONSTRAINT "Organizacion_Lider_fkey" FOREIGN KEY ("Lider") REFERENCES public."Personaje"("Nombre") ON UPDATE CASCADE NOT VALID;


--
-- TOC entry 3489 (class 2606 OID 25397)
-- Name: Pelicula Pelicula_T_Pelicula_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Pelicula"
    ADD CONSTRAINT "Pelicula_T_Pelicula_fkey" FOREIGN KEY ("T_Pelicula") REFERENCES public."Medio"("Titulo") ON UPDATE CASCADE NOT VALID;


--
-- TOC entry 3490 (class 2606 OID 25402)
-- Name: Perfil Perfil_Email_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Perfil"
    ADD CONSTRAINT "Perfil_Email_fkey" FOREIGN KEY ("Email") REFERENCES public."Usuario"("Email") ON UPDATE CASCADE NOT VALID;


--
-- TOC entry 3491 (class 2606 OID 25407)
-- Name: Pers_Creador Pers_Creador_N_Creador_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Pers_Creador"
    ADD CONSTRAINT "Pers_Creador_N_Creador_fkey" FOREIGN KEY ("N_Creador") REFERENCES public."Creador"("Nom_Creador") ON UPDATE CASCADE NOT VALID;


--
-- TOC entry 3492 (class 2606 OID 25412)
-- Name: Pers_Creador Pers_Creador_N_Personaje_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Pers_Creador"
    ADD CONSTRAINT "Pers_Creador_N_Personaje_fkey" FOREIGN KEY ("N_Personaje") REFERENCES public."Personaje"("Nombre") ON UPDATE CASCADE NOT VALID;


--
-- TOC entry 3493 (class 2606 OID 25417)
-- Name: Pers_Nac Pers_Nac_N_Personaje_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Pers_Nac"
    ADD CONSTRAINT "Pers_Nac_N_Personaje_fkey" FOREIGN KEY ("N_Personaje") REFERENCES public."Personaje"("Nombre") ON UPDATE CASCADE NOT VALID;


--
-- TOC entry 3494 (class 2606 OID 25422)
-- Name: Pers_Nac Pers_Nac_Nacionalidad_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Pers_Nac"
    ADD CONSTRAINT "Pers_Nac_Nacionalidad_fkey" FOREIGN KEY ("Nacionalidad") REFERENCES public."Nacionalidad"("Nac") ON UPDATE CASCADE NOT VALID;


--
-- TOC entry 3495 (class 2606 OID 25427)
-- Name: Pers_Oc Pers_Oc_N_Personaje_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Pers_Oc"
    ADD CONSTRAINT "Pers_Oc_N_Personaje_fkey" FOREIGN KEY ("N_Personaje") REFERENCES public."Personaje"("Nombre") ON UPDATE CASCADE NOT VALID;


--
-- TOC entry 3496 (class 2606 OID 25432)
-- Name: Pers_Oc Pers_Oc_Ocupacion_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Pers_Oc"
    ADD CONSTRAINT "Pers_Oc_Ocupacion_fkey" FOREIGN KEY ("Ocupacion") REFERENCES public."Ocupacion"("Ocup") ON UPDATE CASCADE NOT VALID;


--
-- TOC entry 3497 (class 2606 OID 25437)
-- Name: Pertenece Pertenece_Cod_Cargo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Pertenece"
    ADD CONSTRAINT "Pertenece_Cod_Cargo_fkey" FOREIGN KEY ("Cod_Cargo") REFERENCES public."Cargo"("Cod_Cargo") ON UPDATE CASCADE NOT VALID;


--
-- TOC entry 3498 (class 2606 OID 25442)
-- Name: Pertenece Pertenece_N_Organizacion_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Pertenece"
    ADD CONSTRAINT "Pertenece_N_Organizacion_fkey" FOREIGN KEY ("N_Organizacion") REFERENCES public."Organizacion"("Nombre") ON UPDATE CASCADE NOT VALID;


--
-- TOC entry 3499 (class 2606 OID 25447)
-- Name: Pertenece Pertenece_N_Personaje_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Pertenece"
    ADD CONSTRAINT "Pertenece_N_Personaje_fkey" FOREIGN KEY ("N_Personaje") REFERENCES public."Personaje"("Nombre") ON UPDATE CASCADE NOT VALID;


--
-- TOC entry 3500 (class 2606 OID 25452)
-- Name: Plat_Juego Plat_Juego_Plataforma_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Plat_Juego"
    ADD CONSTRAINT "Plat_Juego_Plataforma_fkey" FOREIGN KEY ("Plataforma") REFERENCES public."Plataforma"(nombre) ON UPDATE CASCADE NOT VALID;


--
-- TOC entry 3501 (class 2606 OID 25457)
-- Name: Plat_Juego Plat_Juego_T_Juego_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Plat_Juego"
    ADD CONSTRAINT "Plat_Juego_T_Juego_fkey" FOREIGN KEY ("T_Juego") REFERENCES public."Juego"("T_Juego") ON UPDATE CASCADE NOT VALID;


--
-- TOC entry 3502 (class 2606 OID 25462)
-- Name: Posee Posee_N_Personaje_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Posee"
    ADD CONSTRAINT "Posee_N_Personaje_fkey" FOREIGN KEY ("N_Personaje") REFERENCES public."Personaje"("Nombre") ON UPDATE CASCADE NOT VALID;


--
-- TOC entry 3503 (class 2606 OID 25467)
-- Name: Posee Posee_N_Poder_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Posee"
    ADD CONSTRAINT "Posee_N_Poder_fkey" FOREIGN KEY ("N_Poder") REFERENCES public."Poder"("Nombre") ON UPDATE CASCADE NOT VALID;


--
-- TOC entry 3504 (class 2606 OID 25472)
-- Name: RelacionadoHer RelacionadoHer_N_Civil_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RelacionadoHer"
    ADD CONSTRAINT "RelacionadoHer_N_Civil_fkey" FOREIGN KEY ("N_Civil") REFERENCES public."Civil"("N_Civil") ON UPDATE CASCADE NOT VALID;


--
-- TOC entry 3505 (class 2606 OID 25477)
-- Name: RelacionadoHer RelacionadoHer_N_Heroe_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RelacionadoHer"
    ADD CONSTRAINT "RelacionadoHer_N_Heroe_fkey" FOREIGN KEY ("N_Heroe") REFERENCES public."Heroe"("N_Heroe") ON UPDATE CASCADE NOT VALID;


--
-- TOC entry 3506 (class 2606 OID 25482)
-- Name: RelacionadoVill RelacionadoVill_N_Civil_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RelacionadoVill"
    ADD CONSTRAINT "RelacionadoVill_N_Civil_fkey" FOREIGN KEY ("N_Civil") REFERENCES public."Civil"("N_Civil") ON UPDATE CASCADE NOT VALID;


--
-- TOC entry 3507 (class 2606 OID 25487)
-- Name: RelacionadoVill RelacionadoVill_N_Villano_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RelacionadoVill"
    ADD CONSTRAINT "RelacionadoVill_N_Villano_fkey" FOREIGN KEY ("N_Villano") REFERENCES public."Villano"("N_Villano") ON UPDATE CASCADE NOT VALID;


--
-- TOC entry 3508 (class 2606 OID 25492)
-- Name: Sede Sede_N_Org_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Sede"
    ADD CONSTRAINT "Sede_N_Org_fkey" FOREIGN KEY ("N_Org") REFERENCES public."Organizacion"("Nombre") ON UPDATE CASCADE NOT VALID;


--
-- TOC entry 3510 (class 2606 OID 25502)
-- Name: Usuario Usuario_Direccion_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Usuario"
    ADD CONSTRAINT "Usuario_Direccion_fkey" FOREIGN KEY ("Direccion") REFERENCES public."Ciudad"("Id_Ciudad") ON UPDATE CASCADE NOT VALID;


--
-- TOC entry 3511 (class 2606 OID 25512)
-- Name: Usuario Usuario_Id_Suscripcion_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Usuario"
    ADD CONSTRAINT "Usuario_Id_Suscripcion_fkey" FOREIGN KEY ("Id_Suscripcion") REFERENCES public."Suscripcion"("ID") ON UPDATE CASCADE NOT VALID;


--
-- TOC entry 3512 (class 2606 OID 25507)
-- Name: Usuario Usuario_N_Tarjeta_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Usuario"
    ADD CONSTRAINT "Usuario_N_Tarjeta_fkey" FOREIGN KEY ("N_Tarjeta") REFERENCES public."Tarjeta"("N_Tarjeta") ON UPDATE CASCADE NOT VALID;


--
-- TOC entry 3513 (class 2606 OID 25517)
-- Name: Villano Villano_N_Villano_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Villano"
    ADD CONSTRAINT "Villano_N_Villano_fkey" FOREIGN KEY ("N_Villano") REFERENCES public."Personaje"("Nombre") ON UPDATE CASCADE NOT VALID;


-- Completed on 2023-06-26 18:58:57

--
-- PostgreSQL database dump complete
--

