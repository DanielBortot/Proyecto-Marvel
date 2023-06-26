PGDMP         9                {            Backup1    15.3    15.3 �    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
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
       public         heap    postgres    false                        1259    25538    Combate    TABLE     �   CREATE TABLE public."Combate" (
    "N_Personaje" text NOT NULL,
    "N_Poder" text NOT NULL,
    "N_Objeto" text NOT NULL,
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
   TABLE DATA                 public          postgres    false    214   �       V          0    24660    Cargo 
   TABLE DATA                 public          postgres    false    215   �!      X          0    24666    Ciudad 
   TABLE DATA                 public          postgres    false    217   �"      Z          0    24672    Civil 
   TABLE DATA                 public          postgres    false    219   &#                0    25538    Combate 
   TABLE DATA                 public          postgres    false    256   �#      [          0    24682    Crea 
   TABLE DATA                 public          postgres    false    220   �%      \          0    24687    Creador 
   TABLE DATA                 public          postgres    false    221   z&      ]          0    24692    Enfrenta 
   TABLE DATA                 public          postgres    false    222   |'      ^          0    24697    Esta 
   TABLE DATA                 public          postgres    false    223   �'      _          0    24704    Estado 
   TABLE DATA                 public          postgres    false    224   +      a          0    24710    Heroe 
   TABLE DATA                 public          postgres    false    226   ,      b          0    24716 	   Historial 
   TABLE DATA                 public          postgres    false    227   �.      c          0    24722    Juego 
   TABLE DATA                 public          postgres    false    228   	/      d          0    24727    Medio 
   TABLE DATA                 public          postgres    false    229   #/      e          0    24733    Nacionalidad 
   TABLE DATA                 public          postgres    false    230   I=      f          0    24738    Objeto 
   TABLE DATA                 public          postgres    false    231   �=      g          0    24743 	   Ocupacion 
   TABLE DATA                 public          postgres    false    232   vA      h          0    24748    Organizacion 
   TABLE DATA                 public          postgres    false    233   QB      i          0    24753    Pais 
   TABLE DATA                 public          postgres    false    234   �E      k          0    24759    Pelicula 
   TABLE DATA                 public          postgres    false    236   F      l          0    24767    Perfil 
   TABLE DATA                 public          postgres    false    237   �H      n          0    24774    Pers_Creador 
   TABLE DATA                 public          postgres    false    239   �I      o          0    24779    Pers_Nac 
   TABLE DATA                 public          postgres    false    240   %L      p          0    24784    Pers_Oc 
   TABLE DATA                 public          postgres    false    241   �M      q          0    24789 	   Personaje 
   TABLE DATA                 public          postgres    false    242   �O      r          0    24798 	   Pertenece 
   TABLE DATA                 public          postgres    false    243   �W      s          0    24803 
   Plat_Juego 
   TABLE DATA                 public          postgres    false    244   CY      t          0    24808 
   Plataforma 
   TABLE DATA                 public          postgres    false    245   ]Y      u          0    24813    Poder 
   TABLE DATA                 public          postgres    false    246   �Y      v          0    24818    Posee 
   TABLE DATA                 public          postgres    false    247   �]      w          0    24824    RelacionadoHer 
   TABLE DATA                 public          postgres    false    248   `      x          0    24829    RelacionadoVill 
   TABLE DATA                 public          postgres    false    249   �`      y          0    24834    Sede 
   TABLE DATA                 public          postgres    false    250   �`      z          0    24839    Serie 
   TABLE DATA                 public          postgres    false    251   �`      {          0    24844    Suscripcion 
   TABLE DATA                 public          postgres    false    252   �a      |          0    24851    Tarjeta 
   TABLE DATA                 public          postgres    false    253   �b      }          0    24858    Usuario 
   TABLE DATA                 public          postgres    false    254   Tc      ~          0    24864    Villano 
   TABLE DATA                 public          postgres    false    255   �d      �           0    0    Cargo_Cod_Cargo_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public."Cargo_Cod_Cargo_seq"', 1, false);
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
       public            postgres    false    219            �           2606    25544    Combate Combate_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public."Combate"
    ADD CONSTRAINT "Combate_pkey" PRIMARY KEY ("N_Personaje", "N_Poder", "N_Objeto", "Fecha");
 B   ALTER TABLE ONLY public."Combate" DROP CONSTRAINT "Combate_pkey";
       public            postgres    false    256    256    256    256            +           2606    24885    Crea Crea_pkey 
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
       public          postgres    false    260    242            �           2620    24987    Usuario numusuarios_trigger    TRIGGER     �   CREATE TRIGGER numusuarios_trigger BEFORE INSERT OR UPDATE ON public."Usuario" FOR EACH ROW EXECUTE FUNCTION public.numusuarios();
 6   DROP TRIGGER numusuarios_trigger ON public."Usuario";
       public          postgres    false    254    264            �           2620    24988    Medio rating_trigger    TRIGGER     z   CREATE TRIGGER rating_trigger BEFORE INSERT OR UPDATE ON public."Medio" FOR EACH ROW EXECUTE FUNCTION public.numrating();
 /   DROP TRIGGER rating_trigger ON public."Medio";
       public          postgres    false    263    229            �           2620    24989    Esta rolpersonaje_trigger    TRIGGER     �   CREATE TRIGGER rolpersonaje_trigger BEFORE INSERT OR UPDATE ON public."Esta" FOR EACH ROW EXECUTE FUNCTION public.rolpersonaje();
 4   DROP TRIGGER rolpersonaje_trigger ON public."Esta";
       public          postgres    false    265    223            �           2620    24990    Esta tipoactor_trigger    TRIGGER     |   CREATE TRIGGER tipoactor_trigger BEFORE INSERT OR UPDATE ON public."Esta" FOR EACH ROW EXECUTE FUNCTION public.tipoactor();
 1   DROP TRIGGER tipoactor_trigger ON public."Esta";
       public          postgres    false    223    267            �           2620    24991 %   Suscripcion tiposuscripciones_trigger    TRIGGER     �   CREATE TRIGGER tiposuscripciones_trigger BEFORE INSERT OR UPDATE ON public."Suscripcion" FOR EACH ROW EXECUTE FUNCTION public.tiposuscripciones();
 @   DROP TRIGGER tiposuscripciones_trigger ON public."Suscripcion";
       public          postgres    false    252    266            �           2606    25297 #   Aparece Aparece_N_Organizacion_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Aparece"
    ADD CONSTRAINT "Aparece_N_Organizacion_fkey" FOREIGN KEY ("N_Organizacion") REFERENCES public."Organizacion"("Nombre") ON UPDATE CASCADE NOT VALID;
 Q   ALTER TABLE ONLY public."Aparece" DROP CONSTRAINT "Aparece_N_Organizacion_fkey";
       public          postgres    false    214    233    3409            �           2606    25302    Aparece Aparece_N_Titulo_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Aparece"
    ADD CONSTRAINT "Aparece_N_Titulo_fkey" FOREIGN KEY ("N_Titulo") REFERENCES public."Medio"("Titulo") ON UPDATE CASCADE NOT VALID;
 K   ALTER TABLE ONLY public."Aparece" DROP CONSTRAINT "Aparece_N_Titulo_fkey";
       public          postgres    false    214    3393    229            �           2606    25522    Ciudad Ciudad_Id_Estado_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Ciudad"
    ADD CONSTRAINT "Ciudad_Id_Estado_fkey" FOREIGN KEY ("Id_Estado") REFERENCES public."Estado"("Id_Estado") ON UPDATE CASCADE NOT VALID;
 J   ALTER TABLE ONLY public."Ciudad" DROP CONSTRAINT "Ciudad_Id_Estado_fkey";
       public          postgres    false    217    224    3379            �           2606    25307    Civil Civil_N_Civil_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Civil"
    ADD CONSTRAINT "Civil_N_Civil_fkey" FOREIGN KEY ("N_Civil") REFERENCES public."Personaje"("Nombre") ON UPDATE CASCADE NOT VALID;
 F   ALTER TABLE ONLY public."Civil" DROP CONSTRAINT "Civil_N_Civil_fkey";
       public          postgres    false    3423    219    242            �           2606    25555    Combate Combate_N_Objeto_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Combate"
    ADD CONSTRAINT "Combate_N_Objeto_fkey" FOREIGN KEY ("N_Objeto") REFERENCES public."Objeto"("Nombre") ON UPDATE CASCADE;
 K   ALTER TABLE ONLY public."Combate" DROP CONSTRAINT "Combate_N_Objeto_fkey";
       public          postgres    false    256    3399    231            �           2606    25545     Combate Combate_N_Personaje_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Combate"
    ADD CONSTRAINT "Combate_N_Personaje_fkey" FOREIGN KEY ("N_Personaje") REFERENCES public."Personaje"("Nombre") ON UPDATE CASCADE;
 N   ALTER TABLE ONLY public."Combate" DROP CONSTRAINT "Combate_N_Personaje_fkey";
       public          postgres    false    256    242    3423            �           2606    25550    Combate Combate_N_Poder_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Combate"
    ADD CONSTRAINT "Combate_N_Poder_fkey" FOREIGN KEY ("N_Poder") REFERENCES public."Poder"("Nombre") ON UPDATE CASCADE;
 J   ALTER TABLE ONLY public."Combate" DROP CONSTRAINT "Combate_N_Poder_fkey";
       public          postgres    false    256    246    3435            �           2606    25327    Crea Crea_N_Objeto_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Crea"
    ADD CONSTRAINT "Crea_N_Objeto_fkey" FOREIGN KEY ("N_Objeto") REFERENCES public."Objeto"("Nombre") ON UPDATE CASCADE NOT VALID;
 E   ALTER TABLE ONLY public."Crea" DROP CONSTRAINT "Crea_N_Objeto_fkey";
       public          postgres    false    220    3399    231            �           2606    25332    Crea Crea_N_Personaje_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Crea"
    ADD CONSTRAINT "Crea_N_Personaje_fkey" FOREIGN KEY ("N_Personaje") REFERENCES public."Personaje"("Nombre") ON UPDATE CASCADE NOT VALID;
 H   ALTER TABLE ONLY public."Crea" DROP CONSTRAINT "Crea_N_Personaje_fkey";
       public          postgres    false    242    3423    220            �           2606    25337    Enfrenta Enfrenta_N_Heroe_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Enfrenta"
    ADD CONSTRAINT "Enfrenta_N_Heroe_fkey" FOREIGN KEY ("N_Heroe") REFERENCES public."Heroe"("N_Heroe") ON UPDATE CASCADE NOT VALID;
 L   ALTER TABLE ONLY public."Enfrenta" DROP CONSTRAINT "Enfrenta_N_Heroe_fkey";
       public          postgres    false    226    222    3385            �           2606    25342     Enfrenta Enfrenta_N_Villano_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Enfrenta"
    ADD CONSTRAINT "Enfrenta_N_Villano_fkey" FOREIGN KEY ("N_Villano") REFERENCES public."Villano"("N_Villano") ON UPDATE CASCADE NOT VALID;
 N   ALTER TABLE ONLY public."Enfrenta" DROP CONSTRAINT "Enfrenta_N_Villano_fkey";
       public          postgres    false    222    255    3467            �           2606    25347    Esta Esta_N_Personaje_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Esta"
    ADD CONSTRAINT "Esta_N_Personaje_fkey" FOREIGN KEY ("N_Personaje") REFERENCES public."Personaje"("Nombre") ON UPDATE CASCADE NOT VALID;
 H   ALTER TABLE ONLY public."Esta" DROP CONSTRAINT "Esta_N_Personaje_fkey";
       public          postgres    false    223    242    3423            �           2606    25352    Esta Esta_N_Titulo_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Esta"
    ADD CONSTRAINT "Esta_N_Titulo_fkey" FOREIGN KEY ("N_Titulo") REFERENCES public."Medio"("Titulo") ON UPDATE CASCADE NOT VALID;
 E   ALTER TABLE ONLY public."Esta" DROP CONSTRAINT "Esta_N_Titulo_fkey";
       public          postgres    false    223    3393    229            �           2606    25527    Estado Estado_Id_Pais_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Estado"
    ADD CONSTRAINT "Estado_Id_Pais_fkey" FOREIGN KEY ("Id_Pais") REFERENCES public."Pais"("Id_Pais") ON UPDATE CASCADE NOT VALID;
 H   ALTER TABLE ONLY public."Estado" DROP CONSTRAINT "Estado_Id_Pais_fkey";
       public          postgres    false    234    224    3411            �           2606    25357    Heroe Heroe_Archienemigo_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Heroe"
    ADD CONSTRAINT "Heroe_Archienemigo_fkey" FOREIGN KEY ("Archienemigo") REFERENCES public."Villano"("N_Villano") ON UPDATE CASCADE NOT VALID;
 K   ALTER TABLE ONLY public."Heroe" DROP CONSTRAINT "Heroe_Archienemigo_fkey";
       public          postgres    false    255    226    3467            �           2606    25362    Heroe Heroe_N_Heroe_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Heroe"
    ADD CONSTRAINT "Heroe_N_Heroe_fkey" FOREIGN KEY ("N_Heroe") REFERENCES public."Personaje"("Nombre") ON UPDATE CASCADE NOT VALID;
 F   ALTER TABLE ONLY public."Heroe" DROP CONSTRAINT "Heroe_N_Heroe_fkey";
       public          postgres    false    226    3423    242            �           2606    25392 "   Historial Historial_Id_Perfil_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Historial"
    ADD CONSTRAINT "Historial_Id_Perfil_fkey" FOREIGN KEY ("Id_Perfil") REFERENCES public."Perfil"("Id_Perfil") ON UPDATE CASCADE NOT VALID;
 P   ALTER TABLE ONLY public."Historial" DROP CONSTRAINT "Historial_Id_Perfil_fkey";
       public          postgres    false    237    3415    227            �           2606    25387 !   Historial Historial_N_Titulo_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Historial"
    ADD CONSTRAINT "Historial_N_Titulo_fkey" FOREIGN KEY ("N_Titulo") REFERENCES public."Medio"("Titulo") ON UPDATE CASCADE NOT VALID;
 O   ALTER TABLE ONLY public."Historial" DROP CONSTRAINT "Historial_N_Titulo_fkey";
       public          postgres    false    229    3393    227            �           2606    25367    Juego Juego_T_Juego_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Juego"
    ADD CONSTRAINT "Juego_T_Juego_fkey" FOREIGN KEY ("T_Juego") REFERENCES public."Medio"("Titulo") ON UPDATE CASCADE NOT VALID;
 F   ALTER TABLE ONLY public."Juego" DROP CONSTRAINT "Juego_T_Juego_fkey";
       public          postgres    false    228    3393    229            �           2606    25497    Serie Medio_T_Serie_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Serie"
    ADD CONSTRAINT "Medio_T_Serie_fkey" FOREIGN KEY ("T_Serie") REFERENCES public."Medio"("Titulo") ON UPDATE CASCADE NOT VALID;
 F   ALTER TABLE ONLY public."Serie" DROP CONSTRAINT "Medio_T_Serie_fkey";
       public          postgres    false    229    3393    251            �           2606    25532    Objeto Objeto_N_Personaje_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Objeto"
    ADD CONSTRAINT "Objeto_N_Personaje_fkey" FOREIGN KEY ("N_Personaje") REFERENCES public."Personaje"("Nombre") ON UPDATE CASCADE NOT VALID;
 L   ALTER TABLE ONLY public."Objeto" DROP CONSTRAINT "Objeto_N_Personaje_fkey";
       public          postgres    false    231    3423    242            �           2606    25565 '   Organizacion Organizacion_Fundador_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Organizacion"
    ADD CONSTRAINT "Organizacion_Fundador_fkey" FOREIGN KEY ("Fundador") REFERENCES public."Personaje"("Nombre") ON UPDATE CASCADE NOT VALID;
 U   ALTER TABLE ONLY public."Organizacion" DROP CONSTRAINT "Organizacion_Fundador_fkey";
       public          postgres    false    233    3423    242            �           2606    25560 $   Organizacion Organizacion_Lider_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Organizacion"
    ADD CONSTRAINT "Organizacion_Lider_fkey" FOREIGN KEY ("Lider") REFERENCES public."Personaje"("Nombre") ON UPDATE CASCADE NOT VALID;
 R   ALTER TABLE ONLY public."Organizacion" DROP CONSTRAINT "Organizacion_Lider_fkey";
       public          postgres    false    233    242    3423            �           2606    25397 !   Pelicula Pelicula_T_Pelicula_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Pelicula"
    ADD CONSTRAINT "Pelicula_T_Pelicula_fkey" FOREIGN KEY ("T_Pelicula") REFERENCES public."Medio"("Titulo") ON UPDATE CASCADE NOT VALID;
 O   ALTER TABLE ONLY public."Pelicula" DROP CONSTRAINT "Pelicula_T_Pelicula_fkey";
       public          postgres    false    3393    229    236            �           2606    25402    Perfil Perfil_Email_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Perfil"
    ADD CONSTRAINT "Perfil_Email_fkey" FOREIGN KEY ("Email") REFERENCES public."Usuario"("Email") ON UPDATE CASCADE NOT VALID;
 F   ALTER TABLE ONLY public."Perfil" DROP CONSTRAINT "Perfil_Email_fkey";
       public          postgres    false    3463    254    237            �           2606    25407 (   Pers_Creador Pers_Creador_N_Creador_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Pers_Creador"
    ADD CONSTRAINT "Pers_Creador_N_Creador_fkey" FOREIGN KEY ("N_Creador") REFERENCES public."Creador"("Nom_Creador") ON UPDATE CASCADE NOT VALID;
 V   ALTER TABLE ONLY public."Pers_Creador" DROP CONSTRAINT "Pers_Creador_N_Creador_fkey";
       public          postgres    false    239    221    3373            �           2606    25412 *   Pers_Creador Pers_Creador_N_Personaje_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Pers_Creador"
    ADD CONSTRAINT "Pers_Creador_N_Personaje_fkey" FOREIGN KEY ("N_Personaje") REFERENCES public."Personaje"("Nombre") ON UPDATE CASCADE NOT VALID;
 X   ALTER TABLE ONLY public."Pers_Creador" DROP CONSTRAINT "Pers_Creador_N_Personaje_fkey";
       public          postgres    false    3423    239    242            �           2606    25417 "   Pers_Nac Pers_Nac_N_Personaje_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Pers_Nac"
    ADD CONSTRAINT "Pers_Nac_N_Personaje_fkey" FOREIGN KEY ("N_Personaje") REFERENCES public."Personaje"("Nombre") ON UPDATE CASCADE NOT VALID;
 P   ALTER TABLE ONLY public."Pers_Nac" DROP CONSTRAINT "Pers_Nac_N_Personaje_fkey";
       public          postgres    false    240    242    3423            �           2606    25422 #   Pers_Nac Pers_Nac_Nacionalidad_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Pers_Nac"
    ADD CONSTRAINT "Pers_Nac_Nacionalidad_fkey" FOREIGN KEY ("Nacionalidad") REFERENCES public."Nacionalidad"("Nac") ON UPDATE CASCADE NOT VALID;
 Q   ALTER TABLE ONLY public."Pers_Nac" DROP CONSTRAINT "Pers_Nac_Nacionalidad_fkey";
       public          postgres    false    230    3395    240            �           2606    25427     Pers_Oc Pers_Oc_N_Personaje_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Pers_Oc"
    ADD CONSTRAINT "Pers_Oc_N_Personaje_fkey" FOREIGN KEY ("N_Personaje") REFERENCES public."Personaje"("Nombre") ON UPDATE CASCADE NOT VALID;
 N   ALTER TABLE ONLY public."Pers_Oc" DROP CONSTRAINT "Pers_Oc_N_Personaje_fkey";
       public          postgres    false    3423    242    241            �           2606    25432    Pers_Oc Pers_Oc_Ocupacion_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Pers_Oc"
    ADD CONSTRAINT "Pers_Oc_Ocupacion_fkey" FOREIGN KEY ("Ocupacion") REFERENCES public."Ocupacion"("Ocup") ON UPDATE CASCADE NOT VALID;
 L   ALTER TABLE ONLY public."Pers_Oc" DROP CONSTRAINT "Pers_Oc_Ocupacion_fkey";
       public          postgres    false    232    3401    241            �           2606    25437 "   Pertenece Pertenece_Cod_Cargo_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Pertenece"
    ADD CONSTRAINT "Pertenece_Cod_Cargo_fkey" FOREIGN KEY ("Cod_Cargo") REFERENCES public."Cargo"("Cod_Cargo") ON UPDATE CASCADE NOT VALID;
 P   ALTER TABLE ONLY public."Pertenece" DROP CONSTRAINT "Pertenece_Cod_Cargo_fkey";
       public          postgres    false    243    3365    215            �           2606    25442 '   Pertenece Pertenece_N_Organizacion_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Pertenece"
    ADD CONSTRAINT "Pertenece_N_Organizacion_fkey" FOREIGN KEY ("N_Organizacion") REFERENCES public."Organizacion"("Nombre") ON UPDATE CASCADE NOT VALID;
 U   ALTER TABLE ONLY public."Pertenece" DROP CONSTRAINT "Pertenece_N_Organizacion_fkey";
       public          postgres    false    243    233    3409            �           2606    25447 $   Pertenece Pertenece_N_Personaje_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Pertenece"
    ADD CONSTRAINT "Pertenece_N_Personaje_fkey" FOREIGN KEY ("N_Personaje") REFERENCES public."Personaje"("Nombre") ON UPDATE CASCADE NOT VALID;
 R   ALTER TABLE ONLY public."Pertenece" DROP CONSTRAINT "Pertenece_N_Personaje_fkey";
       public          postgres    false    3423    242    243            �           2606    25452 %   Plat_Juego Plat_Juego_Plataforma_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Plat_Juego"
    ADD CONSTRAINT "Plat_Juego_Plataforma_fkey" FOREIGN KEY ("Plataforma") REFERENCES public."Plataforma"(nombre) ON UPDATE CASCADE NOT VALID;
 S   ALTER TABLE ONLY public."Plat_Juego" DROP CONSTRAINT "Plat_Juego_Plataforma_fkey";
       public          postgres    false    245    244    3431            �           2606    25457 "   Plat_Juego Plat_Juego_T_Juego_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Plat_Juego"
    ADD CONSTRAINT "Plat_Juego_T_Juego_fkey" FOREIGN KEY ("T_Juego") REFERENCES public."Juego"("T_Juego") ON UPDATE CASCADE NOT VALID;
 P   ALTER TABLE ONLY public."Plat_Juego" DROP CONSTRAINT "Plat_Juego_T_Juego_fkey";
       public          postgres    false    228    244    3389            �           2606    25462    Posee Posee_N_Personaje_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Posee"
    ADD CONSTRAINT "Posee_N_Personaje_fkey" FOREIGN KEY ("N_Personaje") REFERENCES public."Personaje"("Nombre") ON UPDATE CASCADE NOT VALID;
 J   ALTER TABLE ONLY public."Posee" DROP CONSTRAINT "Posee_N_Personaje_fkey";
       public          postgres    false    242    3423    247            �           2606    25467    Posee Posee_N_Poder_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Posee"
    ADD CONSTRAINT "Posee_N_Poder_fkey" FOREIGN KEY ("N_Poder") REFERENCES public."Poder"("Nombre") ON UPDATE CASCADE NOT VALID;
 F   ALTER TABLE ONLY public."Posee" DROP CONSTRAINT "Posee_N_Poder_fkey";
       public          postgres    false    246    247    3435            �           2606    25472 *   RelacionadoHer RelacionadoHer_N_Civil_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."RelacionadoHer"
    ADD CONSTRAINT "RelacionadoHer_N_Civil_fkey" FOREIGN KEY ("N_Civil") REFERENCES public."Civil"("N_Civil") ON UPDATE CASCADE NOT VALID;
 X   ALTER TABLE ONLY public."RelacionadoHer" DROP CONSTRAINT "RelacionadoHer_N_Civil_fkey";
       public          postgres    false    248    219    3369            �           2606    25477 *   RelacionadoHer RelacionadoHer_N_Heroe_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."RelacionadoHer"
    ADD CONSTRAINT "RelacionadoHer_N_Heroe_fkey" FOREIGN KEY ("N_Heroe") REFERENCES public."Heroe"("N_Heroe") ON UPDATE CASCADE NOT VALID;
 X   ALTER TABLE ONLY public."RelacionadoHer" DROP CONSTRAINT "RelacionadoHer_N_Heroe_fkey";
       public          postgres    false    226    3385    248            �           2606    25482 ,   RelacionadoVill RelacionadoVill_N_Civil_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."RelacionadoVill"
    ADD CONSTRAINT "RelacionadoVill_N_Civil_fkey" FOREIGN KEY ("N_Civil") REFERENCES public."Civil"("N_Civil") ON UPDATE CASCADE NOT VALID;
 Z   ALTER TABLE ONLY public."RelacionadoVill" DROP CONSTRAINT "RelacionadoVill_N_Civil_fkey";
       public          postgres    false    249    219    3369            �           2606    25487 .   RelacionadoVill RelacionadoVill_N_Villano_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."RelacionadoVill"
    ADD CONSTRAINT "RelacionadoVill_N_Villano_fkey" FOREIGN KEY ("N_Villano") REFERENCES public."Villano"("N_Villano") ON UPDATE CASCADE NOT VALID;
 \   ALTER TABLE ONLY public."RelacionadoVill" DROP CONSTRAINT "RelacionadoVill_N_Villano_fkey";
       public          postgres    false    255    249    3467            �           2606    25492    Sede Sede_N_Org_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Sede"
    ADD CONSTRAINT "Sede_N_Org_fkey" FOREIGN KEY ("N_Org") REFERENCES public."Organizacion"("Nombre") ON UPDATE CASCADE NOT VALID;
 B   ALTER TABLE ONLY public."Sede" DROP CONSTRAINT "Sede_N_Org_fkey";
       public          postgres    false    233    250    3409            �           2606    25502    Usuario Usuario_Direccion_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Usuario"
    ADD CONSTRAINT "Usuario_Direccion_fkey" FOREIGN KEY ("Direccion") REFERENCES public."Ciudad"("Id_Ciudad") ON UPDATE CASCADE NOT VALID;
 L   ALTER TABLE ONLY public."Usuario" DROP CONSTRAINT "Usuario_Direccion_fkey";
       public          postgres    false    217    3367    254            �           2606    25512 #   Usuario Usuario_Id_Suscripcion_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Usuario"
    ADD CONSTRAINT "Usuario_Id_Suscripcion_fkey" FOREIGN KEY ("Id_Suscripcion") REFERENCES public."Suscripcion"("ID") ON UPDATE CASCADE NOT VALID;
 Q   ALTER TABLE ONLY public."Usuario" DROP CONSTRAINT "Usuario_Id_Suscripcion_fkey";
       public          postgres    false    254    3453    252            �           2606    25507    Usuario Usuario_N_Tarjeta_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Usuario"
    ADD CONSTRAINT "Usuario_N_Tarjeta_fkey" FOREIGN KEY ("N_Tarjeta") REFERENCES public."Tarjeta"("N_Tarjeta") ON UPDATE CASCADE NOT VALID;
 L   ALTER TABLE ONLY public."Usuario" DROP CONSTRAINT "Usuario_N_Tarjeta_fkey";
       public          postgres    false    3455    254    253            �           2606    25517    Villano Villano_N_Villano_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Villano"
    ADD CONSTRAINT "Villano_N_Villano_fkey" FOREIGN KEY ("N_Villano") REFERENCES public."Personaje"("Nombre") ON UPDATE CASCADE NOT VALID;
 L   ALTER TABLE ONLY public."Villano" DROP CONSTRAINT "Villano_N_Villano_fkey";
       public          postgres    false    242    3423    255            U     x�͒�j�@�w?���B���dZ�\��n֢�#��|6mߦc�#/ֳ�i�:݄��>�Oi^$�Ҽ�BӽR7aܠh�C����VjdzGE���NI�3v���a5V;k�9���))`�5�~"��e���N��v��:�-�*�����4��b)��B!;I*����Sl�*��;l�?���SH�
��F���N�b�@إ��
2-���8�u��L���֚�ozH�=ia��T�
r���"do�;5k4�J#��و���І�      V   ~   x���v
Q���W((M��L�SrN,J�WR�Pr�O��pt�\R���2�3��4�}B]�4t�}2SR��5��<)6�h�s~Zi^JbJ>��4�阞�W�J��姥C\�� .�`      X   �   x���v
Q���W((M��L�Sr�,MILQR�P�L��rt���s��RA,��kqIbJ���B��O�k���������sbQbrb�������5�'�L7�V��������_��ƈ�����/VI-,M�È��0�RN
8��@��� �En�      Z   P   x���v
Q���W((M��L�Sr�,��QR�P�05�}B]�4�]3K�2�5��<I��_�X��\�X���� ̫#�           x�Ֆ�n�0���G��&-(�V�U�:Եc)����ƭ�S9v��6\�G�a'!��"�Ľ;'r���3�%��ĳ�vz�Y���vI��̛}���@A�Ի �bFeeΗk���W4͉5�zE�ww���$���"G	�	sG���D���$e��2
� �4U��,#Yyf�\0i�^�~0��K��4�#\�Y���W��Y�D宅+M�W�4h}�{~04�?�	|B�qNbW(���H1�٧���D����T [C��������֛b�X��* �����/��RS%��=�r�����.
V(�`E�nqen9&�Hufa9�Ɏ��7���h�)9q���`X�\�z�[39H�o1'B@��[��c���Z�s&�&RUi�{k�d�`��iZT�-f�UF�w�q�'��V���΁\���z���8s�ˆ�R�~�]�لÒ��/��I�z�R߷+�Qd���)9�VKv��Qw"1���l���
�XJvbV��)r3Ȍ'Aފ�G�q�N���$�      [   �   x���1�0��S�t��!��P#�j��bmI[4��sp1���y���WZ�٩ZT����ݒ�p$��r��j�='�#kz�4��ꬄ(��zA�������Rƻ��g�����J�Ƚ~��~�f�;��� ��V�ܧ�-��cv�sO�GsX>�Vz�9�u�����(n�5��R�/����      \   �   x���AN�0�}N1���j�PBC*5��qF�W�4MA�=��7O���yYe���>�ǭ��Vcת�h�*u|�?n�uW�dm���
���>Ƀ��T��p�I�*�*��=�`�n�*t��8�}.�K'����,-��q�h�⻈�Y�S�vK�:br�H�2ӲX�H7�d���頾���T/L���X���D|ݔEp�3��!�ٙ��tTm�b6�7՟�� ��Ò��,w�      ]   
   x���          ^   �  x�ՙKrI��:E�6�#��w�J<$����q$�	]���������3�b�ڀd��Z��|��ןYٍN�������$���:�;�����Kֱ��t�d�W>h�_�Մ\Şm��X���p��V����>��<����hX6�F3m<ى%�	��e�#6J~:_G< ���fд�?�5�G��o ���Ɍ�Β;I��1A�!��S���-%j�	n�o�]O�&�a�ٔ�{�۲C��5/��-�%�ȗ,r�v�jj��[�܃�5-���iJ�H�f��8Q�鷁����b��0�*#��|oH}�ƕ���(�vU�M�A�.E�n����͆ܣ8��Z�b����&���J��אwO���Z/77Խ��d)�ADs�,<�*NY���`g;� �҂&��Rd�J�9�G&���n����Vy�zY�I�E��3���ٸ�l����,	��29�%���6Ћ�L%��ҷ�m1|'�*3*<���0i���XG�3V�hreto/17�yU��0Q�捽�M��&�P�*Q�箍R���&����)i���ѐL��m�*���cT����G��	��j��7�;s�D��J��_|pb�0������ʿ��ш��<%�%�"B���k%Ui!�#!ύ�ZxN�ڢ��;�_���(��n�B�Ƨ����5�ƈ�J��3�)�k��{�R�]i�����])����d�	����4��t����&Y���@&[��.���h����NqBe�Jt�C4Ǜ������K�1 Y�h hoy��Gf��q�@J�I�y��/�ѝ��܆�lk�p�(��X�o�>������<|�	h������5>*�^A]+�`��7���C��f�I)y����X|<���\o���(<ɖ�oB��=�0�_�1K�	5E��o�#�qJ�#W,&Z̼�<)�F"�_��4V����c*���A�;���F��Z܈��k9;�q,�P      _   �   x���v
