PGDMP         ,                {            Backup1    15.3    15.3 �    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    24642    Backup1    DATABASE     �   CREATE DATABASE "Backup1" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
    DROP DATABASE "Backup1";
                postgres    false                       1255    24643    archienemigo()    FUNCTION     ;  CREATE FUNCTION public.archienemigo() RETURNS trigger
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
       public          postgres    false                       1255    24644 
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
       public          postgres    false                       1255    24645    ganancia_perdida()    FUNCTION     �   CREATE FUNCTION public.ganancia_perdida() RETURNS trigger
    LANGUAGE plpgsql
    AS $$begin

if new."Ganancia" < new."Coste" then
	raise exception 'Las perdidas de la pelicula son mayores a sus ganancias';
end if;
return new;
end;
$$;
 )   DROP FUNCTION public.ganancia_perdida();
       public          postgres    false                       1255    24646    genero()    FUNCTION     4  CREATE FUNCTION public.genero() RETURNS trigger
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
       public          postgres    false                       1255    24647    numcalificacion()    FUNCTION       CREATE FUNCTION public.numcalificacion() RETURNS trigger
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
       public          postgres    false                       1255    24648 	   numperf()    FUNCTION     3  CREATE FUNCTION public.numperf() RETURNS trigger
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
       public          postgres    false                       1255    24649    numrating()    FUNCTION     �   CREATE FUNCTION public.numrating() RETURNS trigger
    LANGUAGE plpgsql
    AS $$BEGIN

IF new."Rating" < 1 OR new."Rating" > 5 THEN
	RAISE EXCEPTION 'El rating debe ser un numero entre 1 y 5';
END IF;

RETURN NEW;
END;
$$;
 "   DROP FUNCTION public.numrating();
       public          postgres    false                       1255    24650    numusuarios()    FUNCTION     Y  CREATE FUNCTION public.numusuarios() RETURNS trigger
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
       public          postgres    false            	           1255    24651    rolpersonaje()    FUNCTION     6  CREATE FUNCTION public.rolpersonaje() RETURNS trigger
    LANGUAGE plpgsql
    AS $$begin

if new."Rol" != 'Antagonista' AND new."Rol" != 'Protagonista' AND new."Rol" != 'Secundario' then
	raise exception 'Un personaje solo puede ser "Protagonista", "Antagonista" o "Secundario"';
end if;
return new;
end;
$$;
 %   DROP FUNCTION public.rolpersonaje();
       public          postgres    false                       1255    24652    tipoactor()    FUNCTION       CREATE FUNCTION public.tipoactor() RETURNS trigger
    LANGUAGE plpgsql
    AS $$begin

if new."Tipo_Actor" != 'Interpretado' AND new."Tipo_Actor" != 'Presta su voz' then
	raise exception 'Un actor solo puede Interpretar un personaje o Prestar su Voz';
