PGDMP         *                {            Backup1    15.3    15.3 �    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
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
       public         heap    postgres    false            �            1259    24677    Combate    TABLE     �   CREATE TABLE public."Combate" (
    "N_Personaje" text NOT NULL,
    "N_Poder" text NOT NULL,
    "N_Objeto" text NOT NULL,
    "Lugar" text NOT NULL,
    "Fecha" date NOT NULL
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
       public          postgres    false    225            �           0    0    Estado_Id_Estado_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public."Estado_Id_Estado_seq" OWNED BY public."Estado"."Id_Estado";
          public          postgres    false    226            �            1259    24710    Heroe    TABLE     6  CREATE TABLE public."Heroe" (
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
       public          postgres    false    235            �           0    0    Pais_Id_Pais_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public."Pais_Id_Pais_seq" OWNED BY public."Pais"."Id_Pais";
          public          postgres    false    236            �            1259    24759    Pelicula    TABLE     �  CREATE TABLE public."Pelicula" (
    "T_Pelicula" text NOT NULL,
    "Director" text NOT NULL,
    "Duracion" integer NOT NULL,
    "Coste" integer NOT NULL,
    "Ganancia" integer NOT NULL,
    "Distribuidor" text,
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
       public          postgres    false    238            �           0    0    Perfil_Id_Perfil_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public."Perfil_Id_Perfil_seq" OWNED BY public."Perfil"."Id_Perfil";
          public          postgres    false    239            �            1259    24774    Pers_Creador    TABLE     g   CREATE TABLE public."Pers_Creador" (
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
       public         heap    postgres    false                        1259    24864    Villano    TABLE     q   CREATE TABLE public."Villano" (
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
       public          postgres    false    226    225                       2604    24872    Pais Id_Pais    DEFAULT     r   ALTER TABLE ONLY public."Pais" ALTER COLUMN "Id_Pais" SET DEFAULT nextval('public."Pais_Id_Pais_seq"'::regclass);
 ?   ALTER TABLE public."Pais" ALTER COLUMN "Id_Pais" DROP DEFAULT;
       public          postgres    false    236    235                       2604    24873    Perfil Id_Perfil    DEFAULT     z   ALTER TABLE ONLY public."Perfil" ALTER COLUMN "Id_Perfil" SET DEFAULT nextval('public."Perfil_Id_Perfil_seq"'::regclass);
 C   ALTER TABLE public."Perfil" ALTER COLUMN "Id_Perfil" DROP DEFAULT;
       public          postgres    false    239    238            S          0    24654    Aparece 
   TABLE DATA           R   COPY public."Aparece" ("N_Organizacion", "N_Titulo", "Estado", "Rol") FROM stdin;
    public          postgres    false    214   �$      T          0    24660    Cargo 
   TABLE DATA           =   COPY public."Cargo" ("Cod_Cargo", "Descripcion") FROM stdin;
    public          postgres    false    215   0%      V          0    24666    Ciudad 
   TABLE DATA           F   COPY public."Ciudad" ("Id_Ciudad", "Nombre", "Id_Estado") FROM stdin;
    public          postgres    false    217   y%      X          0    24672    Civil 
   TABLE DATA           ,   COPY public."Civil" ("N_Civil") FROM stdin;
    public          postgres    false    219   �%      Y          0    24677    Combate 
   TABLE DATA           [   COPY public."Combate" ("N_Personaje", "N_Poder", "N_Objeto", "Lugar", "Fecha") FROM stdin;
    public          postgres    false    220   &      Z          0    24682    Crea 
   TABLE DATA           ;   COPY public."Crea" ("N_Personaje", "N_Objeto") FROM stdin;
    public          postgres    false    221   %&      [          0    24687    Creador 
   TABLE DATA           2   COPY public."Creador" ("Nom_Creador") FROM stdin;
    public          postgres    false    222   �&      \          0    24692    Enfrenta 
   TABLE DATA           <   COPY public."Enfrenta" ("N_Heroe", "N_Villano") FROM stdin;
    public          postgres    false    223   1'      ]          0    24697    Esta 
   TABLE DATA           Y   COPY public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") FROM stdin;
    public          postgres    false    224   N'      ^          0    24704    Estado 
   TABLE DATA           D   COPY public."Estado" ("Id_Estado", "Nombre", "Id_Pais") FROM stdin;
    public          postgres    false    225   )      `          0    24710    Heroe 
   TABLE DATA           `   COPY public."Heroe" ("N_Heroe", "Alias", "Logotipo", "Color_Traje", "Archienemigo") FROM stdin;
    public          postgres    false    227   h)      a          0    24716 	   Historial 
   TABLE DATA           i   COPY public."Historial" ("N_Titulo", "Id_Perfil", "Calificacion", "Hora_Inicio", "Hora_Fin") FROM stdin;
    public          postgres    false    228   �*      b          0    24722    Juego 
   TABLE DATA           D   COPY public."Juego" ("T_Juego", "Distribuidor", "Tipo") FROM stdin;
    public          postgres    false    229   �*      c          0    24727    Medio 
   TABLE DATA           h   COPY public."Medio" ("Titulo", "Fecha_Estreno", "Compania", "Rating", "Sinopsis", "Imagen") FROM stdin;
    public          postgres    false    230   �*      d          0    24733    Nacionalidad 
   TABLE DATA           /   COPY public."Nacionalidad" ("Nac") FROM stdin;
    public          postgres    false    231   60      e          0    24738    Objeto 
   TABLE DATA           h   COPY public."Objeto" ("Nombre", "Descripcion", "Material", "Tipo", "Imagen", "N_Personaje") FROM stdin;
    public          postgres    false    232   �0      f          0    24743 	   Ocupacion 
   TABLE DATA           -   COPY public."Ocupacion" ("Ocup") FROM stdin;
    public          postgres    false    233   Q2      g          0    24748    Organizacion 
   TABLE DATA           �   COPY public."Organizacion" ("Nombre", "Eslogan", "Lider", "Fundador", "Tipo", "Nom_Comic", "Imagen", "Objetivo", "Lugar_Creacion") FROM stdin;
    public          postgres    false    234   �2      h          0    24753    Pais 
   TABLE DATA           5   COPY public."Pais" ("Id_Pais", "Nombre") FROM stdin;
    public          postgres    false    235   �4      j          0    24759    Pelicula 
   TABLE DATA           o   COPY public."Pelicula" ("T_Pelicula", "Director", "Duracion", "Coste", "Ganancia", "Distribuidor") FROM stdin;
    public          postgres    false    237   5      k          0    24767    Perfil 
   TABLE DATA           e   COPY public."Perfil" ("Id_Perfil", "Dispositivo", "Nombre", "Idioma", "Email", "Imagen") FROM stdin;
    public          postgres    false    238   6      m          0    24774    Pers_Creador 
   TABLE DATA           D   COPY public."Pers_Creador" ("N_Personaje", "N_Creador") FROM stdin;
    public          postgres    false    240   �6      n          0    24779    Pers_Nac 
   TABLE DATA           C   COPY public."Pers_Nac" ("N_Personaje", "Nacionalidad") FROM stdin;
    public          postgres    false    241   28      o          0    24784    Pers_Oc 
   TABLE DATA           ?   COPY public."Pers_Oc" ("N_Personaje", "Ocupacion") FROM stdin;
    public          postgres    false    242   P9      p          0    24789 	   Personaje 
   TABLE DATA           w   COPY public."Personaje" ("Nombre", "Genero", "Color_Ojos", "Color_Pelo", "Nom_Comic", "E_Marital", imagen) FROM stdin;
    public          postgres    false    243   t:      q          0    24798 	   Pertenece 
   TABLE DATA           S   COPY public."Pertenece" ("N_Personaje", "N_Organizacion", "Cod_Cargo") FROM stdin;
    public          postgres    false    244   �?      r          0    24803 
   Plat_Juego 
   TABLE DATA           ?   COPY public."Plat_Juego" ("T_Juego", "Plataforma") FROM stdin;
    public          postgres    false    245   �@      s          0    24808 
   Plataforma 
   TABLE DATA           .   COPY public."Plataforma" (nombre) FROM stdin;
    public          postgres    false    246   �@      t          0    24813    Poder 
   TABLE DATA           D   COPY public."Poder" ("Nombre", "Imagen", "Descripcion") FROM stdin;
    public          postgres    false    247   QA      u          0    24818    Posee 
   TABLE DATA           H   COPY public."Posee" ("N_Personaje", "N_Poder", "Obtencion") FROM stdin;
    public          postgres    false    248   �C      v          0    24824    RelacionadoHer 
   TABLE DATA           @   COPY public."RelacionadoHer" ("N_Civil", "N_Heroe") FROM stdin;
    public          postgres    false    249   �D      w          0    24829    RelacionadoVill 
   TABLE DATA           C   COPY public."RelacionadoVill" ("N_Civil", "N_Villano") FROM stdin;
    public          postgres    false    250   E      x          0    24834    Sede 
   TABLE DATA           W   COPY public."Sede" ("Nombre", "Tipo_Edif", "Ubicacion", "Imagen", "N_Org") FROM stdin;
    public          postgres    false    251   *E      y          0    24839    Serie 
   TABLE DATA           O   COPY public."Serie" ("T_Serie", "N_Episodios", "Creador", "Canal") FROM stdin;
    public          postgres    false    252   GE      z          0    24844    Suscripcion 
   TABLE DATA           N   COPY public."Suscripcion" ("ID", "Tarifa", "Descripcion", "Tipo") FROM stdin;
    public          postgres    false    253   dE      {          0    24851    Tarjeta 
   TABLE DATA           N   COPY public."Tarjeta" ("N_Tarjeta", "Cod_Seguridad", "Fecha_Ven") FROM stdin;
    public          postgres    false    254   �E      |          0    24858    Usuario 
   TABLE DATA           �   COPY public."Usuario" ("Email", "Contrasena", "Nombre", "Apellido", "Fecha_Nac", "Fecha_Creacion", "Id_Suscripcion", "N_Tarjeta", "Direccion") FROM stdin;
    public          postgres    false    255    F      }          0    24864    Villano 
   TABLE DATA           E   COPY public."Villano" ("N_Villano", "Alias", "Objetivo") FROM stdin;
    public          postgres    false    256   6G      �           0    0    Cargo_Cod_Cargo_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public."Cargo_Cod_Cargo_seq"', 1, false);
          public          postgres    false    216            �           0    0    Ciudad_Id_Ciudad_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public."Ciudad_Id_Ciudad_seq"', 4, true);
          public          postgres    false    218            �           0    0    Estado_Id_Estado_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public."Estado_Id_Estado_seq"', 3, true);
          public          postgres    false    226            �           0    0    Pais_Id_Pais_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public."Pais_Id_Pais_seq"', 2, true);
          public          postgres    false    236            �           0    0    Perfil_Id_Perfil_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public."Perfil_Id_Perfil_seq"', 5, true);
          public          postgres    false    239            "           2606    24875    Aparece Aparece_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public."Aparece"
    ADD CONSTRAINT "Aparece_pkey" PRIMARY KEY ("N_Organizacion", "N_Titulo");
 B   ALTER TABLE ONLY public."Aparece" DROP CONSTRAINT "Aparece_pkey";
       public            postgres    false    214    214            $           2606    24877    Cargo Cargo_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public."Cargo"
    ADD CONSTRAINT "Cargo_pkey" PRIMARY KEY ("Cod_Cargo");
 >   ALTER TABLE ONLY public."Cargo" DROP CONSTRAINT "Cargo_pkey";
       public            postgres    false    215            &           2606    24879    Ciudad Ciudad_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public."Ciudad"
    ADD CONSTRAINT "Ciudad_pkey" PRIMARY KEY ("Id_Ciudad");
 @   ALTER TABLE ONLY public."Ciudad" DROP CONSTRAINT "Ciudad_pkey";
       public            postgres    false    217            (           2606    24881    Civil Civil_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public."Civil"
    ADD CONSTRAINT "Civil_pkey" PRIMARY KEY ("N_Civil");
 >   ALTER TABLE ONLY public."Civil" DROP CONSTRAINT "Civil_pkey";
       public            postgres    false    219            *           2606    24883    Combate Combate_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public."Combate"
    ADD CONSTRAINT "Combate_pkey" PRIMARY KEY ("N_Personaje", "N_Poder", "N_Objeto");
 B   ALTER TABLE ONLY public."Combate" DROP CONSTRAINT "Combate_pkey";
       public            postgres    false    220    220    220            ,           2606    24885    Crea Crea_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY public."Crea"
    ADD CONSTRAINT "Crea_pkey" PRIMARY KEY ("N_Personaje", "N_Objeto");
 <   ALTER TABLE ONLY public."Crea" DROP CONSTRAINT "Crea_pkey";
       public            postgres    false    221    221            .           2606    24887    Creador Creador_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public."Creador"
    ADD CONSTRAINT "Creador_pkey" PRIMARY KEY ("Nom_Creador");
 B   ALTER TABLE ONLY public."Creador" DROP CONSTRAINT "Creador_pkey";
       public            postgres    false    222            0           2606    24889    Enfrenta Enfrenta_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public."Enfrenta"
    ADD CONSTRAINT "Enfrenta_pkey" PRIMARY KEY ("N_Heroe", "N_Villano");
 D   ALTER TABLE ONLY public."Enfrenta" DROP CONSTRAINT "Enfrenta_pkey";
       public            postgres    false    223    223            2           2606    24891    Esta Esta_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY public."Esta"
    ADD CONSTRAINT "Esta_pkey" PRIMARY KEY ("N_Personaje", "N_Titulo");
 <   ALTER TABLE ONLY public."Esta" DROP CONSTRAINT "Esta_pkey";
       public            postgres    false    224    224            4           2606    24893    Estado Estado_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public."Estado"
    ADD CONSTRAINT "Estado_pkey" PRIMARY KEY ("Id_Estado");
 @   ALTER TABLE ONLY public."Estado" DROP CONSTRAINT "Estado_pkey";
       public            postgres    false    225            6           2606    24895    Heroe Heroe_Alias_key 
   CONSTRAINT     W   ALTER TABLE ONLY public."Heroe"
    ADD CONSTRAINT "Heroe_Alias_key" UNIQUE ("Alias");
 C   ALTER TABLE ONLY public."Heroe" DROP CONSTRAINT "Heroe_Alias_key";
       public            postgres    false    227            8           2606    24897    Heroe Heroe_Logotipo_key 
   CONSTRAINT     ]   ALTER TABLE ONLY public."Heroe"
    ADD CONSTRAINT "Heroe_Logotipo_key" UNIQUE ("Logotipo");
 F   ALTER TABLE ONLY public."Heroe" DROP CONSTRAINT "Heroe_Logotipo_key";
       public            postgres    false    227            :           2606    24899    Heroe Heroe_N_Heroe_key 
   CONSTRAINT     [   ALTER TABLE ONLY public."Heroe"
    ADD CONSTRAINT "Heroe_N_Heroe_key" UNIQUE ("N_Heroe");
 E   ALTER TABLE ONLY public."Heroe" DROP CONSTRAINT "Heroe_N_Heroe_key";
       public            postgres    false    227            <           2606    24901    Historial Historial_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY public."Historial"
    ADD CONSTRAINT "Historial_pkey" PRIMARY KEY ("N_Titulo", "Id_Perfil");
 F   ALTER TABLE ONLY public."Historial" DROP CONSTRAINT "Historial_pkey";
       public            postgres    false    228    228            >           2606    24903    Juego Juego_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public."Juego"
    ADD CONSTRAINT "Juego_pkey" PRIMARY KEY ("T_Juego");
 >   ALTER TABLE ONLY public."Juego" DROP CONSTRAINT "Juego_pkey";
       public            postgres    false    229            @           2606    24905    Medio Medio_Imagen_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public."Medio"
    ADD CONSTRAINT "Medio_Imagen_key" UNIQUE ("Imagen");
 D   ALTER TABLE ONLY public."Medio" DROP CONSTRAINT "Medio_Imagen_key";
       public            postgres    false    230            B           2606    24907    Medio Medio_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public."Medio"
    ADD CONSTRAINT "Medio_pkey" PRIMARY KEY ("Titulo");
 >   ALTER TABLE ONLY public."Medio" DROP CONSTRAINT "Medio_pkey";
       public            postgres    false    230            D           2606    24909    Nacionalidad Nacionalidad_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public."Nacionalidad"
    ADD CONSTRAINT "Nacionalidad_pkey" PRIMARY KEY ("Nac");
 L   ALTER TABLE ONLY public."Nacionalidad" DROP CONSTRAINT "Nacionalidad_pkey";
       public            postgres    false    231            F           2606    24911    Objeto Objeto_Imagen_key 
   CONSTRAINT     [   ALTER TABLE ONLY public."Objeto"
    ADD CONSTRAINT "Objeto_Imagen_key" UNIQUE ("Imagen");
 F   ALTER TABLE ONLY public."Objeto" DROP CONSTRAINT "Objeto_Imagen_key";
       public            postgres    false    232            H           2606    24913    Objeto Objeto_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public."Objeto"
    ADD CONSTRAINT "Objeto_pkey" PRIMARY KEY ("Nombre");
 @   ALTER TABLE ONLY public."Objeto" DROP CONSTRAINT "Objeto_pkey";
       public            postgres    false    232            J           2606    24915    Ocupacion Ocupacion_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public."Ocupacion"
    ADD CONSTRAINT "Ocupacion_pkey" PRIMARY KEY ("Ocup");
 F   ALTER TABLE ONLY public."Ocupacion" DROP CONSTRAINT "Ocupacion_pkey";
       public            postgres    false    233            L           2606    24917 &   Organizacion Organizacion_Fundador_key 
   CONSTRAINT     k   ALTER TABLE ONLY public."Organizacion"
    ADD CONSTRAINT "Organizacion_Fundador_key" UNIQUE ("Fundador");
 T   ALTER TABLE ONLY public."Organizacion" DROP CONSTRAINT "Organizacion_Fundador_key";
       public            postgres    false    234            N           2606    24919 $   Organizacion Organizacion_Imagen_key 
   CONSTRAINT     g   ALTER TABLE ONLY public."Organizacion"
    ADD CONSTRAINT "Organizacion_Imagen_key" UNIQUE ("Imagen");
 R   ALTER TABLE ONLY public."Organizacion" DROP CONSTRAINT "Organizacion_Imagen_key";
       public            postgres    false    234            P           2606    24921 #   Organizacion Organizacion_Lider_key 
   CONSTRAINT     e   ALTER TABLE ONLY public."Organizacion"
    ADD CONSTRAINT "Organizacion_Lider_key" UNIQUE ("Lider");
 Q   ALTER TABLE ONLY public."Organizacion" DROP CONSTRAINT "Organizacion_Lider_key";
       public            postgres    false    234            R           2606    24923    Organizacion Organizacion_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public."Organizacion"
    ADD CONSTRAINT "Organizacion_pkey" PRIMARY KEY ("Nombre");
 L   ALTER TABLE ONLY public."Organizacion" DROP CONSTRAINT "Organizacion_pkey";
       public            postgres    false    234            T           2606    24925    Pais Pais_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public."Pais"
    ADD CONSTRAINT "Pais_pkey" PRIMARY KEY ("Id_Pais");
 <   ALTER TABLE ONLY public."Pais" DROP CONSTRAINT "Pais_pkey";
       public            postgres    false    235            V           2606    24927    Pelicula Pelicula_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public."Pelicula"
    ADD CONSTRAINT "Pelicula_pkey" PRIMARY KEY ("T_Pelicula");
 D   ALTER TABLE ONLY public."Pelicula" DROP CONSTRAINT "Pelicula_pkey";
       public            postgres    false    237            X           2606    24929    Perfil Perfil_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public."Perfil"
    ADD CONSTRAINT "Perfil_pkey" PRIMARY KEY ("Id_Perfil");
 @   ALTER TABLE ONLY public."Perfil" DROP CONSTRAINT "Perfil_pkey";
       public            postgres    false    238            Z           2606    24931    Pers_Creador Pers_Creador_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public."Pers_Creador"
    ADD CONSTRAINT "Pers_Creador_pkey" PRIMARY KEY ("N_Personaje", "N_Creador");
 L   ALTER TABLE ONLY public."Pers_Creador" DROP CONSTRAINT "Pers_Creador_pkey";
       public            postgres    false    240    240            \           2606    24933    Pers_Nac Pers_Nac_pkey 
   CONSTRAINT     s   ALTER TABLE ONLY public."Pers_Nac"
    ADD CONSTRAINT "Pers_Nac_pkey" PRIMARY KEY ("N_Personaje", "Nacionalidad");
 D   ALTER TABLE ONLY public."Pers_Nac" DROP CONSTRAINT "Pers_Nac_pkey";
       public            postgres    false    241    241            ^           2606    24935    Pers_Oc Pers_Oc_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public."Pers_Oc"
    ADD CONSTRAINT "Pers_Oc_pkey" PRIMARY KEY ("N_Personaje", "Ocupacion");
 B   ALTER TABLE ONLY public."Pers_Oc" DROP CONSTRAINT "Pers_Oc_pkey";
       public            postgres    false    242    242            `           2606    24937    Personaje Personaje_Nombre_key 
   CONSTRAINT     a   ALTER TABLE ONLY public."Personaje"
    ADD CONSTRAINT "Personaje_Nombre_key" UNIQUE ("Nombre");
 L   ALTER TABLE ONLY public."Personaje" DROP CONSTRAINT "Personaje_Nombre_key";
       public            postgres    false    243            b           2606    24939    Personaje Personaje_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public."Personaje"
    ADD CONSTRAINT "Personaje_pkey" PRIMARY KEY ("Nombre");
 F   ALTER TABLE ONLY public."Personaje" DROP CONSTRAINT "Personaje_pkey";
       public            postgres    false    243            d           2606    24941    Pertenece Pertenece_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public."Pertenece"
    ADD CONSTRAINT "Pertenece_pkey" PRIMARY KEY ("N_Personaje", "N_Organizacion", "Cod_Cargo");
 F   ALTER TABLE ONLY public."Pertenece" DROP CONSTRAINT "Pertenece_pkey";
       public            postgres    false    244    244    244            f           2606    24943    Plat_Juego Plat_Juego_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY public."Plat_Juego"
    ADD CONSTRAINT "Plat_Juego_pkey" PRIMARY KEY ("T_Juego", "Plataforma");
 H   ALTER TABLE ONLY public."Plat_Juego" DROP CONSTRAINT "Plat_Juego_pkey";
       public            postgres    false    245    245            h           2606    24945    Plataforma Plataforma_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public."Plataforma"
    ADD CONSTRAINT "Plataforma_pkey" PRIMARY KEY (nombre);
 H   ALTER TABLE ONLY public."Plataforma" DROP CONSTRAINT "Plataforma_pkey";
       public            postgres    false    246            j           2606    24947    Poder Poder_Imagen_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public."Poder"
    ADD CONSTRAINT "Poder_Imagen_key" UNIQUE ("Imagen");
 D   ALTER TABLE ONLY public."Poder" DROP CONSTRAINT "Poder_Imagen_key";
       public            postgres    false    247            l           2606    24949    Poder Poder_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public."Poder"
    ADD CONSTRAINT "Poder_pkey" PRIMARY KEY ("Nombre");
 >   ALTER TABLE ONLY public."Poder" DROP CONSTRAINT "Poder_pkey";
       public            postgres    false    247            n           2606    24951    Posee Posee_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public."Posee"
    ADD CONSTRAINT "Posee_pkey" PRIMARY KEY ("N_Personaje", "N_Poder");
 >   ALTER TABLE ONLY public."Posee" DROP CONSTRAINT "Posee_pkey";
       public            postgres    false    248    248            p           2606    24953 "   RelacionadoHer RelacionadoHer_pkey 
   CONSTRAINT     v   ALTER TABLE ONLY public."RelacionadoHer"
    ADD CONSTRAINT "RelacionadoHer_pkey" PRIMARY KEY ("N_Civil", "N_Heroe");
 P   ALTER TABLE ONLY public."RelacionadoHer" DROP CONSTRAINT "RelacionadoHer_pkey";
       public            postgres    false    249    249            r           2606    24955 $   RelacionadoVill RelacionadoVill_pkey 
   CONSTRAINT     z   ALTER TABLE ONLY public."RelacionadoVill"
    ADD CONSTRAINT "RelacionadoVill_pkey" PRIMARY KEY ("N_Civil", "N_Villano");
 R   ALTER TABLE ONLY public."RelacionadoVill" DROP CONSTRAINT "RelacionadoVill_pkey";
       public            postgres    false    250    250            t           2606    24957    Sede Sede_Imagen_key 
   CONSTRAINT     W   ALTER TABLE ONLY public."Sede"
    ADD CONSTRAINT "Sede_Imagen_key" UNIQUE ("Imagen");
 B   ALTER TABLE ONLY public."Sede" DROP CONSTRAINT "Sede_Imagen_key";
       public            postgres    false    251            v           2606    24959    Sede Sede_Nombre_key 
   CONSTRAINT     W   ALTER TABLE ONLY public."Sede"
    ADD CONSTRAINT "Sede_Nombre_key" UNIQUE ("Nombre");
 B   ALTER TABLE ONLY public."Sede" DROP CONSTRAINT "Sede_Nombre_key";
       public            postgres    false    251            x           2606    24961    Sede Sede_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public."Sede"
    ADD CONSTRAINT "Sede_pkey" PRIMARY KEY ("Nombre", "N_Org");
 <   ALTER TABLE ONLY public."Sede" DROP CONSTRAINT "Sede_pkey";
       public            postgres    false    251    251            z           2606    24963    Serie Serie_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public."Serie"
    ADD CONSTRAINT "Serie_pkey" PRIMARY KEY ("T_Serie");
 >   ALTER TABLE ONLY public."Serie" DROP CONSTRAINT "Serie_pkey";
       public            postgres    false    252            |           2606    24965     Suscripcion Suscripcion_Tipo_key 
   CONSTRAINT     a   ALTER TABLE ONLY public."Suscripcion"
    ADD CONSTRAINT "Suscripcion_Tipo_key" UNIQUE ("Tipo");
 N   ALTER TABLE ONLY public."Suscripcion" DROP CONSTRAINT "Suscripcion_Tipo_key";
       public            postgres    false    253            ~           2606    24967    Suscripcion Suscripcion_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public."Suscripcion"
    ADD CONSTRAINT "Suscripcion_pkey" PRIMARY KEY ("ID");
 J   ALTER TABLE ONLY public."Suscripcion" DROP CONSTRAINT "Suscripcion_pkey";
       public            postgres    false    253            �           2606    24969    Tarjeta Tarjeta_N_Tarjeta_key 
   CONSTRAINT     c   ALTER TABLE ONLY public."Tarjeta"
    ADD CONSTRAINT "Tarjeta_N_Tarjeta_key" UNIQUE ("N_Tarjeta");
 K   ALTER TABLE ONLY public."Tarjeta" DROP CONSTRAINT "Tarjeta_N_Tarjeta_key";
       public            postgres    false    254            �           2606    24971    Tarjeta Tarjeta_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public."Tarjeta"
    ADD CONSTRAINT "Tarjeta_pkey" PRIMARY KEY ("N_Tarjeta");
 B   ALTER TABLE ONLY public."Tarjeta" DROP CONSTRAINT "Tarjeta_pkey";
       public            postgres    false    254            �           2606    24973    Usuario Usuario_Apellido_key 
   CONSTRAINT     a   ALTER TABLE ONLY public."Usuario"
    ADD CONSTRAINT "Usuario_Apellido_key" UNIQUE ("Apellido");
 J   ALTER TABLE ONLY public."Usuario" DROP CONSTRAINT "Usuario_Apellido_key";
       public            postgres    false    255            �           2606    24975    Usuario Usuario_Nombre_key 
   CONSTRAINT     ]   ALTER TABLE ONLY public."Usuario"
    ADD CONSTRAINT "Usuario_Nombre_key" UNIQUE ("Nombre");
 H   ALTER TABLE ONLY public."Usuario" DROP CONSTRAINT "Usuario_Nombre_key";
       public            postgres    false    255            �           2606    24977    Usuario Usuario_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public."Usuario"
    ADD CONSTRAINT "Usuario_pkey" PRIMARY KEY ("Email");
 B   ALTER TABLE ONLY public."Usuario" DROP CONSTRAINT "Usuario_pkey";
       public            postgres    false    255            �           2606    24979    Villano Villano_Alias_key 
   CONSTRAINT     [   ALTER TABLE ONLY public."Villano"
    ADD CONSTRAINT "Villano_Alias_key" UNIQUE ("Alias");
 G   ALTER TABLE ONLY public."Villano" DROP CONSTRAINT "Villano_Alias_key";
       public            postgres    false    256            �           2606    24981    Villano Villano_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public."Villano"
    ADD CONSTRAINT "Villano_pkey" PRIMARY KEY ("N_Villano");
 B   ALTER TABLE ONLY public."Villano" DROP CONSTRAINT "Villano_pkey";
       public            postgres    false    256            �           2620    24982    Heroe archienemigo_trigger    TRIGGER     �   CREATE TRIGGER archienemigo_trigger BEFORE INSERT OR UPDATE ON public."Heroe" FOR EACH ROW EXECUTE FUNCTION public.archienemigo();
 5   DROP TRIGGER archienemigo_trigger ON public."Heroe";
       public          postgres    false    257    227            �           2620    24983    Historial calificacion_trigger    TRIGGER     �   CREATE TRIGGER calificacion_trigger BEFORE INSERT OR UPDATE ON public."Historial" FOR EACH ROW EXECUTE FUNCTION public.numcalificacion();
 9   DROP TRIGGER calificacion_trigger ON public."Historial";
       public          postgres    false    228    261            �           2620    24984    Personaje emarital_trigger    TRIGGER        CREATE TRIGGER emarital_trigger BEFORE INSERT OR UPDATE ON public."Personaje" FOR EACH ROW EXECUTE FUNCTION public.emarital();
 5   DROP TRIGGER emarital_trigger ON public."Personaje";
       public          postgres    false    258    243            �           2620    24985 !   Pelicula ganancia_perdida_trigger    TRIGGER     �   CREATE TRIGGER ganancia_perdida_trigger BEFORE INSERT OR UPDATE ON public."Pelicula" FOR EACH ROW EXECUTE FUNCTION public.ganancia_perdida();
 <   DROP TRIGGER ganancia_perdida_trigger ON public."Pelicula";
       public          postgres    false    237    259            �           2620    24986    Personaje genero_trigger    TRIGGER     {   CREATE TRIGGER genero_trigger BEFORE INSERT OR UPDATE ON public."Personaje" FOR EACH ROW EXECUTE FUNCTION public.genero();
 3   DROP TRIGGER genero_trigger ON public."Personaje";
       public          postgres    false    260    243            �           2620    24987    Usuario numusuarios_trigger    TRIGGER     �   CREATE TRIGGER numusuarios_trigger BEFORE INSERT OR UPDATE ON public."Usuario" FOR EACH ROW EXECUTE FUNCTION public.numusuarios();
 6   DROP TRIGGER numusuarios_trigger ON public."Usuario";
       public          postgres    false    255    264            �           2620    24988    Medio rating_trigger    TRIGGER     z   CREATE TRIGGER rating_trigger BEFORE INSERT OR UPDATE ON public."Medio" FOR EACH ROW EXECUTE FUNCTION public.numrating();
 /   DROP TRIGGER rating_trigger ON public."Medio";
       public          postgres    false    230    263            �           2620    24989    Esta rolpersonaje_trigger    TRIGGER     �   CREATE TRIGGER rolpersonaje_trigger BEFORE INSERT OR UPDATE ON public."Esta" FOR EACH ROW EXECUTE FUNCTION public.rolpersonaje();
 4   DROP TRIGGER rolpersonaje_trigger ON public."Esta";
       public          postgres    false    265    224            �           2620    24990    Esta tipoactor_trigger    TRIGGER     |   CREATE TRIGGER tipoactor_trigger BEFORE INSERT OR UPDATE ON public."Esta" FOR EACH ROW EXECUTE FUNCTION public.tipoactor();
 1   DROP TRIGGER tipoactor_trigger ON public."Esta";
       public          postgres    false    267    224            �           2620    24991 %   Suscripcion tiposuscripciones_trigger    TRIGGER     �   CREATE TRIGGER tiposuscripciones_trigger BEFORE INSERT OR UPDATE ON public."Suscripcion" FOR EACH ROW EXECUTE FUNCTION public.tiposuscripciones();
 @   DROP TRIGGER tiposuscripciones_trigger ON public."Suscripcion";
       public          postgres    false    253    266            �           2606    24992 #   Aparece Aparece_N_Organizacion_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Aparece"
    ADD CONSTRAINT "Aparece_N_Organizacion_fkey" FOREIGN KEY ("N_Organizacion") REFERENCES public."Organizacion"("Nombre");
 Q   ALTER TABLE ONLY public."Aparece" DROP CONSTRAINT "Aparece_N_Organizacion_fkey";
       public          postgres    false    214    3410    234            �           2606    24997    Aparece Aparece_N_Titulo_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Aparece"
    ADD CONSTRAINT "Aparece_N_Titulo_fkey" FOREIGN KEY ("N_Titulo") REFERENCES public."Medio"("Titulo");
 K   ALTER TABLE ONLY public."Aparece" DROP CONSTRAINT "Aparece_N_Titulo_fkey";
       public          postgres    false    214    3394    230            �           2606    25002    Ciudad Ciudad_Id_Estado_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Ciudad"
    ADD CONSTRAINT "Ciudad_Id_Estado_fkey" FOREIGN KEY ("Id_Estado") REFERENCES public."Estado"("Id_Estado");
 J   ALTER TABLE ONLY public."Ciudad" DROP CONSTRAINT "Ciudad_Id_Estado_fkey";
       public          postgres    false    217    3380    225            �           2606    25007    Civil Civil_N_Civil_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Civil"
    ADD CONSTRAINT "Civil_N_Civil_fkey" FOREIGN KEY ("N_Civil") REFERENCES public."Personaje"("Nombre") NOT VALID;
 F   ALTER TABLE ONLY public."Civil" DROP CONSTRAINT "Civil_N_Civil_fkey";
       public          postgres    false    219    3424    243            �           2606    25012    Combate Combate_N_Objeto_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Combate"
    ADD CONSTRAINT "Combate_N_Objeto_fkey" FOREIGN KEY ("N_Objeto") REFERENCES public."Objeto"("Nombre");
 K   ALTER TABLE ONLY public."Combate" DROP CONSTRAINT "Combate_N_Objeto_fkey";
       public          postgres    false    220    3400    232            �           2606    25017     Combate Combate_N_Personaje_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Combate"
    ADD CONSTRAINT "Combate_N_Personaje_fkey" FOREIGN KEY ("N_Personaje") REFERENCES public."Personaje"("Nombre");
 N   ALTER TABLE ONLY public."Combate" DROP CONSTRAINT "Combate_N_Personaje_fkey";
       public          postgres    false    220    3424    243            �           2606    25022    Combate Combate_N_Poder_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Combate"
    ADD CONSTRAINT "Combate_N_Poder_fkey" FOREIGN KEY ("N_Poder") REFERENCES public."Poder"("Nombre");
 J   ALTER TABLE ONLY public."Combate" DROP CONSTRAINT "Combate_N_Poder_fkey";
       public          postgres    false    3436    247    220            �           2606    25027    Crea Crea_N_Objeto_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Crea"
    ADD CONSTRAINT "Crea_N_Objeto_fkey" FOREIGN KEY ("N_Objeto") REFERENCES public."Objeto"("Nombre");
 E   ALTER TABLE ONLY public."Crea" DROP CONSTRAINT "Crea_N_Objeto_fkey";
       public          postgres    false    232    3400    221            �           2606    25032    Crea Crea_N_Personaje_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Crea"
    ADD CONSTRAINT "Crea_N_Personaje_fkey" FOREIGN KEY ("N_Personaje") REFERENCES public."Personaje"("Nombre");
 H   ALTER TABLE ONLY public."Crea" DROP CONSTRAINT "Crea_N_Personaje_fkey";
       public          postgres    false    243    3424    221            �           2606    25037    Enfrenta Enfrenta_N_Heroe_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Enfrenta"
    ADD CONSTRAINT "Enfrenta_N_Heroe_fkey" FOREIGN KEY ("N_Heroe") REFERENCES public."Heroe"("N_Heroe");
 L   ALTER TABLE ONLY public."Enfrenta" DROP CONSTRAINT "Enfrenta_N_Heroe_fkey";
       public          postgres    false    3386    223    227            �           2606    25042     Enfrenta Enfrenta_N_Villano_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Enfrenta"
    ADD CONSTRAINT "Enfrenta_N_Villano_fkey" FOREIGN KEY ("N_Villano") REFERENCES public."Villano"("N_Villano");
 N   ALTER TABLE ONLY public."Enfrenta" DROP CONSTRAINT "Enfrenta_N_Villano_fkey";
       public          postgres    false    223    3468    256            �           2606    25047    Esta Esta_N_Personaje_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Esta"
    ADD CONSTRAINT "Esta_N_Personaje_fkey" FOREIGN KEY ("N_Personaje") REFERENCES public."Personaje"("Nombre");
 H   ALTER TABLE ONLY public."Esta" DROP CONSTRAINT "Esta_N_Personaje_fkey";
       public          postgres    false    224    3424    243            �           2606    25052    Esta Esta_N_Titulo_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Esta"
    ADD CONSTRAINT "Esta_N_Titulo_fkey" FOREIGN KEY ("N_Titulo") REFERENCES public."Medio"("Titulo");
 E   ALTER TABLE ONLY public."Esta" DROP CONSTRAINT "Esta_N_Titulo_fkey";
       public          postgres    false    3394    224    230            �           2606    25057    Estado Estado_Id_Pais_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Estado"
    ADD CONSTRAINT "Estado_Id_Pais_fkey" FOREIGN KEY ("Id_Pais") REFERENCES public."Pais"("Id_Pais");
 H   ALTER TABLE ONLY public."Estado" DROP CONSTRAINT "Estado_Id_Pais_fkey";
       public          postgres    false    225    3412    235            �           2606    25062    Heroe Heroe_Archienemigo_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Heroe"
    ADD CONSTRAINT "Heroe_Archienemigo_fkey" FOREIGN KEY ("Archienemigo") REFERENCES public."Villano"("N_Villano") NOT VALID;
 K   ALTER TABLE ONLY public."Heroe" DROP CONSTRAINT "Heroe_Archienemigo_fkey";
       public          postgres    false    227    3468    256            �           2606    25067    Heroe Heroe_N_Heroe_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Heroe"
    ADD CONSTRAINT "Heroe_N_Heroe_fkey" FOREIGN KEY ("N_Heroe") REFERENCES public."Personaje"("Nombre") NOT VALID;
 F   ALTER TABLE ONLY public."Heroe" DROP CONSTRAINT "Heroe_N_Heroe_fkey";
       public          postgres    false    227    3424    243            �           2606    25072 !   Historial Historial_N_Titulo_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Historial"
    ADD CONSTRAINT "Historial_N_Titulo_fkey" FOREIGN KEY ("N_Titulo") REFERENCES public."Medio"("Titulo");
 O   ALTER TABLE ONLY public."Historial" DROP CONSTRAINT "Historial_N_Titulo_fkey";
       public          postgres    false    228    3394    230            �           2606    25077    Juego Juego_T_Juego_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Juego"
    ADD CONSTRAINT "Juego_T_Juego_fkey" FOREIGN KEY ("T_Juego") REFERENCES public."Medio"("Titulo") NOT VALID;
 F   ALTER TABLE ONLY public."Juego" DROP CONSTRAINT "Juego_T_Juego_fkey";
       public          postgres    false    229    3394    230            �           2606    25082    Objeto Objeto_N_Personaje_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Objeto"
    ADD CONSTRAINT "Objeto_N_Personaje_fkey" FOREIGN KEY ("N_Personaje") REFERENCES public."Personaje"("Nombre") NOT VALID;
 L   ALTER TABLE ONLY public."Objeto" DROP CONSTRAINT "Objeto_N_Personaje_fkey";
       public          postgres    false    232    3424    243            �           2606    25087 '   Organizacion Organizacion_Fundador_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Organizacion"
    ADD CONSTRAINT "Organizacion_Fundador_fkey" FOREIGN KEY ("Fundador") REFERENCES public."Personaje"("Nombre") NOT VALID;
 U   ALTER TABLE ONLY public."Organizacion" DROP CONSTRAINT "Organizacion_Fundador_fkey";
       public          postgres    false    234    243    3424            �           2606    25092 $   Organizacion Organizacion_Lider_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Organizacion"
    ADD CONSTRAINT "Organizacion_Lider_fkey" FOREIGN KEY ("Lider") REFERENCES public."Personaje"("Nombre") NOT VALID;
 R   ALTER TABLE ONLY public."Organizacion" DROP CONSTRAINT "Organizacion_Lider_fkey";
       public          postgres    false    3424    234    243            �           2606    25097 !   Pelicula Pelicula_T_Pelicula_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Pelicula"
    ADD CONSTRAINT "Pelicula_T_Pelicula_fkey" FOREIGN KEY ("T_Pelicula") REFERENCES public."Medio"("Titulo") NOT VALID;
 O   ALTER TABLE ONLY public."Pelicula" DROP CONSTRAINT "Pelicula_T_Pelicula_fkey";
       public          postgres    false    237    230    3394            �           2606    25102    Perfil Perfil_Email_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Perfil"
    ADD CONSTRAINT "Perfil_Email_fkey" FOREIGN KEY ("Email") REFERENCES public."Usuario"("Email");
 F   ALTER TABLE ONLY public."Perfil" DROP CONSTRAINT "Perfil_Email_fkey";
       public          postgres    false    238    255    3464            �           2606    25107 (   Pers_Creador Pers_Creador_N_Creador_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Pers_Creador"
    ADD CONSTRAINT "Pers_Creador_N_Creador_fkey" FOREIGN KEY ("N_Creador") REFERENCES public."Creador"("Nom_Creador");
 V   ALTER TABLE ONLY public."Pers_Creador" DROP CONSTRAINT "Pers_Creador_N_Creador_fkey";
       public          postgres    false    222    3374    240            �           2606    25112 *   Pers_Creador Pers_Creador_N_Personaje_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Pers_Creador"
    ADD CONSTRAINT "Pers_Creador_N_Personaje_fkey" FOREIGN KEY ("N_Personaje") REFERENCES public."Personaje"("Nombre");
 X   ALTER TABLE ONLY public."Pers_Creador" DROP CONSTRAINT "Pers_Creador_N_Personaje_fkey";
       public          postgres    false    240    243    3424            �           2606    25117 "   Pers_Nac Pers_Nac_N_Personaje_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Pers_Nac"
    ADD CONSTRAINT "Pers_Nac_N_Personaje_fkey" FOREIGN KEY ("N_Personaje") REFERENCES public."Personaje"("Nombre");
 P   ALTER TABLE ONLY public."Pers_Nac" DROP CONSTRAINT "Pers_Nac_N_Personaje_fkey";
       public          postgres    false    243    3424    241            �           2606    25122 #   Pers_Nac Pers_Nac_Nacionalidad_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Pers_Nac"
    ADD CONSTRAINT "Pers_Nac_Nacionalidad_fkey" FOREIGN KEY ("Nacionalidad") REFERENCES public."Nacionalidad"("Nac");
 Q   ALTER TABLE ONLY public."Pers_Nac" DROP CONSTRAINT "Pers_Nac_Nacionalidad_fkey";
       public          postgres    false    231    3396    241            �           2606    25127     Pers_Oc Pers_Oc_N_Personaje_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Pers_Oc"
    ADD CONSTRAINT "Pers_Oc_N_Personaje_fkey" FOREIGN KEY ("N_Personaje") REFERENCES public."Personaje"("Nombre");
 N   ALTER TABLE ONLY public."Pers_Oc" DROP CONSTRAINT "Pers_Oc_N_Personaje_fkey";
       public          postgres    false    3424    242    243            �           2606    25132    Pers_Oc Pers_Oc_Ocupacion_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Pers_Oc"
    ADD CONSTRAINT "Pers_Oc_Ocupacion_fkey" FOREIGN KEY ("Ocupacion") REFERENCES public."Ocupacion"("Ocup");
 L   ALTER TABLE ONLY public."Pers_Oc" DROP CONSTRAINT "Pers_Oc_Ocupacion_fkey";
       public          postgres    false    233    242    3402            �           2606    25137 "   Pertenece Pertenece_Cod_Cargo_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Pertenece"
    ADD CONSTRAINT "Pertenece_Cod_Cargo_fkey" FOREIGN KEY ("Cod_Cargo") REFERENCES public."Cargo"("Cod_Cargo");
 P   ALTER TABLE ONLY public."Pertenece" DROP CONSTRAINT "Pertenece_Cod_Cargo_fkey";
       public          postgres    false    215    244    3364            �           2606    25142 '   Pertenece Pertenece_N_Organizacion_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Pertenece"
    ADD CONSTRAINT "Pertenece_N_Organizacion_fkey" FOREIGN KEY ("N_Organizacion") REFERENCES public."Organizacion"("Nombre");
 U   ALTER TABLE ONLY public."Pertenece" DROP CONSTRAINT "Pertenece_N_Organizacion_fkey";
       public          postgres    false    234    3410    244            �           2606    25147 $   Pertenece Pertenece_N_Personaje_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Pertenece"
    ADD CONSTRAINT "Pertenece_N_Personaje_fkey" FOREIGN KEY ("N_Personaje") REFERENCES public."Personaje"("Nombre");
 R   ALTER TABLE ONLY public."Pertenece" DROP CONSTRAINT "Pertenece_N_Personaje_fkey";
       public          postgres    false    3424    244    243            �           2606    25152 %   Plat_Juego Plat_Juego_Plataforma_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Plat_Juego"
    ADD CONSTRAINT "Plat_Juego_Plataforma_fkey" FOREIGN KEY ("Plataforma") REFERENCES public."Plataforma"(nombre);
 S   ALTER TABLE ONLY public."Plat_Juego" DROP CONSTRAINT "Plat_Juego_Plataforma_fkey";
       public          postgres    false    246    3432    245            �           2606    25157 "   Plat_Juego Plat_Juego_T_Juego_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Plat_Juego"
    ADD CONSTRAINT "Plat_Juego_T_Juego_fkey" FOREIGN KEY ("T_Juego") REFERENCES public."Juego"("T_Juego");
 P   ALTER TABLE ONLY public."Plat_Juego" DROP CONSTRAINT "Plat_Juego_T_Juego_fkey";
       public          postgres    false    245    229    3390            �           2606    25162    Posee Posee_N_Personaje_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Posee"
    ADD CONSTRAINT "Posee_N_Personaje_fkey" FOREIGN KEY ("N_Personaje") REFERENCES public."Personaje"("Nombre");
 J   ALTER TABLE ONLY public."Posee" DROP CONSTRAINT "Posee_N_Personaje_fkey";
       public          postgres    false    248    243    3424            �           2606    25167    Posee Posee_N_Poder_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Posee"
    ADD CONSTRAINT "Posee_N_Poder_fkey" FOREIGN KEY ("N_Poder") REFERENCES public."Poder"("Nombre");
 F   ALTER TABLE ONLY public."Posee" DROP CONSTRAINT "Posee_N_Poder_fkey";
       public          postgres    false    3436    247    248            �           2606    25172 *   RelacionadoHer RelacionadoHer_N_Civil_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."RelacionadoHer"
    ADD CONSTRAINT "RelacionadoHer_N_Civil_fkey" FOREIGN KEY ("N_Civil") REFERENCES public."Civil"("N_Civil");
 X   ALTER TABLE ONLY public."RelacionadoHer" DROP CONSTRAINT "RelacionadoHer_N_Civil_fkey";
       public          postgres    false    219    3368    249            �           2606    25177 *   RelacionadoHer RelacionadoHer_N_Heroe_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."RelacionadoHer"
    ADD CONSTRAINT "RelacionadoHer_N_Heroe_fkey" FOREIGN KEY ("N_Heroe") REFERENCES public."Heroe"("N_Heroe");
 X   ALTER TABLE ONLY public."RelacionadoHer" DROP CONSTRAINT "RelacionadoHer_N_Heroe_fkey";
       public          postgres    false    249    227    3386            �           2606    25182 ,   RelacionadoVill RelacionadoVill_N_Civil_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."RelacionadoVill"
    ADD CONSTRAINT "RelacionadoVill_N_Civil_fkey" FOREIGN KEY ("N_Civil") REFERENCES public."Civil"("N_Civil");
 Z   ALTER TABLE ONLY public."RelacionadoVill" DROP CONSTRAINT "RelacionadoVill_N_Civil_fkey";
       public          postgres    false    250    3368    219            �           2606    25187 .   RelacionadoVill RelacionadoVill_N_Villano_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."RelacionadoVill"
    ADD CONSTRAINT "RelacionadoVill_N_Villano_fkey" FOREIGN KEY ("N_Villano") REFERENCES public."Villano"("N_Villano");
 \   ALTER TABLE ONLY public."RelacionadoVill" DROP CONSTRAINT "RelacionadoVill_N_Villano_fkey";
       public          postgres    false    3468    256    250            �           2606    25192    Sede Sede_N_Org_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Sede"
    ADD CONSTRAINT "Sede_N_Org_fkey" FOREIGN KEY ("N_Org") REFERENCES public."Organizacion"("Nombre") NOT VALID;
 B   ALTER TABLE ONLY public."Sede" DROP CONSTRAINT "Sede_N_Org_fkey";
       public          postgres    false    3410    234    251            �           2606    25197    Serie Serie_T_Serie_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Serie"
    ADD CONSTRAINT "Serie_T_Serie_fkey" FOREIGN KEY ("T_Serie") REFERENCES public."Medio"("Titulo") NOT VALID;
 F   ALTER TABLE ONLY public."Serie" DROP CONSTRAINT "Serie_T_Serie_fkey";
       public          postgres    false    230    3394    252            �           2606    25202    Usuario Usuario_Direccion_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Usuario"
    ADD CONSTRAINT "Usuario_Direccion_fkey" FOREIGN KEY ("Direccion") REFERENCES public."Ciudad"("Id_Ciudad") NOT VALID;
 L   ALTER TABLE ONLY public."Usuario" DROP CONSTRAINT "Usuario_Direccion_fkey";
       public          postgres    false    217    255    3366            �           2606    25207 #   Usuario Usuario_Id_Suscripcion_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Usuario"
    ADD CONSTRAINT "Usuario_Id_Suscripcion_fkey" FOREIGN KEY ("Id_Suscripcion") REFERENCES public."Suscripcion"("ID") NOT VALID;
 Q   ALTER TABLE ONLY public."Usuario" DROP CONSTRAINT "Usuario_Id_Suscripcion_fkey";
       public          postgres    false    255    3454    253            �           2606    25212    Usuario Usuario_N_Tarjeta_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Usuario"
    ADD CONSTRAINT "Usuario_N_Tarjeta_fkey" FOREIGN KEY ("N_Tarjeta") REFERENCES public."Tarjeta"("N_Tarjeta") NOT VALID;
 L   ALTER TABLE ONLY public."Usuario" DROP CONSTRAINT "Usuario_N_Tarjeta_fkey";
       public          postgres    false    3456    254    255            �           2606    25217    Villano Villano_N_Villano_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Villano"
    ADD CONSTRAINT "Villano_N_Villano_fkey" FOREIGN KEY ("N_Villano") REFERENCES public."Personaje"("Nombre") NOT VALID;
 L   ALTER TABLE ONLY public."Villano" DROP CONSTRAINT "Villano_N_Villano_fkey";
       public          postgres    false    3424    256    243            S   �   x�K�KOL�/J-���/VCp�K2��9��K���2�K��=<]}\p�NM.�KI,�̇��,��S�M�S0¢ƣ2�(��9� ����<���+�2��Rs
�2sS�ʠv�t;�!����� SB�      T   9   x�340���LI-�240�t�O+�KIL�q�8�S�JR�Lc΀����b�x� ��      V   O   x�344�tN,JLN,�44�244�t�,MILQHIUp�O�/I�44�s��+����s�T� 5� �q��qqq 
�a      X       x�s�,)����/O,JQ.I,������ g�D      Y      x������ � �      Z   S   x��ϫT.I,���
���\��%E���Y�9y�E\��E)P5��ɥ)�
)�9
Ή�%��)8�^Y�������� �      [   �   x��M
�0����bN�!j���
Fp�&M�H;iz{���_��/A��>�q$Sk��)�!&��)��?�5U_� 37�#Vrბ��8Q/�OA���b[P=L7�%�D����[L���/Rˡ$�f�
9Q��7�Bfz��j�<�      \      x������ � �      ]   �  x����n�0���S�	v�q�&͐iZ��vم�h[�D�����㞣/6��xm]/7��O�O�T)�CQ�J��9[q$=*E4�=�Dl�m���dO�^�L=�5/_���	���IEJ� 3�*�2�feK��J�ؽ#Xv�0�Z�3���h�&�yH�a��5:��V�� �].#��Vm�%�pN�y�D���4ds<������?�R[� G��Nt}_���<��5a`�&�#��
�,u�n`
�:6�6+TG1�Z��Ho��L�l�,�4���֤�{��%&��V�8��~�)�]���X^,c2�()�ai�������s&�"_x�`�á�x���oCJ��<R�_:�PT��&��k�k��,7�F6��Կ�YW�J��8
����t�;WC������Y1��Y^����a��4���<�}��
      ^   G   x�34�t�,.)�,�WpN,�,I��4�22���,J�KIr�8����K9����8}SSRsr2�=... ���      `   >  x�U�An�@EדS� U��'�TU*5Բ`c%&�2#gBE��#�b�	��x�����e�2�͛����f�_xa���#)�	6ܐ�&œ�aё�
c��gp�t���c۶e�Um}�������]�P,�{����f���}��w��p0v�qT�rL��Au$�ȕ�Qd調_WԹ���V-;��u����x}MEs��Y�L����w
�-�(S���,���sd��6r���V����zk7�z�Fs���Q��Y�4���t�f���5�|��d�,�����&�k��-O�&�f'�ǉ��1I�--��      a      x������ � �      b      x������ � �      c   6  x��U�r�8�&O�0�1$����%�6N!L���l[`K�$C�mz��\�#�b�Ɇ6i�b3|�����rY�N����ç����h�3��,��\*)HH��]?������%+ȍ�S.u�3�b�[��ɘ����(��
�k2���	����J��4�,��6��v����KJ)���.h�cޒj�����\���1�I�DI%S�����VxB��tBq�3��z��m�e�i��NTS���}�kbX"d!���nԳd�p�a��aA�E�䘄��V��n'7���=�����ˍ7G�2_<.Dq�s�Uv0���?�q��ǺX�`>���oa>Qu��	���3a��3�H�X3�IP��3iC�S�@J���`RS����F�9 uH\����V�uՖ�����TIe��d̙r����G�,���n�(���EA����~�S�%z�]Zҍn"K��4c��pzx�a�z����G&�Lק��G��dѿ�d&<K���u�pv��OB�nq��[\<&R��n��|���'���ۿ�hڋ��������Q�~�s|��;�vG�T`�;����:v�c�iM��) |8Q�@�)�
mO��\)�!�J1��$�a�������ˤ�K
��D������C¹,G	k@;�:�H�vt�@:X�w p����������51�l�t,�!F:�*�E�j�ry��)���y��Ǿ�?z�5�-9[1婲7|7������S�Y�1�\F���V2dTn����7�)^��%��{��� x���aKF��"l?��G��S�+�"S8V�x��Z�Em�A�4�b&�\��0�W �k�`cm��Ғ"ɛ�]2FD�V�U�n�n7z�^��
��	��#l4,iJ��u��������&��D���a�n�>�9�FE!n�˄�q���*]I��M���qv�i|9�&�߃y�g��Ko���{��q>^?<ĉ�{G��!&�{����q��b���;�����s &y�Qvh�d�ҾwZV�����!�Z@��FCg-�~�\ZRn[��5O�V��AB_�OP��jJĞ�x6��	�h�l�qlQ�� t�N�� [[���k����v�[@�g��[�!i�����M���>�V����H�������U9��`��D	,��M���?��Q��db��7t�#�MD��ٲ�(Mg�g\�L�W�D*%+���
q�m2�T����N(�D�1cqj�q����~e�Zۼê�����6�ڽ�3^1Vb��α�s=1U��92.�ao�0����Wc7�F���]����{������p����݃��.+m      d   Y   x�ʻ�0���!�����y�X[�g fa1$���6�wSIVB=XDi��W�X�����4��k�E"g#2��ngҌm �6�      e   �  x�MQ�n1�y_�*�铔`B�B�� v\V���%H�$��|�~,<E0R���`ggg� W�����c	Ƀk��!���a�)�e��X�HN,�7�ؗ�g�r�B�;с�l��]��<�#:C�1eT�a����F���¦�:l�b]�Jx�\P
梲�m��D��[˧�z=�b�����p��^���]�ڏ	wt��,9�ȇRg7�gv���D��c�/���x�����Нp��!�ΰWS��D2�jG�
������{�^���zU��Z���݃�nw�s���V�� +R~�2��[6��zm'�B�ryr�/���dFIR��$i4���m�d��&b���^��h�9�5eq�T�9���
.T�^� ٫�^�s�I<<���C����5M����      f   e   x��1
�@���;H��B���d6|Hv�V*���W�����
<��L�1��8?�9�q��X���y�p��U����ۆ�K!f��������M�&�      g     x�uR]k1|>�
AI����8N!��$��%�>m�6��U�]����.4�>I#i�3;�m�yي�u�s
�"��k>|�E���N��Q�R�Oo���{���w����lݢX���xWdm�]�(e�i*�E;2�r��P��D+KYn����I9_�Po���:�����M����T���k���X����e7!�� �[�e�����z�X�S�:A|���-�5�P(�F��U��\�4&)�ٛ�;�d��vF:OY�A�O�*�\�FsUEy��E9W��ROjZm�g����!O�gh���A/��U=�.�&QW-��E0�cx�5�ĳ���#�Ɛ����="գ?�[W;�#�-FiF$h0ș�m�X�DH�rVj�o�z{YN�iQUYUgg�������D�/��7�"��c�zd+�f�o�$��ր�v>��-����T�3�������f_\֊U�R�.I��_>�Zmv�ɳ��Zh4`	&��d2�)�!      h   $   x�3�K�K�*M�I�2�t����M�L����� H      j   �   x�m�MN�0���)|�d҂��#DK�F�g6lBkM#Zg�$�8K�1#�f��,l����^#���2����E�&P�eJ�.*X[��Oq����B�<6��}"�O�t>��Eq$��U��k/��`��^���)�x-��l�U��9�{cw.�������^"M�7��B��CVm=a�G�sNbIV��b��A
7#��Y��e�'���"޺��O1·�96��_wtYB��	Ƿ��(~ \wF      k   �   x�u��
�PF�3#����E��vmF��xG�O��'�$��}�'����ƫ�Y���X�F]��-W9�d$iu�=fP�8�@�:�O�'G�e�O*0_Ir���OdU �����q]��KU�sǍ]o�nW|���F8���!8�A���G��_��S�      m   `  x�}��n�0E�����#
c
E��iڋi�j5��4�Կ_x�I{��c�\;�g�N]���@Ad�+й
���o��ĝJ�ja��2�s�ʚ�W�]W�)��n�r!w'�޽G�}�p�E��l�G����fMUk�\5j������<-�oڡc�5[�-�kX�TM��p�9�����ޜt�r��ǻ�8r_���>�G,��HQ�w�Y�%ﳂމe�7���أ)�:�� Ni�Ohؐ`�U��(����x�� X�oռv��*};fo�E!�NU�q�����bk����:�lc�<B�P�p�1I،?W$)./X36��Kx�J�3�� ���F._/Ƙ?��3�      n     x�e�]j�@�����	z��$��?�@K�j+Y����g�ź-�u��itQ���jv��;�H��Np�Y���W�C�U�E��u������(B6��1a�X���z�N9��s�5`�U�q*١1C���T�AK��@^�΅����S�U��
��#PJU���J����bJS���=J��H%���y�r� uP��X5�eq��0��4h�T*p��(8�~�.��n�g�b��8)wB6��x������(���?��'��7��      o     x�u�KN�@��3��	��
�K��ؘ��X�ؕgR�Cu�z1��T$��_�����ֻg�H�L}��@�YrK�\�~�`�cI*�5����E�\�$�|j�Q�)`�0�hۺiڟO�W���`6��
�h�0��c��뀦Z.�aU`�ox(�nc�RR��P`�_�r��n��¦�Uzg��ߝa�~:p�ITI�M��U�F���<u�e�%35N�V�����)c�w�zq��;�p�]�M��Q*)��3^hϰ����}<x� o���      p   m  x��V�n�6}����ѧ�"%Y�< (�4Y��IY7 h���H�CRvݿ�㾣?�K�v�][��1��{��{�\��e��5n���JrӺ�s�Z�����Tf���Zg̰L�rk���eV��J<
�I�*�(�'��%�K^d̲)3��͹��� 3ITAc��Sq�>0-�������x�s��R�$.���b���Uݕ�l���Jb? �u:=	H���� ��(iO,_rt��\�o��*Zw�T(�b!,�hXr-R��T)R�:~k�
����֑\�"-Ԃg�mKq8ÛD�5���<���c N�Џ�����&�(��[Ui��V��� �5�$��jQ(�հK�Sz�ݷ"��a��]":]ӛB,��L�?e�TW)G�LJ�w��~\�T�Cӂ�˪x<ָ�#`�1��� I�N�>^��5P���W2�f��Ŧ��QrF���j��q�����i&��\4#�O+�]��ϳVY��h��.d�UV����qD|?�.�#<-X��8�V�a5�Pu%g�Z���8�������;9���d�G�殙uB�X�r�P��`]Tz�<�k��pޚ̭W����P.�T+xi��3�T��=t�R�)�鰒�K��xO�"CB|���Ss{�$�.EQ�8��oq����/���9��ЛN�%��9=ܛ�:1u�]�Ρ1y7�c��iU��r�O�?�.�ڙ|��(���F$ 뉃�7hOre�3xs�-닃�G�Q����8Nq��6Y��d��tcvt��ft$�\�u]o@}�����n�5$=?
�^F�3��zǜu���\�ֻ��#���:S�����V�H�7�#�AL��^30˹�B�M[d3�>�}��G!	���5㹵[�n6a�ѡ�%do~O��Kg��T�W8Y4%	�}�K�Y�A��eq�d�,$ɒ(B�8�O�sa���2�u��b��5��PJ0.@�� �2��N�L�������U�7�"���4ɍ�d�<�ƍ�p�f�S��%��ˈO�>!��@`�{7�f.�@@
�	��V|�3m^�S�����A��%4�.�+��yo��7�4�������C��j�h�a�W���x���j��h�&�#G;i�K�S񹼚�z�肥�����9/}��S6Ȃ)' ���%�c?�$��-�u�0��j|w3�;���>���oWWx˰�it��p�0���WfO�Y�o9���9�%�����\.~�s��l���@����q} ��D���:���3 [w�ĿU9�,h��%Pk��'��ا������_à�;��(+���:8���Nǎ'/CG ;4bՌ����)��l}���'��An�`i,w�؇���}??��3~�;!w����	����n��Ӡ �      q   �   x�e�Mj�0���)���A��$)T����`O,yFr�o�Eں���>�;
��2�� ��T��K�2]	ޥ#M���(�����muh��L:g̘<k�,���1p.]�����x���yбr��i�8ݣb�I��yTa������"%8�5rz�O��t�`�;R��|c^ŗ3�߇6Wvl����>��{�6_c��<kj      r      x������ � �      s   S   x�p�
�I�.I,���S0Fᙠ�L�"��+�� ��T#8�(3U!��/3�$5/%_!<3�����g�$gp��qqq 8�(�      t   &  x�mTKr�0]���	t�.��L�E�ɪ��md(BIO��� ]��XA�S9��C���Ó�H
��/��O!��q��+�,`�s���#(@I��=��'
�����Y�5|;n��(����v��<����b��>
��Ұ�I�-�_��X�"ͥ
FAB�����
����ja�@VB:1\:tJ�6fې�D8�Ϣ��b���B�M�\t;��}&5^�}3�#����^y�0�	2��LJ��ʋmh{���kd�_�	'�4��P1%���}@UL�@Y��>s��`[�iʪeqN�x�OK��v#�%S1HG�f=>$ݚ(-���syl��2Z��j�"��*��}.vt�(:`��}2�������^0ڦ�el�ѷ�ƽgRˌv�0�|�yv;�� �k�)���K�sT�.�̈́i��.���Y�/�q:5(��,��M壹�|87WL�bK���/�s�BIF�m�e�Bw��V��<�}#؈jC�v�0c����n�!S�T�j*`3a�L՚Ҽ�0p�*zb��tҍ�5[hJK��V�~��x��s�/r�׋      u   Y  x���]NA�g�=�w���+@���ٲ�0L�3���p �<�^�I���򼿴�i��R�9;/�5�+R�����R��%���Y1�c��T�#E�՗kf}t��v� '�d��fbQ[�x�(ڬ���ѥ���4�z���O>p�@k����Jw���ݕ��<<�S�i�
C�����I��@]y��Q������1��&p�� ;�-��A`I��Z6rn����T�d����>g���iD!�h��8��Β-��8��\���P�5�H�� ��M�����I���ĔK�Ccʞ,z�9{�G��F��؇:�R���w]S�*�ǂT�~�/7Y�}jߒ�      v      x������ � �      w      x������ � �      x      x������ � �      y      x������ � �      z   ?   x�3�4ճ��t��I\F�� �������\�e�ih�, a.NN���T0����� �	      {   ]   x�U��� �d��Pv��sԨRQ���y�ޒ�pMIf���{�f�
� ��cZ�e���݃�=���w�b��Z����S�N����^�e"�      |     x����n� @��	��&oݴ��*M$AU��T�������d�:��/��{�t8�v�X�g�-rxJ�𘒀#5��o(��m�VRp"D
ª�u������Ri������^�%؋��q�;j[������P��%��%	���֍���v����.���Ӳ��G�S���Bʨ�R�J�k��\�p�+���5�[��g�rD����p�����.��'o�xĩ�wH��T�SWp<��?8��t����=���> �9�y      }   �   x�5�AN1E��)|�0�������@l܉�Il�I*�X�#�b$ v�����.������gMAh�o�-�i!C±��=�B"8�K
������~*lk�1U��F��|㤰!S�O,����f����8���T?��U�Gif�bt�\�r3��D������|���l`�I�*6|���?��mŽ�����k��G��z����θ��+Cn�޽?8�~ �g�     