Q���W((M��L�Sr-.IL�WR�P�L��rt���s��RA,�p@bf���B��O�k��������KfqIQfI��sbAfIb������5�'u�0Y�Y����H]���&;�痀6���A������d�A��� �j}      a   �  x�ŗ�n�@��y�)�T���$�Mr�����w�욖�V�/�ٵI�4g��̀�O���d��^��d�^�}����So�L�S��se^���hp��Җ��S��d�����7�d-zK��0�~�^�����Q�<p޿T�	�U3�bϿO�YҎ�Q��!�:|��l���h���� �_I�j&����8�l9�-��8�IF��)� %�������5���!`S�՛/��[e:m(�E��-��_^��ؤ�.�N=�AW`�Lt��ӄ�#`՘~�>p=�9 k��X�B�kLG��`bR����5q!5�N�v����Yt�꿀.@ZO��x���9�0lc��85��Xp�.q�x#��Z�y97���v=���b��76��9ob��K�]Vr�o�b����M��x@��-r��!쵗2�Icj�KsY#
k�Ǳ�)k�*�
��~kw�{�qN)�za�)�id8m�N��ڸ�k�X��LP䃵U�ǥ�ߋ��.����u��-�u&e�j�*i��%?u�)�Sʵ�B��cx�-�\B!�6�@��"�۽?���Dd��9��G��^�lU��^���Z6�7�I�I-/��t�b~+ki�����r��iq%�BA���F�Fg��K���W�4����ylO�f�tt�o�(޽㔰�/`&�.�|�aD�M����:��;x;;�	f�      b   
   x���          c   
   x���          d     x��ZMs�8��W�|�L�,ɒ����]�����W%�� � � �r�3�|ؚ�^���u��%ٞ�S�[�32M�`�ׯ_7||zqx~)�O/Y1Ht�\�X�5��ڥ΋Į5�ڑ�Ʋ�s�_طi&����\�ڌ�Ӆ66�����T��Y�U\�\^�_^�m"_7��N��]oo��)�1���'>��x{�����:��<vֈ�4a����vg��E?����D\���qe/���t7Q�Ŵ�Nk��Ǚʁӑ4��ҥ�7��«�Pث��.���G)"kp�Ў����9~�dS�t�mCDNI�$Efc嬗|{\8\����ć�8P>+�?<����S^:z����k������B�*26���}�
�3U.��+����M'�膜���T&M
�8�3����M�⸩��ok�7�nL��ќd�����X�c���z�(�Hn �^��>�;WDJ���(� GZ�|~?ԑ�
$����%�"ܓ�@�ܨ������N fC
 � F�YJ�:��B�G�Ɨ2�(�#;��[�}!�{�j#��
[�b s�$R�d �0i3E �L�5�Ȧ-M!�^�w�����������d/��]ߜ�۽�����M��n������t���h����|s8�|s�-z��?_�~;�ڿ]�N����_o�?���_}������7�4ڍ�n�A?���o@�6�7v�D��6(�e�YA�D�$ ��8�c ��	��_j�	P�j��ϰY|[�HC,�X�"�1*�vH�T"� "��1��7����������t�X�p`ĉ��P�)9�� |�M$�ݙ�m~Α���`Ϗ���hq{{��i<`B�:OT+�ۻ�vw�M�3��V��K7v�l�t����ֿ�����};����4�ʈ�t����-��t��N�!Q]�zg��y�\M�8�#$g��b�tBR���Ao�d�B�ۤ \��,���S���A# �F��p��aţ�h��r�����v�,���u#�NFz��!9��X�����$���dl�b���N@2*T���T��;�fp?�U�h�� %�g6g���ǝo�Ï'Ǜ�˫�I��6?����}��F��'��_Q�ol��-T�\B� ^8��C��Ѓ����%[��C����1����"�����d�1�A�4H��J����K�5x�â�:�G����=dZ�nS|�,�t0H�j�GGT�	4b~�ח�%bo�]��D�$��=҇|�R�J�m����n;�v�?�v����T��K�s�6���n�u6�fg;�oӉ�4/�o�Y:%�mR����`�Q!^A��PPdȱ)Ԕ낗��=>��|�Z���L��[����,�&P	?E i'������;�B�Z9G�R�R�����p�Z8*���'�R)tW*n���rR��oZ���������g���I�����_|����/�o��v��w�ً� ����
�=�d	��:j@(�{��0���x�|�({���T��Q�&Gؠ�^6V���h"13x@2e�-H�<�.2^�/�ЀsOP�!��5����I��D�]��*
�HV�G����Fb�b%�VȨ�U(�0F�:1)|�#M�D`�_�B�"�!��zK��j��]:���� 6~�x)�9I��d5������c�;�r g?�Я���I��8z�!�#KG��>�t�2��j�V�j���)�A�/���u'&��a��d�A�%����%���邱��D�Ч¬�$BM!G镪�*���S��$珺��2*�#|X*�Q��`��%k�"⚢=�h��'ōB�T	��z��z��n���fF{lӁcR�FZ#d:�D��_���-n���T>}��5W%��hK��Z�{�ћAP伔p��=9\�ӕ�/{�L%zD��xJꤘ)�=Ⱦ�skR[�c��hHがn���su��ҁ-�:�,�nB�(�/�G�=���5�5�"�<��_�Ps=�2��ӻ�%l=�#Mcȋd+#�P�}TNV�Q/V����+S�7���jД�¤]ԑ��>��B���f���x,��'�����b�:+�~��vl`˺Nְ��"Ws�5}@\z�Rs��-<JPbڲ��;;p�Tk� ��	��k��r��D�I��|l��!�S��R��B�Z:���4�
Qb�����RV�C��>Xvv�b��-�͵�[���<��U�ZG�uN$yV�X�4��)c]Y�x7|���
iQ�%�C���=� �rB#��=C�ʇ.��U�P�d�\d�S#�oŕ	��@Ї��g:���]Pp������3x�\[S�X���jAE�b;�3NR��*���~!��_�zUr#v�3�uU�<�R<���'��ԲHQy�q��,d��˯�~����,�D��#�pD�8�<�aZ�a�u���&�h���8s6."�QC�u�c`�]3�)�q�O՝H+m���^4!�go:�Z(��!K�%���|)���.�ĕ'���'�E�p����X���V#(R��ks��d���h��e7��b�0�<c]�蠇���8<b�L�G�JB&>�����h���ܭf��کO�O�a�f�мDB�{�aI/�e�O���H(jꞸ6/"\��#݇��O��Fr:���0sB� ��Q��iz�Ȕ =L�;���T��hV�)6nMB;6�� �2�=�ϐR��BE��	���å9����ȍ����Z'j~���1�|� 6�L�v�u:�)���,�����\m���ݗ8
�b�(xӚ42zJ�-�F�jO��\�
�`�z�d���=u ��4X�tnt>^>��E�Y$��\v��5`Z��0G}|.R�U-��(kJ5�7y�h�e���G��xF�X���ꌎ����
�: %�.�e��;�'%H����f��YS��I��p|�����!
K@Tp��.{y�E��1�h~h7�'̓fuv��,�ֹ"_����L���㎒-����U9��-'\��}ũ�ɑL���̘߾.=���i:T�:���9s��E��R�b�t��ҡ�/��x��2�ߵ|�y��;�'a~uF�&~G�KB�!KLE�g�fT+%�
���uq�!/�# ������O�A�j�}/i������0*�Q9��Y��kYo��
b���&���a�I�N����F���"k:�.���T��W���)��0<P�����E��9*EB��s!�Sq�BC\$��V�Tǋ�@Y$�(N^�(�2zG�J)��8kL��s������;v
��
m�\</��?$�m4M����N��f�񟬐#���� ԁG8���ފFW
^v~�Yp2$9fuNR�2b�����c�^#���~#�yy�ZB.�?_�L��Xw���!."?"͈� ����X����@��\���R,@���ɁV�y�����)>С��,m��0i�H��X~Zn�L^�y݈�hd���r8��ě��mG�#�/M��j��ԟU� ������x$��x�6��<$+R=IY-2%�_����YE      e   �   x��ϱ�0��>SXi�4,@�� d�$@��Yp�9���YXeLy��?]gݏ�3�I����)&��*U��e�.��UW:D�O�d%ت���6ܱC|f�O!�������C@���W<!����#������>&yX�W__y�O      f   x  x��V�r7��+P<Dv�I�)*��r�FIXŇʒ|e�b�$(,��AJ�s�)����.ѱϴ�p��=��xvs��V�g�s�si��u�������ˀ�W��F�W�Y�N!a�`x|���縆6���Ct6�y)�'wW7���½�����u�5j�2��rr0��SQ�:��N<
\=����|�Aʘ ����гN9w��g1����kޒ��8���FY�J�qpv1��.�@��]ɀ[	�4ToL2*0�M���UZw+���_~R��~�����⢸\��x����o12�[g�M���/<����3VA�%m����J��λ��X=fTU���2���{�Ւ�Qr��B.�!�..ś���/�-���eZ�Э�C�k�I��2ӭ1�9��6~��B�żҖp�����r�ǌ��i���a��+h�Pq�+T6��uA�*�� �x���������썃�i�+jLV�g�g�(����W�K�/%�� TM�]���=^��7	�(޹Utj�fN��	��n2y�� xs��x���OE�4w����a�#���D��I`[�@(��3T�P������4fa�E��¼�p���e�]+���;��Ƕ�ۈw!
E�-�-�T%��՚b�_�p�8�=��+w4�A(�u���#�n�cd�M�g���_�a��J���������:�tQԨ�^�׵.ܾL���2nN�(��_�*�V�_�rgB�'�b�&�9hA�LG����^m���S�	�3���~eP�&���eT|$��by��_�����g�Z�IO7Wz�������$�X��Wл���vU�&��h��V������p	�eG���͞��k�%�      g   �   x���M�0�=�h�(/�� &M����d�Ғi�V�<��β�/}�&��kyi��۳��Β٥g3O`ȻTm�4S��t+�j��n@G�~������R�� ����'#]�i}��柲"�hþ��e]}\_C/��`Ɂ��=S����qb�$��w~����i ҅i�`����UôHcT����
�ϥ�l����-       h   I  x��U�r�6��)v�I��ȤH���LǵKYN#%�fI�)� �  c��(=�)�b]�I�$�=9Xp���b�\M߬a�\�C�J����V�����<,M]Xa0u��YX.� �Z-P��^�Ƅ/{l�M-˰��XQ�9/���.��h+��cK}����h�v��g��[aqw�+	��4�#��Ă�p�8�с75Z��ZP!Z���lQkX��Z
���L*���W�TkT��I6�V+�nB�RPs�&؎Ռ�>�mg�����t����6�A5��Puh�q"��2�Uk�o	�]p����6�V����S�61��-Y�'\o	�B��`�z߸_Ӵm�A�|�ײ&!11�Jî	��t��y�~��<�'gh;R=�i~��ڌ7��7�Ir�T����WM��pM�jɟ���l>]��,9ϗ
f�6!���ε'%9d)��O]��xECX�����d�-��%i�I����(�ƫ����|@+��vԇ��������ɤ�Z�UR�:5VV����Td�D�BdQfY~ȟ�|"FB\�Ѹxq�Ys��Θ��s���&�w\5韏ŋ��~V���ͅZ���Q��Os�K�dǽ�/t�G2R0�oY��v��㖩+[b熧\N��u�	��y�C�&�mJc�%%�|ZG��q�� =(Ҿpf,�:�8U����e�2e�,���x��?��A��k,]ʛ�}���xbGv�;q��Ο��Ӗ$1`Z@8E�7�d����s�!�R�XRINz����g��/���#X�������Z��#�3�%���~�Va���┅'�M��b'������/%^ �a�;;�Z���      i   ^   x���v
Q���W((M��L�S
H�,VR�P�L�3u���s��R�4�}B]�4u��R�R�JSs�5��<�4�h�s~P8l p�)�      k   �  x�Ֆ�n�0E����7N����gܕ���S'5�H��D��D����QN����X�������H�l
<�w�p�͗0yX~�mx�*�И�܂��7��ߟ.��YYʼ��8X̔�8�1�S���3u���V=�W�jk�8��F8o��V��_����U�4l�*�x�2�y	�;Cpg6�ayNҶ\�W���%��-&����|��⤩�3/+l^|<��?Ή5�ȐV0_pg	�Kz%,�8:y��q�x��Z۝q�6�Wڴ[
O҉��j�U�=,|ȕ91��`�\=k�۠_���Lɓ����$�T�v�T+�P��T�MU=_���>Y�lכ�s@i��ɻn�U9�y +�3��7q��(̱p��x]��.�A8���
��I:��8oȪ(Wv"	q$"J�u�~�J��`�b�{�D*cK�n�5n��t���]�/%l��Z����x��آā�`���^�d�,������pOa����f/��.&��&�5���أ�BJ��h�{W�7[ɡw%i�:d��e��s�e���P��ڼ'}��ۮב��H�3:�>���t1�`ş�����񙴺k��vp�m��%"r�RC*,-����N�����^�d�b�L�b��[�ǎ\R���[��Z�UXT�nF{9Ӄ%�˺�Ŏw-�.��g���?#���      l      x���QK�0��~���m0��_&�B@���W��Y�$�������On�X��?.?�D���&�╹�ԪZ�7�Js6���%�;�	��є^R�B�2�_a���/����!۳y�d�BjyR��+v`�Ԕ��E
%����ۆF�*4]�vq����k�qm�=����'���_�݄�͹�|�/3,�nC�n�4N��L��O����؃��\�a�W:o�	���49DЪߩ���~�H�N�_T���      n   (  x���Mn�@��9� ����b;��iSt����h���/�haw)z�����7$g��M�O�X?m�g��<Rl^Ƒ��8�����{��?hp������e_�;�>�`�0V�[ڃ@F4��|�p!d�2�=E?�R	v\�8"0������+���������s5��6'��E�M�)�C�6%�Vk}}�8�r�ޜK�S^���Ԁ��x���#f+��0����w.`ƒ�~��-V�)����Oڮ�hYcL~g��ぱa5���'��&�7���~J��mH���׮yYj)]M��}r6Q�ª����a�`�yۺO�#����&?��3��L8U�6�i�VT�JS��-Pz�b�������Hn��0.�rN�n|�Z����*/C��+�sʥ�x��=�ewՐ�e�D����B�6@����ᓝ�d�9V���,�i8GX�Ps��)k+k/�v4�]�K&�W->z���b���ż[�«�"Je:�<�<s�6�7��(v���b��I�C�����)�%��]]����3      o   �  x���Kn�@��>�� ����!ˆ�6E7��-F#2���g��:J7E��,g@̇��������괇��b��R���
���y8��+P�[N�Mq�g�ewӓ�ꀮ�>�t�������d3�t%8�%g�Zu�7,)t ���a2w�!����j*�[L�듂�y��SK�M�=���e�C�k�6o���T`�.d��"�,y��W���;~7cV��
������,f��)�8��Y�z��������!yZ�X�lanU|�>:�i`G���1�O����,%�����ĠnڞMȂ(�c(1��Ӓ?c�����������Ô�S�%k;!��3������=7[ʻ ���d����yDa�pLΕ��r(]���+�m
����0���րGG�N��/4��_�=j�      p   �  x���M��@�����3�(Ȋ_�L�lF�]�+nw��6��U����V�d�b��Z_U�z����n���|�_ñ=ξ$r�e�%�^�����'H�Y{Č�&��<X~��ࡿ{�]@W���?�%Y&'�ǯ����w�N[)�Ɏ���XK�����:g�u�1�WB]��Zrz�d���LK��Fq�R]��?^^Q� g��0m�Y���c�ӡ�6��LS�#t�*�*}�<��_�'y�r�RJ�0�߆B�7���*�����T��O��2�aC#�������7l�(�R�+��j8OΉc�&�X��3�hF�i��F�׻>`�Xu?Ko����Ǭ�rg���K���tև����%{��1&r-Un��\�A��\���!,Ē�>N�w#�0r|қe��ÿ�Ϭ����*�t��e`�6��B�m����g�u#�][��l�	����B7���w��z������ѹ���z�U�݆{��E���      q   �  x��Z�r�8}�W��Je�6"xu٭Ԕ|���/cy=�}aA$$� �(3���c� %K�({fg����,�������t���w��{}��ـ��9��JKA����Z�E�>���TP%�թ�RE7�R��n)���S���ޜGWD1C8ܰ����=tz�:�>�K�@}C���G��*��(%���������S���3=�BSt���D�$dl�T�cm��l#d,�QGP�S�f�'Đ�����.�]X�)�ɣF�E'
���l���ov����+:c�I�91T�c�]��ڜ%f\K�\`�wݟ��'��=�n���
[~�ǻnuh��Qt'G��3ޝ�����S0 P'����5:��}�U
�8����\Ni��
� C�\."�r�T� \ 	06 H7�F�@ޏ�B7	��~ ��L��0]-4�@ǭ`�ٔK��0�$G��wd8��&�KG�Et�ٌQ��E�bLNTStB�}��W]+pi�)���d?��F�`B�5��[1S1��'��~�  ��D���-%B�ֵ�-���}�-��`2�����r�@d�8�xĊ��O��,>�ݏ�O$3�}Q��+S%�,6�eL����E�������<*"9Ҍ�@��CLՔy-��`m�׌�����6�$�	]PK�|P3�M�X<��ht��EI^K4��ҜZ#���!"4f]�9�4�����U��E(��((���`��A�x��zQ,g�ZV�����K��s�=P��bMܽ���<P1�p��?�������o%�[�:�k�܉�
��`e@%�E*��Jċ�z`�RC����[�v��bL Mt
��b����'ò�����bQ��r�As�D��8Q��$89�zl@�Y��������Ⱦ��ܺ�A=ª�"�m��J�0(��`Q{��vE������8����J�-����(_)�W��ȞJ�T���M��y^3\�bxs��,I�٩:�NeLѮ�i���~���x�;O�b�V���=�tTs�a�A�A��4�VRO7q�V�	�ԭ�A9gF�g0�̺�9���墹#H@���|��Xz�m�$����~SG�vP,�,��oM"	�j�z�@8�*˾�M_P��Y��\�麡[yV �Bȕ��[��0��E�~��h��Hf�����X5�W-O�}���:�N�9sV�.���#7��T���_7T1�7J*h�2T�� N8q��g�Q�}�h35���T1{���;�>Ȕ)�i�&�M16�p�z��a;�ԅ2ԓ��k A[�h�F��v�w��n:w'���'?�g��������,�?ᖘO�НW��-���n�o����|�z��%:o/|��
�UgДqt¥Гū�4MF�4n��1:n���� ��"�Dԏ�)$��:��A�����I��m���[� ���<��M嫣3�+�Gg�^�ux�����Ɇt�9�z&�sM�Xt5�b�	�A��� &�BW���u^#�M����l�_��{�h5e�q��tE��Z���Ⱥ�O�
[������.J(JV�U������e���<�:�����ڟ��N�	"�P��Go���s���T�d��� �W*���>�莈d&���t�h
�4]��2���&CȎ�u����qh�_S��%[����%��M�~��TY��� �����at�ti#���=��z�z8�MW�_��Ag�.&rV2A�n�W�-���A�`�ee��=I�-UiE�&6d�2]r�/�=�`��K�dl��Bc�s�5��Vf�Η�5#�ό����>����LR�H	W߮��Έ��=����Př_�oX�a����J�Ǣ�\�Vk���WC�u�����q<��j��#&Ӎ�1�g9/�#��������T�����
�_Pi��a1� !���*�U���2�NeM�sU:������4T�z�I�)�%۶�L�ш�8�����N      r   `  x�Ŕ�N�@��<Ť Qz�$[�H�2�C���1�-�O�^0�x�r��L��?��0��9��ޫ)�+oJڐ��<hy�ʆ%+|%�l8�*�`�����|�{mX܍�1��sV;���4�2LYSi�n�Ӿmqs�0I��������=]%=T�t���9T�^�K��P��M݊G"�Yb	�����q8���-6F-B!��;f��f6o���[����G��rLʵ�#�E�$cN�7����8����.��zِdQx��O�.�dhC�_d����<%k`x���'�P���XJ ���E����O��y�5n��4�9� 34IN����gK�S      s   
   x���          t   �   x���1
�0 �=��ti��Puq����V�&m�i���z{���=�t}�@�����zWY�M27��ɠ4��J�N}����c^���y���$� ������b��j�f�&8��.��a٠0$&�+"��y����K��u.ɦ      u   �  x��W���8��W�L�{*��;�l1�ΝV8	Y�JV��o�=���XI�I�]���)1)Y��#�\�o�`�z���X6/o����-V�m-n`�lqKN���hw��[<�Ǘ��ݮ���:u�D�^��5����d~�Zr�qY��đ,��0��~���rVd�d��n&���g���l��=�����7�K�9=R �%���ޞ�z7Ys{B'pH��'o�����g$���
���<AV<3}O�PbXA'�wHzI*Ar����L
���ÿ� sA�F+ԯ���(H���$%��/�%ꋑ�!�$E� )�G��(I�T���c/��"�⍐��J����sr�C��ԇ�gӳ�X��#�eA�x�O����ayU��I�D��B/Z�����ǉT���Z"y|�(�(��)��(b)�]�����Т��m�b�$��R�,��z��xtJ�ώK݆)���+�ZJx	���R�,+��y'�l�wR�*v�wT�3��Ď�rS�&�%5��e[��{�����D�Em�W(	轄y(U�Yý�)��%�U��X�r��c���j�� (	�a�ȏ�T�R�h{R���A���=� �|�Z�����naE�0.����,�MT�W��q#D�ı��q�;;���a�v+��В�w��[���W$Mo��5P�K?�"��I[���I��	I��N��u��3k���k�ά�8�2̋q��*�z._�tYY��0�<R��-��?��9��A%T�~�O����:��?�t����y��S}���;��a�i�H��b^�i�lY�ͼ��m:|��y'�9�1�.��۝|��(Q��IGC�c��I:�X]Q�kt���F��v"�7�SAn��&;�2�lp���{9F��'C�����y�b� 7�Ʃ��V�}B��t,(�'C������*      v   <  x�͗K�1����Ći�d5@�  (���i����&��d�\,nHPҐ�Ɔ][j�s��*��Yw:�~6��/��_5'l��p��>NH,�D�;��\�T��#�+6�[X��wgpӚ�X`\(���5�[x�I�b��P������F?:zA�sU`��>��	�j��$f�Ш��6�4�N�%\�`�R}܋S�
�_������K�t䓸�6�����9z$�r6]	<E�����P4Y�����y(�-�ݷ��://�r�z�E�sgMN~�"haJNvϹS�)�]���;���s8��|,,#o�霬kȵ�Č}�G%�ě�u<AY����Fihk6v�t�DBZ�'��S�ݪ_d�~��G�����*�O�嫍*\��y�`�����O˧��6������QH/�H��/g�K��Q)1�_��H_N�	f�΅�%��}�R����:$f#��A�`��0��f�Z��غV�@�א�Տ��E���Я	:X�U��Pm8?��	K�MM�<:E����}��z�"��j��JE�e��siĶqdƞ����b5C��t�\�      w   |   x���v
Q���W((M��L�S
J�IL���KL��H-RR�P�w�,��Q�Q 2�b��J�
a�>���
���E)
�%�E��:
�!�y�P��5�'lp�,)���_�����W��2�� �P:�      x   
   x���          y   
   x���          z     x����N�@�;O1�B�mb4�Pi(@�͖`2��Ƨjz�.�ٹ�_��8ͣ��8-^�4;*���Ѕ�[~G���Ȱ&6�3T��<�^u��(���W2bg�h^��L��������-�	Ս�����R�UG_��Ή���Hf��lgI����P��!��ET��:��Y+!�=���e��P�`�=�)v{;E�#cdl�?���y��b��F�=73GIɐ��^�*A�#u�ZB�Oxb=�I�a8�<��W      {   �   x���v
Q���W((M��L�S
.-N.�,H���SR�P�tQ�QP
I,�LK�\R� �̂|%M�0G�P�`CS=KKu���u�i��Im��t,!V��f��#1ia�����	�ư�u(E�Lt�ƻ����h�=\\ (�{.      |   �   x���M�@໿b��*h�ά_t�0� ͫ�JQ!��	A�c��;���a6N�h��8�v���m��Y�]�gəɓbll����H�SߵuY�MS��"on�b�j{�Rf�0�=W#(%��#l�Q�L�t��(WXK#�9�HA���y`E�v=?ո1 L`�3���x��y�ڑ��<06Ͱ�_`$l��l/�t      }   �  x�ݔMo�@���
�EM���^�jK����e�X�f���2TkY��"!��]2��]����X��XEi�-sWTL%�4�2cIj�s.�R�B��@f��fG��I,A?	���K0W��D�Y��*�J��Ln�:����"Q�7+C�m��-7ƠIU�2fy"�������#�O��hVA=6�AD��c�"��p��'��ؔ`��Hc<|��7����TDvL���z��M!l���*�N`�Gc������##ح���/WXOEQZg�%���M�D=�).A���*�O'|�g	�m ���뾀^ھ��/�_�N��nȻ=������:�����ޛl��m���=�	�՝�0jCpt��k�kD���ܿ�C��	����      ~   �  x��TQ��0��S���]i����Z(jJ��&�uc{������#�b�	���3v����ͬ6�b���fWBk��7��6��~��~KaV�>e}��{�=��XYTp?_Xm�ɰ��e��f�6������D8� �2�v���n5�>�sP5'�U�hς��|�|�"@lt�'E_��1�7��
��ٞ��(���+�rXs�a��@σ�y'�KlH �䣠O��'��݉eR"e�J�	��
��WY�O�$�-T��ϛ"�+ia�T�A�Ě�� �J�?��<�U�#�%Kd�OR�B�&��;�ی�Q�c��<��L��:��?<t�H�s>�D�^Y�m��v	�E��r�)�з}T֤([�E�#�����ӑ�ɍ[��P6{�تM`�[܍;��v1�o�]2r��4Y�MLf��*A�S�D��u�a;��dl!����JWO�cCu��/���(��/�{�,8-v�r����ܦ����H����oh/�>     