end if;
return new;
end;
$$;
 "   DROP FUNCTION public.tipoactor();
       public          postgres    false            
           1255    24653    tiposuscripciones()    FUNCTION     �  CREATE FUNCTION public.tiposuscripciones() RETURNS trigger
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
       public         heap    postgres    false                        1259    25224    Combate    TABLE     �   CREATE TABLE public."Combate" (
    "N_Personaje" text NOT NULL,
    "N_Poder" text NOT NULL,
    "N_Objeto" text NOT NULL,
    "Fecha" date NOT NULL,
    "Lugar" text
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
       public         heap    postgres    false            �            1259    24716 	   Historial    TABLE     1  CREATE TABLE public."Historial" (
    "N_Titulo" text NOT NULL,
    "Id_Perfil" integer NOT NULL,
    "Calificacion" integer NOT NULL,
    "Hora_Inicio" date NOT NULL,
    "Hora_Fin" date NOT NULL,
    CONSTRAINT "Historial_Calificacion_check" CHECK ((("Calificacion" >= 1) AND ("Calificacion" <= 5)))
);
    DROP TABLE public."Historial";
       public         heap    postgres    false            �            1259    24722    Juego    TABLE     y   CREATE TABLE public."Juego" (
    "T_Juego" text NOT NULL,
    "Distribuidor" text NOT NULL,
    "Tipo" text NOT NULL
);
    DROP TABLE public."Juego";
       public         heap    postgres    false            �            1259    24727    Medio    TABLE     )  CREATE TABLE public."Medio" (
    "Titulo" text NOT NULL,
    "Fecha_Estreno" date NOT NULL,
    "Compania" text NOT NULL,
    "Rating" integer NOT NULL,
    "Sinopsis" text NOT NULL,
    "Imagen" text NOT NULL,
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
       public          postgres    false    234            �           0    0    Pais_Id_Pais_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public."Pais_Id_Pais_seq" OWNED BY public."Pais"."Id_Pais";
          public          postgres    false    235            �            1259    24759    Pelicula    TABLE     �  CREATE TABLE public."Pelicula" (
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
       public          postgres    false    237            �           0    0    Perfil_Id_Perfil_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public."Perfil_Id_Perfil_seq" OWNED BY public."Perfil"."Id_Perfil";
          public          postgres    false    238            �            1259    24774    Pers_Creador    TABLE     g   CREATE TABLE public."Pers_Creador" (
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
       public         heap    postgres    false            �            1259    24789 	   Personaje    TABLE     X  CREATE TABLE public."Personaje" (
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
    "Canal" text NOT NULL
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
       public         heap    postgres    false                       2604    24869    Cargo Cod_Cargo    DEFAULT     x   ALTER TABLE ONLY public."Cargo" ALTER COLUMN "Cod_Cargo" SET DEFAULT nextval('public."Cargo_Cod_Cargo_seq"'::regclass);
 B   ALTER TABLE public."Cargo" ALTER COLUMN "Cod_Cargo" DROP DEFAULT;
       public          postgres    false    216    215            	           2604    24870    Ciudad Id_Ciudad    DEFAULT     z   ALTER TABLE ONLY public."Ciudad" ALTER COLUMN "Id_Ciudad" SET DEFAULT nextval('public."Ciudad_Id_Ciudad_seq"'::regclass);
 C   ALTER TABLE public."Ciudad" ALTER COLUMN "Id_Ciudad" DROP DEFAULT;
       public          postgres    false    218    217            
           2604    24871    Estado Id_Estado    DEFAULT     z   ALTER TABLE ONLY public."Estado" ALTER COLUMN "Id_Estado" SET DEFAULT nextval('public."Estado_Id_Estado_seq"'::regclass);
 C   ALTER TABLE public."Estado" ALTER COLUMN "Id_Estado" DROP DEFAULT;
       public          postgres    false    225    224                       2604    24872    Pais Id_Pais    DEFAULT     r   ALTER TABLE ONLY public."Pais" ALTER COLUMN "Id_Pais" SET DEFAULT nextval('public."Pais_Id_Pais_seq"'::regclass);
 ?   ALTER TABLE public."Pais" ALTER COLUMN "Id_Pais" DROP DEFAULT;
       public          postgres    false    235    234                       2604    24873    Perfil Id_Perfil    DEFAULT     z   ALTER TABLE ONLY public."Perfil" ALTER COLUMN "Id_Perfil" SET DEFAULT nextval('public."Perfil_Id_Perfil_seq"'::regclass);
 C   ALTER TABLE public."Perfil" ALTER COLUMN "Id_Perfil" DROP DEFAULT;
       public          postgres    false    238    237            U          0    24654    Aparece 
   TABLE DATA           R   COPY public."Aparece" ("N_Organizacion", "N_Titulo", "Estado", "Rol") FROM stdin;
    public          postgres    false    214   u,      V          0    24660    Cargo 
   TABLE DATA           =   COPY public."Cargo" ("Cod_Cargo", "Descripcion") FROM stdin;
    public          postgres    false    215   -      X          0    24666    Ciudad 
   TABLE DATA           F   COPY public."Ciudad" ("Id_Ciudad", "Nombre", "Id_Estado") FROM stdin;
    public          postgres    false    217   N-      Z          0    24672    Civil 
   TABLE DATA           ,   COPY public."Civil" ("N_Civil") FROM stdin;
    public          postgres    false    219   �-                0    25224    Combate 
   TABLE DATA           [   COPY public."Combate" ("N_Personaje", "N_Poder", "N_Objeto", "Fecha", "Lugar") FROM stdin;
    public          postgres    false    256   �-      [          0    24682    Crea 
   TABLE DATA           ;   COPY public."Crea" ("N_Personaje", "N_Objeto") FROM stdin;
    public          postgres    false    220   �.      \          0    24687    Creador 
   TABLE DATA           2   COPY public."Creador" ("Nom_Creador") FROM stdin;
    public          postgres    false    221   3/      ]          0    24692    Enfrenta 
   TABLE DATA           <   COPY public."Enfrenta" ("N_Heroe", "N_Villano") FROM stdin;
    public          postgres    false    222   �/      ^          0    24697    Esta 
   TABLE DATA           Y   COPY public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") FROM stdin;
    public          postgres    false    223   0      _          0    24704    Estado 
   TABLE DATA           D   COPY public."Estado" ("Id_Estado", "Nombre", "Id_Pais") FROM stdin;
    public          postgres    false    224   u2      a          0    24710    Heroe 
   TABLE DATA           `   COPY public."Heroe" ("N_Heroe", "Alias", "Logotipo", "Color_Traje", "Archienemigo") FROM stdin;
    public          postgres    false    226   �2      b          0    24716 	   Historial 
   TABLE DATA           i   COPY public."Historial" ("N_Titulo", "Id_Perfil", "Calificacion", "Hora_Inicio", "Hora_Fin") FROM stdin;
    public          postgres    false    227   �4      c          0    24722    Juego 
   TABLE DATA           D   COPY public."Juego" ("T_Juego", "Distribuidor", "Tipo") FROM stdin;
    public          postgres    false    228   �4      d          0    24727    Medio 
   TABLE DATA           h   COPY public."Medio" ("Titulo", "Fecha_Estreno", "Compania", "Rating", "Sinopsis", "Imagen") FROM stdin;
    public          postgres    false    229   �4      e          0    24733    Nacionalidad 
   TABLE DATA           /   COPY public."Nacionalidad" ("Nac") FROM stdin;
    public          postgres    false    230   �>      f          0    24738    Objeto 
   TABLE DATA           h   COPY public."Objeto" ("Nombre", "Descripcion", "Material", "Tipo", "Imagen", "N_Personaje") FROM stdin;
    public          postgres    false    231   P?      g          0    24743 	   Ocupacion 
   TABLE DATA           -   COPY public."Ocupacion" ("Ocup") FROM stdin;
    public          postgres    false    232   �A      h          0    24748    Organizacion 
   TABLE DATA           �   COPY public."Organizacion" ("Nombre", "Eslogan", "Lider", "Fundador", "Tipo", "Nom_Comic", "Imagen", "Objetivo", "Lugar_Creacion") FROM stdin;
    public          postgres    false    233   nB      i          0    24753    Pais 
   TABLE DATA           5   COPY public."Pais" ("Id_Pais", "Nombre") FROM stdin;
    public          postgres    false    234   �D      k          0    24759    Pelicula 
   TABLE DATA           w   COPY public."Pelicula" ("T_Pelicula", "Director", "Duracion", "Coste", "Ganancia", "Distribuidor", "Tipo") FROM stdin;
    public          postgres    false    236   �D      l          0    24767    Perfil 
   TABLE DATA           e   COPY public."Perfil" ("Id_Perfil", "Dispositivo", "Nombre", "Idioma", "Email", "Imagen") FROM stdin;
    public          postgres    false    237   XF      n          0    24774    Pers_Creador 
   TABLE DATA           D   COPY public."Pers_Creador" ("N_Personaje", "N_Creador") FROM stdin;
    public          postgres    false    239   G      o          0    24779    Pers_Nac 
   TABLE DATA           C   COPY public."Pers_Nac" ("N_Personaje", "Nacionalidad") FROM stdin;
    public          postgres    false    240   �H      p          0    24784    Pers_Oc 
   TABLE DATA           ?   COPY public."Pers_Oc" ("N_Personaje", "Ocupacion") FROM stdin;
    public          postgres    false    241   -J      q          0    24789 	   Personaje 
   TABLE DATA           w   COPY public."Personaje" ("Nombre", "Genero", "Color_Ojos", "Color_Pelo", "Nom_Comic", "E_Marital", imagen) FROM stdin;
    public          postgres    false    242   �K      r          0    24798 	   Pertenece 
   TABLE DATA           S   COPY public."Pertenece" ("N_Personaje", "N_Organizacion", "Cod_Cargo") FROM stdin;
    public          postgres    false    243   -R      s          0    24803 
   Plat_Juego 
   TABLE DATA           ?   COPY public."Plat_Juego" ("T_Juego", "Plataforma") FROM stdin;
    public          postgres    false    244   S      t          0    24808 
   Plataforma 
   TABLE DATA           .   COPY public."Plataforma" (nombre) FROM stdin;
    public          postgres    false    245   +S      u          0    24813    Poder 
   TABLE DATA           D   COPY public."Poder" ("Nombre", "Imagen", "Descripcion") FROM stdin;
    public          postgres    false    246   �S      v          0    24818    Posee 
   TABLE DATA           H   COPY public."Posee" ("N_Personaje", "N_Poder", "Obtencion") FROM stdin;
    public          postgres    false    247   �V      w          0    24824    RelacionadoHer 
   TABLE DATA           @   COPY public."RelacionadoHer" ("N_Civil", "N_Heroe") FROM stdin;
    public          postgres    false    248   �X      x          0    24829    RelacionadoVill 
   TABLE DATA           C   COPY public."RelacionadoVill" ("N_Civil", "N_Villano") FROM stdin;
    public          postgres    false    249   �X      y          0    24834    Sede 
   TABLE DATA           W   COPY public."Sede" ("Nombre", "Tipo_Edif", "Ubicacion", "Imagen", "N_Org") FROM stdin;
    public          postgres    false    250   �X      z          0    24839    Serie 
   TABLE DATA           O   COPY public."Serie" ("T_Serie", "N_Episodios", "Creador", "Canal") FROM stdin;
    public          postgres    false    251   	Y      {          0    24844    Suscripcion 
   TABLE DATA           N   COPY public."Suscripcion" ("ID", "Tarifa", "Descripcion", "Tipo") FROM stdin;
    public          postgres    false    252   �Y      |          0    24851    Tarjeta 
   TABLE DATA           N   COPY public."Tarjeta" ("N_Tarjeta", "Cod_Seguridad", "Fecha_Ven") FROM stdin;
    public          postgres    false    253   "Z      }          0    24858    Usuario 
   TABLE DATA           �   COPY public."Usuario" ("Email", "Contrasena", "Nombre", "Apellido", "Fecha_Nac", "Fecha_Creacion", "Id_Suscripcion", "N_Tarjeta", "Direccion") FROM stdin;
    public          postgres    false    254   �Z      ~          0    24864    Villano 
   TABLE DATA           E   COPY public."Villano" ("N_Villano", "Alias", "Objetivo") FROM stdin;
    public          postgres    false    255   �[      �           0    0    Cargo_Cod_Cargo_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public."Cargo_Cod_Cargo_seq"', 1, false);
          public          postgres    false    216            �           0    0    Ciudad_Id_Ciudad_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public."Ciudad_Id_Ciudad_seq"', 4, true);
          public          postgres    false    218            �           0    0    Estado_Id_Estado_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public."Estado_Id_Estado_seq"', 3, true);
          public          postgres    false    225            �           0    0    Pais_Id_Pais_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public."Pais_Id_Pais_seq"', 2, true);
          public          postgres    false    235            �           0    0    Perfil_Id_Perfil_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public."Perfil_Id_Perfil_seq"', 5, true);
          public          postgres    false    238            #           2606    24875    Aparece Aparece_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public."Aparece"
    ADD CONSTRAINT "Aparece_pkey" PRIMARY KEY ("N_Organizacion", "N_Titulo");
 B   ALTER TABLE ONLY public."Aparece" DROP CONSTRAINT "Aparece_pkey";
       public            postgres    false    214    214            %           2606    24877    Cargo Cargo_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public."Cargo"
    ADD CONSTRAINT "Cargo_pkey" PRIMARY KEY ("Cod_Cargo");
 >   ALTER TABLE ONLY public."Cargo" DROP CONSTRAINT "Cargo_pkey";
       public            postgres    false    215            '           2606    24879    Ciudad Ciudad_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public."Ciudad"
    ADD CONSTRAINT "Ciudad_pkey" PRIMARY KEY ("Id_Ciudad");
 @   ALTER TABLE ONLY public."Ciudad" DROP CONSTRAINT "Ciudad_pkey";
       public            postgres    false    217            )           2606    24881    Civil Civil_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public."Civil"
    ADD CONSTRAINT "Civil_pkey" PRIMARY KEY ("N_Civil");
 >   ALTER TABLE ONLY public."Civil" DROP CONSTRAINT "Civil_pkey";
       public            postgres    false    219            �           2606    25266    Combate Combate_key 
   CONSTRAINT     u   ALTER TABLE ONLY public."Combate"
    ADD CONSTRAINT "Combate_key" PRIMARY KEY ("N_Personaje", "N_Objeto", "Fecha");
 A   ALTER TABLE ONLY public."Combate" DROP CONSTRAINT "Combate_key";
       public            postgres    false    256    256    256            +           2606    24885    Crea Crea_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY public."Crea"
    ADD CONSTRAINT "Crea_pkey" PRIMARY KEY ("N_Personaje", "N_Objeto");
 <   ALTER TABLE ONLY public."Crea" DROP CONSTRAINT "Crea_pkey";
       public            postgres    false    220    220            -           2606    24887    Creador Creador_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public."Creador"
    ADD CONSTRAINT "Creador_pkey" PRIMARY KEY ("Nom_Creador");
 B   ALTER TABLE ONLY public."Creador" DROP CONSTRAINT "Creador_pkey";
       public            postgres    false    221            /           2606    24889    Enfrenta Enfrenta_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public."Enfrenta"
    ADD CONSTRAINT "Enfrenta_pkey" PRIMARY KEY ("N_Heroe", "N_Villano");
 D   ALTER TABLE ONLY public."Enfrenta" DROP CONSTRAINT "Enfrenta_pkey";
       public            postgres    false    222    222            1           2606    24891    Esta Esta_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY public."Esta"
    ADD CONSTRAINT "Esta_pkey" PRIMARY KEY ("N_Personaje", "N_Titulo");
 <   ALTER TABLE ONLY public."Esta" DROP CONSTRAINT "Esta_pkey";
       public            postgres    false    223    223            3           2606    24893    Estado Estado_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public."Estado"
    ADD CONSTRAINT "Estado_pkey" PRIMARY KEY ("Id_Estado");
 @   ALTER TABLE ONLY public."Estado" DROP CONSTRAINT "Estado_pkey";
       public            postgres    false    224            5           2606    24895    Heroe Heroe_Alias_key 
   CONSTRAINT     W   ALTER TABLE ONLY public."Heroe"
    ADD CONSTRAINT "Heroe_Alias_key" UNIQUE ("Alias");
 C   ALTER TABLE ONLY public."Heroe" DROP CONSTRAINT "Heroe_Alias_key";
       public            postgres    false    226            7           2606    24897    Heroe Heroe_Logotipo_key 
   CONSTRAINT     ]   ALTER TABLE ONLY public."Heroe"
    ADD CONSTRAINT "Heroe_Logotipo_key" UNIQUE ("Logotipo");
 F   ALTER TABLE ONLY public."Heroe" DROP CONSTRAINT "Heroe_Logotipo_key";
       public            postgres    false    226            9           2606    24899    Heroe Heroe_N_Heroe_key 
   CONSTRAINT     [   ALTER TABLE ONLY public."Heroe"
    ADD CONSTRAINT "Heroe_N_Heroe_key" UNIQUE ("N_Heroe");
 E   ALTER TABLE ONLY public."Heroe" DROP CONSTRAINT "Heroe_N_Heroe_key";
       public            postgres    false    226            ;           2606    24901    Historial Historial_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY public."Historial"
    ADD CONSTRAINT "Historial_pkey" PRIMARY KEY ("N_Titulo", "Id_Perfil");
 F   ALTER TABLE ONLY public."Historial" DROP CONSTRAINT "Historial_pkey";
       public            postgres    false    227    227            =           2606    24903    Juego Juego_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public."Juego"
    ADD CONSTRAINT "Juego_pkey" PRIMARY KEY ("T_Juego");
 >   ALTER TABLE ONLY public."Juego" DROP CONSTRAINT "Juego_pkey";
       public            postgres    false    228            ?           2606    24905    Medio Medio_Imagen_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public."Medio"
    ADD CONSTRAINT "Medio_Imagen_key" UNIQUE ("Imagen");
 D   ALTER TABLE ONLY public."Medio" DROP CONSTRAINT "Medio_Imagen_key";
       public            postgres    false    229            A           2606    24907    Medio Medio_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public."Medio"
    ADD CONSTRAINT "Medio_pkey" PRIMARY KEY ("Titulo");
 >   ALTER TABLE ONLY public."Medio" DROP CONSTRAINT "Medio_pkey";
       public            postgres    false    229            C           2606    24909    Nacionalidad Nacionalidad_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public."Nacionalidad"
    ADD CONSTRAINT "Nacionalidad_pkey" PRIMARY KEY ("Nac");
 L   ALTER TABLE ONLY public."Nacionalidad" DROP CONSTRAINT "Nacionalidad_pkey";
       public            postgres    false    230            E           2606    24911    Objeto Objeto_Imagen_key 
   CONSTRAINT     [   ALTER TABLE ONLY public."Objeto"
    ADD CONSTRAINT "Objeto_Imagen_key" UNIQUE ("Imagen");
 F   ALTER TABLE ONLY public."Objeto" DROP CONSTRAINT "Objeto_Imagen_key";
       public            postgres    false    231            G           2606    24913    Objeto Objeto_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public."Objeto"
    ADD CONSTRAINT "Objeto_pkey" PRIMARY KEY ("Nombre");
 @   ALTER TABLE ONLY public."Objeto" DROP CONSTRAINT "Objeto_pkey";
       public            postgres    false    231            I           2606    24915    Ocupacion Ocupacion_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public."Ocupacion"
    ADD CONSTRAINT "Ocupacion_pkey" PRIMARY KEY ("Ocup");
 F   ALTER TABLE ONLY public."Ocupacion" DROP CONSTRAINT "Ocupacion_pkey";
       public            postgres    false    232            K           2606    24917 &   Organizacion Organizacion_Fundador_key 
   CONSTRAINT     k   ALTER TABLE ONLY public."Organizacion"
    ADD CONSTRAINT "Organizacion_Fundador_key" UNIQUE ("Fundador");
 T   ALTER TABLE ONLY public."Organizacion" DROP CONSTRAINT "Organizacion_Fundador_key";
       public            postgres    false    233            M           2606    24919 $   Organizacion Organizacion_Imagen_key 
   CONSTRAINT     g   ALTER TABLE ONLY public."Organizacion"
    ADD CONSTRAINT "Organizacion_Imagen_key" UNIQUE ("Imagen");
 R   ALTER TABLE ONLY public."Organizacion" DROP CONSTRAINT "Organizacion_Imagen_key";
       public            postgres    false    233            O           2606    24921 #   Organizacion Organizacion_Lider_key 
   CONSTRAINT     e   ALTER TABLE ONLY public."Organizacion"
    ADD CONSTRAINT "Organizacion_Lider_key" UNIQUE ("Lider");
 Q   ALTER TABLE ONLY public."Organizacion" DROP CONSTRAINT "Organizacion_Lider_key";
       public            postgres    false    233            Q           2606    24923    Organizacion Organizacion_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public."Organizacion"
    ADD CONSTRAINT "Organizacion_pkey" PRIMARY KEY ("Nombre");
 L   ALTER TABLE ONLY public."Organizacion" DROP CONSTRAINT "Organizacion_pkey";
       public            postgres    false    233            S           2606    24925    Pais Pais_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public."Pais"
    ADD CONSTRAINT "Pais_pkey" PRIMARY KEY ("Id_Pais");
 <   ALTER TABLE ONLY public."Pais" DROP CONSTRAINT "Pais_pkey";
       public            postgres    false    234                       2606    25537    Pelicula Pelicula_Tipo_check    CHECK CONSTRAINT     �   ALTER TABLE public."Pelicula"
    ADD CONSTRAINT "Pelicula_Tipo_check" CHECK ((("Tipo" = 'Animacion'::text) OR ("Tipo" = 'Live Action'::text))) NOT VALID;
 E   ALTER TABLE public."Pelicula" DROP CONSTRAINT "Pelicula_Tipo_check";
       public          postgres    false    236    236            U           2606    24927    Pelicula Pelicula_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public."Pelicula"
    ADD CONSTRAINT "Pelicula_pkey" PRIMARY KEY ("T_Pelicula");
 D   ALTER TABLE ONLY public."Pelicula" DROP CONSTRAINT "Pelicula_pkey";
       public            postgres    false    236            W           2606    24929    Perfil Perfil_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public."Perfil"
    ADD CONSTRAINT "Perfil_pkey" PRIMARY KEY ("Id_Perfil");
 @   ALTER TABLE ONLY public."Perfil" DROP CONSTRAINT "Perfil_pkey";
       public            postgres    false    237            Y           2606    24931    Pers_Creador Pers_Creador_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public."Pers_Creador"
    ADD CONSTRAINT "Pers_Creador_pkey" PRIMARY KEY ("N_Personaje", "N_Creador");
 L   ALTER TABLE ONLY public."Pers_Creador" DROP CONSTRAINT "Pers_Creador_pkey";
       public            postgres    false    239    239            [           2606    24933    Pers_Nac Pers_Nac_pkey 
   CONSTRAINT     s   ALTER TABLE ONLY public."Pers_Nac"
    ADD CONSTRAINT "Pers_Nac_pkey" PRIMARY KEY ("N_Personaje", "Nacionalidad");
 D   ALTER TABLE ONLY public."Pers_Nac" DROP CONSTRAINT "Pers_Nac_pkey";
       public            postgres    false    240    240            ]           2606    24935    Pers_Oc Pers_Oc_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public."Pers_Oc"
    ADD CONSTRAINT "Pers_Oc_pkey" PRIMARY KEY ("N_Personaje", "Ocupacion");
 B   ALTER TABLE ONLY public."Pers_Oc" DROP CONSTRAINT "Pers_Oc_pkey";
       public            postgres    false    241    241            _           2606    24937    Personaje Personaje_Nombre_key 
   CONSTRAINT     a   ALTER TABLE ONLY public."Personaje"
    ADD CONSTRAINT "Personaje_Nombre_key" UNIQUE ("Nombre");
 L   ALTER TABLE ONLY public."Personaje" DROP CONSTRAINT "Personaje_Nombre_key";
       public            postgres    false    242            a           2606    24939    Personaje Personaje_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public."Personaje"
    ADD CONSTRAINT "Personaje_pkey" PRIMARY KEY ("Nombre");
 F   ALTER TABLE ONLY public."Personaje" DROP CONSTRAINT "Personaje_pkey";
       public            postgres    false    242            c           2606    24941    Pertenece Pertenece_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public."Pertenece"
    ADD CONSTRAINT "Pertenece_pkey" PRIMARY KEY ("N_Personaje", "N_Organizacion", "Cod_Cargo");
 F   ALTER TABLE ONLY public."Pertenece" DROP CONSTRAINT "Pertenece_pkey";
       public            postgres    false    243    243    243            e           2606    24943    Plat_Juego Plat_Juego_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY public."Plat_Juego"
    ADD CONSTRAINT "Plat_Juego_pkey" PRIMARY KEY ("T_Juego", "Plataforma");
 H   ALTER TABLE ONLY public."Plat_Juego" DROP CONSTRAINT "Plat_Juego_pkey";
       public            postgres    false    244    244            g           2606    24945    Plataforma Plataforma_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public."Plataforma"
    ADD CONSTRAINT "Plataforma_pkey" PRIMARY KEY (nombre);
 H   ALTER TABLE ONLY public."Plataforma" DROP CONSTRAINT "Plataforma_pkey";
       public            postgres    false    245            i           2606    24947    Poder Poder_Imagen_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public."Poder"
    ADD CONSTRAINT "Poder_Imagen_key" UNIQUE ("Imagen");
 D   ALTER TABLE ONLY public."Poder" DROP CONSTRAINT "Poder_Imagen_key";
       public            postgres    false    246            k           2606    24949    Poder Poder_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public."Poder"
    ADD CONSTRAINT "Poder_pkey" PRIMARY KEY ("Nombre");
 >   ALTER TABLE ONLY public."Poder" DROP CONSTRAINT "Poder_pkey";
       public            postgres    false    246            m           2606    24951    Posee Posee_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public."Posee"
    ADD CONSTRAINT "Posee_pkey" PRIMARY KEY ("N_Personaje", "N_Poder");
 >   ALTER TABLE ONLY public."Posee" DROP CONSTRAINT "Posee_pkey";
       public            postgres    false    247    247            o           2606    24953 "   RelacionadoHer RelacionadoHer_pkey 
   CONSTRAINT     v   ALTER TABLE ONLY public."RelacionadoHer"
    ADD CONSTRAINT "RelacionadoHer_pkey" PRIMARY KEY ("N_Civil", "N_Heroe");
 P   ALTER TABLE ONLY public."RelacionadoHer" DROP CONSTRAINT "RelacionadoHer_pkey";
       public            postgres    false    248    248            q           2606    24955 $   RelacionadoVill RelacionadoVill_pkey 
   CONSTRAINT     z   ALTER TABLE ONLY public."RelacionadoVill"
    ADD CONSTRAINT "RelacionadoVill_pkey" PRIMARY KEY ("N_Civil", "N_Villano");
 R   ALTER TABLE ONLY public."RelacionadoVill" DROP CONSTRAINT "RelacionadoVill_pkey";
       public            postgres    false    249    249            s           2606    24957    Sede Sede_Imagen_key 
   CONSTRAINT     W   ALTER TABLE ONLY public."Sede"
    ADD CONSTRAINT "Sede_Imagen_key" UNIQUE ("Imagen");
 B   ALTER TABLE ONLY public."Sede" DROP CONSTRAINT "Sede_Imagen_key";
       public            postgres    false    250            u           2606    24959    Sede Sede_Nombre_key 
   CONSTRAINT     W   ALTER TABLE ONLY public."Sede"
    ADD CONSTRAINT "Sede_Nombre_key" UNIQUE ("Nombre");
 B   ALTER TABLE ONLY public."Sede" DROP CONSTRAINT "Sede_Nombre_key";
       public            postgres    false    250            w           2606    24961    Sede Sede_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public."Sede"
    ADD CONSTRAINT "Sede_pkey" PRIMARY KEY ("Nombre", "N_Org");
 <   ALTER TABLE ONLY public."Sede" DROP CONSTRAINT "Sede_pkey";
       public            postgres    false    250    250            y           2606    24963    Serie Serie_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public."Serie"
    ADD CONSTRAINT "Serie_pkey" PRIMARY KEY ("T_Serie");
 >   ALTER TABLE ONLY public."Serie" DROP CONSTRAINT "Serie_pkey";
       public            postgres    false    251            {           2606    24965     Suscripcion Suscripcion_Tipo_key 
   CONSTRAINT     a   ALTER TABLE ONLY public."Suscripcion"
    ADD CONSTRAINT "Suscripcion_Tipo_key" UNIQUE ("Tipo");
 N   ALTER TABLE ONLY public."Suscripcion" DROP CONSTRAINT "Suscripcion_Tipo_key";
       public            postgres    false    252            }           2606    24967    Suscripcion Suscripcion_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public."Suscripcion"
    ADD CONSTRAINT "Suscripcion_pkey" PRIMARY KEY ("ID");
 J   ALTER TABLE ONLY public."Suscripcion" DROP CONSTRAINT "Suscripcion_pkey";
       public            postgres    false    252                       2606    24969    Tarjeta Tarjeta_N_Tarjeta_key 
   CONSTRAINT     c   ALTER TABLE ONLY public."Tarjeta"
    ADD CONSTRAINT "Tarjeta_N_Tarjeta_key" UNIQUE ("N_Tarjeta");
 K   ALTER TABLE ONLY public."Tarjeta" DROP CONSTRAINT "Tarjeta_N_Tarjeta_key";
       public            postgres    false    253            �           2606    24971    Tarjeta Tarjeta_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public."Tarjeta"
    ADD CONSTRAINT "Tarjeta_pkey" PRIMARY KEY ("N_Tarjeta");
 B   ALTER TABLE ONLY public."Tarjeta" DROP CONSTRAINT "Tarjeta_pkey";
       public            postgres    false    253            �           2606    24973    Usuario Usuario_Apellido_key 
   CONSTRAINT     a   ALTER TABLE ONLY public."Usuario"
    ADD CONSTRAINT "Usuario_Apellido_key" UNIQUE ("Apellido");
 J   ALTER TABLE ONLY public."Usuario" DROP CONSTRAINT "Usuario_Apellido_key";
       public            postgres    false    254            �           2606    24975    Usuario Usuario_Nombre_key 
   CONSTRAINT     ]   ALTER TABLE ONLY public."Usuario"
    ADD CONSTRAINT "Usuario_Nombre_key" UNIQUE ("Nombre");
 H   ALTER TABLE ONLY public."Usuario" DROP CONSTRAINT "Usuario_Nombre_key";
       public            postgres    false    254            �           2606    24977    Usuario Usuario_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public."Usuario"
    ADD CONSTRAINT "Usuario_pkey" PRIMARY KEY ("Email");
 B   ALTER TABLE ONLY public."Usuario" DROP CONSTRAINT "Usuario_pkey";
       public            postgres    false    254            �           2606    24979    Villano Villano_Alias_key 
   CONSTRAINT     [   ALTER TABLE ONLY public."Villano"
    ADD CONSTRAINT "Villano_Alias_key" UNIQUE ("Alias");
 G   ALTER TABLE ONLY public."Villano" DROP CONSTRAINT "Villano_Alias_key";
       public            postgres    false    255            �           2606    24981    Villano Villano_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public."Villano"
    ADD CONSTRAINT "Villano_pkey" PRIMARY KEY ("N_Villano");
 B   ALTER TABLE ONLY public."Villano" DROP CONSTRAINT "Villano_pkey";
       public            postgres    false    255            �           2620    24982    Heroe archienemigo_trigger    TRIGGER     �   CREATE TRIGGER archienemigo_trigger BEFORE INSERT OR UPDATE ON public."Heroe" FOR EACH ROW EXECUTE FUNCTION public.archienemigo();
 5   DROP TRIGGER archienemigo_trigger ON public."Heroe";
       public          postgres    false    226    257            �           2620    24983    Historial calificacion_trigger    TRIGGER     �   CREATE TRIGGER calificacion_trigger BEFORE INSERT OR UPDATE ON public."Historial" FOR EACH ROW EXECUTE FUNCTION public.numcalificacion();
 9   DROP TRIGGER calificacion_trigger ON public."Historial";
       public          postgres    false    227    261            �           2620    24984    Personaje emarital_trigger    TRIGGER        CREATE TRIGGER emarital_trigger BEFORE INSERT OR UPDATE ON public."Personaje" FOR EACH ROW EXECUTE FUNCTION public.emarital();
 5   DROP TRIGGER emarital_trigger ON public."Personaje";
       public          postgres    false    242    258            �           2620    24985 !   Pelicula ganancia_perdida_trigger    TRIGGER     �   CREATE TRIGGER ganancia_perdida_trigger BEFORE INSERT OR UPDATE ON public."Pelicula" FOR EACH ROW EXECUTE FUNCTION public.ganancia_perdida();
 <   DROP TRIGGER ganancia_perdida_trigger ON public."Pelicula";
       public          postgres    false    236    259            �           2620    24986    Personaje genero_trigger    TRIGGER     {   CREATE TRIGGER genero_trigger BEFORE INSERT OR UPDATE ON public."Personaje" FOR EACH ROW EXECUTE FUNCTION public.genero();
 3   DROP TRIGGER genero_trigger ON public."Personaje";
       public          postgres    false    242    260            �           2620    24987    Usuario numusuarios_trigger    TRIGGER     �   CREATE TRIGGER numusuarios_trigger BEFORE INSERT OR UPDATE ON public."Usuario" FOR EACH ROW EXECUTE FUNCTION public.numusuarios();
 6   DROP TRIGGER numusuarios_trigger ON public."Usuario";
       public          postgres    false    264    254            �           2620    24988    Medio rating_trigger    TRIGGER     z   CREATE TRIGGER rating_trigger BEFORE INSERT OR UPDATE ON public."Medio" FOR EACH ROW EXECUTE FUNCTION public.numrating();
 /   DROP TRIGGER rating_trigger ON public."Medio";
       public          postgres    false    263    229            �           2620    24989    Esta rolpersonaje_trigger    TRIGGER     �   CREATE TRIGGER rolpersonaje_trigger BEFORE INSERT OR UPDATE ON public."Esta" FOR EACH ROW EXECUTE FUNCTION public.rolpersonaje();
 4   DROP TRIGGER rolpersonaje_trigger ON public."Esta";
       public          postgres    false    223    265            �           2620    24990    Esta tipoactor_trigger    TRIGGER     |   CREATE TRIGGER tipoactor_trigger BEFORE INSERT OR UPDATE ON public."Esta" FOR EACH ROW EXECUTE FUNCTION public.tipoactor();
 1   DROP TRIGGER tipoactor_trigger ON public."Esta";
       public          postgres    false    267    223            �           2620    24991 %   Suscripcion tiposuscripciones_trigger    TRIGGER     �   CREATE TRIGGER tiposuscripciones_trigger BEFORE INSERT OR UPDATE ON public."Suscripcion" FOR EACH ROW EXECUTE FUNCTION public.tiposuscripciones();
 @   DROP TRIGGER tiposuscripciones_trigger ON public."Suscripcion";
       public          postgres    false    252    266            �           2606    25297 #   Aparece Aparece_N_Organizacion_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Aparece"
    ADD CONSTRAINT "Aparece_N_Organizacion_fkey" FOREIGN KEY ("N_Organizacion") REFERENCES public."Organizacion"("Nombre") ON UPDATE CASCADE NOT VALID;
 Q   ALTER TABLE ONLY public."Aparece" DROP CONSTRAINT "Aparece_N_Organizacion_fkey";
       public          postgres    false    214    3409    233            �           2606    25302    Aparece Aparece_N_Titulo_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Aparece"
    ADD CONSTRAINT "Aparece_N_Titulo_fkey" FOREIGN KEY ("N_Titulo") REFERENCES public."Medio"("Titulo") ON UPDATE CASCADE NOT VALID;
 K   ALTER TABLE ONLY public."Aparece" DROP CONSTRAINT "Aparece_N_Titulo_fkey";
       public          postgres    false    214    3393    229            �           2606    25522    Ciudad Ciudad_Id_Estado_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Ciudad"
    ADD CONSTRAINT "Ciudad_Id_Estado_fkey" FOREIGN KEY ("Id_Estado") REFERENCES public."Estado"("Id_Estado") ON UPDATE CASCADE NOT VALID;
 J   ALTER TABLE ONLY public."Ciudad" DROP CONSTRAINT "Ciudad_Id_Estado_fkey";
       public          postgres    false    217    3379    224            �           2606    25307    Civil Civil_N_Civil_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Civil"
    ADD CONSTRAINT "Civil_N_Civil_fkey" FOREIGN KEY ("N_Civil") REFERENCES public."Personaje"("Nombre") ON UPDATE CASCADE NOT VALID;
 F   ALTER TABLE ONLY public."Civil" DROP CONSTRAINT "Civil_N_Civil_fkey";
       public          postgres    false    219    3423    242            �           2606    25327    Crea Crea_N_Objeto_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Crea"
    ADD CONSTRAINT "Crea_N_Objeto_fkey" FOREIGN KEY ("N_Objeto") REFERENCES public."Objeto"("Nombre") ON UPDATE CASCADE NOT VALID;
 E   ALTER TABLE ONLY public."Crea" DROP CONSTRAINT "Crea_N_Objeto_fkey";
       public          postgres    false    220    3399    231            �           2606    25332    Crea Crea_N_Personaje_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Crea"
    ADD CONSTRAINT "Crea_N_Personaje_fkey" FOREIGN KEY ("N_Personaje") REFERENCES public."Personaje"("Nombre") ON UPDATE CASCADE NOT VALID;
 H   ALTER TABLE ONLY public."Crea" DROP CONSTRAINT "Crea_N_Personaje_fkey";
       public          postgres    false    220    3423    242            �           2606    25337    Enfrenta Enfrenta_N_Heroe_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Enfrenta"
    ADD CONSTRAINT "Enfrenta_N_Heroe_fkey" FOREIGN KEY ("N_Heroe") REFERENCES public."Heroe"("N_Heroe") ON UPDATE CASCADE NOT VALID;
 L   ALTER TABLE ONLY public."Enfrenta" DROP CONSTRAINT "Enfrenta_N_Heroe_fkey";
       public          postgres    false    222    3385    226            �           2606    25342     Enfrenta Enfrenta_N_Villano_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Enfrenta"
    ADD CONSTRAINT "Enfrenta_N_Villano_fkey" FOREIGN KEY ("N_Villano") REFERENCES public."Villano"("N_Villano") ON UPDATE CASCADE NOT VALID;
 N   ALTER TABLE ONLY public."Enfrenta" DROP CONSTRAINT "Enfrenta_N_Villano_fkey";
       public          postgres    false    222    3467    255            �           2606    25347    Esta Esta_N_Personaje_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Esta"
    ADD CONSTRAINT "Esta_N_Personaje_fkey" FOREIGN KEY ("N_Personaje") REFERENCES public."Personaje"("Nombre") ON UPDATE CASCADE NOT VALID;
 H   ALTER TABLE ONLY public."Esta" DROP CONSTRAINT "Esta_N_Personaje_fkey";
       public          postgres    false    223    3423    242            �           2606    25352    Esta Esta_N_Titulo_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Esta"
    ADD CONSTRAINT "Esta_N_Titulo_fkey" FOREIGN KEY ("N_Titulo") REFERENCES public."Medio"("Titulo") ON UPDATE CASCADE NOT VALID;
 E   ALTER TABLE ONLY public."Esta" DROP CONSTRAINT "Esta_N_Titulo_fkey";
       public          postgres    false    223    3393    229            �           2606    25527    Estado Estado_Id_Pais_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Estado"
    ADD CONSTRAINT "Estado_Id_Pais_fkey" FOREIGN KEY ("Id_Pais") REFERENCES public."Pais"("Id_Pais") ON UPDATE CASCADE NOT VALID;
 H   ALTER TABLE ONLY public."Estado" DROP CONSTRAINT "Estado_Id_Pais_fkey";
       public          postgres    false    224    3411    234            �           2606    25357    Heroe Heroe_Archienemigo_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Heroe"
    ADD CONSTRAINT "Heroe_Archienemigo_fkey" FOREIGN KEY ("Archienemigo") REFERENCES public."Villano"("N_Villano") ON UPDATE CASCADE NOT VALID;
 K   ALTER TABLE ONLY public."Heroe" DROP CONSTRAINT "Heroe_Archienemigo_fkey";
       public          postgres    false    226    3467    255            �           2606    25362    Heroe Heroe_N_Heroe_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Heroe"
    ADD CONSTRAINT "Heroe_N_Heroe_fkey" FOREIGN KEY ("N_Heroe") REFERENCES public."Personaje"("Nombre") ON UPDATE CASCADE NOT VALID;
 F   ALTER TABLE ONLY public."Heroe" DROP CONSTRAINT "Heroe_N_Heroe_fkey";
       public          postgres    false    226    3423    242            �           2606    25392 "   Historial Historial_Id_Perfil_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Historial"
    ADD CONSTRAINT "Historial_Id_Perfil_fkey" FOREIGN KEY ("Id_Perfil") REFERENCES public."Perfil"("Id_Perfil") ON UPDATE CASCADE NOT VALID;
 P   ALTER TABLE ONLY public."Historial" DROP CONSTRAINT "Historial_Id_Perfil_fkey";
       public          postgres    false    227    3415    237            �           2606    25387 !   Historial Historial_N_Titulo_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Historial"
    ADD CONSTRAINT "Historial_N_Titulo_fkey" FOREIGN KEY ("N_Titulo") REFERENCES public."Medio"("Titulo") ON UPDATE CASCADE NOT VALID;
 O   ALTER TABLE ONLY public."Historial" DROP CONSTRAINT "Historial_N_Titulo_fkey";
       public          postgres    false    227    3393    229            �           2606    25367    Juego Juego_T_Juego_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Juego"
    ADD CONSTRAINT "Juego_T_Juego_fkey" FOREIGN KEY ("T_Juego") REFERENCES public."Medio"("Titulo") ON UPDATE CASCADE NOT VALID;
 F   ALTER TABLE ONLY public."Juego" DROP CONSTRAINT "Juego_T_Juego_fkey";
       public          postgres    false    228    3393    229            �           2606    25497    Serie Medio_T_Serie_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Serie"
    ADD CONSTRAINT "Medio_T_Serie_fkey" FOREIGN KEY ("T_Serie") REFERENCES public."Medio"("Titulo") ON UPDATE CASCADE NOT VALID;
 F   ALTER TABLE ONLY public."Serie" DROP CONSTRAINT "Medio_T_Serie_fkey";
       public          postgres    false    251    3393    229            �           2606    25312    Combate Objeto_N_Combate_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Combate"
    ADD CONSTRAINT "Objeto_N_Combate_fkey" FOREIGN KEY ("N_Objeto") REFERENCES public."Objeto"("Nombre") ON UPDATE CASCADE NOT VALID;
 K   ALTER TABLE ONLY public."Combate" DROP CONSTRAINT "Objeto_N_Combate_fkey";
       public          postgres    false    256    3399    231            �           2606    25532    Objeto Objeto_N_Personaje_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Objeto"
    ADD CONSTRAINT "Objeto_N_Personaje_fkey" FOREIGN KEY ("N_Personaje") REFERENCES public."Personaje"("Nombre") ON UPDATE CASCADE NOT VALID;
 L   ALTER TABLE ONLY public."Objeto" DROP CONSTRAINT "Objeto_N_Personaje_fkey";
       public          postgres    false    231    3423    242            �           2606    25377 '   Organizacion Organizacion_Fundador_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Organizacion"
    ADD CONSTRAINT "Organizacion_Fundador_fkey" FOREIGN KEY ("Nombre") REFERENCES public."Personaje"("Nombre") ON UPDATE CASCADE NOT VALID;
 U   ALTER TABLE ONLY public."Organizacion" DROP CONSTRAINT "Organizacion_Fundador_fkey";
       public          postgres    false    233    3423    242            �           2606    25382 $   Organizacion Organizacion_Lider_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Organizacion"
    ADD CONSTRAINT "Organizacion_Lider_fkey" FOREIGN KEY ("Nombre") REFERENCES public."Personaje"("Nombre") ON UPDATE CASCADE NOT VALID;
 R   ALTER TABLE ONLY public."Organizacion" DROP CONSTRAINT "Organizacion_Lider_fkey";
       public          postgres    false    233    3423    242            �           2606    25397 !   Pelicula Pelicula_T_Pelicula_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Pelicula"
    ADD CONSTRAINT "Pelicula_T_Pelicula_fkey" FOREIGN KEY ("T_Pelicula") REFERENCES public."Medio"("Titulo") ON UPDATE CASCADE NOT VALID;
 O   ALTER TABLE ONLY public."Pelicula" DROP CONSTRAINT "Pelicula_T_Pelicula_fkey";
       public          postgres    false    236    3393    229            �           2606    25402    Perfil Perfil_Email_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Perfil"
    ADD CONSTRAINT "Perfil_Email_fkey" FOREIGN KEY ("Email") REFERENCES public."Usuario"("Email") ON UPDATE CASCADE NOT VALID;
 F   ALTER TABLE ONLY public."Perfil" DROP CONSTRAINT "Perfil_Email_fkey";
       public          postgres    false    237    3463    254            �           2606    25407 (   Pers_Creador Pers_Creador_N_Creador_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Pers_Creador"
    ADD CONSTRAINT "Pers_Creador_N_Creador_fkey" FOREIGN KEY ("N_Creador") REFERENCES public."Creador"("Nom_Creador") ON UPDATE CASCADE NOT VALID;
 V   ALTER TABLE ONLY public."Pers_Creador" DROP CONSTRAINT "Pers_Creador_N_Creador_fkey";
       public          postgres    false    239    3373    221            �           2606    25412 *   Pers_Creador Pers_Creador_N_Personaje_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Pers_Creador"
    ADD CONSTRAINT "Pers_Creador_N_Personaje_fkey" FOREIGN KEY ("N_Personaje") REFERENCES public."Personaje"("Nombre") ON UPDATE CASCADE NOT VALID;
 X   ALTER TABLE ONLY public."Pers_Creador" DROP CONSTRAINT "Pers_Creador_N_Personaje_fkey";
       public          postgres    false    239    3423    242            �           2606    25417 "   Pers_Nac Pers_Nac_N_Personaje_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Pers_Nac"
    ADD CONSTRAINT "Pers_Nac_N_Personaje_fkey" FOREIGN KEY ("N_Personaje") REFERENCES public."Personaje"("Nombre") ON UPDATE CASCADE NOT VALID;
 P   ALTER TABLE ONLY public."Pers_Nac" DROP CONSTRAINT "Pers_Nac_N_Personaje_fkey";
       public          postgres    false    240    3423    242            �           2606    25422 #   Pers_Nac Pers_Nac_Nacionalidad_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Pers_Nac"
    ADD CONSTRAINT "Pers_Nac_Nacionalidad_fkey" FOREIGN KEY ("Nacionalidad") REFERENCES public."Nacionalidad"("Nac") ON UPDATE CASCADE NOT VALID;
 Q   ALTER TABLE ONLY public."Pers_Nac" DROP CONSTRAINT "Pers_Nac_Nacionalidad_fkey";
       public          postgres    false    240    3395    230            �           2606    25427     Pers_Oc Pers_Oc_N_Personaje_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Pers_Oc"
    ADD CONSTRAINT "Pers_Oc_N_Personaje_fkey" FOREIGN KEY ("N_Personaje") REFERENCES public."Personaje"("Nombre") ON UPDATE CASCADE NOT VALID;
 N   ALTER TABLE ONLY public."Pers_Oc" DROP CONSTRAINT "Pers_Oc_N_Personaje_fkey";
       public          postgres    false    241    3423    242            �           2606    25432    Pers_Oc Pers_Oc_Ocupacion_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Pers_Oc"
    ADD CONSTRAINT "Pers_Oc_Ocupacion_fkey" FOREIGN KEY ("Ocupacion") REFERENCES public."Ocupacion"("Ocup") ON UPDATE CASCADE NOT VALID;
 L   ALTER TABLE ONLY public."Pers_Oc" DROP CONSTRAINT "Pers_Oc_Ocupacion_fkey";
       public          postgres    false    241    3401    232            �           2606    25317     Combate Personaje_N_Combate_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Combate"
    ADD CONSTRAINT "Personaje_N_Combate_fkey" FOREIGN KEY ("N_Personaje") REFERENCES public."Personaje"("Nombre") ON UPDATE CASCADE NOT VALID;
 N   ALTER TABLE ONLY public."Combate" DROP CONSTRAINT "Personaje_N_Combate_fkey";
       public          postgres    false    256    3423    242            �           2606    25437 "   Pertenece Pertenece_Cod_Cargo_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Pertenece"
    ADD CONSTRAINT "Pertenece_Cod_Cargo_fkey" FOREIGN KEY ("Cod_Cargo") REFERENCES public."Cargo"("Cod_Cargo") ON UPDATE CASCADE NOT VALID;
 P   ALTER TABLE ONLY public."Pertenece" DROP CONSTRAINT "Pertenece_Cod_Cargo_fkey";
       public          postgres    false    243    3365    215            �           2606    25442 '   Pertenece Pertenece_N_Organizacion_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Pertenece"
    ADD CONSTRAINT "Pertenece_N_Organizacion_fkey" FOREIGN KEY ("N_Organizacion") REFERENCES public."Organizacion"("Nombre") ON UPDATE CASCADE NOT VALID;
 U   ALTER TABLE ONLY public."Pertenece" DROP CONSTRAINT "Pertenece_N_Organizacion_fkey";
       public          postgres    false    243    3409    233            �           2606    25447 $   Pertenece Pertenece_N_Personaje_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Pertenece"
    ADD CONSTRAINT "Pertenece_N_Personaje_fkey" FOREIGN KEY ("N_Personaje") REFERENCES public."Personaje"("Nombre") ON UPDATE CASCADE NOT VALID;
 R   ALTER TABLE ONLY public."Pertenece" DROP CONSTRAINT "Pertenece_N_Personaje_fkey";
       public          postgres    false    243    3423    242            �           2606    25452 %   Plat_Juego Plat_Juego_Plataforma_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Plat_Juego"
    ADD CONSTRAINT "Plat_Juego_Plataforma_fkey" FOREIGN KEY ("Plataforma") REFERENCES public."Plataforma"(nombre) ON UPDATE CASCADE NOT VALID;
 S   ALTER TABLE ONLY public."Plat_Juego" DROP CONSTRAINT "Plat_Juego_Plataforma_fkey";
       public          postgres    false    244    3431    245            �           2606    25457 "   Plat_Juego Plat_Juego_T_Juego_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Plat_Juego"
    ADD CONSTRAINT "Plat_Juego_T_Juego_fkey" FOREIGN KEY ("T_Juego") REFERENCES public."Juego"("T_Juego") ON UPDATE CASCADE NOT VALID;
 P   ALTER TABLE ONLY public."Plat_Juego" DROP CONSTRAINT "Plat_Juego_T_Juego_fkey";
       public          postgres    false    244    3389    228            �           2606    25322    Combate Poder_N_Combate_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Combate"
    ADD CONSTRAINT "Poder_N_Combate_fkey" FOREIGN KEY ("N_Poder") REFERENCES public."Poder"("Nombre") ON UPDATE CASCADE NOT VALID;
 J   ALTER TABLE ONLY public."Combate" DROP CONSTRAINT "Poder_N_Combate_fkey";
       public          postgres    false    246    256    3435            �           2606    25462    Posee Posee_N_Personaje_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Posee"
    ADD CONSTRAINT "Posee_N_Personaje_fkey" FOREIGN KEY ("N_Personaje") REFERENCES public."Personaje"("Nombre") ON UPDATE CASCADE NOT VALID;
 J   ALTER TABLE ONLY public."Posee" DROP CONSTRAINT "Posee_N_Personaje_fkey";
       public          postgres    false    247    3423    242            �           2606    25467    Posee Posee_N_Poder_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Posee"
    ADD CONSTRAINT "Posee_N_Poder_fkey" FOREIGN KEY ("N_Poder") REFERENCES public."Poder"("Nombre") ON UPDATE CASCADE NOT VALID;
 F   ALTER TABLE ONLY public."Posee" DROP CONSTRAINT "Posee_N_Poder_fkey";
       public          postgres    false    247    3435    246            �           2606    25472 *   RelacionadoHer RelacionadoHer_N_Civil_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."RelacionadoHer"
    ADD CONSTRAINT "RelacionadoHer_N_Civil_fkey" FOREIGN KEY ("N_Civil") REFERENCES public."Civil"("N_Civil") ON UPDATE CASCADE NOT VALID;
 X   ALTER TABLE ONLY public."RelacionadoHer" DROP CONSTRAINT "RelacionadoHer_N_Civil_fkey";
       public          postgres    false    248    3369    219            �           2606    25477 *   RelacionadoHer RelacionadoHer_N_Heroe_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."RelacionadoHer"
    ADD CONSTRAINT "RelacionadoHer_N_Heroe_fkey" FOREIGN KEY ("N_Heroe") REFERENCES public."Heroe"("N_Heroe") ON UPDATE CASCADE NOT VALID;
 X   ALTER TABLE ONLY public."RelacionadoHer" DROP CONSTRAINT "RelacionadoHer_N_Heroe_fkey";
       public          postgres    false    248    3385    226            �           2606    25482 ,   RelacionadoVill RelacionadoVill_N_Civil_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."RelacionadoVill"
    ADD CONSTRAINT "RelacionadoVill_N_Civil_fkey" FOREIGN KEY ("N_Civil") REFERENCES public."Civil"("N_Civil") ON UPDATE CASCADE NOT VALID;
 Z   ALTER TABLE ONLY public."RelacionadoVill" DROP CONSTRAINT "RelacionadoVill_N_Civil_fkey";
       public          postgres    false    249    3369    219            �           2606    25487 .   RelacionadoVill RelacionadoVill_N_Villano_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."RelacionadoVill"
    ADD CONSTRAINT "RelacionadoVill_N_Villano_fkey" FOREIGN KEY ("N_Villano") REFERENCES public."Villano"("N_Villano") ON UPDATE CASCADE NOT VALID;
 \   ALTER TABLE ONLY public."RelacionadoVill" DROP CONSTRAINT "RelacionadoVill_N_Villano_fkey";
       public          postgres    false    249    3467    255            �           2606    25492    Sede Sede_N_Org_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Sede"
    ADD CONSTRAINT "Sede_N_Org_fkey" FOREIGN KEY ("N_Org") REFERENCES public."Organizacion"("Nombre") ON UPDATE CASCADE NOT VALID;
 B   ALTER TABLE ONLY public."Sede" DROP CONSTRAINT "Sede_N_Org_fkey";
       public          postgres    false    250    3409    233            �           2606    25502    Usuario Usuario_Direccion_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Usuario"
    ADD CONSTRAINT "Usuario_Direccion_fkey" FOREIGN KEY ("Direccion") REFERENCES public."Ciudad"("Id_Ciudad") ON UPDATE CASCADE NOT VALID;
 L   ALTER TABLE ONLY public."Usuario" DROP CONSTRAINT "Usuario_Direccion_fkey";
       public          postgres    false    254    3367    217            �           2606    25512 #   Usuario Usuario_Id_Suscripcion_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Usuario"
    ADD CONSTRAINT "Usuario_Id_Suscripcion_fkey" FOREIGN KEY ("Id_Suscripcion") REFERENCES public."Suscripcion"("ID") ON UPDATE CASCADE NOT VALID;
 Q   ALTER TABLE ONLY public."Usuario" DROP CONSTRAINT "Usuario_Id_Suscripcion_fkey";
       public          postgres    false    254    3453    252            �           2606    25507    Usuario Usuario_N_Tarjeta_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Usuario"
    ADD CONSTRAINT "Usuario_N_Tarjeta_fkey" FOREIGN KEY ("N_Tarjeta") REFERENCES public."Tarjeta"("N_Tarjeta") ON UPDATE CASCADE NOT VALID;
 L   ALTER TABLE ONLY public."Usuario" DROP CONSTRAINT "Usuario_N_Tarjeta_fkey";
       public          postgres    false    254    3455    253            �           2606    25517    Villano Villano_N_Villano_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Villano"
    ADD CONSTRAINT "Villano_N_Villano_fkey" FOREIGN KEY ("N_Villano") REFERENCES public."Personaje"("Nombre") ON UPDATE CASCADE NOT VALID;
 L   ALTER TABLE ONLY public."Villano" DROP CONSTRAINT "Villano_N_Villano_fkey";
       public          postgres    false    255    3423    242            U   �   x�K�KOL�/J-���/VCp�K2��9��K���2�K��=<]}\p�NM.�KI,�̇��,��S�M�S0¢ƣ2�(��9� ����<���+�2��Rs
�2sS�ʠv�t;�!����� SB�      V   9   x�340���LI-�240�t�O+�KIL�q�8�S�JR�Lc΀����b�x� ��      X   O   x�344�tN,JLN,�44�244�t�,MILQHIUp�O�/I�44�s��+����s�T� 5� �q��qqq 
�a      Z       x�s�,)����/O,JQ.I,������ g�D         �   x�u�=
�@��z�s����2�BĨ�l�쐬&;��zK��Ō6"h��˷a{�ԣ;�Ê59���8=���
��s�!�9�T������,}X��[n-����3��sr�H�9�6�(&u�hM%��d��f!�wg2�� �`7QIZ�r�ZiVTF��X{i�?��rבR>�cM�      [   �   x�-̱1@�:����	�D�(�ј$�G9��P2�-Ɓh~��R��Wj7�֠�F���]%n����7�z�)�*��*8ܗw�@���._Z���c�>(��'3�������*p� ���.�      \   �   x�%�An�@��yA��@�b�\�,��Z{F6D�=K�u����L{@��jO\�w���M�)=0.�tn�������&��O�)a�l�U�t�[Z�����4>5��$'�U����;k�A@�<��]d�h�c-.;�zH�`ƫ~鑘�5�D��}�k����f!��ߎG�      ]      x������ � �      ^   X  x����r�@���)�=��[�0�B�&��"����6�]��qz�s��*��7�n�g��/闼���&���;�+��G���Ə�G�=�q��;�S����B���p�z%`�<�$.���N	��L2�w�
�s�ڕ=�[�b��K��ֳR�����O��x0���Q��8)��S^��"�D��}NF|����M��[l�߀���H`�Oק��=r��uL�u�#�UE���a6��lP�>�(�b��/��w�s6q����m�pЂ�����$��i����J
�Z;����!��OFE]h�ֹ����Y�MU;��Hn+�`�<���|�n�� [[i?����2lҢ�&^c�c��=<�-��җ�XgԜ���Ķ��B�(�S�_h_u:Yu);4�vY1�Y����2�59m��nU��i��=� m������"5�vj�&
A�f�~)�4!��F=r��:��K��9]�je�H�NS޿#L���l�l.V2���C�'1�����0�L�K����ֳ�mo%���c���)�P�޺���8|4;����S>{��,���Y7�_�$��7+      _   G   x�34�t�,.)�,�WpN,�,I��4�22���,J�KIr�8����K9����8}SSRsr2�=... ���      a   �  x�US[��0��O�,
=A� /���~�a1��2P��Z=B/V�I6�H͈Crtd�l�@*�K���|ĺ?�vv��5�͂�d� ����ҡ]B(�����-�e l}Qr�h�tF��zR�f��.}f�5�Jh���༄^�L%���{��=f���L��Z����	#�}=��3�]��)�7-�'�1�Z��0je',l7	�9��ZF�0F_�]1a4��נZ��5�$��P�9�y�nؠ	7%=v�1؃�躦���>��'ݯ(��%[P�����ԙ�X�{<R�c�y���(����NkR댊��ɟ&���J�bV\�͋��.�fS҉��2st��p����͇x��ʦ��>#Ri�&Tw���Z�)V]v,u�;�I��������v�	;Ef[HK�;��N��7��J'�6W����l��9��_���w(����.%��"����}|˲�?�`#2      b      x������ � �      c      x������ � �      d   �	  x��X�n9]�_A�Z���Wf;NKnw�� PU�D����,9���2/���~l�%�ʒ<L#�H%����{�=�L��ыz�V�şFb�F�a韉M&�ş�K�r���q+굢�Ɛ��H٭+�m�q��
o�Y4Y��T(�Y&�T+n�r�&|ld̕,����&�Y�:�Z�ǩ��K�b�𸐆6���ޒ[�Oo�O��<K�d��8�u"���/O
�'	s�h�sa�b��RFL����I��&���zf�D�t����rĳ�Ic�U� 贈g�8:-eOۍ�s�=�tdۈ$iKי#U=[�X���۞�ӽ��`�
�'r�
��H%̇�n�=�M��+%�:�B���Dƚ�(�d�Aى&�&�dH�>�� 00_��z@�l\ $bL�e���*��<-$��kC�M�X
�t��F�c�IūlB����i���W�&x'kgȝ�x�_�j�:�ȌO��;Ç���lؿ��O�S7|yX\�E�p~��-��/S7<O����������n=.>�?�ω���a��y�~�iu}~����;�cpt0�:8�ξu?4�f�8j�۲ ڠ]�a��=ڭ�~�4)Ѳ�4��<)�/ �o��
cB##�;I� W"�h���o�Y�$<	�wD_�M�q4HĲ��SԸɆs�*�V�v�}�9���@�Q��^�&�5,�xP _��#�s:��X!N픛�4���m�%c_']*:�E�Q�?���U[J�,L�dݣ�G��qo��w#&��97�ˑ�;�D�)v���O<tFf�t)Q��������։�`��M�;~��=���eJ�b��I����x��:-h��?�+NV.p�ns[��j*�f�o�$�����r�m�j�͔+��c���"iX�/��7ʖ�_��RQB#�9
M�Eb�n�>��|.|�Fn*L�=��ch�͵��=�/{?&��.�;w�?{�Q_�_]vN����;Scǳ����qܱ��(�@&{Qd�kj��� �=���*Fs $y�Q�t����7CU*�l�ǶɈZ@�d×�PԿ|�	�D��Blz-��(�*`�+hP�� ��+:@�k|ITUbG ^�qt,�<W֯[��{(��D��ؖTsy�'n&2:�-(w�u��s�����Y��&<�oO���s|u������W7�G?��9�S�z��߈�w�?hc�"2�0��GTPH�*��k���+^�꾥�@$7:�Pm ג�i�Q�S�B9��K(����3Y���jg��.&�îN���c�$,��g�"�A/%c�s=vh
n��gd\v���of�ՠ=���n�Q4�}��!���b�,�y� �e4�o
%-��?jA� ���j����q���P�f��g�Dmh�>$�ns�Z�(4�\�A��z.HJ��� �)�|A�5�h봜��"��Ԗ�-���Saaq���)sY坆�
F��Fj)B=fha��u2�4R���(p8(�E�з�8��R��0�h�
)���Pv����� ��Q��=�¾�8��Y�o���Ȋ���I�O#^:�z�t�xL����K�Y�@�r�p��͂0�]"_��3�>�����C ?�!!�X��+��Q�*TkP(�FS�
Q_�����/$-�\��P"�S��'��<0�s�9�F]� \C>(�<�a+���G[��7�%����7m��e�#,DHfo�~�>��an8ɩ�@jN����g��l�I=�o�6����x	ώ�hd%5۞(�M�I{�I͝+��7;��i���͐¹�0�ɘ�2X8W�Q�A!�P�����8%�b���*����*��Ҕ�.�[˚�D@"�\�lJo����!�ҍ�<J@�non�}�"�����|)WQ��ҳ��N�`t���u���: 7U|�wC�.�Zs%ө���5Q�EJ��g���!b�?ASb%��_H|<A�:�m@�[�ji6�b$��u����BxB쭋4/���[�.&ޏ�R��wh�Լ�E��s\�Ē<�N9k
!�Z������ow-uAIq���7+㝎����෭t~��D���FF��8��ܘ�t���Z���_��<�5˒%r�#�����ӕ�����Sy�M	ޚI��^�t �ж	E?L8�l�_"�X{Q�Ey�|Ҕ��<�$[�:e@Z�6\�%�-���Q���G����^���[t_:�"R�וt�L(����Hus�KQ��j�K���[8K�8�"���P����Up�ؐ4�=�*D�*��ۜ�2�v��G0lL ��V70�72v�ũ�FNj���߀~:)h<P����S��������,[Ǳ�v�'P3�ӑ|�\j�C��Z���L��pc�YޖTdSj���G��H'ߓ��L�d�.띰o�_&}��`�`�CR��|���1�P�ò�x�aPJ�E������[��U����E���/��Z�a���p�E��������/U)�      e   Y   x�ʻ�0���!�����y�X[�g fa1$���6�wSIVB=XDi��W�X�����4��k�E"g#2��ngҌm �6�      f   r  x�MS�n�0<S_�So��
7hQM�S�`E�m�|��l��c���X����e��ܝ�� n�t:e_���C��Z,'�w`�Ġ���
y����'�ѳ�9��r�)Cֲ�鍆�y��Fc�0q�Fj���No1&���PBI1��=��=��G���: a c�"I0Xg_�ʫZ��];� ����xsѵ��r|9�^�x����+L�λ��6S�j����ȨQ��xnOK-=��Ñ�3'�\��>�|��(�$J�q+���hܾk۷�xݶ���D^�X�S�z�&\/cj����Y�%��L>W�%�OI�Ӵ�������=��Z;��r0�v�F�uo�}�},��I�xPGa,*�ǥ(�Pv�HY�!l/Pॠ֓DuT`Եa_��n3n��K����|ޯ1{�pS�C0���ᦚ�x��;���~h��ڐ�bq�\B �)Pl"1Rq[8=��h�	2ug��ê밚DYf�����0��Ǳ����%�yp��5R�Z�+����%����\�Z��!�ޝ���	Pmvm���#ى$�D���n0�$�m�)�ć���[�$.���y��^8�k����l�iNs�a��T=4UU��"R|      g   �   x����@�����D�D`9rr���������%|c�����S�dJ�`�!n��i*u69���]�`Q���ى������hi�%��P�i��e�f�9��G�8�m�SҧMs�3�e�mg=('M�� �x�x]� և<      h     x�uR]k1|>�
AI����8N!��$��%�>m�6��U�]����.4�>I#i�3;�m�yي�u�s
�"��k>|�E���N��Q�R�Oo���{���w����lݢX���xWdm�]�(e�i*�E;2�r��P��D+KYn����I9_�Po���:�����M����T���k���X����e7!�� �[�e�����z�X�S�:A|���-�5�P(�F��U��\�4&)�ٛ�;�d��vF:OY�A�O�*�\�FsUEy��E9W��ROjZm�g����!O�gh���A/��U=�.�&QW-��E0�cx�5�ĳ���#�Ɛ����="գ?�[W;�#�-FiF$h0ș�m�X�DH�rVj�o�z{YN�iQUYUgg�������D�/��7�"��c�zd+�f�o�$��ր�v>��-����T�3�������f_\֊U�R�.I��_>�Zmv�ɳ��Zh4`	&��d2�)�!      i   $   x�3�K�K�*M�I�2�t����M�L����� H      k   �  x���Kn�@���)x�BR$�����q���z�+��c�À��eϑ��J�H��b����O~��ħߊ��鏗���=�����R�<���u�Sȋ�2���6�ipI#n���s���u��[��H�0��W:y��L(��/�.��W��r!��f�Q^AQd�Wv���Y��w15��s�;�[�=7�g\���.I�5G�^�C�ˠ���W�����uߙ+�Y�c�7��|��z�v.��;J�~ ��^Q����6�$����4����윞_pp�=Sma�2P����n`�W5��w^s�%��
�k�弃�x:�%�Q`6���_Ե��+e=b1ǭF���fCj��A��8�*.B~m��N[��a�ۈ��fN$���S���d2���      l   �   x�u��
�PF�3#����E��vmF��xG�O��'�$��}�'����ƫ�Y���X�F]��-W9�d$iu�=fP�8�@�:�O�'G�e�O*0_Ir���OdU �����q]��KU�sǍ]o�nW|���F8���!8�A���G��_��S�      n   �  x�}R�n�@|�~�����@)�*@��t/&1���-�nZ���H'�I�{�V�qfl�Ye�S���(��y�Ja���B!ǷJp�Neb��+���΍8�,Qe�����ne��`�"r�����06G�P�z-V*p�J�W�߳��u{��a݇!���a`�{_��kX�TM/�%��v$���;5Lr�!�L�L}iO~�F�0ó�R?���/O)%	���j#�%pBwv���?AmB��Vm�;�F��,��Jְ�Ԫ{�ئ�*��{���3vN8UM�u�6/��m�w}�_��(���%�%�W&	��;&)>\�fln�[�p���� ~O��Tv��-5Զˑ���BتP�wnʾ��O�j��E�����^�o�B1spD�ǝ�Jkܘ�����|Z�c���}��b_Z�����]�l������ ��      o   M  x�eR[j1�^�B'��$��H)�?ꮒ�@�S�8=K/V��Ь=��Hg�N��!b�I�!	�N��G���1vn�`߰�jnh���Z�	�(B6��0bh1+����ZSP��U��Ɇ1e��+���ES�Z,�f���ѩq����m�+}�c5C��({SS�&1���v��Aw�l��[����ԫ�n�f�9�[��S�굚x�����(8�m�M�{�hǰ�t�aT�YkL��n��c`��F)� ��m1Ɯ���ݯ)��*T,�:���
�9
��c.h-�ˤ}A���y`ɡ�c"Q%���h���{2�Oι/���      p   �  x���Mn�@��3�����kX�mQt�H�DhD��
*��+UԎ�"����|�f�§pȠ���2��?d1<I��\A��hx����[�$?ס�0fT� �|~��� R6���v��r~�@e+RXz��(A�P�nf2�C*���&FL�����UjL�~'p��ψ9_��ѬaogY�Z��W�P�_��<
���N[(���VZ;,ʶ�*�#��R��o�=�%�c?��{�l||�����3�U�����L�p�x'�5��Z9�b�J��͞@%��j(m�)Q	a+�ɞxĔi2�qr�v����O�%�O��	��Y�V��zS���|�r/�M�J�kJ�-�[���0܇�i�q�/�T<u2^7���-���{���      q   S  x��W�n�8}���@Ч]��X��@P8�&Y;��A�],@�m��H��������J����E����̙�s�L�X���j��FT))�nݰ����3���K�`B3t�[�T�T�2c�7����'��9u�L��s�
fpAՒ�)5tB5ü�3���=�� QAeNb��4y��Sa��d �v?.fX�%�\
�Sô�:\m#�+����ʕ�~�yo��q�>��B����aK���)�>�y뾜p	U,��
�xBѩ,x�ё���0��&�K&��r�RN7��8��&�u"w!�*����{a���C&�M��R�~-K#��H4Zk��FG�pv��%M+؅�J5���"��a��m"2Y�ۜ/9S�T�r��9Qe��	��-96?�D� �$g����mS��s�&�%\%�@�o�~���3
�+���i�i��x��Q��a�Z���Lgr�¤p��v2����SIsn��}���1-��_}��T��BɴLL��q��~]�x��dn9)W�f�<�U%�9�Z���8����ط;���>���9[3��*!h�N�m(O2�S�.J�~�D�k�gƭ>CT�(�]�D�Yy�RY)d�ԭ�;,�a�`��B(Pd�y>I�Ҫ�Y��K��0�G���CS�%�xdb9���Ò����Lp���ĶA�И��1�L�,�`	9�'�{��r&����G�����A��w��2�)��\l��꠻Q둗?�1�\g%u�å��i̎�a>\ A���)�����W����]C��GA�	��9�̶��Z�+>�k}h��8���3�I�oa(ve�Y	bR� ��Y�l���"���^��~7
���W�g�lT�l�}��y;�{Zdn2ܧ��ʢ.���/fm/��1��N�����^꥽(Bv��Ο�sn��26��G|��5��@0.@��$�R��J�L���? ��7AW�
��K�$��%а�h ����Q�]0��!�\�a'hX��^������@`�;7J3{G  :
z;���g��,&vMp��T9Kh�^�W�;t�܍7�4�xa�/p�ŧ��rn�T��K��l����D��YZ�1���VZg|)U�_ʫ��a���.h�ږ�/�y��(a�0���~L��;i�2��0�^��w�� ��jt;�?���9����WWx˰�ex�n0���N�Oj����r����8�l��B5\.~�u�
�p����\
=_�	�2Q�|���:�{wi�_�N4N�����Ɠ�{��?�����ӯ�0��s��4�/VȽ�Ѻ��t<����C��r����VQs�:����n���4�Y��}s}��/i���nO���=�asE��vA��1�E��Ċ��a�蕂���oQ�P���s>l�u]�q�#��ӗ������+gX���١>l?�YCB�E8/;0�/;g`W,G�pм��2It�X�U���mߧ07�BQ1���̮3Y�ސ}��CbG�_Q�\���L9�y�B\�������qUr��c�L��\.�/�kec���E> �?3��@����$έ��&6~�����aSrN&F.J���:�����4      r   �   x�e��N�@D�ٯ��Z����E"�+q�+6��u����r(��4��'h��z#��\�W+w���E����mtl	6�L�d4��Ud9���N��x���b$a��Q�������\f�|L�G�sM@��d��@]@�'��BN7{�9g'=2x�Jdv��ݳ�2�6���O��l�������х�4/��q��5�ki      s      x������ � �      t   S   x�p�
�I�.I,���S0Fᙠ�L�"��+�� ��T#8�(3U!��/3�$5/%_!<3�����g�$gp��qqq 8�(�      u   <  x��UK�9]w�B|�� ?`&h��ʆUf�Tb�T2��&�b0G���(U�rW��.��{���<qto2�ot'#8�TlO��G9��`��ݓ$��ٻ�2E��zd���i��t1ߦ�ؑʍz�Q��M�7���A����9�<�Qn��K��ۀחdn�lHKht��>����k�S��$*��##�ce��������
����h�5�!G����̎Jwȸ�6��}�^��,'��?.�5W�Ж�gt�rrr_��+*D�)'��D��!Qm|r�0L���]��b��>��߇Y<�A��������/p��۴Δ����= _��nE�V�_�~�Rq�fB������ �>f\���q$��^'��3�6�|��e��[ʹZ��{/�p�9�#�˵-h�Q�w��/�[=�p���t�G�0M��%垆I+�6]����ڭ�.?A���r�0ݬ(b�MƮ{�sQA�kRMw益U�\��4l�������0-�8����l�l�`a��M�Z�"n�4�u� �>�!6]4S(���>ـ�֏҃W�Aݽ�9��Mv9��#��2nI�u�/�� aڽ��Ƚֱ��rBqTLt)7�Z��z����u�ܢTj�����Fm����?�z��`d��l5t���TC1@�0��c��6��.��o\��_�_�^�MӇ����)�Us�� ϊ���������E��#�6 S�q�������o���G�'3�v�Q_I[���^ap�A���zU^2��/�V�(T��wzr�х?����s.7/f��,�3ْ��Tt�}�u]�E      v   �  x���_r�@Ɵ�S��C!I)	Ӈ�(k��x����d��� }��\�ۡ	6�$�z�>}���D�`��e��%��H��	)PY��)�!+�,��%��H������x����"�%��I���}��	E��4����[���x>ԡ��
�H����_ȝJ�@����%�𑓸u2k�a��[Q1�L��RG���/���t�b����S� �PؽX6�w����T褵��栳������,Z��gZyݰ�����K��u�A�(����x�&b`�I?�*�L�pUΤf�a|�糫x�}�ѳ8���M(mѻ{ݡ>j�%#�R��.�V�k�9h�CHc���:۰�IAkD��}2��Ҵ�˃��+U�A��B�M}Ke�KO�����bM0ƒ.ʻ����?�/Wi��-��"�~�?S&�����f��}��)���=,       w      x������ � �      x      x������ � �      y      x������ � �      z   �   x�e��N�@г���Z	�+��VB-G.Kv�X	k���דH�z��g�6ct~���S�a���K�>I��V5�r;�wQ���i�G�L�]͙�f�q�i ���Z�P~�L��ai�Ϗp�&�Q�v{�1�{�:���yY�Wh�"�鞖{�|�b���*"f�����O�!�*�7EQ�F�[�      {   ?   x�3�4ճ��t��I\F�� �������\�e�ih�, a.NN���T0����� �	      |   ]   x�U��� �d��Pv��sԨRQ���y�ޒ�pMIf���{�f�
� ��cZ�e���݃�=���w�b��Z����S�N����^�e"�      }     x����n� @��	��&oݴ��*M$AU��T�������d�:��/��{�t8�v�X�g�-rxJ�𘒀#5��o(��m�VRp"D
ª�u������Ri������^�%؋��q�;j[������P��%��%	���֍���v����.���Ӳ��G�S���Bʨ�R�J�k��\�p�+���5�[��g�rD����p�����.��'o�xĩ�wH��T�SWp<��?8��t����=���> �9�y      ~   U  x�5QAn1<K���'n�i��r�W�W�i��~N�P�	�X(=HЈ�����a�/as���|��aK�RQaז9>ʄ̰��S��L?�M��FS�J�$qGKi^�H�C�8�$>�A"X�`�8���'�3<a;�ńC�a�#)Tŕ�)�;�iAx�D�p��q�}u7�+}>��Mjt��_��:��fU��C�!e�j��k���G锍����[�K�9|�|:g��z�7:~DA(x̾_��%��I�|o�"��ㆫ��l�.���m.hխJԣ�&b�δf�Τ�6��V�a���f>ﱊv,g���5s���>��O�����O1�w�O��     