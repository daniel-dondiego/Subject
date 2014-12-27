--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: archivos; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE archivos (
    id integer NOT NULL,
    url_archivo text NOT NULL,
    id_usuario integer,
    id_grupo integer
);


ALTER TABLE public.archivos OWNER TO postgres;

--
-- Name: archivos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE archivos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.archivos_id_seq OWNER TO postgres;

--
-- Name: archivos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE archivos_id_seq OWNED BY archivos.id;


--
-- Name: carrera; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE carrera (
    id integer NOT NULL,
    nombre text NOT NULL
);


ALTER TABLE public.carrera OWNER TO postgres;

--
-- Name: carrera_escuela; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE carrera_escuela (
    id integer NOT NULL,
    id_carrera integer,
    id_escuela integer
);


ALTER TABLE public.carrera_escuela OWNER TO postgres;

--
-- Name: carrera_escuela_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE carrera_escuela_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.carrera_escuela_id_seq OWNER TO postgres;

--
-- Name: carrera_escuela_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE carrera_escuela_id_seq OWNED BY carrera_escuela.id;


--
-- Name: carrera_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE carrera_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.carrera_id_seq OWNER TO postgres;

--
-- Name: carrera_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE carrera_id_seq OWNED BY carrera.id;


--
-- Name: categoria; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE categoria (
    id integer NOT NULL,
    nombre text NOT NULL
);


ALTER TABLE public.categoria OWNER TO postgres;

--
-- Name: categoria_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE categoria_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categoria_id_seq OWNER TO postgres;

--
-- Name: categoria_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE categoria_id_seq OWNED BY categoria.id;


--
-- Name: ciudad; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE ciudad (
    id integer NOT NULL,
    nombre text NOT NULL,
    pais integer
);


ALTER TABLE public.ciudad OWNER TO postgres;

--
-- Name: ciudad_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE ciudad_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ciudad_id_seq OWNER TO postgres;

--
-- Name: ciudad_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE ciudad_id_seq OWNED BY ciudad.id;


--
-- Name: comentarios; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE comentarios (
    id integer NOT NULL,
    contenido text NOT NULL,
    id_usuario integer,
    id_publicacion integer,
    fecha date NOT NULL
);


ALTER TABLE public.comentarios OWNER TO postgres;

--
-- Name: comentarios_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE comentarios_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comentarios_id_seq OWNER TO postgres;

--
-- Name: comentarios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE comentarios_id_seq OWNED BY comentarios.id;


--
-- Name: escuela; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE escuela (
    id integer NOT NULL,
    nombre text NOT NULL,
    imagen bytea
);


ALTER TABLE public.escuela OWNER TO postgres;

--
-- Name: escuela_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE escuela_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.escuela_id_seq OWNER TO postgres;

--
-- Name: escuela_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE escuela_id_seq OWNED BY escuela.id;


--
-- Name: grupo_usuario; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE grupo_usuario (
    id integer NOT NULL,
    id_grupo integer,
    id_usuario integer
);


ALTER TABLE public.grupo_usuario OWNER TO postgres;

--
-- Name: grupo_usuario_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE grupo_usuario_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.grupo_usuario_id_seq OWNER TO postgres;

--
-- Name: grupo_usuario_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE grupo_usuario_id_seq OWNED BY grupo_usuario.id;


--
-- Name: grupos; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE grupos (
    id integer NOT NULL,
    nombre text NOT NULL,
    imagen bytea,
    visibilidad integer NOT NULL,
    id_usuario integer
);


ALTER TABLE public.grupos OWNER TO postgres;

--
-- Name: grupos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE grupos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.grupos_id_seq OWNER TO postgres;

--
-- Name: grupos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE grupos_id_seq OWNED BY grupos.id;


--
-- Name: institucion; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE institucion (
    id integer NOT NULL,
    nombre text NOT NULL,
    id_pais integer,
    id_ciudad integer,
    imagen bytea,
    web_site text
);


ALTER TABLE public.institucion OWNER TO postgres;

