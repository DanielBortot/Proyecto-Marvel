PGDMP     /                    {         
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
    public          postgres    false    217   +      O          0    25841    Civil 
   TABLE DATA           ,   COPY public."Civil" ("N_Civil") FROM stdin;
    public          postgres    false    219   e+      P          0    25846    Combate 
   TABLE DATA           [   COPY public."Combate" ("N_Personaje", "N_Poder", "N_Objeto", "Fecha", "Lugar") FROM stdin;
    public          postgres    false    220   �+      Q          0    25852    Crea 
   TABLE DATA           ;   COPY public."Crea" ("N_Personaje", "N_Objeto") FROM stdin;
    public          postgres    false    221   ^-      R          0    25857    Creador 
   TABLE DATA           2   COPY public."Creador" ("Nom_Creador") FROM stdin;
    public          postgres    false    222   �-      S          0    25862    Enfrenta 
   TABLE DATA           <   COPY public."Enfrenta" ("N_Heroe", "N_Villano") FROM stdin;
    public          postgres    false    223   �.      T          0    25867    Esta 
   TABLE DATA           Y   COPY public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") FROM stdin;
    public          postgres    false    224   �.      U          0    25874    Estado 
   TABLE DATA           D   COPY public."Estado" ("Id_Estado", "Nombre", "Id_Pais") FROM stdin;
    public          postgres    false    225   �4      W          0    25880    Heroe 
   TABLE DATA           `   COPY public."Heroe" ("N_Heroe", "Alias", "Logotipo", "Color_Traje", "Archienemigo") FROM stdin;
    public          postgres    false    227   5      X          0    25886 	   Historial 
   TABLE DATA           p   COPY public."Historial" ("Id_Perfil", "N_Titulo", "Id_Hist", "Calificacion", "Tiempo_Reproduccion") FROM stdin;
    public          postgres    false    228   {7      Z          0    25892    Juego 
   TABLE DATA           D   COPY public."Juego" ("T_Juego", "Distribuidor", "Tipo") FROM stdin;
    public          postgres    false    230   8      [          0    25897    Medio 
   TABLE DATA           �   COPY public."Medio" ("Titulo", "Fecha_Estreno", "Compania", "Rating", "Sinopsis", "Imagen", "Duracion", "Suscripcion") FROM stdin;
    public          postgres    false    231   g8      \          0    25903    Nacionalidad 
   TABLE DATA           /   COPY public."Nacionalidad" ("Nac") FROM stdin;
    public          postgres    false    232   ��      ]          0    25908    Objeto 
   TABLE DATA           h   COPY public."Objeto" ("Nombre", "Descripcion", "Material", "Tipo", "Imagen", "N_Personaje") FROM stdin;
    public          postgres    false    233   K�      ^          0    25913 	   Ocupacion 
   TABLE DATA           -   COPY public."Ocupacion" ("Ocup") FROM stdin;
    public          postgres    false    234   T�      _          0    25918    Organizacion 
   TABLE DATA           �   COPY public."Organizacion" ("Nombre", "Eslogan", "Lider", "Fundador", "Tipo", "Nom_Comic", "Imagen", "Objetivo", "Lugar_Creacion") FROM stdin;
    public          postgres    false    235   ��      `          0    25923    Pais 
   TABLE DATA           5   COPY public."Pais" ("Id_Pais", "Nombre") FROM stdin;
    public          postgres    false    236   X      b          0    25929    Pelicula 
   TABLE DATA           k   COPY public."Pelicula" ("T_Pelicula", "Director", "Coste", "Ganancia", "Distribuidor", "Tipo") FROM stdin;
    public          postgres    false    238   �      c          0    25936    Perfil 
   TABLE DATA           e   COPY public."Perfil" ("Id_Perfil", "Dispositivo", "Nombre", "Idioma", "Email", "Imagen") FROM stdin;
    public          postgres    false    239   O      e          0    25943    Pers_Creador 
   TABLE DATA           D   COPY public."Pers_Creador" ("N_Personaje", "N_Creador") FROM stdin;
    public          postgres    false    241   <      f          0    25948    Pers_Nac 
   TABLE DATA           C   COPY public."Pers_Nac" ("N_Personaje", "Nacionalidad") FROM stdin;
    public          postgres    false    242   9      g          0    25953    Pers_Oc 
   TABLE DATA           ?   COPY public."Pers_Oc" ("N_Personaje", "Ocupacion") FROM stdin;
    public          postgres    false    243   �	      h          0    25958 	   Personaje 
   TABLE DATA           w   COPY public."Personaje" ("Nombre", "Genero", "Color_Ojos", "Color_Pelo", "Nom_Comic", "E_Marital", imagen) FROM stdin;
    public          postgres    false    244   �      i          0    25967 	   Pertenece 
   TABLE DATA           S   COPY public."Pertenece" ("N_Personaje", "N_Organizacion", "Cod_Cargo") FROM stdin;
    public          postgres    false    245   �      j          0    25972 
   Plat_Juego 
   TABLE DATA           ?   COPY public."Plat_Juego" ("T_Juego", "Plataforma") FROM stdin;
    public          postgres    false    246   /      k          0    25977 
   Plataforma 
   TABLE DATA           .   COPY public."Plataforma" (nombre) FROM stdin;
    public          postgres    false    247   n      l          0    25982    Poder 
   TABLE DATA           D   COPY public."Poder" ("Nombre", "Imagen", "Descripcion") FROM stdin;
    public          postgres    false    248   �      m          0    25987    Posee 
   TABLE DATA           H   COPY public."Posee" ("N_Personaje", "N_Poder", "Obtencion") FROM stdin;
    public          postgres    false    249         n          0    25993    RelacionadoHer 
   TABLE DATA           @   COPY public."RelacionadoHer" ("N_Civil", "N_Heroe") FROM stdin;
    public          postgres    false    250         o          0    25998    RelacionadoVill 
   TABLE DATA           C   COPY public."RelacionadoVill" ("N_Civil", "N_Villano") FROM stdin;
    public          postgres    false    251   b      p          0    26003    Sede 
   TABLE DATA           W   COPY public."Sede" ("Nombre", "Tipo_Edif", "Ubicacion", "Imagen", "N_Org") FROM stdin;
    public          postgres    false    252         q          0    26008    Serie 
   TABLE DATA           W   COPY public."Serie" ("T_Serie", "N_Episodios", "Creador", "Canal", "Tipo") FROM stdin;
    public          postgres    false    253   �      r          0    26013    Suscripcion 
   TABLE DATA           N   COPY public."Suscripcion" ("ID", "Tarifa", "Descripcion", "Tipo") FROM stdin;
    public          postgres    false    254   �      s          0    26020    Tarjeta 
   TABLE DATA           N   COPY public."Tarjeta" ("N_Tarjeta", "Cod_Seguridad", "Fecha_Ven") FROM stdin;
    public          postgres    false    255   �      t          0    26027    Usuario 
   TABLE DATA           �   COPY public."Usuario" ("Email", "Contrasena", "Nombre", "Apellido", "Fecha_Nac", "Fecha_Creacion", "Id_Suscripcion", "N_Tarjeta", "Direccion") FROM stdin;
    public          postgres    false    256   �      u          0    26033    Villano 
   TABLE DATA           E   COPY public."Villano" ("N_Villano", "Alias", "Objetivo") FROM stdin;
    public          postgres    false    257   �      �           0    0    Cargo_Cod_Cargo_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public."Cargo_Cod_Cargo_seq"', 1, false);
          public          postgres    false    216            �           0    0    Ciudad_Id_Ciudad_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public."Ciudad_Id_Ciudad_seq"', 4, true);
          public          postgres    false    218            �           0    0    Estado_Id_Estado_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public."Estado_Id_Estado_seq"', 3, true);
          public          postgres    false    226            �           0    0    Historial_Id_Hist_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public."Historial_Id_Hist_seq"', 7, true);
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
       public          postgres    false    257    244    3418            J   $  x���Mn�0���)��%� 	5�[t3�����D�q��9�X%�VFQ7�d���{�z6�,�f�^�B��)W�[ojZ�Ţ�/fVьp���)P6�/���RhI6h�v�R"n�p�X�?#2�����MF����2���D�A\��Q-�PHRpSt��hn>� h��/��sS
�<�&ݰ_�s뿚�N��x̱w1-%�~��H��,����L��Z�:�i&b7�P������Cx�@���K��Ѿ�}s2�q�^0�Ӛ��ڒ��\ns����(�?��      K   9   x�340���LI-�240�t�O+�KIL�q�8�S�JR�Lc΀����b�x� ��      M   O   x�344�tN,JLN,�44�244�t�,MILQHIUp�O�/I�44�s��+����s�T� 5� �q��qqq 
�a      O   -   x�s�,)����/O,JQ.I,��
H-(H-R�/))����� ��      P   �  x����n1�מ��/0�� 
YR�DT@h���������BަK�}^,����L��%��;���+.�%�F���+,��.@!%
gd!9r6���Ұ,I�8i��{�&��w��h��\�W�����M�dq�	���w2��l㾒Bs ��ܡY�1���D8�`0x%���d�Hҍ�r����A�hH	C����I}�����^�y�������4<wb-��n����?���W�Ǖt��z��6�,��Xz��Taf���2T
��4C�!/fK�ݾX����\8z��+�|D�B���3A��+/l ��?.L��R��ˠ[�{d;N��,e7�9��EiU�Z{�~��TL�rZ�:<�Ei���v� �M9�vKjo7��Z����>�����M�
�����w�>���B�H�A��թ>�~|�������      Q   �   x�-̱1@�:����	�D�(�ј$�G9��P2�-Ɓh~��R��Wj7�֠�F���]%n����7�z�)�*��*8ܗw�@���._Z���c�>(��'3�������*p� ���.�      R   �   x�%�An�@��yA��@�b�\�,��Z{F6D�=K�u����L{@��jO\�w���M�)=0.�tn�������&��O�)a�l�U�t�[Z�����4>5��$'�U����;k�A@�<��]d�h�c-.;�zH�`ƫ~鑘�5�D��}�k����f!��ߎG�      S      x������ � �      T   �  x��Y�v�F]���]V��d���� 3��ɦ,��Z�>��7Yf�o���6�KXH��U=nݪj/���ܳ�W���\/�ɉ����z^Y�
σ�}�id��l��E�����1 g�����q�E*teb'�z�B�Rg-X��3�����D��:�O�)��-'��S�%/�q8��^�B3�W�����߆N�����DӓS�8Z�Y��|ͦ���s�2�s6v�<��ĥI�)����=]�p'�Sqj5tQ�M/�K}K�g�<W�δ5E���yug�r�� m�14��\%�=a�˕��2���f�n�\ʦ9{�6��J-EH��#'���A#(\}�,�t�T��"�0�<)]b�l0a�]P��H�b����<#OJhh�E�RRf�8��m
/�f��`�o{�ݖL�m�D��V7��~�a�F�36�і\(�n�w#�6�x�ąc�����zP�%�M����@g�OY7�g�(+Y+ݓ9�� �TA͐��]:����geb1A�!M m�ߎ��|B��0ڒ-��ٟ(��
��PJ(�VH�(�{�Ю�S���{��\�hW
2U �4�%k�����ӢKέ���|�Bs�#/�r4r��= #^�>]��)�t���0Suf*JZۿ�8`�����5��~�T�{+(V�%���R�I%Q7(C�H
Xg�>_��mP��	��Sg�Tb�["�@x��FN6�]���^��n0!h1���*o�p���ˇ���vS�`}���U=y����`Z�i��t;l����Yg���Y�>�3��m�9L���~X�*2�=��f���!��P�?{h���ԡ}}��)��ϟ��;���s�]��It･��#]eq���S�����je�I}g�2i��/��X/���l,(�>�T��P�q
�U��i�(ۧ��բ �Ѭ\.Y�z��q��[j�8���q�A@�`���a5�q-N��$ko�h>޶mT
���^�ѯ�xm?���`�N�J�8�{�=t済6�(�E�R�(������*�:
�N��r<
�V�>7Ɋ󶭤u�<�%��o��B�n��:����s���|��w�p�L��"J}���c	�=��\[�RCs�a��A�q�Q�\���*h�*�b��m��6t�@}@�,���?^5��>�c���ܣ�nx�KO_%�G@V���{/����]&n���B�=�v���һ��}񧌕^0,=p��1]X�%x!��)�Kp����!t�oتt!�q�9i݊�� -]A]/��~TE�yi�������(xW�=�J�Ƭ4�=���Klt�TF���pW���:7�*	��Ròr��WXb1�;TY�h���_
���!\K���Q:>����4�Ŝмt+	�%F�`x�<�(���+�����t�F�aֵZ��=b����2�G����K��zmG��}�>¾�h���b�4�o�"i���px�;��f��5��� h�v      U   G   x�34�t�,.)�,�WpN,�,I��4�22���,J�KIr�8����K9����8}SSRsr2�=... ���      W   j  x�USKr�0]S��:��dѵc7q3���$Yd��`�Ex@ҩz��z�\��,��F"�����#�V�"p�~2y��^WjKo�[=#���PL��Q�G�j-�%�98���/;�x�����ʚ�}��Ur��'b����:��Ԁ/�G�W�k�v��,��0�1�jA�zN�cT��N��c�L	�ܨ�5�^&τꑸAa�C��yj|��뷳�T��ʛ��z�����������V�?O�Ά8���|U�r�{)�|-�Ct�6��P	'��q�w�ۭo�l��'�[: 5����֤�L���Or_z�8f���{�3Uc�(C�Q�L�f�X�ɺ!w�i�|����ⱒi�K�Ţ��p(��YPm��[A+�*�7Q���ɦ:��IM�Sd3clk:��z#�vG["7#i��j#鵉"�z�_)+/��^�Cc��HH��F��_�~�~	��2�V��e�3�����.Z�g����!��)�筰�Qm!�
� �w��7�jHf�KMӍ��qtD����W���*�\�J9(�콐3O�μl����X'
 ����������HjY�o7ߋj��ڄ:������Bz���ׯEQ�
��      X   �   x�3��,��S�M��4�4�440�2Cq�����B
F��@�� ���Tϼ�Ԕ̤�T�Ҝl��& ;pI�� IF����q�A2�tN,�,9�0O�1��ʢ��D+��������"��Լ�Ĕ�"Ns�r�=... H�8W      Z   @   x��M,*K�Q/V.�LI-��M���ϫT��+I-JL.�,KUp�K3�rS�J8�]�b���� y��      [      x������H�-f����d�����Z20b����<��\�7~C�zr���Y���w�P�$��g�{f��MI�/��.�A�o���~�]ۦ���1]Ӈ����3�������k����4�s��4)�suMцqѵ���e8�Ba�$�%������_�/��ߤ�k���}�I�!�A�/J8���˜���_�_�����p�~�Zگ<m��)�k��_Y�E�s�6)�p��+������<����.���}~�]N/���}=���U$���ŵ_q�DE��W<�!�(��$�)�\�,#8��t�Cp���N���Mo�4�)�3�S�+8���>7-_s�]�����Q�=�t��qJ�@~�]/��.�߳�_MX��������g7���;b0��Cy_������_ ��/����>�J���q����U�?���4�Ǵw=��$L����/}:~��	�*@d��?�G^�`p��� &�`e�2|_�L�/����Uů_�R��G��۞\��;�����5ߟg����ej��1�����L�������?����,|,`�+m����-�7�wo�s�J��.�ɶ��}%�WT��L����Ձ��)M�}��zy����5��t^3�s��~���Sֽ�
&�ޞ���K������;Ț����e��|�����"׍y�(�?�g�ΖW��_�|�	�^���`�_���6��bK�wF���`��҂{��
�P��F~T-��ͧfa�����uf����=l��0�� 3��!pe� �.݀�ݘ�J~�~jdߜ��Q������ۻ"����F����@��O��Kۛ߿l�`�-p(�_���O�����3n�	p
.�'%ߞ���P���2��.|�q�p�!�ޮ�dd��g{�7�������*����{#��1�_�w$��<A�;�\E�v�����t�՗[$�
<�|2����UP'�3���F��5��c�$�j8@���L�¿�}���WN��B��V���!~c2����;���������]?��O�_�ވ<".u�	�Ҧ�5)@Q}�.T-��eܿ]�)��.�G5���_7PzH�O-�?k�*���`� u� b��o@!ᯟ@���wf������?!�˿8��������C�����Ec�*@6�ʚ~D���wf� 6y����h�������w|>H]�M�#��$�hݾ������j�d��!�~����O���|�Ϙ����#����.P@���74�?C��ɪ\��Y�˹�
pT� ���m��"�N���+ ���)oo���曟~@AڦM�̚�����~�̀���q��7ӽO�E2�c��~����{�����ic7��o U���мÏ̜����+UT �|�a�����^�7@90��i�Q�&i��#>���L
���_p���'&?����\�DȀ<��m��?j��������^_e����I���'� �A���$�'E���0�����2ڏ��۽�D�V�'���\�;w���=?���}}1�?|�	������;���w�������]�oǥ��u�x�*H�?G���i�o<�;ϟ��$�h;��X��&>��w}"���+.�*���l�we�?	(�}�u���o6��p�� �T�ퟩ&�u��7�� ��Z

