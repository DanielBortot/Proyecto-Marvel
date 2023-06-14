PGDMP     ;    !                {            Proyecto    15.2    15.2 �    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    18608    Proyecto    DATABASE     �   CREATE DATABASE "Proyecto" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Venezuela.1252';
    DROP DATABASE "Proyecto";
                postgres    false                       1255    19184    archienemigo()    FUNCTION     ;  CREATE FUNCTION public.archienemigo() RETURNS trigger
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
       public          postgres    false                       1255    19188 
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
       public          postgres    false                       1255    19195    ganancia_perdida()    FUNCTION     �   CREATE FUNCTION public.ganancia_perdida() RETURNS trigger
    LANGUAGE plpgsql
    AS $$begin

if new."Ganancia" < new."Coste" then
	raise exception 'Las perdidas de la pelicula son mayores a sus ganancias';
end if;
return new;
end;
$$;
 )   DROP FUNCTION public.ganancia_perdida();
       public          postgres    false                       1255    19186    genero()    FUNCTION     4  CREATE FUNCTION public.genero() RETURNS trigger
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
       public          postgres    false                       1255    19181    numcalificacion()    FUNCTION       CREATE FUNCTION public.numcalificacion() RETURNS trigger
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
       public          postgres    false                       1255    19175 	   numperf()    FUNCTION     3  CREATE FUNCTION public.numperf() RETURNS trigger
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
       public          postgres    false                       1255    19179    numrating()    FUNCTION     �   CREATE FUNCTION public.numrating() RETURNS trigger
    LANGUAGE plpgsql
    AS $$BEGIN

IF new."Rating" < 1 OR new."Rating" > 5 THEN
	RAISE EXCEPTION 'El rating debe ser un numero entre 1 y 5';
END IF;

RETURN NEW;
END;
$$;
 "   DROP FUNCTION public.numrating();
       public          postgres    false                       1255    19197    numusuarios()    FUNCTION     Y  CREATE FUNCTION public.numusuarios() RETURNS trigger
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
       public          postgres    false                       1255    19191    rolpersonaje()    FUNCTION     6  CREATE FUNCTION public.rolpersonaje() RETURNS trigger
    LANGUAGE plpgsql
    AS $$begin

if new."Rol" != 'Antagonista' AND new."Rol" != 'Protagonista' AND new."Rol" != 'Secundario' then
	raise exception 'Un personaje solo puede ser "Protagonista", "Antagonista" o "Secundario"';
end if;
return new;
end;
$$;
 %   DROP FUNCTION public.rolpersonaje();
       public          postgres    false                       1255    19193    tipoactor()    FUNCTION       CREATE FUNCTION public.tipoactor() RETURNS trigger
    LANGUAGE plpgsql
    AS $$begin

if new."Tipo_Actor" != 'Interpreta' AND new."Tipo_Actor" != 'Presta su voz' then
	raise exception 'Un actor solo puede Interpretar un personaje o Prestar su Voz';
