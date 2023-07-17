PGDMP     2                     {         
   Backup.1.4    15.3    15.3 �    x           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            y           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            z           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            {           1262    25811 
   Backup.1.4    DATABASE     �   CREATE DATABASE "Backup.1.4" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
    DROP DATABASE "Backup.1.4";
                postgres    false                       1255    25813 
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
       public          postgres    false                       1255    25814    ganancia_perdida()    FUNCTION     �   CREATE FUNCTION public.ganancia_perdida() RETURNS trigger
    LANGUAGE plpgsql
    AS $$begin

if new."Ganancia" < new."Coste" then
	raise exception 'Las perdidas de la pelicula son mayores a sus ganancias';
end if;
return new;
end;
$$;
 )   DROP FUNCTION public.ganancia_perdida();
       public          postgres    false                       1255    25815    genero()    FUNCTION     4  CREATE FUNCTION public.genero() RETURNS trigger
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
       public          postgres    false                       1255    25816    numcalificacion()    FUNCTION       CREATE FUNCTION public.numcalificacion() RETURNS trigger
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
       public          postgres    false                       1255    25817 	   numperf()    FUNCTION     3  CREATE FUNCTION public.numperf() RETURNS trigger
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
       public          postgres    false                       1255    25818    numrating()    FUNCTION     �   CREATE FUNCTION public.numrating() RETURNS trigger
    LANGUAGE plpgsql
    AS $$BEGIN

IF new."Rating" < 1 OR new."Rating" > 5 THEN
	RAISE EXCEPTION 'El rating debe ser un numero entre 1 y 5';
END IF;

RETURN NEW;
END;
$$;
 "   DROP FUNCTION public.numrating();
       public          postgres    false                       1255    25819    numusuarios()    FUNCTION     Y  CREATE FUNCTION public.numusuarios() RETURNS trigger
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
       public          postgres    false            	           1255    25820    rolpersonaje()    FUNCTION     6  CREATE FUNCTION public.rolpersonaje() RETURNS trigger
    LANGUAGE plpgsql
    AS $$begin

if new."Rol" != 'Antagonista' AND new."Rol" != 'Protagonista' AND new."Rol" != 'Secundario' then
	raise exception 'Un personaje solo puede ser "Protagonista", "Antagonista" o "Secundario"';
end if;
return new;
end;
$$;
 %   DROP FUNCTION public.rolpersonaje();
       public          postgres    false            
           1255    25821    tipoactor()    FUNCTION       CREATE FUNCTION public.tipoactor() RETURNS trigger
    LANGUAGE plpgsql
    AS $$begin

if new."Tipo_Actor" != 'Interpretado' AND new."Tipo_Actor" != 'Presta su voz' then
	raise exception 'Un actor solo puede Interpretar un personaje o Prestar su Voz';
end if;
return new;
end;
$$;
 "   DROP FUNCTION public.tipoactor();
       public          postgres    false                       1255    25822    tiposuscripciones()    FUNCTION     �  CREATE FUNCTION public.tiposuscripciones() RETURNS trigger
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
       public          postgres    false            �            1259    25823    Aparece    TABLE     '  CREATE TABLE public."Aparece" (
    "N_Organizacion" text NOT NULL,
    "N_Titulo" text NOT NULL,
    "Estado" text NOT NULL,
    "Rol" text NOT NULL,
    CONSTRAINT "Aparece_Rol_check" CHECK ((("Rol" = 'Antagonista'::text) OR ("Rol" = 'Protagonista'::text) OR ("Rol" = 'Secundario'::text)))
);
    DROP TABLE public."Aparece";
       public         heap    postgres    false            �            1259    25829    Cargo    TABLE     c   CREATE TABLE public."Cargo" (
    "Cod_Cargo" integer NOT NULL,
    "Descripcion" text NOT NULL
);
    DROP TABLE public."Cargo";
       public         heap    postgres    false            �            1259    25834    Cargo_Cod_Cargo_seq    SEQUENCE     �   CREATE SEQUENCE public."Cargo_Cod_Cargo_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public."Cargo_Cod_Cargo_seq";
       public          postgres    false    215            |           0    0    Cargo_Cod_Cargo_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public."Cargo_Cod_Cargo_seq" OWNED BY public."Cargo"."Cod_Cargo";
          public          postgres    false    216            �            1259    25835    Ciudad    TABLE     �   CREATE TABLE public."Ciudad" (
    "Id_Ciudad" integer NOT NULL,
    "Nombre" text NOT NULL,
    "Id_Estado" integer NOT NULL
);
    DROP TABLE public."Ciudad";
       public         heap    postgres    false            �            1259    25840    Ciudad_Id_Ciudad_seq    SEQUENCE     �   CREATE SEQUENCE public."Ciudad_Id_Ciudad_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public."Ciudad_Id_Ciudad_seq";
       public          postgres    false    217            }           0    0    Ciudad_Id_Ciudad_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public."Ciudad_Id_Ciudad_seq" OWNED BY public."Ciudad"."Id_Ciudad";
          public          postgres    false    218            �            1259    25841    Civil    TABLE     =   CREATE TABLE public."Civil" (
    "N_Civil" text NOT NULL
);
    DROP TABLE public."Civil";
       public         heap    postgres    false            �            1259    25846    Combate    TABLE     �   CREATE TABLE public."Combate" (
    "N_Personaje" text NOT NULL,
    "N_Poder" text NOT NULL,
    "N_Objeto" text DEFAULT 'No Objeto'::text NOT NULL,
    "Fecha" date NOT NULL,
    "Lugar" text NOT NULL
);
    DROP TABLE public."Combate";
       public         heap    postgres    false            �            1259    25852    Crea    TABLE     ^   CREATE TABLE public."Crea" (
    "N_Personaje" text NOT NULL,
    "N_Objeto" text NOT NULL
);
    DROP TABLE public."Crea";
       public         heap    postgres    false            �            1259    25857    Creador    TABLE     C   CREATE TABLE public."Creador" (
    "Nom_Creador" text NOT NULL
);
    DROP TABLE public."Creador";
       public         heap    postgres    false            �            1259    25862    Enfrenta    TABLE     _   CREATE TABLE public."Enfrenta" (
    "N_Heroe" text NOT NULL,
    "N_Villano" text NOT NULL
);
    DROP TABLE public."Enfrenta";
       public         heap    postgres    false            �            1259    25867    Esta    TABLE     �  CREATE TABLE public."Esta" (
    "N_Personaje" text NOT NULL,
    "N_Titulo" text NOT NULL,
    "Tipo_Actor" text NOT NULL,
    "Rol" text NOT NULL,
    "Actor" text NOT NULL,
    CONSTRAINT "Esta_Rol_check" CHECK ((("Rol" = 'Antagonista'::text) OR ("Rol" = 'Protagonista'::text) OR ("Rol" = 'Secundario'::text))),
    CONSTRAINT "Esta_Tipo_Actor_check" CHECK ((("Tipo_Actor" = 'Interpretado'::text) OR ("Tipo_Actor" = 'Presta su voz'::text)))
);
    DROP TABLE public."Esta";
       public         heap    postgres    false            �            1259    25874    Estado    TABLE        CREATE TABLE public."Estado" (
    "Id_Estado" integer NOT NULL,
    "Nombre" text NOT NULL,
    "Id_Pais" integer NOT NULL
);
    DROP TABLE public."Estado";
       public         heap    postgres    false            �            1259    25879    Estado_Id_Estado_seq    SEQUENCE     �   CREATE SEQUENCE public."Estado_Id_Estado_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public."Estado_Id_Estado_seq";
       public          postgres    false    225            ~           0    0    Estado_Id_Estado_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public."Estado_Id_Estado_seq" OWNED BY public."Estado"."Id_Estado";
          public          postgres    false    226            �            1259    25880    Heroe    TABLE     6  CREATE TABLE public."Heroe" (
    "N_Heroe" text NOT NULL,
    "Alias" text NOT NULL,
    "Logotipo" text,
    "Color_Traje" text,
    "Archienemigo" text,
    CONSTRAINT "Heroe_Color_Traje_check" CHECK ((("Color_Traje" !~~ '%0%'::text) AND ("Color_Traje" !~~ '%1%'::text) AND ("Color_Traje" !~~ '%2%'::text) AND ("Color_Traje" !~~ '%3%'::text) AND ("Color_Traje" !~~ '%4%'::text) AND ("Color_Traje" !~~ '%5%'::text) AND ("Color_Traje" !~~ '%6%'::text) AND ("Color_Traje" !~~ '%7%'::text) AND ("Color_Traje" !~~ '%8%'::text) AND ("Color_Traje" !~~ '%9%'::text)))
);
    DROP TABLE public."Heroe";
       public         heap    postgres    false            �            1259    25886 	   Historial    TABLE     �   CREATE TABLE public."Historial" (
    "Id_Perfil" integer NOT NULL,
    "N_Titulo" text NOT NULL,
    "Id_Hist" integer NOT NULL,
    "Calificacion" integer,
    "Tiempo_Reproduccion" integer
);
    DROP TABLE public."Historial";
       public         heap    postgres    false            �            1259    25891    Historial_Id_Hist_seq    SEQUENCE     �   CREATE SEQUENCE public."Historial_Id_Hist_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public."Historial_Id_Hist_seq";
       public          postgres    false    228                       0    0    Historial_Id_Hist_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public."Historial_Id_Hist_seq" OWNED BY public."Historial"."Id_Hist";
          public          postgres    false    229            �            1259    25892    Juego    TABLE     y   CREATE TABLE public."Juego" (
    "T_Juego" text NOT NULL,
    "Distribuidor" text NOT NULL,
    "Tipo" text NOT NULL
);
    DROP TABLE public."Juego";
       public         heap    postgres    false            �            1259    25897    Medio    TABLE     S  CREATE TABLE public."Medio" (
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
       public         heap    postgres    false            �            1259    25903    Nacionalidad    TABLE     @   CREATE TABLE public."Nacionalidad" (
    "Nac" text NOT NULL
);
 "   DROP TABLE public."Nacionalidad";
       public         heap    postgres    false            �            1259    25908    Objeto    TABLE     �   CREATE TABLE public."Objeto" (
    "Nombre" text NOT NULL,
    "Descripcion" text,
    "Material" text,
    "Tipo" text NOT NULL,
    "Imagen" text NOT NULL,
    "N_Personaje" text
);
    DROP TABLE public."Objeto";
       public         heap    postgres    false            �            1259    25913 	   Ocupacion    TABLE     >   CREATE TABLE public."Ocupacion" (
    "Ocup" text NOT NULL
);
    DROP TABLE public."Ocupacion";
       public         heap    postgres    false            �            1259    25918    Organizacion    TABLE       CREATE TABLE public."Organizacion" (
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
       public         heap    postgres    false            �            1259    25923    Pais    TABLE     [   CREATE TABLE public."Pais" (
    "Id_Pais" integer NOT NULL,
    "Nombre" text NOT NULL
);
    DROP TABLE public."Pais";
       public         heap    postgres    false            �            1259    25928    Pais_Id_Pais_seq    SEQUENCE     �   CREATE SEQUENCE public."Pais_Id_Pais_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public."Pais_Id_Pais_seq";
       public          postgres    false    236            �           0    0    Pais_Id_Pais_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public."Pais_Id_Pais_seq" OWNED BY public."Pais"."Id_Pais";
          public          postgres    false    237            �            1259    25929    Pelicula    TABLE     J  CREATE TABLE public."Pelicula" (
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
       public         heap    postgres    false            �            1259    25936    Perfil    TABLE       CREATE TABLE public."Perfil" (
    "Id_Perfil" integer NOT NULL,
    "Dispositivo" text NOT NULL,
    "Nombre" text NOT NULL,
    "Idioma" text NOT NULL,
    "Email" text NOT NULL,
    "Imagen" integer NOT NULL,
    CONSTRAINT "Perfil_Id_Perfil_check" CHECK (("Id_Perfil" >= 0))
);
    DROP TABLE public."Perfil";
       public         heap    postgres    false            �            1259    25942    Perfil_Id_Perfil_seq    SEQUENCE     �   CREATE SEQUENCE public."Perfil_Id_Perfil_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public."Perfil_Id_Perfil_seq";
       public          postgres    false    239            �           0    0    Perfil_Id_Perfil_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public."Perfil_Id_Perfil_seq" OWNED BY public."Perfil"."Id_Perfil";
          public          postgres    false    240            �            1259    25943    Pers_Creador    TABLE     g   CREATE TABLE public."Pers_Creador" (
    "N_Personaje" text NOT NULL,
    "N_Creador" text NOT NULL
);
 "   DROP TABLE public."Pers_Creador";
       public         heap    postgres    false            �            1259    25948    Pers_Nac    TABLE     f   CREATE TABLE public."Pers_Nac" (
    "N_Personaje" text NOT NULL,
    "Nacionalidad" text NOT NULL
);
    DROP TABLE public."Pers_Nac";
       public         heap    postgres    false            �            1259    25953    Pers_Oc    TABLE     b   CREATE TABLE public."Pers_Oc" (
    "N_Personaje" text NOT NULL,
    "Ocupacion" text NOT NULL
);
    DROP TABLE public."Pers_Oc";
       public         heap    postgres    false            �            1259    25958 	   Personaje    TABLE     O  CREATE TABLE public."Personaje" (
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
       public         heap    postgres    false            �            1259    25967 	   Pertenece    TABLE     �   CREATE TABLE public."Pertenece" (
    "N_Personaje" text NOT NULL,
    "N_Organizacion" text NOT NULL,
    "Cod_Cargo" integer NOT NULL
);
    DROP TABLE public."Pertenece";
       public         heap    postgres    false            �            1259    25972 
   Plat_Juego    TABLE     b   CREATE TABLE public."Plat_Juego" (
    "T_Juego" text NOT NULL,
    "Plataforma" text NOT NULL
);
     DROP TABLE public."Plat_Juego";
       public         heap    postgres    false            �            1259    25977 
   Plataforma    TABLE     ?   CREATE TABLE public."Plataforma" (
    nombre text NOT NULL
);
     DROP TABLE public."Plataforma";
       public         heap    postgres    false            �            1259    25982    Poder    TABLE     p   CREATE TABLE public."Poder" (
    "Nombre" text NOT NULL,
    "Imagen" text NOT NULL,
    "Descripcion" text
);
    DROP TABLE public."Poder";
       public         heap    postgres    false            �            1259    25987    Posee    TABLE       CREATE TABLE public."Posee" (
    "N_Personaje" text NOT NULL,
    "N_Poder" text NOT NULL,
    "Obtencion" text NOT NULL,
    CONSTRAINT "Posee_Obtencion_check" CHECK ((("Obtencion" = 'Natural'::text) OR ("Obtencion" = 'Artificial'::text) OR ("Obtencion" = 'Hereditario'::text)))
);
    DROP TABLE public."Posee";
       public         heap    postgres    false            �            1259    25993    RelacionadoHer    TABLE     c   CREATE TABLE public."RelacionadoHer" (
    "N_Civil" text NOT NULL,
    "N_Heroe" text NOT NULL
);
 $   DROP TABLE public."RelacionadoHer";
       public         heap    postgres    false            �            1259    25998    RelacionadoVill    TABLE     f   CREATE TABLE public."RelacionadoVill" (
    "N_Civil" text NOT NULL,
    "N_Villano" text NOT NULL
);
 %   DROP TABLE public."RelacionadoVill";
       public         heap    postgres    false            �            1259    26003    Sede    TABLE     �   CREATE TABLE public."Sede" (
    "Nombre" text NOT NULL,
    "Tipo_Edif" text,
    "Ubicacion" text NOT NULL,
    "Imagen" text NOT NULL,
    "N_Org" text NOT NULL
);
    DROP TABLE public."Sede";
       public         heap    postgres    false            �            1259    26008    Serie    TABLE     �   CREATE TABLE public."Serie" (
    "T_Serie" text NOT NULL,
    "N_Episodios" integer NOT NULL,
    "Creador" text NOT NULL,
    "Canal" text NOT NULL,
    "Tipo" text
);
    DROP TABLE public."Serie";
       public         heap    postgres    false            �            1259    26013    Suscripcion    TABLE     �  CREATE TABLE public."Suscripcion" (
    "ID" integer NOT NULL,
    "Tarifa" real NOT NULL,
    "Descripcion" text NOT NULL,
    "Tipo" text NOT NULL,
    CONSTRAINT "Suscripcion_Tarifa_check" CHECK (("Tarifa" >= (0)::double precision)),
    CONSTRAINT "Suscripcion_Tipo_check" CHECK ((("Tipo" = 'Gold'::text) OR ("Tipo" = 'Vip'::text) OR ("Tipo" = 'Premium'::text) OR ("Tipo" = 'Free'::text)))
);
 !   DROP TABLE public."Suscripcion";
       public         heap    postgres    false            �            1259    26020    Tarjeta    TABLE     F  CREATE TABLE public."Tarjeta" (
    "N_Tarjeta" text NOT NULL,
    "Cod_Seguridad" integer NOT NULL,
    "Fecha_Ven" date NOT NULL,
    CONSTRAINT "Tarjeta_Cod_Seguridad_check" CHECK ((("Cod_Seguridad" >= 100) AND ("Cod_Seguridad" <= 999))),
    CONSTRAINT "Tarjeta_N_Tarjeta_check" CHECK ((char_length("N_Tarjeta") = 16))
);
    DROP TABLE public."Tarjeta";
       public         heap    postgres    false                        1259    26027    Usuario    TABLE     �  CREATE TABLE public."Usuario" (
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
       public         heap    postgres    false                       1259    26033    Villano    TABLE     q   CREATE TABLE public."Villano" (
    "N_Villano" text NOT NULL,
    "Alias" text NOT NULL,
    "Objetivo" text
);
    DROP TABLE public."Villano";
       public         heap    postgres    false                       2604    26038    Cargo Cod_Cargo    DEFAULT     x   ALTER TABLE ONLY public."Cargo" ALTER COLUMN "Cod_Cargo" SET DEFAULT nextval('public."Cargo_Cod_Cargo_seq"'::regclass);
 B   ALTER TABLE public."Cargo" ALTER COLUMN "Cod_Cargo" DROP DEFAULT;
       public          postgres    false    216    215            	           2604    26039    Ciudad Id_Ciudad    DEFAULT     z   ALTER TABLE ONLY public."Ciudad" ALTER COLUMN "Id_Ciudad" SET DEFAULT nextval('public."Ciudad_Id_Ciudad_seq"'::regclass);
 C   ALTER TABLE public."Ciudad" ALTER COLUMN "Id_Ciudad" DROP DEFAULT;
       public          postgres    false    218    217                       2604    26040    Estado Id_Estado    DEFAULT     z   ALTER TABLE ONLY public."Estado" ALTER COLUMN "Id_Estado" SET DEFAULT nextval('public."Estado_Id_Estado_seq"'::regclass);
 C   ALTER TABLE public."Estado" ALTER COLUMN "Id_Estado" DROP DEFAULT;
       public          postgres    false    226    225                       2604    26041    Historial Id_Hist    DEFAULT     |   ALTER TABLE ONLY public."Historial" ALTER COLUMN "Id_Hist" SET DEFAULT nextval('public."Historial_Id_Hist_seq"'::regclass);
 D   ALTER TABLE public."Historial" ALTER COLUMN "Id_Hist" DROP DEFAULT;
       public          postgres    false    229    228                       2604    26042    Pais Id_Pais    DEFAULT     r   ALTER TABLE ONLY public."Pais" ALTER COLUMN "Id_Pais" SET DEFAULT nextval('public."Pais_Id_Pais_seq"'::regclass);
 ?   ALTER TABLE public."Pais" ALTER COLUMN "Id_Pais" DROP DEFAULT;
       public          postgres    false    237    236                       2604    26043    Perfil Id_Perfil    DEFAULT     z   ALTER TABLE ONLY public."Perfil" ALTER COLUMN "Id_Perfil" SET DEFAULT nextval('public."Perfil_Id_Perfil_seq"'::regclass);
 C   ALTER TABLE public."Perfil" ALTER COLUMN "Id_Perfil" DROP DEFAULT;
       public          postgres    false    240    239            J          0    25823    Aparece 
   TABLE DATA           R   COPY public."Aparece" ("N_Organizacion", "N_Titulo", "Estado", "Rol") FROM stdin;
    public          postgres    false    214   �)      K          0    25829    Cargo 
   TABLE DATA           =   COPY public."Cargo" ("Cod_Cargo", "Descripcion") FROM stdin;
    public          postgres    false    215   �*      M          0    25835    Ciudad 
   TABLE DATA           F   COPY public."Ciudad" ("Id_Ciudad", "Nombre", "Id_Estado") FROM stdin;
    public          postgres    false    217   +      O          0    25841    Civil 
   TABLE DATA           ,   COPY public."Civil" ("N_Civil") FROM stdin;
    public          postgres    false    219   n+      P          0    25846    Combate 
   TABLE DATA           [   COPY public."Combate" ("N_Personaje", "N_Poder", "N_Objeto", "Fecha", "Lugar") FROM stdin;
    public          postgres    false    220   �+      Q          0    25852    Crea 
   TABLE DATA           ;   COPY public."Crea" ("N_Personaje", "N_Objeto") FROM stdin;
    public          postgres    false    221   �-      R          0    25857    Creador 
   TABLE DATA           2   COPY public."Creador" ("Nom_Creador") FROM stdin;
    public          postgres    false    222   .      S          0    25862    Enfrenta 
   TABLE DATA           <   COPY public."Enfrenta" ("N_Heroe", "N_Villano") FROM stdin;
    public          postgres    false    223   �.      T          0    25867    Esta 
   TABLE DATA           Y   COPY public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") FROM stdin;
    public          postgres    false    224   �/      U          0    25874    Estado 
   TABLE DATA           D   COPY public."Estado" ("Id_Estado", "Nombre", "Id_Pais") FROM stdin;
    public          postgres    false    225   �6      W          0    25880    Heroe 
   TABLE DATA           `   COPY public."Heroe" ("N_Heroe", "Alias", "Logotipo", "Color_Traje", "Archienemigo") FROM stdin;
    public          postgres    false    227   �6      X          0    25886 	   Historial 
   TABLE DATA           p   COPY public."Historial" ("Id_Perfil", "N_Titulo", "Id_Hist", "Calificacion", "Tiempo_Reproduccion") FROM stdin;
    public          postgres    false    228   `9      Z          0    25892    Juego 
   TABLE DATA           D   COPY public."Juego" ("T_Juego", "Distribuidor", "Tipo") FROM stdin;
    public          postgres    false    230   �<      [          0    25897    Medio 
   TABLE DATA           �   COPY public."Medio" ("Titulo", "Fecha_Estreno", "Compania", "Rating", "Sinopsis", "Imagen", "Duracion", "Suscripcion") FROM stdin;
    public          postgres    false    231   U=      \          0    25903    Nacionalidad 
   TABLE DATA           /   COPY public."Nacionalidad" ("Nac") FROM stdin;
    public          postgres    false    232   �K      ]          0    25908    Objeto 
   TABLE DATA           h   COPY public."Objeto" ("Nombre", "Descripcion", "Material", "Tipo", "Imagen", "N_Personaje") FROM stdin;
    public          postgres    false    233   LL      ^          0    25913 	   Ocupacion 
   TABLE DATA           -   COPY public."Ocupacion" ("Ocup") FROM stdin;
    public          postgres    false    234   N      _          0    25918    Organizacion 
   TABLE DATA           �   COPY public."Organizacion" ("Nombre", "Eslogan", "Lider", "Fundador", "Tipo", "Nom_Comic", "Imagen", "Objetivo", "Lugar_Creacion") FROM stdin;
    public          postgres    false    235   �N      `          0    25923    Pais 
   TABLE DATA           5   COPY public."Pais" ("Id_Pais", "Nombre") FROM stdin;
    public          postgres    false    236   Q      b          0    25929    Pelicula 
   TABLE DATA           k   COPY public."Pelicula" ("T_Pelicula", "Director", "Coste", "Ganancia", "Distribuidor", "Tipo") FROM stdin;
    public          postgres    false    238   OQ      c          0    25936    Perfil 
   TABLE DATA           e   COPY public."Perfil" ("Id_Perfil", "Dispositivo", "Nombre", "Idioma", "Email", "Imagen") FROM stdin;
    public          postgres    false    239   T      e          0    25943    Pers_Creador 
   TABLE DATA           D   COPY public."Pers_Creador" ("N_Personaje", "N_Creador") FROM stdin;
    public          postgres    false    241   �T      f          0    25948    Pers_Nac 
   TABLE DATA           C   COPY public."Pers_Nac" ("N_Personaje", "Nacionalidad") FROM stdin;
    public          postgres    false    242   �V      g          0    25953    Pers_Oc 
   TABLE DATA           ?   COPY public."Pers_Oc" ("N_Personaje", "Ocupacion") FROM stdin;
    public          postgres    false    243   }X      h          0    25958 	   Personaje 
   TABLE DATA           w   COPY public."Personaje" ("Nombre", "Genero", "Color_Ojos", "Color_Pelo", "Nom_Comic", "E_Marital", imagen) FROM stdin;
    public          postgres    false    244   DZ      i          0    25967 	   Pertenece 
   TABLE DATA           S   COPY public."Pertenece" ("N_Personaje", "N_Organizacion", "Cod_Cargo") FROM stdin;
    public          postgres    false    245   y^      j          0    25972 
   Plat_Juego 
   TABLE DATA           ?   COPY public."Plat_Juego" ("T_Juego", "Plataforma") FROM stdin;
    public          postgres    false    246   �_      k          0    25977 
   Plataforma 
   TABLE DATA           .   COPY public."Plataforma" (nombre) FROM stdin;
    public          postgres    false    247   I`      l          0    25982    Poder 
   TABLE DATA           D   COPY public."Poder" ("Nombre", "Imagen", "Descripcion") FROM stdin;
    public          postgres    false    248   �`      m          0    25987    Posee 
   TABLE DATA           H   COPY public."Posee" ("N_Personaje", "N_Poder", "Obtencion") FROM stdin;
    public          postgres    false    249   �c      n          0    25993    RelacionadoHer 
   TABLE DATA           @   COPY public."RelacionadoHer" ("N_Civil", "N_Heroe") FROM stdin;
    public          postgres    false    250   �e      o          0    25998    RelacionadoVill 
   TABLE DATA           C   COPY public."RelacionadoVill" ("N_Civil", "N_Villano") FROM stdin;
    public          postgres    false    251   f      p          0    26003    Sede 
   TABLE DATA           W   COPY public."Sede" ("Nombre", "Tipo_Edif", "Ubicacion", "Imagen", "N_Org") FROM stdin;
    public          postgres    false    252   %f      q          0    26008    Serie 
   TABLE DATA           W   COPY public."Serie" ("T_Serie", "N_Episodios", "Creador", "Canal", "Tipo") FROM stdin;
    public          postgres    false    253   9g      r          0    26013    Suscripcion 
   TABLE DATA           N   COPY public."Suscripcion" ("ID", "Tarifa", "Descripcion", "Tipo") FROM stdin;
    public          postgres    false    254   Hh      s          0    26020    Tarjeta 
   TABLE DATA           N   COPY public."Tarjeta" ("N_Tarjeta", "Cod_Seguridad", "Fecha_Ven") FROM stdin;
    public          postgres    false    255   �h      t          0    26027    Usuario 
   TABLE DATA           �   COPY public."Usuario" ("Email", "Contrasena", "Nombre", "Apellido", "Fecha_Nac", "Fecha_Creacion", "Id_Suscripcion", "N_Tarjeta", "Direccion") FROM stdin;
    public          postgres    false    256   &i      u          0    26033    Villano 
   TABLE DATA           E   COPY public."Villano" ("N_Villano", "Alias", "Objetivo") FROM stdin;
    public          postgres    false    257   Wj      �           0    0    Cargo_Cod_Cargo_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public."Cargo_Cod_Cargo_seq"', 1, false);
          public          postgres    false    216            �           0    0    Ciudad_Id_Ciudad_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public."Ciudad_Id_Ciudad_seq"', 4, true);
          public          postgres    false    218            �           0    0    Estado_Id_Estado_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public."Estado_Id_Estado_seq"', 3, true);
          public          postgres    false    226            �           0    0    Historial_Id_Hist_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public."Historial_Id_Hist_seq"', 97, true);
          public          postgres    false    229            �           0    0    Pais_Id_Pais_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public."Pais_Id_Pais_seq"', 2, true);
          public          postgres    false    237            �           0    0    Perfil_Id_Perfil_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public."Perfil_Id_Perfil_seq"', 10, true);
          public          postgres    false    240            $           2606    26045    Aparece Aparece_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public."Aparece"
    ADD CONSTRAINT "Aparece_pkey" PRIMARY KEY ("N_Organizacion", "N_Titulo");
 B   ALTER TABLE ONLY public."Aparece" DROP CONSTRAINT "Aparece_pkey";
       public            postgres    false    214    214            &           2606    26047    Cargo Cargo_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public."Cargo"
    ADD CONSTRAINT "Cargo_pkey" PRIMARY KEY ("Cod_Cargo");
 >   ALTER TABLE ONLY public."Cargo" DROP CONSTRAINT "Cargo_pkey";
       public            postgres    false    215            (           2606    26049    Ciudad Ciudad_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public."Ciudad"
    ADD CONSTRAINT "Ciudad_pkey" PRIMARY KEY ("Id_Ciudad");
 @   ALTER TABLE ONLY public."Ciudad" DROP CONSTRAINT "Ciudad_pkey";
       public            postgres    false    217            *           2606    26051    Civil Civil_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public."Civil"
    ADD CONSTRAINT "Civil_pkey" PRIMARY KEY ("N_Civil");
 >   ALTER TABLE ONLY public."Civil" DROP CONSTRAINT "Civil_pkey";
       public            postgres    false    219            ,           2606    26053    Combate Combate_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public."Combate"
    ADD CONSTRAINT "Combate_pkey" PRIMARY KEY ("N_Personaje", "N_Poder", "N_Objeto", "Fecha");
 B   ALTER TABLE ONLY public."Combate" DROP CONSTRAINT "Combate_pkey";
       public            postgres    false    220    220    220    220            .           2606    26055    Crea Crea_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY public."Crea"
    ADD CONSTRAINT "Crea_pkey" PRIMARY KEY ("N_Personaje", "N_Objeto");
 <   ALTER TABLE ONLY public."Crea" DROP CONSTRAINT "Crea_pkey";
       public            postgres    false    221    221            0           2606    26057    Creador Creador_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public."Creador"
    ADD CONSTRAINT "Creador_pkey" PRIMARY KEY ("Nom_Creador");
 B   ALTER TABLE ONLY public."Creador" DROP CONSTRAINT "Creador_pkey";
       public            postgres    false    222            2           2606    26059    Enfrenta Enfrenta_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public."Enfrenta"
    ADD CONSTRAINT "Enfrenta_pkey" PRIMARY KEY ("N_Heroe", "N_Villano");
 D   ALTER TABLE ONLY public."Enfrenta" DROP CONSTRAINT "Enfrenta_pkey";
       public            postgres    false    223    223            4           2606    26061    Esta Esta_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY public."Esta"
    ADD CONSTRAINT "Esta_pkey" PRIMARY KEY ("N_Personaje", "N_Titulo");
 <   ALTER TABLE ONLY public."Esta" DROP CONSTRAINT "Esta_pkey";
       public            postgres    false    224    224            6           2606    26063    Estado Estado_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public."Estado"
    ADD CONSTRAINT "Estado_pkey" PRIMARY KEY ("Id_Estado");
 @   ALTER TABLE ONLY public."Estado" DROP CONSTRAINT "Estado_pkey";
       public            postgres    false    225            8           2606    26065    Heroe Heroe_Alias_key 
   CONSTRAINT     W   ALTER TABLE ONLY public."Heroe"
    ADD CONSTRAINT "Heroe_Alias_key" UNIQUE ("Alias");
 C   ALTER TABLE ONLY public."Heroe" DROP CONSTRAINT "Heroe_Alias_key";
       public            postgres    false    227            :           2606    26069    Heroe Heroe_N_Heroe_key 
   CONSTRAINT     [   ALTER TABLE ONLY public."Heroe"
    ADD CONSTRAINT "Heroe_N_Heroe_key" UNIQUE ("N_Heroe");
 E   ALTER TABLE ONLY public."Heroe" DROP CONSTRAINT "Heroe_N_Heroe_key";
       public            postgres    false    227            <           2606    26071    Historial Historial_PK 
   CONSTRAINT     x   ALTER TABLE ONLY public."Historial"
    ADD CONSTRAINT "Historial_PK" PRIMARY KEY ("Id_Perfil", "N_Titulo", "Id_Hist");
 D   ALTER TABLE ONLY public."Historial" DROP CONSTRAINT "Historial_PK";
       public            postgres    false    228    228    228            >           2606    26073    Juego Juego_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public."Juego"
    ADD CONSTRAINT "Juego_pkey" PRIMARY KEY ("T_Juego");
 >   ALTER TABLE ONLY public."Juego" DROP CONSTRAINT "Juego_pkey";
       public            postgres    false    230            @           2606    26075    Medio Medio_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public."Medio"
    ADD CONSTRAINT "Medio_pkey" PRIMARY KEY ("Titulo");
 >   ALTER TABLE ONLY public."Medio" DROP CONSTRAINT "Medio_pkey";
       public            postgres    false    231            B           2606    26077    Nacionalidad Nacionalidad_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public."Nacionalidad"
    ADD CONSTRAINT "Nacionalidad_pkey" PRIMARY KEY ("Nac");
 L   ALTER TABLE ONLY public."Nacionalidad" DROP CONSTRAINT "Nacionalidad_pkey";
       public            postgres    false    232            D           2606    26079    Objeto Objeto_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public."Objeto"
    ADD CONSTRAINT "Objeto_pkey" PRIMARY KEY ("Nombre");
 @   ALTER TABLE ONLY public."Objeto" DROP CONSTRAINT "Objeto_pkey";
       public            postgres    false    233            F           2606    26081    Ocupacion Ocupacion_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public."Ocupacion"
    ADD CONSTRAINT "Ocupacion_pkey" PRIMARY KEY ("Ocup");
 F   ALTER TABLE ONLY public."Ocupacion" DROP CONSTRAINT "Ocupacion_pkey";
       public            postgres    false    234            H           2606    26083 &   Organizacion Organizacion_Fundador_key 
   CONSTRAINT     k   ALTER TABLE ONLY public."Organizacion"
    ADD CONSTRAINT "Organizacion_Fundador_key" UNIQUE ("Fundador");
 T   ALTER TABLE ONLY public."Organizacion" DROP CONSTRAINT "Organizacion_Fundador_key";
       public            postgres    false    235            J           2606    26085 #   Organizacion Organizacion_Lider_key 
   CONSTRAINT     e   ALTER TABLE ONLY public."Organizacion"
    ADD CONSTRAINT "Organizacion_Lider_key" UNIQUE ("Lider");
 Q   ALTER TABLE ONLY public."Organizacion" DROP CONSTRAINT "Organizacion_Lider_key";
       public            postgres    false    235            L           2606    26087    Organizacion Organizacion_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public."Organizacion"
    ADD CONSTRAINT "Organizacion_pkey" PRIMARY KEY ("Nombre");
 L   ALTER TABLE ONLY public."Organizacion" DROP CONSTRAINT "Organizacion_pkey";
       public            postgres    false    235            N           2606    26089    Pais Pais_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public."Pais"
    ADD CONSTRAINT "Pais_pkey" PRIMARY KEY ("Id_Pais");
 <   ALTER TABLE ONLY public."Pais" DROP CONSTRAINT "Pais_pkey";
       public            postgres    false    236                       2606    26090    Pelicula Pelicula_Tipo_check    CHECK CONSTRAINT     �   ALTER TABLE public."Pelicula"
    ADD CONSTRAINT "Pelicula_Tipo_check" CHECK ((("Tipo" = 'Animacion'::text) OR ("Tipo" = 'Live Action'::text))) NOT VALID;
 E   ALTER TABLE public."Pelicula" DROP CONSTRAINT "Pelicula_Tipo_check";
       public          postgres    false    238    238            P           2606    26092    Pelicula Pelicula_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public."Pelicula"
    ADD CONSTRAINT "Pelicula_pkey" PRIMARY KEY ("T_Pelicula");
 D   ALTER TABLE ONLY public."Pelicula" DROP CONSTRAINT "Pelicula_pkey";
       public            postgres    false    238            R           2606    26094    Perfil Perfil_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public."Perfil"
    ADD CONSTRAINT "Perfil_pkey" PRIMARY KEY ("Id_Perfil");
 @   ALTER TABLE ONLY public."Perfil" DROP CONSTRAINT "Perfil_pkey";
       public            postgres    false    239            T           2606    26096    Pers_Creador Pers_Creador_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public."Pers_Creador"
    ADD CONSTRAINT "Pers_Creador_pkey" PRIMARY KEY ("N_Personaje", "N_Creador");
 L   ALTER TABLE ONLY public."Pers_Creador" DROP CONSTRAINT "Pers_Creador_pkey";
       public            postgres    false    241    241            V           2606    26098    Pers_Nac Pers_Nac_pkey 
   CONSTRAINT     s   ALTER TABLE ONLY public."Pers_Nac"
    ADD CONSTRAINT "Pers_Nac_pkey" PRIMARY KEY ("N_Personaje", "Nacionalidad");
 D   ALTER TABLE ONLY public."Pers_Nac" DROP CONSTRAINT "Pers_Nac_pkey";
       public            postgres    false    242    242            X           2606    26100    Pers_Oc Pers_Oc_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public."Pers_Oc"
    ADD CONSTRAINT "Pers_Oc_pkey" PRIMARY KEY ("N_Personaje", "Ocupacion");
 B   ALTER TABLE ONLY public."Pers_Oc" DROP CONSTRAINT "Pers_Oc_pkey";
       public            postgres    false    243    243            Z           2606    26102    Personaje Personaje_Nombre_key 
   CONSTRAINT     a   ALTER TABLE ONLY public."Personaje"
    ADD CONSTRAINT "Personaje_Nombre_key" UNIQUE ("Nombre");
 L   ALTER TABLE ONLY public."Personaje" DROP CONSTRAINT "Personaje_Nombre_key";
       public            postgres    false    244            \           2606    26104    Personaje Personaje_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public."Personaje"
    ADD CONSTRAINT "Personaje_pkey" PRIMARY KEY ("Nombre");
 F   ALTER TABLE ONLY public."Personaje" DROP CONSTRAINT "Personaje_pkey";
       public            postgres    false    244            ^           2606    26106    Pertenece Pertenece_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public."Pertenece"
    ADD CONSTRAINT "Pertenece_pkey" PRIMARY KEY ("N_Personaje", "N_Organizacion", "Cod_Cargo");
 F   ALTER TABLE ONLY public."Pertenece" DROP CONSTRAINT "Pertenece_pkey";
       public            postgres    false    245    245    245            `           2606    26108    Plat_Juego Plat_Juego_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY public."Plat_Juego"
    ADD CONSTRAINT "Plat_Juego_pkey" PRIMARY KEY ("T_Juego", "Plataforma");
 H   ALTER TABLE ONLY public."Plat_Juego" DROP CONSTRAINT "Plat_Juego_pkey";
       public            postgres    false    246    246            b           2606    26110    Plataforma Plataforma_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public."Plataforma"
    ADD CONSTRAINT "Plataforma_pkey" PRIMARY KEY (nombre);
 H   ALTER TABLE ONLY public."Plataforma" DROP CONSTRAINT "Plataforma_pkey";
       public            postgres    false    247            d           2606    26112    Poder Poder_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public."Poder"
    ADD CONSTRAINT "Poder_pkey" PRIMARY KEY ("Nombre");
 >   ALTER TABLE ONLY public."Poder" DROP CONSTRAINT "Poder_pkey";
       public            postgres    false    248            f           2606    26114    Posee Posee_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public."Posee"
    ADD CONSTRAINT "Posee_pkey" PRIMARY KEY ("N_Personaje", "N_Poder");
 >   ALTER TABLE ONLY public."Posee" DROP CONSTRAINT "Posee_pkey";
       public            postgres    false    249    249            h           2606    26116 "   RelacionadoHer RelacionadoHer_pkey 
   CONSTRAINT     v   ALTER TABLE ONLY public."RelacionadoHer"
    ADD CONSTRAINT "RelacionadoHer_pkey" PRIMARY KEY ("N_Civil", "N_Heroe");
 P   ALTER TABLE ONLY public."RelacionadoHer" DROP CONSTRAINT "RelacionadoHer_pkey";
       public            postgres    false    250    250            j           2606    26118 $   RelacionadoVill RelacionadoVill_pkey 
   CONSTRAINT     z   ALTER TABLE ONLY public."RelacionadoVill"
    ADD CONSTRAINT "RelacionadoVill_pkey" PRIMARY KEY ("N_Civil", "N_Villano");
 R   ALTER TABLE ONLY public."RelacionadoVill" DROP CONSTRAINT "RelacionadoVill_pkey";
       public            postgres    false    251    251            l           2606    26120    Sede Sede_Imagen_key 
   CONSTRAINT     W   ALTER TABLE ONLY public."Sede"
    ADD CONSTRAINT "Sede_Imagen_key" UNIQUE ("Imagen");
 B   ALTER TABLE ONLY public."Sede" DROP CONSTRAINT "Sede_Imagen_key";
       public            postgres    false    252            n           2606    26122    Sede Sede_Nombre_key 
   CONSTRAINT     W   ALTER TABLE ONLY public."Sede"
    ADD CONSTRAINT "Sede_Nombre_key" UNIQUE ("Nombre");
 B   ALTER TABLE ONLY public."Sede" DROP CONSTRAINT "Sede_Nombre_key";
       public            postgres    false    252            p           2606    26124    Sede Sede_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public."Sede"
    ADD CONSTRAINT "Sede_pkey" PRIMARY KEY ("Nombre", "N_Org");
 <   ALTER TABLE ONLY public."Sede" DROP CONSTRAINT "Sede_pkey";
       public            postgres    false    252    252                       2606    26125    Serie Serie_Tipo_check    CHECK CONSTRAINT     �   ALTER TABLE public."Serie"
    ADD CONSTRAINT "Serie_Tipo_check" CHECK ((("Tipo" = 'Animacion'::text) OR ("Tipo" = 'Live Action'::text))) NOT VALID;
 ?   ALTER TABLE public."Serie" DROP CONSTRAINT "Serie_Tipo_check";
       public          postgres    false    253    253            r           2606    26127    Serie Serie_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public."Serie"
    ADD CONSTRAINT "Serie_pkey" PRIMARY KEY ("T_Serie");
 >   ALTER TABLE ONLY public."Serie" DROP CONSTRAINT "Serie_pkey";
       public            postgres    false    253            t           2606    26129     Suscripcion Suscripcion_Tipo_key 
   CONSTRAINT     a   ALTER TABLE ONLY public."Suscripcion"
    ADD CONSTRAINT "Suscripcion_Tipo_key" UNIQUE ("Tipo");
 N   ALTER TABLE ONLY public."Suscripcion" DROP CONSTRAINT "Suscripcion_Tipo_key";
       public            postgres    false    254            v           2606    26131    Suscripcion Suscripcion_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public."Suscripcion"
    ADD CONSTRAINT "Suscripcion_pkey" PRIMARY KEY ("ID");
 J   ALTER TABLE ONLY public."Suscripcion" DROP CONSTRAINT "Suscripcion_pkey";
       public            postgres    false    254            x           2606    26133    Tarjeta Tarjeta_N_Tarjeta_key 
   CONSTRAINT     c   ALTER TABLE ONLY public."Tarjeta"
    ADD CONSTRAINT "Tarjeta_N_Tarjeta_key" UNIQUE ("N_Tarjeta");
 K   ALTER TABLE ONLY public."Tarjeta" DROP CONSTRAINT "Tarjeta_N_Tarjeta_key";
       public            postgres    false    255            z           2606    26135    Tarjeta Tarjeta_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public."Tarjeta"
    ADD CONSTRAINT "Tarjeta_pkey" PRIMARY KEY ("N_Tarjeta");
 B   ALTER TABLE ONLY public."Tarjeta" DROP CONSTRAINT "Tarjeta_pkey";
       public            postgres    false    255            |           2606    26137    Usuario Usuario_Apellido_key 
   CONSTRAINT     a   ALTER TABLE ONLY public."Usuario"
    ADD CONSTRAINT "Usuario_Apellido_key" UNIQUE ("Apellido");
 J   ALTER TABLE ONLY public."Usuario" DROP CONSTRAINT "Usuario_Apellido_key";
       public            postgres    false    256            ~           2606    26139    Usuario Usuario_Nombre_key 
   CONSTRAINT     ]   ALTER TABLE ONLY public."Usuario"
    ADD CONSTRAINT "Usuario_Nombre_key" UNIQUE ("Nombre");
 H   ALTER TABLE ONLY public."Usuario" DROP CONSTRAINT "Usuario_Nombre_key";
       public            postgres    false    256            �           2606    26141    Usuario Usuario_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public."Usuario"
    ADD CONSTRAINT "Usuario_pkey" PRIMARY KEY ("Email");
 B   ALTER TABLE ONLY public."Usuario" DROP CONSTRAINT "Usuario_pkey";
       public            postgres    false    256            �           2606    26143    Villano Villano_Alias_key 
   CONSTRAINT     [   ALTER TABLE ONLY public."Villano"
    ADD CONSTRAINT "Villano_Alias_key" UNIQUE ("Alias");
 G   ALTER TABLE ONLY public."Villano" DROP CONSTRAINT "Villano_Alias_key";
       public            postgres    false    257            �           2606    26145    Villano Villano_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public."Villano"
    ADD CONSTRAINT "Villano_pkey" PRIMARY KEY ("N_Villano");
 B   ALTER TABLE ONLY public."Villano" DROP CONSTRAINT "Villano_pkey";
       public            postgres    false    257            �           2620    26147    Personaje emarital_trigger    TRIGGER        CREATE TRIGGER emarital_trigger BEFORE INSERT OR UPDATE ON public."Personaje" FOR EACH ROW EXECUTE FUNCTION public.emarital();
 5   DROP TRIGGER emarital_trigger ON public."Personaje";
       public          postgres    false    244    258            �           2620    26148 !   Pelicula ganancia_perdida_trigger    TRIGGER     �   CREATE TRIGGER ganancia_perdida_trigger BEFORE INSERT OR UPDATE ON public."Pelicula" FOR EACH ROW EXECUTE FUNCTION public.ganancia_perdida();
 <   DROP TRIGGER ganancia_perdida_trigger ON public."Pelicula";
       public          postgres    false    238    259            �           2620    26149    Personaje genero_trigger    TRIGGER     {   CREATE TRIGGER genero_trigger BEFORE INSERT OR UPDATE ON public."Personaje" FOR EACH ROW EXECUTE FUNCTION public.genero();
 3   DROP TRIGGER genero_trigger ON public."Personaje";
       public          postgres    false    260    244            �           2620    26396    Usuario numusuarios_trigger    TRIGGER     y   CREATE TRIGGER numusuarios_trigger BEFORE INSERT ON public."Usuario" FOR EACH ROW EXECUTE FUNCTION public.numusuarios();
 6   DROP TRIGGER numusuarios_trigger ON public."Usuario";
       public          postgres    false    256    264            �           2620    26151    Medio rating_trigger    TRIGGER     z   CREATE TRIGGER rating_trigger BEFORE INSERT OR UPDATE ON public."Medio" FOR EACH ROW EXECUTE FUNCTION public.numrating();
 /   DROP TRIGGER rating_trigger ON public."Medio";
       public          postgres    false    231    263            �           2620    26152    Esta rolpersonaje_trigger    TRIGGER     �   CREATE TRIGGER rolpersonaje_trigger BEFORE INSERT OR UPDATE ON public."Esta" FOR EACH ROW EXECUTE FUNCTION public.rolpersonaje();
 4   DROP TRIGGER rolpersonaje_trigger ON public."Esta";
       public          postgres    false    265    224            �           2620    26153    Esta tipoactor_trigger    TRIGGER     |   CREATE TRIGGER tipoactor_trigger BEFORE INSERT OR UPDATE ON public."Esta" FOR EACH ROW EXECUTE FUNCTION public.tipoactor();
 1   DROP TRIGGER tipoactor_trigger ON public."Esta";
       public          postgres    false    266    224            �           2620    26154 %   Suscripcion tiposuscripciones_trigger    TRIGGER     �   CREATE TRIGGER tiposuscripciones_trigger BEFORE INSERT OR UPDATE ON public."Suscripcion" FOR EACH ROW EXECUTE FUNCTION public.tiposuscripciones();
 @   DROP TRIGGER tiposuscripciones_trigger ON public."Suscripcion";
       public          postgres    false    267    254            �           2606    26155 #   Aparece Aparece_N_Organizacion_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Aparece"
    ADD CONSTRAINT "Aparece_N_Organizacion_fkey" FOREIGN KEY ("N_Organizacion") REFERENCES public."Organizacion"("Nombre") ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 Q   ALTER TABLE ONLY public."Aparece" DROP CONSTRAINT "Aparece_N_Organizacion_fkey";
       public          postgres    false    214    3404    235            �           2606    26160    Aparece Aparece_N_Titulo_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Aparece"
    ADD CONSTRAINT "Aparece_N_Titulo_fkey" FOREIGN KEY ("N_Titulo") REFERENCES public."Medio"("Titulo") ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 K   ALTER TABLE ONLY public."Aparece" DROP CONSTRAINT "Aparece_N_Titulo_fkey";
       public          postgres    false    3392    231    214            �           2606    26165    Ciudad Ciudad_Id_Estado_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Ciudad"
    ADD CONSTRAINT "Ciudad_Id_Estado_fkey" FOREIGN KEY ("Id_Estado") REFERENCES public."Estado"("Id_Estado") ON UPDATE CASCADE NOT VALID;
 J   ALTER TABLE ONLY public."Ciudad" DROP CONSTRAINT "Ciudad_Id_Estado_fkey";
       public          postgres    false    225    3382    217            �           2606    26170    Civil Civil_N_Civil_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Civil"
    ADD CONSTRAINT "Civil_N_Civil_fkey" FOREIGN KEY ("N_Civil") REFERENCES public."Personaje"("Nombre") ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 F   ALTER TABLE ONLY public."Civil" DROP CONSTRAINT "Civil_N_Civil_fkey";
       public          postgres    false    244    3418    219            �           2606    26175    Combate Combate_N_Objeto_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Combate"
    ADD CONSTRAINT "Combate_N_Objeto_fkey" FOREIGN KEY ("N_Objeto") REFERENCES public."Objeto"("Nombre") ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 K   ALTER TABLE ONLY public."Combate" DROP CONSTRAINT "Combate_N_Objeto_fkey";
       public          postgres    false    233    3396    220            �           2606    26180     Combate Combate_N_Personaje_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Combate"
    ADD CONSTRAINT "Combate_N_Personaje_fkey" FOREIGN KEY ("N_Personaje") REFERENCES public."Personaje"("Nombre") ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 N   ALTER TABLE ONLY public."Combate" DROP CONSTRAINT "Combate_N_Personaje_fkey";
       public          postgres    false    244    220    3418            �           2606    26185    Combate Combate_N_Poder_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Combate"
    ADD CONSTRAINT "Combate_N_Poder_fkey" FOREIGN KEY ("N_Poder") REFERENCES public."Poder"("Nombre") ON UPDATE CASCADE ON DELETE SET DEFAULT NOT VALID;
 J   ALTER TABLE ONLY public."Combate" DROP CONSTRAINT "Combate_N_Poder_fkey";
       public          postgres    false    220    3428    248            �           2606    26190    Crea Crea_N_Objeto_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Crea"
    ADD CONSTRAINT "Crea_N_Objeto_fkey" FOREIGN KEY ("N_Objeto") REFERENCES public."Objeto"("Nombre") ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 E   ALTER TABLE ONLY public."Crea" DROP CONSTRAINT "Crea_N_Objeto_fkey";
       public          postgres    false    3396    233    221            �           2606    26195    Crea Crea_N_Personaje_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Crea"
    ADD CONSTRAINT "Crea_N_Personaje_fkey" FOREIGN KEY ("N_Personaje") REFERENCES public."Personaje"("Nombre") ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 H   ALTER TABLE ONLY public."Crea" DROP CONSTRAINT "Crea_N_Personaje_fkey";
       public          postgres    false    3418    244    221            �           2606    26200    Enfrenta Enfrenta_N_Heroe_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Enfrenta"
    ADD CONSTRAINT "Enfrenta_N_Heroe_fkey" FOREIGN KEY ("N_Heroe") REFERENCES public."Heroe"("N_Heroe") ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 L   ALTER TABLE ONLY public."Enfrenta" DROP CONSTRAINT "Enfrenta_N_Heroe_fkey";
       public          postgres    false    223    3386    227            �           2606    26205     Enfrenta Enfrenta_N_Villano_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Enfrenta"
    ADD CONSTRAINT "Enfrenta_N_Villano_fkey" FOREIGN KEY ("N_Villano") REFERENCES public."Villano"("N_Villano") ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 N   ALTER TABLE ONLY public."Enfrenta" DROP CONSTRAINT "Enfrenta_N_Villano_fkey";
       public          postgres    false    223    3460    257            �           2606    26210    Esta Esta_N_Personaje_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Esta"
    ADD CONSTRAINT "Esta_N_Personaje_fkey" FOREIGN KEY ("N_Personaje") REFERENCES public."Personaje"("Nombre") ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 H   ALTER TABLE ONLY public."Esta" DROP CONSTRAINT "Esta_N_Personaje_fkey";
       public          postgres    false    244    3418    224            �           2606    26215    Esta Esta_N_Titulo_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Esta"
    ADD CONSTRAINT "Esta_N_Titulo_fkey" FOREIGN KEY ("N_Titulo") REFERENCES public."Medio"("Titulo") ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 E   ALTER TABLE ONLY public."Esta" DROP CONSTRAINT "Esta_N_Titulo_fkey";
       public          postgres    false    3392    224    231            �           2606    26220    Estado Estado_Id_Pais_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Estado"
    ADD CONSTRAINT "Estado_Id_Pais_fkey" FOREIGN KEY ("Id_Pais") REFERENCES public."Pais"("Id_Pais") ON UPDATE CASCADE NOT VALID;
 H   ALTER TABLE ONLY public."Estado" DROP CONSTRAINT "Estado_Id_Pais_fkey";
       public          postgres    false    3406    236    225            �           2606    26225    Heroe Heroe_Archienemigo_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Heroe"
    ADD CONSTRAINT "Heroe_Archienemigo_fkey" FOREIGN KEY ("Archienemigo") REFERENCES public."Villano"("N_Villano") ON UPDATE CASCADE NOT VALID;
 K   ALTER TABLE ONLY public."Heroe" DROP CONSTRAINT "Heroe_Archienemigo_fkey";
       public          postgres    false    227    257    3460            �           2606    26230    Heroe Heroe_N_Heroe_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Heroe"
    ADD CONSTRAINT "Heroe_N_Heroe_fkey" FOREIGN KEY ("N_Heroe") REFERENCES public."Personaje"("Nombre") ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 F   ALTER TABLE ONLY public."Heroe" DROP CONSTRAINT "Heroe_N_Heroe_fkey";
       public          postgres    false    227    3418    244            �           2606    26235    Historial Historial_Medio_FK    FK CONSTRAINT     �   ALTER TABLE ONLY public."Historial"
    ADD CONSTRAINT "Historial_Medio_FK" FOREIGN KEY ("N_Titulo") REFERENCES public."Medio"("Titulo");
 J   ALTER TABLE ONLY public."Historial" DROP CONSTRAINT "Historial_Medio_FK";
       public          postgres    false    228    3392    231            �           2606    26240    Historial Historial_Perfil_FK    FK CONSTRAINT     �   ALTER TABLE ONLY public."Historial"
    ADD CONSTRAINT "Historial_Perfil_FK" FOREIGN KEY ("Id_Perfil") REFERENCES public."Perfil"("Id_Perfil");
 K   ALTER TABLE ONLY public."Historial" DROP CONSTRAINT "Historial_Perfil_FK";
       public          postgres    false    228    3410    239            �           2606    26245    Juego Juego_T_Juego_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Juego"
    ADD CONSTRAINT "Juego_T_Juego_fkey" FOREIGN KEY ("T_Juego") REFERENCES public."Medio"("Titulo") ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 F   ALTER TABLE ONLY public."Juego" DROP CONSTRAINT "Juego_T_Juego_fkey";
       public          postgres    false    231    230    3392            �           2606    26250    Serie Medio_T_Serie_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Serie"
    ADD CONSTRAINT "Medio_T_Serie_fkey" FOREIGN KEY ("T_Serie") REFERENCES public."Medio"("Titulo") ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 F   ALTER TABLE ONLY public."Serie" DROP CONSTRAINT "Medio_T_Serie_fkey";
       public          postgres    false    3392    231    253            �           2606    26255    Objeto Objeto_N_Personaje_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Objeto"
    ADD CONSTRAINT "Objeto_N_Personaje_fkey" FOREIGN KEY ("N_Personaje") REFERENCES public."Personaje"("Nombre") ON UPDATE CASCADE NOT VALID;
 L   ALTER TABLE ONLY public."Objeto" DROP CONSTRAINT "Objeto_N_Personaje_fkey";
       public          postgres    false    3418    244    233            �           2606    26260 '   Organizacion Organizacion_Fundador_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Organizacion"
    ADD CONSTRAINT "Organizacion_Fundador_fkey" FOREIGN KEY ("Fundador") REFERENCES public."Personaje"("Nombre") ON UPDATE CASCADE NOT VALID;
 U   ALTER TABLE ONLY public."Organizacion" DROP CONSTRAINT "Organizacion_Fundador_fkey";
       public          postgres    false    3418    235    244            �           2606    26265 $   Organizacion Organizacion_Lider_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Organizacion"
    ADD CONSTRAINT "Organizacion_Lider_fkey" FOREIGN KEY ("Lider") REFERENCES public."Personaje"("Nombre") ON UPDATE CASCADE NOT VALID;
 R   ALTER TABLE ONLY public."Organizacion" DROP CONSTRAINT "Organizacion_Lider_fkey";
       public          postgres    false    3418    235    244            �           2606    26270 !   Pelicula Pelicula_T_Pelicula_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Pelicula"
    ADD CONSTRAINT "Pelicula_T_Pelicula_fkey" FOREIGN KEY ("T_Pelicula") REFERENCES public."Medio"("Titulo") ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 O   ALTER TABLE ONLY public."Pelicula" DROP CONSTRAINT "Pelicula_T_Pelicula_fkey";
       public          postgres    false    238    231    3392            �           2606    26275    Perfil Perfil_Email_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Perfil"
    ADD CONSTRAINT "Perfil_Email_fkey" FOREIGN KEY ("Email") REFERENCES public."Usuario"("Email") ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 F   ALTER TABLE ONLY public."Perfil" DROP CONSTRAINT "Perfil_Email_fkey";
       public          postgres    false    3456    239    256            �           2606    26280 (   Pers_Creador Pers_Creador_N_Creador_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Pers_Creador"
    ADD CONSTRAINT "Pers_Creador_N_Creador_fkey" FOREIGN KEY ("N_Creador") REFERENCES public."Creador"("Nom_Creador") ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 V   ALTER TABLE ONLY public."Pers_Creador" DROP CONSTRAINT "Pers_Creador_N_Creador_fkey";
       public          postgres    false    222    241    3376            �           2606    26285 *   Pers_Creador Pers_Creador_N_Personaje_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Pers_Creador"
    ADD CONSTRAINT "Pers_Creador_N_Personaje_fkey" FOREIGN KEY ("N_Personaje") REFERENCES public."Personaje"("Nombre") ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 X   ALTER TABLE ONLY public."Pers_Creador" DROP CONSTRAINT "Pers_Creador_N_Personaje_fkey";
       public          postgres    false    244    241    3418            �           2606    26290 "   Pers_Nac Pers_Nac_N_Personaje_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Pers_Nac"
    ADD CONSTRAINT "Pers_Nac_N_Personaje_fkey" FOREIGN KEY ("N_Personaje") REFERENCES public."Personaje"("Nombre") ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 P   ALTER TABLE ONLY public."Pers_Nac" DROP CONSTRAINT "Pers_Nac_N_Personaje_fkey";
       public          postgres    false    244    242    3418            �           2606    26295 #   Pers_Nac Pers_Nac_Nacionalidad_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Pers_Nac"
    ADD CONSTRAINT "Pers_Nac_Nacionalidad_fkey" FOREIGN KEY ("Nacionalidad") REFERENCES public."Nacionalidad"("Nac") ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 Q   ALTER TABLE ONLY public."Pers_Nac" DROP CONSTRAINT "Pers_Nac_Nacionalidad_fkey";
       public          postgres    false    242    3394    232            �           2606    26300     Pers_Oc Pers_Oc_N_Personaje_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Pers_Oc"
    ADD CONSTRAINT "Pers_Oc_N_Personaje_fkey" FOREIGN KEY ("N_Personaje") REFERENCES public."Personaje"("Nombre") ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 N   ALTER TABLE ONLY public."Pers_Oc" DROP CONSTRAINT "Pers_Oc_N_Personaje_fkey";
       public          postgres    false    244    243    3418            �           2606    26305    Pers_Oc Pers_Oc_Ocupacion_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Pers_Oc"
    ADD CONSTRAINT "Pers_Oc_Ocupacion_fkey" FOREIGN KEY ("Ocupacion") REFERENCES public."Ocupacion"("Ocup") ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 L   ALTER TABLE ONLY public."Pers_Oc" DROP CONSTRAINT "Pers_Oc_Ocupacion_fkey";
       public          postgres    false    3398    243    234            �           2606    26310 "   Pertenece Pertenece_Cod_Cargo_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Pertenece"
    ADD CONSTRAINT "Pertenece_Cod_Cargo_fkey" FOREIGN KEY ("Cod_Cargo") REFERENCES public."Cargo"("Cod_Cargo") ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 P   ALTER TABLE ONLY public."Pertenece" DROP CONSTRAINT "Pertenece_Cod_Cargo_fkey";
       public          postgres    false    3366    245    215            �           2606    26315 '   Pertenece Pertenece_N_Organizacion_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Pertenece"
    ADD CONSTRAINT "Pertenece_N_Organizacion_fkey" FOREIGN KEY ("N_Organizacion") REFERENCES public."Organizacion"("Nombre") ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 U   ALTER TABLE ONLY public."Pertenece" DROP CONSTRAINT "Pertenece_N_Organizacion_fkey";
       public          postgres    false    3404    245    235            �           2606    26320 $   Pertenece Pertenece_N_Personaje_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Pertenece"
    ADD CONSTRAINT "Pertenece_N_Personaje_fkey" FOREIGN KEY ("N_Personaje") REFERENCES public."Personaje"("Nombre") ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 R   ALTER TABLE ONLY public."Pertenece" DROP CONSTRAINT "Pertenece_N_Personaje_fkey";
       public          postgres    false    3418    245    244            �           2606    26325 %   Plat_Juego Plat_Juego_Plataforma_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Plat_Juego"
    ADD CONSTRAINT "Plat_Juego_Plataforma_fkey" FOREIGN KEY ("Plataforma") REFERENCES public."Plataforma"(nombre) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 S   ALTER TABLE ONLY public."Plat_Juego" DROP CONSTRAINT "Plat_Juego_Plataforma_fkey";
       public          postgres    false    3426    246    247            �           2606    26330 "   Plat_Juego Plat_Juego_T_Juego_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Plat_Juego"
    ADD CONSTRAINT "Plat_Juego_T_Juego_fkey" FOREIGN KEY ("T_Juego") REFERENCES public."Juego"("T_Juego") ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 P   ALTER TABLE ONLY public."Plat_Juego" DROP CONSTRAINT "Plat_Juego_T_Juego_fkey";
       public          postgres    false    3390    246    230            �           2606    26335    Posee Posee_N_Personaje_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Posee"
    ADD CONSTRAINT "Posee_N_Personaje_fkey" FOREIGN KEY ("N_Personaje") REFERENCES public."Personaje"("Nombre") ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 J   ALTER TABLE ONLY public."Posee" DROP CONSTRAINT "Posee_N_Personaje_fkey";
       public          postgres    false    244    249    3418            �           2606    26340    Posee Posee_N_Poder_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Posee"
    ADD CONSTRAINT "Posee_N_Poder_fkey" FOREIGN KEY ("N_Poder") REFERENCES public."Poder"("Nombre") ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 F   ALTER TABLE ONLY public."Posee" DROP CONSTRAINT "Posee_N_Poder_fkey";
       public          postgres    false    249    3428    248            �           2606    26345 *   RelacionadoHer RelacionadoHer_N_Civil_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."RelacionadoHer"
    ADD CONSTRAINT "RelacionadoHer_N_Civil_fkey" FOREIGN KEY ("N_Civil") REFERENCES public."Civil"("N_Civil") ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 X   ALTER TABLE ONLY public."RelacionadoHer" DROP CONSTRAINT "RelacionadoHer_N_Civil_fkey";
       public          postgres    false    250    3370    219            �           2606    26350 *   RelacionadoHer RelacionadoHer_N_Heroe_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."RelacionadoHer"
    ADD CONSTRAINT "RelacionadoHer_N_Heroe_fkey" FOREIGN KEY ("N_Heroe") REFERENCES public."Heroe"("N_Heroe") ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 X   ALTER TABLE ONLY public."RelacionadoHer" DROP CONSTRAINT "RelacionadoHer_N_Heroe_fkey";
       public          postgres    false    227    250    3386            �           2606    26355 ,   RelacionadoVill RelacionadoVill_N_Civil_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."RelacionadoVill"
    ADD CONSTRAINT "RelacionadoVill_N_Civil_fkey" FOREIGN KEY ("N_Civil") REFERENCES public."Civil"("N_Civil") ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 Z   ALTER TABLE ONLY public."RelacionadoVill" DROP CONSTRAINT "RelacionadoVill_N_Civil_fkey";
       public          postgres    false    251    219    3370            �           2606    26360 .   RelacionadoVill RelacionadoVill_N_Villano_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."RelacionadoVill"
    ADD CONSTRAINT "RelacionadoVill_N_Villano_fkey" FOREIGN KEY ("N_Villano") REFERENCES public."Villano"("N_Villano") ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 \   ALTER TABLE ONLY public."RelacionadoVill" DROP CONSTRAINT "RelacionadoVill_N_Villano_fkey";
       public          postgres    false    3460    251    257            �           2606    26365    Sede Sede_N_Org_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Sede"
    ADD CONSTRAINT "Sede_N_Org_fkey" FOREIGN KEY ("N_Org") REFERENCES public."Organizacion"("Nombre") ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 B   ALTER TABLE ONLY public."Sede" DROP CONSTRAINT "Sede_N_Org_fkey";
       public          postgres    false    3404    252    235            �           2606    26370    Usuario Usuario_Direccion_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Usuario"
    ADD CONSTRAINT "Usuario_Direccion_fkey" FOREIGN KEY ("Direccion") REFERENCES public."Ciudad"("Id_Ciudad") ON UPDATE CASCADE ON DELETE RESTRICT NOT VALID;
 L   ALTER TABLE ONLY public."Usuario" DROP CONSTRAINT "Usuario_Direccion_fkey";
       public          postgres    false    3368    217    256            �           2606    26375 #   Usuario Usuario_Id_Suscripcion_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Usuario"
    ADD CONSTRAINT "Usuario_Id_Suscripcion_fkey" FOREIGN KEY ("Id_Suscripcion") REFERENCES public."Suscripcion"("ID") ON UPDATE CASCADE ON DELETE RESTRICT NOT VALID;
 Q   ALTER TABLE ONLY public."Usuario" DROP CONSTRAINT "Usuario_Id_Suscripcion_fkey";
       public          postgres    false    3446    254    256            �           2606    26380    Usuario Usuario_N_Tarjeta_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Usuario"
    ADD CONSTRAINT "Usuario_N_Tarjeta_fkey" FOREIGN KEY ("N_Tarjeta") REFERENCES public."Tarjeta"("N_Tarjeta") ON UPDATE CASCADE NOT VALID;
 L   ALTER TABLE ONLY public."Usuario" DROP CONSTRAINT "Usuario_N_Tarjeta_fkey";
       public          postgres    false    3448    255    256            �           2606    26385    Villano Villano_N_Villano_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Villano"
    ADD CONSTRAINT "Villano_N_Villano_fkey" FOREIGN KEY ("N_Villano") REFERENCES public."Personaje"("Nombre") ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 L   ALTER TABLE ONLY public."Villano" DROP CONSTRAINT "Villano_N_Villano_fkey";
       public          postgres    false    257    244    3418            J   ,  x���=n1�k�)�K��t+@�
�+Ҍ�@F��ػJ��2��b1?+Hd�J��y�{�o9��fC3U/0G��)W�o���Ţ�/&V�p�q�)PV�/���l�+RhH6h���R"n�p�X,���A��&!��bi�T�"t .s�kT�(�(8�1:|g4W4�g��iS
��oMZ�s���\�!�a�@������,��vNb繰kf e��bV�M3�����.&p$h����=���F�@I�����;x�<{Hk���sԆ\����|��w����׻�(�X�,�      K   9   x�340���LI-�240�t�O+�KIL�q�8�S�JR�Lc΀����b�x� ��      M   O   x�344�tN,JLN,�44�244�t�,MILQHIUp�O�/I�44�s��+����s�T� 5� �q��qqq 
�a      O   -   x�s�,)����/O,JQ.I,��
H-(H-R�/))����� ��      P   �  x���Mn�0���)�*$�Fܥc��
;N���f"�czƠH��m��:G��J�@S9�l�]������J6��*�`���Nc��B�F�Z֨B	���5)�q�D�0J΂'7���wUpx��\����k'���q�F��+6r_�,O�q����1��r�f\0\����'Ȳ�H\O'�@�q׍�W0�?�*��R��7y�dSi�S�����3�*Ť*{�[���o����_U�5�a�ke�?	&���Y��b���fL�\�Ha��K$��(WJض�����VZ�KN�"�h�ǟg���aʫ��������wy�֏����}��0�Ϣ4	>#	4G�2hZ�~�5L�䍿�I�2���F$LݤsK:���u��!��|⵳���]���X����V��?h��:5»���²�G0�C��ć~�s�
�;����6�ok������#�      Q   �   x�-̱1@�:����	�D�(�ј$�G9��P2�-Ɓh~��R��Wj7�֠�F���]%n����7�z�)�*��*8ܗw�@���._Z���c�>(��'3�������*p� ���.�      R   �   x�%�An�@��yA��@�b�\�,��Z{F6D�=K�u����L{@��jO\�w���M�)=0.�tn�������&��O�)a�l�U�t�[Z�����4>5��$'�U����;k�A@�<��]d�h�c-.;�zH�`ƫ~鑘�5�D��}�k����f!��ߎG�      S   �   x�e�1��@Ek�>A�$i"�DK�i0;ր-y��I�!����z�1�M��+�Ug�Eɑ�BmKOP�ȋ�<A=�䴅�i%��_�\]4���8��ᦲA�h�j414���e��֎ݢ�K	{���9bi�(:�{��cǉ�3���g�>q`��$��dp-���
m��EK�t����'�-����byt      T   �  x��Y�v�H]���ݬzݻ�`��`�n���MX
P�29�.�of9������	ն��L�&�"#n�xhe͞��lt묡6�[S��:)8����o�Q���¾�+hj_����E�����! cW�Bc6F�h�
ݚ�I�^�Ь�Y�U��.�G�
k�Uj=%�xkF�C��Iꔧ�����hY�Nha7��h�[U|�������8�'M[�rq��\7�Վ���`�2�s6v�>뤥ĥI�)���RtgS`�:ѣ�S���u���08/a�=�q���\ikk|��v�g�~���a>�t0��2Ns����
;+7���w�l�{�)��r-���U���9�T�h�!�O/�(N���p��w�^�ةd#>z`���t������hO�;SY�I��8)���݉�pBf�F����CU�'g�����/3��lՃ
'�nFy���?l���\+��p�F�CЯ��~׎M�}��N���m*m��3Eʺ�=SFZ�N��i��H%j�<+�.责�
�)�	bih���2��j�'��P�-Y���@Q���N�C	(��N�!�O8�̗>�]�炟�?J���D�R�)8�L7����N��L�n8��/A��
-��_����^2�]��e>E7���<��A��|I;�g���/:ZX��gK����d�X�Gy)u_�T��a�Aa+�L.���1���l�и�k�_zV�}m�lmp[��i�d���y��[���:-&��Aep��9�v��O���͹ �3俠�*P�7H��}�u�F9O�n=9�,��8+�'Y����}���Н	��@F��gO���p��`;�tr�`O�4|��:���>�x���V�˼�^A?�P�M��DOEa�).�ҟG�F��^C���je�I}�1pi[}*��X/���l&H�>�T�3�T@R�)HW�G�CG��%��= @���z��֫O����R���4������F�>w�$��B��N���m�F%�:���	�����:����PIu/u���FB�Q�#�a��^��y�B�H�A�uR5�� �Z����I6��M%�}�p��xvC|c}����@�z�����>é2�ƈx.��V�"�^$�{zy�6*�����8���\�è Om������*h��(�b��m��6t�@}@�,���?^ՙ�:�c���<���y�˂�����V��{/����"EƆq!�nR���m�c쾷�s�H/h��9�Ø����c�f%�Í]kz��7TڋC��_sNZ���$@DIWPכW<Y��[��V����T��y{�W�Ռ�Ƽ�Yc������^Rv5}�sc��P ^0(5+�n{�!�C�Չv�������?��d�?K����]��N�.�-K�� Q��poC\�I5WzA;���[	Ǳ���a\���_u_��K��g����5a�v�v�<m_`���1>�췘��/a�4�/��KU�wϿ��m1��9��8�)����8U�lBY9����I��Gs69x�� �<=c"Pf�r^��s�����ml�ִ�Ƽ����z5�_U%B��^�q&LWUݔ�g}e|��m���z,!k\>�*��7j�?��Q��u�|��P� �-/̪��q��&�U!B�����C��s�_-���йl�!Fs�W�"7�{#E������-��w����EhY�y���0�KV�ٞ'H8���%H����P���Q��hc6      U   G   x�34�t�,.)�,�WpN,�,I��4�22���,J�KIr�8����K9����8}SSRsr2�=... ���      W   p  x�USKr�0]S��:��dѵc'q2���$Yd��`�Ex@ҩz��z�\��,���H�� �{|&��M��#��s��}���A��b(I��Y�-p$��rX���3_�:��J�w�%,���A���[%����	3����95�|	>���^�g�����0F�J�l=f̨���/���<y&T���W>aր~"�A]�l;����h"ը�r�Ϋ�$���$c'�-:��������6�/�~A.�,�=�����U�6T�C�~�wIڭo�j���k�!5����֨�L7��Or�z�$f��U�ޘ��e9bƸ$S�	0�x�n�]�]�u�8S]<W�zYZ/�7�C�]Όj�g���
�X@�P�����ݪ�J�R.�y��b���t(V��J+<l��Dn�L��e���&������J�S��zF\��~"!�1����z{w�2�V��E�	���D�3Ig�<0QT��p�s���ZXƨ�M�Q�� ��t�M6�i:Y��G{T?o:zeؓ����V�Ay��9�����*�>ɽw�u� �n�Mٓcy�Iiyz?n2�7�|,p�A�	��_1m1��og����z������S��M۫�����k�޿E�ig��      X   c  x��U˒�8<WE�8A�������`"��%���c��l7���;��-����a�J���T	�6�]��s\��M��Qj'����х~��,�`�v8�C�<��2���ǣ�r(%-�"ۙ����:|�8_���@�
^�6ԍ����[��lk�7DO(
�yfo��ǿ/N?����ѵx���u��6H�pu��9'� �HC��r��~�Wc8��dpߜ�Ё DP�t���6�$�[ ^��wmM��n\�h9�����cN����
�C;4';��E,��W�;��@콷�>��S���'2N>��]hZO}keF%EQFU�W7�0���ڀ_��(�sՅ�BU��DM>�e� y1��v�0ۣ���)��ټ"�>�r�/+���p������L�H��͓�������@��e�j�������1Փ�L��e6xR�Jf����u}O��ێ��,��6��G�Cw�R��H��������}4�3��I�8��F��c�S�4��g�?� R��.����W�N�|O��q��<Qn2*H�����7�1R�*�5�~��'l���_v��( #߹�~�r�Q� �i��*�N:��fE�����rt��i�����S�L�&9�v���03X��)�N�~ݛ|�k8������!'��:����#�qҤ��|�j���&)�團��㢖�Eo�SiڪȜ�vf����iB�b5�&�񌮠`�L���B�|n�[41���~��s�L�ҧ��R,���9��Q�7z�q�B6� 6H51���!N� �ˆ?U�]�=/v�����\Ι\�	�j	�OOv����rS{      Z   r   x��M,*K�Q/V.�LI-��M���ϫT��+I-JL.�,KUp�K3�rS�J8�]�|a��R��S��9�K�@*3+@
BsJ2sKR *ʊ���s9���W� c+      [   ~  x��YMs�F=C�b*�\(AR�M��#����d�rCj$ � ���>l�+�ؾ�� %צʮ�H`��u���=S��/��+���*5��*�h:�O�'�G��oL�n�:���fѕ+կxS�ΛR�Fy���0�*j�ѹ)*���b���xF�O��HՅV�dve��j�}e��2X��Ԧ�y��D{|δ��s]��t��-��TY���B%�*Sb_�ఱ��ʍT���}+���ȓK� �TY�j��g��3�T�H�|�[�5���E�gm�.�
oU�)؛�E�[F����Ibw�r���@+��Q|���kM`'�Ǔ)�=v}t�jO�бN�6�\�=>n�R/< !��S�\�#%>Hj���)� ���y2e=��xo�ˊ��c��! �x��5k��J-��5,�,�c�ܔ�z���ެ�D�z��(*aU��p�[��7���������F�/}�K@+��D��4�]4��ȜJd��ȼ�}�Έu�w���j�.��V������,�����Æ�u�aZ�h����z�x���ɽzY�m8��%��AN��ۺ@4�"���[l`��Nle���w8v�YëH �%������K>Z&�8:ET� ʳLØ���[㟪���.�;/aPT��qǓ�I,^0aἆSS\��¥F�Y-���� �LoM�A��4��GE��>Ύ㳇;�$���8�J�<ө'�\�V/�'r���@���2��p�Ǌ�LɬIv�y�j�U��-�y�x}�`����S�Ձ,2c�;#�g�+�s+�&�af�&]禡
�@_�`<1QYB�/dA�C�:�O�����Ɋ�_+��IM^��W�xi$cC0#W�G�(�����צ��cSXd���'O����#�6�K ��+ZG��65r��I��>s��R����<�M��^��g�x\�F<aC8$����oLᄗH���.�x`93�kT�Mn����+WD&5���Y"��*�}jX���e��	ۃ*���B'�Ɯ�L��E{t<��@�.�6��.ʕ�)b�� ���K��Q����[���Yt���K�x��fF�|���0��,PjcW6#����p���[��g��5(\/2�ե)����Oӱ�P���� �9s.�JgX[��%��X"��j�ȭA�RB�_,� �
�JԢ~�E�D)�z5�V'��]]V���@0�a���$����qc]&B`�L�9!��ɋ"]!o���"����_:D��nh�@E�j���g����L���X�B8�d�1_B�Z�����o�kC� �07���h~���<�� ΀bӔ�&�Ύ�ӇG�����p�D͝�{*�}#��{~p������e5C�6K�!m,=��9��(�R5�Y2�Jǜs��X]��7���`��a�a�.�#x��!�r2 ���6�|G4e��X�G)��a����pcV5�׫ZH�Xj��7�f&���$�N��߬i�q�U�UAG7TQ��jR�G����䗁�z���ѻ���,&Λ"���?�F\8y�Ѕ��,�mW0;VR!��8�.C��R�)���8��8:��ټ���^����t&��@���]���MҙK����AŊqa�[ �"���C�"Ϣ7E����D�B�҆D���|�v8v��,�Ɠ	�K˪ϵG��جs��O�ʨ�׵O]�1
�����|��c
�k@(��[&B��K ?耯v۶��u�3�b��1��%@0�[%���|�ȳ-�e�{ ���Y�5>^*Vk�ّ(S+�/.�%)��!aę�u�pH$Y2'Y�qB�܃)"�%�b���8>�	�����39�>��4�K�	�D)[�?��o��~��l|'����߳u��/A��B��,��xQ$�2�;�[K��}����R�W5��@��ҘN�H>����x�Jõ}E�����m��l��H�5�գ��t�!�֔%�z�
S���O'h�/�"��~�B���W�Y�]ݶ��]+uc�]D�A�����)�:���`��О�t��ʤN���wB<l==PKZU�/6[�XJ��%_�;Q��=_�y5��a&����5�q+���VJ75=(]�"A|Ø�o��7���Y[������pt؜\�X�wi�Z0A�-Ni����b�x�ś���������վC�J����:���T'Y�_���!9�v�.�|����Fr��hV��/u�p��i-�����e�f�Pg��0z�è5+�{hH��P�Jaf���V�S�xƤ��?l�ju ��IEeW5����"[¶�(��H�4�|qo�ۡ�/�N���Rj�!k8��3B���ulǔ�q�D\@�ޔ��پ�����i�e#��M9[�с�.�&�NɆ�� �"��ͣ����f�IM��D�t��$�V��`
2�j��ү���{�S��TMW��!Ik�6YF����7���h*@FA����h+y!�1[lm��/m�]��T��D0��oٮ�{�d^I�pJ�2��k�#Bh�Zi3zmI���40�X�߇q@h:Q?�O��w�����@�/!2�>&�Lb!��m�fM�?V���\������[�ґ.4�Ԗ)e���^�
!ﾢ�"��2�%z�L��}1����o��>@�q�!�K.��e�
!�HW�	�9���:?C^|�|�U;�S����M��D�7͘����:�����c���hDХN�T|�b�W"C�v�Z�#�V�[����w�{��5�!Z�ܡk�\~=?�N��7E�j��T6����x��g�F��b���-��������ö��<L�!�g�̴��'�@o�R�8��ٲ�h�A+���{(�����qў�e�ڨ�#�ok�����7�a���L��F�����(����>�� �vZz��!���n6��=���b?|E5������⇝u;�i�i:�+��r�����bB������	Z��`���'�=P���A �^1gb|*�	m[�C�O���A��QbY��	5٘G�����fUS��F�{�K<L�0A�ڻ1�N�e�G�~["���-��Dz�0�e���a��Ͷjgc]����l:i'�R�'���'���1�ʟA��Z[�752�V�#b�s`��5�SXk����2�QG�a��=N�UW��{��:!t���fp7��rF��'|7p��hN��;P{��'�٬w��fӡo�A���.����qbn)�,G�����	
��7~��h�_�m/�3�,���o6�*���{8k+z��[pc����+�0��F��u��i�����5�ԭ��@+�W���Du=Nq)u3G��2�U�=*v�]߼ҙ�lu�՜?rk;��(�S����fa�&a2)�Z�_�ޡ�OG{�̋I4*��Ȼ��w*WG64D�P{�Ҝ �v��<�H�M���΁[�P. 9�jY��l)��eù��]�1���.ڪ� 
����I�Yf��a�0���]ubC9=�+ƭ� �� 05��R��(\��>#���dC�^��FN���-�LQC�ɺ��@���Ɓ�9H�1	#ur
+���BQ�"s�>Au�4�>r��r���8����J�,�	poH�V��\���0,`|!_@$�Aǳ�?�GGG�D�M�      \   Y   x�ʻ�0���!�����y�X[�g fa1$���6�wSIVB=XDi��W�X�����4��k�E"g#2��ngҌm �6�      ]   �  x�UR�n1<k��_P����q�-
q4NO��Zn�X+n))��79�Я����݇�=��p8��V�@'�T(eqm-{�I!x���@J1S��D�1p�=%�挑�Јn��u�c��Yb�j��JU�T1����`V���I0�?<G�rI�5ʷn����g|⒚��q^Ɏ�8�6U��[��~!��dMC�sY�EHL )����L�x����*+\ah��Oɗ������tB;~*{t�g�%��9���̛@�+�}����_��LO_�45gyn�'uK�GΧ�ӱw�4Ӏނ����u�X�uw�6}J�B 9�/Z��-I����\��<\��N��j�=�n-j������(��x���	\(b}�-z
� �?�{������k��"�3��!����e�R��t�(�z�5�k��y�����Y�S��^W�_4M�r���      ^   �   x����@�����D�D`9rr���������%|c�����S�dJ�`�!n��i*u69���]�`Q���ى������hi�%��P�i��e�f�9��G�8�m�SҧMs�3�e�mg=('M�� �x�x]� և<      _   X  x�u��R1��ާ��k�L(0�H�@�����3��]uc�Z[��7�c��/�c�b��0�L{Z�dI�~ɇ	���)@M���E����x ���a'TQ��!$�,�G`�ܭ~Զ¡9�H�u��"�b9�ʂ��#ٜ���}�=��eJt��Ь.��(�tY�҂UZ!i�
��Ps�DnQ�g:����=�ռ�u|�;��F�UFj��e�����ƌ�����&_��wԢ�X�ӣ��XiBTL�e�֜�;�m�WV�&����p���!D�i K��A%;�՜��$Y�)��0�T����%g�ϲ��wg��izm:�*��U��59�?}LBĬ�Go�S\���B!��Y�kj��a8*0�UT�&	�פk�9R�]s�~��~v<�����<�y?ks>'�ϡ$�l?M����3�f�%�0� ��}�%�5T�+��]hØ����e{�6���\�QQ.q����w�D���5k%��)�*L_+���S�HJ�C�$�||:�,�E���r0�j������;TW߽.��납g���Pb�Y���sa�3������aLBf�k�j�3��O�x:��EQ�� ^D      `   $   x�3�K�K�*M�I�2�t����M�L����� H      b   �  x��T�n�@}^�b~�6�\�͵DB��>�e��0b=�wi��>�;�cC#%�Qe![Hsv�m��������|��y�C ��K�%YaἹq7n-Upb�n�tz�����E	0�e��*3�-�h�I��;�[Hu\���0���6y�m��[\��S���*ڍ���L(��L�$Yۤy�܋�
�GP��+�PXÙGA�Z�k�c���e�i� �sfZ�3,+ڙA�Jf�Nv(�`F��bY��p��׺�Rk���S5�<��VZ�:�;s��Uk�+,���43y�y�{�3�!��J�!̸"p? �S}y�`k��J���~��D!�?U# K�J�C:o���Ifh|�Jh�vo�۫_F)�j���*����y�i�6��*gM9�&�V�%
��k�f�R��^���n��}�(�tA`Q����hn���.�Ȟw��i��4v����<Qa�|`�d�8zfq���������؟��!�}�%1g~�*Ϲ���p��\�FcM�.���u��ϱ�np��ڏ���|`���<\iA���!o�A�����ف���R�T��N:�ɕD��/8٪�Ś
���T#���Oa�@�4D�Gx�$���_����	�]1ɚ�u���jh��@5ԓ^nfV?vne�Я~~bh����$������|��j�� x�,�      c   �   x�}�Mk1��3?F��c�&h-Xz�[/��hS&�%����j���4ᙗg^��Q��[X�[��Ӑ4������ʤS�`�nȉz_�<x�;�-�8���:��8�W��Y��At��x3Z��x�r�[����U���-lh'����%x�)BWl�wGt3�?�g�\&�W��;�O&���΂7��rc�a.4�*��c<�xE7h��F����M��џ=      e   �  x�}��n�@������;�R@4@H]���LLc%���IQ�~��J&T�
����3g�N}�ٯ@A��GV��=L�)�*��[�	DW�+�K��+�p(Y��C�42W1H�c�P!�E��5[����~��\�!W�{v�6`��>>�v�a�M�-�KX��*���Y9R��C^�����1+H��X�V+�K����W�u���	����jߵ�E��f;'?�}�dK���/-��F%�}���W�M ���U-�1��c`\ӆ�����ZǦ0�-�f(��R?�������p����Ml$��gj��s&4���m���]��[
��V���U��.��=yW1�Z����:қ.QLQ�q�+�R[n��4���i�
�,�>IT1.=��~���].5lS�	��w+h�!�GB�7qr�N]ےO��8���w�`a1���M��&=���8��⹶�JBE������Z5�-��y�i}�fy.y��y�ő�#      f   v  x�mRmn�0�m��'��Y8M�0�k3a�,()�����bSZh���>��2A�І�>&�5�$�\��Jp�Y�c�^=KT�V��3��L=�X��suʱL��0�&�4_�Gc�-�0G���V_�T�(��p05�}S���`O8��莔��XL��	�#X�8LUmZ�-�1'�M�V�@ŋ۩Gh;?r�>���3M�$f�NSO<��s�����,�?��cJŕ��-��Q��!�Th�T��/���P��J@shc(C!��'�l8.t�$��.A�����喽����ve
m�oNlm�#X�З�������7�А���죩�PE��W.��q��W�S���x�8�??�s��"�      g   �  x��SA��0<[�����I��n�ڢ�k�6aY(�?jO}B>V�@�Ţ��CG'��-"H�|�zBaSDѾp���iݜZ�\��q0O!���<�u���;�'*[v�n��
� vO�%+Չh2n��=�9��&sĈb��J��x���l�=9�v�Cw����B=yp��-xo������	EX(D���Q�u�=�~���|U|~�����l��`Ї�̅Gw2��f0�8ݰb�� �]�zU*~�RCf{�`�1�qF��uGh�;��C�B��+�(%�?�n@o���j!��rCt�|���O�FNjw��3K8�Zmx\bA]��^S��:o���w�#��s^8ưU���b��9�G��Y�P�]�5])i/�5��oAt�D�wM�V���>��e�R�;�;��c��?����QN~2��YW9\      h   %  x�}V�r�8][_�*��)�%!M��L��tM�F�o�Y�$���7�����kc�@¬��}�{Εg�KK���Jz+o�^�x��{bU�4.���Bo�K�7�&9��dz
\1��ra~�`�>�ʭ�x�B����O��d��O��t*e�"}��#�5�^%Ͷ���k��N��MF{��KꓹfrK�q�5l��SOs����;��Ι�̃I�z4!�ާ\���M��S��PR�Q�Ui,����+����
���	�:�j�v�q���	C�8j�}�PoL�4�Lo����?�*u��1�c�8wJb�M�b*83��FD�TƤ�q��<���������:n�[��󿺾��y�AB7�!Y�V��
�]���o2ѐ�tQ�-��x"x���P�Z���R�j��ev�e����x�����ot���WTւ׊t�Q��}!��6����u{�<�� @��z���­��B�*�ft-�L�pðw��J���+��Z�#�f����G�zS�����������5O2%p��B�'���⍽��Qt'͸��SI��Ru,B�_X�YVIM~Fe�6<<�d�{���U!��EC�-g�]b��Ǘ�3�#� �}@����6��9Fa��7�#!HlaH���`+����r��[��z�8W��k�[:��q�<)|�Ԙ�J�dz�I���LI��l?���B
�}6ꓩ���7ʭ�#���1�(Yd�>+qE}l~r�ބ�h���N:��Cr�r�Y��Vilq�n��E[�áOn�R��sۛc���~G��GW`��U�(�Y�K!�S]����7�3�u��[�}bٞ��.P?t'A�������=��#2��<�j�z5�k�@_hn� �h|HVIr��c����,O�J{��`�Z	�I.�'N���;�C2˘��i9Ϙ�+�u���bͷt	�4h�hP�e�E����E�}�h��l���S��_j�*�	r��U�BYk�U}�c���~�1�D��<?���m��B#1h�~!/��/�]�`H��"���� x      i   B  x����N�P�����h@� ����2b���)�	g�Iw���v� �o�����]�?BPv�;�
��x4��5,��-��lO�+	&�=ɐ-0`[#��A���O��A{%��]زf�-<wr����i����(!��]ԇ��Q��T�4��*p���V��.'�s�2�r�Y�g\�2P�ucM���<5d�.�5|Vup�=�I;��+ix���i�b,z�bB���:ņ��F�8N�+Ra�KV\�蟚�%+�&JhK����$� �Ĩ�/���v�ׯh�2���%u؀%�_�5M�\>��9^�����8���֞      j   n   x��M,*K�Q/V.�LI-��M���I�.I,���S0��p,K�KO-*�p�&H@SDR~��^*WhNIfnbI�D�BY��sbAr~.��xԁ�263�g�3W� �K�      k   S   x�p�
�I�.I,���S0Fᙠ�L�"��+�� ��T#8�(3U!��/3�$5/%_!<3�����g�$gp��qqq 8�(�      l   �  x��TAR�@<�W����3�"!U	EA�S.���5�q4W�7<��'����xaY|�ޑZ�VKW�e��Δ� mL'�?��{�S&�����Sr[��KK-�[v9�#��3U_�r��gn�Q�>{R 8��F�7��2d�	�FCK���ӟ̞��:v�^�8���K˯E8�\+^���'����_0�������M���]�B�<s]����)!�%K�h�r���U��T�v̓��A<+X�����6%��}���}\U�}N����\�EwP`n�@�p�2����,ҊR�k��#+�;(�ܬ��$u(��l8��ѩp��uj2J��R�����[�&�T&mɿ����Q�;d�/��h�1�}�ruݕ��R�?���*�'�0��e\��p!L�����E�!���x
u�&��\&���F�I� qD~�a�k�Xx!��r(��Du6�A�8�rAF==İƶ�P2<�?���� �ƿ��x.�rMMF��r-��j���{�=���9цꆈ�u��:�~U�X�+l�g� �&c���U���Üw �qc1q�by9b���f�}7����?�>i�~w�¬~2�/ǲgj{�[��em�2�O����px{�_X����Ӳ�Q�01�{��{��y;'����h�J(<%L�+�A���A/�6�A'�B���)�E�T�ă�rK�,?�bX\���bZ��������݌e|{�~��������      m   �  x���Kr�0���)p�ޡv�����x����c�pA2��69@��+;jb��x+~~�x�kX��X6Y��$��I~b6&�R9Ń�9�!ͅ*�L�+�Ȑ`�L��Q{�[J�@�
'�J�k��8�Pԃ���`�&���IA��ˡ�%w�����+{#w.-���F5�&��Iq�`���fst^1�
��Y�s'���/(�V���Z8�'�{�Ç���!wxժஸ��0̼���j(�j�:#����Ӓ\�h������Fij6v�r�ۡ�K�Bٽ���[,<:UD�'\�!���U���)�L�?���U<�joe]��)l�ս����a��Tɱ���Z|B&M��sa,��b�m�}�AAgD&dm0&l´��A�[��7h�.Dl�[(�Lx��g�f�w#�覼�5���!��܅}
K�BSfK���L�# ��J�������(����ߒC~e޺e^���pWu�Yl�TXC��P6gXrIQ��p1�s%�^����`�r��      n   B   x���/O,JQ.I,���ϫ�0�\3K�29C2��S2���R
R��KJ�����qqq ��D      o      x������ � �      p     x�m�]NA��{N1����#Y6�
&�QL|)�FF�������\�YA_��UUW�C`mX;u�e���0vng�Ӥ��Շ%eg��d8��N�}����zA\X��PvN;QN�$ֶnj��x�t� }�Y�T����EC�ݬ�(���'c5�_L9����3v��ᨈ��c�yw�A��m���Ϗ������9�IK�ܯ*ǟ~?�a�KG��ߑr�R�mỀeW{w���Ă��� �v���C���      q   �   x���=N�@�z|��@(��_�l�

�a�����uqzւ"
�jf����%��G~
�y�1�����R���u���H���3��|Q��%bT'�4�H��T���W�?�gy5t�R����-����\Z�p��%��^��up�k�mΪ��2x�m�ϝ�|T�M����c� D��<w�+�i�ןr�O�$n�%�f;���t��
�RB���9�`���ם�1�mR��q%,��>�;�����(�ɝT      r   ?   x�3�4ճ��t��I\Ɯ� �������\�e�ih�, a.CNN���T0����� �x      s      x�]�Q!D��.6��.w��ϱ�m*�0�1/*��a�"�E'C�Ѵ3��-��9n�����W���~�y�TQ���D��2�JvpdVE8�z����|��{<S�U�|>��
�����TQDl���b�[f:(      t   !  x����n�0 �y��7:��=A�)@T1����/�՚L�"(8�m��y�k����e����v�X!ë�Ë�Y�X��?��R�L�H�7�N7~W�T�eͶV7���� �(�[�˼-�Gd
q�BʼPeE|[��6�f�����&;6���A_�0����QUa���;�����p"��'o��NF�ޛ��'�s>��W�[D\��8���Gpp��"N���n�� �#����'�@�_�XF�Q�,w~�t(J�����px��%I����      u   �  x�MRQr1��O�p��)��&LS``�Q�ʮ�kiG�w&܆#0�CN�>,[������'����xv�����ŗ��֤*6u�G�ݐb(�V�I�Q�ŭ/0� U�74�Z�%q7����W�5�I2,����V�[�':ga�\�����B�*fc�+�	Y�i��#����q�-ӃpO�V��˟�l��#�s��h�|�a"�l�q�ewJVJ���q�[�,��<�O��9�%�j}�ӵ���h��w�Y�di/�J�w�ѯ�[�Z�<��0�	s1��#j��b��k�5�Ƌ<�R�]�%�lzwE��2�{+\"Wk@CE6�J쭍b��Gadw������in�4O�I��&4�6YM��wt�&��vhLP�o �L��wmsW��&���/�J�I����4p6��왊�/|¯�`3�\L�%.�-Ì���w���!     