--
-- Name: institucion_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE institucion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.institucion_id_seq OWNER TO postgres;

--
-- Name: institucion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE institucion_id_seq OWNED BY institucion.id;


--
-- Name: likes; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE likes (
    id integer NOT NULL,
    id_usuario integer,
    id_publicacion integer
);


ALTER TABLE public.likes OWNER TO postgres;

--
-- Name: likes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE likes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.likes_id_seq OWNER TO postgres;

--
-- Name: likes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE likes_id_seq OWNED BY likes.id;


--
-- Name: materias; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE materias (
    id integer NOT NULL,
    materia text NOT NULL,
    id_categoria integer
);


ALTER TABLE public.materias OWNER TO postgres;

--
-- Name: materias_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE materias_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.materias_id_seq OWNER TO postgres;

--
-- Name: materias_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE materias_id_seq OWNED BY materias.id;


--
-- Name: mensajes; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE mensajes (
    id integer NOT NULL,
    id_remitente integer,
    id_destinatario integer,
    mensaje text NOT NULL,
    fecha date NOT NULL
);


ALTER TABLE public.mensajes OWNER TO postgres;

--
-- Name: mensajes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE mensajes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mensajes_id_seq OWNER TO postgres;

--
-- Name: mensajes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE mensajes_id_seq OWNED BY mensajes.id;


--
-- Name: notificaciones; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE notificaciones (
    id integer NOT NULL,
    id_usuario integer,
    texto text NOT NULL,
    visto integer,
    fecha date NOT NULL
);


ALTER TABLE public.notificaciones OWNER TO postgres;

--
-- Name: notificaciones_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE notificaciones_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.notificaciones_id_seq OWNER TO postgres;

--
-- Name: notificaciones_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE notificaciones_id_seq OWNED BY notificaciones.id;


--
-- Name: paises; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE paises (
    id integer NOT NULL,
    pais text NOT NULL,
    nacionalidad text NOT NULL,
    imgbanderas text NOT NULL
);


ALTER TABLE public.paises OWNER TO postgres;

--
-- Name: paises_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE paises_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.paises_id_seq OWNER TO postgres;

--
-- Name: paises_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE paises_id_seq OWNED BY paises.id;


--
-- Name: persona_carrera; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE persona_carrera (
    id integer NOT NULL,
    id_usuario integer,
    id_carrera_titulo integer
);


ALTER TABLE public.persona_carrera OWNER TO postgres;

--
-- Name: persona_carrera_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE persona_carrera_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.persona_carrera_id_seq OWNER TO postgres;

--
-- Name: persona_carrera_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE persona_carrera_id_seq OWNED BY persona_carrera.id;


--
-- Name: publicaciones; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE publicaciones (
    id integer NOT NULL,
    id_usuario integer,
    id_grupo integer,
    id_archivo integer,
    id_materia integer,
    fecha date NOT NULL,
    visibilidad integer,
    contenido text
);


ALTER TABLE public.publicaciones OWNER TO postgres;

--
-- Name: publicaciones_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE publicaciones_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.publicaciones_id_seq OWNER TO postgres;

--
-- Name: publicaciones_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE publicaciones_id_seq OWNED BY publicaciones.id;


--
-- Name: rating; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE rating (
    id integer NOT NULL,
    id_usuario integer,
    calificacion real NOT NULL
);


ALTER TABLE public.rating OWNER TO postgres;

--
-- Name: rating_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE rating_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rating_id_seq OWNER TO postgres;

--
-- Name: rating_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE rating_id_seq OWNED BY rating.id;


--
-- Name: siguea; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE siguea (
    id integer NOT NULL,
    id_seguidor integer,
    id_seguido integer
);


ALTER TABLE public.siguea OWNER TO postgres;

--
-- Name: siguea_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE siguea_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.siguea_id_seq OWNER TO postgres;

--
-- Name: siguea_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE siguea_id_seq OWNED BY siguea.id;


