PGDMP     6    4                {            Backup1    15.3    15.3 �    |           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            }           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            ~           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    24642    Backup1    DATABASE     �   CREATE DATABASE "Backup1" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
    DROP DATABASE "Backup1";
                postgres    false                       1255    24643    archienemigo()    FUNCTION     ;  CREATE FUNCTION public.archienemigo() RETURNS trigger
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
 %   DROP FUNCTION public.archienemigo();
       public          postgres    false                       1255    24644 
   emarital()    FUNCTION     =  CREATE FUNCTION public.emarital() RETURNS trigger
    LANGUAGE plpgsql
    AS $$BEGIN

IF new."E_Marital" != 'Soltero' AND new."E_Marital" != 'Casado' AND new."E_Marital" != 'Viudo' AND new."E_Marital" != 'Divorciado' THEN
	RAISE EXCEPTION 'El genero debe ser "M", "F", "Desc", "Otro"';
END IF;

RETURN NEW;
END;
$$;
 !   DROP FUNCTION public.emarital();
       public          postgres    false                       1255    24645    ganancia_perdida()    FUNCTION     �   CREATE FUNCTION public.ganancia_perdida() RETURNS trigger
    LANGUAGE plpgsql
    AS $$begin

if new."Ganancia" < new."Coste" then
	raise exception 'Las perdidas de la pelicula son mayores a sus ganancias';
