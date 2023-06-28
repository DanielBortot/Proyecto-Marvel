PGDMP     $    $                {            Backup1    15.3    15.3 �    |           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            }           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            ~           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    24642    Backup1    DATABASE     �   CREATE DATABASE "Backup1" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
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
       public         heap    postgres    false                        1259    25538    Combate    TABLE     �   CREATE TABLE public."Combate" (
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
       public         heap    postgres    false            �            1259    24727    Medio    TABLE        CREATE TABLE public."Medio" (
    "Titulo" text NOT NULL,
    "Fecha_Estreno" date NOT NULL,
    "Compania" text NOT NULL,
    "Rating" integer NOT NULL,
    "Sinopsis" text NOT NULL,
    "Imagen" text,
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
       public          postgres    false    238    237            O          0    24654    Aparece 
   TABLE DATA           R   COPY public."Aparece" ("N_Organizacion", "N_Titulo", "Estado", "Rol") FROM stdin;
    public          postgres    false    214   �+      P          0    24660    Cargo 
   TABLE DATA           =   COPY public."Cargo" ("Cod_Cargo", "Descripcion") FROM stdin;
    public          postgres    false    215   �,      R          0    24666    Ciudad 
   TABLE DATA           F   COPY public."Ciudad" ("Id_Ciudad", "Nombre", "Id_Estado") FROM stdin;
    public          postgres    false    217   �,      T          0    24672    Civil 
   TABLE DATA           ,   COPY public."Civil" ("N_Civil") FROM stdin;
    public          postgres    false    219   S-      y          0    25538    Combate 
   TABLE DATA           [   COPY public."Combate" ("N_Personaje", "N_Poder", "N_Objeto", "Fecha", "Lugar") FROM stdin;
    public          postgres    false    256   �-      U          0    24682    Crea 
   TABLE DATA           ;   COPY public."Crea" ("N_Personaje", "N_Objeto") FROM stdin;
    public          postgres    false    220   ?/      V          0    24687    Creador 
   TABLE DATA           2   COPY public."Creador" ("Nom_Creador") FROM stdin;
    public          postgres    false    221   �/      W          0    24692    Enfrenta 
   TABLE DATA           <   COPY public."Enfrenta" ("N_Heroe", "N_Villano") FROM stdin;
    public          postgres    false    222   �0      X          0    24697    Esta 
   TABLE DATA           Y   COPY public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") FROM stdin;
    public          postgres    false    223   �0      Y          0    24704    Estado 
   TABLE DATA           D   COPY public."Estado" ("Id_Estado", "Nombre", "Id_Pais") FROM stdin;
    public          postgres    false    224   �5      [          0    24710    Heroe 
   TABLE DATA           `   COPY public."Heroe" ("N_Heroe", "Alias", "Logotipo", "Color_Traje", "Archienemigo") FROM stdin;
    public          postgres    false    226   �5      \          0    24716 	   Historial 
   TABLE DATA           i   COPY public."Historial" ("N_Titulo", "Id_Perfil", "Calificacion", "Hora_Inicio", "Hora_Fin") FROM stdin;
    public          postgres    false    227   >8      ]          0    24722    Juego 
   TABLE DATA           D   COPY public."Juego" ("T_Juego", "Distribuidor", "Tipo") FROM stdin;
    public          postgres    false    228   [8      ^          0    24727    Medio 
   TABLE DATA           h   COPY public."Medio" ("Titulo", "Fecha_Estreno", "Compania", "Rating", "Sinopsis", "Imagen") FROM stdin;
    public          postgres    false    229   x8      _          0    24733    Nacionalidad 
   TABLE DATA           /   COPY public."Nacionalidad" ("Nac") FROM stdin;
    public          postgres    false    230   �E      `          0    24738    Objeto 
   TABLE DATA           h   COPY public."Objeto" ("Nombre", "Descripcion", "Material", "Tipo", "Imagen", "N_Personaje") FROM stdin;
    public          postgres    false    231   ,F      a          0    24743 	   Ocupacion 
   TABLE DATA           -   COPY public."Ocupacion" ("Ocup") FROM stdin;
    public          postgres    false    232   5I      b          0    24748    Organizacion 
   TABLE DATA           �   COPY public."Organizacion" ("Nombre", "Eslogan", "Lider", "Fundador", "Tipo", "Nom_Comic", "Imagen", "Objetivo", "Lugar_Creacion") FROM stdin;
    public          postgres    false    233   �I      c          0    24753    Pais 
   TABLE DATA           5   COPY public."Pais" ("Id_Pais", "Nombre") FROM stdin;
    public          postgres    false    234   �K      e          0    24759    Pelicula 
   TABLE DATA           w   COPY public."Pelicula" ("T_Pelicula", "Director", "Duracion", "Coste", "Ganancia", "Distribuidor", "Tipo") FROM stdin;
    public          postgres    false    236   +L      f          0    24767    Perfil 
   TABLE DATA           e   COPY public."Perfil" ("Id_Perfil", "Dispositivo", "Nombre", "Idioma", "Email", "Imagen") FROM stdin;
    public          postgres    false    237   O      h          0    24774    Pers_Creador 
   TABLE DATA           D   COPY public."Pers_Creador" ("N_Personaje", "N_Creador") FROM stdin;
    public          postgres    false    239   �O      i          0    24779    Pers_Nac 
   TABLE DATA           C   COPY public."Pers_Nac" ("N_Personaje", "Nacionalidad") FROM stdin;
    public          postgres    false    240   �Q      j          0    24784    Pers_Oc 
   TABLE DATA           ?   COPY public."Pers_Oc" ("N_Personaje", "Ocupacion") FROM stdin;
    public          postgres    false    241   S      k          0    24789 	   Personaje 
   TABLE DATA           w   COPY public."Personaje" ("Nombre", "Genero", "Color_Ojos", "Color_Pelo", "Nom_Comic", "E_Marital", imagen) FROM stdin;
    public          postgres    false    242   �T      l          0    24798 	   Pertenece 
   TABLE DATA           S   COPY public."Pertenece" ("N_Personaje", "N_Organizacion", "Cod_Cargo") FROM stdin;
    public          postgres    false    243   �X      m          0    24803 
   Plat_Juego 
   TABLE DATA           ?   COPY public."Plat_Juego" ("T_Juego", "Plataforma") FROM stdin;
    public          postgres    false    244   �Y      n          0    24808 
   Plataforma 
   TABLE DATA           .   COPY public."Plataforma" (nombre) FROM stdin;
    public          postgres    false    245   �Y      o          0    24813    Poder 
   TABLE DATA           D   COPY public."Poder" ("Nombre", "Imagen", "Descripcion") FROM stdin;
    public          postgres    false    246   XZ      p          0    24818    Posee 
   TABLE DATA           H   COPY public."Posee" ("N_Personaje", "N_Poder", "Obtencion") FROM stdin;
    public          postgres    false    247   �]      q          0    24824    RelacionadoHer 
   TABLE DATA           @   COPY public."RelacionadoHer" ("N_Civil", "N_Heroe") FROM stdin;
    public          postgres    false    248   �_      r          0    24829    RelacionadoVill 
   TABLE DATA           C   COPY public."RelacionadoVill" ("N_Civil", "N_Villano") FROM stdin;
    public          postgres    false    249   �_      s          0    24834    Sede 
   TABLE DATA           W   COPY public."Sede" ("Nombre", "Tipo_Edif", "Ubicacion", "Imagen", "N_Org") FROM stdin;
    public          postgres    false    250   `      t          0    24839    Serie 
   TABLE DATA           W   COPY public."Serie" ("T_Serie", "N_Episodios", "Creador", "Canal", "Tipo") FROM stdin;
    public          postgres    false    251   2`      u          0    24844    Suscripcion 
   TABLE DATA           N   COPY public."Suscripcion" ("ID", "Tarifa", "Descripcion", "Tipo") FROM stdin;
    public          postgres    false    252   +a      v          0    24851    Tarjeta 
   TABLE DATA           N   COPY public."Tarjeta" ("N_Tarjeta", "Cod_Seguridad", "Fecha_Ven") FROM stdin;
    public          postgres    false    253   za      w          0    24858    Usuario 
   TABLE DATA           �   COPY public."Usuario" ("Email", "Contrasena", "Nombre", "Apellido", "Fecha_Nac", "Fecha_Creacion", "Id_Suscripcion", "N_Tarjeta", "Direccion") FROM stdin;
    public          postgres    false    254   �a      x          0    24864    Villano 
   TABLE DATA           E   COPY public."Villano" ("N_Villano", "Alias", "Objetivo") FROM stdin;
    public          postgres    false    255   c      �           0    0    Cargo_Cod_Cargo_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public."Cargo_Cod_Cargo_seq"', 1, false);
          public          postgres    false    216            �           0    0    Ciudad_Id_Ciudad_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public."Ciudad_Id_Ciudad_seq"', 4, true);
          public          postgres    false    218            �           0    0    Estado_Id_Estado_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public."Estado_Id_Estado_seq"', 3, true);
          public          postgres    false    225            �           0    0    Pais_Id_Pais_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public."Pais_Id_Pais_seq"', 2, true);
          public          postgres    false    235            �           0    0    Perfil_Id_Perfil_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public."Perfil_Id_Perfil_seq"', 6, true);
          public          postgres    false    238            %           2606    24875    Aparece Aparece_pkey 
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
       public            postgres    false    256    256    256    256            -           2606    24885    Crea Crea_pkey 
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
       public            postgres    false    226            =           2606    24901    Historial Historial_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY public."Historial"
    ADD CONSTRAINT "Historial_pkey" PRIMARY KEY ("N_Titulo", "Id_Perfil");
 F   ALTER TABLE ONLY public."Historial" DROP CONSTRAINT "Historial_pkey";
       public            postgres    false    227    227            ?           2606    24903    Juego Juego_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public."Juego"
    ADD CONSTRAINT "Juego_pkey" PRIMARY KEY ("T_Juego");
 >   ALTER TABLE ONLY public."Juego" DROP CONSTRAINT "Juego_pkey";
       public            postgres    false    228            A           2606    24907    Medio Medio_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public."Medio"
    ADD CONSTRAINT "Medio_pkey" PRIMARY KEY ("Titulo");
 >   ALTER TABLE ONLY public."Medio" DROP CONSTRAINT "Medio_pkey";
       public            postgres    false    229            C           2606    24909    Nacionalidad Nacionalidad_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public."Nacionalidad"
    ADD CONSTRAINT "Nacionalidad_pkey" PRIMARY KEY ("Nac");
 L   ALTER TABLE ONLY public."Nacionalidad" DROP CONSTRAINT "Nacionalidad_pkey";
       public            postgres    false    230            E           2606    24913    Objeto Objeto_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public."Objeto"
    ADD CONSTRAINT "Objeto_pkey" PRIMARY KEY ("Nombre");
 @   ALTER TABLE ONLY public."Objeto" DROP CONSTRAINT "Objeto_pkey";
       public            postgres    false    231            G           2606    24915    Ocupacion Ocupacion_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public."Ocupacion"
    ADD CONSTRAINT "Ocupacion_pkey" PRIMARY KEY ("Ocup");
 F   ALTER TABLE ONLY public."Ocupacion" DROP CONSTRAINT "Ocupacion_pkey";
       public            postgres    false    232            I           2606    24917 &   Organizacion Organizacion_Fundador_key 
   CONSTRAINT     k   ALTER TABLE ONLY public."Organizacion"
    ADD CONSTRAINT "Organizacion_Fundador_key" UNIQUE ("Fundador");
 T   ALTER TABLE ONLY public."Organizacion" DROP CONSTRAINT "Organizacion_Fundador_key";
       public            postgres    false    233            K           2606    24921 #   Organizacion Organizacion_Lider_key 
   CONSTRAINT     e   ALTER TABLE ONLY public."Organizacion"
    ADD CONSTRAINT "Organizacion_Lider_key" UNIQUE ("Lider");
 Q   ALTER TABLE ONLY public."Organizacion" DROP CONSTRAINT "Organizacion_Lider_key";
       public            postgres    false    233            M           2606    24923    Organizacion Organizacion_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public."Organizacion"
    ADD CONSTRAINT "Organizacion_pkey" PRIMARY KEY ("Nombre");
 L   ALTER TABLE ONLY public."Organizacion" DROP CONSTRAINT "Organizacion_pkey";
       public            postgres    false    233            O           2606    24925    Pais Pais_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public."Pais"
    ADD CONSTRAINT "Pais_pkey" PRIMARY KEY ("Id_Pais");
 <   ALTER TABLE ONLY public."Pais" DROP CONSTRAINT "Pais_pkey";
       public            postgres    false    234                       2606    25537    Pelicula Pelicula_Tipo_check    CHECK CONSTRAINT     �   ALTER TABLE public."Pelicula"
    ADD CONSTRAINT "Pelicula_Tipo_check" CHECK ((("Tipo" = 'Animacion'::text) OR ("Tipo" = 'Live Action'::text))) NOT VALID;
 E   ALTER TABLE public."Pelicula" DROP CONSTRAINT "Pelicula_Tipo_check";
       public          postgres    false    236    236            Q           2606    24927    Pelicula Pelicula_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public."Pelicula"
    ADD CONSTRAINT "Pelicula_pkey" PRIMARY KEY ("T_Pelicula");
 D   ALTER TABLE ONLY public."Pelicula" DROP CONSTRAINT "Pelicula_pkey";
       public            postgres    false    236            S           2606    24929    Perfil Perfil_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public."Perfil"
    ADD CONSTRAINT "Perfil_pkey" PRIMARY KEY ("Id_Perfil");
 @   ALTER TABLE ONLY public."Perfil" DROP CONSTRAINT "Perfil_pkey";
       public            postgres    false    237            U           2606    24931    Pers_Creador Pers_Creador_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public."Pers_Creador"
    ADD CONSTRAINT "Pers_Creador_pkey" PRIMARY KEY ("N_Personaje", "N_Creador");
 L   ALTER TABLE ONLY public."Pers_Creador" DROP CONSTRAINT "Pers_Creador_pkey";
       public            postgres    false    239    239            W           2606    24933    Pers_Nac Pers_Nac_pkey 
   CONSTRAINT     s   ALTER TABLE ONLY public."Pers_Nac"
    ADD CONSTRAINT "Pers_Nac_pkey" PRIMARY KEY ("N_Personaje", "Nacionalidad");
 D   ALTER TABLE ONLY public."Pers_Nac" DROP CONSTRAINT "Pers_Nac_pkey";
       public            postgres    false    240    240            Y           2606    24935    Pers_Oc Pers_Oc_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public."Pers_Oc"
    ADD CONSTRAINT "Pers_Oc_pkey" PRIMARY KEY ("N_Personaje", "Ocupacion");
 B   ALTER TABLE ONLY public."Pers_Oc" DROP CONSTRAINT "Pers_Oc_pkey";
       public            postgres    false    241    241            [           2606    24937    Personaje Personaje_Nombre_key 
   CONSTRAINT     a   ALTER TABLE ONLY public."Personaje"
    ADD CONSTRAINT "Personaje_Nombre_key" UNIQUE ("Nombre");
 L   ALTER TABLE ONLY public."Personaje" DROP CONSTRAINT "Personaje_Nombre_key";
       public            postgres    false    242            ]           2606    24939    Personaje Personaje_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public."Personaje"
    ADD CONSTRAINT "Personaje_pkey" PRIMARY KEY ("Nombre");
 F   ALTER TABLE ONLY public."Personaje" DROP CONSTRAINT "Personaje_pkey";
       public            postgres    false    242            _           2606    24941    Pertenece Pertenece_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public."Pertenece"
    ADD CONSTRAINT "Pertenece_pkey" PRIMARY KEY ("N_Personaje", "N_Organizacion", "Cod_Cargo");
 F   ALTER TABLE ONLY public."Pertenece" DROP CONSTRAINT "Pertenece_pkey";
       public            postgres    false    243    243    243            a           2606    24943    Plat_Juego Plat_Juego_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY public."Plat_Juego"
    ADD CONSTRAINT "Plat_Juego_pkey" PRIMARY KEY ("T_Juego", "Plataforma");
 H   ALTER TABLE ONLY public."Plat_Juego" DROP CONSTRAINT "Plat_Juego_pkey";
       public            postgres    false    244    244            c           2606    24945    Plataforma Plataforma_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public."Plataforma"
    ADD CONSTRAINT "Plataforma_pkey" PRIMARY KEY (nombre);
 H   ALTER TABLE ONLY public."Plataforma" DROP CONSTRAINT "Plataforma_pkey";
       public            postgres    false    245            e           2606    24949    Poder Poder_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public."Poder"
    ADD CONSTRAINT "Poder_pkey" PRIMARY KEY ("Nombre");
 >   ALTER TABLE ONLY public."Poder" DROP CONSTRAINT "Poder_pkey";
       public            postgres    false    246            g           2606    24951    Posee Posee_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public."Posee"
    ADD CONSTRAINT "Posee_pkey" PRIMARY KEY ("N_Personaje", "N_Poder");
 >   ALTER TABLE ONLY public."Posee" DROP CONSTRAINT "Posee_pkey";
       public            postgres    false    247    247            i           2606    24953 "   RelacionadoHer RelacionadoHer_pkey 
   CONSTRAINT     v   ALTER TABLE ONLY public."RelacionadoHer"
    ADD CONSTRAINT "RelacionadoHer_pkey" PRIMARY KEY ("N_Civil", "N_Heroe");
 P   ALTER TABLE ONLY public."RelacionadoHer" DROP CONSTRAINT "RelacionadoHer_pkey";
       public            postgres    false    248    248            k           2606    24955 $   RelacionadoVill RelacionadoVill_pkey 
   CONSTRAINT     z   ALTER TABLE ONLY public."RelacionadoVill"
    ADD CONSTRAINT "RelacionadoVill_pkey" PRIMARY KEY ("N_Civil", "N_Villano");
 R   ALTER TABLE ONLY public."RelacionadoVill" DROP CONSTRAINT "RelacionadoVill_pkey";
       public            postgres    false    249    249            m           2606    24957    Sede Sede_Imagen_key 
   CONSTRAINT     W   ALTER TABLE ONLY public."Sede"
    ADD CONSTRAINT "Sede_Imagen_key" UNIQUE ("Imagen");
 B   ALTER TABLE ONLY public."Sede" DROP CONSTRAINT "Sede_Imagen_key";
       public            postgres    false    250            o           2606    24959    Sede Sede_Nombre_key 
   CONSTRAINT     W   ALTER TABLE ONLY public."Sede"
    ADD CONSTRAINT "Sede_Nombre_key" UNIQUE ("Nombre");
 B   ALTER TABLE ONLY public."Sede" DROP CONSTRAINT "Sede_Nombre_key";
       public            postgres    false    250            q           2606    24961    Sede Sede_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public."Sede"
    ADD CONSTRAINT "Sede_pkey" PRIMARY KEY ("Nombre", "N_Org");
 <   ALTER TABLE ONLY public."Sede" DROP CONSTRAINT "Sede_pkey";
       public            postgres    false    250    250                       2606    25570    Serie Serie_Tipo_check    CHECK CONSTRAINT     �   ALTER TABLE public."Serie"
    ADD CONSTRAINT "Serie_Tipo_check" CHECK ((("Tipo" = 'Animacion'::text) OR ("Tipo" = 'Live Action'::text))) NOT VALID;
 ?   ALTER TABLE public."Serie" DROP CONSTRAINT "Serie_Tipo_check";
       public          postgres    false    251    251            s           2606    24963    Serie Serie_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public."Serie"
    ADD CONSTRAINT "Serie_pkey" PRIMARY KEY ("T_Serie");
 >   ALTER TABLE ONLY public."Serie" DROP CONSTRAINT "Serie_pkey";
       public            postgres    false    251            u           2606    24965     Suscripcion Suscripcion_Tipo_key 
   CONSTRAINT     a   ALTER TABLE ONLY public."Suscripcion"
    ADD CONSTRAINT "Suscripcion_Tipo_key" UNIQUE ("Tipo");
 N   ALTER TABLE ONLY public."Suscripcion" DROP CONSTRAINT "Suscripcion_Tipo_key";
       public            postgres    false    252            w           2606    24967    Suscripcion Suscripcion_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public."Suscripcion"
    ADD CONSTRAINT "Suscripcion_pkey" PRIMARY KEY ("ID");
 J   ALTER TABLE ONLY public."Suscripcion" DROP CONSTRAINT "Suscripcion_pkey";
       public            postgres    false    252            y           2606    24969    Tarjeta Tarjeta_N_Tarjeta_key 
   CONSTRAINT     c   ALTER TABLE ONLY public."Tarjeta"
    ADD CONSTRAINT "Tarjeta_N_Tarjeta_key" UNIQUE ("N_Tarjeta");
 K   ALTER TABLE ONLY public."Tarjeta" DROP CONSTRAINT "Tarjeta_N_Tarjeta_key";
       public            postgres    false    253            {           2606    24971    Tarjeta Tarjeta_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public."Tarjeta"
    ADD CONSTRAINT "Tarjeta_pkey" PRIMARY KEY ("N_Tarjeta");
 B   ALTER TABLE ONLY public."Tarjeta" DROP CONSTRAINT "Tarjeta_pkey";
       public            postgres    false    253            }           2606    24973    Usuario Usuario_Apellido_key 
   CONSTRAINT     a   ALTER TABLE ONLY public."Usuario"
    ADD CONSTRAINT "Usuario_Apellido_key" UNIQUE ("Apellido");
 J   ALTER TABLE ONLY public."Usuario" DROP CONSTRAINT "Usuario_Apellido_key";
       public            postgres    false    254                       2606    24975    Usuario Usuario_Nombre_key 
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
       public          postgres    false    257    226            �           2620    24983    Historial calificacion_trigger    TRIGGER     �   CREATE TRIGGER calificacion_trigger BEFORE INSERT OR UPDATE ON public."Historial" FOR EACH ROW EXECUTE FUNCTION public.numcalificacion();
 9   DROP TRIGGER calificacion_trigger ON public."Historial";
       public          postgres    false    261    227            �           2620    24984    Personaje emarital_trigger    TRIGGER        CREATE TRIGGER emarital_trigger BEFORE INSERT OR UPDATE ON public."Personaje" FOR EACH ROW EXECUTE FUNCTION public.emarital();
 5   DROP TRIGGER emarital_trigger ON public."Personaje";
       public          postgres    false    258    242            �           2620    24985 !   Pelicula ganancia_perdida_trigger    TRIGGER     �   CREATE TRIGGER ganancia_perdida_trigger BEFORE INSERT OR UPDATE ON public."Pelicula" FOR EACH ROW EXECUTE FUNCTION public.ganancia_perdida();
 <   DROP TRIGGER ganancia_perdida_trigger ON public."Pelicula";
       public          postgres    false    236    259            �           2620    24986    Personaje genero_trigger    TRIGGER     {   CREATE TRIGGER genero_trigger BEFORE INSERT OR UPDATE ON public."Personaje" FOR EACH ROW EXECUTE FUNCTION public.genero();
 3   DROP TRIGGER genero_trigger ON public."Personaje";
       public          postgres    false    260    242            �           2620    24987    Usuario numusuarios_trigger    TRIGGER     �   CREATE TRIGGER numusuarios_trigger BEFORE INSERT OR UPDATE ON public."Usuario" FOR EACH ROW EXECUTE FUNCTION public.numusuarios();
 6   DROP TRIGGER numusuarios_trigger ON public."Usuario";
       public          postgres    false    254    264            �           2620    24988    Medio rating_trigger    TRIGGER     z   CREATE TRIGGER rating_trigger BEFORE INSERT OR UPDATE ON public."Medio" FOR EACH ROW EXECUTE FUNCTION public.numrating();
 /   DROP TRIGGER rating_trigger ON public."Medio";
       public          postgres    false    263    229            �           2620    24989    Esta rolpersonaje_trigger    TRIGGER     �   CREATE TRIGGER rolpersonaje_trigger BEFORE INSERT OR UPDATE ON public."Esta" FOR EACH ROW EXECUTE FUNCTION public.rolpersonaje();
 4   DROP TRIGGER rolpersonaje_trigger ON public."Esta";
       public          postgres    false    223    265            �           2620    24990    Esta tipoactor_trigger    TRIGGER     |   CREATE TRIGGER tipoactor_trigger BEFORE INSERT OR UPDATE ON public."Esta" FOR EACH ROW EXECUTE FUNCTION public.tipoactor();
 1   DROP TRIGGER tipoactor_trigger ON public."Esta";
       public          postgres    false    223    267            �           2620    24991 %   Suscripcion tiposuscripciones_trigger    TRIGGER     �   CREATE TRIGGER tiposuscripciones_trigger BEFORE INSERT OR UPDATE ON public."Suscripcion" FOR EACH ROW EXECUTE FUNCTION public.tiposuscripciones();
 @   DROP TRIGGER tiposuscripciones_trigger ON public."Suscripcion";
       public          postgres    false    252    266            �           2606    25572 #   Aparece Aparece_N_Organizacion_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Aparece"
    ADD CONSTRAINT "Aparece_N_Organizacion_fkey" FOREIGN KEY ("N_Organizacion") REFERENCES public."Organizacion"("Nombre") ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 Q   ALTER TABLE ONLY public."Aparece" DROP CONSTRAINT "Aparece_N_Organizacion_fkey";
       public          postgres    false    214    233    3405            �           2606    25577    Aparece Aparece_N_Titulo_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Aparece"
    ADD CONSTRAINT "Aparece_N_Titulo_fkey" FOREIGN KEY ("N_Titulo") REFERENCES public."Medio"("Titulo") ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 K   ALTER TABLE ONLY public."Aparece" DROP CONSTRAINT "Aparece_N_Titulo_fkey";
       public          postgres    false    214    3393    229            �           2606    25522    Ciudad Ciudad_Id_Estado_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Ciudad"
    ADD CONSTRAINT "Ciudad_Id_Estado_fkey" FOREIGN KEY ("Id_Estado") REFERENCES public."Estado"("Id_Estado") ON UPDATE CASCADE NOT VALID;
 J   ALTER TABLE ONLY public."Ciudad" DROP CONSTRAINT "Ciudad_Id_Estado_fkey";
       public          postgres    false    3381    224    217            �           2606    25582    Civil Civil_N_Civil_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Civil"
    ADD CONSTRAINT "Civil_N_Civil_fkey" FOREIGN KEY ("N_Civil") REFERENCES public."Personaje"("Nombre") ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 F   ALTER TABLE ONLY public."Civil" DROP CONSTRAINT "Civil_N_Civil_fkey";
       public          postgres    false    219    242    3419            �           2606    25588    Combate Combate_N_Objeto_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Combate"
    ADD CONSTRAINT "Combate_N_Objeto_fkey" FOREIGN KEY ("N_Objeto") REFERENCES public."Objeto"("Nombre") ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 K   ALTER TABLE ONLY public."Combate" DROP CONSTRAINT "Combate_N_Objeto_fkey";
       public          postgres    false    3397    256    231            �           2606    25593     Combate Combate_N_Personaje_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Combate"
    ADD CONSTRAINT "Combate_N_Personaje_fkey" FOREIGN KEY ("N_Personaje") REFERENCES public."Personaje"("Nombre") ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 N   ALTER TABLE ONLY public."Combate" DROP CONSTRAINT "Combate_N_Personaje_fkey";
       public          postgres    false    242    256    3419            �           2606    25598    Combate Combate_N_Poder_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Combate"
    ADD CONSTRAINT "Combate_N_Poder_fkey" FOREIGN KEY ("N_Poder") REFERENCES public."Poder"("Nombre") ON UPDATE CASCADE ON DELETE SET DEFAULT NOT VALID;
 J   ALTER TABLE ONLY public."Combate" DROP CONSTRAINT "Combate_N_Poder_fkey";
       public          postgres    false    246    256    3429            �           2606    25603    Crea Crea_N_Objeto_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Crea"
    ADD CONSTRAINT "Crea_N_Objeto_fkey" FOREIGN KEY ("N_Objeto") REFERENCES public."Objeto"("Nombre") ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 E   ALTER TABLE ONLY public."Crea" DROP CONSTRAINT "Crea_N_Objeto_fkey";
       public          postgres    false    231    220    3397            �           2606    25608    Crea Crea_N_Personaje_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Crea"
    ADD CONSTRAINT "Crea_N_Personaje_fkey" FOREIGN KEY ("N_Personaje") REFERENCES public."Personaje"("Nombre") ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 H   ALTER TABLE ONLY public."Crea" DROP CONSTRAINT "Crea_N_Personaje_fkey";
       public          postgres    false    242    220    3419            �           2606    25613    Enfrenta Enfrenta_N_Heroe_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Enfrenta"
    ADD CONSTRAINT "Enfrenta_N_Heroe_fkey" FOREIGN KEY ("N_Heroe") REFERENCES public."Heroe"("N_Heroe") ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 L   ALTER TABLE ONLY public."Enfrenta" DROP CONSTRAINT "Enfrenta_N_Heroe_fkey";
       public          postgres    false    3387    226    222            �           2606    25618     Enfrenta Enfrenta_N_Villano_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Enfrenta"
    ADD CONSTRAINT "Enfrenta_N_Villano_fkey" FOREIGN KEY ("N_Villano") REFERENCES public."Villano"("N_Villano") ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 N   ALTER TABLE ONLY public."Enfrenta" DROP CONSTRAINT "Enfrenta_N_Villano_fkey";
       public          postgres    false    222    3461    255            �           2606    25623    Esta Esta_N_Personaje_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Esta"
    ADD CONSTRAINT "Esta_N_Personaje_fkey" FOREIGN KEY ("N_Personaje") REFERENCES public."Personaje"("Nombre") ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 H   ALTER TABLE ONLY public."Esta" DROP CONSTRAINT "Esta_N_Personaje_fkey";
       public          postgres    false    242    3419    223            �           2606    25628    Esta Esta_N_Titulo_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Esta"
    ADD CONSTRAINT "Esta_N_Titulo_fkey" FOREIGN KEY ("N_Titulo") REFERENCES public."Medio"("Titulo") ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 E   ALTER TABLE ONLY public."Esta" DROP CONSTRAINT "Esta_N_Titulo_fkey";
       public          postgres    false    223    3393    229            �           2606    25527    Estado Estado_Id_Pais_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Estado"
    ADD CONSTRAINT "Estado_Id_Pais_fkey" FOREIGN KEY ("Id_Pais") REFERENCES public."Pais"("Id_Pais") ON UPDATE CASCADE NOT VALID;
 H   ALTER TABLE ONLY public."Estado" DROP CONSTRAINT "Estado_Id_Pais_fkey";
       public          postgres    false    224    3407    234            �           2606    25633    Heroe Heroe_Archienemigo_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Heroe"
    ADD CONSTRAINT "Heroe_Archienemigo_fkey" FOREIGN KEY ("Archienemigo") REFERENCES public."Villano"("N_Villano") ON UPDATE CASCADE NOT VALID;
 K   ALTER TABLE ONLY public."Heroe" DROP CONSTRAINT "Heroe_Archienemigo_fkey";
       public          postgres    false    3461    255    226            �           2606    25638    Heroe Heroe_N_Heroe_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Heroe"
    ADD CONSTRAINT "Heroe_N_Heroe_fkey" FOREIGN KEY ("N_Heroe") REFERENCES public."Personaje"("Nombre") ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 F   ALTER TABLE ONLY public."Heroe" DROP CONSTRAINT "Heroe_N_Heroe_fkey";
       public          postgres    false    242    3419    226            �           2606    25392 "   Historial Historial_Id_Perfil_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Historial"
    ADD CONSTRAINT "Historial_Id_Perfil_fkey" FOREIGN KEY ("Id_Perfil") REFERENCES public."Perfil"("Id_Perfil") ON UPDATE CASCADE NOT VALID;
 P   ALTER TABLE ONLY public."Historial" DROP CONSTRAINT "Historial_Id_Perfil_fkey";
       public          postgres    false    227    3411    237            �           2606    25387 !   Historial Historial_N_Titulo_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Historial"
    ADD CONSTRAINT "Historial_N_Titulo_fkey" FOREIGN KEY ("N_Titulo") REFERENCES public."Medio"("Titulo") ON UPDATE CASCADE NOT VALID;
 O   ALTER TABLE ONLY public."Historial" DROP CONSTRAINT "Historial_N_Titulo_fkey";
       public          postgres    false    229    227    3393            �           2606    25643    Juego Juego_T_Juego_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Juego"
    ADD CONSTRAINT "Juego_T_Juego_fkey" FOREIGN KEY ("T_Juego") REFERENCES public."Medio"("Titulo") ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 F   ALTER TABLE ONLY public."Juego" DROP CONSTRAINT "Juego_T_Juego_fkey";
       public          postgres    false    228    229    3393            �           2606    25748    Serie Medio_T_Serie_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Serie"
    ADD CONSTRAINT "Medio_T_Serie_fkey" FOREIGN KEY ("T_Serie") REFERENCES public."Medio"("Titulo") ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 F   ALTER TABLE ONLY public."Serie" DROP CONSTRAINT "Medio_T_Serie_fkey";
       public          postgres    false    229    251    3393            �           2606    25532    Objeto Objeto_N_Personaje_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Objeto"
    ADD CONSTRAINT "Objeto_N_Personaje_fkey" FOREIGN KEY ("N_Personaje") REFERENCES public."Personaje"("Nombre") ON UPDATE CASCADE NOT VALID;
 L   ALTER TABLE ONLY public."Objeto" DROP CONSTRAINT "Objeto_N_Personaje_fkey";
       public          postgres    false    242    231    3419            �           2606    25565 '   Organizacion Organizacion_Fundador_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Organizacion"
    ADD CONSTRAINT "Organizacion_Fundador_fkey" FOREIGN KEY ("Fundador") REFERENCES public."Personaje"("Nombre") ON UPDATE CASCADE NOT VALID;
 U   ALTER TABLE ONLY public."Organizacion" DROP CONSTRAINT "Organizacion_Fundador_fkey";
       public          postgres    false    3419    242    233            �           2606    25560 $   Organizacion Organizacion_Lider_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Organizacion"
    ADD CONSTRAINT "Organizacion_Lider_fkey" FOREIGN KEY ("Lider") REFERENCES public."Personaje"("Nombre") ON UPDATE CASCADE NOT VALID;
 R   ALTER TABLE ONLY public."Organizacion" DROP CONSTRAINT "Organizacion_Lider_fkey";
       public          postgres    false    242    233    3419            �           2606    25648 !   Pelicula Pelicula_T_Pelicula_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Pelicula"
    ADD CONSTRAINT "Pelicula_T_Pelicula_fkey" FOREIGN KEY ("T_Pelicula") REFERENCES public."Medio"("Titulo") ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 O   ALTER TABLE ONLY public."Pelicula" DROP CONSTRAINT "Pelicula_T_Pelicula_fkey";
       public          postgres    false    229    236    3393            �           2606    25653    Perfil Perfil_Email_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Perfil"
    ADD CONSTRAINT "Perfil_Email_fkey" FOREIGN KEY ("Email") REFERENCES public."Usuario"("Email") ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 F   ALTER TABLE ONLY public."Perfil" DROP CONSTRAINT "Perfil_Email_fkey";
       public          postgres    false    3457    237    254            �           2606    25658 (   Pers_Creador Pers_Creador_N_Creador_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Pers_Creador"
    ADD CONSTRAINT "Pers_Creador_N_Creador_fkey" FOREIGN KEY ("N_Creador") REFERENCES public."Creador"("Nom_Creador") ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 V   ALTER TABLE ONLY public."Pers_Creador" DROP CONSTRAINT "Pers_Creador_N_Creador_fkey";
       public          postgres    false    239    3375    221            �           2606    25663 *   Pers_Creador Pers_Creador_N_Personaje_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Pers_Creador"
    ADD CONSTRAINT "Pers_Creador_N_Personaje_fkey" FOREIGN KEY ("N_Personaje") REFERENCES public."Personaje"("Nombre") ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 X   ALTER TABLE ONLY public."Pers_Creador" DROP CONSTRAINT "Pers_Creador_N_Personaje_fkey";
       public          postgres    false    239    3419    242            �           2606    25668 "   Pers_Nac Pers_Nac_N_Personaje_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Pers_Nac"
    ADD CONSTRAINT "Pers_Nac_N_Personaje_fkey" FOREIGN KEY ("N_Personaje") REFERENCES public."Personaje"("Nombre") ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 P   ALTER TABLE ONLY public."Pers_Nac" DROP CONSTRAINT "Pers_Nac_N_Personaje_fkey";
       public          postgres    false    242    240    3419            �           2606    25673 #   Pers_Nac Pers_Nac_Nacionalidad_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Pers_Nac"
    ADD CONSTRAINT "Pers_Nac_Nacionalidad_fkey" FOREIGN KEY ("Nacionalidad") REFERENCES public."Nacionalidad"("Nac") ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 Q   ALTER TABLE ONLY public."Pers_Nac" DROP CONSTRAINT "Pers_Nac_Nacionalidad_fkey";
       public          postgres    false    230    240    3395            �           2606    25678     Pers_Oc Pers_Oc_N_Personaje_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Pers_Oc"
    ADD CONSTRAINT "Pers_Oc_N_Personaje_fkey" FOREIGN KEY ("N_Personaje") REFERENCES public."Personaje"("Nombre") ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 N   ALTER TABLE ONLY public."Pers_Oc" DROP CONSTRAINT "Pers_Oc_N_Personaje_fkey";
       public          postgres    false    242    3419    241            �           2606    25683    Pers_Oc Pers_Oc_Ocupacion_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Pers_Oc"
    ADD CONSTRAINT "Pers_Oc_Ocupacion_fkey" FOREIGN KEY ("Ocupacion") REFERENCES public."Ocupacion"("Ocup") ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 L   ALTER TABLE ONLY public."Pers_Oc" DROP CONSTRAINT "Pers_Oc_Ocupacion_fkey";
       public          postgres    false    3399    232    241            �           2606    25688 "   Pertenece Pertenece_Cod_Cargo_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Pertenece"
    ADD CONSTRAINT "Pertenece_Cod_Cargo_fkey" FOREIGN KEY ("Cod_Cargo") REFERENCES public."Cargo"("Cod_Cargo") ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 P   ALTER TABLE ONLY public."Pertenece" DROP CONSTRAINT "Pertenece_Cod_Cargo_fkey";
       public          postgres    false    243    215    3367            �           2606    25693 '   Pertenece Pertenece_N_Organizacion_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Pertenece"
    ADD CONSTRAINT "Pertenece_N_Organizacion_fkey" FOREIGN KEY ("N_Organizacion") REFERENCES public."Organizacion"("Nombre") ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 U   ALTER TABLE ONLY public."Pertenece" DROP CONSTRAINT "Pertenece_N_Organizacion_fkey";
       public          postgres    false    243    233    3405            �           2606    25698 $   Pertenece Pertenece_N_Personaje_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Pertenece"
    ADD CONSTRAINT "Pertenece_N_Personaje_fkey" FOREIGN KEY ("N_Personaje") REFERENCES public."Personaje"("Nombre") ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 R   ALTER TABLE ONLY public."Pertenece" DROP CONSTRAINT "Pertenece_N_Personaje_fkey";
       public          postgres    false    242    3419    243            �           2606    25703 %   Plat_Juego Plat_Juego_Plataforma_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Plat_Juego"
    ADD CONSTRAINT "Plat_Juego_Plataforma_fkey" FOREIGN KEY ("Plataforma") REFERENCES public."Plataforma"(nombre) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 S   ALTER TABLE ONLY public."Plat_Juego" DROP CONSTRAINT "Plat_Juego_Plataforma_fkey";
       public          postgres    false    244    245    3427            �           2606    25708 "   Plat_Juego Plat_Juego_T_Juego_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Plat_Juego"
    ADD CONSTRAINT "Plat_Juego_T_Juego_fkey" FOREIGN KEY ("T_Juego") REFERENCES public."Juego"("T_Juego") ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 P   ALTER TABLE ONLY public."Plat_Juego" DROP CONSTRAINT "Plat_Juego_T_Juego_fkey";
       public          postgres    false    3391    228    244            �           2606    25713    Posee Posee_N_Personaje_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Posee"
    ADD CONSTRAINT "Posee_N_Personaje_fkey" FOREIGN KEY ("N_Personaje") REFERENCES public."Personaje"("Nombre") ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 J   ALTER TABLE ONLY public."Posee" DROP CONSTRAINT "Posee_N_Personaje_fkey";
       public          postgres    false    3419    242    247            �           2606    25718    Posee Posee_N_Poder_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Posee"
    ADD CONSTRAINT "Posee_N_Poder_fkey" FOREIGN KEY ("N_Poder") REFERENCES public."Poder"("Nombre") ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 F   ALTER TABLE ONLY public."Posee" DROP CONSTRAINT "Posee_N_Poder_fkey";
       public          postgres    false    3429    246    247            �           2606    25723 *   RelacionadoHer RelacionadoHer_N_Civil_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."RelacionadoHer"
    ADD CONSTRAINT "RelacionadoHer_N_Civil_fkey" FOREIGN KEY ("N_Civil") REFERENCES public."Civil"("N_Civil") ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 X   ALTER TABLE ONLY public."RelacionadoHer" DROP CONSTRAINT "RelacionadoHer_N_Civil_fkey";
       public          postgres    false    219    248    3371            �           2606    25728 *   RelacionadoHer RelacionadoHer_N_Heroe_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."RelacionadoHer"
    ADD CONSTRAINT "RelacionadoHer_N_Heroe_fkey" FOREIGN KEY ("N_Heroe") REFERENCES public."Heroe"("N_Heroe") ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 X   ALTER TABLE ONLY public."RelacionadoHer" DROP CONSTRAINT "RelacionadoHer_N_Heroe_fkey";
       public          postgres    false    226    248    3387            �           2606    25733 ,   RelacionadoVill RelacionadoVill_N_Civil_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."RelacionadoVill"
    ADD CONSTRAINT "RelacionadoVill_N_Civil_fkey" FOREIGN KEY ("N_Civil") REFERENCES public."Civil"("N_Civil") ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 Z   ALTER TABLE ONLY public."RelacionadoVill" DROP CONSTRAINT "RelacionadoVill_N_Civil_fkey";
       public          postgres    false    249    219    3371            �           2606    25738 .   RelacionadoVill RelacionadoVill_N_Villano_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."RelacionadoVill"
    ADD CONSTRAINT "RelacionadoVill_N_Villano_fkey" FOREIGN KEY ("N_Villano") REFERENCES public."Villano"("N_Villano") ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 \   ALTER TABLE ONLY public."RelacionadoVill" DROP CONSTRAINT "RelacionadoVill_N_Villano_fkey";
       public          postgres    false    255    249    3461            �           2606    25743    Sede Sede_N_Org_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Sede"
    ADD CONSTRAINT "Sede_N_Org_fkey" FOREIGN KEY ("N_Org") REFERENCES public."Organizacion"("Nombre") ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 B   ALTER TABLE ONLY public."Sede" DROP CONSTRAINT "Sede_N_Org_fkey";
       public          postgres    false    250    233    3405            �           2606    25758    Usuario Usuario_Direccion_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Usuario"
    ADD CONSTRAINT "Usuario_Direccion_fkey" FOREIGN KEY ("Direccion") REFERENCES public."Ciudad"("Id_Ciudad") ON UPDATE CASCADE ON DELETE RESTRICT NOT VALID;
 L   ALTER TABLE ONLY public."Usuario" DROP CONSTRAINT "Usuario_Direccion_fkey";
       public          postgres    false    254    217    3369            �           2606    25763 #   Usuario Usuario_Id_Suscripcion_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Usuario"
    ADD CONSTRAINT "Usuario_Id_Suscripcion_fkey" FOREIGN KEY ("Id_Suscripcion") REFERENCES public."Suscripcion"("ID") ON UPDATE CASCADE ON DELETE RESTRICT NOT VALID;
 Q   ALTER TABLE ONLY public."Usuario" DROP CONSTRAINT "Usuario_Id_Suscripcion_fkey";
       public          postgres    false    3447    252    254            �           2606    25507    Usuario Usuario_N_Tarjeta_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Usuario"
    ADD CONSTRAINT "Usuario_N_Tarjeta_fkey" FOREIGN KEY ("N_Tarjeta") REFERENCES public."Tarjeta"("N_Tarjeta") ON UPDATE CASCADE NOT VALID;
 L   ALTER TABLE ONLY public."Usuario" DROP CONSTRAINT "Usuario_N_Tarjeta_fkey";
       public          postgres    false    3449    253    254            �           2606    25753    Villano Villano_N_Villano_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Villano"
    ADD CONSTRAINT "Villano_N_Villano_fkey" FOREIGN KEY ("N_Villano") REFERENCES public."Personaje"("Nombre") ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 L   ALTER TABLE ONLY public."Villano" DROP CONSTRAINT "Villano_N_Villano_fkey";
       public          postgres    false    242    255    3419            O   �   x����jA��3O�O�!Go��r)vi{�gv���1�ዹ�V$���������-,)}@��UM�.���VL����M��r�R���o�c�H;�-u��dww����|}��O#�Co�гD;a���
/�=f-,�s/��!b/pO���e}[��U��l��Kw[�W�i�4�%��m,�Sٟ#��	Ff�{      P   9   x�340���LI-�240�t�O+�KIL�q�8�S�JR�Lc΀����b�x� ��      R   O   x�344�tN,JLN,�44�244�t�,MILQHIUp�O�/I�44�s��+����s�T� 5� �q��qqq 
�a      T       x�s�,)����/O,JQ.I,������ g�D      y   �  x����n1�מ��/0�� 
YR�DT@h���������BަK�}^,����L��%��;���+.�%�F���+,��.@!%
gd!9r6���Ұ,I�8i��{�&��w��h��\�W�����M�dq�	���w2��l㾒Bs ��ܡY�1���D8�`0x%���d�Hҍ�r����A�hH	C����I}�����^�y�������4<wb-��n����?���W�Ǖt��z��6�,��Xz��Taf���2T
��4C�!/fK�ݾX����\8z��+�|D�B���3A��+/l ��?.L��R��ˠ[�{d;N��,e7�9��EiU�Z{�~��TL�rZ�:<�Ei���v� �M9�vKjo7��Z����>�����M�
�����w�>���B�H�A��թ>�~|�������      U   �   x�-̱1@�:����	�D�(�ј$�G9��P2�-Ɓh~��R��Wj7�֠�F���]%n����7�z�)�*��*8ܗw�@���._Z���c�>(��'3�������*p� ���.�      V   �   x�%�An�@��yA��@�b�\�,��Z{F6D�=K�u����L{@��jO\�w���M�)=0.�tn�������&��O�)a�l�U�t�[Z�����4>5��$'�U����;k�A@�<��]d�h�c-.;�zH�`ƫ~鑘�5�D��}�k����f!��ߎG�      W      x������ � �      X   �  x��X�v�V����v�Yx$��@���uW'�-�||�:>&q�������$]���A3���ckKb�&��C�,���Gvg�a���e�!�:�����1��af�ͩ9��`h3�`�Ɛl"�;�[
Գ&�f:n��/hxd��x��-,eR6��C��(�*�)%�G��ў`�!�t0ro�N�����+ ;���'
\;�d�&��a�@'hx�=��5��	�*��G��9�q$�����5�p�ټ&�8� 3��a�(C�&���4_��p6*�%Iw��(Q��$Me�i2<�	��<`����z��6��T���(���Q�ACg(\~[Z��zs�4�3��h��S(�3�-��`CS��N�`įތ�TR %3��F��y���J9y�X���`Y,.bH����u=��7��h��c�&��ɍ�⮅9�F��qc���z�t5)�L������d��P׳g��V�W�#sj�9Rꂊ#OJ��)h���
ߔ��b,�$��b�k�ip��W�D�f���,�(O4����@(��^IB��pF�/}C�r/I��2���6�q�D�R��p�_�z���4��x	�&X���zc�����q_�����[����,��3B�������`�(%��؈Tw�L��fE��Gz�tה�
u/�a�V��F��c�,��E�C�42�D�N85�2~�I�Ґ��H��O���<��y�rZ:D��A���;��D����4���n�NXK���UNfr(�?�µVk��aِȽ�eˢ��2�[��D����Z\�����/��b����&;l+9����#~_'�.��G�/E<���NɗI�2���Ee�LY��1,|'�����_뭨<�Y+�u���HJ���c٭��:��eS���L9�:��4�	�����(����Ӣ��#�U�ݢ����`\�-�B��=ѐ�52F8��8��@��R�Ê�d���M�F��Z����~����ʻ���T ���gډ���h-!z�V(rJ�^Xͫ��p�Sj)��J��v�Wi�3OLb�t�4�����qR����uՁ.X��M�,m���~�ceb-'�ҷ{Q���"��=��\9�"k��9�WA.��<�D�����(P�;Rr��6]�'lh;����YZaCw�r2�s��ՎyD���!����{@�����B�HWW��\<.΅�}Im������a���/QNz�e�	cy�[�@S�7d؏`�	w���g���h��^      Y   G   x�34�t�,.)�,�WpN,�,I��4�22���,J�KIr�8����K9����8}SSRsr2�=... ���      [   3  x�US[��0��O��� ��f������?��؊e1���z�^��co�[�!9���/fQjx�f�>V��#����`�z�M��ьQ"{X�eAf�.����/;�F���.`e����tW_W
��,Q,��u&ܠ/�G2w���]���D)�������=a�}~�� G����*j#|��b�R-�Dof��Q����Lb=%̨���=��6���Y-�	������S�ǝmP������D[�vS�V=��`�$a��-9�U��cz�!�CZ��~%)R/ٓ��5q��`�z*դ�:�����D�E:��rI`�'U�Q��]ۣ?����50y�\��f�W�-�N6FUL
�k��PAg����A�f]��TgcisR�y��f��o��uZ�}�/پұ��5���l�K��ښ��(2[a�P�ީ��p�W�؅܍t���j©Х�s�!����+QV��-H����
�:F6�<������l���3�bP ������h{��������C����BT�"�M͛���9��;�}P�t��qP�-Ƽ�h��]���$�>�fY�b�`�      \      x������ � �      ]      x������ � �      ^   ;  x��Y�rG<_��3� ��(�(RoR�5%{7�Lh�����:���^�c�U=3� ��r	̣:+++�xIKSm�;uQl~�ѹ�V-�)tP+���Л�'����p:��PXኻ*�Ɨ���]�WZ���:��z�O�3c�Z݇����Uj��δ�|�����*
ƫ%�;�ץ�7�ʫߣV֫*�+�}(H�xqqM�m����~�#umr]?��h�^�Z՗��E6f
�U�)���7���O�
�+�I�[��z�*�y�C�Gq��~���*�O����p�ۨn��/��7�����9`8>�����>�'��ޭ�+�GAp�P)���	@@�f|>~D�`��fQ�8H�W��5�1E|<|M����oEe��L��ʨ��#��"��8�/I.��%�t�~�+].��G�=��x�4t�U�� Y�3筟o�� ���	�2������ .Cwt�����Cx��Y��E�X�x:���*D��9��±3*m��M���Ww��k������"9�H7�q� ^5��@0������0�}���>p�s?3:8�m�d3_G�iR�fT��6?�����go��x8yqXv|�@j5eD�H��#"z�8SR(�7|6B�5���Fˠ�V���DR���pƥ��YR:���9��o�u!�q
�5�2�%�z��/ ���f �W!��Y���ZU�H�W`�T�E9���z�G���*ʢ�ewK��a*��ji8���znMVEPR}�V�Li�����$��+J�����-|1\N��7����_����ONX���.�U���ͅf���ʁ<�A��D$�+��Cn���^K-e�T��3��+��"<xNS+mI�B�#��n��H}A�TLQ���I)5�0��L�X\��$��rm��BM�K�-��Kx&~V�q�*(y)"��KL%<��Q]ޛ?��Ħ³	f5���Y@�=D�̝���,e��W���Ci+㗇O�I�\<ǘ� �=���B�ʧ[B��a��7����T�zg�ne �����:ԏk<7�+OM�R�j�jp�s�k(pIK����\���Z����obX'�E���藺��r�>�3zF��5���~��3�6IŵyBǠ��_g(����J��-~V�9�@>�-��K�������2+V>���RWu�������.5� ���Q'��eͲ�� Q�B9FD*h�;�	�$	�,u����<�<9%Ao��Y�8"Jjn��"���A7E9AASO��)�j�DJb�����M�!�d5�K^;]�9���6���S��1��E{	~ɺ�[H~���^D<�f\���I
|��豭_�u5+_I��K��>W��#��y���J����d|H��\��"��q��^Du�Ŵe�����d��,�y�?��su	�YD%��T�����@f먔��e'���{$��h�%	�"�Xo�n�\D�mc)k����s|��s�{�Q��y�H��+Fl�&P#!�R�y7z7z?z=�]����e��C��t�?���ۧ�6W�#<R�^>�u̩��/����e�C6�rI6G�eQ���V��6��pݴ���$�;�������k���,}5T|�L͟�~s����aT�/׍>I�"^��YUg��Ѣ�V29́�W�@�Ĭ�Bj�r��)�h�Z;Q��T�SЪ�� ��u����W�����l�ʮR�%-�����^�����m�yR�(`h,d�#d�gYpSFow�5J�>`y�6�^���1č@� ?�ēp�,B����z�Q;ܨ)�f,����3�t�m�;U��0��-�~󄟊��6z*u���}�R�`��g���P�eC�2QmDg+Ր���:.�6_{��Z���~I��Y�֘��O"��Һ��#$�u|0�tj�߃�'��K�� �� �[�>AvnX����5V�1qwōl�گM�l~�z�r(�b��R�M>dwd���h m�":h5ɣI��4���L�^�ڸ4�� wG�m?��k��"�`r�#+�4G� �q����a�e�@"QL�ש@#a��/|,5��6W	���!�@�1*�;:��d��0��#�ښsǼxu��Q7�}C�H5�2�cRe/ �\�9��;��>��e"r�h,nm_��E!L3qf�OI��13�;m�GSe��IV�:���S���G$ji���^Y3[J5�Hɔ��o�ɣ'�3T4ړGI���8b88N�:8N{W����g�ug�T����	�C��>��I쉯�~��\7��U��ڏ"�O�L�����D���	�H8D 3�m��?���S��N��ct���/050ܥ��/��6�-�$6�{���������J�jP���,9��aa�]��:�%_���f�Yq6�l���^Yщ�f��
������̮��4ݦ�]6s��(�<�];��2��h5�WԮc��v9�j�h윇!��e�<&�)vҐ"��%(G[�Z����?�ܳ|�P�yU-y�3����0����mZ�㣆O��������DNPo0��4�&�%"��������🦸���m�ΰ�Q���poA{-���4к�E0$%1xΙ.y���"s�ʻ��j�#\X,�ψe���"���d`�eH��ZHy�t��e�U֒r�/)�������
�Wm.T+[�4�'������M
������F@�Xt]�S�8?5��N��ln �m�o�O0N�����%Jۄ�na��nY1ө�k���Qg�����mt�\ȴ�������ޛ�[�K*+���������r.J�2sc��{^oW@�(KV\"iYA�.�S����2���y��F?��3�Y��C�rt��<kmY��-*�Rl;��e �6�<�0O�"/�f}�_�����Q�d�O�Ӣ6�<����\z�7�]�¦l/=ؾ�DC�}�Ei�Q�k��<�W�im̜B=��n���4�"�+v
�u��t89���^8SP��\	��*��z|��Eɹ�˳$ͻp��K?�[���ǚa�g�i���]N%�K+Y�jj�ܞ�N��z[+�eL��~inM�*yO��JG��?'�2�X5؁�{�8=�dID�y��o�@M�����X�ԛ��!4��ف�F;�-�����p���W�Ijv+q�W<���| i��#�`�\��$��,�U�����3�N�_��J�Y�)2m�O��b]I[-f��l���[u|3�U���κg�y����v�\4���*���8�j���9������I�y������X�[#�/N����?�Z6��J`0-�&�8F�W������='9� ���6�����D��      _   Y   x�ʻ�0���!�����y�X[�g fa1$���6�wSIVB=XDi��W�X�����4��k�E"g#2��ngҌm �6�      `   �  x�eT�nG=�|E�|����8�a0�F�o'B���,���BJ�s�)��K���,��=U]�ޫ׳�x'�˥x�b	�B_x1��;0bn�A]�e���|�>z1?g�]�!��TʐIOtG0q^{G8q����G�ɡ�)��cBE��T�z��ѻ��������U���2�1e�4l�o��]���S�n�Fo^O��?��v���r6}��!�@��1���=��k7�[oE��2�=~ݒ��S,#�GN�w�n��a��Uu�Tm2��@�	\\̺W]��T��u��;Uy�ckO��XV��1����dr��#g�uO.y���t�=�m���W'���w$��u1%��%�Eg��i��y�$J0�q0{��[Uw�����%F\�F��Kŭ���8��i�����(��-����r������U����x�V�W�r%�`�'� �=��
>%-6V��Ajl�z1������6��I����z�aW밙G]������O0����o��l��@�!r���Ċ��5����{յ&- n�;a���ba�e�ۉG8��خ�P����2��b_|�5�]��<]�'���U�zZ�3���TR��Z��o�����b�%J$ɢ2̈́�@������\��(�j*l���|�bbd��~Ϊ�O�6���o���Fr,���P�y���#ɞ��Uzz��a�s��Q��O�3j#���g��%7��|�a�='�q Ͱh��'M���+�4      a   �   x����@�����D�D`9rr���������%|c�����S�dJ�`�!n��i*u69���]�`Q���ى������hi�%��P�i��e�f�9��G�8�m�SҧMs�3�e�mg=('M�� �x�x]� և<      b     x�u�ώ�@��ӧ��k��
!q-��E�բ�71��d�Oh�x�}1<�
�
N��ǿﳳH�+FG*��@�Fs�"w2���8�;*)p	:&��G�N?+.qb�)�����k�&_�C��}O�ԑ�^���n^��7�d�զ@ۣ�<��g��B?Z+��`P�R�#$�(qG8�J� J�]&��Fo�K��AQ6-W��v͖��*�&������+��z�LZV��mr�����X��3�
Q#��V��XI�t�"Y�ɕ���б8��n�>=��֍�3�B.��w\6bUû�f)��(�>��_�W��&[�+ד�Q����|[mȃ!�G�<D�~t���'rY����v���z��X	�7j�k/���%� ���L����b���	y�a̦!��T�Y����r�Ǻ�^�3Wo�Tl$C|�]�3_����{Վy��G<�x51o��l�����2��t:[���gm���f���j� }�%�JP*�}���"ϓ�h� Dr      c   $   x�3�K�K�*M�I�2�t����M�L����� H      e   �  x���Kn1D��)�	��鳳��$�"���#��T��d�s�b�� c�0��)v���M����y��[0k��Xz��@{q�}P�^��o]�S:+�.*j5���O.�ܬc
Ҫ��������&xGw�(���K��tT�U�٣p��q� ��h���ݩ�O���D	�HPZgJ��U�zpx9�l���6��9�[��8l�(��=�,M-�a7�G.��S:��ռ�ܴrP��qG�TK�'9ii!V�5n�Νix�;�?)A��\�ʗr��2��tFYc,��6��[C��p�;�F#��
�s=؈��tQ���MhaZ!��"����#�����$m��Q�!&NX<�]uo�D6��'v����s}̈�`Ίm�7�ur�eL����z4�I����u�����|�����VE����N���z[�T�q{����A\���:�>�E�!W�Cm؁|-d�,1�n��W�uMˎ�üW� ���� Rc�!B4V���~ay�����g5��Zn�� ����|4�y��N���_�.2B�Ёl\A���C�t�<�,\KnP#� ��JSoS�����F8y�N���g�cZ���`$	��~g~e��z7~w&���+,4|�_Z�v��j+uw���2Tf/W�ЌIwiI6�4ib*]u�|j��W�k��;v���)C?��	�v��� �բ�����RQ�cGU?�����~ .Y(�      f   �   x�u�O�@��쇑V+�&XA���޺���Ƹ#�'��gB�E�m��ǓP(Rw����V�U���g�L���QSTsC��<6la<�[4�r�B�Hf�#ښa�4L\����~ �x"�Ӫ��ge[M���x��B������z$�p0��~l*�oZ��V����w�%B<˽c�      h   �  x�}S�n�0|���_�h��A�$E�Ű�fj�2YHr��`�ewً!y�#u>��p��̾Q~���`��O���U��X6������Z=*��2�$��cV�+	(B>��C�#��-�^��J�\����9*�|�e��;ߧ���p�=#lعl��\����Sxa'��ё,H*��Fo�K�1�e
'�K+8
�j)a�'�B߬g�_�b�
x!���ZnK�����W�u���	j,�l|���d��2���d��F�-��N%4}�h�'�̀='�ʺ�*&	���6��.�/ju�M����+�������I���[�ŖA"� {&w3�ߓ<A��hK���r��R\"lU(�;7E���e����Q�����PH�t�b���R�;_{��zCt��v�����`�A��e|�o��o�ovɱ�Z�����wt�4#���������"?��      i   ]  x�eRAn�@<k_����0�ذ$(za$�b�"�=�o���$�h��3���64�)c�E�#IΙn'���9�ث��cI*�"]�:FѰ��,Q�l�y���G�8z��ҜJ���m���Ms��6c�\��+�\+����o���8��+�j��6�'R��
;~�LMa_Ĕ��aO8�t���p��j���#,�J�fe��Æ�X2��Q�E$� l������#w���Ӂa��B�,���\�'���m`�vF���~�ǜݕu�V��RJ�"lU�:����_+�;�'h�epRʱ�=qt?��T�����/pg4z�x��?�
�&x�B/�Q��#���      j   �  x���M��0���)t��!�H�x&�mQt�ش�Z&Jv�CͪG��J�'i1����ģ��h�}��P��_�F�YN���Q�\G�lI�\���Q�!��kE��'H��TU����+�'*	�����~C!d33��Pa� M��\��c�W�0�����~#?�4�ݣI��ֲڵ���Z���(�y��d��-�:bn+�-�E�Q��#��RL���{�����O�+vr��|���sg�V�Y1Z
2��c�;i��2�R�y��m6;Y �<�OTS�1�-�H��0F��c�Q`�(�r׷ha�����@�mt	v)�� �w��
�ZmL�÷X�[��lQ����'s�s�,�Gw�3N�vRK�K+�4��6to�.�џ��L�o�s� Ю 8      k   �  x�}U�r�8}��BU��\	�I��S٩�}���AH�$3C�f�;�Ƕm,�$dy�bNw��G��H�_�Rh�e�c��o_Uj0/�M!7�����1��`$Z���^i�*���DU��`!��p��R(G�+���B�ŋ�����+O
�Ce���GFCvJ�䏠�S u�Ӄ�[�`a�a�>�"�xF����)G����S��)U�$d<����}�
�/�Vvs���fu��,�C؜��}�4dj�髓ء��[�z��7��<ى�J��i�z8e7(��gBY�-��m��ՅQx�D��˃%1�G�2qY`[8�n�)Ws�9�&@#R �hR��ٍ�&��y?�W�ȗ娑GD#v�֖un��	�Qk�L
��v�s2O�|+2�Gk�B�	��r�_�V���V�Td�u�;��)hT��-�p�Ѳ�~�	���W<�ʀ݁O�5���av��b����ؽy�����Wr֍��l@�%�~�����t�-_���gTk�Yo�0$�s|Y�L��F�T�}�+���^�V��^�TT��8�9�GM~ӯ���������Hs-I�Ea''�i�$kwQ=㴝<�ҧ�8	H�2�5B8e�/�	�K��sT�nG��Icvo4��,���OQ�p-��%oț��GC��t$�@?w~/T�JOB���ƚSxx�Q���8��X�p�D������XhV�[���0dUJ�D8�W�}�A�ٓ�?�.u'g�L���؟BRK�vsF�O�,n�p�'�U���w���2�c�}�{@�h4KMЋ�T����6z��݉�ٞ����g-/xH�M;�Mٕ���k��+��5l�����b$��|��Hm������h��i(�WCت�����}��wX���/f+|)$x�7}���"�&���{GN�O]ʅ�`�O��g\o�EP�ܳt���O�#�Vi\�\a�AZiB((��$ΩDs���9����F�]G�����<�J      l     x���QN�@D����@ܠ)$��@S�
�ce�d��Z�nJs{� R�;o<{ˮ�2��Wr5j�I:��m�O�8��/K�\��`�Α���a�-:���<�ƅ8+���T[�p�I�����r1�Y���X��ި�AaY̊=~�,Kvx4��V䆜%���K!��[��M<ʪi�I�k�a� �vި�:R��&��=S,/�W׼C�]��	,B�O�;:ǖcބ'U�Ӵ#�0m�pu���k��'�Ʀ�      m      x������ � �      n   S   x�p�
�I�.I,���S0Fᙠ�L�"��+�� ��T#8�(3U!��/3�$5/%_!<3�����g�$gp��qqq 8�(�      o   L  x��UQ�7���B|��H�Md���g̵hĩ42��&�G�#�b}�fly�v�CR|��#��'��M���v2ґ�K��Tm��ìvO��=I��܁��)S�ʡG�:ȁ���W�}���ܨg�x���(Ȕ=r�7Xα�a�r�4^�4���&sSfCZB��9�`�,m��X����&Q1w!+��D�5�gT�.�Dì�9�,gugvT�C�%�I��G�J�'��h�����\-B[���}���}sS�o�u���k��j�+��a�5��?(FJ�#���c��sZ�t��/-��
'�,�M��L]�8�~Q����^Di����G+�i&Dk��]�� ��Sƥ�G���uB�=Cj#ϗ^]��uQ񠜛�9 ����	י9�\ے��{7x ��x�g��A��T��n��IV���Ӑ!�aEئ��@t=}Q����'�:\��E,����w��@TP�Z�T��-�R����؛�M�42`��E'������,"쿰IS�Vč�F����{>Ʀ�f
�T��'0��Iz��ޫ���;���.���{�^[�-i����{� L�w���:6׀a]B� n���.��T�<[�]ݿ���[�J�sS��Ш�^���gY�u��@���n��j(��rl"^ ߆����������[���i���w�5%ݡjb.�^�Yј�Q0�����O�[숨��Cq��c;����-kq�I��̶ݼE�W�V���WwT?a�^��B3�K���7
�q�Gǝ���y`t���4�����݋�$/D�L�dm7�]�������v����}�w]�}�#�      p   �  x���Mr1���)t��!;�LEe�M�iϴѨqKrʹ��E*G�bQjl3f;�����e͢�J��m�[uP~A1D��<qoyL�а��<8�
-
h���yl�����*QPhP{�	Vl@����>�`z}	UlL�v���χڷ���P͹BqWrǥ%P��AbЩ��D��ek~��)� �sV��A��f��85G/��)�ϐ7�1Č�U�~�bHs��;aa5	V��5Jj�u&p����}�h�9c�MCF�[�y�:�P�e�?�ܖ^!��t O:I?�:�Z躡�g����=>�]��	�ؒ�)6ĸE�:�>j��b%{OvxR�2+���c!%�M�"�vb��sQl5b��mO-x-X�l�B�F�b�h���~8�4�A5�
���J��~:dV�/q������,���Q�����e5��BÒ��9���[v�/�[��.:��-���j+���O@*�`�N��O�^�?�p4      q   3   x���/O,JQ.I,���ϫ�0�\3K�29C2��S2���b���� ��      r      x������ � �      s      x������ � �      t   �   x����N�PF��)��`�#d�	3�tS/�[�{a�O�%qip�4=�i��l�)`I�-/2��J�>jے��±��*Y�.������M=$D�w�8�f7n2GA�Q=��V�$!�4��`�7�j��(V|���`�#�&�60�ܱo��A�;�����_�u���H�&r:��b��dW��d��Y�%y�j�ߦ�X1CA5��".j#콜ɭ��Y�� �6�c      u   ?   x�3�4ճ��t��I\F�� �������\�e�ih�, a.NN���T0����� �	      v   f   x�U��C!C��]�;�e��?G�*����Q뙣��*+�!��ewR���ű<Ū����΃�q�km�2���"�e��.Ne��7��O��������?�(�      w     x����n� @��	��&oݴ��*M$AU��T�������d�:��/��{�t8�v�X�g�-rxJ�𘒀#5��o(��m�VRp"D
ª�u������Ri������^�%؋��q�;j[������P��%��%	���֍���v����.���Ӳ��G�S���Bʨ�R�J�k��\�p�+���5�[��g�rD����p�����.��'o�xĩ�wH��T�SWp<��?8��t����=���> �9�y      x   �  x�MRQ�1�NN�p��v�K�ڮ@ ~܉;M'�'���p�z1����g���=?�!�wI�Lg��I��C��a�$U����ji��̰9����^�(ny�)P��8�_Qʭ�w���P�o�_�G�B�8�<�R�O2Ex¶�sv=u+H�*��4�bJJ�iFx=���C�l��q����H���������Z���"lB����5.�S�V:dQLk�_c�x��>E���R��H�[+����W�Y��'�F'�o��_p����y��{�2e,դnv��*��tdiž�4^���*�*�b+��PE{.����5r�tTd�����(v�Fv��E/�V���s�Bz�5����j���]3S�-ۮ�� |�,�~�w���bh|�rn�K�I�A<�j;�`F�)���X�;�F�?�y��j�     