�K_����8 �v^F�#AA�᧪����������P�Oh��ȗx��*P^Q���]|G(������ӄ�B�W@���+i\�3X�0v�������H���`�8L?u�֚ӧ�_]��O�xgK�#h"�W��l������95oZ���.���_߰��2���n罌�z�`	h���yǭ�L߀�����˿�E_�w�.���m�O�џ`��x����T��1���(�֠���]����7���w�S��6��_o߿	��V����~�������Ĝ���~Kַ�m����?�E��T�o0��X>���7}
���7r�����!� ��{����C@n�y��c�t�T@��	�� �����|�˘����9�6c�#  >߬�<�eJ�����ۥI~������������Az~wߠ ��.�/h*@P�/���wM�u�	>�$��g��J � ���|�I�w$�;���D`�f�?��,`�WM����O��0/��Y�1�m���'3���6���{�O\��D������e�9h��=#�-��@��M�O��������]�?8�2!���-� e����sL�Ã�| ]~��_(��sv�6l�����"~��O�J��������C��7�| $I�`����+f�^�;���?����Z�o�m�4�t���������6�aЋ��4���K^��� $
���S�����9���a�� �~��g�����.��oL��g��[~���_Щ�$K���>���(�R��|-�(E�f܌��)����{FV���Ndh���埶/�y(�y*+8�ޯ �Bᙇ�ƒ��"���օ�2o��Tˆ��&tv���T��YjU8��ŧd
�=J��,^(�X���ϟ����)֟� ����ϗv�(��(C��U���b8�c9]<o��Ѵ΁���X��ҺO��3Gq9��DS������~.cQ,MKOEwh[��h.�����f�P*��a2Өm����(fEro�'7�<�:%�`ʕ����Ma�U������{��%D��Z`��m�&q��~�J}�:0��:�``�}�+Œ�;j�x;�
�������ӏ,��BQ�7r����Mʁ��1!���E����gC)�N�f�P̓Q���j�/�w���	��,��=���T������]=&�d�i�����]�ܞ�9C���IwO���}A��2�jS_�P���k�Te��2���D�y�q�B���Ր��Rߑ�1����5F����ye��1�V���)���I�����3��<i��|���"ɱN�7W����mq�!�8'��M�,�ȶ}/j���'D�g��n���%@�[ۈ[�<���o2���f���R����^���.S� GLe�T*��t���X���|�@�>'�
Cs�DIۮ~�	��i���<][��ZfzT��q�C7su���z����T�Q�k	_�y�����@��~�����ܕ�c]=L��������pk�L�@�]��M���5O�Ŗ�F�ϥ��̕VZ	Y"C��ꋽ�GO`���aW�+Q��c�#���K��?��݃�гG;h`	��2�tk5l/�����F�ѱ����}��KM�H��$%L��X����9��6��=�������ૄ5GI<~���@o��_��c�팽�3�h{��s����^��v��U%�y��	��2�h��{�.+3���#��c!��8[}�w�C�\�nH�X���PҤ��2�׭�3B���e���T�ŏ��q�W����[83[ �M�<��yp�1��)χ����q���l�T��b��3����ģ?����DpW�6�I Y7(��<tJ�b̊W��� ��}�K��{�51�m?M�}�<��	����&O;	u{���R��Op���4���O8��H�=D�}�E1��-��V���#�"��!PpL{d����pd�٩_j�;�a!�k�FR4e���
����q����G��<�����Vj�ܼ����6�ӱBS��B����F�ե�#B,hVD~��1�/f&��:���9�j�=�\�u�Xܘ�!��SEq*e���(ۨnT����pvy�
��¼�_��F�Ok�S�u+��B��� �si�u*d�A�|�(���_�N�V���M�!S�`*4��}�9��u�ۥ�JsD�"�H�r=�;�c��0�"�e�zR�M2��'#��M�
[���γB�v������0�tk�Ν��R?y%����������'>�+�_e�֤8�    �Z���<��7
��hsU�D!�4��N�>��e�p���7� w�N�B]8Z_��`ccr���������+��ճ�F��嗤^��L�d<�2��3r�s�A����sx���}���d�����uZ3�]���O��9R���_�'OM��Y\�T����g�;/?��;bq`��|1a��W�bgL�m'u���e.K噫`}O($ZZW�E�}�yE�ߍ�+�x���8��*8<LI��.*C���k�zN��~����gWd�_�#�b���J�#����4-,�#,����霽��Fg�>;E<����U�'m*�E��F��_���,R��Hh���������t�^6>}�hB��~��� ��}ڕ��YKjZ'�d���)U�	�D��T�ԡ���ef;X����������Z�L����8�g���E�y�+o��Qt���9]�D�PIO��.�T�!�Q�^���Hk�ݭ���/v��,ށ�{N��B8�x8�#����{���U]]� ;�����oÜ2�;M3�P�	�o@�e����ǐ��@�q!�g�ϔU��Ae�K�0骡7蔫&�++C�A�h�J�QvK����ژ�`�S�����t����J
,Z��O�{��`aL��n�#ݕJ��E�M�oq�y��)��RfR�~���U�'�T0kyNk������iSs�p��8�j��\�{�6~p��"�B��
�|f��=]�})�K=/���26�0� �
JX�8<F�$	��bΑ_�?TMeG):��ڈA?KH��cwI�2�4j�as��/$��6�к�Q�Y�M�{������_-wo�E��H�(�a߻%�lʹ�mq=��;]�QVH�$ �@^q��h]_E��,{�W���b�#Ҡ�rm䞒����1�o���$H*h8��v�tf�l��#�Y�kH��m§n;�$GT�#� @�a��	Pu©�Է)���	R^R��Ļ����8l##�V��^�*�0��Y�9���$j�FV����_`���84B���	�'9�&��%�<Ց�����TT,U�ૄx��&��b���w�����7��/5�H�P��g�h(˝X������b'(}��*��F'勤BU{]����7�)պ�Ƽ�e��I|�Wu��!*0݂�6��@2y�y�'�������\I9���$P�v^��@���$~��Eˌ*f*�`,��k3�D��9�I@s@�S�i�xrB,�CI?%DՆ���N`x.��Q9��4+�a�2N{��KL{7�y�>ͱ�m�!�Wz�F�WB.Z�or��S����F�}1b���(���E����iq��k��\����mQ���=GP��/�;@,�5|�B��U�Q6��d=`�T�HlǸ�FJ�\�e�p�H�J͢LuE���Q�{��̀[]����"S.�Y����P�2H.ư-���s��[�2�DlExt�h˦�~y�b�6�a��~���C�u� �[�4h�$m�畮rSO;0���vI^����ޕ�й�����3s� ql�2�=%��g���JɘV�\�b���fbS�Fj�-�0��TExdL�a���.=�q�����&��m�z6�@/���$CP�+�4�p�MN����qq�����`�ۜ�h�x�
A�e��kS��z�ngy$G�C�����!M�,W�=����P.'uo�L�E�H�Lgxy�j\��t�M��m#ih����&�
��9��y�!	WC�|%~N��E��D������u!��n�蜈���qG
���8�"y��&�����w��q�t%�v��Ɓ4�y;T�x2�,a��n���,e^8�HCX�f7�N�	�V;FHk�*Z�R�[P��nݴƲ�l�s!�_��i���;�U��,"BM�t>��3�[]W]�/��rk<p���,t�AF���>�J\y�l'2�ۈ=F�:}�{_�"� ͎���u��|���IM{�9˖vｪ������V튚�ލl���)#V��h��̫��$:~:�-��-G#M8�2Z�Lڟ�L��r�zp�q��s�DC�;�hHf=�k^��I��	�EO�j���2k���6\�\,��m�0�
��:D�K��z����A�x3����@F���Ҍ��B"�J_�&�vX�7�����͒�X+�G��'w�f�.ECyƚ�9�w�8%S����U�Pk����0.t�'�ػ���
>(�c�v��v{`��ًOӀ����Yw9����0S��L��z-5��.6�+��{v%�T� XC�}��a��}�㋋�,-��Ʌ=��<^G^�+�L��BKXH�j����?uc�X�jG-.� �ӭ�g�����8,!���G�R"�Z1.M��䵲��L�q����fJ斢hA��h��0ǫ�Z���ef�;V�I�%��j�Q��/�u���E٣�̜2+A��=���Ҧ��<Ц�NN��j!]h`[���fg�gI ���
O�dY�{�e����L1'&6�ϸ	�Y +�O�]{�i�{p9��(75���r��1��7,ڳTe��v 3 �mP<�X�v�X��/c{��n�v���̽4���={�$�=-�Ŗ������wte�}#ҵ�Z��R�2����-�@^3����z<]se&�2���ܰ�,l#�PF�|+ P�iO�H�RFU]J�y"�i<	(\w%[[�g�c����h-j�F�}3	���||�ý2Ij�d5��E�j��vJ�[�����:�/4V13	d�%m^�܋UP"#)�+���1��k�;vn��Vuho�PO:x�n��~w���f�C��E�}��!J	�w�Fx4���_W����aC+�UD*�4��]ڤf�(>/���'��9+?�{�j�ʺ%�pCj����F�e�5�n�������5n;�j/,��h����6���l�@a��3(���kA4�,ip���Cy�aQ/��Ԣ�py8-�؞�o�AVWu��(-K��)�1sxu�/3��������,�wB%�U���e��R%K��B���F�K�~-��a��pE#7�g#�"Oe[�%#��zjt�>�>]ͳ���r��xHB&F��E�mE�����&�8�|XN��!�*P��U�U�]:��j��jgأ�O�����s�6ُ�	�Sl��l�(�������J9�޲��V	��ݡܐQj}�A�/3M]�NP�>/n���͎FދA�A�\��FҼ,�#o� �(�90à��'h�wڊ��c�:�o*�ת|��(�J�j�^���!�,Ve�����V���G�=��"Pw%�a��D�4���Sa�q��tр�f�ya|��	�-t��Ʀ�c4`��na���Kd^�"��>'V1�u��͐�F���i�K��Ut���>��Q���@s�����jR���B'�u.�6?F}� M��#O}7��cň��D�95WYc7B'A�9�.b�(Ѥ3���!J4t+�bA���I'���E׺�#��ٕG 1�Si�S����1�;���r�N�t!����ie{Q��1��3�ǘڱ~�mú��ξ�j�X�߱,[Sb�;E�}�Ez�ugӉ�h;��wnO/�v����2���WL��d��8�n��R�1��4��va�=��Ҭ0Aq�:������
X)8W���a3��g4�c���lY:�^�E<���)n��xb_����fq'�@��Q¬<�/UM0%��v�U,ю�V��R��X�9)a&��s��I<Bq/�'xr�[�GG�c�Æ�~b�cx�Ռ���]�`���Rf�N�4�W�O���a��(Y�����5R|I�y�:�V�~�T�}�,�;��{I��dZ��I��w��ڲ�"���EX�M�A�^�9͹�}�8�LIO<߅H+dL|Ww=b+����2�除^�����#�X~�.����&���g���_6���g�/���X�^�O���͊dzE!�H�SU<""�aOwWe�xPq��]�4z枫�s&�Ch/���]̼0�q�NB�_�C�(R�<3�=�<=�"��:Rƹ�b"�b\]�Rǹx��4�/A    H�Q? [̜��p�/���+��49�o�c(�}q��3IVA,w	?%�k�b���f%�f��X�N��&hI�����ˤ�� �A�ӫC�ӝ$�b����J�Շ�G��핀��R����4+���z�����Z묓m�x���PZԁ���]/&O�:�W���1�t���cnw~|��#L�V?P�8<[����1�^�% H}�B'j|5�����\�=��� Y��v��F�*r��B���0��8F���$T���W;��~�߾�!���3��H��u�����{��w�ɀ�vһ�W�/�z���^{~"8%wB_�Js"JbĞ�QKWإ��$x�_.�g]��>����~{ɩ��'�U�#ٵ��
�e�������
&���0�B��FC^']����ǂ�(�c��\�U�����{`����@�t>,,�>���N�)q����F�0��[Rðo�0%]
�J��8'��f�!��rɍ-=҉��a�kĶ ��T��}-�HP����W���E���S�_Yq���aA�ك���p�����l����\�0�!c�R�扊=&��C#�3�Mz�{	�|K^<��I��@7b<�`���0��Z/Og���,��*{���	��P�/�M�������T��ᓭ�'����s.Rt��t(I�s6mU������
`��!%hX��p�$���v'��SiI|{>���z!f�2�[�����v!�|ڛ�	�9
5+>��x_{3���+E�sn���yR��f��q��ĮZ"�8�	ᎂ�T{`gw��!�/���T�O��\|-`���9Y�!\hq�.���ԟ��Cz���eK��D*��Uz+&\l<߿M����m����>%�e��zi��n��UK�{������.��Mh�RӜ��7�F��V�>0�����n�6Apq0�����"\� �����zƼU�{h>�8���v#��{��5J�i���/�Tw}�5�G���wV�(Mԯ���h�u��-㏇q�5@��4=v��֍�[O��r�1S}1m,n���B�;�"����[��ک�=���d�aΝ������g]d�.����W뤆g�uY��OQy�^nAWس�w���,'����P�`�gQ�@��@�@��$z�%t�Rw�{�R�6;20���8�ީ��^,q�ؘ��{�+���]CS����C}Aq����+�0\m��M��)y���A6v�	n9k�悰@���;Ȓ�6:z��h�N����n�VQF�t=+NEXN�Sw�rq����t�簘��S�m���١jeKxV�&^��{���`릊�4*@��r�\����n�&>��b#�]�*�p@O��B13LR���Q��u�D�t���^#�C�]~�d��_�T��n��A^o:�q��փ<>��C�D��������D�?k׆#?���pl
�6<,*�x�#��b�v��x�i1'O!�;GZ{�=�#��@8�īT7�n�{#i�ny�+���E��	�?�9�B���r�������YpN<h�`��NY��.�E�����}E�o������ �nC���T7��(�x�ͭa�JH��xI���{E��/�)�l��P��3P��\�C�j(g�C`j�S���Ζ��GgJ^����5.���Rʙ�0ZV��\���j�]㷺W�*����>7="���P/�Z-�>�~�qIGC�N�hhw�����̅'�O*'��Fm��<���I��j݋�l�o[��a�ɺ��� �u0-?.��>�N���P2����*�?H k��'�_�l�Ny&M����5����~'G��������$�5�P )�gqpA������,MS��b�e�K���Zb@�֮�X���=@�N�`Nv�J.����CX�7����4�?���_���gG�Ki��\L���P�<�>���6_֝p/r#����Ś��+��u;�����������N�{+���]��I�������o�}?Ց�s��p���<T��Os}�f�<��|���~ ��(T�>h~>�|?��}�{#b:�|�e��W:���߿�?`�x��ג������4_���q�l;��N\����5�-��M��~?��Y�?m����������{��g������2�/�gw����f�S���|�X���?���F���"�������S$���Kt
[�FI�ZIտ��,��Mt��!��ծ����u�s��)�� ծ���xI�x��?���/}����k��w��"9j���H�?lD�h]bi�����?m��������eC�y{O���\Me�G� i�Q�[Q���M��n��*�m��Kw�{�%����?��������14e��*��R�j�6��i�P
��7^�t �|Fz-oP*n���7En���ym�,�XXUX��;�Εu����ȕ� tX^0��r�T5J��OwZ[rȞ�P�����K��b�}��O^�I�iF�Ƴ�/4��k�aΙ�Sn-=�E���\�����U�~�*ۉP��Q�	���@���zR-���z<[����-畡�k�����xViq~��1�ׁ�VR<�� 2r�έO������%a]�����Y���P�V���6)�~7��D���ҕ>���1S�fOG> pA��
�B��D��J}��;����(�߁����F��j~y�ZQHF�oq�z)Igw?�:B���{I���
&r=�;ꂡ�Q���u�G��0��ļYq������t�LV�d_�����)^�.g
�J�=����6��R�aNm�6Q6$�:_ػ��r�`�c�U�HW.���T�����3������q�u��M�^����Nq("��g@^������Q�C�v��I����<@]���m�7g ���k�J����yrzH�]�GZ[x$"w�71#Y=-��f�s����ط����R�u�ق9Lk;�=�JW�v�'x�������|��m4_�fv.��;���;;�y>��&اU���mm�6���i�D(W�6��?�8��in��H#�IMyx��hI�W�����f��2s�^p��*|*Nc�i��/:��S�2����Բ|�C:"d������c����)�o�N܈�v�[LX�������Sqf]G����C&�̝�-e����ZI|%��+�r!��-j�kߠ�ؖ��tȫ�@��s��a�ޡ�e*eȯ�+��0�5O�L����������D�E���b!L��Y�$c��ݿ��wܕ�%Aj�V�*34Q�R��y(-�/�e��&@��J�)�����K�P�r|y�wol��δ��J���k�cT�W���C���6寔E�c1��담���%0��^Q��Џ���N���?o�������CI�X)�̓�l�k�r��@~���˫'�A���]4
�e��F7v�QL/�N��E�c\k�4��_��	.{�{J�t�����Gb9�r�on�,�e�R̢&���y��ųҙKJ�iY¨���-L4�_D��7�̰]��l�M*�m���ru����H霒�T}��jR��N�H�K�����p���@v�&ц+��N4)
0�y3�;p����D՘>E�DNir��q'�~5sZs�c�:J'���N�i)���B^�9W�@8��2vK6"�~�����?�.!Y�\�7r�l��n���f��V/����b���C���{%�H<"m2�n����$8l�RcO��Yz���9\����I�7V%D��L���<Z�*W62NwU�/��v�"w��A�H�Q��R�R'�Ą<In]�S�t�@�v��|m.
X#��UۊeA������%�_�\�;�@Ħ_��a���S�}�O$��.7��⡴�����!��W��=�WY��1҃���r|���Z��Z�n�F�U �9�	l���ĸ����vg7`Y5�)�U49��AZ�I���o�K#U�KyL΋�a����H�t�G�0��E�o0�3�à��p�o�YB�U(|�v�4��5��Q�(�n    ���񂇣������oV�8e�Br�/���E���ex���%(���$�ڝ�I>����E�[�v]�c�DG���?�81�V]R{���a4oC�+_/+�S�g�b{�A��k׼Yv�`�gwN+�	�2�q��tL�� ksуT�C1�'���`��A������Z�o7����Y�o�>\���U��!`��y{���n�'���V2�c�u��aF��4 ��K��
xhP��>wsX倴��h"�gmiE�|%ψNn��k�B��!�E���*��}��vTX��M-�4�M���4D��u�+J����T���K�{���S�a���a�Z���c��CY��ީ33Ժh�)w�ڰorAA���-�U	P��:�nqcJ���]_�^�:Oq��J �^�{��������Y�˺���O�C*=jB�
��v�/�W8��$|�
��V������xs�G\�yvm��l��LR{Y��Q?7�{�ɀ7���=�rĠۀ#�BZ1C ���Tã&�Ar���+�0�E8a]`�^*���z�ŋ��	��0�5?�q�&d^CC��	7�^4Q�gS�[�.Q���Uj�͞1��p��-��+��~���S�֛֛wV��!���V����?bC���'Z<�HS5��yYo���Mcg�L�!-�-Dw�
gw�ʣ%�Z����S���w�r��amNб-�0������u��o���*��)@N.�ؖ��a^	4���.�{��j�T�̥�Zedi=�C�j��� �Y:F4�W��/\�+[�����^��?.�Y{�p���_!!��3���=���7n��]}w�H�6=3F��soYŋ�eB�T��� �Q�ȼkZ��?D?���S޾n�M��SjR���6���&��NsWLA��@vĤoN�����2�2�!ĉ���}�\��I��B��<��w�F4%á�k/��IYޖ�"�!ii�w��gZ�x6����3۠����fO���f����d�;g��h��C�H����DƐP��r��N4�yJGC�����M��A�z��s�򸻶����UN4��	�ƧcQ���U"q~Yd=-s��Wb���n��
���!�j��d��ɖݖ�%�mIB���0�O�,qTkyښ��bD8�4=�l�#bL��Z��0���P]�����U#���w�W '%�=�摻,�c��`�n&g�p��~�$��A_i(+��u��\ag~7!/����E%�@�^�]z؍r��댥�����A���i"y��2Ksl�Ϩť�(�!��r��ͷ�2��՞X����8�t�0L�E��@i%�)�ѽ
�/yiK��x�bC@~\��ع�NN���k���/6��y~y3�tכv��l`�yQ-�;h�L����Tsmön�`�����e`���Ӽ��W����׃�qGR�:O,	&�����Z4��P�S�bw�脑�2�֡A	�����\GaL\���3�u�׾k�f�Rj1g҂�[kZO��1�ċ
z�{�W��N�SF��`~I1�\�"G�@l_ݨ+ �L�(l�s�HX�@�F3�ٖn����v��Xc�q2�4�#�`���ҵ��h�Cb@��䩈�}�@N���!�S�F��b/��O��sx��J����r�Ƚ> ��M��e�[j�2�(QkŒtI�g��Ud����ڒ�#z���1��c��k�c3j`ӂ�(���Y"��Rʷ�e�i�2P(!44�
��␮�{4�� �H-2;_�R��U��"
[����m��[a���c7S��W�-�)�L����Z�`Ε��ڋO՜�F
ڞvo�ϳ�lG_o��Y��2>��C��K�9 7E$������x1�)��EQI�U��#?ɠ;�+
���q������!�I���6W�ᮂ�Wziײ'o7�6q�Yt/TY�������C�7H���l5��A�'����̠Y��J�e9%��k0 �����zN2#r���}n9���(�#L�"}�,Bz��6U���@��:x��]K0;��)]1S����Sꚱ˸%�h��٤ք���q�%�����G��ڒ%�����-�Њ�3h�5vSk�5��TU��0,�F����G��;$�"3��VA���!�a�q�	�����n�p���2�"��#��(�F�'�r ����R����V��)�jI (��C%=�l4`� l�9zYFgT�T�!(|��;q��Rd�L`�o,���O�e����Gү��vx���8�z���"��5h6k|��-��d� ����$a��M����:"
N��pQQW�bӆا�5X�?�F�!�/P���x�o���������ʻ�=&H`���Pi��5iN��$�⯗��K�rN�$�
_��^D��P�����uŁ�>�s}���'�	�om������&+a1Ʀ���lk^��q�ؒ�)��2Y}AO"0B�=$��!����2��J $�����S��!�Fj����Z]ҫ�Z���2��7�+�{��w�'u�6��E�m��z^��W�(��عI#���D�^#�~ux�嗝q�j:�+��"w�,��S��U	�:T}����~?3�7g����WV�%
	HRs�+T�V�>)�,J��� �Wm%h��HU��=uCaI�{$-�/C>�V� ��Ȁ'�B˂�4c��W���زg�B8�ζ}���@{��;�Y�_�Zc�D|5�ȃʰT`n�Ý2��\H*E��E{����������u7!� �l�U�������d��A��F�F�15��4��m3Str���� T^V�h{�G]�y�:Jh�LpI`+�>K��T����^�
l�8�bǋ5U��R�V���O��a�"+��$,�s�a<�������`��]�`Mp{��q��u��4_JwA�I���RS�ܸ� ���b�vh��!�cCbH��q�_�����S�49�Ōd���W�s*N��B^�
ݟ�\ћn��� -h����	Ŏ�r�u�$�����jZ�����/��<�|��ǀ3� (�����D��ʘP�cq�u�������zx#�vP������	���B�qN��� |�r1��3���ð��%�,Le�E�>baJ	�E�Q���J݂j[C�W�L��a[�����1;p8]�!Jk��C�_T�K\�&�F������r@��� ����5*p�.��4��C=(�)�ߝQ�H�~H��Z��q:	_��6*���7E��j��M�q�*�y��"	#�����Nn����>*>�[��AS����Q������<�+9]G�7 i<\3P�ap ��"ޘ��M`�V�.�9|`z,�&.~������z�����QI��z�7���_��=�_'v�࡛i�8Q�A��ͶƠ���c�TA�XS�ipq�G0OM��z#R�T"{����^�7 �R�1 G�Q	\v^�6�- q�2iNH�B\߼z~�Z�����e�����}�/ڋ��]�,�o����8��pW�ި���fS�,��|�}`���6K��罃��4��G�������k�[�0\Ԕ(B�-I�6�~���|�E�쩈��˯��33GGsl�۹����{�6��OgOqC$s,İ��RK�l�Ձ�5�!D	å1�7~~�"A ��3xB�8��R�yʿ;�,P�RC��b��qL@���w���/ѿ�_��/ЪG]��K�=�0cA�,�8M��C���o�����=7�?�X���[��X�3ڨЊ��ܿ>���ȝ�;��ʄe����u��y���Ymr�F{�r��f��Mhvԭ)�`"�X�f�&�{��b����k�:W��_�X�k2v��5���S �`�/8wr�Ӛ�����$^�y�J}V@�|��(��OQ0�8F%��{1E��u�������#��]�k��a�h���釈-0fڬ�%�2�k�#�"�5��U�g�T�<��5�� ������Ȃ��՜�\���˝�mj{�by��s�;�?���ȦW@�,�KU<��Z^9�rJ$˰��LR�$��-&������5j��P��T�*SL;ĭԣ^�4��0    ����3�(�k�W��5��j�Xl�����b��[�m��9�kIkջ�qf�5{��A$+���ʪ"g�@��:_A1����_UF�чWw�'����z^{��_H��|�A��z���7]l���&�%�g�_��(c-���"��-���[��ob�Xur���Pw��,rjo�{~����ڐ︁�%�ڶL݋S��O���c\X��G����z�i\>�?8U���u��0i�wRO����N/�?�'����6�����ϧ��ʙA)��
W�)��J.M	_��P8���e�Ȩ�{DhĆ��~mM�"~IQ�^�`@n	�,P3� �+���H���Ն�x>� )���FBy��ٖ6�&��ć�c�I�5/�K�y�����a�혤r�%}`�ݺf���������1��a`[z�{�t�:�r�V�n�6n3��W]�Jl?۪�YbTm�pǙ(��I�=o�>DU߂���ʙ��@\�l;���,�e}� ^]iy8��
�ο+%q�8�M0�y��gȓ����!��3~m(���|3��_BS%��.jQ�����B���qV�,��9�޷5j�����T��`�u�e�Ζ�����:�{�r�M�{���AG���� !/�������������C#��bD4r���Of��G�������1�a)���������wj�=*~ӥdQW�T9�����M8���ж��M��щ'-{�".�7x�ou?5mK�,Ȏ$},=�907��#9�GC���I��I�f�^�!�7�q)�j�ӭ���o��zR�h����4 �S�ЏM���s��:�~vPƝ�+���#���m���Y����(Z��R)�jN޻�U ZX�o�@���GxEtWSӏ�h{�9,�5W�
�|ݽ�dZ��<֪I�;��ă�Y}�SI�f�f��LӆP�N�2կ����Z�G@T@}		�-�hD���3�n�ԫ�_���.yi2� ��i�l��-7������S�O!DN��Bl.�TxuEa:)�1��
���j����b�Z��%	�m�jy�d`�?������ޡj�<�ᚎ
�g���7�U�{x�[����q���܅	Zw8N>�6D�����z���V�s�%�����XOD�ï;~fWA��K��$� ����N���ϊ'hgh~Ւ0Z�)GԲ���?�@���đ�^�����r�
�,-��r^8��W_���k��>*-�4��ʬH]�D��Ej2��w˛}^��>������s�i7���U�T��y��,�l�Z�$T�)[{��d&5�������N�G�7��ә�Ʒv\%ƍι�ז���: ���4}!}�j��%> ꡅ�2:^����uo����$�r�}��E(����}��؇��2�ȅ������[�lR���g�/QH�I�3�/
V8�Ʃ�Z���,�����g������H���]⫕��8;#?�����C��i?�;w�"��ؑ�׺���|?䙄;��,ǖ��6�ݸ���LQ��6?~�ˠ	�8��4F�����=�XH�h}c�)���0����Cח��m�R쯥׫�>ÔL�8������J�t�o�}��:�J���m����ƌq�̮rv	���U�U��1�(������m�іgϝ�]�"�t���p��*�/�V>�zG� M�������_?�p_B��%�����_K��[FS�eL���p$<s���nc�Mʚ�b���;��c���}�姀��j���/`j#//�f��S%�%�݁$�Z���#6_Kt����s9T���(�Æn�_���l�g�Jc4]g�'������ٔ�� �tǱ�R����x��$�n������h��b��&��+.E�R�� 0���3�,�h`F�A���\�n� ?v��V&>7Κ�ڶ���C(	!?�a5��P�ϩ��_�4Q>���P�ٚ�B��ˑlňT���Dᅒ��f�ﴝuY�x����!�U��Y�`���;��v*YjS"P����d'���gd�(}����&�bGh�[�Ҧ�������3}�D`È7Nv�tњ�kI�>J��0�g�6߬K����c?X�w.�͹ uQ�9��9HH*��D1�K=���4AjǪf&�:Yާ��ȟ�-d��^�'^i��v�f������%�/�C����UI����z1��#�嬂�r+�k�Y�=�,]i���ъ�5���G �^}��M���%Vu �CMi��_�E��u���r�?�W��6P[� ��غI�M(��&i�d�~�`��#̎J��Iv��K
�z��l*f�W�2U��M�K ��LI(�h���N��i���@w�ӧ�|���O�8 7Nlh�.�y_8�K��k0IB.�4	>w��P�$�_�-�Q��#]r�B�Cn)a�J�࿀i���
��g��`��S��/ϐ�bC��戆
��7��{y԰�N���Dڷ?�Z`Of�_�q'�|jk�f�Nh��1��CcE(H�H�N��=����ؚ'g3�_q�h ��
����M�a��EVF�kt9���)#_�\��]�ac���e^���	��.�_���*k�����$ؿ�C��,o�i�Q��6[ASX'�b���UG�°7�ij��f�4�9��+�n�*����� �����ߓ�����\��b��3��� �_�ߕ�?��ӆS�[Ŷ`�\�b�ɘ�:��O����x��&���[�Z.S� y}�'r�.��I�,��~�B��^>���ǚ���H�F���~�} �2����W��h�����ʈ3���jf��e���˥�S&�Nzx���6Y��̫������<��jh[��x���Œ�w���*��!וY�z�V�}��J�w����"9��Lѩϴ�
p�Z�ě{���4�y�����Q�-=�j��(?\�w m$>�g����Ť�����5m�e�2ڮ2�o��Ww�x�̍���LA�pù��!,E�DCps��K�׌~�}�"��=�M��2G)�Ҝ�^�����"�e�`!X�~J@�ZE�3�eI��T33�N�D��	J�O�;�[i���iB���b�F�4���j�_C{����w�b$c�����`YT-��
�Yu��Nw��4��0�"90�G��xs]>:\�!I9�ZY��x_����(jL��O����	��΀���u�d���L�)��Z���F/���vϸ�o�$�j8�w��G�h�|�u�Z�p�
V]�eJ)K�a����>x�5|X������q���4�>��Ih�d�Ŋ�T��Yf !�^n�@5u`̩|~=p������z-�	5��"9����b���MH�%Y�z8ڇ��[�?��
�KPS�fY?���(�%З�_\5��b��ɰ�Ų�|��ƞt�r�����Y-��k��o����t�>JRXeg�&�5�ݕhΡ���[��@V�aaλ[�o�F��Y����P�j��Z�^<�R�)@]�e�bĭB.se!���+��7C��&7��0ژX�2�>E��q�Zx���'���>�e��y>�p�-^?=���wU\v�Y� ����]�$��y�|��xC�
��5��^��G��oo����e�o3?ȿ���g���䟺�j��ڶ���������O����K���z�=��AI��o�z��>��6���/]������	YE�uu6���/�ֽ��yyZ�kz���?�������6������<	fܶq��}��K`��,���o,������T��I������{���_
u\�r�N#�2�jc���X~V�_�N�����Jn�1�ٰUl�P_l	1��_�:7�O�{"ƿ�L�V��G�#�׿��^��?<��P�<��.���:���_�R�*�Q��P�Ty�|�pr�S�rGzmF	�2osi���:�_��^um9�*�*�=-���߱���l����:�qt񾆥����Tٿs`�������Zj�9������6闿�2-�`�/9��P���,��(�do%��D    ������J�˙�(M��	p[���������������|B
�P�׋�!Bڦ2�\��??IP
��{D�]�v߽,wJz9Y���$"�ru��>�������tz��'�r<�a���+����K �z�����D2{ ʳ�gy�y�4넊/	Y�,����.�[eQ���%iF	
`�kP�"��k��,�A��V/��_m�@�&��Ӭz�t��1�ԨK<���]�$���] �\Ƶ�*�gʓ7���R՗���3�ݛ�� :ʻ�n���ΛC�W��L��_𮮣)�S�--��@�����Mѻ1��46�R
k��TN��n��D~�0�KJ�q���B�������f�r������[�I��78FAZ��W�>E�Uh4�ƥ�ՒgjC?�W^�r�ɿ35/�{�K�éJ�o�K8'A�߉)�yJc,��.,�y[��о$�:CO�<�b٘/�%�#p�_e��AV;�����;(ڔ?S�	��ұz7C�r��.�D�d�����%^��J���--���eJ��?0�KG��/���Wq�����ǵ�\}8TBO|��{ѷ�Nfm�v!P+���vM
��c�de�����d���ͮ�86P�cN��Kڎ�nR(�n�Okc�0����z��TR�(�����g�;2˭Ϧ �cR�+[�z8�� &�F*��|�r^�����Q�����\�M?�%{e-Ýs$D���'�XO�������%-�z�:`��[�
�ar��^�x���e͏���DÖ�3����z�{U��x���"�@`a6}�׬�c8	^pc� =Y��R�4J��y`<��u~��jIՠ+#�.+UJB�n =E̥(Vx�|H�C��_����>����t~�^�={g��^����;][(U���L�]��[�P����=+�u^�у�7�$%8�̼��q2㘶/�~�M���F�q�:��T۷��X(YZ�|��a.7����!�`Jڍ��{8 �mE��A�E��г�)� 7^}�f���%�ʲ�&�9��| o���x~��x�;xX��#;xJ�x��n�o��;�-�|�����>B�����9���Ђ�ӉR��$�G�>��
 �F���g+��3��UR�}���7o�T����Z���5�%5�r�;�'9��_�]Il�4�q1��i�_��o� ��T@�r�L��r-1V��U�z������ٳjFS�/��������ę5sb�o�_����m�2�-@���UɆ���2YQ�~\�pT���vjS�YX��R�����X;��k2p�����y�Enf���%(�-&?�tAz��;K�c|p.��Br����p�'���<���n���&ݲH��ٯ��6D�iv��i<�������d��-��v1%�P��v
Sd�I�~|H�Y(
6�1%"18���Ejԫ�����v��N{!0�ΜUT��z /���8�����c��aY��0i��|�|��k\e}eM��?T�)��AR��QQ�TY� Ϳ�{*h*���7G��t���*$%W����ͫsq���\k��W��?��ʏ)V��Q� �,���R����a����:�������=�ܛ�p��$��b�)֩��S��u�f���ʙiI�9����'
G&z9,EV.���m�ׯ�ol|6�t�����0<�F3R6*�E�mP�Sߛ%��<�p��e�QL6w����U���Q]��K��>��"/�6J/���\���;슢�d�����m�v�àu*�~1EF�>��yÏemF���FO�zf�9�!�c��=>�
̣��Ѫ��')�-�pGj��"�zZ�����Lv�H���m��=	������Z�%��[*�D�?&˱���U�ٺ:�Fs)UF��P�f����P�K�_�V��3u�tT�٪�W�UUX����l���R�.+��!�פ¢�S�f4^�|+��bs`���E��z~�`6�<����K�Ŕ�(й��.�
OJ��g����Tk�'"�֌,�W�y��ō��� ���X��,�H�bxi���{��^���� 5�2k� 7���;��!��W��lhl&�M��]۾�`H,7���-bb.�����ݥ�)�ɧG���?([/��_�q��=]G�E���c9Ȕ�l>��>�D���[�D���O��Ќ��Éc��Χԅ�wI���TH��t����^�Nߍ�w�2CiO��Q�C�O.���!2	��jx���[ܼ<m�i�S��r�<��&�g�_P��'�ESc��rW��`A2W�{e�2�x����S@��w���	�����@*�B�5u��1����]<����G�\Ӎ�O�$ �q�u�5���?�d#�T?�� j6�rsN'�W���<)��=#
b��/���eÞ��ў �(*�m#QA�tz5���ּ�%��	uێ&v���/IG��)=�*�b�X�˥dDl�ʹ	\�E�qNK?����K���W��5&Q�-K�u�E���Y'�ME�K�^�&��Y�kJv��?W�D����r9��a8��Fn^�Y�
���c�|��k]7a��2 ��:t������}��Bx����~ET���z��(����B�4'��j�w_�/�e�����$�[���9;��d�F��m�3���ʻ
�X���<�j���C��{�C�`G ��Q��(�jҜ�42����Q�w�NO���/e`�ЫQ���H`�*FM[o�>M�R���)2��وA|������ŦI(Ƙ_}�v�{)�ӛ$���\���s���W)���]�P�\����'ێr���OQ>�?By��a��:X�8�.63���~8��n5&]$:"�72��eAeč�D}F<LF	���}bN0�3ʉ��M|Ou/�|�!�����_4��v�m��S�#�J���q��B�:R��!�fw�M���5�1sz����}�C+H��q�1��X4ý��ulR�wi�&{\��:�������.��[�C[�c��P7?^�h`��ب_��ht�?�B���X�g�$���A�'�`��Җ��muTۄ��Y�Xՙ�C���c�}\��r�%~/Q�B����/z�%��&�y���t'S�z�!\;��+��X ��W�v̺p	�FuL 
�lVsK}@fg�Q��Gl�B��)���^�nXr΀"�ekB���Z�8h�}.���Ķ�)uf��h�]��8\��n@��ư~\L�%����</;@�;�*�}�\�'����{�9�AqzcS?ע!�5*���0@Ϣׅť��0�1�l�S/zM����H���2��U]�`��x�r�9��'�^EG�u��Zw=�j�����;����.G���&�?hj���ҧi�7]��TP�<�tK�{q_�ۺb���&wt�_g2m_\'�Fxw�HWm_�J8Cդx	����rz+tv�/0��Z�FH�!4�״.v���-(�̋ie�X�,�?�Z�^$;�ye��Z��z#z����֪��ݧ�e,��k@��;�YY��.#�nb�'8p�8����xFw��]���W'1U�Ԑޑ�W��^�|}��I����_�tV��=�{��o�	+E��c��(2���7J⟖�CO9(����ѽq7����S���)���
�[]K2����fQ��U�9>0���*�僤Ǻ1�N&�}$~9M�O�<��;�ɿ|\�T;�QSo/���Ң�dV��pa�M��/cKB�J��� 	�,�{��%k��b^�'��S�k���ۡ������'��]f��pjfF���%��Α۪>�H;�!k��b�ޏ���a��H�|E�=�������e��ЧQ�es~談�M�~�����yG�^�js-���W5���H#ח�-�m�o�yM�%f�ܶ��\
���K-��U:�w��yJ�����>O����W��t�T�O�}Of�2k�%y.��K	����#���' ����pSq��|�4OI|qWe;e�P;{W�+#{n�9d췙�x�|)YE(    A�2z�@��>�ҧ��' ���f��
� G�k-l23������"�3�B�Xy��6[(��n1�[O	h˭4>$��7����;)�6���	���|)N�c�>�)��H���)�٬#kA��%��C�iYAI�9�b]�s�:��p��-�k9��ic^�h��A��ʒf"�@^�u�5{.�"dH^.���	�N�1~ʴ�Z�h��bBd����V���&ͣ�,�3TC`��$��E@ݞ�L����PL��w��  �9*��B�̽����;G�X�@����a�o<=��� "�(ܥ'M��>}�ּ������5S��
�w�P����y�Wz6�b0����=��y�#��O��5�{�Æ�p�u&�|��ŭ����i���].�{� c��V��FZ.J��k���	��˾I�f���}׍�f����N�MbZ|9�@��#���V^���%b.�јvı���ћ�8����!�J�P1�����~�R�[9��t�ޠ,��=��4�,~��e�Mܒ�O�����w[�4�_I(��@fI��<9k[�����zZ����)��afVܒp�	�Ⱥ�ԲM����CՏ.��q�yi#�-�݇(ᐖ<[�N��#�\H$�7�̡��;��Ƒ�W��,�$etF����a �*�v75�F{Y�~��T�[��y&ף���X|4\2�7Zא�%��ZE��K���b���7�T�eI�����P��6[�`�2�_Li�{i��&��&�Nt�7���_V����Q��E!�|��ݽ�Kߢ�j��d[�(R�?r��'�.ZlNr;��Q�!�=�V�R���\O�]h=Pi�	�Y�������!��E�(ׯ!�q��n_F1�f<Fb�gf�x35�ohq�$��<���_/�V�˹�Ǯ͘����U��H#���m)���t��-�������`�v���X���� (V�i- bpJصi=���&��Z>�]����/�β�2�L�knL\���4^M3���:��n����ט �<��J#_��~���LfF��t�! >����%�cA�\��lX����8\:@0C�ȿ��7B����3�����;�	v��4 ��B�u݄�*�LSsh�-�i��F{��1��֭�Ф)ѐ|7�`BWI��f5��!�ݖ�T�X��{�՟��2�1��	)��:���(���*�5&jˍ3��4(z�0���+�!�
�B��B���|%f�$/8�kL��I>T�[���bO�EJ��Q�2�׻�w�|�I�mUU8W�p���>�5&#2�Ӏ�p��D"M��7� ]Ar���+�#��KL��6��ɼ�J�L��K��.�u��^.k�k�;>�K�H��ɹ�"$�v���j����,88 ��}�P�� ��z=��E�Y-u��XBkݵ���$~�ZX�d ���۞���y�&��������#ZP�-�Z�If��o{�p������/a2R�����s���c��o��O
-qȡ��풞����6�+����V�j8_�w8��kݭy�[/>"�R���p8�Y]/��F`��!�]��ʪ�ݮ�KyO0�z,R�%�/��dĽ�9��L���D�i���`�ll��*�y!�����|J�=��u�
��Ӥ��?#�ܩU��!恪B���00�/��-��'�5�?}I��n7eΖ�����@g�E�+K�~��U�*���l�|[m���3��v��.�$.Z��^�+C�{v(�u⭻thבR??���E�R��'Mv���脉*����쭪�~���CJ���p�E��"1�d��nx��@���F���m��}���j�i���2`�qQ� �֊�&@Uh�I9��lmNAr[�R�[�;mE6⟄M#�{_��d���5��gp�Tx�\:a�r���:�7�ɀP�/	�}˩����1�P�%u&��M�y��3\�1�|tc��D�E/��f!�^����׷�����O���~fH��`���kn�Z9���W;h*�����,;�e|e�*`��q�_4_��k���N�m�dIݡ�Sbv!�Z����'s�(�UՐ�軨�f��������)�F���fޮbk�����է�ur)�/PT;kZ(��X���������ͮ-�O+����������!��溜>��-|/�_�T.��s��43�{Y2�(���lp0�v?���P�ΡbK�V����I�Ə`�����͊��	�D�$������P��;GaƱ�ö:���Y�un��=?O���"�r'�,d4�<��*�
�{���b���h�k�y�����v�T?����r�B�]~+v�P�'?��?�N9�I��~x���kW^����u�/Z���̶�ؓK]	�;jRB���(8|6j������}|7��-���ٶ:U~[�ļ�O����	��s��6�V����rظ��̖�ϫ�[z�|�2����?�MjT��� 0,g&k���JG��QZ�L���;O9>
-+`����.�[N��������Ι�%���q�/#���ɠ��}�yfe�T �A���+�1��(x�%�w���A��izV!��X_����H��b���|Yt��ѻ_���WL�;�6n�Ip��<��F�����睖��0���Z�7�a���.�o(IA���z�$�d��&���7�N6m��d��Bi��np�р�A3��oB�3���o����>=&;��Z0۪����;n�B��x&�#GW���z�N�� $iI�ٺ��W�~V�km��P�&�\D~��]�s>�'M���� �É5W<�I��X��Wi���*r#)����A�Q7km�ϱgP���L�r��1����A�gdT��8��/��G2Ѵj1X|}4���9�h��
^dV�11���e����a����_��Ֆ�Q%�E��v�V!/)�E�����2��Qg`~�.*��:m�|�o�*b��L/x�ZN��������i"�N���ްk��+;�������?��7n��8�B�f%��]"��8>Q1������Xr\������l�݄7-�����{��총�{��vwL�HbDE�U �o��$�D�4���B��w�֥��d�{��,i��0�d%�d��� �f�{I,�}A���:�N^���!� BtP�Dk��:;���	�lP�XS��#$�Z1���O�?��?vU��nLP�x|I��,�o�f�����Z�ˋ���I�KT�( &.����eW�b:��l`�A�����Ǌx��RF|j.��v�[���Ŧ��|�p�#�Qs�ӯm���q~���
#�2�c�rL/���M���[)������,.b���ē�y5aa�}e��)����ʟ*�3�/_G��N����
���7G演 ��6�fn���|ǣHpy�m��G�-��"�G,w��단0P�N�J=e�h�(j�d7��m�3?��Q��g��Yf��;6�r��S�
��Y?{%p�a��X������H/������_�K1ՕW�٣��#��H�.��C]��U�3������M���Ag�&�Ğ�Nc�3P�di�6}a���dp�Q�{��k�`���s"��߁Y�� �	P�8���3���o��@PP��`�2F��ѱ�Ư��~]��H1`�/�B���#���t��m���*��6)��ƥޭ�{f����ʭ���Gت�'Z�P�5W{;��WޖL�^�U�p�t?�+�-��؜o_�o����ON:�IsA��1�����}y�v�C�A��Q�;��r���#}��\��E����r�\Yv��0M�L�v���G�OJ���H�A�_�6~��e]�6U ���|��Q��"w	�_ؓ:R�,�~�Ŵ���Tn���)�Q㫤teoէ/��Gט���jG~�FN�o�ZFj��A�Q��qDF��T�y�uORa�y���yރ� u���U�'|լ1h��3�41@A�s8��cۈg��3�V��x��@��qQ{�Z� =E�-d����u�C�\,�/�    ��CZ�̃x]��T�ۗw�m�:28v�e���hR�斖F (B�D�u`�`b�Ӣ�".�/HcM:L!d�5���{KnϞ�pR���l�P1�P�\�|�ɘ8��D}޶äaK�	k�z�$� �|�����2�����ٷ�XZG! ��	���E���YA�"@���Af�BTp��"�d"��e��l�b��F��)�G�op.�"����-�6��y����4O�J�u�Hao�v�QqW���橲��T�O(i�^�:����a��,��(W����F�	�¶�ܔ&]K.R�G0�~�g�\��z���#R;��CS�[4()���g�� ������^9��� z��+S(g˴drۛ������{p�]!H�Ć_��I��p��W9�	H���Q�ʛiien`���3�i��.YK��r�ï��y��ɖ�)tmy	�Iŷ����Zf���W/ʹ��n7Ҿ������w}�T6S��]@4��}��{œ����s�Cz�k�1���-}ۏ�����}��J=����y�@������`��\�+��X��B�W����?������sI��G�x\���.Y���?�����%�������q��P�۟����X�o��y���� �!y�BE����5��(�������K��3ţ��z���Y��=���o��r���%��$ÿ��t�?ƥL��I�����߿/u_I���I��-�����g�G����Y�e���}d��'�{��}�x��_�(���׿⽪��gfȟ�"i����o���K�7��_����Q��!�,��ނ���|�����Ap�z\��Ĝ_�y�;`.�k�%��*�ߪ��yD�G,.��{���w�)9�#q�(�-f>-i>'h>+az���~o�̇h̬���#fq<nr��/��n}���L����i`H�O�?����C�"s�,}6�v������	�KX��e��6+u��_�}Q��y�$�DF�x_wL�'4�Ѳ��κ�M�k���CE6���~��ϋ��#�6�!mZ��l��G���?��������$U<(8�����fUU��}��'����nH}g7�b�?)<S߁:�!��0z���tvQ�1�q��&Q3	��0:�6mA^-64J��Ҙ�fg
�ޥ`��Z�k�}�}�Ѧ������r��6B@F�a�nB�Jo���:�J9Q
��*����%Ť+FB�+�p�FAi?��q(�bc��0�^����.?�[x��>�q��W�/1?��z��_�O^a	2
-�_�ٗ����9c�os���Q	����J��l;����$l?�YW�1P�nú6�K�H���E�adpy���Af;��8;�Vr�^����Kk�)�%<S�tژ�J�P���DG+�5ϭt
�������,	��ёE �n�&~
I�� ����5CWDo�p���j��c�����!�%�����%F=�UYJñ����`&x��t�<����I뗟�E�ٿWϒnVĐ����1��.Մ:���x�M2WԍO:$���|� ����Nƹ��� yn�õj��k��&���Z�l�aR�d�����p�og�L�+��J����I)�5�������/T�`���$
%9�3��e<�"l٣��52voDc�l�ش\5ah��p_��-�A~b����Ձ��G��L�}�+�Z*u] ����~��c�]Ж��ţZ(�pWjamϔ�Ⱦ�d
�X =����#x��
�{]��#�����
t���8��֨�x��+w�e�q�+�p�	���
��Z�f����!p��1�D�q��v�ש��T�C_]�Y�}�"vǛ�����Pl��D	KW�����C4�.X�{�K��n��q�]Bx�\�؝�R[��V$�l4Qz<��d�3jf��P�R��%���Ŋ"~[�;��:�c����B���a�4xWA=5M8�-����lu�b�wUi�|a�X��ҡ�G����W,%�?܆�׬��3j�*E67ſ!�8�����ldd�<0�e���wa1p^)
Si����y��c�('.��f�s�;�����$|�"��|���$������l�}�������"���I�~�@d�P��压ʘ;��Ԫ��P�m��'��w�I�e�~m��Lf��v��D���s :���v����v=����4�Gkjg����8ψ3"�� ������We��n뫧:	�y�&��z�x�p11g�����9"C����m����0����z���Ʋ��4��ϓ���zݸd[�n�0�N�	U��Y��=w�,�z&������#@��ٷ��Ƞd����Yl7��p�M�����4q��QM��Е�R��qS��.]��7>�UX�����
6B�I�f�vWN63ԶmU4*B�.�!��&Ӫ��W���4b�T^IZ�;�Rb���cm�R���I�$5�e=9
ʧ�~U{�8�I�� �ֹ����ʹnK��	�x��45Z|�>U_��v5_�'$�T'�H=g��0[��I�3�鏰z��n ��|
;�>��'��!��*?N"O��-{w�h�6�^���ߋ�[C�'Ġ�Ӊ�����b$f1˄>��}�
�(�\�	X�C��@pa�DI
���Pl�u�騹.��e�S���>�f$޵(�q�E����EB#c�tʋ�e=aN�2]����_� ���VR���vN��[1c�����^�M���vQ�Q~z��.������|��]x+:]����ꋚ�D�M�P�vv����q��\���Y��|�`|����Yd��+�P���_��M$J	4Dh�U�`��H4,��m�/�������E�H&��n��p�2�L|�:�osbU��H�Rў��/j �e}}����3F�H)3�eD�]�n気��6B�ͨ��ݛ�|���!�e6�'��&��c&�'Ir�#_rS���gjIBG�e�Fs���nu`V���ݫ����Q-;���K�~��j����M�Ȑ�����@�˓��D�	{0oC@*%t�8�9o #9�s��=t�i�t6�Zn%�Z�ޥ���g�=��#�P:�E)�

�x�'��(6k
��+\-$�ǐ"�[���v}��gV���}l�&h����3wmEdK���7��r����zگz�{y�e�T�(2Hҕ>��p!��?���"^hbs�=ۂ;�,��]aj}"H�TBw���{�ή��Ѵ�hk��5��e����2�5(iX�~�.�q�4�$vz_�h#���/���B��u�-��$ޯ�� ������k�f�x��I^@�v����%��a����IA���Q T,lZ���E�H8�L�Ϻ�Q=~��D�D�U�L�S���y�u�yΫ��+��U`4���Dp�(��$<kS�b���o�l�N�9퇓w�.�5T�OO���9��`ۤ��X��E�:�-�ް�e�i�?S�+�'(T��=�H�Oqn�qMj��_][Ԍ��_�����~z�����\<��0�k�������o�AP��뚸s:��I���H[������<~Tu�/oA@�fm������s�M;��j�����)G
�菳N�I��g/ӄ^l
-���`�z�I���kE�᥀~��+r4C��Ђ��̘�M/��c^@�_R�;٢�wH�A�S��ZS������Tw��\v�`�|������Z��b��t�ِ�_�=��Pg�2th�HIp�Bt�n�~+U�Z�_��ұ�vOvfv:n�y6$	�j��Z쯦���7_��W�В�r����ذ�EF���J^�OA9���/���/�:�4����֤��^�����BI�Q�C�0���w�B�Fz�V��!ʴ�9���F�#y"7K��<�
�yn2.M%�z�s�,�?���bQ�����bO�r����$�/�U�fА��ݓ��D��1@M����Ö���ZIӁD�i�o`����@�o4�x�=�8]	�WXn�Nkp�DT������$����6�&޶�exh! OhS]�Wy����<A�"q���    �Q��7Ҭ�֟�H�sL#W	�q�o�8��f��I�3r�=Ƽ|��T����ҐE�Fm�Z�j�6}�n�K�l��U��)�I$۪��lvx@�n��l��+����C`��V�P��@�4�kI[��gD9�ft��Q�7�'}��������OoMf"��S�����J�1V�Oo#�U&��g}ڝl���sd���}Ȏ�]B�А��R�U��G~�2I�z9�JX.M,��w�#���W������:�B^F<J^\����+�}���d5=`�`ې��F�e�zˆl �Ig{�.5e]������OH�Y;���*2�u�E*T� C�S�7']��(��	����WG�[��O
Oz��ѫMq�tf���Ol �8hQ��.�DL{� t�z�5'ō&��U�"���0�IR����3pdq
#�X���|�B���ת5���5��|w�����W�X���Rbl��� i�Z��cI#zR��s8�o-�[s��^Jh�d�Tަn$�SZ��
7��@�x���}B�ϭ5�cq�i�RI~W֔w�h��iּ�fv��j��n#�A��X��&R(�[8����ʻoD��
Ff�6C�޶�c���Z.=f>�Q��C0�T�&�1�&KܭʋjÛNIښ	t�5�G\UQ���F��I�D��EU������r���C�
K]��8Q�T��;��Z��2cJ-����z�uN�M���Q�e�c���d��	�b��ncf,�Ӄ�pi�&���
^*��p	4�FB��� s5�@�-���Rf��:����ĩ"�}��|"jN䯻0�%���k��)(�|;�7��muv�d�x����;>{���W�����Gm?���Q�R�Pܐ�A�����ߍ�lV�D�& �W����b3�H
cJ�u}-�~$��\`+�G��⺪8��h��
h]���|�;�����5>����d謣�Zu��#���F�
،�m��ϼ�ejVs%`�y}����d�M�'�/����_v^	��iY��桗��9F�vI����k]�O�֊~�S�_���h#Y$J/��,����ƃ�*c7����=PrэS�p�����-)����"��o�������67�J!�d ��Sϲmn3{���e˔��R�a{�˅-� xm��P���8Yݒ���EK�Z�K�$ۂj�*���5����̸k#�@�h4���W�F��ʋ!����W츶��#�-��2Xu�@��6/�mC�"k�^�l[���!5Ӊ����

�x�&��(�7���sXX�Qް�{`��|�av���в�����P_0P<KRV���Ȍ�/�wH�@ȫ�A$[�Ͷ*}���HuU���H����JRM�&{�6�}�_���V���Q����o'�9�M�uΟ|�.K� �4<� i�d
ߴ�I�̔��s� ����p3��-��+?n��*枪W-[�āf�3��Y�n�o����8����1랬^�cs�'m��('^�V|�����~�#p-�~�p=>��j]G�dk�I<��Ѿ �=,^|kF�b }܆Yد�GO��8π�W�6}����cEGBD��\��������������%1�do�CDĂ~K�n.�^�?v�;�E�����oo�Y}�	�bz��)	�t1����3�Li5���j��GD�LB�#v��|x�:l%7 x��;s�5�A�Rc������a�l%��w%�j�ژ�Hu\��-d?����� ��<b�x���(d'eK��cu���$�nY��E9pM�
��R-'��mG�f��B17:tŐw7�
��i��v��WB��0Zh����[%[yЖ�W)�� ��_j_��
��9tn�i�/��M�QǚK�đr|�a�P��̐#&��.��s�B?�pHdWo�&�[B�� (F�vl9-�{)I�����֓4�a�Wp%�|���i�XX1\mvd��wM�ۆ�5�K�i�{tfn���4<ۀ�l��
&�C�s��$	-�.��;ᴡJ]e�˳b�0&!�k7\\bH�0�i7s\��Ћj�㻑�(���&
:O�ED)L�Tl�����?`#^\�)
�����	��!��i5��c��1hn�-\^����1�C	a� �U�{}�w�<m?onCk6�ǲ�N�ھ�j�75�T�i$�C�[{?��k9z�W�%����̮�x���e��[ɪcn_bƻ�>�8 ��]>OPPLz�����
)����4��@ٸ¶K�Z�95�ӤD�,�����>}�6C�,X�9{"W���N�k����^: j��%��P3����!�0���k
\�i�H8����-�(�~�=Z,_�S^,�6<%�|�9xi'ڤUSf�c�@>�!���	�p�땱H�9Q�	��.a	�i0&����(��n!��������/��	���&-�+"ģY�/��q�Tݜ���]�r��#r�|vJ����b�ƿ�Ћ~,�c"+O�椅�g=�Tg������j)TJ����j/����P�~�M^�eB�����?�Y@H�{�G�'�sɜ,�����'�ֶ�m�� (�-HBR�q��e,�ΜY*�F����|ΚF�R�k���t	 ]4;o��%G4�ݓ��hy���,������YhZ�=���TS�=�%{�-��d�3�t�+�<�E�Tu��y��}1��x�D �DSk�����������A���<Z��f����� twe���hHZ7�IкIo��%pƖJùPP-����J
�3.be���Jc�� KA�M��^�\��V�z��M�
ln����K,���t�FA�Q����I9����cX~lg�xɇ ]i6������.�u7���LZx���>5�8��. ���%��M��1L�3�a���i��0>L|�D�Ft/W�3"G���t��Y�g��a�
����q�.��2xͨy�>�(~H�{�njtSξ+�ua��R%�ȭs����ʭ\i�	���\�pe<�T�/���2�	]�[��K�W#�8�ӈc�Bu-����i�~��C��A�-�b>�.M��^7�T�y6��[��w�fܲ�ɏ�)��Z�X�-��������d�U�U<}��ˠhD�b �~\c��z,�s�PPKC�\KqW>W�!�Z�^����(�F@�@�w����R�������+�(:uO.�)�� ��{5x��%_/jAk~��0u:���\Đ_��vn���*�m������Z�LpЇ�jq]�za��>^���O�W\#")�v���*X"ѣ�~��P�=_!��iӼ3��6�"5}�� q�R�w*%+ρe�3��s��d�K��J���΄$�U�3��F��$�K��}�CGEѻ��w������x�RG�zJO�;�.D���%�D�w���Y�.�S	3[�q�y���.�v9]|����?g=�$�?\�z�S0��*�O�lJ�p��7��U��W%/e
G)��T�;�rXOc_��j� 3�l=��_�/�SV�k&�|��tC����j=��U�'�]���>|F0gչn����\FҞ�d����vĮl�Ƽ�e�=�53�ᄪJ������K�����/�g�>��\��l!��ڷW܇���^�{�v�G�����d)�&�f@�j?��\�+x/�)�GO�?1�@�7b��РE¬�W�r�//�^�⦋u�� ��p��Z���^�+c�����<<�R^����m�_���O��ecA,��`�L�}�#'�Ou�^��ua�!F���p�^�(}C1z��-@�I\_�?zA�j���츲��@��k%5K?�w������M���uDFE����>�_Y��G��z��Q� ���b�tDW�$Un,��R!����6ʗ���w�u|±I��C�	��ێ�c9�!���C\( S�ꞍG��W}������/�A#�v&�VӜI����p֗��    5��Ϩ�Y�*�7x��TҊ)�f��_P�Ј��$�<3�B`��N�G~���b;��>^>P�}؃}uDk�;/��9�_l%Fb&B�A\5ռ��c�?'#�5�JN`?��a���5����07]A=���}�����#�m'[]��M��!����8n�����@ n��hw#Rq�	���=��!���G�%{S�E_����1��,�w-��ا���9|�%2���t\�/>�����C���Pg|42גp���\�����֮��b�3���=���+3��"R+�%�r�A[���j��B�:��.�ȅ�*��L�[�����v�����4��G��������6��=�������:4-MvD�S�n�K�`~�j�x�e��H���I��^�n�m&�~����5X�ܢ��hH�ԏz�����A./S�$�x��6+�u�Ћ9�6���7�,s��ȼL���B����A��cI�5|�-ؼi���|�簴1R4�����^����+h��ʀ%�SAX5���xJ�$�S`����hɾ`����T2;���o��g��yN��Ϡ�Ł�M'�/�yc�z��qc[e�����P-?���qt��^s�beQ'���?3,8k�c���{K�2=�:��Lȵ�8l���ݐ6��M˘�h���Yh�=q6���/g��l�ڔQ� Wh�����o͋%��o��hb��+�e󻔈��B�����we@~c��97�(����>�m�[�d�o��U��dP�����
�����':6!�j
8D��KW��F�kt;V�����.Blw$GË��;�i�<�;[�ԃ�
vѝ�@I���;�|9������H�.��L W����XHr�G���D�9Q�����bzӒ��o��<*RT�@?;6"����I!���y������(Џ{���xH���i��!�%�a,��UC��s��+�)�lCz���a�ݑ�W�����cwP����p(h+�u�L[���p��*R���{��E�I��e�k�� Q���o�E�e�9��na߮�ǀ�j�Q,�ɯ��_	������ q��(�L��Bh��:��w����:Օ[�>0�8C�{Lɿ0p�
���?��;pk9)js�Lz�$����t�y�/����COB `���9�u��2������q�Gn3q:�L2$�i+Q;
U�-��R��U��PA@x�NmӪ�������ݴ��}B���L�b$���b%,��>%
Oy˨���;GVcݢ[,-!�S���/�흌���(�S����!>�IU����>��L̖n��Ҭ3�Ι����ҀѰ�����t/kI׃F3�����y}��{����V攃EUU業7�edSﴟs槑�]n)���ai��!cd�H��鷾����(D`�/�~�,�θ^܊H-�R��cʬ��Q�j�i�"�},nXC�Z��W��5��I�}������W�>ӥP3��1k>�UT/L;�̆��O���-c"
M��"�J��K��e�9+ԵM�h�7y"�\�)�����.n�ߗ �lʗt��x�-h5%��ep�z�|����(?\�Y�)�ozZ5"�Z��E��-%�3�t�-q�f���K,�� �RK��oE�/�uU�a��+W`��	���c���󼚲�须#�F]��A�����su�<E@���~c��ĊJ9�,2d�e[>W���������}p�}AUX[ã��9�B��r��M�ri�,�VdO,��ڠI7|�Vւƃil����ql{�ᣩ�i���1�gmE��ne2Wgb���~B陆��?�(���W�Hލ���m��6�bULၶk��$�׆�JW��jwt�۔tY��R�~J��F�J?��qh]�bk��n�m?���nτ�5�hș���99��Xg�w��u#�~�v/�1�g��9�����a`�g�b+�G�� �د�-q������߿b�=D�/�8Y�|0���
�����'��}_��/Qb���c��"��E9��tݟ������)�XJ��;n�����d͒������_n��Y��Wyߔ�37��6�%�?��=�?-8Rѽ���[V���o����1/�O32�z(�z�/���=��ϑ���{Ŀ��s��e��1�ߟ��-��Q�;�J�����E���39#+0�u"�t"�+A���$�6��%gH���Er���L���#9�������%b����Nr�N��������O��?�3�x�_����t�gvy���9ٶ]��?�E�V��˿5X:�UrP;�s���]B`��"�`m?o�������m[���ρ�WzG�����9UJ���2C�6��m��5�1����Q��r��x�?��'���{��:�w��ˋK}ry\�C�k��4��[�K��Ѝo��X��/!�/�Z&��^��)����{n]D��J݅S�,���=a.e�������Ã���3G,�R���<"���6������v���c¦��u�[Wk���6Q׳��/p�]x���N���	ūK�v�~S��N�Zo,��fac�)=�>�oU�lV���5��dc*=�XGP��a̻I�moԈ>8l:�6�9-F7Ff2����5���
+L_Z�mRC'�A�k�x�4_�0$�)x�_,o�V5X��H�Q���KǾ�܂�7��c~�I^T��xi�!hK-�P^25�}w�ך�FuqUU���A.U�)������/�8B_�Q����w��a�]61�q�|J�����,~�$�.o�3)aiٛ�Ђ�9.� ��t��:�.VGD%!�A?�d�FI�6�V_�;H鍷ex�&���{wa||�5r�����<ƅ#�6F	2͍��|�vh�<�e"�h	"��G�ϙ���7z���{�?����d������u2f����P�g=˫���8w1�tD�{��RȲ� �j�D���T��T�HTZ�+�&/�nO���Z�� ޱ��+3wa��B��*o��SP8�qњ@g�ō��H��[��"��^ig6�������r��� l2}����Ӹ!��%3��n�t�W��xUt����W�-��X�evrR��ZH�hmc�ms��[)��16���4��
���� �@J�L���T�~A�@~���I2�����->r�}a?�d��W��&���[��j����R�}i���m�"���p�����΄�%x$�>G�=B-������E)�|�<��a�"�Ҡ��c/�)�n3��b�Fڼ��#����N[��j=,|}(J��K��)B����AmY�hkE��&�����\��?���^3�ɛ�zk.j�eo�c��~��:6���e�Z܂Ѫ7�	���80m��Oؘ?�w^����ѼkևĊ��1%���ʫ���H�A�Bހ���T��#��>F*�'�O�)���o�Ǵ���``&u� S2�Q�\�|�������[����p{Yh.|H:�`3yP�;�G�$��.ܐ���o�G�7k��{�u�`<<;��=��ٞ�������a�E9Ix*S�]4�
�W���Lݝ�}\�D7B���f~7�1J��3	N��Z���iC݇��
�۶�z�p�NQ��˖��5��'{ �^�'�p��5!��FE�d��<�X��fW�!n�;�[�8�zM�Ŷ4��QŚ[�����x嚸pj��
ta.��|I$�+�mh��y�J�b,=�A�� ��1�$I!y��.�3˷;�~pAʬ�εC���I�&�k� �x�^���72l�f̵��p��x�W�/%�x�+�Cv�s�oM�ɏ=Sʹ�^[�BI����5+"�a��+!ٚF��s��&Z55P�%��F��Y����a�����(���bUSǓ+�`@�޷9N�ιLW;٫�&8������GC��Q�Y�V�Ѯ��Y�Da|���
�r��ۃ��%g�Q� ���|+������ӓ�n�n�q�÷���2�FO�_*���[uOÁ��Z�C�̅m�Qx�;ir������#+�n�-�"��+9v��4f�Ϫ��bxws-�����    ^ug)��9Y<�Nx�/��jy�P�D~�!d�gW���]�&B��6���QT���*1v���E�\�#���U�lj��L�����Q��|rs��Ё�-<�jpS���U���חk��$Y�/�"�X���4��� �崂������Gha�Q���/_WWv�9'�p77�fv�A�9�r�:'e^�h�~m���2�g�{��p�V����!�B�.Dnx?X[H(o�S�I��IH!/�3�;�xvwCDkd�~b�;y�����y��Ey��g���ti�	��Z:хe�������k���L��U#΀|�]���|]�������TlN�s��3�Y݃J���XV�K�ӮS�<
��+�Z��&P-	��ehy��!�I�;� �0���b=Gk4G^�A<���¤F��^�-]�7�^1m�k���E
�ֈ+R���"R��*�UL���y�ضl�IU��͂�&�U|h�&]b����k���s��gp�2���7��a�L���<��ޯhB�����\��E9 �T��f��:��qʕ@��� �
�8��o؋�qc;U�<�XCDn�o\����(��Qee��V6�{&`���㒳��^^�n���l����y�I�3�n�t�4�bZ5���t�6&�F����2�"^R�yB ��7яt���o6��1�Ȍ����]������*�}�TZ��+)�O�����@�;:k����h�����ړc)̂VP'l:ǥ\6�K�gLу�м8\"Rxr��4UQZl:A�T�%�����u)?��Y�n�˻�Ya�dWw����u#�����\�ۻ|�#Nך���N���O]���a�:	1��l# �(li��Ʈ�"2�w�����8����HԄ�9�l��(�#`	&� .��}IlF_j'L�朋��=U���|�>��|�2�̸\����Ҙ7���#/#��e�Y��Pb��߮���I0�Sf�b�Kc+2gh(�9���输�~O��IE��j��4�������A���a��>	�I�`�R$�/ׁ�^U��+ҳ����9�D��po�L�8���w;��Q�c!N$/duFɔ[%�MňO�`��xc2d�Cܤ;��������>{�(�#?��ʵ�[�w{M��l�᝽_i|g�����7��,3�E�@r�d<V�X*�܁@�^DA���i�r	���.X-
�><�� 1	��n�TN�:��%$Lq��Ln���QW�ʢ�yUY�rm~�l�^u_P��BCX���Oi�r�A>(g��D�C|L當�0r��&�	ǋLU"c�����:
&�1I�\:�Cq�ѷ4���#��s"θ��4"��9q���lM$T�5����y{ަ�"�R+����os�I/»G�c���V����� i4��{Y�Gt,`�g��D����I�������Jb�Pb�n�� �;�t�_���m���#�`��S�s��(�=W�'���H��04���9E�umj$]
�{��bz-1�m�圲3�\��u�IH��[����������ʺ�^�M�v�R2�6��j���{w��ۣN�܍oo����D�%��b���F\|����C=O��␰�#w�+�����U�V��аE�˄��
ҡT@��M��B�xV6z��6��{��Y;������1;<H(
�t�=>�Xh}��j�]U�'�_�@)U՘8�/����S�{��2A��-t�y)����#�����*�f����9��:�U̃W���[��3�1d��)��5R�0��@��u>~�U7a��B��|�0����K� ���R���1���ى,�R��	�@�6ȼ���Yȟqܠn�b�Mɝ��ā��������Q�l�/�.8Q�6Rշ2��'�#ے�P�rtQ�E<���i­#{Z/(��@Z!P>�o������V�@��SK�]?��q>#�}7�n��%����C/d���H�˝�v�Ȼ+s�q�[�:�~̝wL�]>(#x���-�!LGLT�a�B�~{Y�� �EsWP��	H�$8Ӫ��a}q7� �\��˨a�{�0x�q���G��ߐ{�cu����p�&uK]׈�kC�� ��h3�E�(�Y�쎐�Q|���j�d���ϧ��!���AU�Y#��957�񾼧��VU�o�-2���%�Ak��Fىǳq�9a�ye�b1g)(�{z�.C�
h���sqI�+�ߕ]�9��!��x1�[h���j�CA΅�HՉ<_�J�a�P��Š/IX��Kk�C�5�n�B��K�+e���0�c&bH^��"�c( Ub0�2A	k;7���x<q��ۼ�����x���oPI-��E��/��h��M���l-@6�<f3V	����?[�l���وI���8�����;��M�jj�@�(�~f�+�oԘk���\jĚ�^h�b*�S�_zvh� =��a_�;�� 5��)@��<��NI����V�]_�ʳf���g�ǘ�x~J���^�^�_�n0X�ed
^�����5��D;1 �q���pC�w��V��!� 3�J�����W"e�a�&A���u�rzBq���nRm��z�>�����ݷܪ.q�Lo���u�!����6���t�(�h�-h�t��l�����u�*�;�i�[&��bDx~�A��S���;��&Һ����.\J��m�nO�.���^����P��IP��Q�f��qS��Jq�I^����3g��������^N�?R��Y)��������l�c�p�����.G�(4�y��"�N�q�e<���0�nЏ6J7*קW�\����Z�pns����=�߁ 2��x7$,��':I�:F��c;|>�^��у.��s6��9��G����R��|�Io��6*g��iC�6Z����^��P[pVi�K�����Ƙ۲4�a�EgN!.����^:�����4R�x
;f���s��Y�펂ss;�4����d��L.Jf�:�!�W9�C���"��T�	���YJUΆ_2|��������NO^��m�e�킾D�1�����Tg|Q�6ݜ���\7����a^�x7N
М�c۔���7s�{��.Q}P=�Z[�%��p�gR�9��θ�iJ4�H>�����6�6�;Ji��c�k��&/rd�`�0J�����z� �� �:V�T����j,7ƙe�c�s��!s��:"h7N|e���&�Hp����Y��ԝ;�O����ޟ��|w������׍vߒ���P�;��c���Vc\:�8�Xɷx
��=0!��Y �"L��A��i|�s�E�Kį5VӵH���z���V­GtȮ�3���E,�[��8K�Q7	nU�h��*��{�����\-��܈�@�yc������"N������*�����jN�Zc���y�m3�r!�՝�* <�*�*Q5�6��� ���Nce��Pi��J����0=Sݎ)���i�9h��_9M[(`zʖ�d�DD�k?4��q�[	RY���OGJ�1(L�k�b��s3�;I���A[toTt��8���8������t���qE{~4l |)�j��u�Ć.3e1�CԱ�9>Y�W�X�Hy���1�"Ne4
ItQ�@��S�lq��ޖL�R��[�gm�d5��b����fZ���f����S&b)'WI݀���pF~�CV�nxwH��	1���\\Z�犻F#q���Z��>&�����F��5*�lł�.3@Zz�e$	�c��Q�u��W�p�Owݬ�
n��0qɀª�0��Zn��w��e�*c�WA�m�	h��F�ł��R	Gح{��"�[�dCѹ��Fc���;�#��n�����ąe�~� �w2�h�ƒb 
�&V{A,���a���P��Ȳ�cf`D7� ����Ĕ����{b��&���Q�!�����!��S-�P����)�gt���YZ��%�eY�^Ɉ,�)�i ��B��w��{��M�����RV$��OaO��.��m����gya{�|Re���5pH��l�%i�=|d��Y�uTx�� ���nJ]�    !YԵ��ʣ�ʼ�txF�F�C]�����cW����W����A�j��)��X9LW�	Ɗ-�.Q$�������D��^k��;�2��=֭��&��$-Uk��&�G2����ȭ�qR����U�\�fo�0�5^�A�Z }rw���+M��F���d��_+B����U']G=ᑞ�e,�V���T]�h��'A0q;��Pg|�^b������/�3T�N,��!��$R�M5�w�]4�L�T��R���Hb��8���<�؇]�8�M�����G�L�TT���Q?�%�껹��,��7�f���)�A�k�N�o�ٝ�	�}���F!K����x��G �&NA��A��a�>z�K~�Ӌ�mWf����ߵ�<��3��t�n��#�)�{#�К�T84d8<mm��../��1�Qs��vܝJ�_[��5�����]��<��e�{ �|$\��ugs�z�O�}���\gcO:���m�fu�l�� O�=��䖩N=�ڀ�T>NV���P�k3H;R\�4�@�=H�ġo;T�s����d�%�v��(?��1If�������dh�4��>�e
h9?�M>l'���-�����#��%�~ƕᵔ
:S���/��.P����r�|9���B�\��dE�*�`nK��ڟ���7/�^�lp�%�;�,��NV�TO�P�w�3�A߃���w����x/}ag�\�
!��n��g���tj]�P���j���2:_���t��	~�L�a5xp-�s{�,?G��|w^����N�'����.����vJ�^��͹�]*ٹ_;��N5o�b2��6����c}c줶>/Iw�V��|������	p�\�`]�P�Q���̚S�$0��H�vz��v�c&EW�p�T%�%�]����N:�����\�����]y��dw��z�͵,,l�z��J���Lg���Iݐٰ��N���a��V�,�Nv=i��1���*��C���W�����:������u��v\�m�<%«�"Հ��D�d��eҞ� 4����C�Om�G�M�-ʨ*��^�##��0������mK�T��y�{�r�릗Z�)b`���vL������4f�\��`n!�]Rә�N�nT��-�#�"�&� �I+D�t����&8c3��(``�$��3�
�T՗�	�o[T/b&�wɨI�9,�;�|#?�<����q�o6�Z��B"t�~l��gs��B�'��}�)�^(JY�5$ꃰu7�!��j>WC��~�%�4�Sf��Rx��=�A�D�gCD�ju�@��G��_�lo�q޼U�+�6�r���
3�]<�%)��V�Jca�%R_$�կ��{˽�<����|�l3�ݿ�^�j��9�ƭq��(��&�|V\}RY�	�E/�fHtP��/-f��<����fW-ļ�6��&,�桠 5f�������� ;��W.b�`@~~e�ՀJ�"��Jv��7&E�~�9� ��K�<���������٠Az��,]�@��o1#��CaJFk�u;�i5��1�Ym�c~��1`��U���yX(l#SXR���'u��\������A;Lu#�V?n�`��_PPn��.��xGN*��M��w%������/��������2)zm қ�E��Y�8��A�^õ�/�l��u�0��%(�ւ�a;qiG	V��)�E�hº �kڵ��?���ߗH.ȉ�
0n}g@��e	������W�R�(s�j�g��c�;K��_��q�}��K~^�bH�Aщ���_
��;�-j`���C]q��ɹ��dM=4ԉw�
�4{���l%���_} �&���r�������"���IwT�Z�V��BKT�B���)tq���.�U�:$��^2���ߒ�V^���eewE�+��l��:=����J���Ɉ&�ѽ�f�v��"�)J'S����1C�!�U;{�9-*z�^ԋ�\O�X� ��g&d\�|�4X3��u֜3NM�Ě<��WIv3:x׽�3�)��	(\w&9�tB�h��0�����-M7S�ִ�n�̃�
r$�R�>�`ΰ��!qj»����$n=���^�6G����n��H��8�1W��7�/��{�VS*2v|���_��u����h�g�nM��?u!>��gi��0.�R��D�>������A�a��4�8Wj"���
�\&t���f���V ^ sힾw��v�e~�"0�j��{�{� �|%���ԏ$,RC�ۡS��6��z�7# ��l��u�RdMk�ۻ�a4��b���7����ȼ3��c�ڠ�c��k��"n����ʑ�/�;��8ި4�	��p��J E�hV���Wb��^.����i��׶���s�� ���Gݝ0�ޖ���n��zU�#P�����H����_oO��a�X37b4K� i,����s��Q�Z���q��^z4 �3`�u�62��@���}�4�Zu�v O��!/1L-�j��T���F��v��A%��ZgdȭӢ�ӎ ��������yJ���G��`���TU����W���WVү�|�����?�[�ě�P���ʶ���Ҝ�����-3��3��gZE���sDw�f�
�.���K#<����g��\)J��D��q���E~��y�~䏸~[�4>�p��X�\�9��Wz��a�x�G����Sf8�\=��@X�G/_�F�,g���cf����������ɟaI�Ǯ�|������M4y��?�U/�w	r<_A}��5­Ң%+��;CK�:%q�k6�\�V�JJ-�+�u�*�m98�~2�����ʏ�%i#^�i�H�4����)Jr��-L�0	0�y���a���*·��F�P�{��#�S��� �4�P�;n� �H��;3�-�R���M�.&p�7ӵ�7���>�Cy)I�-R�^
��[��&�wL�n\��ʦ�Y��6���p}P˂UE��Q�p9d3w��J9��j��֌��P��me��ah/����Q8K�;�OFgR6���$�c�&}4E^�/gP�9�4�Nh�
�h&I�d�}�o�?�7V`�,���Kc�䭀��*��7-| ���"+�;k��13���PXn�uª����SE�w)l��p��CI��n�����zN\:_=V%�*��5��=����Yۀ�L��y�;�B=��R����ʳ�d�l+���`��,���P�k�Ɓ��ힷ����\��^�@��OG:B�J��&�d����*{Rv��[��c�T��A��3��/~�H�3�\I��Z/�h^X�{��[\*M�ԡz|���x�
� ���Y���Ŝ��q���[�z�;gUT��oH����!R�S�w�4��@t��"�5ձ���_�+���mz��ߪ1>zb(��ӭ$��$��&�NQd��^���[Z��� �ȩ4��CL���ѥ�ӕ���n|�S,�<H�{B���{�"��,��`�֩W��; "UvC�3rn��D�6�i�L��_=]�e.'�2鮇��o��&g���eݬ�9��Q�gV@G&�>�ָA*�+��Þ|��Fs+�x%�{�uC��;����Ԛ�^Â@�* +�w̷m�>�ү������ˌЁ����E�%��J�?=#CP�����ej��v��ʦ�Ck�w���f������K�}7�d�WMe�}�k�lZ>�c��k+������s�˖uE�}ϟ�97����l�n��8�W4gs�EK�i��ׯ<j���b��,�4�|�Ǥ��~�n~��硜�2~�o_s��Sp���p�h�4���k�2�j�)j���?[w�[�>�=�O��O?���2�(ɦ_]G�	6��5����gD�)�~J�=�&����V���Ț?~@����Q"h�S�s6��QJ�d%��0|�(<�����c$���q�!K�(Y�h��i6��G0���Z?�{Ye��@�_N� �<�}즁cE��R�S�@��\�շ�}����D�����{Cp�?�+��4��(S�Dq�|��?��������g�������l�4���4�;��!?~�K,�v�b>ח /  �����"?%����H����	x���38J�4�"�L�_"!@w���/��j�O�V?'���}_	�O���9|����-e�F_�g��1kr ��Er>Z�L0�
z�du��>#� ���ym��+j�j����ه�s�ofK6u ��b���.���׷�/����Sy��)�5�8�ǿ�q��E ?�������f`��c��}� �_b?�M��辏T��Tv�/�|�*e_��4��D~��~~s��c����:8����G	N��_�'� ���.0���ѽ&}YS�����b}Ǌ���<N�����XS�6}�|�N�r���P�Q�O;���]���?u �%��{x�/��ә��7(�?��K�  ���2���3��|�(�����V����?#��[���?�Om����95�W ��K������'d���`�%K������� 
}��QPdւ��?gf��'}`�hJ���a?@�(�z�.���}�/嵩?�#G��j���Nk�}�Q�} vJ>R��?�2�y��E�9��c?at�}F���p8w�~wl�����}��+�|G|!�K����Z���8B����Q�k^�i�d~��_���Iq�����{ ��� ��;�}`�"@�g$Z�9�����uo�,�/��%p�������<�GN �)K���]��3�\�s��3�_�}��{� 6@0�K����_�fX�r�P��o�2J�$ ��i��C��4Lw��������8I
_Q�BS���?#>����������M�P�      \   Y   x�ʻ�0���!�����y�X[�g fa1$���6�wSIVB=XDi��W�X�����4��k�E"g#2��ngҌm �6�      ]   �  x�eT�nG=�|E�|����8�a0�F�o'B���,���BJ�s�)��K���,��=U]�ޫ׳�x'�˥x�b	�B_x1��;0bn�A]�e���|�>z1?g�]�!��TʐIOtG0q^{G8q����G�ɡ�)��cBE��T�z��ѻ��������U���2�1e�4l�o��]���S�n�Fo^O��?��v���r6}��!�@��1���=��k7�[oE��2�=~ݒ��S,#�GN�w�n��a��Uu�Tm2��@�	\\̺W]��T��u��;Uy�ckO��XV��1����dr��#g�uO.y���t�=�m���W'���w$��u1%��%�Eg��i��y�$J0�q0{��[Uw�����%F\�F��Kŭ���8��i�����(��-����r������U����x�V�W�r%�`�'� �=��
>%-6V��Ajl�z1������6��I����z�aW밙G]������O0����o��l��@�!r���Ċ��5����{յ&- n�;a���ba�e�ۉG8��خ�P����2��b_|�5�]��<]�'���U�zZ�3���TR��Z��o�����b�%J$ɢ2̈́�@������\��(�j*l���|�bbd��~Ϊ�O�6���o���Fr,���P�y���#ɞ��Uzz��a�s��Q��O�3j#���g��%7��|�a�='�q Ͱh��'M���+�4      ^   �   x����@�����D�D`9rr���������%|c�����S�dJ�`�!n��i*u69���]�`Q���ى������hi�%��P�i��e�f�9��G�8�m�SҧMs�3�e�mg=('M�� �x�x]� և<      _   X  x�u��RA�ϽO���U|)�]X,�B)��f�lCOgLw,o�cx��xt_���R"���I:�/���Je�S���!��;�f�-D��й��N��`#CH�Z���]��l�#sF��'��_�II�r03���%ٜ���}[�f{��:��P�.�W(��4�%*�$B��%^�=�� �ܠ��t.�(���{(�yc���wf��z��T���,[;{f��sc��I�bs�AoqPL�''c�	Q-0��Xq���Gr�&_Z%��ֲ�k�	�ˇU�!,`L_���Ԗsv
�da�|�ÀB�n��*K�j�d��ޮ9�izmZ�*��Q��59�?}LBĬ�Go�3� �مB�׳FWԨ?��pT`T���u��I�D/t9R�]s�~��~r<�����<�y?ks>'8ȡ$��>N����3�f�%�0� ��}�%�5T�+��v�0�%�;u�^���y;�nT�K�tu��NB�HcZ� �f���&ET��keڗ��L8���	� WO��D<k���^�D��ؼ\�|�����e6c]0��n�>�a�����\�ںU��ѯ���wtH��y�ck�3��O�x<>���o�^G      `   $   x�3�K�K�*M�I�2�t����M�L����� H      b   �  x��T�n�@}^�b~�6�\�͵DB��>�e��0b=�wi��>�;�cC#%�Qe![Hsv�m��������|��y�C ��K�%YaἹq7n-Upb�n�tz�����E	0�e��*3�-�h�I��;�[Hu\���0���6y�m��[\��S���*ڍ���L(��L�$Yۤy�܋�
�GP��+�PXÙGA�Z�k�c���e�i� �sfZ�3,+ڙA�Jf�Nv(�`F��bY��p��׺�Rk���S5�<��VZ�:�;s��Uk�+,���43y�y�{�3�!��J�!̸"p? �S}y�`k��J���~��D!�?U# K�J�C:o���Ifh|�Jh�vo�۫_F)�j���*����y�i�6��*gM9�&�V�%
��k�f�R��^���n��}�(�tA`Q����hn���.�Ȟw��i��4v����<Qa�|`�d�8zfq���������؟��!�}�%1g~�*Ϲ���p��\�FcM�.���u��ϱ�np��ڏ���|`���<\iA���!o�A�����ف���R�T��N:�ɕD��/8٪�Ś
���T#���Oa�@�4D�Gx�$���_����	�]1ɚ�u���jh��@5ԓ^nfV?vne�Я~~bh����$������|��j�� x�,�      c   �   x�}�Mk1��3?F��c�&h-Xz�[/��hS&�%����j���4ᙗg^��Q��[X�[��Ӑ4������ʤS�`�nȉz_�<x�;�-�8���:��8�W��Y��At��x3Z��x�r�[����U���-lh'����%x�)BWl�wGt3�?�g�\&�W��;�O&���΂7��rc�a.4�*��c<�xE7h��F����M��џ=      e   �  x�}S�n�@|N��_p�PJ�  �t�����Įv7E��3�)٤ǽD��؞�g�*=�"z��W� ��#V��=L�)�U��*K��/}~��áb	*�"i�Q� e�C�p�E��l�G.�{��9*]����:ߧͧ���=#l�i�%~q+��Nᅝv�������?��
��rȏ�fxҿ��l��P�YA��2��Z��R1?x�
�N��ȟ����YK�6�H�lK��J����4i�nӨ�gk;��PnPNe�r���6Դ]�_���6'CpvW�'��3&>;\�b����p�왚� ��	�t�a�6T_�,G��B�a�B��>(:g�ʞ|Y3�Z����:ҝ.QLQ�q�+��b3e�sc:͑�=��OU̳KO�ӯ�n�˥���9���n�1��H���J��S׶��N��]I�0�LM?��2�H��3��N��o�~��ɻ}���PK��OسȐ��G�� ��#      f   x  x�mR[��0��N���7i8M/�E��f"�2���,r�����b���Oq0�<��r�>�M�&&5�$�\��Fp�+Y\b�^�#KTiV�62��/�0z,��</��c���5`�m��r��v�i=Z�_��d��8��)<���;}�RӢ��(GSS8d1���N(#�%28��a3s�uP�ӽiM�7��0��h�f��t{�(��g���Ӊ��|��"��ה������@�hCj���0���F�
�#{�:��D����	�)������2RL���p(~`˱ұ��RZ~2�Oz�{'z}}d�)U���L������[[�%�����LѢ���F�p��pc<AG^�'���r��<�"�      g   �  x��R[n�@�֞bO�;�װ#2Ң�#Q�����P��|�R��-���;�ù�lA�䫯�
�,b���+����H��R�ا�|`�l��y��%��,�]����<R^��`�����9��T'��� ����&g��9q���a���#�=�Q��9�~U%�]Kή���Zw�F�%���m��-1���O>ۘ�е]�?��I��
�zL�c�k��A?�#�S;qC�]�Ì��M;)8o�իP�=�B9c;b��=�ǠG�1D4�~�<u�T��q����ctz{g�����o�����)�{���o���vO�Y&��S(5�{��G�ڞ���p?+�����z��1��SY��ͺ��=wn-]�v���vmH�y{/)W��T]n@�~Ss�Џ�·E&;�ƞ����f-���1�7x�9\      h   Z  x��V�r�8][_�*���aIHH:�LHg��fs�/X�,Q�L���,�;�����2��!��8��+OS0-�;�ƛ{s0F+�Ns'P�������,$���T
��9Gν�k.��|)��E,���nQY�0����]�(�#��HYwt�`0�2�5��c��A�g4	�>���b��=J���r����g����LH~.����|Y��|b�aS���>�PN?��Zpmt�z���Pk�؊MG��J=�k����,�fo�m��ѹQ��D���uh���BK�A\�E�,w�O��1WS�:�*@#b �pT�z�Z��I�ټ��+}��ԠFCv��qn��
�R+�D
���؍NA)���L$�.��U'����~�[�7ՙ�)HTϥ�n����R%�6D��WL�R"����zxx#�-�+��R��S+*jGa���g��i�k<!���7~M��)�Z��l0B	���lG[E�Ֆ�帣�gTk�Yg�0 �s|��D�Ō�%�X�.�zǝ(��]��6�(%9`w����5�M�V��M��i﵂�؝�S-i����:�j��-֮[�qr'O�-�SH�H�}(�H��ST�j���N��7�ȝ��h���h�@�e!^�7�� <����	�pcU�/g��$5	a�wH�����Ic�Z�~�}Vn���G�Rx�-=�7�a�=iz�ؘ�J81���q]���R򙰛T���f�zl��5���~�w��1qe�I����Zv�O͏����ð6yĮ ��<�J����[�d��r�+��k���V3��i��5�������.�v�5!��e.�V]���Нոu����>vtC����>��_�Q%���b[|r����r@F8b���\��)�F�w�v4>����i��N�|F
�as�����V���v�}z��A=ި�1��0��T��M�tG�������<FzyP�y?.���3뀺8���R:�F0��[$��0�{�ݪ5[�K)rJo(���g}Eu[�Il&.�t#�Q/�~���8��?�kv�B-���}����|Ɨ�"��'��҈��T���?���2�~&��      i   .  x����N�@���O1/�}���J�!ƛIwh7lg��Ax{LPj���9sά�Pt�썸E-�|6�Ԫ�ڰ�dc5q�!� 3�![`@�!,�G��fȧ�pH�.��]����;du��0�Oa*t�4��L�Tݡ�i�J9~�i�<�qgY�T�'����Pʧ���{5�.����z�CV���BI��ީ��4��԰%�{�^�1k�i���h�P�Ž��.���wE3V���uE�D�u�R�-��ɑYX"�,��>V;�
C�*:�\.P�f�R�~K��yo���c�q����
�4      j   /   x��M,*K�Q/V.�LI-��M���I�.I,���S0����� Y      k   S   x�p�
�I�.I,���S0Fᙠ�L�"��+�� ��T#8�(3U!��/3�$5/%_!<3�����g�$gp��qqq 8�(�      l   <  x��UK�9]w�B|�� ?`&h��ʆUf�Tb�T2��&�b0G���(U�rW��.��{���<qto2�ot'#8�TlO��G9��`��ݓ$��ٻ�2E��zd���i��t1ߦ�ؑʍz�Q��M�7���A����9�<�Qn��K��ۀחdn�lHKht��>����k�S��$*��##�ce��������
����h�5�!G����̎Jwȸ�6��}�^��,'��?.�5W�Ж�gt�rrr_��+*D�)'��D��!Qm|r�0L���]��b��>��߇Y<�A��������/p��۴Δ����= _��nE�V�_�~�Rq�fB������ �>f\���q$��^'��3�6�|��e��[ʹZ��{/�p�9�#�˵-h�Q�w��/�[=�p���t�G�0M��%垆I+�6]����ڭ�.?A���r�0ݬ(b�MƮ{�sQA�kRMw益U�\��4l�������0-�8����l�l�`a��M�Z�"n�4�u� �>�!6]4S(���>ـ�֏҃W�Aݽ�9��Mv9��#��2nI�u�/�� aڽ��Ƚֱ��rBqTLt)7�Z��z����u�ܢTj�����Fm����?�z��`d��l5t���TC1@�0��c��6��.��o\��_�_�^�MӇ����)�Us�� ϊ���������E��#�6 S�q�������o���G�'3�v�Q_I[���^ap�A���zU^2��/�V�(T��wzr�х?����s.7/f��,�3ْ��Tt�}�u]�E      m   �  x���Qr1���S��C!I)���C_����kQ�N&�MЇN�����6ax	��g��/��Eݗd�bv(�.���b��%y����ڠaM%�yp�Zд�c��,�i1U�2�Р�Bl؀���cD��4�!ؘ6�&��CJ�p+�O��\��+�Si	��6�A:��(�[G�v�������)W`՘�z�<�D��%zٿjO1~��u?B��Y5����4w���Y��x�Z����3��n�]-�G� ۞V�6d�аuۗk��J���G���H�� :�'���p�H�t�P�*��%5���/��x�}5�[r>�����^'ԇB͠"Ps���ų����̚<��XH�z[lȽ�QAgD&�\4[M��im�S+~�C6�B�ƾ�2�ƫ�=8�i�a�j^������|Ȭ/7q��-���"��?S��~w�ˌjz?�CÒ��:���,;��[f���]�9����`��|B      n   B   x���/O,JQ.I,���ϫ�0�\3K�29C2��S2���R
R��KJ�����qqq ��D      o      x������ � �      p      x������ � �      q     x����N�@E��W�ʢؕT���6fr�XI�hf�_�DB�*;���>r-�>�c0����Z;K�����'�M�'�� ������Y"Fu�K�4����(�����=�W�\�4�����5�K�΢/-x�|��r��d��gɹ48h?���|oM���{�y�5�Y,ۮ�R��6m�ҟ���?���}/!ךmG�xOs�x� *%$˿�Gͼ������+ሠ`&����^���vQ� �T      r   ?   x�3�4ճ��t��I\F�� �������\�e�ih�, a.NN���T0����� �	      s      x�]�Q!D��.6��.w��ϱ�m*�0�1/*��a�"�E'C�Ѵ3��-��9n�����W���~�y�TQ���D��2�JvpdVE8�z����|��{<S�U�|>��
�����TQDl���b�[f:(      t      x����n� ���]$3��w�Mo�'ؤA%���>�nZ���F"~�4~^��٩w��:�~�A!�(�5��K��ʱ̩��j �+SZI"D
��m�&O�Ӎ��G�(M���}����0�������)�w<v5\�#��&��NnY���F�n_�Be���z8_�m��%�Y�g��z�R�je5,�y�5�Q���p�q�S	���:�4��cN�\��PL��q�'���ɔ+W>�Yۍ��lİ����*� {��X�b�<�C,.�^�E�"�,��*�      u   �  x�MRQr1��O�p��)��&LS``�Q�ʮ�kiG�w&܆#0�CN�>,[������'����xv�����ŗ��֤*6u�G�ݐb(�V�I�Q�ŭ/0� U�74�Z�%q7����W�5�I2,����V�[�':ga�\�����B�*fc�+�	Y�i��#����q�-ӃpO�V��˟�l��#�s��h�|�a"�l�q�ewJVJ���q�[�,��<�O��9�%�j}�ӵ���h��w�Y�di/�J�w�ѯ�[�Z�<��0�	s1��#j��b��k�5�Ƌ<�R�]�%�lzwE��2�{+\"Wk@CE6�J쭍b��Gadw������in�4O�I��&4�6YM��wt�&��vhLP�o �L��wmsW��&���/�J�I����4p6��왊�/|¯�`3�\L�%.�-Ì���w���!     