end if;
return new;
end;
$$;
 )   DROP FUNCTION public.ganancia_perdida();
       public          postgres    false                       1255    24646    genero()    FUNCTION     4  CREATE FUNCTION public.genero() RETURNS trigger
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
    DROP FUNCTION public.genero();
       public          postgres    false                       1255    24647    numcalificacion()    FUNCTION       CREATE FUNCTION public.numcalificacion() RETURNS trigger
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
 (   DROP FUNCTION public.numcalificacion();
       public          postgres    false                       1255    24648 	   numperf()    FUNCTION     3  CREATE FUNCTION public.numperf() RETURNS trigger
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
     DROP FUNCTION public.numperf();
       public          postgres    false                       1255    24649    numrating()    FUNCTION     �   CREATE FUNCTION public.numrating() RETURNS trigger
    LANGUAGE plpgsql
    AS $$BEGIN

IF new."Rating" < 1 OR new."Rating" > 5 THEN
	RAISE EXCEPTION 'El rating debe ser un numero entre 1 y 5';
END IF;

RETURN NEW;
END;
$$;
 "   DROP FUNCTION public.numrating();
       public          postgres    false            	           1255    24650    numusuarios()    FUNCTION     Y  CREATE FUNCTION public.numusuarios() RETURNS trigger
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
 $   DROP FUNCTION public.numusuarios();
       public          postgres    false            
           1255    24651    rolpersonaje()    FUNCTION     6  CREATE FUNCTION public.rolpersonaje() RETURNS trigger
    LANGUAGE plpgsql
    AS $$begin

if new."Rol" != 'Antagonista' AND new."Rol" != 'Protagonista' AND new."Rol" != 'Secundario' then
	raise exception 'Un personaje solo puede ser "Protagonista", "Antagonista" o "Secundario"';
end if;
return new;
end;
$$;
 %   DROP FUNCTION public.rolpersonaje();
       public          postgres    false                       1255    24652    tipoactor()    FUNCTION       CREATE FUNCTION public.tipoactor() RETURNS trigger
    LANGUAGE plpgsql
    AS $$begin

if new."Tipo_Actor" != 'Interpretado' AND new."Tipo_Actor" != 'Presta su voz' then
	raise exception 'Un actor solo puede Interpretar un personaje o Prestar su Voz';
end if;
return new;
end;
$$;
 "   DROP FUNCTION public.tipoactor();
       public          postgres    false                       1255    24653    tiposuscripciones()    FUNCTION     �  CREATE FUNCTION public.tiposuscripciones() RETURNS trigger
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
 *   DROP FUNCTION public.tiposuscripciones();
       public          postgres    false            �            1259    24654    Aparece    TABLE     '  CREATE TABLE public."Aparece" (
    "N_Organizacion" text NOT NULL,
    "N_Titulo" text NOT NULL,
    "Estado" text NOT NULL,
    "Rol" text NOT NULL,
    CONSTRAINT "Aparece_Rol_check" CHECK ((("Rol" = 'Antagonista'::text) OR ("Rol" = 'Protagonista'::text) OR ("Rol" = 'Secundario'::text)))
);
    DROP TABLE public."Aparece";
       public         heap    postgres    false            �            1259    24660    Cargo    TABLE     c   CREATE TABLE public."Cargo" (
    "Cod_Cargo" integer NOT NULL,
    "Descripcion" text NOT NULL
);
    DROP TABLE public."Cargo";
       public         heap    postgres    false            �            1259    24665    Cargo_Cod_Cargo_seq    SEQUENCE     �   CREATE SEQUENCE public."Cargo_Cod_Cargo_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public."Cargo_Cod_Cargo_seq";
       public          postgres    false    215            �           0    0    Cargo_Cod_Cargo_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public."Cargo_Cod_Cargo_seq" OWNED BY public."Cargo"."Cod_Cargo";
          public          postgres    false    216            �            1259    24666    Ciudad    TABLE     �   CREATE TABLE public."Ciudad" (
    "Id_Ciudad" integer NOT NULL,
    "Nombre" text NOT NULL,
    "Id_Estado" integer NOT NULL
);
    DROP TABLE public."Ciudad";
       public         heap    postgres    false            �            1259    24671    Ciudad_Id_Ciudad_seq    SEQUENCE     �   CREATE SEQUENCE public."Ciudad_Id_Ciudad_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public."Ciudad_Id_Ciudad_seq";
       public          postgres    false    217            �           0    0    Ciudad_Id_Ciudad_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public."Ciudad_Id_Ciudad_seq" OWNED BY public."Ciudad"."Id_Ciudad";
          public          postgres    false    218            �            1259    24672    Civil    TABLE     =   CREATE TABLE public."Civil" (
    "N_Civil" text NOT NULL
);
    DROP TABLE public."Civil";
       public         heap    postgres    false            �            1259    25538    Combate    TABLE     �   CREATE TABLE public."Combate" (
    "N_Personaje" text NOT NULL,
    "N_Poder" text NOT NULL,
    "N_Objeto" text DEFAULT 'No Objeto'::text NOT NULL,
    "Fecha" date NOT NULL,
    "Lugar" text NOT NULL
);
    DROP TABLE public."Combate";
       public         heap    postgres    false            �            1259    24682    Crea    TABLE     ^   CREATE TABLE public."Crea" (
    "N_Personaje" text NOT NULL,
    "N_Objeto" text NOT NULL
);
    DROP TABLE public."Crea";
       public         heap    postgres    false            �            1259    24687    Creador    TABLE     C   CREATE TABLE public."Creador" (
    "Nom_Creador" text NOT NULL
);
    DROP TABLE public."Creador";
       public         heap    postgres    false            �            1259    24692    Enfrenta    TABLE     _   CREATE TABLE public."Enfrenta" (
    "N_Heroe" text NOT NULL,
    "N_Villano" text NOT NULL
);
    DROP TABLE public."Enfrenta";
       public         heap    postgres    false            �            1259    24697    Esta    TABLE     �  CREATE TABLE public."Esta" (
    "N_Personaje" text NOT NULL,
    "N_Titulo" text NOT NULL,
    "Tipo_Actor" text NOT NULL,
    "Rol" text NOT NULL,
    "Actor" text NOT NULL,
    CONSTRAINT "Esta_Rol_check" CHECK ((("Rol" = 'Antagonista'::text) OR ("Rol" = 'Protagonista'::text) OR ("Rol" = 'Secundario'::text))),
    CONSTRAINT "Esta_Tipo_Actor_check" CHECK ((("Tipo_Actor" = 'Interpretado'::text) OR ("Tipo_Actor" = 'Presta su voz'::text)))
);
    DROP TABLE public."Esta";
       public         heap    postgres    false            �            1259    24704    Estado    TABLE        CREATE TABLE public."Estado" (
    "Id_Estado" integer NOT NULL,
    "Nombre" text NOT NULL,
    "Id_Pais" integer NOT NULL
);
    DROP TABLE public."Estado";
       public         heap    postgres    false            �            1259    24709    Estado_Id_Estado_seq    SEQUENCE     �   CREATE SEQUENCE public."Estado_Id_Estado_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public."Estado_Id_Estado_seq";
       public          postgres    false    224            �           0    0    Estado_Id_Estado_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public."Estado_Id_Estado_seq" OWNED BY public."Estado"."Id_Estado";
          public          postgres    false    225            �            1259    24710    Heroe    TABLE     6  CREATE TABLE public."Heroe" (
    "N_Heroe" text NOT NULL,
    "Alias" text NOT NULL,
    "Logotipo" text,
    "Color_Traje" text,
    "Archienemigo" text,
    CONSTRAINT "Heroe_Color_Traje_check" CHECK ((("Color_Traje" !~~ '%0%'::text) AND ("Color_Traje" !~~ '%1%'::text) AND ("Color_Traje" !~~ '%2%'::text) AND ("Color_Traje" !~~ '%3%'::text) AND ("Color_Traje" !~~ '%4%'::text) AND ("Color_Traje" !~~ '%5%'::text) AND ("Color_Traje" !~~ '%6%'::text) AND ("Color_Traje" !~~ '%7%'::text) AND ("Color_Traje" !~~ '%8%'::text) AND ("Color_Traje" !~~ '%9%'::text)))
);
    DROP TABLE public."Heroe";
       public         heap    postgres    false                       1259    25777 	   Historial    TABLE     �   CREATE TABLE public."Historial" (
    "Id_Perfil" integer NOT NULL,
    "N_Titulo" text NOT NULL,
    "Id_Hist" integer NOT NULL,
    "Calificacion" integer,
    "Tiempo_Reproduccion" integer
);
    DROP TABLE public."Historial";
       public         heap    postgres    false                        1259    25776    Historial_Id_Hist_seq    SEQUENCE     �   CREATE SEQUENCE public."Historial_Id_Hist_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public."Historial_Id_Hist_seq";
       public          postgres    false    257            �           0    0    Historial_Id_Hist_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public."Historial_Id_Hist_seq" OWNED BY public."Historial"."Id_Hist";
          public          postgres    false    256            �            1259    24722    Juego    TABLE     y   CREATE TABLE public."Juego" (
    "T_Juego" text NOT NULL,
    "Distribuidor" text NOT NULL,
    "Tipo" text NOT NULL
);
    DROP TABLE public."Juego";
       public         heap    postgres    false            �            1259    24727    Medio    TABLE     S  CREATE TABLE public."Medio" (
    "Titulo" text NOT NULL,
    "Fecha_Estreno" date NOT NULL,
    "Compania" text NOT NULL,
    "Rating" integer NOT NULL,
    "Sinopsis" text NOT NULL,
    "Imagen" text,
    "Duracion" integer,
    "Suscripcion" integer,
    CONSTRAINT "Medio_Rating_check" CHECK ((("Rating" >= 1) AND ("Rating" <= 5)))
);
    DROP TABLE public."Medio";
       public         heap    postgres    false            �            1259    24733    Nacionalidad    TABLE     @   CREATE TABLE public."Nacionalidad" (
    "Nac" text NOT NULL
);
 "   DROP TABLE public."Nacionalidad";
       public         heap    postgres    false            �            1259    24738    Objeto    TABLE     �   CREATE TABLE public."Objeto" (
    "Nombre" text NOT NULL,
    "Descripcion" text,
    "Material" text,
    "Tipo" text NOT NULL,
    "Imagen" text NOT NULL,
    "N_Personaje" text
);
    DROP TABLE public."Objeto";
       public         heap    postgres    false            �            1259    24743 	   Ocupacion    TABLE     >   CREATE TABLE public."Ocupacion" (
    "Ocup" text NOT NULL
);
    DROP TABLE public."Ocupacion";
       public         heap    postgres    false            �            1259    24748    Organizacion    TABLE       CREATE TABLE public."Organizacion" (
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
 "   DROP TABLE public."Organizacion";
       public         heap    postgres    false            �            1259    24753    Pais    TABLE     [   CREATE TABLE public."Pais" (
    "Id_Pais" integer NOT NULL,
    "Nombre" text NOT NULL
);
    DROP TABLE public."Pais";
       public         heap    postgres    false            �            1259    24758    Pais_Id_Pais_seq    SEQUENCE     �   CREATE SEQUENCE public."Pais_Id_Pais_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public."Pais_Id_Pais_seq";
       public          postgres    false    233            �           0    0    Pais_Id_Pais_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public."Pais_Id_Pais_seq" OWNED BY public."Pais"."Id_Pais";
          public          postgres    false    234            �            1259    24759    Pelicula    TABLE     J  CREATE TABLE public."Pelicula" (
    "T_Pelicula" text NOT NULL,
    "Director" text NOT NULL,
    "Coste" integer NOT NULL,
    "Ganancia" integer NOT NULL,
    "Distribuidor" text,
    "Tipo" text,
    CONSTRAINT "Pelicula_Coste_check" CHECK (("Coste" > 0)),
    CONSTRAINT "Pelicula_Ganancia_check" CHECK (("Ganancia" > 0))
);
    DROP TABLE public."Pelicula";
       public         heap    postgres    false            �            1259    24767    Perfil    TABLE       CREATE TABLE public."Perfil" (
    "Id_Perfil" integer NOT NULL,
    "Dispositivo" text NOT NULL,
    "Nombre" text NOT NULL,
    "Idioma" text NOT NULL,
    "Email" text NOT NULL,
    "Imagen" integer NOT NULL,
    CONSTRAINT "Perfil_Id_Perfil_check" CHECK (("Id_Perfil" >= 0))
);
    DROP TABLE public."Perfil";
       public         heap    postgres    false            �            1259    24773    Perfil_Id_Perfil_seq    SEQUENCE     �   CREATE SEQUENCE public."Perfil_Id_Perfil_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public."Perfil_Id_Perfil_seq";
       public          postgres    false    236            �           0    0    Perfil_Id_Perfil_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public."Perfil_Id_Perfil_seq" OWNED BY public."Perfil"."Id_Perfil";
          public          postgres    false    237            �            1259    24774    Pers_Creador    TABLE     g   CREATE TABLE public."Pers_Creador" (
    "N_Personaje" text NOT NULL,
    "N_Creador" text NOT NULL
);
 "   DROP TABLE public."Pers_Creador";
       public         heap    postgres    false            �            1259    24779    Pers_Nac    TABLE     f   CREATE TABLE public."Pers_Nac" (
    "N_Personaje" text NOT NULL,
    "Nacionalidad" text NOT NULL
);
    DROP TABLE public."Pers_Nac";
       public         heap    postgres    false            �            1259    24784    Pers_Oc    TABLE     b   CREATE TABLE public."Pers_Oc" (
    "N_Personaje" text NOT NULL,
    "Ocupacion" text NOT NULL
);
    DROP TABLE public."Pers_Oc";
       public         heap    postgres    false            �            1259    24789 	   Personaje    TABLE     O  CREATE TABLE public."Personaje" (
    "Nombre" text NOT NULL,
    "Genero" text,
    "Color_Ojos" text,
    "Color_Pelo" text,
    "Nom_Comic" text NOT NULL,
    "E_Marital" text NOT NULL,
    imagen text,
    CONSTRAINT "Personaje_Color_Ojos_check" CHECK ((("Color_Ojos" !~~ '%0%'::text) AND ("Color_Ojos" !~~ '%1%'::text) AND ("Color_Ojos" !~~ '%2%'::text) AND ("Color_Ojos" !~~ '%3%'::text) AND ("Color_Ojos" !~~ '%4%'::text) AND ("Color_Ojos" !~~ '%5%'::text) AND ("Color_Ojos" !~~ '%6%'::text) AND ("Color_Ojos" !~~ '%7%'::text) AND ("Color_Ojos" !~~ '%8%'::text) AND ("Color_Ojos" !~~ '%9%'::text))),
    CONSTRAINT "Personaje_Color_Pelo_check" CHECK ((("Color_Pelo" !~~ '%0%'::text) AND ("Color_Pelo" !~~ '%1%'::text) AND ("Color_Pelo" !~~ '%2%'::text) AND ("Color_Pelo" !~~ '%3%'::text) AND ("Color_Pelo" !~~ '%4%'::text) AND ("Color_Pelo" !~~ '%5%'::text) AND ("Color_Pelo" !~~ '%6%'::text) AND ("Color_Pelo" !~~ '%7%'::text) AND ("Color_Pelo" !~~ '%8%'::text) AND ("Color_Pelo" !~~ '%9%'::text))),
    CONSTRAINT "Personaje_E_Marital_check" CHECK ((("E_Marital" = 'Soltero'::text) OR ("E_Marital" = 'Casado'::text) OR ("E_Marital" = 'Viudo'::text) OR ("E_Marital" = 'Divorciado'::text))),
    CONSTRAINT "Personaje_Genero_check" CHECK ((("Genero" = 'M'::text) OR ("Genero" = 'F'::text) OR ("Genero" = 'Desc'::text) OR ("Genero" = 'Otro'::text)))
);
    DROP TABLE public."Personaje";
       public         heap    postgres    false            �            1259    24798 	   Pertenece    TABLE     �   CREATE TABLE public."Pertenece" (
    "N_Personaje" text NOT NULL,
    "N_Organizacion" text NOT NULL,
    "Cod_Cargo" integer NOT NULL
);
    DROP TABLE public."Pertenece";
       public         heap    postgres    false            �            1259    24803 
   Plat_Juego    TABLE     b   CREATE TABLE public."Plat_Juego" (
    "T_Juego" text NOT NULL,
    "Plataforma" text NOT NULL
);
     DROP TABLE public."Plat_Juego";
       public         heap    postgres    false            �            1259    24808 
   Plataforma    TABLE     ?   CREATE TABLE public."Plataforma" (
    nombre text NOT NULL
);
     DROP TABLE public."Plataforma";
       public         heap    postgres    false            �            1259    24813    Poder    TABLE     p   CREATE TABLE public."Poder" (
    "Nombre" text NOT NULL,
    "Imagen" text NOT NULL,
    "Descripcion" text
);
    DROP TABLE public."Poder";
       public         heap    postgres    false            �            1259    24818    Posee    TABLE       CREATE TABLE public."Posee" (
    "N_Personaje" text NOT NULL,
    "N_Poder" text NOT NULL,
    "Obtencion" text NOT NULL,
    CONSTRAINT "Posee_Obtencion_check" CHECK ((("Obtencion" = 'Natural'::text) OR ("Obtencion" = 'Artificial'::text) OR ("Obtencion" = 'Hereditario'::text)))
);
    DROP TABLE public."Posee";
       public         heap    postgres    false            �            1259    24824    RelacionadoHer    TABLE     c   CREATE TABLE public."RelacionadoHer" (
    "N_Civil" text NOT NULL,
    "N_Heroe" text NOT NULL
);
 $   DROP TABLE public."RelacionadoHer";
       public         heap    postgres    false            �            1259    24829    RelacionadoVill    TABLE     f   CREATE TABLE public."RelacionadoVill" (
    "N_Civil" text NOT NULL,
    "N_Villano" text NOT NULL
);
 %   DROP TABLE public."RelacionadoVill";
       public         heap    postgres    false            �            1259    24834    Sede    TABLE     �   CREATE TABLE public."Sede" (
    "Nombre" text NOT NULL,
    "Tipo_Edif" text,
    "Ubicacion" text NOT NULL,
    "Imagen" text NOT NULL,
    "N_Org" text NOT NULL
);
    DROP TABLE public."Sede";
       public         heap    postgres    false            �            1259    24839    Serie    TABLE     �   CREATE TABLE public."Serie" (
    "T_Serie" text NOT NULL,
    "N_Episodios" integer NOT NULL,
    "Creador" text NOT NULL,
    "Canal" text NOT NULL,
    "Tipo" text
);
    DROP TABLE public."Serie";
       public         heap    postgres    false            �            1259    24844    Suscripcion    TABLE     �  CREATE TABLE public."Suscripcion" (
    "ID" integer NOT NULL,
    "Tarifa" real NOT NULL,
    "Descripcion" text NOT NULL,
    "Tipo" text NOT NULL,
    CONSTRAINT "Suscripcion_Tarifa_check" CHECK (("Tarifa" >= (0)::double precision)),
    CONSTRAINT "Suscripcion_Tipo_check" CHECK ((("Tipo" = 'Gold'::text) OR ("Tipo" = 'Vip'::text) OR ("Tipo" = 'Premium'::text) OR ("Tipo" = 'Free'::text)))
);
 !   DROP TABLE public."Suscripcion";
       public         heap    postgres    false            �            1259    24851    Tarjeta    TABLE     F  CREATE TABLE public."Tarjeta" (
    "N_Tarjeta" text NOT NULL,
    "Cod_Seguridad" integer NOT NULL,
    "Fecha_Ven" date NOT NULL,
    CONSTRAINT "Tarjeta_Cod_Seguridad_check" CHECK ((("Cod_Seguridad" >= 100) AND ("Cod_Seguridad" <= 999))),
    CONSTRAINT "Tarjeta_N_Tarjeta_check" CHECK ((char_length("N_Tarjeta") = 16))
);
    DROP TABLE public."Tarjeta";
       public         heap    postgres    false            �            1259    24858    Usuario    TABLE     �  CREATE TABLE public."Usuario" (
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
    DROP TABLE public."Usuario";
       public         heap    postgres    false            �            1259    24864    Villano    TABLE     q   CREATE TABLE public."Villano" (
    "N_Villano" text NOT NULL,
    "Alias" text NOT NULL,
    "Objetivo" text
);
    DROP TABLE public."Villano";
       public         heap    postgres    false            	           2604    24869    Cargo Cod_Cargo    DEFAULT     x   ALTER TABLE ONLY public."Cargo" ALTER COLUMN "Cod_Cargo" SET DEFAULT nextval('public."Cargo_Cod_Cargo_seq"'::regclass);
 B   ALTER TABLE public."Cargo" ALTER COLUMN "Cod_Cargo" DROP DEFAULT;
       public          postgres    false    216    215            
           2604    24870    Ciudad Id_Ciudad    DEFAULT     z   ALTER TABLE ONLY public."Ciudad" ALTER COLUMN "Id_Ciudad" SET DEFAULT nextval('public."Ciudad_Id_Ciudad_seq"'::regclass);
 C   ALTER TABLE public."Ciudad" ALTER COLUMN "Id_Ciudad" DROP DEFAULT;
       public          postgres    false    218    217                       2604    24871    Estado Id_Estado    DEFAULT     z   ALTER TABLE ONLY public."Estado" ALTER COLUMN "Id_Estado" SET DEFAULT nextval('public."Estado_Id_Estado_seq"'::regclass);
 C   ALTER TABLE public."Estado" ALTER COLUMN "Id_Estado" DROP DEFAULT;
       public          postgres    false    225    224                       2604    25780    Historial Id_Hist    DEFAULT     |   ALTER TABLE ONLY public."Historial" ALTER COLUMN "Id_Hist" SET DEFAULT nextval('public."Historial_Id_Hist_seq"'::regclass);
 D   ALTER TABLE public."Historial" ALTER COLUMN "Id_Hist" DROP DEFAULT;
       public          postgres    false    256    257    257                       2604    24872    Pais Id_Pais    DEFAULT     r   ALTER TABLE ONLY public."Pais" ALTER COLUMN "Id_Pais" SET DEFAULT nextval('public."Pais_Id_Pais_seq"'::regclass);
 ?   ALTER TABLE public."Pais" ALTER COLUMN "Id_Pais" DROP DEFAULT;
       public          postgres    false    234    233                       2604    24873    Perfil Id_Perfil    DEFAULT     z   ALTER TABLE ONLY public."Perfil" ALTER COLUMN "Id_Perfil" SET DEFAULT nextval('public."Perfil_Id_Perfil_seq"'::regclass);
 C   ALTER TABLE public."Perfil" ALTER COLUMN "Id_Perfil" DROP DEFAULT;
       public          postgres    false    237    236            N          0    24654    Aparece 
   TABLE DATA           R   COPY public."Aparece" ("N_Organizacion", "N_Titulo", "Estado", "Rol") FROM stdin;
    public          postgres    false    214   .      O          0    24660    Cargo 
   TABLE DATA           =   COPY public."Cargo" ("Cod_Cargo", "Descripcion") FROM stdin;
    public          postgres    false    215   /      Q          0    24666    Ciudad 
   TABLE DATA           F   COPY public."Ciudad" ("Id_Ciudad", "Nombre", "Id_Estado") FROM stdin;
    public          postgres    false    217   V/      S          0    24672    Civil 
   TABLE DATA           ,   COPY public."Civil" ("N_Civil") FROM stdin;
    public          postgres    false    219   �/      w          0    25538    Combate 
   TABLE DATA           [   COPY public."Combate" ("N_Personaje", "N_Poder", "N_Objeto", "Fecha", "Lugar") FROM stdin;
    public          postgres    false    255   �/      T          0    24682    Crea 
   TABLE DATA           ;   COPY public."Crea" ("N_Personaje", "N_Objeto") FROM stdin;
    public          postgres    false    220   �1      U          0    24687    Creador 
   TABLE DATA           2   COPY public."Creador" ("Nom_Creador") FROM stdin;
    public          postgres    false    221   ?2      V          0    24692    Enfrenta 
   TABLE DATA           <   COPY public."Enfrenta" ("N_Heroe", "N_Villano") FROM stdin;
    public          postgres    false    222   �2      W          0    24697    Esta 
   TABLE DATA           Y   COPY public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") FROM stdin;
    public          postgres    false    223   3      X          0    24704    Estado 
   TABLE DATA           D   COPY public."Estado" ("Id_Estado", "Nombre", "Id_Pais") FROM stdin;
    public          postgres    false    224   28      Z          0    24710    Heroe 
   TABLE DATA           `   COPY public."Heroe" ("N_Heroe", "Alias", "Logotipo", "Color_Traje", "Archienemigo") FROM stdin;
    public          postgres    false    226   �8      y          0    25777 	   Historial 
   TABLE DATA           p   COPY public."Historial" ("Id_Perfil", "N_Titulo", "Id_Hist", "Calificacion", "Tiempo_Reproduccion") FROM stdin;
    public          postgres    false    257   �:      [          0    24722    Juego 
   TABLE DATA           D   COPY public."Juego" ("T_Juego", "Distribuidor", "Tipo") FROM stdin;
    public          postgres    false    227   ;      \          0    24727    Medio 
   TABLE DATA           �   COPY public."Medio" ("Titulo", "Fecha_Estreno", "Compania", "Rating", "Sinopsis", "Imagen", "Duracion", "Suscripcion") FROM stdin;
    public          postgres    false    228   <;      ]          0    24733    Nacionalidad 
   TABLE DATA           /   COPY public."Nacionalidad" ("Nac") FROM stdin;
    public          postgres    false    229   I      ^          0    24738    Objeto 
   TABLE DATA           h   COPY public."Objeto" ("Nombre", "Descripcion", "Material", "Tipo", "Imagen", "N_Personaje") FROM stdin;
    public          postgres    false    230   ~I      _          0    24743 	   Ocupacion 
   TABLE DATA           -   COPY public."Ocupacion" ("Ocup") FROM stdin;
    public          postgres    false    231   �L      `          0    24748    Organizacion 
   TABLE DATA           �   COPY public."Organizacion" ("Nombre", "Eslogan", "Lider", "Fundador", "Tipo", "Nom_Comic", "Imagen", "Objetivo", "Lugar_Creacion") FROM stdin;
    public          postgres    false    232   #M      a          0    24753    Pais 
   TABLE DATA           5   COPY public."Pais" ("Id_Pais", "Nombre") FROM stdin;
    public          postgres    false    233   =O      c          0    24759    Pelicula 
   TABLE DATA           k   COPY public."Pelicula" ("T_Pelicula", "Director", "Coste", "Ganancia", "Distribuidor", "Tipo") FROM stdin;
    public          postgres    false    235   qO      d          0    24767    Perfil 
   TABLE DATA           e   COPY public."Perfil" ("Id_Perfil", "Dispositivo", "Nombre", "Idioma", "Email", "Imagen") FROM stdin;
    public          postgres    false    236   4R      f          0    24774    Pers_Creador 
   TABLE DATA           D   COPY public."Pers_Creador" ("N_Personaje", "N_Creador") FROM stdin;
    public          postgres    false    238   �R      g          0    24779    Pers_Nac 
   TABLE DATA           C   COPY public."Pers_Nac" ("N_Personaje", "Nacionalidad") FROM stdin;
    public          postgres    false    239   �T      h          0    24784    Pers_Oc 
   TABLE DATA           ?   COPY public."Pers_Oc" ("N_Personaje", "Ocupacion") FROM stdin;
    public          postgres    false    240   ZV      i          0    24789 	   Personaje 
   TABLE DATA           w   COPY public."Personaje" ("Nombre", "Genero", "Color_Ojos", "Color_Pelo", "Nom_Comic", "E_Marital", imagen) FROM stdin;
    public          postgres    false    241   X      j          0    24798 	   Pertenece 
   TABLE DATA           S   COPY public."Pertenece" ("N_Personaje", "N_Organizacion", "Cod_Cargo") FROM stdin;
    public          postgres    false    242   \      k          0    24803 
   Plat_Juego 
   TABLE DATA           ?   COPY public."Plat_Juego" ("T_Juego", "Plataforma") FROM stdin;
    public          postgres    false    243   (]      l          0    24808 
   Plataforma 
   TABLE DATA           .   COPY public."Plataforma" (nombre) FROM stdin;
    public          postgres    false    244   E]      m          0    24813    Poder 
   TABLE DATA           D   COPY public."Poder" ("Nombre", "Imagen", "Descripcion") FROM stdin;
    public          postgres    false    245   �]      n          0    24818    Posee 
   TABLE DATA           H   COPY public."Posee" ("N_Personaje", "N_Poder", "Obtencion") FROM stdin;
    public          postgres    false    246   �`      o          0    24824    RelacionadoHer 
   TABLE DATA           @   COPY public."RelacionadoHer" ("N_Civil", "N_Heroe") FROM stdin;
    public          postgres    false    247   �b      p          0    24829    RelacionadoVill 
   TABLE DATA           C   COPY public."RelacionadoVill" ("N_Civil", "N_Villano") FROM stdin;
    public          postgres    false    248   9c      q          0    24834    Sede 
   TABLE DATA           W   COPY public."Sede" ("Nombre", "Tipo_Edif", "Ubicacion", "Imagen", "N_Org") FROM stdin;
    public          postgres    false    249   Vc      r          0    24839    Serie 
   TABLE DATA           W   COPY public."Serie" ("T_Serie", "N_Episodios", "Creador", "Canal", "Tipo") FROM stdin;
    public          postgres    false    250   sc      s          0    24844    Suscripcion 
   TABLE DATA           N   COPY public."Suscripcion" ("ID", "Tarifa", "Descripcion", "Tipo") FROM stdin;
    public          postgres    false    251   �d      t          0    24851    Tarjeta 
   TABLE DATA           N   COPY public."Tarjeta" ("N_Tarjeta", "Cod_Seguridad", "Fecha_Ven") FROM stdin;
    public          postgres    false    252   �d      u          0    24858    Usuario 
   TABLE DATA           �   COPY public."Usuario" ("Email", "Contrasena", "Nombre", "Apellido", "Fecha_Nac", "Fecha_Creacion", "Id_Suscripcion", "N_Tarjeta", "Direccion") FROM stdin;
    public          postgres    false    253   Ke      v          0    24864    Villano 
   TABLE DATA           E   COPY public."Villano" ("N_Villano", "Alias", "Objetivo") FROM stdin;
    public          postgres    false    254   xf      �           0    0    Cargo_Cod_Cargo_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public."Cargo_Cod_Cargo_seq"', 1, false);
          public          postgres    false    216            �           0    0    Ciudad_Id_Ciudad_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public."Ciudad_Id_Ciudad_seq"', 4, true);
          public          postgres    false    218            �           0    0    Estado_Id_Estado_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public."Estado_Id_Estado_seq"', 3, true);
          public          postgres    false    225            �           0    0    Historial_Id_Hist_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public."Historial_Id_Hist_seq"', 1, true);
          public          postgres    false    256            �           0    0    Pais_Id_Pais_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public."Pais_Id_Pais_seq"', 2, true);
          public          postgres    false    234            �           0    0    Perfil_Id_Perfil_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public."Perfil_Id_Perfil_seq"', 7, true);
          public          postgres    false    237            %           2606    24875    Aparece Aparece_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public."Aparece"
    ADD CONSTRAINT "Aparece_pkey" PRIMARY KEY ("N_Organizacion", "N_Titulo");
 B   ALTER TABLE ONLY public."Aparece" DROP CONSTRAINT "Aparece_pkey";
       public            postgres    false    214    214            '           2606    24877    Cargo Cargo_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public."Cargo"
    ADD CONSTRAINT "Cargo_pkey" PRIMARY KEY ("Cod_Cargo");
 >   ALTER TABLE ONLY public."Cargo" DROP CONSTRAINT "Cargo_pkey";
       public            postgres    false    215            )           2606    24879    Ciudad Ciudad_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public."Ciudad"
    ADD CONSTRAINT "Ciudad_pkey" PRIMARY KEY ("Id_Ciudad");
 @   ALTER TABLE ONLY public."Ciudad" DROP CONSTRAINT "Ciudad_pkey";
       public            postgres    false    217            +           2606    24881    Civil Civil_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public."Civil"
    ADD CONSTRAINT "Civil_pkey" PRIMARY KEY ("N_Civil");
 >   ALTER TABLE ONLY public."Civil" DROP CONSTRAINT "Civil_pkey";
       public            postgres    false    219            �           2606    25544    Combate Combate_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public."Combate"
    ADD CONSTRAINT "Combate_pkey" PRIMARY KEY ("N_Personaje", "N_Poder", "N_Objeto", "Fecha");
 B   ALTER TABLE ONLY public."Combate" DROP CONSTRAINT "Combate_pkey";
       public            postgres    false    255    255    255    255            -           2606    24885    Crea Crea_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY public."Crea"
    ADD CONSTRAINT "Crea_pkey" PRIMARY KEY ("N_Personaje", "N_Objeto");
 <   ALTER TABLE ONLY public."Crea" DROP CONSTRAINT "Crea_pkey";
       public            postgres    false    220    220            /           2606    24887    Creador Creador_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public."Creador"
    ADD CONSTRAINT "Creador_pkey" PRIMARY KEY ("Nom_Creador");
 B   ALTER TABLE ONLY public."Creador" DROP CONSTRAINT "Creador_pkey";
       public            postgres    false    221            1           2606    24889    Enfrenta Enfrenta_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public."Enfrenta"
    ADD CONSTRAINT "Enfrenta_pkey" PRIMARY KEY ("N_Heroe", "N_Villano");
 D   ALTER TABLE ONLY public."Enfrenta" DROP CONSTRAINT "Enfrenta_pkey";
       public            postgres    false    222    222            3           2606    24891    Esta Esta_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY public."Esta"
    ADD CONSTRAINT "Esta_pkey" PRIMARY KEY ("N_Personaje", "N_Titulo");
 <   ALTER TABLE ONLY public."Esta" DROP CONSTRAINT "Esta_pkey";
       public            postgres    false    223    223            5           2606    24893    Estado Estado_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public."Estado"
    ADD CONSTRAINT "Estado_pkey" PRIMARY KEY ("Id_Estado");
 @   ALTER TABLE ONLY public."Estado" DROP CONSTRAINT "Estado_pkey";
       public            postgres    false    224            7           2606    24895    Heroe Heroe_Alias_key 
   CONSTRAINT     W   ALTER TABLE ONLY public."Heroe"
    ADD CONSTRAINT "Heroe_Alias_key" UNIQUE ("Alias");
 C   ALTER TABLE ONLY public."Heroe" DROP CONSTRAINT "Heroe_Alias_key";
       public            postgres    false    226            9           2606    24897    Heroe Heroe_Logotipo_key 
   CONSTRAINT     ]   ALTER TABLE ONLY public."Heroe"
    ADD CONSTRAINT "Heroe_Logotipo_key" UNIQUE ("Logotipo");
 F   ALTER TABLE ONLY public."Heroe" DROP CONSTRAINT "Heroe_Logotipo_key";
       public            postgres    false    226            ;           2606    24899    Heroe Heroe_N_Heroe_key 
   CONSTRAINT     [   ALTER TABLE ONLY public."Heroe"
    ADD CONSTRAINT "Heroe_N_Heroe_key" UNIQUE ("N_Heroe");
 E   ALTER TABLE ONLY public."Heroe" DROP CONSTRAINT "Heroe_N_Heroe_key";
       public            postgres    false    226            �           2606    25794    Historial Historial_PK 
   CONSTRAINT     x   ALTER TABLE ONLY public."Historial"
    ADD CONSTRAINT "Historial_PK" PRIMARY KEY ("Id_Perfil", "N_Titulo", "Id_Hist");
 D   ALTER TABLE ONLY public."Historial" DROP CONSTRAINT "Historial_PK";
       public            postgres    false    257    257    257            =           2606    24903    Juego Juego_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public."Juego"
    ADD CONSTRAINT "Juego_pkey" PRIMARY KEY ("T_Juego");
 >   ALTER TABLE ONLY public."Juego" DROP CONSTRAINT "Juego_pkey";
       public            postgres    false    227            ?           2606    24907    Medio Medio_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public."Medio"
    ADD CONSTRAINT "Medio_pkey" PRIMARY KEY ("Titulo");
 >   ALTER TABLE ONLY public."Medio" DROP CONSTRAINT "Medio_pkey";
       public            postgres    false    228            A           2606    24909    Nacionalidad Nacionalidad_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public."Nacionalidad"
    ADD CONSTRAINT "Nacionalidad_pkey" PRIMARY KEY ("Nac");
 L   ALTER TABLE ONLY public."Nacionalidad" DROP CONSTRAINT "Nacionalidad_pkey";
       public            postgres    false    229            C           2606    24913    Objeto Objeto_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public."Objeto"
    ADD CONSTRAINT "Objeto_pkey" PRIMARY KEY ("Nombre");
 @   ALTER TABLE ONLY public."Objeto" DROP CONSTRAINT "Objeto_pkey";
       public            postgres    false    230            E           2606    24915    Ocupacion Ocupacion_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public."Ocupacion"
    ADD CONSTRAINT "Ocupacion_pkey" PRIMARY KEY ("Ocup");
 F   ALTER TABLE ONLY public."Ocupacion" DROP CONSTRAINT "Ocupacion_pkey";
       public            postgres    false    231            G           2606    24917 &   Organizacion Organizacion_Fundador_key 
   CONSTRAINT     k   ALTER TABLE ONLY public."Organizacion"
    ADD CONSTRAINT "Organizacion_Fundador_key" UNIQUE ("Fundador");
 T   ALTER TABLE ONLY public."Organizacion" DROP CONSTRAINT "Organizacion_Fundador_key";
       public            postgres    false    232            I           2606    24921 #   Organizacion Organizacion_Lider_key 
   CONSTRAINT     e   ALTER TABLE ONLY public."Organizacion"
    ADD CONSTRAINT "Organizacion_Lider_key" UNIQUE ("Lider");
 Q   ALTER TABLE ONLY public."Organizacion" DROP CONSTRAINT "Organizacion_Lider_key";
       public            postgres    false    232            K           2606    24923    Organizacion Organizacion_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public."Organizacion"
    ADD CONSTRAINT "Organizacion_pkey" PRIMARY KEY ("Nombre");
 L   ALTER TABLE ONLY public."Organizacion" DROP CONSTRAINT "Organizacion_pkey";
       public            postgres    false    232            M           2606    24925    Pais Pais_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public."Pais"
    ADD CONSTRAINT "Pais_pkey" PRIMARY KEY ("Id_Pais");
 <   ALTER TABLE ONLY public."Pais" DROP CONSTRAINT "Pais_pkey";
       public            postgres    false    233                       2606    25537    Pelicula Pelicula_Tipo_check    CHECK CONSTRAINT     �   ALTER TABLE public."Pelicula"
    ADD CONSTRAINT "Pelicula_Tipo_check" CHECK ((("Tipo" = 'Animacion'::text) OR ("Tipo" = 'Live Action'::text))) NOT VALID;
 E   ALTER TABLE public."Pelicula" DROP CONSTRAINT "Pelicula_Tipo_check";
       public          postgres    false    235    235            O           2606    24927    Pelicula Pelicula_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public."Pelicula"
    ADD CONSTRAINT "Pelicula_pkey" PRIMARY KEY ("T_Pelicula");
 D   ALTER TABLE ONLY public."Pelicula" DROP CONSTRAINT "Pelicula_pkey";
       public            postgres    false    235            Q           2606    24929    Perfil Perfil_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public."Perfil"
    ADD CONSTRAINT "Perfil_pkey" PRIMARY KEY ("Id_Perfil");
 @   ALTER TABLE ONLY public."Perfil" DROP CONSTRAINT "Perfil_pkey";
       public            postgres    false    236            S           2606    24931    Pers_Creador Pers_Creador_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public."Pers_Creador"
    ADD CONSTRAINT "Pers_Creador_pkey" PRIMARY KEY ("N_Personaje", "N_Creador");
 L   ALTER TABLE ONLY public."Pers_Creador" DROP CONSTRAINT "Pers_Creador_pkey";
       public            postgres    false    238    238            U           2606    24933    Pers_Nac Pers_Nac_pkey 
   CONSTRAINT     s   ALTER TABLE ONLY public."Pers_Nac"
    ADD CONSTRAINT "Pers_Nac_pkey" PRIMARY KEY ("N_Personaje", "Nacionalidad");
 D   ALTER TABLE ONLY public."Pers_Nac" DROP CONSTRAINT "Pers_Nac_pkey";
       public            postgres    false    239    239            W           2606    24935    Pers_Oc Pers_Oc_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public."Pers_Oc"
    ADD CONSTRAINT "Pers_Oc_pkey" PRIMARY KEY ("N_Personaje", "Ocupacion");
 B   ALTER TABLE ONLY public."Pers_Oc" DROP CONSTRAINT "Pers_Oc_pkey";
       public            postgres    false    240    240            Y           2606    24937    Personaje Personaje_Nombre_key 
   CONSTRAINT     a   ALTER TABLE ONLY public."Personaje"
    ADD CONSTRAINT "Personaje_Nombre_key" UNIQUE ("Nombre");
 L   ALTER TABLE ONLY public."Personaje" DROP CONSTRAINT "Personaje_Nombre_key";
       public            postgres    false    241            [           2606    24939    Personaje Personaje_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public."Personaje"
    ADD CONSTRAINT "Personaje_pkey" PRIMARY KEY ("Nombre");
 F   ALTER TABLE ONLY public."Personaje" DROP CONSTRAINT "Personaje_pkey";
       public            postgres    false    241            ]           2606    24941    Pertenece Pertenece_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public."Pertenece"
    ADD CONSTRAINT "Pertenece_pkey" PRIMARY KEY ("N_Personaje", "N_Organizacion", "Cod_Cargo");
 F   ALTER TABLE ONLY public."Pertenece" DROP CONSTRAINT "Pertenece_pkey";
       public            postgres    false    242    242    242            _           2606    24943    Plat_Juego Plat_Juego_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY public."Plat_Juego"
    ADD CONSTRAINT "Plat_Juego_pkey" PRIMARY KEY ("T_Juego", "Plataforma");
 H   ALTER TABLE ONLY public."Plat_Juego" DROP CONSTRAINT "Plat_Juego_pkey";
       public            postgres    false    243    243            a           2606    24945    Plataforma Plataforma_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public."Plataforma"
    ADD CONSTRAINT "Plataforma_pkey" PRIMARY KEY (nombre);
 H   ALTER TABLE ONLY public."Plataforma" DROP CONSTRAINT "Plataforma_pkey";
       public            postgres    false    244            c           2606    24949    Poder Poder_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public."Poder"
    ADD CONSTRAINT "Poder_pkey" PRIMARY KEY ("Nombre");
 >   ALTER TABLE ONLY public."Poder" DROP CONSTRAINT "Poder_pkey";
       public            postgres    false    245            e           2606    24951    Posee Posee_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public."Posee"
    ADD CONSTRAINT "Posee_pkey" PRIMARY KEY ("N_Personaje", "N_Poder");
 >   ALTER TABLE ONLY public."Posee" DROP CONSTRAINT "Posee_pkey";
       public            postgres    false    246    246            g           2606    24953 "   RelacionadoHer RelacionadoHer_pkey 
   CONSTRAINT     v   ALTER TABLE ONLY public."RelacionadoHer"
    ADD CONSTRAINT "RelacionadoHer_pkey" PRIMARY KEY ("N_Civil", "N_Heroe");
 P   ALTER TABLE ONLY public."RelacionadoHer" DROP CONSTRAINT "RelacionadoHer_pkey";
       public            postgres    false    247    247            i           2606    24955 $   RelacionadoVill RelacionadoVill_pkey 
   CONSTRAINT     z   ALTER TABLE ONLY public."RelacionadoVill"
    ADD CONSTRAINT "RelacionadoVill_pkey" PRIMARY KEY ("N_Civil", "N_Villano");
 R   ALTER TABLE ONLY public."RelacionadoVill" DROP CONSTRAINT "RelacionadoVill_pkey";
       public            postgres    false    248    248            k           2606    24957    Sede Sede_Imagen_key 
   CONSTRAINT     W   ALTER TABLE ONLY public."Sede"
    ADD CONSTRAINT "Sede_Imagen_key" UNIQUE ("Imagen");
 B   ALTER TABLE ONLY public."Sede" DROP CONSTRAINT "Sede_Imagen_key";
       public            postgres    false    249            m           2606    24959    Sede Sede_Nombre_key 
   CONSTRAINT     W   ALTER TABLE ONLY public."Sede"
    ADD CONSTRAINT "Sede_Nombre_key" UNIQUE ("Nombre");
 B   ALTER TABLE ONLY public."Sede" DROP CONSTRAINT "Sede_Nombre_key";
       public            postgres    false    249            o           2606    24961    Sede Sede_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public."Sede"
    ADD CONSTRAINT "Sede_pkey" PRIMARY KEY ("Nombre", "N_Org");
 <   ALTER TABLE ONLY public."Sede" DROP CONSTRAINT "Sede_pkey";
       public            postgres    false    249    249                       2606    25570    Serie Serie_Tipo_check    CHECK CONSTRAINT     �   ALTER TABLE public."Serie"
    ADD CONSTRAINT "Serie_Tipo_check" CHECK ((("Tipo" = 'Animacion'::text) OR ("Tipo" = 'Live Action'::text))) NOT VALID;
 ?   ALTER TABLE public."Serie" DROP CONSTRAINT "Serie_Tipo_check";
       public          postgres    false    250    250            q           2606    24963    Serie Serie_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public."Serie"
    ADD CONSTRAINT "Serie_pkey" PRIMARY KEY ("T_Serie");
 >   ALTER TABLE ONLY public."Serie" DROP CONSTRAINT "Serie_pkey";
       public            postgres    false    250            s           2606    24965     Suscripcion Suscripcion_Tipo_key 
   CONSTRAINT     a   ALTER TABLE ONLY public."Suscripcion"
    ADD CONSTRAINT "Suscripcion_Tipo_key" UNIQUE ("Tipo");
 N   ALTER TABLE ONLY public."Suscripcion" DROP CONSTRAINT "Suscripcion_Tipo_key";
       public            postgres    false    251            u           2606    24967    Suscripcion Suscripcion_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public."Suscripcion"
    ADD CONSTRAINT "Suscripcion_pkey" PRIMARY KEY ("ID");
 J   ALTER TABLE ONLY public."Suscripcion" DROP CONSTRAINT "Suscripcion_pkey";
       public            postgres    false    251            w           2606    24969    Tarjeta Tarjeta_N_Tarjeta_key 
   CONSTRAINT     c   ALTER TABLE ONLY public."Tarjeta"
    ADD CONSTRAINT "Tarjeta_N_Tarjeta_key" UNIQUE ("N_Tarjeta");
 K   ALTER TABLE ONLY public."Tarjeta" DROP CONSTRAINT "Tarjeta_N_Tarjeta_key";
       public            postgres    false    252            y           2606    24971    Tarjeta Tarjeta_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public."Tarjeta"
    ADD CONSTRAINT "Tarjeta_pkey" PRIMARY KEY ("N_Tarjeta");
 B   ALTER TABLE ONLY public."Tarjeta" DROP CONSTRAINT "Tarjeta_pkey";
       public            postgres    false    252            {           2606    24973    Usuario Usuario_Apellido_key 
   CONSTRAINT     a   ALTER TABLE ONLY public."Usuario"
    ADD CONSTRAINT "Usuario_Apellido_key" UNIQUE ("Apellido");
 J   ALTER TABLE ONLY public."Usuario" DROP CONSTRAINT "Usuario_Apellido_key";
       public            postgres    false    253            }           2606    24975    Usuario Usuario_Nombre_key 
   CONSTRAINT     ]   ALTER TABLE ONLY public."Usuario"
    ADD CONSTRAINT "Usuario_Nombre_key" UNIQUE ("Nombre");
 H   ALTER TABLE ONLY public."Usuario" DROP CONSTRAINT "Usuario_Nombre_key";
       public            postgres    false    253                       2606    24977    Usuario Usuario_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public."Usuario"
    ADD CONSTRAINT "Usuario_pkey" PRIMARY KEY ("Email");
 B   ALTER TABLE ONLY public."Usuario" DROP CONSTRAINT "Usuario_pkey";
       public            postgres    false    253            �           2606    24979    Villano Villano_Alias_key 
   CONSTRAINT     [   ALTER TABLE ONLY public."Villano"
    ADD CONSTRAINT "Villano_Alias_key" UNIQUE ("Alias");
 G   ALTER TABLE ONLY public."Villano" DROP CONSTRAINT "Villano_Alias_key";
       public            postgres    false    254            �           2606    24981    Villano Villano_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public."Villano"
    ADD CONSTRAINT "Villano_pkey" PRIMARY KEY ("N_Villano");
 B   ALTER TABLE ONLY public."Villano" DROP CONSTRAINT "Villano_pkey";
       public            postgres    false    254            �           2620    24982    Heroe archienemigo_trigger    TRIGGER     �   CREATE TRIGGER archienemigo_trigger BEFORE INSERT OR UPDATE ON public."Heroe" FOR EACH ROW EXECUTE FUNCTION public.archienemigo();
 5   DROP TRIGGER archienemigo_trigger ON public."Heroe";
       public          postgres    false    258    226            �           2620    24984    Personaje emarital_trigger    TRIGGER        CREATE TRIGGER emarital_trigger BEFORE INSERT OR UPDATE ON public."Personaje" FOR EACH ROW EXECUTE FUNCTION public.emarital();
 5   DROP TRIGGER emarital_trigger ON public."Personaje";
       public          postgres    false    259    241            �           2620    24985 !   Pelicula ganancia_perdida_trigger    TRIGGER     �   CREATE TRIGGER ganancia_perdida_trigger BEFORE INSERT OR UPDATE ON public."Pelicula" FOR EACH ROW EXECUTE FUNCTION public.ganancia_perdida();
 <   DROP TRIGGER ganancia_perdida_trigger ON public."Pelicula";
       public          postgres    false    235    260            �           2620    24986    Personaje genero_trigger    TRIGGER     {   CREATE TRIGGER genero_trigger BEFORE INSERT OR UPDATE ON public."Personaje" FOR EACH ROW EXECUTE FUNCTION public.genero();
 3   DROP TRIGGER genero_trigger ON public."Personaje";
       public          postgres    false    261    241            �           2620    24987    Usuario numusuarios_trigger    TRIGGER     �   CREATE TRIGGER numusuarios_trigger BEFORE INSERT OR UPDATE ON public."Usuario" FOR EACH ROW EXECUTE FUNCTION public.numusuarios();
 6   DROP TRIGGER numusuarios_trigger ON public."Usuario";
       public          postgres    false    253    265            �           2620    24988    Medio rating_trigger    TRIGGER     z   CREATE TRIGGER rating_trigger BEFORE INSERT OR UPDATE ON public."Medio" FOR EACH ROW EXECUTE FUNCTION public.numrating();
 /   DROP TRIGGER rating_trigger ON public."Medio";
       public          postgres    false    264    228            �           2620    24989    Esta rolpersonaje_trigger    TRIGGER     �   CREATE TRIGGER rolpersonaje_trigger BEFORE INSERT OR UPDATE ON public."Esta" FOR EACH ROW EXECUTE FUNCTION public.rolpersonaje();
 4   DROP TRIGGER rolpersonaje_trigger ON public."Esta";
       public          postgres    false    266    223            �           2620    24990    Esta tipoactor_trigger    TRIGGER     |   CREATE TRIGGER tipoactor_trigger BEFORE INSERT OR UPDATE ON public."Esta" FOR EACH ROW EXECUTE FUNCTION public.tipoactor();
 1   DROP TRIGGER tipoactor_trigger ON public."Esta";
       public          postgres    false    223    268            �           2620    24991 %   Suscripcion tiposuscripciones_trigger    TRIGGER     �   CREATE TRIGGER tiposuscripciones_trigger BEFORE INSERT OR UPDATE ON public."Suscripcion" FOR EACH ROW EXECUTE FUNCTION public.tiposuscripciones();
 @   DROP TRIGGER tiposuscripciones_trigger ON public."Suscripcion";
       public          postgres    false    251    267            �           2606    25572 #   Aparece Aparece_N_Organizacion_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Aparece"
    ADD CONSTRAINT "Aparece_N_Organizacion_fkey" FOREIGN KEY ("N_Organizacion") REFERENCES public."Organizacion"("Nombre") ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 Q   ALTER TABLE ONLY public."Aparece" DROP CONSTRAINT "Aparece_N_Organizacion_fkey";
       public          postgres    false    3403    214    232            �           2606    25577    Aparece Aparece_N_Titulo_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Aparece"
    ADD CONSTRAINT "Aparece_N_Titulo_fkey" FOREIGN KEY ("N_Titulo") REFERENCES public."Medio"("Titulo") ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 K   ALTER TABLE ONLY public."Aparece" DROP CONSTRAINT "Aparece_N_Titulo_fkey";
       public          postgres    false    228    214    3391            �           2606    25522    Ciudad Ciudad_Id_Estado_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Ciudad"
    ADD CONSTRAINT "Ciudad_Id_Estado_fkey" FOREIGN KEY ("Id_Estado") REFERENCES public."Estado"("Id_Estado") ON UPDATE CASCADE NOT VALID;
 J   ALTER TABLE ONLY public."Ciudad" DROP CONSTRAINT "Ciudad_Id_Estado_fkey";
       public          postgres    false    217    3381    224            �           2606    25582    Civil Civil_N_Civil_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Civil"
    ADD CONSTRAINT "Civil_N_Civil_fkey" FOREIGN KEY ("N_Civil") REFERENCES public."Personaje"("Nombre") ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 F   ALTER TABLE ONLY public."Civil" DROP CONSTRAINT "Civil_N_Civil_fkey";
       public          postgres    false    241    219    3417            �           2606    25588    Combate Combate_N_Objeto_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Combate"
    ADD CONSTRAINT "Combate_N_Objeto_fkey" FOREIGN KEY ("N_Objeto") REFERENCES public."Objeto"("Nombre") ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 K   ALTER TABLE ONLY public."Combate" DROP CONSTRAINT "Combate_N_Objeto_fkey";
       public          postgres    false    3395    230    255            �           2606    25593     Combate Combate_N_Personaje_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Combate"
    ADD CONSTRAINT "Combate_N_Personaje_fkey" FOREIGN KEY ("N_Personaje") REFERENCES public."Personaje"("Nombre") ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 N   ALTER TABLE ONLY public."Combate" DROP CONSTRAINT "Combate_N_Personaje_fkey";
       public          postgres    false    241    255    3417            �           2606    25598    Combate Combate_N_Poder_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Combate"
    ADD CONSTRAINT "Combate_N_Poder_fkey" FOREIGN KEY ("N_Poder") REFERENCES public."Poder"("Nombre") ON UPDATE CASCADE ON DELETE SET DEFAULT NOT VALID;
 J   ALTER TABLE ONLY public."Combate" DROP CONSTRAINT "Combate_N_Poder_fkey";
       public          postgres    false    245    255    3427            �           2606    25603    Crea Crea_N_Objeto_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Crea"
    ADD CONSTRAINT "Crea_N_Objeto_fkey" FOREIGN KEY ("N_Objeto") REFERENCES public."Objeto"("Nombre") ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 E   ALTER TABLE ONLY public."Crea" DROP CONSTRAINT "Crea_N_Objeto_fkey";
       public          postgres    false    220    3395    230            �           2606    25608    Crea Crea_N_Personaje_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Crea"
    ADD CONSTRAINT "Crea_N_Personaje_fkey" FOREIGN KEY ("N_Personaje") REFERENCES public."Personaje"("Nombre") ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 H   ALTER TABLE ONLY public."Crea" DROP CONSTRAINT "Crea_N_Personaje_fkey";
       public          postgres    false    220    241    3417            �           2606    25613    Enfrenta Enfrenta_N_Heroe_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Enfrenta"
    ADD CONSTRAINT "Enfrenta_N_Heroe_fkey" FOREIGN KEY ("N_Heroe") REFERENCES public."Heroe"("N_Heroe") ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 L   ALTER TABLE ONLY public."Enfrenta" DROP CONSTRAINT "Enfrenta_N_Heroe_fkey";
       public          postgres    false    226    222    3387            �           2606    25618     Enfrenta Enfrenta_N_Villano_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Enfrenta"
    ADD CONSTRAINT "Enfrenta_N_Villano_fkey" FOREIGN KEY ("N_Villano") REFERENCES public."Villano"("N_Villano") ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 N   ALTER TABLE ONLY public."Enfrenta" DROP CONSTRAINT "Enfrenta_N_Villano_fkey";
       public          postgres    false    222    254    3459            �           2606    25623    Esta Esta_N_Personaje_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Esta"
    ADD CONSTRAINT "Esta_N_Personaje_fkey" FOREIGN KEY ("N_Personaje") REFERENCES public."Personaje"("Nombre") ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 H   ALTER TABLE ONLY public."Esta" DROP CONSTRAINT "Esta_N_Personaje_fkey";
       public          postgres    false    241    3417    223            �           2606    25628    Esta Esta_N_Titulo_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Esta"
    ADD CONSTRAINT "Esta_N_Titulo_fkey" FOREIGN KEY ("N_Titulo") REFERENCES public."Medio"("Titulo") ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 E   ALTER TABLE ONLY public."Esta" DROP CONSTRAINT "Esta_N_Titulo_fkey";
       public          postgres    false    228    3391    223            �           2606    25527    Estado Estado_Id_Pais_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Estado"
    ADD CONSTRAINT "Estado_Id_Pais_fkey" FOREIGN KEY ("Id_Pais") REFERENCES public."Pais"("Id_Pais") ON UPDATE CASCADE NOT VALID;
 H   ALTER TABLE ONLY public."Estado" DROP CONSTRAINT "Estado_Id_Pais_fkey";
       public          postgres    false    233    224    3405            �           2606    25633    Heroe Heroe_Archienemigo_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Heroe"
    ADD CONSTRAINT "Heroe_Archienemigo_fkey" FOREIGN KEY ("Archienemigo") REFERENCES public."Villano"("N_Villano") ON UPDATE CASCADE NOT VALID;
 K   ALTER TABLE ONLY public."Heroe" DROP CONSTRAINT "Heroe_Archienemigo_fkey";
       public          postgres    false    254    226    3459            �           2606    25638    Heroe Heroe_N_Heroe_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Heroe"
    ADD CONSTRAINT "Heroe_N_Heroe_fkey" FOREIGN KEY ("N_Heroe") REFERENCES public."Personaje"("Nombre") ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 F   ALTER TABLE ONLY public."Heroe" DROP CONSTRAINT "Heroe_N_Heroe_fkey";
       public          postgres    false    226    241    3417            �           2606    25795    Historial Historial_Medio_FK    FK CONSTRAINT     �   ALTER TABLE ONLY public."Historial"
    ADD CONSTRAINT "Historial_Medio_FK" FOREIGN KEY ("N_Titulo") REFERENCES public."Medio"("Titulo");
 J   ALTER TABLE ONLY public."Historial" DROP CONSTRAINT "Historial_Medio_FK";
       public          postgres    false    228    3391    257            �           2606    25783    Historial Historial_Perfil_FK    FK CONSTRAINT     �   ALTER TABLE ONLY public."Historial"
    ADD CONSTRAINT "Historial_Perfil_FK" FOREIGN KEY ("Id_Perfil") REFERENCES public."Perfil"("Id_Perfil");
 K   ALTER TABLE ONLY public."Historial" DROP CONSTRAINT "Historial_Perfil_FK";
       public          postgres    false    3409    236    257            �           2606    25643    Juego Juego_T_Juego_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Juego"
    ADD CONSTRAINT "Juego_T_Juego_fkey" FOREIGN KEY ("T_Juego") REFERENCES public."Medio"("Titulo") ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 F   ALTER TABLE ONLY public."Juego" DROP CONSTRAINT "Juego_T_Juego_fkey";
       public          postgres    false    228    227    3391            �           2606    25748    Serie Medio_T_Serie_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Serie"
    ADD CONSTRAINT "Medio_T_Serie_fkey" FOREIGN KEY ("T_Serie") REFERENCES public."Medio"("Titulo") ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 F   ALTER TABLE ONLY public."Serie" DROP CONSTRAINT "Medio_T_Serie_fkey";
       public          postgres    false    228    3391    250            �           2606    25532    Objeto Objeto_N_Personaje_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Objeto"
    ADD CONSTRAINT "Objeto_N_Personaje_fkey" FOREIGN KEY ("N_Personaje") REFERENCES public."Personaje"("Nombre") ON UPDATE CASCADE NOT VALID;
 L   ALTER TABLE ONLY public."Objeto" DROP CONSTRAINT "Objeto_N_Personaje_fkey";
       public          postgres    false    241    3417    230            �           2606    25565 '   Organizacion Organizacion_Fundador_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Organizacion"
    ADD CONSTRAINT "Organizacion_Fundador_fkey" FOREIGN KEY ("Fundador") REFERENCES public."Personaje"("Nombre") ON UPDATE CASCADE NOT VALID;
 U   ALTER TABLE ONLY public."Organizacion" DROP CONSTRAINT "Organizacion_Fundador_fkey";
       public          postgres    false    232    3417    241            �           2606    25560 $   Organizacion Organizacion_Lider_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Organizacion"
    ADD CONSTRAINT "Organizacion_Lider_fkey" FOREIGN KEY ("Lider") REFERENCES public."Personaje"("Nombre") ON UPDATE CASCADE NOT VALID;
 R   ALTER TABLE ONLY public."Organizacion" DROP CONSTRAINT "Organizacion_Lider_fkey";
       public          postgres    false    232    3417    241            �           2606    25648 !   Pelicula Pelicula_T_Pelicula_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Pelicula"
    ADD CONSTRAINT "Pelicula_T_Pelicula_fkey" FOREIGN KEY ("T_Pelicula") REFERENCES public."Medio"("Titulo") ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 O   ALTER TABLE ONLY public."Pelicula" DROP CONSTRAINT "Pelicula_T_Pelicula_fkey";
       public          postgres    false    228    235    3391            �           2606    25653    Perfil Perfil_Email_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Perfil"
    ADD CONSTRAINT "Perfil_Email_fkey" FOREIGN KEY ("Email") REFERENCES public."Usuario"("Email") ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 F   ALTER TABLE ONLY public."Perfil" DROP CONSTRAINT "Perfil_Email_fkey";
       public          postgres    false    3455    236    253            �           2606    25658 (   Pers_Creador Pers_Creador_N_Creador_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Pers_Creador"
    ADD CONSTRAINT "Pers_Creador_N_Creador_fkey" FOREIGN KEY ("N_Creador") REFERENCES public."Creador"("Nom_Creador") ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 V   ALTER TABLE ONLY public."Pers_Creador" DROP CONSTRAINT "Pers_Creador_N_Creador_fkey";
       public          postgres    false    3375    238    221            �           2606    25663 *   Pers_Creador Pers_Creador_N_Personaje_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Pers_Creador"
    ADD CONSTRAINT "Pers_Creador_N_Personaje_fkey" FOREIGN KEY ("N_Personaje") REFERENCES public."Personaje"("Nombre") ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 X   ALTER TABLE ONLY public."Pers_Creador" DROP CONSTRAINT "Pers_Creador_N_Personaje_fkey";
       public          postgres    false    238    3417    241            �           2606    25668 "   Pers_Nac Pers_Nac_N_Personaje_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Pers_Nac"
    ADD CONSTRAINT "Pers_Nac_N_Personaje_fkey" FOREIGN KEY ("N_Personaje") REFERENCES public."Personaje"("Nombre") ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 P   ALTER TABLE ONLY public."Pers_Nac" DROP CONSTRAINT "Pers_Nac_N_Personaje_fkey";
       public          postgres    false    239    3417    241            �           2606    25673 #   Pers_Nac Pers_Nac_Nacionalidad_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Pers_Nac"
    ADD CONSTRAINT "Pers_Nac_Nacionalidad_fkey" FOREIGN KEY ("Nacionalidad") REFERENCES public."Nacionalidad"("Nac") ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 Q   ALTER TABLE ONLY public."Pers_Nac" DROP CONSTRAINT "Pers_Nac_Nacionalidad_fkey";
       public          postgres    false    229    239    3393            �           2606    25678     Pers_Oc Pers_Oc_N_Personaje_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Pers_Oc"
    ADD CONSTRAINT "Pers_Oc_N_Personaje_fkey" FOREIGN KEY ("N_Personaje") REFERENCES public."Personaje"("Nombre") ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 N   ALTER TABLE ONLY public."Pers_Oc" DROP CONSTRAINT "Pers_Oc_N_Personaje_fkey";
       public          postgres    false    3417    240    241            �           2606    25683    Pers_Oc Pers_Oc_Ocupacion_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Pers_Oc"
    ADD CONSTRAINT "Pers_Oc_Ocupacion_fkey" FOREIGN KEY ("Ocupacion") REFERENCES public."Ocupacion"("Ocup") ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 L   ALTER TABLE ONLY public."Pers_Oc" DROP CONSTRAINT "Pers_Oc_Ocupacion_fkey";
       public          postgres    false    240    231    3397            �           2606    25688 "   Pertenece Pertenece_Cod_Cargo_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Pertenece"
    ADD CONSTRAINT "Pertenece_Cod_Cargo_fkey" FOREIGN KEY ("Cod_Cargo") REFERENCES public."Cargo"("Cod_Cargo") ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 P   ALTER TABLE ONLY public."Pertenece" DROP CONSTRAINT "Pertenece_Cod_Cargo_fkey";
       public          postgres    false    3367    215    242            �           2606    25693 '   Pertenece Pertenece_N_Organizacion_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Pertenece"
    ADD CONSTRAINT "Pertenece_N_Organizacion_fkey" FOREIGN KEY ("N_Organizacion") REFERENCES public."Organizacion"("Nombre") ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 U   ALTER TABLE ONLY public."Pertenece" DROP CONSTRAINT "Pertenece_N_Organizacion_fkey";
       public          postgres    false    242    3403    232            �           2606    25698 $   Pertenece Pertenece_N_Personaje_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Pertenece"
    ADD CONSTRAINT "Pertenece_N_Personaje_fkey" FOREIGN KEY ("N_Personaje") REFERENCES public."Personaje"("Nombre") ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 R   ALTER TABLE ONLY public."Pertenece" DROP CONSTRAINT "Pertenece_N_Personaje_fkey";
       public          postgres    false    241    242    3417            �           2606    25703 %   Plat_Juego Plat_Juego_Plataforma_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Plat_Juego"
    ADD CONSTRAINT "Plat_Juego_Plataforma_fkey" FOREIGN KEY ("Plataforma") REFERENCES public."Plataforma"(nombre) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 S   ALTER TABLE ONLY public."Plat_Juego" DROP CONSTRAINT "Plat_Juego_Plataforma_fkey";
       public          postgres    false    3425    243    244            �           2606    25708 "   Plat_Juego Plat_Juego_T_Juego_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Plat_Juego"
    ADD CONSTRAINT "Plat_Juego_T_Juego_fkey" FOREIGN KEY ("T_Juego") REFERENCES public."Juego"("T_Juego") ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 P   ALTER TABLE ONLY public."Plat_Juego" DROP CONSTRAINT "Plat_Juego_T_Juego_fkey";
       public          postgres    false    3389    243    227            �           2606    25713    Posee Posee_N_Personaje_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Posee"
    ADD CONSTRAINT "Posee_N_Personaje_fkey" FOREIGN KEY ("N_Personaje") REFERENCES public."Personaje"("Nombre") ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 J   ALTER TABLE ONLY public."Posee" DROP CONSTRAINT "Posee_N_Personaje_fkey";
       public          postgres    false    3417    246    241            �           2606    25718    Posee Posee_N_Poder_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Posee"
    ADD CONSTRAINT "Posee_N_Poder_fkey" FOREIGN KEY ("N_Poder") REFERENCES public."Poder"("Nombre") ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 F   ALTER TABLE ONLY public."Posee" DROP CONSTRAINT "Posee_N_Poder_fkey";
       public          postgres    false    3427    246    245            �           2606    25723 *   RelacionadoHer RelacionadoHer_N_Civil_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."RelacionadoHer"
    ADD CONSTRAINT "RelacionadoHer_N_Civil_fkey" FOREIGN KEY ("N_Civil") REFERENCES public."Civil"("N_Civil") ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 X   ALTER TABLE ONLY public."RelacionadoHer" DROP CONSTRAINT "RelacionadoHer_N_Civil_fkey";
       public          postgres    false    3371    247    219            �           2606    25728 *   RelacionadoHer RelacionadoHer_N_Heroe_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."RelacionadoHer"
    ADD CONSTRAINT "RelacionadoHer_N_Heroe_fkey" FOREIGN KEY ("N_Heroe") REFERENCES public."Heroe"("N_Heroe") ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 X   ALTER TABLE ONLY public."RelacionadoHer" DROP CONSTRAINT "RelacionadoHer_N_Heroe_fkey";
       public          postgres    false    3387    247    226            �           2606    25733 ,   RelacionadoVill RelacionadoVill_N_Civil_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."RelacionadoVill"
    ADD CONSTRAINT "RelacionadoVill_N_Civil_fkey" FOREIGN KEY ("N_Civil") REFERENCES public."Civil"("N_Civil") ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 Z   ALTER TABLE ONLY public."RelacionadoVill" DROP CONSTRAINT "RelacionadoVill_N_Civil_fkey";
       public          postgres    false    3371    219    248            �           2606    25738 .   RelacionadoVill RelacionadoVill_N_Villano_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."RelacionadoVill"
    ADD CONSTRAINT "RelacionadoVill_N_Villano_fkey" FOREIGN KEY ("N_Villano") REFERENCES public."Villano"("N_Villano") ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 \   ALTER TABLE ONLY public."RelacionadoVill" DROP CONSTRAINT "RelacionadoVill_N_Villano_fkey";
       public          postgres    false    254    248    3459            �           2606    25743    Sede Sede_N_Org_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Sede"
    ADD CONSTRAINT "Sede_N_Org_fkey" FOREIGN KEY ("N_Org") REFERENCES public."Organizacion"("Nombre") ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 B   ALTER TABLE ONLY public."Sede" DROP CONSTRAINT "Sede_N_Org_fkey";
       public          postgres    false    249    232    3403            �           2606    25758    Usuario Usuario_Direccion_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Usuario"
    ADD CONSTRAINT "Usuario_Direccion_fkey" FOREIGN KEY ("Direccion") REFERENCES public."Ciudad"("Id_Ciudad") ON UPDATE CASCADE ON DELETE RESTRICT NOT VALID;
 L   ALTER TABLE ONLY public."Usuario" DROP CONSTRAINT "Usuario_Direccion_fkey";
       public          postgres    false    217    253    3369            �           2606    25763 #   Usuario Usuario_Id_Suscripcion_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Usuario"
    ADD CONSTRAINT "Usuario_Id_Suscripcion_fkey" FOREIGN KEY ("Id_Suscripcion") REFERENCES public."Suscripcion"("ID") ON UPDATE CASCADE ON DELETE RESTRICT NOT VALID;
 Q   ALTER TABLE ONLY public."Usuario" DROP CONSTRAINT "Usuario_Id_Suscripcion_fkey";
       public          postgres    false    251    253    3445            �           2606    25507    Usuario Usuario_N_Tarjeta_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Usuario"
    ADD CONSTRAINT "Usuario_N_Tarjeta_fkey" FOREIGN KEY ("N_Tarjeta") REFERENCES public."Tarjeta"("N_Tarjeta") ON UPDATE CASCADE NOT VALID;
 L   ALTER TABLE ONLY public."Usuario" DROP CONSTRAINT "Usuario_N_Tarjeta_fkey";
       public          postgres    false    253    3447    252            �           2606    25753    Villano Villano_N_Villano_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Villano"
    ADD CONSTRAINT "Villano_N_Villano_fkey" FOREIGN KEY ("N_Villano") REFERENCES public."Personaje"("Nombre") ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 L   ALTER TABLE ONLY public."Villano" DROP CONSTRAINT "Villano_N_Villano_fkey";
       public          postgres    false    254    241    3417            N   �   x���1jAE�S�I��ݒ�`�a!�H��F0�1��%9Nʜ��zcc'�	i�����Q�\��OneIi�W5E��jn:0I~��{)���=|�4�Gڛ�lԳ���ݕ�J.����	�<RN1F
K�6M����:Ǣ��r�AD�	�����Z�P�OM9��ؚ-���НZ��\u� �hb�1G��I��݆Ս��[���ل	*-&����/<��      O   9   x�340���LI-�240�t�O+�KIL�q�8�S�JR�Lc΀����b�x� ��      Q   O   x�344�tN,JLN,�44�244�t�,MILQHIUp�O�/I�44�s��+����s�T� 5� �q��qqq 
�a      S   -   x�s�,)����/O,JQ.I,��
H-(H-R�/))����� ��      w   �  x����n1�מ��/0�� 
YR�DT@h���������BަK�}^,����L��%��;���+.�%�F���+,��.@!%
gd!9r6���Ұ,I�8i��{�&��w��h��\�W�����M�dq�	���w2��l㾒Bs ��ܡY�1���D8�`0x%���d�Hҍ�r����A�hH	C����I}�����^�y�������4<wb-��n����?���W�Ǖt��z��6�,��Xz��Taf���2T
��4C�!/fK�ݾX����\8z��+�|D�B���3A��+/l ��?.L��R��ˠ[�{d;N��,e7�9��EiU�Z{�~��TL�rZ�:<�Ei���v� �M9�vKjo7��Z����>�����M�
�����w�>���B�H�A��թ>�~|�������      T   �   x�-̱1@�:����	�D�(�ј$�G9��P2�-Ɓh~��R��Wj7�֠�F���]%n����7�z�)�*��*8ܗw�@���._Z���c�>(��'3�������*p� ���.�      U   �   x�%�An�@��yA��@�b�\�,��Z{F6D�=K�u����L{@��jO\�w���M�)=0.�tn�������&��O�)a�l�U�t�[Z�����4>5��$'�U����;k�A@�<��]d�h�c-.;�zH�`ƫ~鑘�5�D��}�k����f!��ߎG�      V      x������ � �      W   	  x��X�v�F]����v�]�$��@�~��w�Ql��x<ʙ��o�e�}��Xe���`�C��s�����X��a��&�[�fh�Ɠ}��1��²�-�<��D�Ø_�0����8��`h��`�Ɛ�c�[Z�ԓ&�d:i���^�F��ֳ	�1[�G�86��C��Ql��	��E���ӎ`�[�n0�g���2p���mU�@��J��V����vh\��]������d�Vf&B����&�aʱ`�u�Ƭ��uf�N�f�=L1L
��Tij6.���|i>��V��/Iڇc`Ʃ��9i*�N�-�#�N�mpω�{�6��W�t�5�0QQ��e�?a�0.8h�����fC��-�`���Yf#��펴�";cڐ�
64�Y�F�L�9I��̐�tgs���Ryy�X���`�Y"!�zG5S�I��(��tC�Q%��w$�Jx��w-̾���d7�k�&�Н�դ,2y6����5>F]Ϟ1J[�N�̩��H�*�<*��S�G��)�)�X�I@k���^��P�/�w���.�,�(_ip�#��H(��NIB��pB��}C�r/H��2���&�q�D����F�A��
[#^XaZp�)[<��H.��c��瀌qW�������O�,��3��`�Vq�u0V�HK6"��b)���Y1����2�5%�B�Is�����(λ�Т̡\��E�85�2~�QE�Ґ���m�cKy»�@����N�&�p�W��w,h;��ӌ�����>��'�U^f�V��/Eh��e��{�!7�-�2��~�x�2�+	Ytg$��#ۓ�74#L�E���tR��`��I4|�f�_����W�J�L[��Z�3��f�R0��az)W�N#�+~�7��0c�֩��FR��e�Ƌu�9�e��L�>#�Bi�0ҕ��e�(�]B�j�@��2�lPsu�t8\�-�B�<{�!���H����j�bJ���T$�`ߨ?޴m����AЯ�xe?���d�.�b����3�2ZK�^��S�V����}
A-�z!VIUێ��*z��W&�bڴ�4���@�l�8*c}�Ѻ�@�j�������~�ce-+�ҷGQ��x����NY��J����bΫ g��Qs��
�s%
�����b��M���V�.�e�V�������D�c���<����r��T���@��5;+����b]��Mj;\Ֆ>�݇�_���$f�y�5[�@S��d8�a�	w���7��C�_�WiGV��5Ũq+Q$�2ҕ��?A�/c)U      X   G   x�34�t�,.)�,�WpN,�,I��4�22���,J�KIr�8����K9����8}SSRsr2�=... ���      Z   O  x�USKr�0]C��:��dѵ?u���=I�`$آE�r�ީ�!+(K����y ���fQ*x�f�������`�z�����Q"{X�eAf�.�����-P#��6`a�3i���.+b�(��:#���#���[��Dp�H`������0C�>��T��`��d��Q`1ow�f�Go���Q����Db=%̠���ݵ�6��lYj-�w	�)��yfO�w�F�j��ME�͞��N ;&	;Foə�Jt�Ćأwi}����H�dA_i����6��Iu��-!����t"��=I�mT��j��m�4�K����x��7���mu�1�bRp^��
:Y��.>��W�¥�*J����{�6m\uu���Ӳ�Cuζ��uYX���6Wf}Gm�W�̰��Y��#��N�ƻ�ئ�6�f��6W��������J_���mAR�=�T�1�Y�Q�ׄ.�g�|������k]�~�Zۃ����o:M_�7��Q�)D�(�\ռ��Q�#\�}*���I�kEXc�K���h��Y؎?gަ��v�s�G������3�s��5˲�v�r      y   '   x�3��,��S�M��4�4�440�2Cq���b���� �	      [      x������ � �      \   �  x��YMs7=ӿ��^H��l�&K�[ry#;�V�΀$$�����G|��m��c��9����*'E�3���ׯ_c~�)+&��h4�N��އ���Z�뿉+W������{Ue�(���R��}��F�W���{9s������h4����HeYN��Y�|��Z�~{��~�Ί;i�/��`tڻ�~���oB�]�;�}pv�?��`�BY�D��qVz|܈��y]H�(
I�J�}�jQS�u�eIW����(E�,��ӂt=�[K�t^�V��i��WI�r��|y<������Cq��U�~�)�^��ӓd-�����>�wu�*�3n���VA<k��k%���6�X�&\��ӌ�������hD~X:��c����!z'=��O7�8A? "#�����*��>���~���_�]yeq�X�^�2F�+b�EX)wVI�����BX�����;�c$��t�RK�ĭ{�}�Ϡ��Y ��ąw!�F4��7 �ʗ�B�r�;�f0��J7�/V\VۯĈ޸��\+K��h=L&�h�7j��On�3�����Lb��}�>�%vS(��rb�L�����T��
�l��)P�B[�����5!W;�ԉ����I��o;]^�u���9��VF�m��Ė�,�x�)9� �l�aѾ��V�r���D����
�j,�y�w�C�ƓT��
?ZTF�gF���<�>�������R��0��l��A�`v��5U,Q@�<v]i�h���+� �'�PyT���eM�&`���V���p3�ں\U{Eu%+�&� �4@d�uE��M^�!p�RE#�` ���5�J6�z����=	�{]4j >(�ֺ�*BAo�����ح�t�̓����d��8=�WR�q������"���O��`:���hS��~o艧GO���Z|��%��6o{|JE����i�]p��,=q���D]i�A�OȆ�&Y'�#�֨T06��þ��yp��&4�q)~-��x����#��@������������u�vZ�P�>Q����ϐ�<ˠA���xA�f��k�3fY�i$� ��z�L����E�rԖ<�
��Zq3Z��ژ^X�%�_Y<�_@�߉`,_��c�߁��Rr���,�$�H�%.�*�{\�9�]��\*�+e=�e�_�p J15h4���%2q�v���1w������' BU�	V��Zj(l2,�N���7r���9I����t؁<\�6�8u�(��.4DY������s"R�"3�$�&��~�^s ��B�����9����ѩ*m��$Qe(�;�?#�r�PU�m��r��]��m��U�]�4��Ժ-��55ģÅv3(�:i*\��鶃-�ǫ��)C-���6���?��}f��5�](3Mީ�P}��h����`<ti*�d@�(~q���M2+I
�U�^�4dض_-#�W�C,ft�Vd{�kE�G
݀�����o�h���Q�T��5�����5l�:���ws!~�����D'��T����4a��eܫM�5I�~鶼w����d����O��+�� 66Cgl��J;.ئƌ[֌Rϕ�CǑ�(/ Sd�؈џ�����&����<�(����t�ǋY�ٓ�!`����9������?o���쀻�6t��ao��T��}�Z�\���!&)�VnB)S����ʙč4P�)0A	]@��r���X��܀d�����c79O��
��Zږj�����L0�xB $��B����{���M`� �"���+�s��Y�h�Y�{��sBW(�{��i�c��&l�eM{%+Le}�v��������_y��A�v&5Ү���������}�
I�mĖj&=&��+7�,�?ꊚ8�����(}�-ne���h�^ y�%v�0�7�P�	���r��?=�y4�ˣ&��AooL�a׀��VD��Q����7|�:r�Ֆ+�	�obk!��br�H+$��4G�4s�,�h'����*�6k#�M�e�D.K���9[��o$$l����)��&|t4�tqj��_���o��M�4v]�bA��H������l6�zM�n��(m���'��s���\�9+<"Zi��S4;f�<jG�ٱ��d3���t�p�Y�x����=���<n���x.���t{BHK�
��!�_(ՑT��w)!h3�ʥ�B�l3��0�`�#ɖ	�S�z���bbkq-1��Y�deN��^���Ӯ;	|	��5s|�A��{��ґq��	��C�1i������}l��L�<P<�G������2��n������V�H���e�-���`�n�ǌ���2Ubb�&�S�rj�������� MN��&41dL�4'�k��v�wBR�N�C9�7F(������{�R��u��e�;v2�pp�ޱ�a���0�d xI�J��q�����_ꩥ���(���o�� ���@��jǸW�x
��,��a��KPwh ���E1Òe�(���oT]SXo�YD��N��=�u.���D'.���j>�9���`���̳�N�wv�Q���?ĉ9^E��:Opfp�t���,�����E P���ɋ��c�n}��fA�Ӈ��*1x{Ɉ;:�"_[�ZM����?��a|,�=?*IH��BB�������܆G_�P�!����i/�}�#�l.W�|G�B4]2��}<V��`���9��1 h(�QU��P��^�M�β�1+z��SNvE����+�4�V.4Kl�ZÌ�r&IHQ���;N�<l��� ��� X~���|�\'�yq(2'�
;E��+�Am�Ah����B�~j\�?���c��yA>e`V������l绬��zt K�A۝SN}c9����յ�)���3�<��+3��h�m�6�>X]/yjE�hj}�IӴw���J֍�e�>�k��w%+�Z/��"�x�}a�Ƭ0�Q��Y�hE��!߂*��*Z��'������u#<n��nU!cl{�KY �d�,)M�,8�luA?��3��a�4O����J���3��+g��lϐaev����zC�]4P�t$Yr�=?�]��M�zzvŅ�� ��)����`|rp��ƌrlE 5��/�u��Ź�������_�W,� �c��艓��R+��Ee��44�%ʗ���)h��I��S�I�����E�J�����.����6zi
93��5�&"/�d��e�X*��|�@>I�%��4�[��ю�o����u^ҩ'�]B&6J��Mw4۠G��ō���P6�`!����U3ɋ?)|�y���G2��%�Y��BM4�:��*�O#���+�޻2Ĵ�֝�I줤U�W�ͷ��U��2)��9���Y���ƅ"�ˍ��7����G�o��Kq��dHC}�!�����Nf�nZ����u�S�G�+,��&��g���d�      ]   Y   x�ʻ�0���!�����y�X[�g fa1$���6�wSIVB=XDi��W�X�����4��k�E"g#2��ngҌm �6�      ^   �  x�eT�nG=�|E�|����8�a0�F�o'B���,���BJ�s�)��K���,��=U]�ޫ׳�x'�˥x�b	�B_x1��;0bn�A]�e���|�>z1?g�]�!��TʐIOtG0q^{G8q����G�ɡ�)��cBE��T�z��ѻ��������U���2�1e�4l�o��]���S�n�Fo^O��?��v���r6}��!�@��1���=��k7�[oE��2�=~ݒ��S,#�GN�w�n��a��Uu�Tm2��@�	\\̺W]��T��u��;Uy�ckO��XV��1����dr��#g�uO.y���t�=�m���W'���w$��u1%��%�Eg��i��y�$J0�q0{��[Uw�����%F\�F��Kŭ���8��i�����(��-����r������U����x�V�W�r%�`�'� �=��
>%-6V��Ajl�z1������6��I����z�aW밙G]������O0����o��l��@�!r���Ċ��5����{յ&- n�;a���ba�e�ۉG8��خ�P����2��b_|�5�]��<]�'���U�zZ�3���TR��Z��o�����b�%J$ɢ2̈́�@������\��(�j*l���|�bbd��~Ϊ�O�6���o���Fr,���P�y���#ɞ��Uzz��a�s��Q��O�3j#���g��%7��|�a�='�q Ͱh��'M���+�4      _   �   x����@�����D�D`9rr���������%|c�����S�dJ�`�!n��i*u69���]�`Q���ى������hi�%��P�i��e�f�9��G�8�m�SҧMs�3�e�mg=('M�� �x�x]� և<      `   
  x�u��r�@�ϛ�Дk����)�@C��q`r���VY��~��o��p�S��кe8yWZI?�%_%��� �E�B���f�#D�dh��q7TR�(tL�!����~V\���R$[��yI�$��%�%��,�#<'/Z��\��SS���g���a��B?�o+��`P�RK"$�]�p�h1@�=�LgS�޼����lZ���uɖ��*��+�����9}m.�eEem���L-��G�|1��T��si�J��d�.��\�J6��;õԻ�U�1lᒾ�*���X������
��j�OYrV���/��3�p=izm:	��>lU�MN�O�1+�ѱ~F��evO!��D�+j��aX	*0�ի�u�ߒ��>�s��o�J���z�x�S7��a�f�Ls(�o�~O����%9s�I;�&���`�d��*��SϽ6�y��^]<�v41o�FEYc��{x��2��t�Ap'ZI}m���3�ʴ�.̭�HJ?@T�I����^�A�'���L1Z      a   $   x�3�K�K�*M�I�2�t����M�L����� H      c   �  x��T�n�@}^�b~�6�\�͵DB��>�e��0b=�wi��>�;�cC#%�Qe![Hsv�m��������|��y�C ��K�%YaἹq7n-Upb�n�tz�����E	0�e��*3�-�h�I��;�[Hu\���0���6y�m��[\��S���*ڍ���L(��L�$Yۤy�܋�
�GP��+�PXÙGA�Z�k�c���e�i� �sfZ�3,+ڙA�Jf�Nv(�`F��bY��p��׺�Rk���S5�<��VZ�:�;s��Uk�+,���43y�y�{�3�!��J�!̸"p? �S}y�`k��J���~��D!�?U# K�J�C:o���Ifh|�Jh�vo�۫_F)�j���*����y�i�6��*gM9�&�V�%
��k�f�R��^���n��}�(�tA`Q����hn���.�Ȟw��i��4v����<Qa�|`�d�8zfq���������؟��!�}�%1g~�*Ϲ���p��\�FcM�.���u��ϱ�np��ڏ���|`���<\iA���!o�A�����ف���R�T��N:�ɕD��/8٪�Ś
���T#���Oa�@�4D�Gx�$���_����	�]1ɚ�u���jh��@5ԓ^nfV?vne�Я~~bh����$������|��j�� x�,�      d   �   x�u��
�@Eי���w�Bq�;7i;Ց̤�C��>�HV	�^N$�����`�V+��Y[��]�P�S~2��W����`Φ�+v����R���tBt%��7h� �(suQ�!N�@�Uͭ�N�Z��v���˾�R��4�ڞ��agb�D>����~��y�1��h�2I�ǟ-~�	!���s�      f   �  x�}�Qn�@���)|��C�4�R�T!RW�}q�)�]����i����������C�7+{
�D�eb9z�C�t%��ܪ� �����٥V��%�,I#�*F)kߕk!�f���}Ĉ�F8k����j�g.�{��5;*���e�l;ߧ���zFرs�~r[��N���V��`MRqȊ��|D�Y�8��hG~Z��`���\�-g�_�b\�$�F,��Z�%p����+:�JS��ڄ�Z6�k�W2��jH-(Y��c��S�6�S	M�z���L�]'e�r�-�`;rm��:�M�l	C�ݍ����~��ŧ+V��`|�e�8����g4�r�m���]N�{
�K��
��&��|�Ճ/k&xV���{�nPL�Q�i�[��Xn�n����t��Cs��b$���7��F?���K���9��c���R$t��Ҿ��ږ|�<���~�Ȳ�g�W      g   c  x�mRmn�0�m��'���A$Mh1�g31a�,(*��ӳ�bS7X������ �Ufhml�c�Y�'IZ�;�Eodi�=jp�Y�J�J7��Q4�-wk![r��1X&N����\r���ݠl��K��vcen@S���J�FJ��w.����wzC������lP��ߔ��)���r�'�G�Ù�0�Ko�����Q%�s�1-�Î��Ҥ�*R� �u(EA������#���E�d��e ���{�����v�	�g��K*뵫v����CثP��C�4��P�"\JAKhk(c!%��c�[N����J9��y����9���G��^yk��
m���\��/!�_xp      h   �  x���Kn�@��3���~�5�Ĉ��(�a$J"4��*��+UԊ�"�����?����Hk�����^�=s�MF�4nO�{*)DfM�R��B@1+nol!Al@;t���&�oo`�h�Ct�^�w���yo* ��n���_�R�1�opQ��(\ad��!�����(��Zꎺ��n9�~��MG�-=�؎fl%�Q o���b./���dN(�B1����*�Rv�>����}��+���{@��΂Q]�!��%w�����2H�e��\�f��<�/T����=�H�=������uG�2T���?g(�?Bנ���3�r2l+Z͍��G�n��w�J^u[��ԙ)ΠR�"&���8�I��-_Ɖ����G<��{��U^(qy�u�Oo�ǃ��7L(Y      i   �  x�}V�r�6<_1U�&.�E�(�+{]��X����&�""P�v��1߱?�!M��-�՘�����M�"�s���`ō�ʿ|U��L<K��Rnak-D	[��H����E|��	T|�u��-���S��B9*g\U%���2x(��yu�~�uiw�,� N<2��Jx�*;R�==�7X�������pF�	M���c�����1��J�\2�DI�pʾB¹��n�5W�an�as̆�hȖ��-�G'�'nH�����Bm`���WE���xƮPr�˄�[����Z�F�HF���a>�����E��O,��V�s\(b�F����iS7�+���֎��{�_�-�*��GDv��V�\kE�b.��鏦�Z�d4X�y!2穵~!v�������ߚ�B"�C?���bAT%��Vۏ���$!�V�/_�`k�	K+i�q��8d7�i�<a���/pE?�r֕��n@�%8}/e7��m��=�<������������4�N��K�R����;�Ee��B�IEm�1��ۜÃ&��*���������[��Z�4��9u��1Xo�Y�h;!��Oeq ��t���=�L𼲚:%e�p2�w2J؝�$�TF��RpJ��xEh�����=RKpO?w~/�t
��:I�q�֔wDkA�E�G}_I�/���=��4��J
R�]Io�.jÐ�)��^��}LG-x2d��~p��m���=���?����v{bL��Y�f�x�檊H[��t�e�|Ov'e�I�3��YO��0����$�R�	��6�7���kG��Ax�V�_,Cvi�v]��ye��;Y��6�꼏��2�腈�->��{Ƕu���w��O؝��ޥ�n��~��'ҏ�-�4V���������=1�){�X�:V�))i���� �hB(^YrE��m[o;�D
Kr(&��GDm���P;g��t�`�Ǜ�&����E�[�F��UJ����� �_g��� u|�3      j     x���QN�@D����@ܠ)$��@S�
�ce�d��Z�nJs{� R�;o<{ˮ�2��Wr5j�I:��m�O�8��/K�\��`�Α���a�-:���<�ƅ8+���T[�p�I�����r1�Y���X��ި�AaY̊=~�,Kvx4��V䆜%���K!��[��M<ʪi�I�k�a� �vި�:R��&��=S,/�W׼C�]��	,B�O�;:ǖcބ'U�Ӵ#�0m�pu���k��'�Ʀ�      k      x������ � �      l   S   x�p�
�I�.I,���S0Fᙠ�L�"��+�� ��T#8�(3U!��/3�$5/%_!<3�����g�$gp��qqq 8�(�      m   <  x��UK�9]w�B|�� ?`&h��ʆUf�Tb�T2��&�b0G���(U�rW��.��{���<qto2�ot'#8�TlO��G9��`��ݓ$��ٻ�2E��zd���i��t1ߦ�ؑʍz�Q��M�7���A����9�<�Qn��K��ۀחdn�lHKht��>����k�S��$*��##�ce��������
����h�5�!G����̎Jwȸ�6��}�^��,'��?.�5W�Ж�gt�rrr_��+*D�)'��D��!Qm|r�0L���]��b��>��߇Y<�A��������/p��۴Δ����= _��nE�V�_�~�Rq�fB������ �>f\���q$��^'��3�6�|��e��[ʹZ��{/�p�9�#�˵-h�Q�w��/�[=�p���t�G�0M��%垆I+�6]����ڭ�.?A���r�0ݬ(b�MƮ{�sQA�kRMw益U�\��4l�������0-�8����l�l�`a��M�Z�"n�4�u� �>�!6]4S(���>ـ�֏҃W�Aݽ�9��Mv9��#��2nI�u�/�� aڽ��Ƚֱ��rBqTLt)7�Z��z����u�ܢTj�����Fm����?�z��`d��l5t���TC1@�0��c��6��.��o\��_�_�^�MӇ����)�Us�� ϊ���������E��#�6 S�q�������o���G�'3�v�Q_I[���^ap�A���zU^2��/�V�(T��wzr�х?����s.7/f��,�3ْ��Tt�}�u]�E      n   �  x���Qr1���S��C!I)���C_����kQ�N&�MЇN�����6ax	��g��/��Eݗd�bv(�.���b��%y����ڠaM%�yp�Zд�c��,�i1U�2�Р�Bl؀���cD��4�!ؘ6�&��CJ�p+�O��\��+�Si	��6�A:��(�[G�v�������)W`՘�z�<�D��%zٿjO1~��u?B��Y5����4w���Y��x�Z����3��n�]-�G� ۞V�6d�аuۗk��J���G���H�� :�'���p�H�t�P�*��%5���/��x�}5�[r>�����^'ԇB͠"Ps���ų����̚<��XH�z[lȽ�QAgD&�\4[M��im�S+~�C6�B�ƾ�2�ƫ�=8�i�a�j^������|Ȭ/7q��-���"��?S��~w�ˌjz?�CÒ��:���,;��[f���]�9����`��|B      o   B   x���/O,JQ.I,���ϫ�0�\3K�29C2��S2���R
R��KJ�����qqq ��D      p      x������ � �      q      x������ � �      r     x���MN�0���s��hv%U�*A�e����6��d�?��8,P�Y�\K8��<���irC�#�[�Hh�	i��*=�g.����V��</4&Oh�,%�ۻ�Y"Fu�K�C[�^c^Y�G؞�վ�����la�`yO��:����ϱ�o"]S�w�+�i���y�5��"���J�mژ�?�`�pIܾ��Ϛ{G�xOs�x� *%$˿�#�:�y݉^G5�-W�A�2L���^��x�(��+��T      s   ?   x�3�4ճ��t��I\F�� �������\�e�ih�, a.NN���T0����� �	      t   f   x�U��C!C��]�;�e��?G�*����Q뙣��*+�!��ewR���ű<Ū����΃�q�km�2���"�e��.Ne��7��O��������?�(�      u     x����n� @����pշm���6iP��Fe��_��.4��08�3H��կ��z7N����b�^b�cp�D]��N%ԕ�J
N�H�AŶl��>�x|D*m*�����}��송����5�H�_�q*��q�m��tp�ʶ�6�u�t@
��j����i��+�)u�p!�RS�J�랕�R�J7\ŏk�1�J7�<*=��w�N��Nf���%8���}�q*?;$Lp*é8���Oq:��G��n��^����'�l�)���?��(� uڜ      v   �  x�MRQ�1�NN�p����n��+�w�ٙ�#;���p�z1�����3N���}��M�6��b'%3��ÒT��ªMc�$Gd��p,9�p��$�,��W�MP'�+�J�����;T���W��$�IN=O�d�Q����t6��Ӱ�≬)�+�G҂,�r����G�VW:ӓ��4,R���76��85����"lR��֓�u.?S�V:da�5�oy���m�3���R�����V
���/�Y����u��w�1.�
{�R�<�)������͎�VE1YGZ3_3i�ڳ�U`3T<�f��PE{.����5s�tTf��惏Q���,����^ͺ�*�Fz��������Z\Ӯ�)��mW��� >bŸ�[��/�����ɹ�n���]��/���     