--
-- Name: usuario; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE usuario (
    id integer NOT NULL,
    nombre text NOT NULL,
    apellido text NOT NULL,
    genero character(1),
    nick_name text,
    escuela integer,
    nacionalidad integer,
    f_nacimiento date NOT NULL,
    rating real NOT NULL,
    foto text NOT NULL,
    password bigint NOT NULL,
    salt bytea NOT NULL
);


ALTER TABLE public.usuario OWNER TO postgres;

--
-- Name: usuario_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE usuario_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.usuario_id_seq OWNER TO postgres;

--
-- Name: usuario_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE usuario_id_seq OWNED BY usuario.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY archivos ALTER COLUMN id SET DEFAULT nextval('archivos_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY carrera ALTER COLUMN id SET DEFAULT nextval('carrera_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY carrera_escuela ALTER COLUMN id SET DEFAULT nextval('carrera_escuela_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY categoria ALTER COLUMN id SET DEFAULT nextval('categoria_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ciudad ALTER COLUMN id SET DEFAULT nextval('ciudad_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY comentarios ALTER COLUMN id SET DEFAULT nextval('comentarios_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY escuela ALTER COLUMN id SET DEFAULT nextval('escuela_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY grupo_usuario ALTER COLUMN id SET DEFAULT nextval('grupo_usuario_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY grupos ALTER COLUMN id SET DEFAULT nextval('grupos_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY institucion ALTER COLUMN id SET DEFAULT nextval('institucion_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY likes ALTER COLUMN id SET DEFAULT nextval('likes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY materias ALTER COLUMN id SET DEFAULT nextval('materias_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY mensajes ALTER COLUMN id SET DEFAULT nextval('mensajes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY notificaciones ALTER COLUMN id SET DEFAULT nextval('notificaciones_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY paises ALTER COLUMN id SET DEFAULT nextval('paises_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY persona_carrera ALTER COLUMN id SET DEFAULT nextval('persona_carrera_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY publicaciones ALTER COLUMN id SET DEFAULT nextval('publicaciones_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY rating ALTER COLUMN id SET DEFAULT nextval('rating_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY siguea ALTER COLUMN id SET DEFAULT nextval('siguea_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usuario ALTER COLUMN id SET DEFAULT nextval('usuario_id_seq'::regclass);


--
-- Data for Name: archivos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY archivos (id, url_archivo, id_usuario, id_grupo) FROM stdin;
\.


--
-- Name: archivos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('archivos_id_seq', 1, false);


--
-- Data for Name: carrera; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY carrera (id, nombre) FROM stdin;
\.


--
-- Data for Name: carrera_escuela; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY carrera_escuela (id, id_carrera, id_escuela) FROM stdin;
\.


--
-- Name: carrera_escuela_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('carrera_escuela_id_seq', 1, false);


--
-- Name: carrera_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('carrera_id_seq', 1, false);


--
-- Data for Name: categoria; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY categoria (id, nombre) FROM stdin;
\.


--
-- Name: categoria_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('categoria_id_seq', 1, false);


--
-- Data for Name: ciudad; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY ciudad (id, nombre, pais) FROM stdin;
\.


--
-- Name: ciudad_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('ciudad_id_seq', 1, false);


--
-- Data for Name: comentarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY comentarios (id, contenido, id_usuario, id_publicacion, fecha) FROM stdin;
\.


--
-- Name: comentarios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('comentarios_id_seq', 1, false);


--
-- Data for Name: escuela; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY escuela (id, nombre, imagen) FROM stdin;
\.


--
-- Name: escuela_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('escuela_id_seq', 1, false);


--
-- Data for Name: grupo_usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY grupo_usuario (id, id_grupo, id_usuario) FROM stdin;
\.


--
-- Name: grupo_usuario_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('grupo_usuario_id_seq', 1, false);


--
-- Data for Name: grupos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY grupos (id, nombre, imagen, visibilidad, id_usuario) FROM stdin;
\.


--
-- Name: grupos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('grupos_id_seq', 1, false);


--
-- Data for Name: institucion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY institucion (id, nombre, id_pais, id_ciudad, imagen, web_site) FROM stdin;
\.


--
-- Name: institucion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('institucion_id_seq', 1, false);


--
-- Data for Name: likes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY likes (id, id_usuario, id_publicacion) FROM stdin;
\.


--
-- Name: likes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('likes_id_seq', 1, false);


--
-- Data for Name: materias; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY materias (id, materia, id_categoria) FROM stdin;
\.


--
-- Name: materias_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('materias_id_seq', 1, false);


--
-- Data for Name: mensajes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY mensajes (id, id_remitente, id_destinatario, mensaje, fecha) FROM stdin;
\.


--
-- Name: mensajes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('mensajes_id_seq', 1, false);


--
-- Data for Name: notificaciones; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY notificaciones (id, id_usuario, texto, visto, fecha) FROM stdin;
\.


--
-- Name: notificaciones_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('notificaciones_id_seq', 1, false);


--
-- Data for Name: paises; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY paises (id, pais, nacionalidad, imgbanderas) FROM stdin;
1	Afganistán	Afgano(a)	afganistán.jpg
2	Albania	Albanés(a)	albania.png
3	Alemania	Alemán(a)	alemania.jpg
4	Andorra	Andorrano(a)	andorra.jpg
5	Angola	Angoleño(a)	angola.png
6	Antigua y barbuda	Antiguano(a)	antiguabarbuda.png
7	Arabia Saudí	Árabe	arabiasaudita.png
8	Argelia	Argelino(a)	argelia.png
9	Argentina	Argentino(a)	argentina.png
10	Armenia	Armenio(a)	armenia.png
11	Australia	Australiano(a)	australia.png
12	Austria	Austriaco(a)	austria.jpg
13	Azerbaiyán	Azerbaiyano(a)	azerbaiyan.jpg
14	Bahamas	Bahameño(a)	bahamas.png
15	Bangladesh	Bangladesí	bangladesh.jpg
16	Barbados	Barbadense	barbados.png
17	Baréin	Bareiní	barein.png
18	Bélgica	Belga	belgica.jpg
19	Argentina	Argentino(a)	argentina.png
20	Armenia	Armenio(a)	armenia.png
21	Australia	Australiano(a)	australia.png
22	Austria	Austriaco(a)	austria.jpg
23	Azerbaiyán	Azerbaiyano(a)	azerbaiyan.jpg
24	Bahamas	Bahameño(a)	bahamas.png
25	Bangladesh	Bangladesí	bangladesh.jpg
26	Barbados	Barbadense	barbados.png
27	Baréin	Bareiní	barein.png
28	Belice	Beliceño(a)	belice.png
29	Benín	Beninés(a)	benin.png
30	Bielorrusia	Bielorruso(a)	bielorusia.png
31	Bolivia	Boliviano(a)	bolivia.png
32	Bosnia-Herzegovina	Bosnio(a)	bosnia.png
33	Botsuana	Botsuano(a)	botsuana.jpg
34	Bulgaria	Búlgaro(a)	bulgaria.png
35	Bután	Butanés(a)	butan.png
36	Camerún	Camerúnes(a)	camerun.png
37	Canadá	Canadiense	canada.jpg
38	Camboya	Camboyano(a)	camboya.png
39	Catar	Catarí	catar.png
40	Chad	Chadiano(a)	chad.png
41	Chile	Chileno(a)	chile.png
42	China	Chino(a)	china.jpg
43	Chipre	Chipriota	chipre.png
44	Colombia	Colombiano(a)	colombia.jpg
45	República del Congo	Congolés(a)	congo.png
46	Corea del norte	Norcoreano(a)	coreanorte.png
47	Corea del sur	Surcoreano(a)	coreasur.jpg
48	Costa de Marfil	Marfileño(a)	costamarfil.png
49	Costa Rica	Costarricense	cr.png
50	Croacia	Croata	croacia.jpg
51	Cuba	Cubano(a)	cuba.png
52	Dinamarca	Danés(a)	dinamarca.jpg
53	Dominica	Dominiqués(a)	dominica.png
54	Ecuador	Ecuatoriano(a)	ecuador.jpg
55	Egipto	Egipcio(a)	egipto.png
56	El Salvador	Salvadoreño(a)	elsalvador.png
57	Emiratos Árabes Unidos	Emiratí	emiratos.png
58	Eritrea	Eritreo(a)	eritrea.png
59	Escocia	Escocés(a)	escocia.png
60	Eslovaquia	Eslovaco(a)	eslovaquia.jpg
61	Eslovenia	Esloveno(a)	eslovenia.jpg
62	España	Español(a)	españa.jpg
63	Estados Unidos	Estadounidense	eu.png
64	Etiopía	Etíope	etiopia.png
65	Filipinas	Filipino(a)	filipinas.png
66	Finlandia	Finlandés(a)	finlandia.png
67	Francia	Francés(a)	francia.jpg
68	Gabón	Gabonés(a)	gabon.jpg
69	Gales	Galés	gales.png
70	Gambia	Gambiano(a)	gambia.png
71	Ghana	Ghanés(a)	ghana.png
72	Grecia	Griego(a)	greacia.png
73	Guam	Guameño(a)	guam.png
74	Guatemala	Guatemalteco(a)	guatemala.png
75	Guyana	Guyanés(a)	guyana.png
76	Haití	Haitiano(a)	haiti.png
77	Holanda	Holandés(a)	holanda.jpg
78	Hungría	Húngaro(a)	hungria.jpg
79	India	Hindú	india.jpg
80	Indonesia	Indonesio(a)	indonesia.jpg
81	Inglaterra	Inglés(a)	inglaterra.png
82	Irak	Iraquí	irak.png
83	Irán	Iraní	iran.jpg
84	Irlanda del norte	Norirlandés(a)	irlandanorte.jpg
85	Irlanda	Irlandés(a)	irlanda.png
86	Israel	Israelí	israel.png
87	Italia	Italiano(a)	italia.png
88	Jamaica	Jamaiquino(a)	jamaica.png
89	Japón	Japonés(a)	japon.jpg
90	Jordania	Jordano(a)	jordania.png
91	Kazajistán	Kazajo	kazajistan.png
92	Kenia	Keniano(a)	kenia.png
93	Kuwait	Kuwaití	kuwait.png
94	Laos	Laosiano(a)	laos.jpg
95	Líbano	Libanés(a)	libano.png
96	Liberia	Liberiano(a)	liberia.png
97	Libia	Libio(a)	libia.jpg
98	Lituania	Lituano(a)	Lituania.jpg
99	Luxemburgo	Luxemburgués(a)	luxemburgo.jpg
100	Macao	Macaense	macao.png
101	Malasia	Malayo	malasia.png
102	Maldivas	Maldivo(a)	maldivas.jpg
103	Marruecos	Marroquí	marruecos.jpg
104	México	Mexicano(a)	mexico.jpg
105	Mongolia	Mongol	mongolia.jpg
106	Mozambique	Mozambiqueño(a)	mozambique.png
107	Namibia	Namibio(a)	namibia.png
108	Nepal	Nepalí	nepal.png
109	Nicaragua	Nicaragüense	nicaragua.png
110	Nigeria	Nigeriano(a)	nigeria.png
111	Noruega	Noruego(a)	noruega.png
112	Nueva Zelanda	Neozelandés(a)	nz.png
113	Omán	Omaní	oman.jpg
114	Pakistán	Pakistaní	pakistan.png
115	Panamá	Panameño(a)	panama.png
116	Paraguay	Paraguayo(a)	paraguay.png
117	Perú	Peruano(a)	peru.png
118	Polonia	Polaco(a)	polinia.jpg
119	Portugal	Portugués(a)	portugal.png
120	Puerto Rico	Puertorriqueño(a)	puertorico.png
121	Qatar	Catarí	qatar.png
122	República Checa	Checo(a)	repcheca.png
123	República Dominicana	Dominicano(a)	repdominicana.png
124	Ruanda	Ruandés	ruanda.png
125	Rumania	Rumano(a)	rumania.jpg
126	Rusia	Ruso(a)	rusia.png
127	Senegal	Senegalés(a)	senegal.png
128	Serbia	Serbio(a)	serbia.png
129	Sudáfrica	Sudafricano(a)	sudafrica.png
130	Suecia	Sueco(a)	suecia.png
131	Suiza	Suizo(a)	suiza.jpg
132	Tahití	Tahitiano(a)	tahiti.jpg
133	Togo	Togolés(a)	togo.png
134	Túnez	tunecino(a)	tunez.png
135	Turkmenistán	Turcomano(a)	turkm.png
136	Panamá	Panameño(a)	panama.png
137	Paraguay	Paraguayo(a)	paraguay.png
138	Perú	Peruano(a)	peru.png
139	Polonia	Polaco(a)	polinia.jpg
140	Portugal	Portugués(a)	portugal.png
141	Puerto Rico	Puertorriqueño(a)	puertorico.png
142	Qatar	Catarí	qatar.png
143	República Checa	Checo(a)	repcheca.png
144	República Dominicana	Dominicano(a)	repdominicana.png
145	Ruanda	Ruandés	ruanda.png
146	Rumania	Rumano(a)	rumania.jpg
147	Rusia	Ruso(a)	rusia.png
148	Senegal	Senegalés(a)	senegal.png
149	Serbia	Serbio(a)	serbia.png
150	Sudáfrica	Sudafricano(a)	sudafrica.png
151	Suecia	Sueco(a)	suecia.png
152	Suiza	Suizo(a)	suiza.jpg
153	Tahití	Tahitiano(a)	tahiti.jpg
154	Togo	Togolés(a)	togo.png
155	Túnez	tunecino(a)	tunez.png
156	Turkmenistán	Turcomano(a)	turkm.png
157	Turquía	Turco(a)	turquia.png
158	Ucrania	Ucraniano(a)	ucrania.jpg
159	Uruguay	Uruguayo(a)	uruguay.jpg
160	Vietnam	Vietnamita	vn.png
161	Yugoslavia	Yugoslavo(a)	yugoslavia.jpg
162	Zaire	Zaireño	zaire.png
\.


--
-- Name: paises_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('paises_id_seq', 162, true);


--
-- Data for Name: persona_carrera; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY persona_carrera (id, id_usuario, id_carrera_titulo) FROM stdin;
\.


--
-- Name: persona_carrera_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('persona_carrera_id_seq', 1, false);


--
-- Data for Name: publicaciones; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY publicaciones (id, id_usuario, id_grupo, id_archivo, id_materia, fecha, visibilidad, contenido) FROM stdin;
\.


--
-- Name: publicaciones_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('publicaciones_id_seq', 1, false);


--
-- Data for Name: rating; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY rating (id, id_usuario, calificacion) FROM stdin;
\.


--
-- Name: rating_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('rating_id_seq', 1, false);


--
-- Data for Name: siguea; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY siguea (id, id_seguidor, id_seguido) FROM stdin;
\.


--
-- Name: siguea_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('siguea_id_seq', 1, false);


--
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY usuario (id, nombre, apellido, genero, nick_name, escuela, nacionalidad, f_nacimiento, rating, foto, password, salt) FROM stdin;
\.


--
-- Name: usuario_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('usuario_id_seq', 1, false);


--
-- Name: archivos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY archivos
    ADD CONSTRAINT archivos_pkey PRIMARY KEY (id);


--
-- Name: carrera_escuela_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY carrera_escuela
    ADD CONSTRAINT carrera_escuela_pkey PRIMARY KEY (id);


--
-- Name: carrera_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY carrera
    ADD CONSTRAINT carrera_pkey PRIMARY KEY (id);


--
-- Name: categoria_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY categoria
    ADD CONSTRAINT categoria_pkey PRIMARY KEY (id);


--
-- Name: ciudad_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY ciudad
    ADD CONSTRAINT ciudad_pkey PRIMARY KEY (id);


--
-- Name: comentarios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY comentarios
    ADD CONSTRAINT comentarios_pkey PRIMARY KEY (id);


--
-- Name: escuela_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY escuela
    ADD CONSTRAINT escuela_pkey PRIMARY KEY (id);


--
-- Name: grupo_usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY grupo_usuario
    ADD CONSTRAINT grupo_usuario_pkey PRIMARY KEY (id);


--
-- Name: grupos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY grupos
    ADD CONSTRAINT grupos_pkey PRIMARY KEY (id);


--
-- Name: institucion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY institucion
    ADD CONSTRAINT institucion_pkey PRIMARY KEY (id);


--
-- Name: likes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY likes
    ADD CONSTRAINT likes_pkey PRIMARY KEY (id);


--
-- Name: materias_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY materias
    ADD CONSTRAINT materias_pkey PRIMARY KEY (id);


--
-- Name: mensajes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY mensajes
    ADD CONSTRAINT mensajes_pkey PRIMARY KEY (id);


--
-- Name: notificaciones_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY notificaciones
    ADD CONSTRAINT notificaciones_pkey PRIMARY KEY (id);


--
-- Name: paises_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY paises
    ADD CONSTRAINT paises_pkey PRIMARY KEY (id);


--
-- Name: persona_carrera_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY persona_carrera
    ADD CONSTRAINT persona_carrera_pkey PRIMARY KEY (id);


--
-- Name: publicaciones_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY publicaciones
    ADD CONSTRAINT publicaciones_pkey PRIMARY KEY (id);


--
-- Name: rating_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY rating
    ADD CONSTRAINT rating_pkey PRIMARY KEY (id);


--
-- Name: siguea_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY siguea
    ADD CONSTRAINT siguea_pkey PRIMARY KEY (id);


--
-- Name: usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id);


--
-- Name: archivos_id_grupo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY archivos
    ADD CONSTRAINT archivos_id_grupo_fkey FOREIGN KEY (id_grupo) REFERENCES grupos(id);


--
-- Name: archivos_id_usuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY archivos
    ADD CONSTRAINT archivos_id_usuario_fkey FOREIGN KEY (id_usuario) REFERENCES usuario(id);


--
-- Name: carrera_escuela_id_carrera_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY carrera_escuela
    ADD CONSTRAINT carrera_escuela_id_carrera_fkey FOREIGN KEY (id_carrera) REFERENCES carrera(id);


--
-- Name: carrera_escuela_id_escuela_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY carrera_escuela
    ADD CONSTRAINT carrera_escuela_id_escuela_fkey FOREIGN KEY (id_escuela) REFERENCES escuela(id);


--
-- Name: ciudad_pais_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ciudad
    ADD CONSTRAINT ciudad_pais_fkey FOREIGN KEY (pais) REFERENCES paises(id);


--
-- Name: comentarios_id_publicacion_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY comentarios
    ADD CONSTRAINT comentarios_id_publicacion_fkey FOREIGN KEY (id_publicacion) REFERENCES publicaciones(id);


--
-- Name: comentarios_id_usuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY comentarios
    ADD CONSTRAINT comentarios_id_usuario_fkey FOREIGN KEY (id_usuario) REFERENCES usuario(id);


--
-- Name: grupo_usuario_id_grupo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY grupo_usuario
    ADD CONSTRAINT grupo_usuario_id_grupo_fkey FOREIGN KEY (id_grupo) REFERENCES grupos(id);


--
-- Name: grupo_usuario_id_usuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY grupo_usuario
    ADD CONSTRAINT grupo_usuario_id_usuario_fkey FOREIGN KEY (id_usuario) REFERENCES usuario(id);


--
-- Name: grupos_id_usuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY grupos
    ADD CONSTRAINT grupos_id_usuario_fkey FOREIGN KEY (id_usuario) REFERENCES usuario(id);


--
-- Name: institucion_id_ciudad_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY institucion
    ADD CONSTRAINT institucion_id_ciudad_fkey FOREIGN KEY (id_ciudad) REFERENCES ciudad(id);


--
-- Name: institucion_id_pais_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY institucion
    ADD CONSTRAINT institucion_id_pais_fkey FOREIGN KEY (id_pais) REFERENCES paises(id);


--
-- Name: likes_id_publicacion_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY likes
    ADD CONSTRAINT likes_id_publicacion_fkey FOREIGN KEY (id_publicacion) REFERENCES publicaciones(id);


--
-- Name: likes_id_usuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY likes
    ADD CONSTRAINT likes_id_usuario_fkey FOREIGN KEY (id_usuario) REFERENCES usuario(id);


--
-- Name: materias_id_categoria_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY materias
    ADD CONSTRAINT materias_id_categoria_fkey FOREIGN KEY (id_categoria) REFERENCES categoria(id);


--
-- Name: mensajes_id_destinatario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY mensajes
    ADD CONSTRAINT mensajes_id_destinatario_fkey FOREIGN KEY (id_destinatario) REFERENCES usuario(id);


--
-- Name: mensajes_id_remitente_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY mensajes
    ADD CONSTRAINT mensajes_id_remitente_fkey FOREIGN KEY (id_remitente) REFERENCES usuario(id);


--
-- Name: notificaciones_id_usuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY notificaciones
    ADD CONSTRAINT notificaciones_id_usuario_fkey FOREIGN KEY (id_usuario) REFERENCES usuario(id);


--
-- Name: persona_carrera_id_carrera_titulo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY persona_carrera
    ADD CONSTRAINT persona_carrera_id_carrera_titulo_fkey FOREIGN KEY (id_carrera_titulo) REFERENCES carrera(id);


--
-- Name: persona_carrera_id_usuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY persona_carrera
    ADD CONSTRAINT persona_carrera_id_usuario_fkey FOREIGN KEY (id_usuario) REFERENCES usuario(id);


--
-- Name: publicaciones_id_archivo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY publicaciones
    ADD CONSTRAINT publicaciones_id_archivo_fkey FOREIGN KEY (id_archivo) REFERENCES archivos(id);


--
-- Name: publicaciones_id_grupo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY publicaciones
    ADD CONSTRAINT publicaciones_id_grupo_fkey FOREIGN KEY (id_grupo) REFERENCES grupos(id);


--
-- Name: publicaciones_id_materia_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY publicaciones
    ADD CONSTRAINT publicaciones_id_materia_fkey FOREIGN KEY (id_materia) REFERENCES materias(id);


--
-- Name: publicaciones_id_usuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY publicaciones
    ADD CONSTRAINT publicaciones_id_usuario_fkey FOREIGN KEY (id_usuario) REFERENCES usuario(id);


--
-- Name: rating_id_usuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY rating
    ADD CONSTRAINT rating_id_usuario_fkey FOREIGN KEY (id_usuario) REFERENCES usuario(id);


--
-- Name: siguea_id_seguido_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY siguea
    ADD CONSTRAINT siguea_id_seguido_fkey FOREIGN KEY (id_seguido) REFERENCES usuario(id);


--
-- Name: siguea_id_seguidor_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY siguea
    ADD CONSTRAINT siguea_id_seguidor_fkey FOREIGN KEY (id_seguidor) REFERENCES usuario(id);


--
-- Name: usuario_escuela_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT usuario_escuela_fkey FOREIGN KEY (escuela) REFERENCES escuela(id);


--
-- Name: usuario_nacionalidad_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT usuario_nacionalidad_fkey FOREIGN KEY (nacionalidad) REFERENCES paises(id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

