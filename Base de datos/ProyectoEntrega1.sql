PGDMP     4                     {            Proyecto    15.2    15.3 �    j           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            k           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            l           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            m           1262    21240    Proyecto    DATABASE     �   CREATE DATABASE "Proyecto" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Venezuela.1252';
    DROP DATABASE "Proyecto";
                postgres    false            �            1259    21241    Aparece    TABLE     '  CREATE TABLE public."Aparece" (
    "N_Organizacion" text NOT NULL,
    "N_Titulo" text NOT NULL,
    "Estado" text NOT NULL,
    "Rol" text NOT NULL,
    CONSTRAINT "Aparece_Rol_check" CHECK ((("Rol" = 'Antagonista'::text) OR ("Rol" = 'Protagonista'::text) OR ("Rol" = 'Secundario'::text)))
);
    DROP TABLE public."Aparece";
       public         heap    postgres    false            �            1259    21247    Cargo    TABLE     c   CREATE TABLE public."Cargo" (
    "Cod_Cargo" integer NOT NULL,
    "Descripcion" text NOT NULL
);
    DROP TABLE public."Cargo";
       public         heap    postgres    false            �            1259    21252    Cargo_Cod_Cargo_seq    SEQUENCE     �   CREATE SEQUENCE public."Cargo_Cod_Cargo_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public."Cargo_Cod_Cargo_seq";
       public          postgres    false    215            n           0    0    Cargo_Cod_Cargo_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public."Cargo_Cod_Cargo_seq" OWNED BY public."Cargo"."Cod_Cargo";
          public          postgres    false    216            �            1259    21253    Ciudad    TABLE     �   CREATE TABLE public."Ciudad" (
    "Id_Ciudad" integer NOT NULL,
    "Nombre" text NOT NULL,
    "Id_Estado" integer NOT NULL
);
    DROP TABLE public."Ciudad";
       public         heap    postgres    false            �            1259    21258    Ciudad_Id_Ciudad_seq    SEQUENCE     �   CREATE SEQUENCE public."Ciudad_Id_Ciudad_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public."Ciudad_Id_Ciudad_seq";
       public          postgres    false    217            o           0    0    Ciudad_Id_Ciudad_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public."Ciudad_Id_Ciudad_seq" OWNED BY public."Ciudad"."Id_Ciudad";
          public          postgres    false    218            �            1259    21259    Civil    TABLE     =   CREATE TABLE public."Civil" (
    "N_Civil" text NOT NULL
);
    DROP TABLE public."Civil";
       public         heap    postgres    false            �            1259    21264    Combate    TABLE     �   CREATE TABLE public."Combate" (
    "N_Personaje" text NOT NULL,
    "N_Poder" text NOT NULL,
    "N_Objeto" text NOT NULL,
    "Lugar" text NOT NULL,
    "Fecha" date NOT NULL
);
    DROP TABLE public."Combate";
       public         heap    postgres    false            �            1259    21269    Crea    TABLE     ^   CREATE TABLE public."Crea" (
    "N_Personaje" text NOT NULL,
    "N_Objeto" text NOT NULL
);
    DROP TABLE public."Crea";
       public         heap    postgres    false            �            1259    21274    Creador    TABLE     C   CREATE TABLE public."Creador" (
    "Nom_Creador" text NOT NULL
);
    DROP TABLE public."Creador";
       public         heap    postgres    false            �            1259    21279    Enfrenta    TABLE     _   CREATE TABLE public."Enfrenta" (
    "N_Heroe" text NOT NULL,
    "N_Villano" text NOT NULL
);
    DROP TABLE public."Enfrenta";
       public         heap    postgres    false            �            1259    21284    Esta    TABLE     �  CREATE TABLE public."Esta" (
    "N_Personaje" text NOT NULL,
    "N_Titulo" text NOT NULL,
    "Tipo_Actor" text NOT NULL,
    "Rol" text NOT NULL,
    "Actor" text NOT NULL,
    CONSTRAINT "Esta_Rol_check" CHECK ((("Rol" = 'Antagonista'::text) OR ("Rol" = 'Protagonista'::text) OR ("Rol" = 'Secundario'::text))),
    CONSTRAINT "Esta_Tipo_Actor_check" CHECK ((("Tipo_Actor" = 'Interpretado'::text) OR ("Tipo_Actor" = 'Presta su voz'::text)))
);
    DROP TABLE public."Esta";
       public         heap    postgres    false            �            1259    21291    Estado    TABLE        CREATE TABLE public."Estado" (
    "Id_Estado" integer NOT NULL,
    "Nombre" text NOT NULL,
    "Id_Pais" integer NOT NULL
);
    DROP TABLE public."Estado";
       public         heap    postgres    false            �            1259    21296    Estado_Id_Estado_seq    SEQUENCE     �   CREATE SEQUENCE public."Estado_Id_Estado_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public."Estado_Id_Estado_seq";
       public          postgres    false    225            p           0    0    Estado_Id_Estado_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public."Estado_Id_Estado_seq" OWNED BY public."Estado"."Id_Estado";
          public          postgres    false    226            �            1259    21297    Heroe    TABLE     6  CREATE TABLE public."Heroe" (
    "N_Heroe" text NOT NULL,
    "Alias" text NOT NULL,
    "Logotipo" text,
    "Color_Traje" text,
    "Archienemigo" text,
    CONSTRAINT "Heroe_Color_Traje_check" CHECK ((("Color_Traje" !~~ '%0%'::text) AND ("Color_Traje" !~~ '%1%'::text) AND ("Color_Traje" !~~ '%2%'::text) AND ("Color_Traje" !~~ '%3%'::text) AND ("Color_Traje" !~~ '%4%'::text) AND ("Color_Traje" !~~ '%5%'::text) AND ("Color_Traje" !~~ '%6%'::text) AND ("Color_Traje" !~~ '%7%'::text) AND ("Color_Traje" !~~ '%8%'::text) AND ("Color_Traje" !~~ '%9%'::text)))
);
    DROP TABLE public."Heroe";
       public         heap    postgres    false            �            1259    21303 	   Historial    TABLE     1  CREATE TABLE public."Historial" (
    "N_Titulo" text NOT NULL,
    "Id_Perfil" integer NOT NULL,
    "Calificacion" integer NOT NULL,
    "Hora_Inicio" date NOT NULL,
    "Hora_Fin" date NOT NULL,
    CONSTRAINT "Historial_Calificacion_check" CHECK ((("Calificacion" >= 1) AND ("Calificacion" <= 5)))
);
    DROP TABLE public."Historial";
       public         heap    postgres    false            �            1259    21309    Juego    TABLE     y   CREATE TABLE public."Juego" (
    "T_Juego" text NOT NULL,
    "Distribuidor" text NOT NULL,
    "Tipo" text NOT NULL
);
    DROP TABLE public."Juego";
       public         heap    postgres    false            �            1259    21314    Medio    TABLE     )  CREATE TABLE public."Medio" (
    "Titulo" text NOT NULL,
    "Fecha_Estreno" date NOT NULL,
    "Compania" text NOT NULL,
    "Rating" integer NOT NULL,
    "Sinopsis" text NOT NULL,
    "Imagen" text NOT NULL,
    CONSTRAINT "Medio_Rating_check" CHECK ((("Rating" >= 1) AND ("Rating" <= 5)))
);
    DROP TABLE public."Medio";
       public         heap    postgres    false            �            1259    21320    Nacionalidad    TABLE     @   CREATE TABLE public."Nacionalidad" (
    "Nac" text NOT NULL
);
 "   DROP TABLE public."Nacionalidad";
       public         heap    postgres    false            �            1259    21325    Objeto    TABLE     �   CREATE TABLE public."Objeto" (
    "Nombre" text NOT NULL,
    "Descripcion" text,
    "Material" text,
    "Tipo" text NOT NULL,
    "Imagen" text NOT NULL,
    "N_Personaje" text
);
    DROP TABLE public."Objeto";
       public         heap    postgres    false            �            1259    21330 	   Ocupacion    TABLE     >   CREATE TABLE public."Ocupacion" (
    "Ocup" text NOT NULL
);
    DROP TABLE public."Ocupacion";
       public         heap    postgres    false            �            1259    21335    Organizacion    TABLE       CREATE TABLE public."Organizacion" (
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
       public         heap    postgres    false            �            1259    21340    Pais    TABLE     [   CREATE TABLE public."Pais" (
    "Id_Pais" integer NOT NULL,
    "Nombre" text NOT NULL
);
    DROP TABLE public."Pais";
       public         heap    postgres    false            �            1259    21345    Pais_Id_Pais_seq    SEQUENCE     �   CREATE SEQUENCE public."Pais_Id_Pais_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public."Pais_Id_Pais_seq";
       public          postgres    false    235            q           0    0    Pais_Id_Pais_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public."Pais_Id_Pais_seq" OWNED BY public."Pais"."Id_Pais";
          public          postgres    false    236            �            1259    21346    Pelicula    TABLE     �  CREATE TABLE public."Pelicula" (
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
       public         heap    postgres    false            �            1259    21354    Perfil    TABLE       CREATE TABLE public."Perfil" (
    "Id_Perfil" integer NOT NULL,
    "Dispositivo" text NOT NULL,
    "Nombre" text NOT NULL,
    "Idioma" text NOT NULL,
    "Email" text NOT NULL,
    "Imagen" text NOT NULL,
    CONSTRAINT "Perfil_Id_Perfil_check" CHECK (("Id_Perfil" >= 0))
);
    DROP TABLE public."Perfil";
       public         heap    postgres    false            �            1259    21360    Perfil_Id_Perfil_seq    SEQUENCE     �   CREATE SEQUENCE public."Perfil_Id_Perfil_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public."Perfil_Id_Perfil_seq";
       public          postgres    false    238            r           0    0    Perfil_Id_Perfil_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public."Perfil_Id_Perfil_seq" OWNED BY public."Perfil"."Id_Perfil";
          public          postgres    false    239            �            1259    21361    Pers_Creador    TABLE     g   CREATE TABLE public."Pers_Creador" (
    "N_Personaje" text NOT NULL,
    "N_Creador" text NOT NULL
);
 "   DROP TABLE public."Pers_Creador";
       public         heap    postgres    false            �            1259    21366    Pers_Nac    TABLE     f   CREATE TABLE public."Pers_Nac" (
    "N_Personaje" text NOT NULL,
    "Nacionalidad" text NOT NULL
);
    DROP TABLE public."Pers_Nac";
       public         heap    postgres    false            �            1259    21371    Pers_Oc    TABLE     b   CREATE TABLE public."Pers_Oc" (
    "N_Personaje" text NOT NULL,
    "Ocupacion" text NOT NULL
);
    DROP TABLE public."Pers_Oc";
       public         heap    postgres    false            �            1259    21376 	   Personaje    TABLE     X  CREATE TABLE public."Personaje" (
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
       public         heap    postgres    false            �            1259    21385 	   Pertenece    TABLE     �   CREATE TABLE public."Pertenece" (
    "N_Personaje" text NOT NULL,
    "N_Organizacion" text NOT NULL,
    "Cod_Cargo" integer NOT NULL
);
    DROP TABLE public."Pertenece";
       public         heap    postgres    false            �            1259    21390 
   Plat_Juego    TABLE     b   CREATE TABLE public."Plat_Juego" (
    "T_Juego" text NOT NULL,
    "Plataforma" text NOT NULL
);
     DROP TABLE public."Plat_Juego";
       public         heap    postgres    false            �            1259    21395 
   Plataforma    TABLE     ?   CREATE TABLE public."Plataforma" (
    nombre text NOT NULL
);
     DROP TABLE public."Plataforma";
       public         heap    postgres    false            �            1259    21400    Poder    TABLE     p   CREATE TABLE public."Poder" (
    "Nombre" text NOT NULL,
    "Imagen" text NOT NULL,
    "Descripcion" text
);
    DROP TABLE public."Poder";
       public         heap    postgres    false            �            1259    21405    Posee    TABLE       CREATE TABLE public."Posee" (
    "N_Personaje" text NOT NULL,
    "N_Poder" text NOT NULL,
    "Obtencion" text NOT NULL,
    CONSTRAINT "Posee_Obtencion_check" CHECK ((("Obtencion" = 'Natural'::text) OR ("Obtencion" = 'Artificial'::text) OR ("Obtencion" = 'Hereditario'::text)))
);
    DROP TABLE public."Posee";
       public         heap    postgres    false            �            1259    21411    RelacionadoHer    TABLE     c   CREATE TABLE public."RelacionadoHer" (
    "N_Civil" text NOT NULL,
    "N_Heroe" text NOT NULL
);
 $   DROP TABLE public."RelacionadoHer";
       public         heap    postgres    false            �            1259    21416    RelacionadoVill    TABLE     f   CREATE TABLE public."RelacionadoVill" (
    "N_Civil" text NOT NULL,
    "N_Villano" text NOT NULL
);
 %   DROP TABLE public."RelacionadoVill";
       public         heap    postgres    false            �            1259    21421    Sede    TABLE     �   CREATE TABLE public."Sede" (
    "Nombre" text NOT NULL,
    "Tipo_Edif" text,
    "Ubicacion" text NOT NULL,
    "Imagen" text NOT NULL,
    "N_Org" text NOT NULL
);
    DROP TABLE public."Sede";
       public         heap    postgres    false            �            1259    21426    Serie    TABLE     �   CREATE TABLE public."Serie" (
    "T_Serie" text NOT NULL,
    "N_Episodios" integer NOT NULL,
    "Creador" text NOT NULL,
    "Canal" text NOT NULL
);
    DROP TABLE public."Serie";
       public         heap    postgres    false            �            1259    21431    Suscripcion    TABLE     �  CREATE TABLE public."Suscripcion" (
    "ID" integer NOT NULL,
    "Tarifa" real NOT NULL,
    "Descripcion" text NOT NULL,
    "Tipo" text NOT NULL,
    CONSTRAINT "Suscripcion_Tarifa_check" CHECK (("Tarifa" >= (0)::double precision)),
    CONSTRAINT "Suscripcion_Tipo_check" CHECK ((("Tipo" = 'Gold'::text) OR ("Tipo" = 'Vip'::text) OR ("Tipo" = 'Premium'::text) OR ("Tipo" = 'Free'::text)))
);
 !   DROP TABLE public."Suscripcion";
       public         heap    postgres    false            �            1259    21438    Tarjeta    TABLE     F  CREATE TABLE public."Tarjeta" (
    "N_Tarjeta" text NOT NULL,
    "Cod_Seguridad" integer NOT NULL,
    "Fecha_Ven" date NOT NULL,
    CONSTRAINT "Tarjeta_Cod_Seguridad_check" CHECK ((("Cod_Seguridad" >= 100) AND ("Cod_Seguridad" <= 999))),
    CONSTRAINT "Tarjeta_N_Tarjeta_check" CHECK ((char_length("N_Tarjeta") = 16))
);
    DROP TABLE public."Tarjeta";
       public         heap    postgres    false            �            1259    21444    Usuario    TABLE     �  CREATE TABLE public."Usuario" (
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
       public         heap    postgres    false                        1259    21450    Villano    TABLE     q   CREATE TABLE public."Villano" (
    "N_Villano" text NOT NULL,
    "Alias" text NOT NULL,
    "Objetivo" text
);
    DROP TABLE public."Villano";
       public         heap    postgres    false            �           2604    21455    Cargo Cod_Cargo    DEFAULT     x   ALTER TABLE ONLY public."Cargo" ALTER COLUMN "Cod_Cargo" SET DEFAULT nextval('public."Cargo_Cod_Cargo_seq"'::regclass);
 B   ALTER TABLE public."Cargo" ALTER COLUMN "Cod_Cargo" DROP DEFAULT;
       public          postgres    false    216    215            �           2604    21456    Ciudad Id_Ciudad    DEFAULT     z   ALTER TABLE ONLY public."Ciudad" ALTER COLUMN "Id_Ciudad" SET DEFAULT nextval('public."Ciudad_Id_Ciudad_seq"'::regclass);
 C   ALTER TABLE public."Ciudad" ALTER COLUMN "Id_Ciudad" DROP DEFAULT;
       public          postgres    false    218    217            �           2604    21457    Estado Id_Estado    DEFAULT     z   ALTER TABLE ONLY public."Estado" ALTER COLUMN "Id_Estado" SET DEFAULT nextval('public."Estado_Id_Estado_seq"'::regclass);
 C   ALTER TABLE public."Estado" ALTER COLUMN "Id_Estado" DROP DEFAULT;
       public          postgres    false    226    225                        2604    21458    Pais Id_Pais    DEFAULT     r   ALTER TABLE ONLY public."Pais" ALTER COLUMN "Id_Pais" SET DEFAULT nextval('public."Pais_Id_Pais_seq"'::regclass);
 ?   ALTER TABLE public."Pais" ALTER COLUMN "Id_Pais" DROP DEFAULT;
       public          postgres    false    236    235                       2604    21459    Perfil Id_Perfil    DEFAULT     z   ALTER TABLE ONLY public."Perfil" ALTER COLUMN "Id_Perfil" SET DEFAULT nextval('public."Perfil_Id_Perfil_seq"'::regclass);
 C   ALTER TABLE public."Perfil" ALTER COLUMN "Id_Perfil" DROP DEFAULT;
       public          postgres    false    239    238            =          0    21241    Aparece 
   TABLE DATA           R   COPY public."Aparece" ("N_Organizacion", "N_Titulo", "Estado", "Rol") FROM stdin;
    public          postgres    false    214   T      >          0    21247    Cargo 
   TABLE DATA           =   COPY public."Cargo" ("Cod_Cargo", "Descripcion") FROM stdin;
    public          postgres    false    215   q      @          0    21253    Ciudad 
   TABLE DATA           F   COPY public."Ciudad" ("Id_Ciudad", "Nombre", "Id_Estado") FROM stdin;
    public          postgres    false    217   �      B          0    21259    Civil 
   TABLE DATA           ,   COPY public."Civil" ("N_Civil") FROM stdin;
    public          postgres    false    219   �      C          0    21264    Combate 
   TABLE DATA           [   COPY public."Combate" ("N_Personaje", "N_Poder", "N_Objeto", "Lugar", "Fecha") FROM stdin;
    public          postgres    false    220   �      D          0    21269    Crea 
   TABLE DATA           ;   COPY public."Crea" ("N_Personaje", "N_Objeto") FROM stdin;
    public          postgres    false    221         E          0    21274    Creador 
   TABLE DATA           2   COPY public."Creador" ("Nom_Creador") FROM stdin;
    public          postgres    false    222   7      F          0    21279    Enfrenta 
   TABLE DATA           <   COPY public."Enfrenta" ("N_Heroe", "N_Villano") FROM stdin;
    public          postgres    false    223   T      G          0    21284    Esta 
   TABLE DATA           Y   COPY public."Esta" ("N_Personaje", "N_Titulo", "Tipo_Actor", "Rol", "Actor") FROM stdin;
    public          postgres    false    224   q      H          0    21291    Estado 
   TABLE DATA           D   COPY public."Estado" ("Id_Estado", "Nombre", "Id_Pais") FROM stdin;
    public          postgres    false    225   �      J          0    21297    Heroe 
   TABLE DATA           `   COPY public."Heroe" ("N_Heroe", "Alias", "Logotipo", "Color_Traje", "Archienemigo") FROM stdin;
    public          postgres    false    227   �      K          0    21303 	   Historial 
   TABLE DATA           i   COPY public."Historial" ("N_Titulo", "Id_Perfil", "Calificacion", "Hora_Inicio", "Hora_Fin") FROM stdin;
    public          postgres    false    228         L          0    21309    Juego 
   TABLE DATA           D   COPY public."Juego" ("T_Juego", "Distribuidor", "Tipo") FROM stdin;
    public          postgres    false    229   ,      M          0    21314    Medio 
   TABLE DATA           h   COPY public."Medio" ("Titulo", "Fecha_Estreno", "Compania", "Rating", "Sinopsis", "Imagen") FROM stdin;
    public          postgres    false    230   I      N          0    21320    Nacionalidad 
   TABLE DATA           /   COPY public."Nacionalidad" ("Nac") FROM stdin;
    public          postgres    false    231   f      O          0    21325    Objeto 
   TABLE DATA           h   COPY public."Objeto" ("Nombre", "Descripcion", "Material", "Tipo", "Imagen", "N_Personaje") FROM stdin;
    public          postgres    false    232   �      P          0    21330 	   Ocupacion 
   TABLE DATA           -   COPY public."Ocupacion" ("Ocup") FROM stdin;
    public          postgres    false    233   �      Q          0    21335    Organizacion 
   TABLE DATA           �   COPY public."Organizacion" ("Nombre", "Eslogan", "Lider", "Fundador", "Tipo", "Nom_Comic", "Imagen", "Objetivo", "Lugar_Creacion") FROM stdin;
    public          postgres    false    234   �      R          0    21340    Pais 
   TABLE DATA           5   COPY public."Pais" ("Id_Pais", "Nombre") FROM stdin;
    public          postgres    false    235   �      T          0    21346    Pelicula 
   TABLE DATA           o   COPY public."Pelicula" ("T_Pelicula", "Director", "Duracion", "Coste", "Ganancia", "Distribuidor") FROM stdin;
    public          postgres    false    237         U          0    21354    Perfil 
   TABLE DATA           e   COPY public."Perfil" ("Id_Perfil", "Dispositivo", "Nombre", "Idioma", "Email", "Imagen") FROM stdin;
    public          postgres    false    238   +      W          0    21361    Pers_Creador 
   TABLE DATA           D   COPY public."Pers_Creador" ("N_Personaje", "N_Creador") FROM stdin;
    public          postgres    false    240   �8      X          0    21366    Pers_Nac 
   TABLE DATA           C   COPY public."Pers_Nac" ("N_Personaje", "Nacionalidad") FROM stdin;
    public          postgres    false    241   9      Y          0    21371    Pers_Oc 
   TABLE DATA           ?   COPY public."Pers_Oc" ("N_Personaje", "Ocupacion") FROM stdin;
    public          postgres    false    242   29      Z          0    21376 	   Personaje 
   TABLE DATA           w   COPY public."Personaje" ("Nombre", "Genero", "Color_Ojos", "Color_Pelo", "Nom_Comic", "E_Marital", imagen) FROM stdin;
    public          postgres    false    243   O9      [          0    21385 	   Pertenece 
   TABLE DATA           S   COPY public."Pertenece" ("N_Personaje", "N_Organizacion", "Cod_Cargo") FROM stdin;
    public          postgres    false    244   l9      \          0    21390 
   Plat_Juego 
   TABLE DATA           ?   COPY public."Plat_Juego" ("T_Juego", "Plataforma") FROM stdin;
    public          postgres    false    245   �9      ]          0    21395 
   Plataforma 
   TABLE DATA           .   COPY public."Plataforma" (nombre) FROM stdin;
    public          postgres    false    246   �9      ^          0    21400    Poder 
   TABLE DATA           D   COPY public."Poder" ("Nombre", "Imagen", "Descripcion") FROM stdin;
    public          postgres    false    247   �9      _          0    21405    Posee 
   TABLE DATA           H   COPY public."Posee" ("N_Personaje", "N_Poder", "Obtencion") FROM stdin;
    public          postgres    false    248   �9      `          0    21411    RelacionadoHer 
   TABLE DATA           @   COPY public."RelacionadoHer" ("N_Civil", "N_Heroe") FROM stdin;
    public          postgres    false    249   �9      a          0    21416    RelacionadoVill 
   TABLE DATA           C   COPY public."RelacionadoVill" ("N_Civil", "N_Villano") FROM stdin;
    public          postgres    false    250   :      b          0    21421    Sede 
   TABLE DATA           W   COPY public."Sede" ("Nombre", "Tipo_Edif", "Ubicacion", "Imagen", "N_Org") FROM stdin;
    public          postgres    false    251   7:      c          0    21426    Serie 
   TABLE DATA           O   COPY public."Serie" ("T_Serie", "N_Episodios", "Creador", "Canal") FROM stdin;
    public          postgres    false    252   T:      d          0    21431    Suscripcion 
   TABLE DATA           N   COPY public."Suscripcion" ("ID", "Tarifa", "Descripcion", "Tipo") FROM stdin;
    public          postgres    false    253   q:      e          0    21438    Tarjeta 
   TABLE DATA           N   COPY public."Tarjeta" ("N_Tarjeta", "Cod_Seguridad", "Fecha_Ven") FROM stdin;
    public          postgres    false    254   �:      f          0    21444    Usuario 
   TABLE DATA           �   COPY public."Usuario" ("Email", "Contrasena", "Nombre", "Apellido", "Fecha_Nac", "Fecha_Creacion", "Id_Suscripcion", "N_Tarjeta", "Direccion") FROM stdin;
    public          postgres    false    255   ;      g          0    21450    Villano 
   TABLE DATA           E   COPY public."Villano" ("N_Villano", "Alias", "Objetivo") FROM stdin;
    public          postgres    false    256   �;      s           0    0    Cargo_Cod_Cargo_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public."Cargo_Cod_Cargo_seq"', 1, false);
          public          postgres    false    216            t           0    0    Ciudad_Id_Ciudad_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public."Ciudad_Id_Ciudad_seq"', 4, true);
          public          postgres    false    218            u           0    0    Estado_Id_Estado_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public."Estado_Id_Estado_seq"', 3, true);
          public          postgres    false    226            v           0    0    Pais_Id_Pais_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public."Pais_Id_Pais_seq"', 2, true);
          public          postgres    false    236            w           0    0    Perfil_Id_Perfil_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public."Perfil_Id_Perfil_seq"', 26, true);
          public          postgres    false    239                       2606    21466    Aparece Aparece_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public."Aparece"
    ADD CONSTRAINT "Aparece_pkey" PRIMARY KEY ("N_Organizacion", "N_Titulo");
 B   ALTER TABLE ONLY public."Aparece" DROP CONSTRAINT "Aparece_pkey";
       public            postgres    false    214    214                       2606    21468    Cargo Cargo_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public."Cargo"
    ADD CONSTRAINT "Cargo_pkey" PRIMARY KEY ("Cod_Cargo");
 >   ALTER TABLE ONLY public."Cargo" DROP CONSTRAINT "Cargo_pkey";
       public            postgres    false    215                       2606    21470    Ciudad Ciudad_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public."Ciudad"
    ADD CONSTRAINT "Ciudad_pkey" PRIMARY KEY ("Id_Ciudad");
 @   ALTER TABLE ONLY public."Ciudad" DROP CONSTRAINT "Ciudad_pkey";
       public            postgres    false    217                       2606    21472    Civil Civil_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public."Civil"
    ADD CONSTRAINT "Civil_pkey" PRIMARY KEY ("N_Civil");
 >   ALTER TABLE ONLY public."Civil" DROP CONSTRAINT "Civil_pkey";
       public            postgres    false    219                       2606    21474    Combate Combate_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public."Combate"
    ADD CONSTRAINT "Combate_pkey" PRIMARY KEY ("N_Personaje", "N_Poder", "N_Objeto");
 B   ALTER TABLE ONLY public."Combate" DROP CONSTRAINT "Combate_pkey";
       public            postgres    false    220    220    220            !           2606    21476    Crea Crea_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY public."Crea"
    ADD CONSTRAINT "Crea_pkey" PRIMARY KEY ("N_Personaje", "N_Objeto");
 <   ALTER TABLE ONLY public."Crea" DROP CONSTRAINT "Crea_pkey";
       public            postgres    false    221    221            #           2606    21478    Creador Creador_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public."Creador"
    ADD CONSTRAINT "Creador_pkey" PRIMARY KEY ("Nom_Creador");
 B   ALTER TABLE ONLY public."Creador" DROP CONSTRAINT "Creador_pkey";
       public            postgres    false    222            %           2606    21480    Enfrenta Enfrenta_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public."Enfrenta"
    ADD CONSTRAINT "Enfrenta_pkey" PRIMARY KEY ("N_Heroe", "N_Villano");
 D   ALTER TABLE ONLY public."Enfrenta" DROP CONSTRAINT "Enfrenta_pkey";
       public            postgres    false    223    223            '           2606    21482    Esta Esta_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY public."Esta"
    ADD CONSTRAINT "Esta_pkey" PRIMARY KEY ("N_Personaje", "N_Titulo");
 <   ALTER TABLE ONLY public."Esta" DROP CONSTRAINT "Esta_pkey";
       public            postgres    false    224    224            )           2606    21484    Estado Estado_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public."Estado"
    ADD CONSTRAINT "Estado_pkey" PRIMARY KEY ("Id_Estado");
 @   ALTER TABLE ONLY public."Estado" DROP CONSTRAINT "Estado_pkey";
       public            postgres    false    225            +           2606    21486    Heroe Heroe_Alias_key 
   CONSTRAINT     W   ALTER TABLE ONLY public."Heroe"
    ADD CONSTRAINT "Heroe_Alias_key" UNIQUE ("Alias");
 C   ALTER TABLE ONLY public."Heroe" DROP CONSTRAINT "Heroe_Alias_key";
       public            postgres    false    227            -           2606    21488    Heroe Heroe_Logotipo_key 
   CONSTRAINT     ]   ALTER TABLE ONLY public."Heroe"
    ADD CONSTRAINT "Heroe_Logotipo_key" UNIQUE ("Logotipo");
 F   ALTER TABLE ONLY public."Heroe" DROP CONSTRAINT "Heroe_Logotipo_key";
       public            postgres    false    227            /           2606    21490    Heroe Heroe_N_Heroe_key 
   CONSTRAINT     [   ALTER TABLE ONLY public."Heroe"
    ADD CONSTRAINT "Heroe_N_Heroe_key" UNIQUE ("N_Heroe");
 E   ALTER TABLE ONLY public."Heroe" DROP CONSTRAINT "Heroe_N_Heroe_key";
       public            postgres    false    227            1           2606    21492    Historial Historial_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY public."Historial"
    ADD CONSTRAINT "Historial_pkey" PRIMARY KEY ("N_Titulo", "Id_Perfil");
 F   ALTER TABLE ONLY public."Historial" DROP CONSTRAINT "Historial_pkey";
       public            postgres    false    228    228            3           2606    21494    Juego Juego_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public."Juego"
    ADD CONSTRAINT "Juego_pkey" PRIMARY KEY ("T_Juego");
 >   ALTER TABLE ONLY public."Juego" DROP CONSTRAINT "Juego_pkey";
       public            postgres    false    229            5           2606    21496    Medio Medio_Imagen_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public."Medio"
    ADD CONSTRAINT "Medio_Imagen_key" UNIQUE ("Imagen");
 D   ALTER TABLE ONLY public."Medio" DROP CONSTRAINT "Medio_Imagen_key";
       public            postgres    false    230            7           2606    21498    Medio Medio_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public."Medio"
    ADD CONSTRAINT "Medio_pkey" PRIMARY KEY ("Titulo");
 >   ALTER TABLE ONLY public."Medio" DROP CONSTRAINT "Medio_pkey";
       public            postgres    false    230            9           2606    21500    Nacionalidad Nacionalidad_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public."Nacionalidad"
    ADD CONSTRAINT "Nacionalidad_pkey" PRIMARY KEY ("Nac");
 L   ALTER TABLE ONLY public."Nacionalidad" DROP CONSTRAINT "Nacionalidad_pkey";
       public            postgres    false    231            ;           2606    21502    Objeto Objeto_Imagen_key 
   CONSTRAINT     [   ALTER TABLE ONLY public."Objeto"
    ADD CONSTRAINT "Objeto_Imagen_key" UNIQUE ("Imagen");
 F   ALTER TABLE ONLY public."Objeto" DROP CONSTRAINT "Objeto_Imagen_key";
       public            postgres    false    232            =           2606    21504    Objeto Objeto_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public."Objeto"
    ADD CONSTRAINT "Objeto_pkey" PRIMARY KEY ("Nombre");
 @   ALTER TABLE ONLY public."Objeto" DROP CONSTRAINT "Objeto_pkey";
       public            postgres    false    232            ?           2606    21506    Ocupacion Ocupacion_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public."Ocupacion"
    ADD CONSTRAINT "Ocupacion_pkey" PRIMARY KEY ("Ocup");
 F   ALTER TABLE ONLY public."Ocupacion" DROP CONSTRAINT "Ocupacion_pkey";
       public            postgres    false    233            A           2606    21508 &   Organizacion Organizacion_Fundador_key 
   CONSTRAINT     k   ALTER TABLE ONLY public."Organizacion"
    ADD CONSTRAINT "Organizacion_Fundador_key" UNIQUE ("Fundador");
 T   ALTER TABLE ONLY public."Organizacion" DROP CONSTRAINT "Organizacion_Fundador_key";
       public            postgres    false    234            C           2606    21510 $   Organizacion Organizacion_Imagen_key 
   CONSTRAINT     g   ALTER TABLE ONLY public."Organizacion"
    ADD CONSTRAINT "Organizacion_Imagen_key" UNIQUE ("Imagen");
 R   ALTER TABLE ONLY public."Organizacion" DROP CONSTRAINT "Organizacion_Imagen_key";
       public            postgres    false    234            E           2606    21512 #   Organizacion Organizacion_Lider_key 
   CONSTRAINT     e   ALTER TABLE ONLY public."Organizacion"
    ADD CONSTRAINT "Organizacion_Lider_key" UNIQUE ("Lider");
 Q   ALTER TABLE ONLY public."Organizacion" DROP CONSTRAINT "Organizacion_Lider_key";
       public            postgres    false    234            G           2606    21514    Organizacion Organizacion_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public."Organizacion"
    ADD CONSTRAINT "Organizacion_pkey" PRIMARY KEY ("Nombre");
 L   ALTER TABLE ONLY public."Organizacion" DROP CONSTRAINT "Organizacion_pkey";
       public            postgres    false    234            I           2606    21516    Pais Pais_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public."Pais"
    ADD CONSTRAINT "Pais_pkey" PRIMARY KEY ("Id_Pais");
 <   ALTER TABLE ONLY public."Pais" DROP CONSTRAINT "Pais_pkey";
       public            postgres    false    235            K           2606    21518    Pelicula Pelicula_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public."Pelicula"
    ADD CONSTRAINT "Pelicula_pkey" PRIMARY KEY ("T_Pelicula");
 D   ALTER TABLE ONLY public."Pelicula" DROP CONSTRAINT "Pelicula_pkey";
       public            postgres    false    237            M           2606    21520    Perfil Perfil_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public."Perfil"
    ADD CONSTRAINT "Perfil_pkey" PRIMARY KEY ("Id_Perfil");
 @   ALTER TABLE ONLY public."Perfil" DROP CONSTRAINT "Perfil_pkey";
       public            postgres    false    238            O           2606    21522    Pers_Creador Pers_Creador_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public."Pers_Creador"
    ADD CONSTRAINT "Pers_Creador_pkey" PRIMARY KEY ("N_Personaje", "N_Creador");
 L   ALTER TABLE ONLY public."Pers_Creador" DROP CONSTRAINT "Pers_Creador_pkey";
       public            postgres    false    240    240            Q           2606    21524    Pers_Nac Pers_Nac_pkey 
   CONSTRAINT     s   ALTER TABLE ONLY public."Pers_Nac"
    ADD CONSTRAINT "Pers_Nac_pkey" PRIMARY KEY ("N_Personaje", "Nacionalidad");
 D   ALTER TABLE ONLY public."Pers_Nac" DROP CONSTRAINT "Pers_Nac_pkey";
       public            postgres    false    241    241            S           2606    21526    Pers_Oc Pers_Oc_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public."Pers_Oc"
    ADD CONSTRAINT "Pers_Oc_pkey" PRIMARY KEY ("N_Personaje", "Ocupacion");
 B   ALTER TABLE ONLY public."Pers_Oc" DROP CONSTRAINT "Pers_Oc_pkey";
       public            postgres    false    242    242            U           2606    21528    Personaje Personaje_Nombre_key 
   CONSTRAINT     a   ALTER TABLE ONLY public."Personaje"
    ADD CONSTRAINT "Personaje_Nombre_key" UNIQUE ("Nombre");
 L   ALTER TABLE ONLY public."Personaje" DROP CONSTRAINT "Personaje_Nombre_key";
       public            postgres    false    243            W           2606    21530    Personaje Personaje_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public."Personaje"
    ADD CONSTRAINT "Personaje_pkey" PRIMARY KEY ("Nombre");
 F   ALTER TABLE ONLY public."Personaje" DROP CONSTRAINT "Personaje_pkey";
       public            postgres    false    243            Y           2606    21532    Pertenece Pertenece_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public."Pertenece"
    ADD CONSTRAINT "Pertenece_pkey" PRIMARY KEY ("N_Personaje", "N_Organizacion", "Cod_Cargo");
 F   ALTER TABLE ONLY public."Pertenece" DROP CONSTRAINT "Pertenece_pkey";
       public            postgres    false    244    244    244            [           2606    21534    Plat_Juego Plat_Juego_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY public."Plat_Juego"
    ADD CONSTRAINT "Plat_Juego_pkey" PRIMARY KEY ("T_Juego", "Plataforma");
 H   ALTER TABLE ONLY public."Plat_Juego" DROP CONSTRAINT "Plat_Juego_pkey";
       public            postgres    false    245    245            ]           2606    21536    Plataforma Plataforma_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public."Plataforma"
    ADD CONSTRAINT "Plataforma_pkey" PRIMARY KEY (nombre);
 H   ALTER TABLE ONLY public."Plataforma" DROP CONSTRAINT "Plataforma_pkey";
       public            postgres    false    246            _           2606    21538    Poder Poder_Imagen_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public."Poder"
    ADD CONSTRAINT "Poder_Imagen_key" UNIQUE ("Imagen");
 D   ALTER TABLE ONLY public."Poder" DROP CONSTRAINT "Poder_Imagen_key";
       public            postgres    false    247            a           2606    21540    Poder Poder_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public."Poder"
    ADD CONSTRAINT "Poder_pkey" PRIMARY KEY ("Nombre");
 >   ALTER TABLE ONLY public."Poder" DROP CONSTRAINT "Poder_pkey";
       public            postgres    false    247            c           2606    21542    Posee Posee_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public."Posee"
    ADD CONSTRAINT "Posee_pkey" PRIMARY KEY ("N_Personaje", "N_Poder");
 >   ALTER TABLE ONLY public."Posee" DROP CONSTRAINT "Posee_pkey";
       public            postgres    false    248    248            e           2606    21544 "   RelacionadoHer RelacionadoHer_pkey 
   CONSTRAINT     v   ALTER TABLE ONLY public."RelacionadoHer"
    ADD CONSTRAINT "RelacionadoHer_pkey" PRIMARY KEY ("N_Civil", "N_Heroe");
 P   ALTER TABLE ONLY public."RelacionadoHer" DROP CONSTRAINT "RelacionadoHer_pkey";
       public            postgres    false    249    249            g           2606    21546 $   RelacionadoVill RelacionadoVill_pkey 
   CONSTRAINT     z   ALTER TABLE ONLY public."RelacionadoVill"
    ADD CONSTRAINT "RelacionadoVill_pkey" PRIMARY KEY ("N_Civil", "N_Villano");
 R   ALTER TABLE ONLY public."RelacionadoVill" DROP CONSTRAINT "RelacionadoVill_pkey";
       public            postgres    false    250    250            i           2606    21548    Sede Sede_Imagen_key 
   CONSTRAINT     W   ALTER TABLE ONLY public."Sede"
    ADD CONSTRAINT "Sede_Imagen_key" UNIQUE ("Imagen");
 B   ALTER TABLE ONLY public."Sede" DROP CONSTRAINT "Sede_Imagen_key";
       public            postgres    false    251            k           2606    21550    Sede Sede_Nombre_key 
   CONSTRAINT     W   ALTER TABLE ONLY public."Sede"
    ADD CONSTRAINT "Sede_Nombre_key" UNIQUE ("Nombre");
 B   ALTER TABLE ONLY public."Sede" DROP CONSTRAINT "Sede_Nombre_key";
       public            postgres    false    251            m           2606    21552    Sede Sede_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public."Sede"
    ADD CONSTRAINT "Sede_pkey" PRIMARY KEY ("Nombre", "N_Org");
 <   ALTER TABLE ONLY public."Sede" DROP CONSTRAINT "Sede_pkey";
       public            postgres    false    251    251            o           2606    21554    Serie Serie_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public."Serie"
    ADD CONSTRAINT "Serie_pkey" PRIMARY KEY ("T_Serie");
 >   ALTER TABLE ONLY public."Serie" DROP CONSTRAINT "Serie_pkey";
       public            postgres    false    252            q           2606    21556    Suscripcion Suscripcion_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public."Suscripcion"
    ADD CONSTRAINT "Suscripcion_pkey" PRIMARY KEY ("ID");
 J   ALTER TABLE ONLY public."Suscripcion" DROP CONSTRAINT "Suscripcion_pkey";
       public            postgres    false    253            s           2606    21558    Tarjeta Tarjeta_N_Tarjeta_key 
   CONSTRAINT     c   ALTER TABLE ONLY public."Tarjeta"
    ADD CONSTRAINT "Tarjeta_N_Tarjeta_key" UNIQUE ("N_Tarjeta");
 K   ALTER TABLE ONLY public."Tarjeta" DROP CONSTRAINT "Tarjeta_N_Tarjeta_key";
       public            postgres    false    254            u           2606    21560    Tarjeta Tarjeta_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public."Tarjeta"
    ADD CONSTRAINT "Tarjeta_pkey" PRIMARY KEY ("N_Tarjeta");
 B   ALTER TABLE ONLY public."Tarjeta" DROP CONSTRAINT "Tarjeta_pkey";
       public            postgres    false    254            w           2606    21562    Usuario Usuario_Apellido_key 
   CONSTRAINT     a   ALTER TABLE ONLY public."Usuario"
    ADD CONSTRAINT "Usuario_Apellido_key" UNIQUE ("Apellido");
 J   ALTER TABLE ONLY public."Usuario" DROP CONSTRAINT "Usuario_Apellido_key";
       public            postgres    false    255            y           2606    21564    Usuario Usuario_Nombre_key 
   CONSTRAINT     ]   ALTER TABLE ONLY public."Usuario"
    ADD CONSTRAINT "Usuario_Nombre_key" UNIQUE ("Nombre");
 H   ALTER TABLE ONLY public."Usuario" DROP CONSTRAINT "Usuario_Nombre_key";
       public            postgres    false    255            {           2606    21566    Usuario Usuario_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public."Usuario"
    ADD CONSTRAINT "Usuario_pkey" PRIMARY KEY ("Email");
 B   ALTER TABLE ONLY public."Usuario" DROP CONSTRAINT "Usuario_pkey";
       public            postgres    false    255            }           2606    21568    Villano Villano_Alias_key 
   CONSTRAINT     [   ALTER TABLE ONLY public."Villano"
    ADD CONSTRAINT "Villano_Alias_key" UNIQUE ("Alias");
 G   ALTER TABLE ONLY public."Villano" DROP CONSTRAINT "Villano_Alias_key";
       public            postgres    false    256                       2606    21570    Villano Villano_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public."Villano"
    ADD CONSTRAINT "Villano_pkey" PRIMARY KEY ("N_Villano");
 B   ALTER TABLE ONLY public."Villano" DROP CONSTRAINT "Villano_pkey";
       public            postgres    false    256            �           2606    21571 #   Aparece Aparece_N_Organizacion_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Aparece"
    ADD CONSTRAINT "Aparece_N_Organizacion_fkey" FOREIGN KEY ("N_Organizacion") REFERENCES public."Organizacion"("Nombre");
 Q   ALTER TABLE ONLY public."Aparece" DROP CONSTRAINT "Aparece_N_Organizacion_fkey";
       public          postgres    false    234    214    3399            �           2606    21576    Aparece Aparece_N_Titulo_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Aparece"
    ADD CONSTRAINT "Aparece_N_Titulo_fkey" FOREIGN KEY ("N_Titulo") REFERENCES public."Medio"("Titulo");
 K   ALTER TABLE ONLY public."Aparece" DROP CONSTRAINT "Aparece_N_Titulo_fkey";
       public          postgres    false    214    3383    230            �           2606    21581    Ciudad Ciudad_Id_Estado_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Ciudad"
    ADD CONSTRAINT "Ciudad_Id_Estado_fkey" FOREIGN KEY ("Id_Estado") REFERENCES public."Estado"("Id_Estado");
 J   ALTER TABLE ONLY public."Ciudad" DROP CONSTRAINT "Ciudad_Id_Estado_fkey";
       public          postgres    false    217    3369    225            �           2606    21586    Civil Civil_N_Civil_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Civil"
    ADD CONSTRAINT "Civil_N_Civil_fkey" FOREIGN KEY ("N_Civil") REFERENCES public."Personaje"("Nombre") NOT VALID;
 F   ALTER TABLE ONLY public."Civil" DROP CONSTRAINT "Civil_N_Civil_fkey";
       public          postgres    false    243    219    3413            �           2606    21591    Combate Combate_N_Objeto_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Combate"
    ADD CONSTRAINT "Combate_N_Objeto_fkey" FOREIGN KEY ("N_Objeto") REFERENCES public."Objeto"("Nombre");
 K   ALTER TABLE ONLY public."Combate" DROP CONSTRAINT "Combate_N_Objeto_fkey";
       public          postgres    false    220    3389    232            �           2606    21596     Combate Combate_N_Personaje_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Combate"
    ADD CONSTRAINT "Combate_N_Personaje_fkey" FOREIGN KEY ("N_Personaje") REFERENCES public."Personaje"("Nombre");
 N   ALTER TABLE ONLY public."Combate" DROP CONSTRAINT "Combate_N_Personaje_fkey";
       public          postgres    false    220    3413    243            �           2606    21601    Combate Combate_N_Poder_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Combate"
    ADD CONSTRAINT "Combate_N_Poder_fkey" FOREIGN KEY ("N_Poder") REFERENCES public."Poder"("Nombre");
 J   ALTER TABLE ONLY public."Combate" DROP CONSTRAINT "Combate_N_Poder_fkey";
       public          postgres    false    220    3425    247            �           2606    21606    Crea Crea_N_Objeto_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Crea"
    ADD CONSTRAINT "Crea_N_Objeto_fkey" FOREIGN KEY ("N_Objeto") REFERENCES public."Objeto"("Nombre");
 E   ALTER TABLE ONLY public."Crea" DROP CONSTRAINT "Crea_N_Objeto_fkey";
       public          postgres    false    221    3389    232            �           2606    21611    Crea Crea_N_Personaje_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Crea"
    ADD CONSTRAINT "Crea_N_Personaje_fkey" FOREIGN KEY ("N_Personaje") REFERENCES public."Personaje"("Nombre");
 H   ALTER TABLE ONLY public."Crea" DROP CONSTRAINT "Crea_N_Personaje_fkey";
       public          postgres    false    221    3413    243            �           2606    21616    Enfrenta Enfrenta_N_Heroe_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Enfrenta"
    ADD CONSTRAINT "Enfrenta_N_Heroe_fkey" FOREIGN KEY ("N_Heroe") REFERENCES public."Heroe"("N_Heroe");
 L   ALTER TABLE ONLY public."Enfrenta" DROP CONSTRAINT "Enfrenta_N_Heroe_fkey";
       public          postgres    false    223    3375    227            �           2606    21621     Enfrenta Enfrenta_N_Villano_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Enfrenta"
    ADD CONSTRAINT "Enfrenta_N_Villano_fkey" FOREIGN KEY ("N_Villano") REFERENCES public."Villano"("N_Villano");
 N   ALTER TABLE ONLY public."Enfrenta" DROP CONSTRAINT "Enfrenta_N_Villano_fkey";
       public          postgres    false    223    3455    256            �           2606    21626    Esta Esta_N_Personaje_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Esta"
    ADD CONSTRAINT "Esta_N_Personaje_fkey" FOREIGN KEY ("N_Personaje") REFERENCES public."Personaje"("Nombre");
 H   ALTER TABLE ONLY public."Esta" DROP CONSTRAINT "Esta_N_Personaje_fkey";
       public          postgres    false    224    3413    243            �           2606    21631    Esta Esta_N_Titulo_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Esta"
    ADD CONSTRAINT "Esta_N_Titulo_fkey" FOREIGN KEY ("N_Titulo") REFERENCES public."Medio"("Titulo");
 E   ALTER TABLE ONLY public."Esta" DROP CONSTRAINT "Esta_N_Titulo_fkey";
       public          postgres    false    224    3383    230            �           2606    21636    Estado Estado_Id_Pais_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Estado"
    ADD CONSTRAINT "Estado_Id_Pais_fkey" FOREIGN KEY ("Id_Pais") REFERENCES public."Pais"("Id_Pais");
 H   ALTER TABLE ONLY public."Estado" DROP CONSTRAINT "Estado_Id_Pais_fkey";
       public          postgres    false    225    3401    235            �           2606    21641    Heroe Heroe_Archienemigo_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Heroe"
    ADD CONSTRAINT "Heroe_Archienemigo_fkey" FOREIGN KEY ("Archienemigo") REFERENCES public."Villano"("N_Villano") NOT VALID;
 K   ALTER TABLE ONLY public."Heroe" DROP CONSTRAINT "Heroe_Archienemigo_fkey";
       public          postgres    false    227    3455    256            �           2606    21646    Heroe Heroe_N_Heroe_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Heroe"
    ADD CONSTRAINT "Heroe_N_Heroe_fkey" FOREIGN KEY ("N_Heroe") REFERENCES public."Personaje"("Nombre") NOT VALID;
 F   ALTER TABLE ONLY public."Heroe" DROP CONSTRAINT "Heroe_N_Heroe_fkey";
       public          postgres    false    227    3413    243            �           2606    21651 "   Historial Historial_Id_Perfil_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Historial"
    ADD CONSTRAINT "Historial_Id_Perfil_fkey" FOREIGN KEY ("Id_Perfil") REFERENCES public."Perfil"("Id_Perfil");
 P   ALTER TABLE ONLY public."Historial" DROP CONSTRAINT "Historial_Id_Perfil_fkey";
       public          postgres    false    228    3405    238            �           2606    21656 !   Historial Historial_N_Titulo_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Historial"
    ADD CONSTRAINT "Historial_N_Titulo_fkey" FOREIGN KEY ("N_Titulo") REFERENCES public."Medio"("Titulo");
 O   ALTER TABLE ONLY public."Historial" DROP CONSTRAINT "Historial_N_Titulo_fkey";
       public          postgres    false    3383    228    230            �           2606    21661    Juego Juego_T_Juego_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Juego"
    ADD CONSTRAINT "Juego_T_Juego_fkey" FOREIGN KEY ("T_Juego") REFERENCES public."Medio"("Titulo") NOT VALID;
 F   ALTER TABLE ONLY public."Juego" DROP CONSTRAINT "Juego_T_Juego_fkey";
       public          postgres    false    3383    230    229            �           2606    21666    Objeto Objeto_N_Personaje_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Objeto"
    ADD CONSTRAINT "Objeto_N_Personaje_fkey" FOREIGN KEY ("N_Personaje") REFERENCES public."Personaje"("Nombre") NOT VALID;
 L   ALTER TABLE ONLY public."Objeto" DROP CONSTRAINT "Objeto_N_Personaje_fkey";
       public          postgres    false    3413    232    243            �           2606    21671 '   Organizacion Organizacion_Fundador_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Organizacion"
    ADD CONSTRAINT "Organizacion_Fundador_fkey" FOREIGN KEY ("Fundador") REFERENCES public."Personaje"("Nombre") NOT VALID;
 U   ALTER TABLE ONLY public."Organizacion" DROP CONSTRAINT "Organizacion_Fundador_fkey";
       public          postgres    false    234    243    3413            �           2606    21676 $   Organizacion Organizacion_Lider_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Organizacion"
    ADD CONSTRAINT "Organizacion_Lider_fkey" FOREIGN KEY ("Lider") REFERENCES public."Personaje"("Nombre") NOT VALID;
 R   ALTER TABLE ONLY public."Organizacion" DROP CONSTRAINT "Organizacion_Lider_fkey";
       public          postgres    false    3413    243    234            �           2606    21681 !   Pelicula Pelicula_T_Pelicula_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Pelicula"
    ADD CONSTRAINT "Pelicula_T_Pelicula_fkey" FOREIGN KEY ("T_Pelicula") REFERENCES public."Medio"("Titulo") NOT VALID;
 O   ALTER TABLE ONLY public."Pelicula" DROP CONSTRAINT "Pelicula_T_Pelicula_fkey";
       public          postgres    false    237    230    3383            �           2606    21686    Perfil Perfil_Email_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Perfil"
    ADD CONSTRAINT "Perfil_Email_fkey" FOREIGN KEY ("Email") REFERENCES public."Usuario"("Email") NOT VALID;
 F   ALTER TABLE ONLY public."Perfil" DROP CONSTRAINT "Perfil_Email_fkey";
       public          postgres    false    3451    255    238            �           2606    21691 (   Pers_Creador Pers_Creador_N_Creador_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Pers_Creador"
    ADD CONSTRAINT "Pers_Creador_N_Creador_fkey" FOREIGN KEY ("N_Creador") REFERENCES public."Creador"("Nom_Creador");
 V   ALTER TABLE ONLY public."Pers_Creador" DROP CONSTRAINT "Pers_Creador_N_Creador_fkey";
       public          postgres    false    222    3363    240            �           2606    21696 *   Pers_Creador Pers_Creador_N_Personaje_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Pers_Creador"
    ADD CONSTRAINT "Pers_Creador_N_Personaje_fkey" FOREIGN KEY ("N_Personaje") REFERENCES public."Personaje"("Nombre");
 X   ALTER TABLE ONLY public."Pers_Creador" DROP CONSTRAINT "Pers_Creador_N_Personaje_fkey";
       public          postgres    false    243    3413    240            �           2606    21701 "   Pers_Nac Pers_Nac_N_Personaje_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Pers_Nac"
    ADD CONSTRAINT "Pers_Nac_N_Personaje_fkey" FOREIGN KEY ("N_Personaje") REFERENCES public."Personaje"("Nombre");
 P   ALTER TABLE ONLY public."Pers_Nac" DROP CONSTRAINT "Pers_Nac_N_Personaje_fkey";
       public          postgres    false    243    241    3413            �           2606    21706 #   Pers_Nac Pers_Nac_Nacionalidad_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Pers_Nac"
    ADD CONSTRAINT "Pers_Nac_Nacionalidad_fkey" FOREIGN KEY ("Nacionalidad") REFERENCES public."Nacionalidad"("Nac");
 Q   ALTER TABLE ONLY public."Pers_Nac" DROP CONSTRAINT "Pers_Nac_Nacionalidad_fkey";
       public          postgres    false    231    3385    241            �           2606    21711     Pers_Oc Pers_Oc_N_Personaje_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Pers_Oc"
    ADD CONSTRAINT "Pers_Oc_N_Personaje_fkey" FOREIGN KEY ("N_Personaje") REFERENCES public."Personaje"("Nombre");
 N   ALTER TABLE ONLY public."Pers_Oc" DROP CONSTRAINT "Pers_Oc_N_Personaje_fkey";
       public          postgres    false    243    3413    242            �           2606    21716    Pers_Oc Pers_Oc_Ocupacion_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Pers_Oc"
    ADD CONSTRAINT "Pers_Oc_Ocupacion_fkey" FOREIGN KEY ("Ocupacion") REFERENCES public."Ocupacion"("Ocup");
 L   ALTER TABLE ONLY public."Pers_Oc" DROP CONSTRAINT "Pers_Oc_Ocupacion_fkey";
       public          postgres    false    233    3391    242            �           2606    21721 "   Pertenece Pertenece_Cod_Cargo_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Pertenece"
    ADD CONSTRAINT "Pertenece_Cod_Cargo_fkey" FOREIGN KEY ("Cod_Cargo") REFERENCES public."Cargo"("Cod_Cargo");
 P   ALTER TABLE ONLY public."Pertenece" DROP CONSTRAINT "Pertenece_Cod_Cargo_fkey";
       public          postgres    false    215    3353    244            �           2606    21726 '   Pertenece Pertenece_N_Organizacion_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Pertenece"
    ADD CONSTRAINT "Pertenece_N_Organizacion_fkey" FOREIGN KEY ("N_Organizacion") REFERENCES public."Organizacion"("Nombre");
 U   ALTER TABLE ONLY public."Pertenece" DROP CONSTRAINT "Pertenece_N_Organizacion_fkey";
       public          postgres    false    234    3399    244            �           2606    21731 $   Pertenece Pertenece_N_Personaje_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Pertenece"
    ADD CONSTRAINT "Pertenece_N_Personaje_fkey" FOREIGN KEY ("N_Personaje") REFERENCES public."Personaje"("Nombre");
 R   ALTER TABLE ONLY public."Pertenece" DROP CONSTRAINT "Pertenece_N_Personaje_fkey";
       public          postgres    false    244    3413    243            �           2606    21736 %   Plat_Juego Plat_Juego_Plataforma_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Plat_Juego"
    ADD CONSTRAINT "Plat_Juego_Plataforma_fkey" FOREIGN KEY ("Plataforma") REFERENCES public."Plataforma"(nombre);
 S   ALTER TABLE ONLY public."Plat_Juego" DROP CONSTRAINT "Plat_Juego_Plataforma_fkey";
       public          postgres    false    246    245    3421            �           2606    21741 "   Plat_Juego Plat_Juego_T_Juego_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Plat_Juego"
    ADD CONSTRAINT "Plat_Juego_T_Juego_fkey" FOREIGN KEY ("T_Juego") REFERENCES public."Juego"("T_Juego");
 P   ALTER TABLE ONLY public."Plat_Juego" DROP CONSTRAINT "Plat_Juego_T_Juego_fkey";
       public          postgres    false    3379    245    229            �           2606    21746    Posee Posee_N_Personaje_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Posee"
    ADD CONSTRAINT "Posee_N_Personaje_fkey" FOREIGN KEY ("N_Personaje") REFERENCES public."Personaje"("Nombre");
 J   ALTER TABLE ONLY public."Posee" DROP CONSTRAINT "Posee_N_Personaje_fkey";
       public          postgres    false    248    243    3413            �           2606    21751    Posee Posee_N_Poder_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Posee"
    ADD CONSTRAINT "Posee_N_Poder_fkey" FOREIGN KEY ("N_Poder") REFERENCES public."Poder"("Nombre");
 F   ALTER TABLE ONLY public."Posee" DROP CONSTRAINT "Posee_N_Poder_fkey";
       public          postgres    false    3425    248    247            �           2606    21756 *   RelacionadoHer RelacionadoHer_N_Civil_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."RelacionadoHer"
    ADD CONSTRAINT "RelacionadoHer_N_Civil_fkey" FOREIGN KEY ("N_Civil") REFERENCES public."Civil"("N_Civil");
 X   ALTER TABLE ONLY public."RelacionadoHer" DROP CONSTRAINT "RelacionadoHer_N_Civil_fkey";
       public          postgres    false    3357    249    219            �           2606    21761 *   RelacionadoHer RelacionadoHer_N_Heroe_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."RelacionadoHer"
    ADD CONSTRAINT "RelacionadoHer_N_Heroe_fkey" FOREIGN KEY ("N_Heroe") REFERENCES public."Heroe"("N_Heroe");
 X   ALTER TABLE ONLY public."RelacionadoHer" DROP CONSTRAINT "RelacionadoHer_N_Heroe_fkey";
       public          postgres    false    227    3375    249            �           2606    21766 ,   RelacionadoVill RelacionadoVill_N_Civil_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."RelacionadoVill"
    ADD CONSTRAINT "RelacionadoVill_N_Civil_fkey" FOREIGN KEY ("N_Civil") REFERENCES public."Civil"("N_Civil");
 Z   ALTER TABLE ONLY public."RelacionadoVill" DROP CONSTRAINT "RelacionadoVill_N_Civil_fkey";
       public          postgres    false    250    219    3357            �           2606    21771 .   RelacionadoVill RelacionadoVill_N_Villano_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."RelacionadoVill"
    ADD CONSTRAINT "RelacionadoVill_N_Villano_fkey" FOREIGN KEY ("N_Villano") REFERENCES public."Villano"("N_Villano");
 \   ALTER TABLE ONLY public."RelacionadoVill" DROP CONSTRAINT "RelacionadoVill_N_Villano_fkey";
       public          postgres    false    256    3455    250            �           2606    21776    Sede Sede_N_Org_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Sede"
    ADD CONSTRAINT "Sede_N_Org_fkey" FOREIGN KEY ("N_Org") REFERENCES public."Organizacion"("Nombre") NOT VALID;
 B   ALTER TABLE ONLY public."Sede" DROP CONSTRAINT "Sede_N_Org_fkey";
       public          postgres    false    234    3399    251            �           2606    21781    Serie Serie_T_Serie_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Serie"
    ADD CONSTRAINT "Serie_T_Serie_fkey" FOREIGN KEY ("T_Serie") REFERENCES public."Medio"("Titulo") NOT VALID;
 F   ALTER TABLE ONLY public."Serie" DROP CONSTRAINT "Serie_T_Serie_fkey";
       public          postgres    false    252    230    3383            �           2606    21786    Usuario Usuario_Direccion_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Usuario"
    ADD CONSTRAINT "Usuario_Direccion_fkey" FOREIGN KEY ("Direccion") REFERENCES public."Ciudad"("Id_Ciudad") NOT VALID;
 L   ALTER TABLE ONLY public."Usuario" DROP CONSTRAINT "Usuario_Direccion_fkey";
       public          postgres    false    3355    217    255            �           2606    21791 #   Usuario Usuario_Id_Suscripcion_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Usuario"
    ADD CONSTRAINT "Usuario_Id_Suscripcion_fkey" FOREIGN KEY ("Id_Suscripcion") REFERENCES public."Suscripcion"("ID") NOT VALID;
 Q   ALTER TABLE ONLY public."Usuario" DROP CONSTRAINT "Usuario_Id_Suscripcion_fkey";
       public          postgres    false    255    253    3441            �           2606    21796    Usuario Usuario_N_Tarjeta_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Usuario"
    ADD CONSTRAINT "Usuario_N_Tarjeta_fkey" FOREIGN KEY ("N_Tarjeta") REFERENCES public."Tarjeta"("N_Tarjeta") NOT VALID;
 L   ALTER TABLE ONLY public."Usuario" DROP CONSTRAINT "Usuario_N_Tarjeta_fkey";
       public          postgres    false    254    255    3443            �           2606    21801    Villano Villano_N_Villano_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Villano"
    ADD CONSTRAINT "Villano_N_Villano_fkey" FOREIGN KEY ("N_Villano") REFERENCES public."Personaje"("Nombre") NOT VALID;
 L   ALTER TABLE ONLY public."Villano" DROP CONSTRAINT "Villano_N_Villano_fkey";
       public          postgres    false    256    3413    243            =      x������ � �      >      x������ � �      @   B   x�3�,N)N�4�2�t�/I�4�244�tN,JLN,�44r�8�3KSSRR���A���b���� �c      B      x������ � �      C      x������ � �      D      x������ � �      E      x������ � �      F      x������ � �      G      x������ � �      H   T   x�E��	� �s2E'($ݠ���|�H@�h���z|�L>��;HY�.�>��𚣮�B�Z��U)�k��t���\��      J      x������ � �      K      x������ � �      L      x������ � �      M      x������ � �      N      x������ � �      O      x������ � �      P      x������ � �      Q      x������ � �      R   $   x�3�K�K�*M�I�2�t����M�L����� H      T      x������ � �      U      x��{ǎ�Lt��׫�0�̔a�̹��97s|z�
$�m�2�̠g�Ūs�P����E_�:.�pɯ)��_��?���O��ԏ�3��dK���� �_���d-p�4>c�'���H�__ǫy�z�����eY:z3�ܟl��A����_I�k��-�F��Е~.Dr�M�gZql�����0l�Du�|~Wh�d��3-��Û�)4��T�i�"��Z�ߞ�P����2MM<�(k[�;@��N]��C�J9��X� ��C`0' FJ �<��l�-�]7�ꪫ+Ա�r���
��B@�"w�k_�5�F��(�Vv�R��X��a����L�
N���b�<k>x��z�8L	�b��^�wh:��f�Fz~0[�H�=O���g��%ݹCd�č�z��x�TF���G�"�^�鯘Qcb��Y�rF��3h5��L�0�u�*N�b�m�Y������W��g�3�,��c��t䑒X�ۮ��΁"O�&!��XK��X��}/����R=��a!����j�;3o��3e�u
~�lKO\g�w�3!���ՐW4[`e�����e�TPd>
���QqK�U��Ã�3{�����G���\!i�`�0T�h�w�P�;&��c,f������� cC�v1��,G(&��{�d��!%/��=T��0,�8Gb����!�s��S�� kDq�k���E>�.\��ً-����ӗI�\���탡��:���7����"w�?V->���O�L&B��k��[��������t�Ӌ�z/�J��!��eo�q2�����#��D�`���ם�����d�Ó�""��5������xP֕�U+;<@��z4]U��ӝ]�4�N�'�Y����]7��燍��INoɋpX_�Xƍ�v�6�P�f�.)ÊtGb]�Zv$a�L?�f3M�9�(0��#+�'�+F1L�+���c�^���⪭�c�Q�ݕ����	��Vƻ�)�̚N�N����Vv�n��]s��	���748�+K��&Z6��kWh$����`����Z��^��|i;���pN ��YGY��c�����	�<�7�������|���G_�q��F�3ʕ^�
��I��m~2~ ��� 2g3j���f���ҊjHs,| ��'B����l~�,h*�f[���]u=�ҵH��Zf.�s��P�8�����g�?�>�*�̆�#�q���v[�&��b���)	y�ޡ�L�yjF�\K.��jP�قtyBI��)V|�H��<�	Qi�w|K��7����>���[��=��f����#�o��C��j�Y��Zࣇl
mE��|A�P�!��
8�?	;�b��Q�<�$6�pMپ�tq�v-�B�eۀ�N5Y�Q���c�}?��C�`-�h�zs�:x��`�z�mEn{�yߡů��_�'f�	4s^�H�WD��� =<i���W��Nd:�KW�Q[�ed��3�a\�̔���,�uS\t��yV�X�K��D�qv�8m@�_'k�b7<��W�]<�>в-�	@�_�UM9AKl�u�OA2V���Z����<Xelz�@`�-/��
�{d�9G��c���E�m�f�?E�xۇ�y��촓(��fK�N�%��jߵ2HC�����G��\\R�����J	*XɆ�`=�!o"�/�x�N�n������F��Dm<��1���fŊ�����qwЬ�򙧊<Y�nd�쪛{�zy�!�������y�?���Y}�F���'�ߌoZ4���X�fr��Eld�u?�={6}E�����{'856C5��"/��O�P}�t館�;��_=T�*0�Z���)��PE��(1P�7 u����n�W�xYm�>'P���i��R1���(!�-���a)��t���F˽�8�u���|�ٯ����AgTҕ���*[��;&G��.�F?�G�f�㌢��I~�C��}E�������:C���F�d")Pa�F�ǚ>��~.��	Py�UM
T��i�����q�=�	����a�ӡ��齀���������ip*�Y�(6�0~Y�y/���}��X���#�(�:d����'���5�脿/i�7Ghkfu �|�6$���"���b�B�x��AtJ��J�YR~��;��r�`X"Ѐ燈�se��9� a$n|oo�0&�ٍ���C��U�&�t4�Ӑ��K82}�5�RQ�>Eϔ2���q6TC/G=C5�.�u��-bm{'��5����5��@��m�M�M_3?m�)��'d�1E��/��74S�����<c��07�)E{w�
Ɠ�/ #P�kE����_-�wM�uA8�����Rz��im�j�BF��i'���h�ޯ_�k���j��o|u��y39
��<tK3�P��#ғ
l�|\�R�(� vb����$ߥg|�U�rW\��3(�1������1u� P{(�\r���&�z�SG�М$�T`�7���dTgH�ZvzX=CK',��5oL����4H�X���Ռx��>���
����p���/�pɏ�����§s)�d��h1���ƼWʅVW�\��ժ����f��-�rr��Mm��ǛW��3�����V�7�C�NM%|Q�}��H��W��� |kc������3G���u9�ܫ[~6�+��O�{^~'�[���o�X���*a.x�r���^|�AOK��Cr#^gx~(��0R>@o�z-�0z�Ya�m�!�d�6^>J��+�-\c�7`p�\~�X1*0���{����E_B����=�� �o������LH��$^�6��������Sp�E�Iq
�!��m���qJn�bl�a�r��ܘ`|�L[��Ml�ݨ/>l��aO+����dK �a;�4�|�,��|�sIeSp��e��SJ�i%����Β�����?��ILs{��u�-�ΐ���y�:��#�<吙�� >`՚5٧�T��,��(�r�<fe�٫���H�@��@Y�?��@�j'�� ��l��M��Q�s;�c���F�����q�@��PǛC��J���)q�3p7���s��8P�d�:�Zd��~#.#v������x�U`��Q����U�<�x���Z�_�1�YjY�i0�-�'�t禉�)0؟��_�	��^�j��:Y���$d�w�]�(q��H\J��k��%
�w��w�+�r1I!{�n�cc�����t����E��Bz�Gj����]�H�X#�8��`|���CO�{F嚜�x�]��3����Z��B�Ρ\�B���G�����C�wpk�g�E�E�s�2Db�
T��<~��7!I� ���x"���T�g������>=�x���֠�q{W3Z��(�g���������h�|����:3�,�m�2�ݏ��1�-�Ɨ 3mn�$��ܗ��V���)T��>���j�H���P;!?�Vw��-~
��i��C��v�n,�/0�;Ӿ%��$�����߶$��} V�/��/��4���}�?�?��H
�g��v��'����j=}��z-d؝1����'*��Զt���3u�V�Of\�-�W���0�wa�P�s���"����@d h���`LP�k��?�>p�R 2P o��w��XQ%
uKEd���7��u�U��$�몣����HN{�3{K�k��
EJ)�Ro�*�XmZ%
�g�$@gL?r膴B�k�HJ������jRKl!A�-'�q���G�!�zE9�i�:�u[��?B�ﳦ��X��礷��:#�w�<B��j`X��� T�1!���(�Vƾ�5Y1��1���\�O�#_Ž�\���dß��.- U��nT�u���:PL�������n{�5��p�`ந����=A��	eW�gK�L�i@ʁ���^傟�n�"�ت��d2�^d.Re~��BԔ�~$wtd���i��7�K�_.Jcϼ��@���h8��.���[�5�*�w8]�O���˞"���O֦��>`X��`/*q�G�c��슼�u��و    x�/;;ڈW�*�5�o�]7���S@�L-l�~U?PHWԉ)�>SU�-{�h�:ME��x��*-�C�J�c����_�-�|k�&�V�iQ��x��/:�O;��[^���1����a�EJ:��ӆ����Sw����O��НG�(�v�PG,w>e�Fu�36��|�k�bo�,�y�o��n��a�v
MXly���n�/6AI���>*�&�!Qѣ�W�iJ�LƆ�'Ό���"�R�"�<�L�����g�n����(/��D����q���
Р��~������,��ü�S6��2�t�!���Guw	f!�2mB������|&$���)꓉�y��%0!��F������n\���1m�����4]]g\U��%��/n�b���+��i��<8��xfo�}P�����7T�|ݖ������������aݰ��s��e�f�*~��ϯ������Te햟n�����zo]:0�g-��fF��@���_
��9�GWf�s������{�`YT�î��U&��d��v�L�,M��.���IB%CA�F11�Y;���P.M����76��c���@�
kG�3���g�g��mKP�kunmɣ2ȳ�: �~����po��{a�u�4P��YvN:Ի�UT1g��m��Pn
�$��ų�F�%�8����Τs���|�G�r:W�"����K%�1���#y׈�%َv2���s�o�n����.w��C��"�+��1։S6ȵ�(���U�KcƅwNb�l�oOF����5����X%/��,$q.+�_=�-�̿���p�;rp� �M�����6C�:�E��O(�g4q�uC�c(���g����w�_7?�l,oՅ��(s��Ɖz���ɺO�}�}�!�dL�j�v�1�e���M`��݉�Q	�:�VX$8q�|�m�e���<�?����' �h��X�W5�م݌n�Z>��ˊmv���r���7���?v�}�Vr����^ g��2y}F�2/�ƌ)�D8��r���Qyh������@�M��7:W�;��_�;�qڏzqmo��g� Ɔt���XA�W�2Z�?���JՕ6�@V�*'���*;�)22�^Y��2�mњ��ax��A$��'�m�{.�&ՓZ	Rw�P&�����L6����w��/:�TItj�~3%^�Qa��@�%+�k(�}���g��a	�����;��B�)�G��3ė9,Wm2���5���ڙ`t����h���[UHT�A#_ճQ˚����8<4/K����u�;;l�����`N'_��8N�>�W�N�Ž��ԟg�ë�Mqd֡V[1��۠�z5��L=��(H��6�LĢ.S���$ ]�2Y�*����Z��f��@�r2����L�čC~�(�:6-��I��	g�t��Dԝ�,{��Jw��M��f�@~����S'M;���ʘ�f\{�$��G���a�*+Eh>\Al���(y���Tʽ�#2N��lf���o��4;y��W4��R���>�HU�v��E�¼}���TС���N"��҂q�r�F��ܟ4>�w�F�Tݬgn=؂+��J�ǒ��5�'Jo��\'L�0����y�a��8�����Dbʂ"�?G=��Ե��&i+IQz����;'7l��8v���a5JW����(h���;��[��i�����4��=��*96��dƉ~�V-���%�(�a[i����Y�q=Lv��9�黱�ãj[Ĺ���8�J�{���B.�5	|�iY
�X�������!�ʊJu��[9k�ץgf��L@�C86tQ���/�Wj_�S�ԉ�m���Pe�up����O�f?^��G��B��@�4ITY����1�sKFA��l��Iq��DGSe���)f¦��ԧk�N�}:��[�=Þ*��=��K��'�d��ܰN�%[m֜��s���w��'^�����<���/B�D�9锳c��=R*ߩ�Hs��0Y��"�:�$
�~"�Jz�m�L�үk�j���ZaO�����̋�)bc����4 ��E�������ʢ�5o��g�E��e�Z���:�H��N���6c9h�����Ě~��{�}�(�G�[ᔕ���ƎaW�X4�!%_�F�>��(t[-3�8*�b�]ѝ��+_r'Χ���4z� `��N?�[�ßk���T�;�M �N=�7�z�SmC��^`v��������O�<Ѽ_�7�ڥ�R/�qԾVY!j�jї;�������udޤM%I�n�zZj'�|q�������e�.����A�@'a�l�h)p~���|yudJ�Og-ZΥT�G�L �3`��*��!]�KG1�M�%�� �����EdP��~��?�����?n����Ͻ����������&��~�%��_8x���ӛA��v(��tٕ���}�8��p�CS5�: ��@���-ֳ�g��@)�ٖZG@����@���wc��?��d4X��S�˰}�w�DR҃���y%�wѓ��O��:c�%�#�I�X~?iks$���v��yPt(�+!I�҂����;~z�ҿ L�o,d �
c;���m&�i˙2�J;�5g���J¨a�0�g�i���X���+}�����f��DW,�$��K��G��eko���	�g�%*nq�qՌUU�'�!�9��$(��8�?�pD�9�W&�0e?�������,�&mVl��+�r]�`j�G��gs��[�P��0�Ɉ�,�ǹ�����|Y��Hl�a7�v��|ScսD$�̛,.� �b��]Y�(?Y�y�{�a��B"�X�$�cªK�TII���#�Y��\@;`+NrW̪�A!��������������#�Sn�)l̓��V9y��:���\�8^K���A:��l���:�\��::�X�^v��/Y(,�����E,A���V�dʇ���c&�����#bDrL�&it
��Js�qp�6��ԵJ��?�+��&F+=��o	5�^(ۿ���,�f��㽇^��;&���m|T9� ���Nf��b���Ek��Mgg������`=��V<P���ؽN +-��]���\�ƷƗ�ߎ[�zs��8[_c�p�XB�2�����9�٠�n1knk��7aK�Y� ������Q�`�;�ݧ���B�!4X�t��3���ژ�X+/8&Ѡ����Դ�u��S�u�~qm�k��#�i������&*�z�rs^$B<mlЫ�]�?1�A��N�_�4��_��5T4��'(^�3�gV��B�y��`N}5K�Sh	m^�������˴�ڍ�0��P��ݢ�� ���,�6�9���tl��Q�����º��R
�D��bD�D8��>9��k;	�;�=$R��Rx�w��->���"&X��>�'ajO[������K�����s�J\�kg3��_�8�j��N?��;b�>�p�8�M:���W�$X���.��=�9ۛ���������q��y�M����]��fZ��E������p4���fQ�;D��l�M��m�"o��j31��(!��W��6�Ddf��p���Љ9���E���6'��:��VH��_<S����v��y����·�|�N&�jx�J�]g��V_S�|��+��5%�ՔI<m�0|�-e|�l�i�J����̼�+�&���Y��X���C0ҽ�7-/�+.q$~�ܧjPy�ǁH�Nœ��DT�-��v�
�v���XZ'���=,�U�4��h�����)���*�bl� �*��f�fMJ�c�4��G8GBq�ݽ�dM�&�����{w��?>� _Kp܇uH<L��o<v��c��;+T��~�]ɈJ[��d�� �x�.DLz����^�C���s�`�Q@ͫ'4��_�Y�i}�qa�3�8ܶj!�����N��/��}ZP4�o��N&�<,������Ν���W�q�({��.cڿH�=e#ǵZW�����+`�l�h��z*�Ng`<����-1��#����k�2��$�z��ݛ���;S�t���}&
TDe4~�3��0�B'��,Ѿn�K&RW/�x�仃�    ~7�-�Mm�E�u�X"cR���|���u_��Ի��7����hᶛa���'���v=<RQ
-��q����Y(�]߷��ѫ^N����8-���}⶛���[j�����|󌲂��1ӸW�$x� �5��?�
�M��B�ѽ�,wuӾ���������u/H'Ѿ:_{4z�׍'*☙��|O?�J��m�0���A@���\χ��Vm�zˁ�����Ug�D����~s�^�b��Q���d�f�8����R�}�-s0�f{��~1��WA�덢%�{���\�F�z��y'1����Z�WĘ~�2������f�|e-�"�׮��Tg�Ђ+��:xH��Y�F8���bF���7��8�>T�Zè�� �4���s����|y�(��i�{�+�w�q��}>C�~������2�蟀ͧ����y�n��p��(tm_���)�f�I��ش؁�]��T��}hsM�b��	0���mVm����g/no�^o��;
/O�b�����܍p��d'�S�������",w5S���7���?�Ϳ�黙i��x��HY*C�L'� ۉKB��%�ۜ�8�c��G=�uo�`�G���}B����)�g0_�?�xv��Q룇ih�}W!�	��m����Ǉ���Ҋ\\���l׆�D��Ù��~+`��u�w���~��Z_ID����\D}L�cdB		��cf�A�3�k>�avR�YŮ��u�{�	�8�R�	A�2�A����V��� ��~[B�Ke1d���|s�98���ª%�ê"=�ά�*?����ob��,���+��xk"��io>�'c�9�Ə���S�ӄ'�ܬ:��?���
�J��+m��[>=j3Ø��.�g��{�+�H"x3�} Y�T�Ōu1�7�P�.:���`$�J�$I4�7@d�H]���d��_Ny,܅RF[���C��� ۼ�;&5
S�����a5쯯x��RH���I�����7��"�������M):���������ݟ�zQH1�x7������⮭�%���+>E�$�8��g�޾���B��sj�:��hJ��uR�.]���`�Qܜ��Z��k�5�^��@%1PA���?��-��&�i�9Q��#�fY"�݇���u4� ����V�/��Z�^����<����S��,�U	\��[��3z�g9�
Aj�5��ޟ	[�h<�� @|o��7KC��)~�1>��������w>S�t �:����ث�m1�?�@,M��5~��	�P����K<� �a���q�к���^������l#�
�������3�\�s����6���kx^��4�5d�4��i�%��Kp%�ѱ8�3c��-�?jrI�h���h
����+�P��Gz� �5JIx�Dru����e�c(�:ڋ�㮴��EUw�6+���� F��NQq[��.8��?=�b��&J��6Ą`(�05�sդ���0UR�b�U~䐢�k¸z=h�8H�>D����qh��:DR�*��PT��z9'�*�T�L������t{��*J$e"L S �\�L/����M
ߘq��� gv�T���~w���X8H�E�؏��4��N��q�]gHeo�f�Cz�㊾�-��)|x�r�c�>�4��:���M��[��H�����ؿ��o����d��a��=�[��\�o���r���:�u����-��[��\�o���r���:�u����-��[���Q���@y���O���$�쿭^����a^��F���>���u�+�PJ���[����	t��*��6�]� 閶�L8\��z�F�>�3B]D������k�m��.�͔&b�����-�4 �%wyI��kl1������A�d��� >�Ạ��w��r�%D��b��[ݛ�(SkTP�WZ�l$��Í����/<�eWzI�T���f�N�ąbY��C���5�e�Z�Q�뀟d�i2�[|�]֊��U�^��_���n(�M� ��
�?��h;���\(�3v`���>g.M?W_�G�.��j9�Za�u���-z�N���E����y�Z�ґ�uF�i��-�z�IEV{g�ђ7	͝�5?c{��5�~1�ʳ�m�6�6�z~�Y�K�˛;��ޚN窥�4��\jӠ&v�1��"�(蛅�l�_	�b{ӳ��}AD�����g��"�̰�Cl,s1�����^Y��zbȏ�S�T�*��^�i����C��'����6���ׄ�"/�'��w��r��:e�F	$��рp����m}��X	�����LS�46����|(�"z�G6�ǈ����C�ةꩊ&�
�7C���Ƣ6�X�B��GЫ�[�{�Ǡx���������G��w��z���t���[�oy�"��i�t�;�V���|�#\���T��˲�}���T���t����٣{'�'�=�ǊFt�q�ݝ^��܃�t��|n��OtX��62�*�lp�^���>Sѫ�q�^1��[͌���˸�A!;���"X��v����PƊaӇ�/R�ɧ��g9r2�{��\�oW���b�ADm)��=\��kKOƦ���mz�_��*�.�Y�e��"M �Q5�^��!���R7b�������-;�w�N��J�[1�nދs��h��Υ�"Jޡ��+���9��%�L���؜����:d��3���G�
6j����S����=�v��5E�5�I�\�h	KEYc����7�󩹠�������<���5]<T�2�<��V�E-�������Ԓ��f1x=篦˩�u���	��d@����~'�,g���Ř6�4�3����o�EЇ=d�1�"��T�_-d#	�S'��*(>�eƷd���l�M����_�i����Cj_�"JY��Q�g]���J��,���Rˬo�	O/W�/0��KE�Is8}̗͐��+DvB����D�2��q#4aG��b�+�ˡ���cVQI�0
��3*�#�<����!Sհ�m��v��z �����lq�K�,��|�<q�5�;@��F��c��^��f.���KZ_�*GU��,[�b\
"X���lґ"��'�zF8#_\(�o�Y��t�b3>e*,�c;%b��E�j�e�zP&@YN�ƛ�P+;gN2�ìZ��/oY36� �eu��q�ks䈤����8���!�W��X%
�,U$�A#[��ֽF�&��_أ����O��Cf ��񱯹\ު��Ҥ�xqW	�v�S����Ay��$u4�Wo
��6�r�1*��U�oh�/�����A�FQb��e5������6������(�`��I9��CW��>��&��L���������h�rЇ['_��F�w� B�k7w�X�V�K�̶�h�$Pݾ�}bp���	5��fNӺր
�$�8���Y`�J,8�`�_Y	�~��>���.4G�����l���k�`�Z���|G��F1��(�[R�iV/�t��e�ޜ	�{�݈b�KIi�:�'h��ANs�}qzc�S����5�֧	�_0���=�b�2��"���e����Gp7�&W��d�n��S<��0��V�)�/��.@�E��ُ)��\�g)P�ڙy��s��O�fHS�L�管��Wqao��,$�Y������Z�T��7@��� ��Ryo�+��kp�	���>`}'�U��1 �r�)���u�m��9&)!Hu6-�I��/ ��S�����A���?�2]�(,�~dO�E�=��Y=o�d�e���Tf^�u�F��dѼ������x���h������ëRt����_�Q2PF���M��qY�m�YnS����H�B��|�Ñ��㖹~�ЪV�U�zU���X������J�D�����&f���(M%�E	��	�6��6�0z��m?q��:~��B
�X��O��ơ�9�Z����z�iѓP�##jЭ��hH��ul��D�%����3�-T���K��s�\r��7���S�6w"l��/R�$@�v�!6�X��e@ɣ ��U�DFeF��������4�~h9t/4d+#Z}��� �  ��W�Vއ��O�<�AKSs���
��oYR��(�+{�j���f{�c��\�!\�|�y=���>2�ѽQ�?p�V�7o��W���I_0�s3��+��/g�.�>���x�)e��fD��歔�}�O�^'��|�S���[���i��#%�����Uown��h�l��D��Z%_�O��,O[�ErL/+�����諛Rd���pa<�"M��ʻ�jk���f[�,~�@��g�Y��$� ŊD��/��Y��@'�l�,]�-nd���\��8$�U��e{����螿��q\ҏ+�K�~���}�Lk?=0�V���j{j����cU6X�����EO	�&}���%�$�rîj'�XEꇓ�sε���͓]���6|� =3"��2�@O�\�Bdw^-�r�~q�vjθi���B��:� '�if!�*|��(5�%�~���{ƳtXK�%q�A�@�EX7�B�2`�s�6��k5%���홑%�~wZ��j��g�g'C�ߦjcl+q>�}����K�x�.,.<�ҳxUH>F�4�M�a�~�����c��U�2K�f�D�����˨�7S3��ey�گX�|y=K�P�g
�rh�q�JW=�'�����J��b~�.E�!h^��a�����FFZ�.���HJc'���ku�}
p�(S@��畲��V?��Nh���9��Ʌ�8ђ#�*��bQ�~��*�e9A �w~%3�$b�e�8%�N/-"ix����י��;{�Y�h�u�&��I5`�=]~���	��Օq�3��1+�w��G_6�8C��T9�a�?n�>�0[i��{mn�``�6/ܓ|oSJ���̴m� R�5�V�P�+�{��}=�ȀO�,���t8I&&�(�:J�%�8�����=(Tg���NI���/7u�ʿ`��fY����      W      x������ � �      X      x������ � �      Y      x������ � �      Z      x������ � �      [      x������ � �      \      x������ � �      ]      x������ � �      ^      x������ � �      _      x������ � �      `      x������ � �      a      x������ � �      b      x������ � �      c      x������ � �      d   ?   x�3�4ճ��t��I\F�� �������\�e�ih�, a.NN���T0����� �	      e   1   x�34000D@�����D������b�(�"oCƜƨ�1z\\\ ��w      f   �   x����
�0 �s�.���v�	|���Ӄ�����[�C"L�>�ԥ�6^c�S�N%@bs+�x��ښ�0ǔ.��`��A�靲�v l�A����C��
G�#�}��#��۱�Ǌ��>9���	�+ίp(������¯c��Z� xR��      g      x������ � �     