end if;
return new;
end;
$$;
 "   DROP FUNCTION public.tipoactor();
       public          postgres    false                       1255    19200    tiposuscripciones()    FUNCTION     �  CREATE FUNCTION public.tiposuscripciones() RETURNS trigger
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
       public          postgres    false            �            1259    18609    Aparece    TABLE     '  CREATE TABLE public."Aparece" (
    "N_Organizacion" text NOT NULL,
    "N_Titulo" text NOT NULL,
    "Estado" text NOT NULL,
    "Rol" text NOT NULL,
    CONSTRAINT "Aparece_Rol_check" CHECK ((("Rol" = 'Antagonista'::text) OR ("Rol" = 'Protagonista'::text) OR ("Rol" = 'Secundario'::text)))
);
    DROP TABLE public."Aparece";
       public         heap    postgres    false            �            1259    18615    Cargo    TABLE     c   CREATE TABLE public."Cargo" (
    "Cod_Cargo" integer NOT NULL,
    "Descripcion" text NOT NULL
);
    DROP TABLE public."Cargo";
       public         heap    postgres    false            �            1259    18620    Cargo_Cod_Cargo_seq    SEQUENCE     �   CREATE SEQUENCE public."Cargo_Cod_Cargo_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public."Cargo_Cod_Cargo_seq";
       public          postgres    false    215            �           0    0    Cargo_Cod_Cargo_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public."Cargo_Cod_Cargo_seq" OWNED BY public."Cargo"."Cod_Cargo";
          public          postgres    false    216            �            1259    18621    Ciudad    TABLE     �   CREATE TABLE public."Ciudad" (
    "Id_Ciudad" integer NOT NULL,
    "Nombre" text NOT NULL,
    "Id_Estado" integer NOT NULL
);
    DROP TABLE public."Ciudad";
       public         heap    postgres    false            �            1259    18626    Ciudad_Id_Ciudad_seq    SEQUENCE     �   CREATE SEQUENCE public."Ciudad_Id_Ciudad_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public."Ciudad_Id_Ciudad_seq";
       public          postgres    false    217            �           0    0    Ciudad_Id_Ciudad_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public."Ciudad_Id_Ciudad_seq" OWNED BY public."Ciudad"."Id_Ciudad";
          public          postgres    false    218            �            1259    18627    Civil    TABLE     =   CREATE TABLE public."Civil" (
    "N_Civil" text NOT NULL
);
    DROP TABLE public."Civil";
       public         heap    postgres    false            �            1259    18632    Combate    TABLE     �   CREATE TABLE public."Combate" (
    "N_Personaje" text NOT NULL,
    "N_Poder" text NOT NULL,
    "N_Objeto" text NOT NULL,
    "Lugar" text NOT NULL,
    "Fecha" date NOT NULL
);
    DROP TABLE public."Combate";
       public         heap    postgres    false            �            1259    18637    Crea    TABLE     ^   CREATE TABLE public."Crea" (
    "N_Personaje" text NOT NULL,
    "N_Objeto" text NOT NULL
);
    DROP TABLE public."Crea";
       public         heap    postgres    false            �            1259    18642    Creador    TABLE     C   CREATE TABLE public."Creador" (
    "Nom_Creador" text NOT NULL
);
    DROP TABLE public."Creador";
       public         heap    postgres    false            �            1259    18647    Enfrenta    TABLE     _   CREATE TABLE public."Enfrenta" (
    "N_Heroe" text NOT NULL,
    "N_Villano" text NOT NULL
);
    DROP TABLE public."Enfrenta";
       public         heap    postgres    false            �            1259    18652    Esta    TABLE     �  CREATE TABLE public."Esta" (
    "N_Personaje" text NOT NULL,
    "N_Titulo" text NOT NULL,
    "Tipo_Actor" text NOT NULL,
    "Rol" text NOT NULL,
    "Actor" text NOT NULL,
    CONSTRAINT "Esta_Rol_check" CHECK ((("Rol" = 'Antagonista'::text) OR ("Rol" = 'Protagonista'::text) OR ("Rol" = 'Secundario'::text))),
    CONSTRAINT "Esta_Tipo_Actor_check" CHECK ((("Tipo_Actor" = 'Interpretado'::text) OR ("Tipo_Actor" = 'Presta su voz'::text)))
);
    DROP TABLE public."Esta";
       public         heap    postgres    false            �            1259    18659    Estado    TABLE        CREATE TABLE public."Estado" (
    "Id_Estado" integer NOT NULL,
    "Nombre" text NOT NULL,
    "Id_Pais" integer NOT NULL
);
    DROP TABLE public."Estado";
       public         heap    postgres    false            �            1259    18664    Estado_Id_Estado_seq    SEQUENCE     �   CREATE SEQUENCE public."Estado_Id_Estado_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public."Estado_Id_Estado_seq";
       public          postgres    false    225            �           0    0    Estado_Id_Estado_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public."Estado_Id_Estado_seq" OWNED BY public."Estado"."Id_Estado";
          public          postgres    false    226            �            1259    18665    Heroe    TABLE     6  CREATE TABLE public."Heroe" (
    "N_Heroe" text NOT NULL,
    "Alias" text NOT NULL,
    "Logotipo" text,
    "Color_Traje" text,
    "Archienemigo" text,
    CONSTRAINT "Heroe_Color_Traje_check" CHECK ((("Color_Traje" !~~ '%0%'::text) AND ("Color_Traje" !~~ '%1%'::text) AND ("Color_Traje" !~~ '%2%'::text) AND ("Color_Traje" !~~ '%3%'::text) AND ("Color_Traje" !~~ '%4%'::text) AND ("Color_Traje" !~~ '%5%'::text) AND ("Color_Traje" !~~ '%6%'::text) AND ("Color_Traje" !~~ '%7%'::text) AND ("Color_Traje" !~~ '%8%'::text) AND ("Color_Traje" !~~ '%9%'::text)))
);
    DROP TABLE public."Heroe";
       public         heap    postgres    false            �            1259    18671 	   Historial    TABLE     1  CREATE TABLE public."Historial" (
    "N_Titulo" text NOT NULL,
    "Id_Perfil" integer NOT NULL,
    "Calificacion" integer NOT NULL,
    "Hora_Inicio" date NOT NULL,
    "Hora_Fin" date NOT NULL,
    CONSTRAINT "Historial_Calificacion_check" CHECK ((("Calificacion" >= 1) AND ("Calificacion" <= 5)))
);
    DROP TABLE public."Historial";
       public         heap    postgres    false            �            1259    18677    Juego    TABLE     y   CREATE TABLE public."Juego" (
    "T_Juego" text NOT NULL,
    "Distribuidor" text NOT NULL,
    "Tipo" text NOT NULL
);
    DROP TABLE public."Juego";
       public         heap    postgres    false            �            1259    18682    Medio    TABLE     )  CREATE TABLE public."Medio" (
    "Titulo" text NOT NULL,
    "Fecha_Estreno" date NOT NULL,
    "Compania" text NOT NULL,
    "Rating" integer NOT NULL,
    "Sinopsis" text NOT NULL,
    "Imagen" text NOT NULL,
    CONSTRAINT "Medio_Rating_check" CHECK ((("Rating" >= 1) AND ("Rating" <= 5)))
);
    DROP TABLE public."Medio";
       public         heap    postgres    false            �            1259    18688    Nacionalidad    TABLE     @   CREATE TABLE public."Nacionalidad" (
    "Nac" text NOT NULL
);
 "   DROP TABLE public."Nacionalidad";
       public         heap    postgres    false            �            1259    18693    Objeto    TABLE     �   CREATE TABLE public."Objeto" (
    "Nombre" text NOT NULL,
    "Descripcion" text,
    "Material" text,
    "Tipo" text NOT NULL,
    "Imagen" text NOT NULL,
    "N_Personaje" text
);
    DROP TABLE public."Objeto";
       public         heap    postgres    false            �            1259    18698 	   Ocupacion    TABLE     >   CREATE TABLE public."Ocupacion" (
    "Ocup" text NOT NULL
);
    DROP TABLE public."Ocupacion";
       public         heap    postgres    false            �            1259    18703    Organizacion    TABLE       CREATE TABLE public."Organizacion" (
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
       public         heap    postgres    false            �            1259    18708    Pais    TABLE     [   CREATE TABLE public."Pais" (
    "Id_Pais" integer NOT NULL,
    "Nombre" text NOT NULL
);
    DROP TABLE public."Pais";
       public         heap    postgres    false            �            1259    18713    Pais_Id_Pais_seq    SEQUENCE     �   CREATE SEQUENCE public."Pais_Id_Pais_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public."Pais_Id_Pais_seq";
       public          postgres    false    235            �           0    0    Pais_Id_Pais_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public."Pais_Id_Pais_seq" OWNED BY public."Pais"."Id_Pais";
          public          postgres    false    236            �            1259    18714    Pelicula    TABLE     �  CREATE TABLE public."Pelicula" (
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
       public         heap    postgres    false            �            1259    18722    Perfil    TABLE       CREATE TABLE public."Perfil" (
    "Id_Perfil" integer NOT NULL,
    "Dispositivo" text NOT NULL,
    "Nombre" text NOT NULL,
    "Idioma" text NOT NULL,
    "Email" text NOT NULL,
    "Imagen" text NOT NULL,
    CONSTRAINT "Perfil_Id_Perfil_check" CHECK (("Id_Perfil" >= 0))
);
    DROP TABLE public."Perfil";
       public         heap    postgres    false            �            1259    18728    Perfil_Id_Perfil_seq    SEQUENCE     �   CREATE SEQUENCE public."Perfil_Id_Perfil_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public."Perfil_Id_Perfil_seq";
       public          postgres    false    238            �           0    0    Perfil_Id_Perfil_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public."Perfil_Id_Perfil_seq" OWNED BY public."Perfil"."Id_Perfil";
          public          postgres    false    239            �            1259    18729    Pers_Creador    TABLE     g   CREATE TABLE public."Pers_Creador" (
    "N_Personaje" text NOT NULL,
    "N_Creador" text NOT NULL
);
 "   DROP TABLE public."Pers_Creador";
       public         heap    postgres    false            �            1259    18734    Pers_Nac    TABLE     f   CREATE TABLE public."Pers_Nac" (
    "N_Personaje" text NOT NULL,
    "Nacionalidad" text NOT NULL
);
    DROP TABLE public."Pers_Nac";
       public         heap    postgres    false            �            1259    18739    Pers_Oc    TABLE     b   CREATE TABLE public."Pers_Oc" (
    "N_Personaje" text NOT NULL,
    "Ocupacion" text NOT NULL
);
    DROP TABLE public."Pers_Oc";
       public         heap    postgres    false            �            1259    18744 	   Personaje    TABLE     X  CREATE TABLE public."Personaje" (
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
       public         heap    postgres    false            �            1259    18753 	   Pertenece    TABLE     �   CREATE TABLE public."Pertenece" (
    "N_Personaje" text NOT NULL,
    "N_Organizacion" text NOT NULL,
    "Cod_Cargo" integer NOT NULL
);
    DROP TABLE public."Pertenece";
       public         heap    postgres    false            �            1259    18758 
   Plat_Juego    TABLE     b   CREATE TABLE public."Plat_Juego" (
    "T_Juego" text NOT NULL,
    "Plataforma" text NOT NULL
);
     DROP TABLE public."Plat_Juego";
       public         heap    postgres    false            �            1259    18763 
   Plataforma    TABLE     ?   CREATE TABLE public."Plataforma" (
    nombre text NOT NULL
);
     DROP TABLE public."Plataforma";
       public         heap    postgres    false            �            1259    18768    Poder    TABLE     p   CREATE TABLE public."Poder" (
    "Nombre" text NOT NULL,
    "Imagen" text NOT NULL,
    "Descripcion" text
);
    DROP TABLE public."Poder";
       public         heap    postgres    false            �            1259    18773    Posee    TABLE       CREATE TABLE public."Posee" (
    "N_Personaje" text NOT NULL,
    "N_Poder" text NOT NULL,
    "Obtencion" text NOT NULL,
    CONSTRAINT "Posee_Obtencion_check" CHECK ((("Obtencion" = 'Natural'::text) OR ("Obtencion" = 'Artificial'::text) OR ("Obtencion" = 'Hereditario'::text)))
);
    DROP TABLE public."Posee";
       public         heap    postgres    false            �            1259    18779    RelacionadoHer    TABLE     c   CREATE TABLE public."RelacionadoHer" (
    "N_Civil" text NOT NULL,
    "N_Heroe" text NOT NULL
);
 $   DROP TABLE public."RelacionadoHer";
       public         heap    postgres    false            �            1259    18784    RelacionadoVill    TABLE     f   CREATE TABLE public."RelacionadoVill" (
    "N_Civil" text NOT NULL,
    "N_Villano" text NOT NULL
);
 %   DROP TABLE public."RelacionadoVill";
       public         heap    postgres    false            �            1259    18789    Sede    TABLE     �   CREATE TABLE public."Sede" (
    "Nombre" text NOT NULL,
    "Tipo_Edif" text,
    "Ubicacion" text NOT NULL,
    "Imagen" text NOT NULL,
    "N_Org" text NOT NULL
);
    DROP TABLE public."Sede";
       public         heap    postgres    false            �            1259    18794    Serie    TABLE     �   CREATE TABLE public."Serie" (
    "T_Serie" text NOT NULL,
    "N_Episodios" integer NOT NULL,
    "Creador" text NOT NULL,
    "Canal" text NOT NULL
);
    DROP TABLE public."Serie";
       public         heap    postgres    false            �            1259    18799    Suscripcion    TABLE     �  CREATE TABLE public."Suscripcion" (
    "ID" integer NOT NULL,
    "Tarifa" real NOT NULL,
    "Descripcion" text NOT NULL,
    "Tipo" text NOT NULL,
    CONSTRAINT "Suscripcion_Tarifa_check" CHECK (("Tarifa" >= (0)::double precision)),
    CONSTRAINT "Suscripcion_Tipo_check" CHECK ((("Tipo" = 'Gold'::text) OR ("Tipo" = 'Vip'::text) OR ("Tipo" = 'Premium'::text) OR ("Tipo" = 'Free'::text)))
);
 !   DROP TABLE public."Suscripcion";
       public         heap    postgres    false            �            1259    18806    Tarjeta    TABLE     F  CREATE TABLE public."Tarjeta" (
    "N_Tarjeta" text NOT NULL,
    "Cod_Seguridad" integer NOT NULL,
    "Fecha_Ven" date NOT NULL,
    CONSTRAINT "Tarjeta_Cod_Seguridad_check" CHECK ((("Cod_Seguridad" >= 100) AND ("Cod_Seguridad" <= 999))),
    CONSTRAINT "Tarjeta_N_Tarjeta_check" CHECK ((char_length("N_Tarjeta") = 16))
);
    DROP TABLE public."Tarjeta";
       public         heap    postgres    false            �            1259    18813    Usuario    TABLE     �  CREATE TABLE public."Usuario" (
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
       public         heap    postgres    false                        1259    18819    Villano    TABLE     q   CREATE TABLE public."Villano" (
    "N_Villano" text NOT NULL,
    "Alias" text NOT NULL,
    "Objetivo" text
);
    DROP TABLE public."Villano";
       public         heap    postgres    false                       2604    18824    Cargo Cod_Cargo    DEFAULT     x   ALTER TABLE ONLY public."Cargo" ALTER COLUMN "Cod_Cargo" SET DEFAULT nextval('public."Cargo_Cod_Cargo_seq"'::regclass);
 B   ALTER TABLE public."Cargo" ALTER COLUMN "Cod_Cargo" DROP DEFAULT;
       public          postgres    false    216    215            	           2604    18825    Ciudad Id_Ciudad    DEFAULT     z   ALTER TABLE ONLY public."Ciudad" ALTER COLUMN "Id_Ciudad" SET DEFAULT nextval('public."Ciudad_Id_Ciudad_seq"'::regclass);
 C   ALTER TABLE public."Ciudad" ALTER COLUMN "Id_Ciudad" DROP DEFAULT;
       public          postgres    false    218    217            
           2604    18826    Estado Id_Estado    DEFAULT     z   ALTER TABLE ONLY public."Estado" ALTER COLUMN "Id_Estado" SET DEFAULT nextval('public."Estado_Id_Estado_seq"'::regclass);
 C   ALTER TABLE public."Estado" ALTER COLUMN "Id_Estado" DROP DEFAULT;
       public          postgres    false    226    225                       2604    18827    Pais Id_Pais    DEFAULT     r   ALTER TABLE ONLY public."Pais" ALTER COLUMN "Id_Pais" SET DEFAULT nextval('public."Pais_Id_Pais_seq"'::regclass);
 ?   ALTER TABLE public."Pais" ALTER COLUMN "Id_Pais" DROP DEFAULT;
       public          postgres    false    236    235                       2604    18828    Perfil Id_Perfil    DEFAULT     z   ALTER TABLE ONLY public."Perfil" ALTER COLUMN "Id_Perfil" SET DEFAULT nextval('public."Perfil_Id_Perfil_seq"'::regclass);
 C   ALTER TABLE public."Perfil" ALTER COLUMN "Id_Perfil" DROP DEFAULT;
       public          postgres    false    239    238            T          0    18609    Aparece 
   TABLE DATA           R   COPY public."Aparece" ("N_Organizacion", "N_Titulo", "Estado", "Rol") FROM stdin;
    public          postgres    false    214   H&      U          0    18615    Cargo 
   TABLE DATA           =   COPY public."Cargo" ("Cod_Cargo", "Descripcion") FROM stdin;
    public          postgres    false    215   e&      W          0    18621    Ciudad 
   TABLE DATA           F   COPY public."Ciudad" ("Id_Ciudad", "Nombre", "Id_Estado") FROM stdin;
    public          postgres    false    217   �&      Y          0    18627    Civil 
   TABLE DATA           ,   COPY public."Civil" ("N_Civil") FROM stdin;
    public          postgres    false    219   �&      Z          0    18632    Combate 
   TABLE DATA           [   COPY public."Combate" ("N_Personaje", "N_Poder", "N_Objeto", "Lugar", "Fecha") FROM stdin;
    public          postgres    false    220   �&      [          0    18637    Crea 
   TABLE DATA           ;   COPY public."Crea" ("N_Personaje", "N_Objeto") FROM stdin;
    public          postgres    false    221   '      \          0    18642    Creador 
   TABLE DATA           2   COPY public."Creador" ("Nom_Creador") FROM stdin;
    public          postgres    false    222   8'      ]          0    18647    Enfrenta 
   TABLE DATA           <   COPY public."Enfrenta" ("N_Heroe", "N_Villano") FROM stdin;
    public          postgres    false    223   U'      ^          0    18652    Esta 
   TABLE DATA           Y   COPY public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") FROM stdin;
    public          postgres    false    224   r'      _          0    18659    Estado 
   TABLE DATA           D   COPY public."Estado" ("Id_Estado", "Nombre", "Id_Pais") FROM stdin;
    public          postgres    false    225   �'      a          0    18665    Heroe 
   TABLE DATA           `   COPY public."Heroe" ("N_Heroe", "Alias", "Logotipo", "Color_Traje", "Archienemigo") FROM stdin;
    public          postgres    false    227   �'      b          0    18671 	   Historial 
   TABLE DATA           i   COPY public."Historial" ("N_Titulo", "Id_Perfil", "Calificacion", "Hora_Inicio", "Hora_Fin") FROM stdin;
    public          postgres    false    228   (      c          0    18677    Juego 
   TABLE DATA           D   COPY public."Juego" ("T_Juego", "Distribuidor", "Tipo") FROM stdin;
    public          postgres    false    229    (      d          0    18682    Medio 
   TABLE DATA           h   COPY public."Medio" ("Titulo", "Fecha_Estreno", "Compania", "Rating", "Sinopsis", "Imagen") FROM stdin;
    public          postgres    false    230   =(      e          0    18688    Nacionalidad 
   TABLE DATA           /   COPY public."Nacionalidad" ("Nac") FROM stdin;
    public          postgres    false    231   y(      f          0    18693    Objeto 
   TABLE DATA           h   COPY public."Objeto" ("Nombre", "Descripcion", "Material", "Tipo", "Imagen", "N_Personaje") FROM stdin;
    public          postgres    false    232   �(      g          0    18698 	   Ocupacion 
   TABLE DATA           -   COPY public."Ocupacion" ("Ocup") FROM stdin;
    public          postgres    false    233   �(      h          0    18703    Organizacion 
   TABLE DATA           �   COPY public."Organizacion" ("Nombre", "Eslogan", "Lider", "Fundador", "Tipo", "Nom_Comic", "Imagen", "Objetivo", "Lugar_Creacion") FROM stdin;
    public          postgres    false    234   �(      i          0    18708    Pais 
   TABLE DATA           5   COPY public."Pais" ("Id_Pais", "Nombre") FROM stdin;
    public          postgres    false    235   �(      k          0    18714    Pelicula 
   TABLE DATA           o   COPY public."Pelicula" ("T_Pelicula", "Director", "Duracion", "Coste", "Ganancia", "Distribuidor") FROM stdin;
    public          postgres    false    237   !)      l          0    18722    Perfil 
   TABLE DATA           e   COPY public."Perfil" ("Id_Perfil", "Dispositivo", "Nombre", "Idioma", "Email", "Imagen") FROM stdin;
    public          postgres    false    238   >)      n          0    18729    Pers_Creador 
   TABLE DATA           D   COPY public."Pers_Creador" ("N_Personaje", "N_Creador") FROM stdin;
    public          postgres    false    240   �O      o          0    18734    Pers_Nac 
   TABLE DATA           C   COPY public."Pers_Nac" ("N_Personaje", "Nacionalidad") FROM stdin;
    public          postgres    false    241   �O      p          0    18739    Pers_Oc 
   TABLE DATA           ?   COPY public."Pers_Oc" ("N_Personaje", "Ocupacion") FROM stdin;
    public          postgres    false    242   �O      q          0    18744 	   Personaje 
   TABLE DATA           w   COPY public."Personaje" ("Nombre", "Genero", "Color_Ojos", "Color_Pelo", "Nom_Comic", "E_Marital", imagen) FROM stdin;
    public          postgres    false    243   �O      r          0    18753 	   Pertenece 
   TABLE DATA           S   COPY public."Pertenece" ("N_Personaje", "N_Organizacion", "Cod_Cargo") FROM stdin;
    public          postgres    false    244   �O      s          0    18758 
   Plat_Juego 
   TABLE DATA           ?   COPY public."Plat_Juego" ("T_Juego", "Plataforma") FROM stdin;
    public          postgres    false    245   P      t          0    18763 
   Plataforma 
   TABLE DATA           .   COPY public."Plataforma" (nombre) FROM stdin;
    public          postgres    false    246   4P      u          0    18768    Poder 
   TABLE DATA           D   COPY public."Poder" ("Nombre", "Imagen", "Descripcion") FROM stdin;
    public          postgres    false    247   QP      v          0    18773    Posee 
   TABLE DATA           H   COPY public."Posee" ("N_Personaje", "N_Poder", "Obtencion") FROM stdin;
    public          postgres    false    248   nP      w          0    18779    RelacionadoHer 
   TABLE DATA           @   COPY public."RelacionadoHer" ("N_Civil", "N_Heroe") FROM stdin;
    public          postgres    false    249   �P      x          0    18784    RelacionadoVill 
   TABLE DATA           C   COPY public."RelacionadoVill" ("N_Civil", "N_Villano") FROM stdin;
    public          postgres    false    250   �P      y          0    18789    Sede 
   TABLE DATA           W   COPY public."Sede" ("Nombre", "Tipo_Edif", "Ubicacion", "Imagen", "N_Org") FROM stdin;
    public          postgres    false    251   �P      z          0    18794    Serie 
   TABLE DATA           O   COPY public."Serie" ("T_Serie", "N_Episodios", "Creador", "Canal") FROM stdin;
    public          postgres    false    252   �P      {          0    18799    Suscripcion 
   TABLE DATA           N   COPY public."Suscripcion" ("ID", "Tarifa", "Descripcion", "Tipo") FROM stdin;
    public          postgres    false    253   �P      |          0    18806    Tarjeta 
   TABLE DATA           N   COPY public."Tarjeta" ("N_Tarjeta", "Cod_Seguridad", "Fecha_Ven") FROM stdin;
    public          postgres    false    254   NQ      }          0    18813    Usuario 
   TABLE DATA           �   COPY public."Usuario" ("Email", "Contrasena", "Nombre", "Apellido", "Fecha_Nac", "Fecha_Creacion", "Id_Suscripcion", "N_Tarjeta", "Direccion") FROM stdin;
    public          postgres    false    255   �Q      ~          0    18819    Villano 
   TABLE DATA           E   COPY public."Villano" ("N_Villano", "Alias", "Objetivo") FROM stdin;
    public          postgres    false    256   �R      �           0    0    Cargo_Cod_Cargo_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public."Cargo_Cod_Cargo_seq"', 1, false);
          public          postgres    false    216            �           0    0    Ciudad_Id_Ciudad_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public."Ciudad_Id_Ciudad_seq"', 4, true);
          public          postgres    false    218            �           0    0    Estado_Id_Estado_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public."Estado_Id_Estado_seq"', 3, true);
          public          postgres    false    226            �           0    0    Pais_Id_Pais_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public."Pais_Id_Pais_seq"', 2, true);
          public          postgres    false    236            �           0    0    Perfil_Id_Perfil_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public."Perfil_Id_Perfil_seq"', 33, true);
          public          postgres    false    239            "           2606    18835    Aparece Aparece_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public."Aparece"
    ADD CONSTRAINT "Aparece_pkey" PRIMARY KEY ("N_Organizacion", "N_Titulo");
 B   ALTER TABLE ONLY public."Aparece" DROP CONSTRAINT "Aparece_pkey";
       public            postgres    false    214    214            $           2606    18837    Cargo Cargo_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public."Cargo"
    ADD CONSTRAINT "Cargo_pkey" PRIMARY KEY ("Cod_Cargo");
 >   ALTER TABLE ONLY public."Cargo" DROP CONSTRAINT "Cargo_pkey";
       public            postgres    false    215            &           2606    18839    Ciudad Ciudad_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public."Ciudad"
    ADD CONSTRAINT "Ciudad_pkey" PRIMARY KEY ("Id_Ciudad");
 @   ALTER TABLE ONLY public."Ciudad" DROP CONSTRAINT "Ciudad_pkey";
       public            postgres    false    217            (           2606    18841    Civil Civil_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public."Civil"
    ADD CONSTRAINT "Civil_pkey" PRIMARY KEY ("N_Civil");
 >   ALTER TABLE ONLY public."Civil" DROP CONSTRAINT "Civil_pkey";
       public            postgres    false    219            *           2606    18843    Combate Combate_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public."Combate"
    ADD CONSTRAINT "Combate_pkey" PRIMARY KEY ("N_Personaje", "N_Poder", "N_Objeto");
 B   ALTER TABLE ONLY public."Combate" DROP CONSTRAINT "Combate_pkey";
       public            postgres    false    220    220    220            ,           2606    18845    Crea Crea_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY public."Crea"
    ADD CONSTRAINT "Crea_pkey" PRIMARY KEY ("N_Personaje", "N_Objeto");
 <   ALTER TABLE ONLY public."Crea" DROP CONSTRAINT "Crea_pkey";
       public            postgres    false    221    221            .           2606    18847    Creador Creador_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public."Creador"
    ADD CONSTRAINT "Creador_pkey" PRIMARY KEY ("Nom_Creador");
 B   ALTER TABLE ONLY public."Creador" DROP CONSTRAINT "Creador_pkey";
       public            postgres    false    222            0           2606    18849    Enfrenta Enfrenta_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public."Enfrenta"
    ADD CONSTRAINT "Enfrenta_pkey" PRIMARY KEY ("N_Heroe", "N_Villano");
 D   ALTER TABLE ONLY public."Enfrenta" DROP CONSTRAINT "Enfrenta_pkey";
       public            postgres    false    223    223            2           2606    18851    Esta Esta_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY public."Esta"
    ADD CONSTRAINT "Esta_pkey" PRIMARY KEY ("N_Personaje", "N_Titulo");
 <   ALTER TABLE ONLY public."Esta" DROP CONSTRAINT "Esta_pkey";
       public            postgres    false    224    224            4           2606    18853    Estado Estado_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public."Estado"
    ADD CONSTRAINT "Estado_pkey" PRIMARY KEY ("Id_Estado");
 @   ALTER TABLE ONLY public."Estado" DROP CONSTRAINT "Estado_pkey";
       public            postgres    false    225            6           2606    18855    Heroe Heroe_Alias_key 
   CONSTRAINT     W   ALTER TABLE ONLY public."Heroe"
    ADD CONSTRAINT "Heroe_Alias_key" UNIQUE ("Alias");
 C   ALTER TABLE ONLY public."Heroe" DROP CONSTRAINT "Heroe_Alias_key";
       public            postgres    false    227            8           2606    18857    Heroe Heroe_Logotipo_key 
   CONSTRAINT     ]   ALTER TABLE ONLY public."Heroe"
    ADD CONSTRAINT "Heroe_Logotipo_key" UNIQUE ("Logotipo");
 F   ALTER TABLE ONLY public."Heroe" DROP CONSTRAINT "Heroe_Logotipo_key";
       public            postgres    false    227            :           2606    18859    Heroe Heroe_N_Heroe_key 
   CONSTRAINT     [   ALTER TABLE ONLY public."Heroe"
    ADD CONSTRAINT "Heroe_N_Heroe_key" UNIQUE ("N_Heroe");
 E   ALTER TABLE ONLY public."Heroe" DROP CONSTRAINT "Heroe_N_Heroe_key";
       public            postgres    false    227            <           2606    18861    Historial Historial_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY public."Historial"
    ADD CONSTRAINT "Historial_pkey" PRIMARY KEY ("N_Titulo", "Id_Perfil");
 F   ALTER TABLE ONLY public."Historial" DROP CONSTRAINT "Historial_pkey";
       public            postgres    false    228    228            >           2606    18863    Juego Juego_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public."Juego"
    ADD CONSTRAINT "Juego_pkey" PRIMARY KEY ("T_Juego");
 >   ALTER TABLE ONLY public."Juego" DROP CONSTRAINT "Juego_pkey";
       public            postgres    false    229            @           2606    18865    Medio Medio_Imagen_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public."Medio"
    ADD CONSTRAINT "Medio_Imagen_key" UNIQUE ("Imagen");
 D   ALTER TABLE ONLY public."Medio" DROP CONSTRAINT "Medio_Imagen_key";
       public            postgres    false    230            B           2606    18867    Medio Medio_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public."Medio"
    ADD CONSTRAINT "Medio_pkey" PRIMARY KEY ("Titulo");
 >   ALTER TABLE ONLY public."Medio" DROP CONSTRAINT "Medio_pkey";
       public            postgres    false    230            D           2606    18869    Nacionalidad Nacionalidad_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public."Nacionalidad"
    ADD CONSTRAINT "Nacionalidad_pkey" PRIMARY KEY ("Nac");
 L   ALTER TABLE ONLY public."Nacionalidad" DROP CONSTRAINT "Nacionalidad_pkey";
       public            postgres    false    231            F           2606    18871    Objeto Objeto_Imagen_key 
   CONSTRAINT     [   ALTER TABLE ONLY public."Objeto"
    ADD CONSTRAINT "Objeto_Imagen_key" UNIQUE ("Imagen");
 F   ALTER TABLE ONLY public."Objeto" DROP CONSTRAINT "Objeto_Imagen_key";
       public            postgres    false    232            H           2606    18873    Objeto Objeto_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public."Objeto"
    ADD CONSTRAINT "Objeto_pkey" PRIMARY KEY ("Nombre");
 @   ALTER TABLE ONLY public."Objeto" DROP CONSTRAINT "Objeto_pkey";
       public            postgres    false    232            J           2606    18875    Ocupacion Ocupacion_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public."Ocupacion"
    ADD CONSTRAINT "Ocupacion_pkey" PRIMARY KEY ("Ocup");
 F   ALTER TABLE ONLY public."Ocupacion" DROP CONSTRAINT "Ocupacion_pkey";
       public            postgres    false    233            L           2606    18877 &   Organizacion Organizacion_Fundador_key 
   CONSTRAINT     k   ALTER TABLE ONLY public."Organizacion"
    ADD CONSTRAINT "Organizacion_Fundador_key" UNIQUE ("Fundador");
 T   ALTER TABLE ONLY public."Organizacion" DROP CONSTRAINT "Organizacion_Fundador_key";
       public            postgres    false    234            N           2606    18879 $   Organizacion Organizacion_Imagen_key 
   CONSTRAINT     g   ALTER TABLE ONLY public."Organizacion"
    ADD CONSTRAINT "Organizacion_Imagen_key" UNIQUE ("Imagen");
 R   ALTER TABLE ONLY public."Organizacion" DROP CONSTRAINT "Organizacion_Imagen_key";
       public            postgres    false    234            P           2606    18881 #   Organizacion Organizacion_Lider_key 
   CONSTRAINT     e   ALTER TABLE ONLY public."Organizacion"
    ADD CONSTRAINT "Organizacion_Lider_key" UNIQUE ("Lider");
 Q   ALTER TABLE ONLY public."Organizacion" DROP CONSTRAINT "Organizacion_Lider_key";
       public            postgres    false    234            R           2606    18883    Organizacion Organizacion_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public."Organizacion"
    ADD CONSTRAINT "Organizacion_pkey" PRIMARY KEY ("Nombre");
 L   ALTER TABLE ONLY public."Organizacion" DROP CONSTRAINT "Organizacion_pkey";
       public            postgres    false    234            T           2606    18885    Pais Pais_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public."Pais"
    ADD CONSTRAINT "Pais_pkey" PRIMARY KEY ("Id_Pais");
 <   ALTER TABLE ONLY public."Pais" DROP CONSTRAINT "Pais_pkey";
       public            postgres    false    235            V           2606    18887    Pelicula Pelicula_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public."Pelicula"
    ADD CONSTRAINT "Pelicula_pkey" PRIMARY KEY ("T_Pelicula");
 D   ALTER TABLE ONLY public."Pelicula" DROP CONSTRAINT "Pelicula_pkey";
       public            postgres    false    237            X           2606    18889    Perfil Perfil_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public."Perfil"
    ADD CONSTRAINT "Perfil_pkey" PRIMARY KEY ("Id_Perfil");
 @   ALTER TABLE ONLY public."Perfil" DROP CONSTRAINT "Perfil_pkey";
       public            postgres    false    238            Z           2606    18891    Pers_Creador Pers_Creador_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public."Pers_Creador"
    ADD CONSTRAINT "Pers_Creador_pkey" PRIMARY KEY ("N_Personaje", "N_Creador");
 L   ALTER TABLE ONLY public."Pers_Creador" DROP CONSTRAINT "Pers_Creador_pkey";
       public            postgres    false    240    240            \           2606    18893    Pers_Nac Pers_Nac_pkey 
   CONSTRAINT     s   ALTER TABLE ONLY public."Pers_Nac"
    ADD CONSTRAINT "Pers_Nac_pkey" PRIMARY KEY ("N_Personaje", "Nacionalidad");
 D   ALTER TABLE ONLY public."Pers_Nac" DROP CONSTRAINT "Pers_Nac_pkey";
       public            postgres    false    241    241            ^           2606    18895    Pers_Oc Pers_Oc_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public."Pers_Oc"
    ADD CONSTRAINT "Pers_Oc_pkey" PRIMARY KEY ("N_Personaje", "Ocupacion");
 B   ALTER TABLE ONLY public."Pers_Oc" DROP CONSTRAINT "Pers_Oc_pkey";
       public            postgres    false    242    242            `           2606    18897    Personaje Personaje_Nombre_key 
   CONSTRAINT     a   ALTER TABLE ONLY public."Personaje"
    ADD CONSTRAINT "Personaje_Nombre_key" UNIQUE ("Nombre");
 L   ALTER TABLE ONLY public."Personaje" DROP CONSTRAINT "Personaje_Nombre_key";
       public            postgres    false    243            b           2606    18899    Personaje Personaje_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public."Personaje"
    ADD CONSTRAINT "Personaje_pkey" PRIMARY KEY ("Nombre");
 F   ALTER TABLE ONLY public."Personaje" DROP CONSTRAINT "Personaje_pkey";
       public            postgres    false    243            d           2606    18901    Pertenece Pertenece_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public."Pertenece"
    ADD CONSTRAINT "Pertenece_pkey" PRIMARY KEY ("N_Personaje", "N_Organizacion", "Cod_Cargo");
 F   ALTER TABLE ONLY public."Pertenece" DROP CONSTRAINT "Pertenece_pkey";
       public            postgres    false    244    244    244            f           2606    18903    Plat_Juego Plat_Juego_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY public."Plat_Juego"
    ADD CONSTRAINT "Plat_Juego_pkey" PRIMARY KEY ("T_Juego", "Plataforma");
 H   ALTER TABLE ONLY public."Plat_Juego" DROP CONSTRAINT "Plat_Juego_pkey";
       public            postgres    false    245    245            h           2606    18905    Plataforma Plataforma_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public."Plataforma"
    ADD CONSTRAINT "Plataforma_pkey" PRIMARY KEY (nombre);
 H   ALTER TABLE ONLY public."Plataforma" DROP CONSTRAINT "Plataforma_pkey";
       public            postgres    false    246            j           2606    18907    Poder Poder_Imagen_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public."Poder"
    ADD CONSTRAINT "Poder_Imagen_key" UNIQUE ("Imagen");
 D   ALTER TABLE ONLY public."Poder" DROP CONSTRAINT "Poder_Imagen_key";
       public            postgres    false    247            l           2606    18909    Poder Poder_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public."Poder"
    ADD CONSTRAINT "Poder_pkey" PRIMARY KEY ("Nombre");
 >   ALTER TABLE ONLY public."Poder" DROP CONSTRAINT "Poder_pkey";
       public            postgres    false    247            n           2606    18911    Posee Posee_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public."Posee"
    ADD CONSTRAINT "Posee_pkey" PRIMARY KEY ("N_Personaje", "N_Poder");
 >   ALTER TABLE ONLY public."Posee" DROP CONSTRAINT "Posee_pkey";
       public            postgres    false    248    248            p           2606    18913 "   RelacionadoHer RelacionadoHer_pkey 
   CONSTRAINT     v   ALTER TABLE ONLY public."RelacionadoHer"
    ADD CONSTRAINT "RelacionadoHer_pkey" PRIMARY KEY ("N_Civil", "N_Heroe");
 P   ALTER TABLE ONLY public."RelacionadoHer" DROP CONSTRAINT "RelacionadoHer_pkey";
       public            postgres    false    249    249            r           2606    18915 $   RelacionadoVill RelacionadoVill_pkey 
   CONSTRAINT     z   ALTER TABLE ONLY public."RelacionadoVill"
    ADD CONSTRAINT "RelacionadoVill_pkey" PRIMARY KEY ("N_Civil", "N_Villano");
 R   ALTER TABLE ONLY public."RelacionadoVill" DROP CONSTRAINT "RelacionadoVill_pkey";
       public            postgres    false    250    250            t           2606    18917    Sede Sede_Imagen_key 
   CONSTRAINT     W   ALTER TABLE ONLY public."Sede"
    ADD CONSTRAINT "Sede_Imagen_key" UNIQUE ("Imagen");
 B   ALTER TABLE ONLY public."Sede" DROP CONSTRAINT "Sede_Imagen_key";
       public            postgres    false    251            v           2606    18919    Sede Sede_Nombre_key 
   CONSTRAINT     W   ALTER TABLE ONLY public."Sede"
    ADD CONSTRAINT "Sede_Nombre_key" UNIQUE ("Nombre");
 B   ALTER TABLE ONLY public."Sede" DROP CONSTRAINT "Sede_Nombre_key";
       public            postgres    false    251            x           2606    18921    Sede Sede_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public."Sede"
    ADD CONSTRAINT "Sede_pkey" PRIMARY KEY ("Nombre", "N_Org");
 <   ALTER TABLE ONLY public."Sede" DROP CONSTRAINT "Sede_pkey";
       public            postgres    false    251    251            z           2606    18923    Serie Serie_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public."Serie"
    ADD CONSTRAINT "Serie_pkey" PRIMARY KEY ("T_Serie");
 >   ALTER TABLE ONLY public."Serie" DROP CONSTRAINT "Serie_pkey";
       public            postgres    false    252            |           2606    19203     Suscripcion Suscripcion_Tipo_key 
   CONSTRAINT     a   ALTER TABLE ONLY public."Suscripcion"
    ADD CONSTRAINT "Suscripcion_Tipo_key" UNIQUE ("Tipo");
 N   ALTER TABLE ONLY public."Suscripcion" DROP CONSTRAINT "Suscripcion_Tipo_key";
       public            postgres    false    253            ~           2606    18925    Suscripcion Suscripcion_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public."Suscripcion"
    ADD CONSTRAINT "Suscripcion_pkey" PRIMARY KEY ("ID");
 J   ALTER TABLE ONLY public."Suscripcion" DROP CONSTRAINT "Suscripcion_pkey";
       public            postgres    false    253            �           2606    18927    Tarjeta Tarjeta_N_Tarjeta_key 
   CONSTRAINT     c   ALTER TABLE ONLY public."Tarjeta"
    ADD CONSTRAINT "Tarjeta_N_Tarjeta_key" UNIQUE ("N_Tarjeta");
 K   ALTER TABLE ONLY public."Tarjeta" DROP CONSTRAINT "Tarjeta_N_Tarjeta_key";
       public            postgres    false    254            �           2606    18929    Tarjeta Tarjeta_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public."Tarjeta"
    ADD CONSTRAINT "Tarjeta_pkey" PRIMARY KEY ("N_Tarjeta");
 B   ALTER TABLE ONLY public."Tarjeta" DROP CONSTRAINT "Tarjeta_pkey";
       public            postgres    false    254            �           2606    18931    Usuario Usuario_Apellido_key 
   CONSTRAINT     a   ALTER TABLE ONLY public."Usuario"
    ADD CONSTRAINT "Usuario_Apellido_key" UNIQUE ("Apellido");
 J   ALTER TABLE ONLY public."Usuario" DROP CONSTRAINT "Usuario_Apellido_key";
       public            postgres    false    255            �           2606    18933    Usuario Usuario_Nombre_key 
   CONSTRAINT     ]   ALTER TABLE ONLY public."Usuario"
    ADD CONSTRAINT "Usuario_Nombre_key" UNIQUE ("Nombre");
 H   ALTER TABLE ONLY public."Usuario" DROP CONSTRAINT "Usuario_Nombre_key";
       public            postgres    false    255            �           2606    18935    Usuario Usuario_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public."Usuario"
    ADD CONSTRAINT "Usuario_pkey" PRIMARY KEY ("Email");
 B   ALTER TABLE ONLY public."Usuario" DROP CONSTRAINT "Usuario_pkey";
       public            postgres    false    255            �           2606    18937    Villano Villano_Alias_key 
   CONSTRAINT     [   ALTER TABLE ONLY public."Villano"
    ADD CONSTRAINT "Villano_Alias_key" UNIQUE ("Alias");
 G   ALTER TABLE ONLY public."Villano" DROP CONSTRAINT "Villano_Alias_key";
       public            postgres    false    256            �           2606    18939    Villano Villano_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public."Villano"
    ADD CONSTRAINT "Villano_pkey" PRIMARY KEY ("N_Villano");
 B   ALTER TABLE ONLY public."Villano" DROP CONSTRAINT "Villano_pkey";
       public            postgres    false    256            �           2620    19185    Heroe archienemigo_trigger    TRIGGER     �   CREATE TRIGGER archienemigo_trigger BEFORE INSERT OR UPDATE ON public."Heroe" FOR EACH ROW EXECUTE FUNCTION public.archienemigo();
 5   DROP TRIGGER archienemigo_trigger ON public."Heroe";
       public          postgres    false    258    227            �           2620    19182    Historial calificacion_trigger    TRIGGER     �   CREATE TRIGGER calificacion_trigger BEFORE INSERT OR UPDATE ON public."Historial" FOR EACH ROW EXECUTE FUNCTION public.numcalificacion();
 9   DROP TRIGGER calificacion_trigger ON public."Historial";
       public          postgres    false    259    228            �           2620    19189    Personaje emarital_trigger    TRIGGER        CREATE TRIGGER emarital_trigger BEFORE INSERT OR UPDATE ON public."Personaje" FOR EACH ROW EXECUTE FUNCTION public.emarital();
 5   DROP TRIGGER emarital_trigger ON public."Personaje";
       public          postgres    false    262    243            �           2620    19196 !   Pelicula ganancia_perdida_trigger    TRIGGER     �   CREATE TRIGGER ganancia_perdida_trigger BEFORE INSERT OR UPDATE ON public."Pelicula" FOR EACH ROW EXECUTE FUNCTION public.ganancia_perdida();
 <   DROP TRIGGER ganancia_perdida_trigger ON public."Pelicula";
       public          postgres    false    237    267            �           2620    19187    Personaje genero_trigger    TRIGGER     {   CREATE TRIGGER genero_trigger BEFORE INSERT OR UPDATE ON public."Personaje" FOR EACH ROW EXECUTE FUNCTION public.genero();
 3   DROP TRIGGER genero_trigger ON public."Personaje";
       public          postgres    false    274    243            �           2620    19198    Usuario numusuarios_trigger    TRIGGER     �   CREATE TRIGGER numusuarios_trigger BEFORE INSERT OR UPDATE ON public."Usuario" FOR EACH ROW EXECUTE FUNCTION public.numusuarios();
 6   DROP TRIGGER numusuarios_trigger ON public."Usuario";
       public          postgres    false    255    261            �           2620    19180    Medio rating_trigger    TRIGGER     z   CREATE TRIGGER rating_trigger BEFORE INSERT OR UPDATE ON public."Medio" FOR EACH ROW EXECUTE FUNCTION public.numrating();
 /   DROP TRIGGER rating_trigger ON public."Medio";
       public          postgres    false    276    230            �           2620    19192    Esta rolpersonaje_trigger    TRIGGER     �   CREATE TRIGGER rolpersonaje_trigger BEFORE INSERT OR UPDATE ON public."Esta" FOR EACH ROW EXECUTE FUNCTION public.rolpersonaje();
 4   DROP TRIGGER rolpersonaje_trigger ON public."Esta";
       public          postgres    false    277    224            �           2620    19194    Esta tipoactor_trigger    TRIGGER     |   CREATE TRIGGER tipoactor_trigger BEFORE INSERT OR UPDATE ON public."Esta" FOR EACH ROW EXECUTE FUNCTION public.tipoactor();
 1   DROP TRIGGER tipoactor_trigger ON public."Esta";
       public          postgres    false    260    224            �           2620    19201 %   Suscripcion tiposuscripciones_trigger    TRIGGER     �   CREATE TRIGGER tiposuscripciones_trigger BEFORE INSERT OR UPDATE ON public."Suscripcion" FOR EACH ROW EXECUTE FUNCTION public.tiposuscripciones();
 @   DROP TRIGGER tiposuscripciones_trigger ON public."Suscripcion";
       public          postgres    false    253    278            �           2606    18940 #   Aparece Aparece_N_Organizacion_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Aparece"
    ADD CONSTRAINT "Aparece_N_Organizacion_fkey" FOREIGN KEY ("N_Organizacion") REFERENCES public."Organizacion"("Nombre");
 Q   ALTER TABLE ONLY public."Aparece" DROP CONSTRAINT "Aparece_N_Organizacion_fkey";
       public          postgres    false    214    3410    234            �           2606    18945    Aparece Aparece_N_Titulo_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Aparece"
    ADD CONSTRAINT "Aparece_N_Titulo_fkey" FOREIGN KEY ("N_Titulo") REFERENCES public."Medio"("Titulo");
 K   ALTER TABLE ONLY public."Aparece" DROP CONSTRAINT "Aparece_N_Titulo_fkey";
       public          postgres    false    230    3394    214            �           2606    18950    Ciudad Ciudad_Id_Estado_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Ciudad"
    ADD CONSTRAINT "Ciudad_Id_Estado_fkey" FOREIGN KEY ("Id_Estado") REFERENCES public."Estado"("Id_Estado");
 J   ALTER TABLE ONLY public."Ciudad" DROP CONSTRAINT "Ciudad_Id_Estado_fkey";
       public          postgres    false    217    3380    225            �           2606    18955    Civil Civil_N_Civil_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Civil"
    ADD CONSTRAINT "Civil_N_Civil_fkey" FOREIGN KEY ("N_Civil") REFERENCES public."Personaje"("Nombre") NOT VALID;
 F   ALTER TABLE ONLY public."Civil" DROP CONSTRAINT "Civil_N_Civil_fkey";
       public          postgres    false    219    3424    243            �           2606    18960    Combate Combate_N_Objeto_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Combate"
    ADD CONSTRAINT "Combate_N_Objeto_fkey" FOREIGN KEY ("N_Objeto") REFERENCES public."Objeto"("Nombre");
 K   ALTER TABLE ONLY public."Combate" DROP CONSTRAINT "Combate_N_Objeto_fkey";
       public          postgres    false    3400    232    220            �           2606    18965     Combate Combate_N_Personaje_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Combate"
    ADD CONSTRAINT "Combate_N_Personaje_fkey" FOREIGN KEY ("N_Personaje") REFERENCES public."Personaje"("Nombre");
 N   ALTER TABLE ONLY public."Combate" DROP CONSTRAINT "Combate_N_Personaje_fkey";
       public          postgres    false    220    243    3424            �           2606    18970    Combate Combate_N_Poder_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Combate"
    ADD CONSTRAINT "Combate_N_Poder_fkey" FOREIGN KEY ("N_Poder") REFERENCES public."Poder"("Nombre");
 J   ALTER TABLE ONLY public."Combate" DROP CONSTRAINT "Combate_N_Poder_fkey";
       public          postgres    false    220    3436    247            �           2606    18975    Crea Crea_N_Objeto_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Crea"
    ADD CONSTRAINT "Crea_N_Objeto_fkey" FOREIGN KEY ("N_Objeto") REFERENCES public."Objeto"("Nombre");
 E   ALTER TABLE ONLY public."Crea" DROP CONSTRAINT "Crea_N_Objeto_fkey";
       public          postgres    false    232    3400    221            �           2606    18980    Crea Crea_N_Personaje_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Crea"
    ADD CONSTRAINT "Crea_N_Personaje_fkey" FOREIGN KEY ("N_Personaje") REFERENCES public."Personaje"("Nombre");
 H   ALTER TABLE ONLY public."Crea" DROP CONSTRAINT "Crea_N_Personaje_fkey";
       public          postgres    false    243    221    3424            �           2606    18985    Enfrenta Enfrenta_N_Heroe_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Enfrenta"
    ADD CONSTRAINT "Enfrenta_N_Heroe_fkey" FOREIGN KEY ("N_Heroe") REFERENCES public."Heroe"("N_Heroe");
 L   ALTER TABLE ONLY public."Enfrenta" DROP CONSTRAINT "Enfrenta_N_Heroe_fkey";
       public          postgres    false    3386    227    223            �           2606    18990     Enfrenta Enfrenta_N_Villano_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Enfrenta"
    ADD CONSTRAINT "Enfrenta_N_Villano_fkey" FOREIGN KEY ("N_Villano") REFERENCES public."Villano"("N_Villano");
 N   ALTER TABLE ONLY public."Enfrenta" DROP CONSTRAINT "Enfrenta_N_Villano_fkey";
       public          postgres    false    223    256    3468            �           2606    18995    Esta Esta_N_Personaje_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Esta"
    ADD CONSTRAINT "Esta_N_Personaje_fkey" FOREIGN KEY ("N_Personaje") REFERENCES public."Personaje"("Nombre");
 H   ALTER TABLE ONLY public."Esta" DROP CONSTRAINT "Esta_N_Personaje_fkey";
       public          postgres    false    224    243    3424            �           2606    19000    Esta Esta_N_Titulo_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Esta"
    ADD CONSTRAINT "Esta_N_Titulo_fkey" FOREIGN KEY ("N_Titulo") REFERENCES public."Medio"("Titulo");
 E   ALTER TABLE ONLY public."Esta" DROP CONSTRAINT "Esta_N_Titulo_fkey";
       public          postgres    false    3394    230    224            �           2606    19005    Estado Estado_Id_Pais_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Estado"
    ADD CONSTRAINT "Estado_Id_Pais_fkey" FOREIGN KEY ("Id_Pais") REFERENCES public."Pais"("Id_Pais");
 H   ALTER TABLE ONLY public."Estado" DROP CONSTRAINT "Estado_Id_Pais_fkey";
       public          postgres    false    235    225    3412            �           2606    19010    Heroe Heroe_Archienemigo_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Heroe"
    ADD CONSTRAINT "Heroe_Archienemigo_fkey" FOREIGN KEY ("Archienemigo") REFERENCES public."Villano"("N_Villano") NOT VALID;
 K   ALTER TABLE ONLY public."Heroe" DROP CONSTRAINT "Heroe_Archienemigo_fkey";
       public          postgres    false    3468    256    227            �           2606    19015    Heroe Heroe_N_Heroe_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Heroe"
    ADD CONSTRAINT "Heroe_N_Heroe_fkey" FOREIGN KEY ("N_Heroe") REFERENCES public."Personaje"("Nombre") NOT VALID;
 F   ALTER TABLE ONLY public."Heroe" DROP CONSTRAINT "Heroe_N_Heroe_fkey";
       public          postgres    false    3424    227    243            �           2606    19020 "   Historial Historial_Id_Perfil_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Historial"
    ADD CONSTRAINT "Historial_Id_Perfil_fkey" FOREIGN KEY ("Id_Perfil") REFERENCES public."Perfil"("Id_Perfil");
 P   ALTER TABLE ONLY public."Historial" DROP CONSTRAINT "Historial_Id_Perfil_fkey";
       public          postgres    false    3416    238    228            �           2606    19025 !   Historial Historial_N_Titulo_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Historial"
    ADD CONSTRAINT "Historial_N_Titulo_fkey" FOREIGN KEY ("N_Titulo") REFERENCES public."Medio"("Titulo");
 O   ALTER TABLE ONLY public."Historial" DROP CONSTRAINT "Historial_N_Titulo_fkey";
       public          postgres    false    230    3394    228            �           2606    19030    Juego Juego_T_Juego_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Juego"
    ADD CONSTRAINT "Juego_T_Juego_fkey" FOREIGN KEY ("T_Juego") REFERENCES public."Medio"("Titulo") NOT VALID;
 F   ALTER TABLE ONLY public."Juego" DROP CONSTRAINT "Juego_T_Juego_fkey";
       public          postgres    false    229    230    3394            �           2606    19035    Objeto Objeto_N_Personaje_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Objeto"
    ADD CONSTRAINT "Objeto_N_Personaje_fkey" FOREIGN KEY ("N_Personaje") REFERENCES public."Personaje"("Nombre") NOT VALID;
 L   ALTER TABLE ONLY public."Objeto" DROP CONSTRAINT "Objeto_N_Personaje_fkey";
       public          postgres    false    232    3424    243            �           2606    19040 '   Organizacion Organizacion_Fundador_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Organizacion"
    ADD CONSTRAINT "Organizacion_Fundador_fkey" FOREIGN KEY ("Fundador") REFERENCES public."Personaje"("Nombre") NOT VALID;
 U   ALTER TABLE ONLY public."Organizacion" DROP CONSTRAINT "Organizacion_Fundador_fkey";
       public          postgres    false    3424    234    243            �           2606    19045 $   Organizacion Organizacion_Lider_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Organizacion"
    ADD CONSTRAINT "Organizacion_Lider_fkey" FOREIGN KEY ("Lider") REFERENCES public."Personaje"("Nombre") NOT VALID;
 R   ALTER TABLE ONLY public."Organizacion" DROP CONSTRAINT "Organizacion_Lider_fkey";
       public          postgres    false    3424    243    234            �           2606    19050 !   Pelicula Pelicula_T_Pelicula_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Pelicula"
    ADD CONSTRAINT "Pelicula_T_Pelicula_fkey" FOREIGN KEY ("T_Pelicula") REFERENCES public."Medio"("Titulo") NOT VALID;
 O   ALTER TABLE ONLY public."Pelicula" DROP CONSTRAINT "Pelicula_T_Pelicula_fkey";
       public          postgres    false    230    237    3394            �           2606    19055    Perfil Perfil_Email_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Perfil"
    ADD CONSTRAINT "Perfil_Email_fkey" FOREIGN KEY ("Email") REFERENCES public."Usuario"("Email") NOT VALID;
 F   ALTER TABLE ONLY public."Perfil" DROP CONSTRAINT "Perfil_Email_fkey";
       public          postgres    false    238    3464    255            �           2606    19060 (   Pers_Creador Pers_Creador_N_Creador_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Pers_Creador"
    ADD CONSTRAINT "Pers_Creador_N_Creador_fkey" FOREIGN KEY ("N_Creador") REFERENCES public."Creador"("Nom_Creador");
 V   ALTER TABLE ONLY public."Pers_Creador" DROP CONSTRAINT "Pers_Creador_N_Creador_fkey";
       public          postgres    false    222    240    3374            �           2606    19065 *   Pers_Creador Pers_Creador_N_Personaje_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Pers_Creador"
    ADD CONSTRAINT "Pers_Creador_N_Personaje_fkey" FOREIGN KEY ("N_Personaje") REFERENCES public."Personaje"("Nombre");
 X   ALTER TABLE ONLY public."Pers_Creador" DROP CONSTRAINT "Pers_Creador_N_Personaje_fkey";
       public          postgres    false    3424    240    243            �           2606    19070 "   Pers_Nac Pers_Nac_N_Personaje_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Pers_Nac"
    ADD CONSTRAINT "Pers_Nac_N_Personaje_fkey" FOREIGN KEY ("N_Personaje") REFERENCES public."Personaje"("Nombre");
 P   ALTER TABLE ONLY public."Pers_Nac" DROP CONSTRAINT "Pers_Nac_N_Personaje_fkey";
       public          postgres    false    3424    241    243            �           2606    19075 #   Pers_Nac Pers_Nac_Nacionalidad_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Pers_Nac"
    ADD CONSTRAINT "Pers_Nac_Nacionalidad_fkey" FOREIGN KEY ("Nacionalidad") REFERENCES public."Nacionalidad"("Nac");
 Q   ALTER TABLE ONLY public."Pers_Nac" DROP CONSTRAINT "Pers_Nac_Nacionalidad_fkey";
       public          postgres    false    241    231    3396            �           2606    19080     Pers_Oc Pers_Oc_N_Personaje_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Pers_Oc"
    ADD CONSTRAINT "Pers_Oc_N_Personaje_fkey" FOREIGN KEY ("N_Personaje") REFERENCES public."Personaje"("Nombre");
 N   ALTER TABLE ONLY public."Pers_Oc" DROP CONSTRAINT "Pers_Oc_N_Personaje_fkey";
       public          postgres    false    242    243    3424            �           2606    19085    Pers_Oc Pers_Oc_Ocupacion_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Pers_Oc"
    ADD CONSTRAINT "Pers_Oc_Ocupacion_fkey" FOREIGN KEY ("Ocupacion") REFERENCES public."Ocupacion"("Ocup");
 L   ALTER TABLE ONLY public."Pers_Oc" DROP CONSTRAINT "Pers_Oc_Ocupacion_fkey";
       public          postgres    false    233    3402    242            �           2606    19090 "   Pertenece Pertenece_Cod_Cargo_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Pertenece"
    ADD CONSTRAINT "Pertenece_Cod_Cargo_fkey" FOREIGN KEY ("Cod_Cargo") REFERENCES public."Cargo"("Cod_Cargo");
 P   ALTER TABLE ONLY public."Pertenece" DROP CONSTRAINT "Pertenece_Cod_Cargo_fkey";
       public          postgres    false    244    215    3364            �           2606    19095 '   Pertenece Pertenece_N_Organizacion_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Pertenece"
    ADD CONSTRAINT "Pertenece_N_Organizacion_fkey" FOREIGN KEY ("N_Organizacion") REFERENCES public."Organizacion"("Nombre");
 U   ALTER TABLE ONLY public."Pertenece" DROP CONSTRAINT "Pertenece_N_Organizacion_fkey";
       public          postgres    false    234    3410    244            �           2606    19100 $   Pertenece Pertenece_N_Personaje_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Pertenece"
    ADD CONSTRAINT "Pertenece_N_Personaje_fkey" FOREIGN KEY ("N_Personaje") REFERENCES public."Personaje"("Nombre");
 R   ALTER TABLE ONLY public."Pertenece" DROP CONSTRAINT "Pertenece_N_Personaje_fkey";
       public          postgres    false    244    3424    243            �           2606    19105 %   Plat_Juego Plat_Juego_Plataforma_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Plat_Juego"
    ADD CONSTRAINT "Plat_Juego_Plataforma_fkey" FOREIGN KEY ("Plataforma") REFERENCES public."Plataforma"(nombre);
 S   ALTER TABLE ONLY public."Plat_Juego" DROP CONSTRAINT "Plat_Juego_Plataforma_fkey";
       public          postgres    false    3432    245    246            �           2606    19110 "   Plat_Juego Plat_Juego_T_Juego_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Plat_Juego"
    ADD CONSTRAINT "Plat_Juego_T_Juego_fkey" FOREIGN KEY ("T_Juego") REFERENCES public."Juego"("T_Juego");
 P   ALTER TABLE ONLY public."Plat_Juego" DROP CONSTRAINT "Plat_Juego_T_Juego_fkey";
       public          postgres    false    229    245    3390            �           2606    19115    Posee Posee_N_Personaje_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Posee"
    ADD CONSTRAINT "Posee_N_Personaje_fkey" FOREIGN KEY ("N_Personaje") REFERENCES public."Personaje"("Nombre");
 J   ALTER TABLE ONLY public."Posee" DROP CONSTRAINT "Posee_N_Personaje_fkey";
       public          postgres    false    3424    248    243            �           2606    19120    Posee Posee_N_Poder_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Posee"
    ADD CONSTRAINT "Posee_N_Poder_fkey" FOREIGN KEY ("N_Poder") REFERENCES public."Poder"("Nombre");
 F   ALTER TABLE ONLY public."Posee" DROP CONSTRAINT "Posee_N_Poder_fkey";
       public          postgres    false    3436    247    248            �           2606    19125 *   RelacionadoHer RelacionadoHer_N_Civil_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."RelacionadoHer"
    ADD CONSTRAINT "RelacionadoHer_N_Civil_fkey" FOREIGN KEY ("N_Civil") REFERENCES public."Civil"("N_Civil");
 X   ALTER TABLE ONLY public."RelacionadoHer" DROP CONSTRAINT "RelacionadoHer_N_Civil_fkey";
       public          postgres    false    249    219    3368            �           2606    19130 *   RelacionadoHer RelacionadoHer_N_Heroe_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."RelacionadoHer"
    ADD CONSTRAINT "RelacionadoHer_N_Heroe_fkey" FOREIGN KEY ("N_Heroe") REFERENCES public."Heroe"("N_Heroe");
 X   ALTER TABLE ONLY public."RelacionadoHer" DROP CONSTRAINT "RelacionadoHer_N_Heroe_fkey";
       public          postgres    false    3386    249    227            �           2606    19135 ,   RelacionadoVill RelacionadoVill_N_Civil_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."RelacionadoVill"
    ADD CONSTRAINT "RelacionadoVill_N_Civil_fkey" FOREIGN KEY ("N_Civil") REFERENCES public."Civil"("N_Civil");
 Z   ALTER TABLE ONLY public."RelacionadoVill" DROP CONSTRAINT "RelacionadoVill_N_Civil_fkey";
       public          postgres    false    219    250    3368            �           2606    19140 .   RelacionadoVill RelacionadoVill_N_Villano_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."RelacionadoVill"
    ADD CONSTRAINT "RelacionadoVill_N_Villano_fkey" FOREIGN KEY ("N_Villano") REFERENCES public."Villano"("N_Villano");
 \   ALTER TABLE ONLY public."RelacionadoVill" DROP CONSTRAINT "RelacionadoVill_N_Villano_fkey";
       public          postgres    false    3468    250    256            �           2606    19145    Sede Sede_N_Org_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Sede"
    ADD CONSTRAINT "Sede_N_Org_fkey" FOREIGN KEY ("N_Org") REFERENCES public."Organizacion"("Nombre") NOT VALID;
 B   ALTER TABLE ONLY public."Sede" DROP CONSTRAINT "Sede_N_Org_fkey";
       public          postgres    false    251    234    3410            �           2606    19150    Serie Serie_T_Serie_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Serie"
    ADD CONSTRAINT "Serie_T_Serie_fkey" FOREIGN KEY ("T_Serie") REFERENCES public."Medio"("Titulo") NOT VALID;
 F   ALTER TABLE ONLY public."Serie" DROP CONSTRAINT "Serie_T_Serie_fkey";
       public          postgres    false    230    252    3394            �           2606    19155    Usuario Usuario_Direccion_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Usuario"
    ADD CONSTRAINT "Usuario_Direccion_fkey" FOREIGN KEY ("Direccion") REFERENCES public."Ciudad"("Id_Ciudad") NOT VALID;
 L   ALTER TABLE ONLY public."Usuario" DROP CONSTRAINT "Usuario_Direccion_fkey";
       public          postgres    false    255    217    3366            �           2606    19160 #   Usuario Usuario_Id_Suscripcion_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Usuario"
    ADD CONSTRAINT "Usuario_Id_Suscripcion_fkey" FOREIGN KEY ("Id_Suscripcion") REFERENCES public."Suscripcion"("ID") NOT VALID;
 Q   ALTER TABLE ONLY public."Usuario" DROP CONSTRAINT "Usuario_Id_Suscripcion_fkey";
       public          postgres    false    255    3454    253            �           2606    19165    Usuario Usuario_N_Tarjeta_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Usuario"
    ADD CONSTRAINT "Usuario_N_Tarjeta_fkey" FOREIGN KEY ("N_Tarjeta") REFERENCES public."Tarjeta"("N_Tarjeta") NOT VALID;
 L   ALTER TABLE ONLY public."Usuario" DROP CONSTRAINT "Usuario_N_Tarjeta_fkey";
       public          postgres    false    3456    254    255            �           2606    19170    Villano Villano_N_Villano_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Villano"
    ADD CONSTRAINT "Villano_N_Villano_fkey" FOREIGN KEY ("N_Villano") REFERENCES public."Personaje"("Nombre") NOT VALID;
 L   ALTER TABLE ONLY public."Villano" DROP CONSTRAINT "Villano_N_Villano_fkey";
       public          postgres    false    256    243    3424            T      x������ � �      U      x������ � �      W   O   x�344�tN,JLN,�44�244�t�,MILQHIUp�O�/I�44�s��+����s�T� 5� �q��qqq 
�a      Y      x������ � �      Z      x������ � �      [      x������ � �      \      x������ � �      ]      x������ � �      ^      x������ � �      _   G   x�34�t�,.)�,�WpN,�,I��4�22���,J�KIr�8����K9����8}SSRsr2�=... ���      a      x������ � �      b      x������ � �      c      x������ � �      d   ,   x����I�4202�50"Δ�Nc�b�V���RD\1z\\\ �y:      e      x������ � �      f      x������ � �      g      x������ � �      h      x������ � �      i   $   x�3�K�K�*M�I�2�t����M�L����� H      k      x������ � �      l      x�����J�����
�+��6h�3�	ss|z��n�=k��!�(Vq�Z�����-��h�q��M~M��%���X�J�e��_��{5$M�O6�ɖ��fH��3����&k�!���i�>AE�F�}�Ws^�I��İ��4���	i)��hu�'��Dq�=�.��,�F~�;ș:�OL����u=��G��0����މ���'��NHS]�N�45��FK�� JrT�	�P�[��t�S��t��Λp)�M�NX��`!C�۱7QyqZ�6��7>�>/>�)�_�I��/.�$�Lb�o�-^�a���Z�.�� ��/^6Q�m������r����Y���zX(�Zp��i�Ѧ ���m����~:�m�e
�y�,���9S� �ӂ��0f�g��1���U��qsW>�j4AMU8\�]}��ܨ-a�:�[SjO��t�;����"�aI�fq��RHя�L4Ԉ����p3�V¦�M����Y�v=�$�T���M��p�[64�qU��V#���k�P_��\Y���'˞�e�e���kUM����E5<���#`���kYZ�t�\
���J�<l:�nH[�m��v�śN=���L��s�k�^���[ĉ*���y��e���y����|���5������h�2l2�G�F�h.k	"���ː���	v��g	�JGk�**���:H���m�n!�zf�i��%ޓ�>�5ҏ�Zge�,R��D ���e��%~�Qس8�;)� Z!K&W�\����Nό��\�5C�D�3��r����4��ຝ��N� ��]�p���pL��uUJ����x�.��.�V���Eɳb/�;���V��Ԙu;vA���@'��X���D��oQ5���.��`��@��:2�8��n�@bn\�h/�{��z�3cj�d�Mw(�DZ�����2eXmW���P�mq�����q6ԯY���Bm��sr �Gt;p
�����G�&8�
d�ǂʐg@eY��@�X�/i�Nٺ��D�=N��
�S/J5��/AU��|���`��F5-G���<xnxټ��P�܂��\��dGy�Bw0F<�&�F*�����u��Y�Z�o��	;Wo �>�φv�NEnX�j 0�*�,q^Kc��������ɡ���'�����G��� �Ru�4�p2Ur�2�'l0�Z���Պ�'8 �7��4'ٜ��K�
p�Qr����t×*k���}aF�����kJ����	5��4�bAǈv����vSU�ֽT2��S�x���l@.iC1��S�V� ���K�o!+"}�r p�8�ї��R�^rڳ��Bt�4����MKBӓjB��W���<h�0c�2�6��6$���Xƫr�o`�u��=TтV�dՇ`g�U�7��x�����������|67�g�
P�TR��ͻL:��ȱW� ���)�Z��Y��c.Y�CX"�d%�l�*�a{#�qڴ<��f���:���M`دϴ��2��)��/) 9�	i�x�R�ʐptA�ꅡ��cΕ#X#�4���}Wt�=��'5�F�D�ˬ����׋�5����Ld�R1�zF��9�e����8��#��j���=���T�(�X����w-c��N�Ǌ֢Ї�H���!�	�[�EXf���)<`Y}�R���l��c�O��"��%a��tV�Ci�����i���˖��fW�Ŗ�j6E:�9r��O�i�EPO��z!�r�P?���d�x����~�V}�Pp��c�+_"?x�w&;����v�1�P�F74W��������@dwin�����U/�U"�쫬�$<��9l�� ݝ���~^�����?,Ń�pSA��]�����4RJ��I�Hw���{�È� �V�:��� j��#(���W�������G^�Ĥ�%�9G�a)P�vB�����%_���� �!9�c3�o )��9�O��R�2#<l4+��^ƟT:�d#�+(�[޷6j��U�dKR^Rd,_��;�Rw�a<��`�%��ehhB�%@�S���R|����7��4!���̫ЊzWP�Ζ$������'hv�fᯨ{����Vэ})�{~�K�갶d"�\�h��2�YH�Ƥ T��K�����Ń����-Y� �c?��e�}�/p����$�ض8}X@��V]�g�6�é�'O�!�f�"��"�0BX��`ǡ��p��n���\�R.����A+xc<��4o��Rm�����'�o�ɫ0��RM_�'C),�ŋ��bQ:���tlD�����@�q5}+�y�S�
<�\s��`zUo7O]��T�dWf�uD�9��4d��a��De>R�8��Q��v(b�(�km�PR���5��Da>�"�Pٓ_�9F�su�經�(e���w�K<�7@�~�N�lK��s*���T� ��R� )����J�BU!ca�B�'�� �	6l��&em��>G]��Ix�%H�wnC�� �:�he�Gu9"�;|h��ͤ�^_D?��F��Vg�u�j�O ��;���;-�T�˕��Wo]6
�$ǃ��w��P�����J�[8�ڌE���ۓ��'Y~��a2*�v��ӷ�W�m��JE�Yu�+$��f������=�@��3���W�r!�_��� yi�g}d�!����X<�X�Ǫv��IZ�gu�UB}�U��VָV�Vq��~�k<�y�c
��"���
�����=j9AFj�|���%Ű^,��B�cB�hX"}����3%HS;F��3�J�G�֞3.3��'<i��8Gv%�N�񄴱���2��Η���L�Q�t�"2������|��}��m���(�Z��8s��[�戙5�MU54�_���zH\%�E���:�c���|�О�Ni��~���8� 8#���h���T`+��`YH8%�`�.̡���D�C C`�(��85�ۗ�I�����"��~O��(�������i��a������  �@
�!���
)���H]���"��������[,X�33b��TuJ��^�p!9�ƘݸO��÷��~��<E�؟Q	cy�SY!XHQ���|���vU&�o9�V�s����P�P�nk%�?��](���w��`޲�5%	�U�U�r� ?�uKLU�6�0N#� 	G9�T�
U37�#ȝ"6w��ZN	�SHnRIo!;��l8ӵ���WU��:��G���)R�{�I����Mf@�D���iB���4��߻�o뢶6R6�:5Y�	ʄ<�VGNe#mc1�Yw�,̿���9�%!8�ư��}s�����Q��9�/����@xL|�)���X���I(���O�_o5�L����0�(7� �
�C����Ǿ3�
(*�u�C�����Z�tAdV�`� ��BZm-n=x��|���5�e�C����������S���K���/�/��׽�ӡa�����gx��U����o�����B����ύ�we?�ʲÉ�قY٣�А�#hɗ���;�CXo���#t�!��M$�t��RL�H���c_��Kf[�(�� �%/���l��dRU4���P���{b���J轆7d��[fܚgq��Z}�G�d��k�q�qd�:�GTuY/��뺦�:�*~�k_+b>�b�i��:���J}�5�(��3��k�i�q�+)&�'Ъ�e6�bH���TXf�sY��* �Z\���T����k��*����"�s�pV�߱���,�?-TB*ڃc��uA9���ki�;�u�#�5�t<�ѕȑ+1�H~w�X�H5-kނao���ԝu�/@�l�}�Ј�0zI���	�tLf�6����l���̶K�����"�"����b�K���Fո�y�X�g:Ĥ!}	ĹR�WE������e�U�_������� ���T��ᯊ�_P�Ҹf)R�A�|;�[��m�v��J�}�9X��%�sdu	�aI�h�&^;2Co�8y�f��]�jb���E�(~����g�i��T~���Z�H�_Q��ޑ>خDQhJ�*�E    �Y�N���_����tIf�-8j����d��^PXhE ���1$�F"�N�d-��JX�S)�=#����E�"�)dj��&̜u�I�����H:��bT_ʸ�tN��f@��,�"�b^S�9*�D���K����N�b�n��̈́괿'iYɶ�al����G�����V���޲O��B[|�xq��EC�^�o�BUNja�Y՚� \x��)!��� 	��4W�y�����U�"�fPD�|��L�����|>��"v�S���D�
���x�+�~���_���
/�qؼ�a�Ũ��]�Y�py4�{��=S�]КН��;����5��D��w9�:��_� �W�q�Z������4<��_\���E-z�T����ou�a��C n	I\�������~��;���G�tQ����dYO8`�چj�h��Stl��\�E���\�ty�bz��9QM[�/�V��:�f�"a�V�i�8�PM蹵˸����H�j�thf�Θj������#]	��KƏ��HZ��ζ�t�����7���\�tr���R{x�_?Z�ݜ�(@�,����I=�{���:�S��[��B=�����1���p�QN�A2�vi��e8��䃒S�THV4u�[ڶ�� �\�נ��`dz�E>�"�T�S!�Rܱ	�g�OCÛ�v�s_XC
�BJXjY���\�lW���T���NL^W_�r�dg%���!�t���O�$��C��G���zy@��<����;���ח~���#���3��3����7��we"g�i=��z������1�JO��
��V�yL��Ǚ�K�Y�Ga{�$��J7�N�	4�M-��h��za��m��`��\���.�Ң%�1�G�~cDy��1�W�4�ni��I%Kk��-�5�U�ﱹٸf������� ��QSy7���u�Ҫ�PDVT���U&c����5���@M�s�xG�P��Em/����L>v���+V}LPv:rI�>��U�[�� ��4�E��4C�l�c�C�5��A�N��YR�L�mX$	�|ҩ)h�8a� kt�12{�'����>���/���έ��f�8�F`�\�fE=#N�9v����S JP,dY����W0*�fmNp��j+���ՎvaVԾL����BOϱ�^=�k0m��7-����v��q��_�X�,4R�k�[��)����������9��n%�yE7�F3�d�B�1E�=M�4*V̤x��ݙ�CA=��en*�e��O���^˱d� M��3f�iׅ�+jթ���?�4��kfI�E$���u
~�A�Y_i����*7�$�l�d%��6�`�{���L7�+�le�SeX	�2B���30�b���e%��<,ס&�����{�M�UYƼ3Q&g)�uѓ���Ox������V�SH3�������5|��[mF�o��sܛQ_�>^�گjF��uw���A��U9�;���c�"ܴN��2�`
��'���+���]�N�_���+���hWК�4?�I�f3�2;������uC��7�x���*JY*�(�RP5r9E���u$���Ab��ҥ��޵��e:�U�g��@�E#�&���Я����Fet�J�t/�X냳�3�5����3��Pރ8L0Ტ����?��yB�#�!3?��sʁ�<��	�ݎ�g�\�I�S��Ec��!�a�e�lŷ$�(?�H��b���V?7X��TUcaˍKdޔ�L��pBQco��O����m�����y<X����z�֛����qi��l�T��{���g� b�~�^!�0��BN���ᓲ�"��lh@}}e��2�	��.w��0�0�K�hk0��ʨw�w,�X��5 �0����q�-:�T�q��V����f���5��~�����)����_�������bz�rZ廤� �U�t�Yp����ׇ��x=8A�:ܗ~t[é'|�:�>�����GQ!�]  8���5!e
�-6�ƪ��&f�䖪�υB��[sJv5-(��� �3�V���_�sy��}� �mo	��D���i�y�x
��|�&#FN�����R�_��_]���+h	+ĺ������-��^
���J/���Nq|d-���m�ޜc��T��4{�%
���q��d�L�Y;�SΧ��2B�7ڠ����ԥዀ�Ϯ�Ϲ�I�Ҽ�#��i�\�����T�"0@���U�ͽ	Q�z����շݖ�tE�/�V�*?
�����>��x�I�D$V���H����Cw���Eb[��wa~����ꎧ��&[��� G�!)�՘���N��b�A�@��71��!߹,����i8��⮓���s��0��4�Gg����Xv2��[�0�!���;ь���I��!kV |���P���9��Jc"�FN_{�^<�v��!쩨�� Of�$_��^���2��	q�F�|�m�����O!"�P**�W��d�� �)ŪE��p�ym��q&��G���i#((3�-Y�|�9�cKB �t�8�ES?.=Z�P }�����2� =�,�D��CF� q~�<Eّ�9z����c-�)to	���ڐ�4��u&�N��h��2��O˃r<߰��$����Ῐq��-��%�KK�l�?��<��͗����Ϟ%�?E��s�o������PK�����S��Z��E�2�X�v�sU��@j]�'�*�@��Q�~�n���rb�R��g�F�]Z�?�v=����"j�-�ܤ%��&6t���Ep�� ԏq�V~b��h{|z�;�>|��l����y|g?��d�á���zU��!1�}�o�,	�^y����-����F�ӊ?M����	p�5|����4��3X"��&�9x�j!s��U&��B{bw5�	%�0/��[��8��s��ؠ\ma�f��LTG���oJ���Y}�^(n�{R��m�Ȼx�_w5���� �6a>�9m�Η�fΚ��R���}.��|����^�/J�%��N��K>
�X7"u��Z�2`�R��GHh���8B��n{�U��0����_U+r~�7�Ȼ��-!=E�Q �*ѧ{�vB��U0GB��>�I�r�@���J^��~���<���S+�o*��Kbϼ������(��.���[�5Cź�;��p'o��eO����7kS�A�OXA'o/
~�G��슼�de��˙"��uĪ�|�q�����x���L)l�{~Y?`HU�	)�>SU0/��45�u$1а�J|/�+m�����K�>*��V�M��,Ӣ&��_t�ڟq��~��&����?L׋�t��g�g��[��F#���"��;�`f��������I��LO�4sѯy ���W�^?z���+�I�~�T�)T~���2:��ut�&U�}���K��F�;��Ӕܙ�WO�q?E���8Iy�������g�n���1'�_	�����0V�)h�V�W���¢�V���h��I���YM���z�Q�]��O��D�`��Ef��������YYy2A4�p�x:0�(�!1�ݍ+ �Z�!�n�> ���댫��(�Vs�M[�>ɻ�/����}���<�g����� ;;@^���fBk����iI]��I[�=�#�=�]��L�(��\~���W"+k��t�p·M�(��#Ih�ҁf�kGP5�
�� �F�0�R�a�Y9�z�P۟�t���́��e���ʪT��F�!`�Y�E��8��@b�%	���*I���Kl�C�Tm(�s���YД�(G�LTh;b�I���6�>�Yޱ$ Fܛ^ϭ-9D�pK2�e���s���½A��u�ԏj'��84�T�u�++BN�c��{�"��I"�5�Gς~����|u��Ic�Q�ա��r:W�a���y��֎���k؈��lG=iF�9�6V� MK^�:��A�f��!�Fi��H�ö�Q�k5BH�"�B_R�����:����k��9��JJX�Pd]�u-�-��u�L$��)8��N�����H6M�:� .  ��O0�g$q�uC�c(���g�x���w�_5?�l,o���Is��Ɖz���1�4���z�2CZI���/�c(I��SM`���	�Q	�:���Јw:�<�bڮ�,��y���EOO T��Ts1���g�w3�k�v.ɶ�i�LI���|��c7���*���T��:;����imK�2��(=�Ha��I��NF�����P�ur\�Q��jE��uܪށ�Q~�k{506���?PC*����Q�4��W�(�����W9A�+���G$7�H�����4�io��L�/�ao�^5>nlc(�s�4���r������|��w���?��}��*�S�T��xɯv�E��<��� �5 kj������:
��z%e�*u�φ�S��N�e�/�h��Dti������ۙ d���o���[U����F*tų˚����44�K����u�;3l��b���N'0W��0N�6c�W�����yg�ϳ�����DS�u��V��6�^�4J���}�C��4�O� .]�0�����6$��U
X5)+��-�M�/�d�b�B�3U3��FY�1X��q-O<M-�3o��7��g��m��6?�5�8������aڙ�TVF�630 ���7��<�j�/SUY	�|�e|��D��O� c���3�s�4K�d戍چ{p����y̗L������C���(�W����2�i�sAZ����׋C6r�n�����1��
�f=s�AL^�!K�j��(�]�s�0E���K㬆���Hh��S�)�0�5�{*q)k�'bMPV�"�Fu�w��n���d��v����(-\>��XxAq�߱]ߪ�`Os�X~0L�S٬�c�+Cd���iՒ�@�QR��*�lQؙe�CD�.��U��;?<����K=��%�D߳f0�ti�ı)�$1Pb��_���'WVT��\�JY���Q��a��PE���O��\�S�䉙m���Pe�u�߅A�o�f?^���G��L����8�dY�m����%#��x!m$Bg1���Th��^4EM�4���Z0D�Sc��n��cΰ'�;|?s^��I��<���7��cɔx�5'!��`��j��"����z�~������aÃ��	��5�~�N.x�sd�J�����>PK ��'"%�gݶFw�����!{��{Rܬ��͈�y��o�#�[���_��]�@q� ��ZBZ$�#��b�L�����j�칁�I���IQ���fN��+��s|Mu���OQB���P˟���>��䘱���Šp	����O�=�VKO9(�rE�hdWT�s�ʕ�q����=�9"�ӯ�V���;�|L�ʞi�$ ���̻�z���ꆸ��@�����3��Yp *<���~u�p�K��Q�Za��i��E^��~�b�{���בy6�$%�m�i)�qũ�Fg�`{��K�4>L�n��b�y#%��ENl��s�H/�h�>�X���)O�����w>]�|VѾ�KA7�� ��48��7K���/������z����٭�a���������I���      n      x������ � �      o      x������ � �      p      x������ � �      q      x������ � �      r      x������ � �      s      x������ � �      t      x������ � �      u      x������ � �      v      x������ � �      w      x������ � �      x      x������ � �      y      x������ � �      z      x������ � �      {   ?   x�3�4ճ��t��I\F�� �������\�e�ih�, a.NN���T0����� �	      |   ]   x�U��� �d��Pv��sԨRQ���y�ޒ�pMIf���{�f�
� ��cZ�e���݃�=���w�b��Z����S�N����^�e"�      }     x����n� @��	��&oݴ��*M$AU��T�������d�:��/��{�t8�v�X�g�-rxJ�𘒀#5��o(��m�VRp"D
ª�u������Ri������^�%؋��q�;j[������P��%��%	���֍���v����.���Ӳ��G�S���Bʨ�R�J�k��\�p�+���5�[��g�rD����p�����.��'o�xĩ�wH��T�SWp<��?8��t����=���> �9�y      ~      x������ � �     