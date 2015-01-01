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
    id_grupo integer,
    tipo text
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
    fecha date NOT NULL,
    hora time without time zone NOT NULL
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
    imagen text,
    id_inst integer
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
    web_site text,
    imagen text
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
    id_categoria integer,
    incidencias integer
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
    imgbanderas text NOT NULL,
    incidencias integer
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
    contenido text,
    hora time without time zone NOT NULL,
    calificacion real,
    num_calif integer
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

COPY archivos (id, url_archivo, id_usuario, id_grupo, tipo) FROM stdin;
\.


--
-- Name: archivos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('archivos_id_seq', 6, true);


--
-- Data for Name: carrera; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY carrera (id, nombre) FROM stdin;
1	Actuaría
2	Arquitectura
3	Arquitectura del paisaje
4	Ciencias de la computación
5	Diseño industrial
6	Física
7	Ingeniería civil
8	Ingeniería de minas y metalurgia
9	Ingeniería electrica elctrónica
10	Ingeniería en computación
11	Ingeniería en telecomunicaciones
12	Ingeniería geofísica
13	Ingeniería geológica
14	Ingeniería industrial
15	Ingeniería mecánica
16	Ingeniería mecánica electrica
17	Ingeniería petrolera
18	Ingeniería química
19	Ingeniería química metalúrgica
20	Ingeniería topográfica y geodesica
21	Matemáticas aplicadas y computación
22	Matemáticas
23	Urbanismo
24	Ingeniería mecatrónica
25	Ingeniería geomática
26	Tecnología
27	Ciencias de la tierra
28	Ingeniería en energias renovables
29	Nanotecnología
30	Ingeniería en telecomunicaciones, sistemas y electrónica
31	Geociencias
32	Tecnologías para la información en ciencias
33	Ciencia de materiales sustentables
34	Física biomédica
35	Biología
36	Cirujano dentista
37	Enfermería y Obstetricia
38	Ingeniería Agrícola
39	Ingeniería en alimentos
40	Investigación biomédica básica
41	Medicina veterinaria y zootecnia
42	Médico cirujano
43	Optometría
44	Psicología
45	Química
46	Química de alimentos
47	Química farmaceutico biológica
48	Química industrial
49	Ciencias Genómicas
50	Ciencias ambientales
51	Manejo sustentable de zonas costeras
52	Bioquímica dignóstica
53	Farmacia
54	Enfermería
55	Fisioterapia
56	Odontología
57	Ciencias agrogenómicas
58	Ciencia forense
59	Administración
60	Ciencias de la comunicación
61	Ciencias políticas y administración pública
62	Contaduría
63	Derecho
64	Economía
65	Gografía
66	Informática
67	Planificación para el desarrrollo AGR
68	Relaciones internacionales
69	Sociología
70	Economía industrial
71	Administración agropecuaria
72	Comunicación
73	Comunicación y periodismo
74	Estudios sociales y gestión local
75	Artes visuales
76	Bibliotecología
77	Canto
78	Composición
79	Comunicación gráfica
80	Diseño gráfico
81	Educación musical
82	Enseñanza de inglés
83	Estudios latinoamericanos
84	Etnomusicología
85	Filosofía
86	Historia
87	Instrumentista
88	Lengua y literaturas hispánicas
89	Lengua y literaturas modernas alemanas
90	Lengua y literaturas modernas francesas
91	Lengua y literaturas modernas inglesas
92	Lengua y literaturas modernas italianas
93	Letras clásicas
94	Literatura dramática y teatro
95	Pedagogía
96	Piano
97	Diseño y comunicación visual
98	Enseñanza de alemán como lengua extranjera
99	Enseñanza de español como lengua extranjera
100	Enseñanza de francés como lengua extranjera
101	Enseñanza de inglés como lengua extranjera
102	Enseñanza de italiano como lengua extranjera
103	Desarrollo y gestión interculturales
104	Lengua y literaturas modernas portuguesas
105	Geohistoria
106	Literatura intercultural
107	Historia del arte
108	Arte y diseño
109	cinematografía
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

SELECT pg_catalog.setval('carrera_id_seq', 109, true);


--
-- Data for Name: categoria; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY categoria (id, nombre) FROM stdin;
1	Matemáticas
2	Computación
3	Física
4	Química
5	Literatura
6	Filosofía
7	Deportes
8	Música
9	Política
10	Biología
11	Arquitectura
12	Español
13	Finanzas
14	Economía
15	Cocina
16	Medicina
17	Psicología
18	Odontología
19	Tecnología
20	Comunicaciones
21	Veterinaria
22	Trabajo social
23	Administración
24	Historia
25	Geografía
\.


--
-- Name: categoria_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('categoria_id_seq', 25, true);


--
-- Data for Name: ciudad; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY ciudad (id, nombre, pais) FROM stdin;
1	Ciudad de México	104
2	Ecatepec	104
3	Guadalajara	104
4	Puebla	104
5	Juárez	104
6	Tijuana	104
7	León	104
8	Zapopan	104
9	MOnterrey	104
10	Chihuahua	104
11	Mérida	104
12	San Luis Potosí	104
13	Aguascalientes	104
14	Hermosillo	104
15	Saltillo	104
16	Mexicalli	104
17	Culiacán	104
18	Acapulco	104
19	Cancún	104
20	Querétaro	104
21	Torreón	104
22	Morelia	104
23	Reynosa	104
24	Tlaquepaque	104
25	Tuxla	104
26	Durango	104
27	Matamoros	104
28	Xalapa	104
29	Mazatlán	104
30	Villahermosa	104
31	Celaya	104
32	Cuernavaca	104
33	Tepic	104
34	Ciudad Victoria	104
35	Tampico	104
36	Ensenada	104
37	Uruapan	104
38	Los Mochis	104
39	Pachuca	104
40	Oaxaca	104
41	Tehuacán	104
42	Coatzacolacos	104
43	Campeche	104
44	Monclova	104
45	La Paz	104
46	Nogales	104
47	Puerto Vallarta	104
48	Tapachula	104
49	Chilpancingo	104
50	Ciudad del Carmen	104
51	Chalco	104
52	San Critobal de las casas	104
53	Colima	104
54	Manzanillo	104
55	Zacatecas	104
56	Guadalupe	104
57	Fresnillo	104
58	Tokio	89
59	Nueva York	63
60	Sao Paulo	163
61	Seúl	47
62	Bombay	79
63	Los Angeles	63
64	Osaka	89
65	Yakarta	80
66	El Cairo	55
67	Moscú	126
68	Calcuta	79
69	Manila	65
70	Londres	81
71	Shangai	42
72	París	67
73	Chicago	63
74	Lima	117
75	Bogotá	44
76	Buenos Aires	9
77	Sidney	21
78	Roma	87
79	Atenas	72
80	Cambridge	63
81	Palo Alto	63
82	Oxford	81
83	New Haven	63
84	San Diego	63
85	Bristol	81
86	Burnaby	37
87	Bochum	3
88	Xi an	42
89	Valencia	62
90	Santiago	41
91	San Juan	120
\.


--
-- Name: ciudad_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('ciudad_id_seq', 91, true);


--
-- Data for Name: comentarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY comentarios (id, contenido, id_usuario, id_publicacion, fecha, hora) FROM stdin;
\.


--
-- Name: comentarios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('comentarios_id_seq', 1, false);


--
-- Data for Name: escuela; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY escuela (id, nombre, imagen, id_inst) FROM stdin;
1	Facultad de Arquitectura	/static/img/inst/arqui.png	1
2	Facultad de Artes y Diseño	/static/img/inst/fad.jpg	1
3	Facultad de Ciencias	/static/img/inst/ciencias.jpg	1
4	Facultad de Ciencias Políticas y Sociales	/static/img/inst/polacas.jpg	1
5	Facultad de Contaduría y administración	/static/img/inst/conta.jpg	1
6	Facultad de Derecho	/static/img/inst/derecho.jpg	1
7	Facultad de Economía	/static/img/inst/eco.png	1
8	Facultad de Estudios Superiores Acatlán	/static/img/inst/Fesa.jpg	1
9	Facultad de Estudios Superiores Aragón	/static/img/inst/arag.jpg	1
10	Facultad de Estudios Superiores Cuautitlán	/static/img/inst/cuaut.jpg	1
11	Facultad de Estudios Superiores Iztacala	/static/img/inst/iz.jpg	1
12	Facultad de Estudios Superiores Zaragoza	/static/img/inst/za.jpg	1
13	Facultad de Filosofía y Letras	/static/img/inst/fyl.png	1
14	Facultad de Igeniería	/static/img/inst/inge.jpg	1
15	Facultad de Medicina	/static/img/inst/med.jpg	1
16	Facultad de Medicina Veterinaria y Zootecnia	/static/img/inst/fmvz.jpg	1
17	Facultad de Odontología	/static/img/inst/odonto.jpg	1
18	Facultad de Psicología	/static/img/inst/psico.jpg	1
19	Facultad de Química	/static/img/inst/quim.jpg	1
\.


--
-- Name: escuela_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('escuela_id_seq', 19, true);


--
-- Data for Name: grupo_usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY grupo_usuario (id, id_grupo, id_usuario) FROM stdin;
\.


--
-- Name: grupo_usuario_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('grupo_usuario_id_seq', 1, true);


--
-- Data for Name: grupos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY grupos (id, nombre, imagen, visibilidad, id_usuario) FROM stdin;
\.


--
-- Name: grupos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('grupos_id_seq', 1, true);


--
-- Data for Name: institucion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY institucion (id, nombre, id_pais, id_ciudad, web_site, imagen) FROM stdin;
1	Universidad Nacional Auónoma de México	104	1	http://www.unam.mx/	/static/img/inst/unam.png
2	Instituto Politécnico Nacional	104	1	www.ipn.mx/	/static/img/inst/ipn.jpg
3	Universidad Autónoma Metropolitana	104	1	www.uam.mx	/static/img/inst/uam.jpg
4	Universidad Iberoamericana	104	1	uia.mx/	/static/img/inst/ibero.jpg
5	Universidad Anáhuac	104	1	www.anahuac.mx/	/static/img/inst/anahuac.jpg
6	Tecnológico de Monterrey	104	9	www.itesm.mx/	/static/img/inst/tec.jpg
7	Instituto Tecnológico Autónomo de México	104	1	www.itam.mx	/static/img/inst/itam.jpg
8	Universidad Autónoma de la Ciudad de México	104	1	www.uacm.edu.mx/	/static/img/inst/uacm.png
9	Universidad Autónoma de Guadalajara	104	3	www.uag.mx/	/static/img/inst/uag.jpg
10	Universidad Autónoma de Nuevo León	104	9	www.uanl.mx/	/static/img/inst/uanl.png
11	Universidad Autónoma de Querétaro	104	20	www.uaq.mx/	/static/img/inst/uaq.jpg
12	Universidad Autónoma de Zacatecas	104	55	www.uaz.edu.mx/	/static/img/inst/uaz.jpg
13	Universidad Autónoma de Guerrero	104	49	www.uagro.mx/	/static/img/inst/uagro.png
14	Universidad Autónoma de Sinaloa	104	17	www.uas.edu.mx/	/static/img/inst/uas.jpg
15	Universidad Autónoma de Tamaulipas	104	34	www.uat.edu.mx/	/static/img/inst/uat.png
16	Universidad Autónoma del Carmen	104	50	www.unacar.mx/	/static/img/inst/unacar.png
17	Universidad del Valle de México	104	1	www.universidaduvm.mx/	/static/img/inst/uvm.jpg
18	Instituto Tecnológico de Acapulco	104	18	www.it-acapulco.edu.mx/	/static/img/inst/ita.jpg
19	Universidad Panamericana	104	1	www.up.edu.mx/	/static/img/inst/up.jpg
20	Universidad Autónoma de San Luis Potosí	104	12	www.uaslp.mx/	/static/img/inst/uaslp.png
21	Universidad Autónoma de Yucatan	104	11	www.uady.mx/	/static/img/inst/uay.jpg
22	Universidad Autónoma de Chiapas	104	25	www.unach.mx/	/static/img/inst/uac.jpg
23	Universidad Tecnológica de México	104	1	www.unitec.mx/‎	/static/img/inst/unitec.jpg
24	Universidad de Harvard 	63	80	www.harvard.edu/	/static/img/inst/harv.png
25	Universidad Stanford	63	81	www.stanford.edu/	/static/img/inst/stan.png
26	Instituto Tecnológico de Massachusetts	63	80	web.mit.edu/	/static/img/inst/mit.jpg
27	Universidad de Columbia	63	59	www.columbia.edu/	/static/img/inst/col.jpg
28	Universidad de Chicago	63	73	www.uchicago.edu/	/static/img/inst/chic.png
29	Universidad de Oxford	81	82	www.ox.ac.uk/	/static/img/inst/ox.jpg
30	Universidad Yale	63	83	www.yale.edu/	/static/img/inst/yale.jpg
31	Universidad de California en los Angeles	63	63	www.ucla.edu/	/static/img/inst/ucla.png
32	Universidad Cornell	63	59	www.cornell.edu/	/static/img/inst/cor.jpg
33	Universidad de California en San Diego	63	84	ucsd.edu/	/static/img/inst/ucsd.png
34	Universidad de Tokio	89	58	www.u-tokyo.ac.jp/index_j.html	/static/img/inst/tokio.jpg
35	Universidad de Pierre y Marie Curie	67	72	www.upmc.fr/en/	/static/img/inst/upmc.jpg
36	Universidad de Bristol	81	85	www.bris.ac.uk/	/static/img/inst/bristol.png
37	Universidad Simon Fraser	37	86	www.sfu.ca/	/static/img/inst/usg.jpg
38	Universidad Ruhr de Bochum	3	87	www.ruhr-uni-bochum.de	/static/img/inst/rub.png
39	Universidad Jiaotong de Xi an	42	88	www.xjtu.edu.cn/en/	/static/img/inst/xi.png
40	Universidad de Valencia	62	89	http://www.uv.es/uvweb/universidad/es/universidad-valencia-1285845048380.html	/static/img/inst/valencia.png
41	Universidad de Sao Paulo	163	60	www5.usp.br/	/static/img/inst/sao.jpg
42	Universidad de Chile	41	90	www.uchile.cl/	/static/img/inst/chile.png
43	Universidad Nacional de Colombia	44	75	unal.edu.co/	/static/img/inst/col.png
44	Universidad de Puerto Rico	120	91	www.upr.edu/	/static/img/inst/pr.png
45	Universidad Tecnológica Nacional	9	76	www.utn.edu.ar/	/static/img/inst/utn.jpg
46	Universidad Nacional Mayor de San Marcos	117	74	www.unmsm.edu.pe/	/static/img/inst/sm.png
\.


--
-- Name: institucion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('institucion_id_seq', 46, true);


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

COPY materias (id, materia, id_categoria, incidencias) FROM stdin;
1	Cálculo	1	\N
2	Geometría	1	\N
3	Álgebra	1	\N
4	Trigonometría	1	\N
5	Programación	2	\N
6	Sistemas operativos	2	\N
7	Compiladores	2	\N
8	Estructuras de datos	2	\N
9	Mecánica	3	\N
10	Óptica	3	\N
11	Movimiento	3	\N
12	Energía	3	\N
13	Narrativa	5	\N
14	Didáctica	5	\N
15	Dramática	5	\N
16	Elementos	4	\N
17	Sustancias	4	\N
18	Conceptos básicos	4	\N
19	Moléculas	4	\N
20	Acidos y bases	4	\N
21	Antigua	6	\N
22	Medieval y renacentista	6	\N
23	Moderna	6	\N
24	Contemporánea	6	\N
25	Volleyball	7	\N
26	Basketball	7	\N
27	Futbol	7	\N
28	Células	10	\N
29	Aparatos y sistemas	10	\N
30	Reino animal	10	\N
31	Genética	10	\N
32	Anatomía	10	\N
33	Ecología	10	\N
34	Diseño	11	\N
35	Historia	11	\N
36	Ortografía	12	\N
37	Acentuación	12	\N
38	Oferta y demanda	14	\N
39	Educativa	17	\N
40	Clínica	17	\N
41	laboral	17	\N
42	De México	24	\N
43	Universal	24	\N
44	Relieve	25	\N
45	Clima	25	\N
46	Continentes	25	\N
\.


--
-- Name: materias_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('materias_id_seq', 46, true);


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

COPY paises (id, pais, nacionalidad, imgbanderas, incidencias) FROM stdin;
1	Afganistán	Afgano(a)	afganistán.jpg	\N
2	Albania	Albanés(a)	albania.png	\N
3	Alemania	Alemán(a)	alemania.jpg	\N
4	Andorra	Andorrano(a)	andorra.jpg	\N
5	Angola	Angoleño(a)	angola.png	\N
6	Antigua y barbuda	Antiguano(a)	antiguabarbuda.png	\N
7	Arabia Saudí	Árabe	arabiasaudita.png	\N
8	Argelia	Argelino(a)	argelia.png	\N
9	Argentina	Argentino(a)	argentina.png	\N
10	Armenia	Armenio(a)	armenia.png	\N
11	Australia	Australiano(a)	australia.png	\N
12	Austria	Austriaco(a)	austria.jpg	\N
13	Azerbaiyán	Azerbaiyano(a)	azerbaiyan.jpg	\N
14	Bahamas	Bahameño(a)	bahamas.png	\N
15	Bangladesh	Bangladesí	bangladesh.jpg	\N
16	Barbados	Barbadense	barbados.png	\N
17	Baréin	Bareiní	barein.png	\N
18	Bélgica	Belga	belgica.jpg	\N
19	Argentina	Argentino(a)	argentina.png	\N
20	Armenia	Armenio(a)	armenia.png	\N
21	Australia	Australiano(a)	australia.png	\N
22	Austria	Austriaco(a)	austria.jpg	\N
23	Azerbaiyán	Azerbaiyano(a)	azerbaiyan.jpg	\N
24	Bahamas	Bahameño(a)	bahamas.png	\N
25	Bangladesh	Bangladesí	bangladesh.jpg	\N
26	Barbados	Barbadense	barbados.png	\N
27	Baréin	Bareiní	barein.png	\N
28	Belice	Beliceño(a)	belice.png	\N
29	Benín	Beninés(a)	benin.png	\N
30	Bielorrusia	Bielorruso(a)	bielorusia.png	\N
31	Bolivia	Boliviano(a)	bolivia.png	\N
32	Bosnia-Herzegovina	Bosnio(a)	bosnia.png	\N
33	Botsuana	Botsuano(a)	botsuana.jpg	\N
34	Bulgaria	Búlgaro(a)	bulgaria.png	\N
35	Bután	Butanés(a)	butan.png	\N
36	Camerún	Camerúnes(a)	camerun.png	\N
37	Canadá	Canadiense	canada.jpg	\N
38	Camboya	Camboyano(a)	camboya.png	\N
39	Catar	Catarí	catar.png	\N
40	Chad	Chadiano(a)	chad.png	\N
41	Chile	Chileno(a)	chile.png	\N
42	China	Chino(a)	china.jpg	\N
43	Chipre	Chipriota	chipre.png	\N
44	Colombia	Colombiano(a)	colombia.jpg	\N
45	República del Congo	Congolés(a)	congo.png	\N
46	Corea del norte	Norcoreano(a)	coreanorte.png	\N
47	Corea del sur	Surcoreano(a)	coreasur.jpg	\N
48	Costa de Marfil	Marfileño(a)	costamarfil.png	\N
49	Costa Rica	Costarricense	cr.png	\N
50	Croacia	Croata	croacia.jpg	\N
51	Cuba	Cubano(a)	cuba.png	\N
52	Dinamarca	Danés(a)	dinamarca.jpg	\N
53	Dominica	Dominiqués(a)	dominica.png	\N
54	Ecuador	Ecuatoriano(a)	ecuador.jpg	\N
55	Egipto	Egipcio(a)	egipto.png	\N
56	El Salvador	Salvadoreño(a)	elsalvador.png	\N
57	Emiratos Árabes Unidos	Emiratí	emiratos.png	\N
58	Eritrea	Eritreo(a)	eritrea.png	\N
59	Escocia	Escocés(a)	escocia.png	\N
60	Eslovaquia	Eslovaco(a)	eslovaquia.jpg	\N
61	Eslovenia	Esloveno(a)	eslovenia.jpg	\N
62	España	Español(a)	españa.jpg	\N
63	Estados Unidos	Estadounidense	eu.png	\N
64	Etiopía	Etíope	etiopia.png	\N
65	Filipinas	Filipino(a)	filipinas.png	\N
66	Finlandia	Finlandés(a)	finlandia.png	\N
67	Francia	Francés(a)	francia.jpg	\N
68	Gabón	Gabonés(a)	gabon.jpg	\N
69	Gales	Galés	gales.png	\N
70	Gambia	Gambiano(a)	gambia.png	\N
71	Ghana	Ghanés(a)	ghana.png	\N
72	Grecia	Griego(a)	greacia.png	\N
73	Guam	Guameño(a)	guam.png	\N
74	Guatemala	Guatemalteco(a)	guatemala.png	\N
75	Guyana	Guyanés(a)	guyana.png	\N
76	Haití	Haitiano(a)	haiti.png	\N
77	Holanda	Holandés(a)	holanda.jpg	\N
78	Hungría	Húngaro(a)	hungria.jpg	\N
79	India	Hindú	india.jpg	\N
80	Indonesia	Indonesio(a)	indonesia.jpg	\N
81	Inglaterra	Inglés(a)	inglaterra.png	\N
82	Irak	Iraquí	irak.png	\N
83	Irán	Iraní	iran.jpg	\N
84	Irlanda del norte	Norirlandés(a)	irlandanorte.jpg	\N
85	Irlanda	Irlandés(a)	irlanda.png	\N
86	Israel	Israelí	israel.png	\N
87	Italia	Italiano(a)	italia.png	\N
88	Jamaica	Jamaiquino(a)	jamaica.png	\N
89	Japón	Japonés(a)	japon.jpg	\N
90	Jordania	Jordano(a)	jordania.png	\N
91	Kazajistán	Kazajo	kazajistan.png	\N
92	Kenia	Keniano(a)	kenia.png	\N
93	Kuwait	Kuwaití	kuwait.png	\N
94	Laos	Laosiano(a)	laos.jpg	\N
95	Líbano	Libanés(a)	libano.png	\N
96	Liberia	Liberiano(a)	liberia.png	\N
97	Libia	Libio(a)	libia.jpg	\N
98	Lituania	Lituano(a)	Lituania.jpg	\N
99	Luxemburgo	Luxemburgués(a)	luxemburgo.jpg	\N
100	Macao	Macaense	macao.png	\N
101	Malasia	Malayo	malasia.png	\N
102	Maldivas	Maldivo(a)	maldivas.jpg	\N
103	Marruecos	Marroquí	marruecos.jpg	\N
104	México	Mexicano(a)	mexico.jpg	\N
105	Mongolia	Mongol	mongolia.jpg	\N
106	Mozambique	Mozambiqueño(a)	mozambique.png	\N
107	Namibia	Namibio(a)	namibia.png	\N
108	Nepal	Nepalí	nepal.png	\N
109	Nicaragua	Nicaragüense	nicaragua.png	\N
110	Nigeria	Nigeriano(a)	nigeria.png	\N
111	Noruega	Noruego(a)	noruega.png	\N
112	Nueva Zelanda	Neozelandés(a)	nz.png	\N
113	Omán	Omaní	oman.jpg	\N
114	Pakistán	Pakistaní	pakistan.png	\N
115	Panamá	Panameño(a)	panama.png	\N
116	Paraguay	Paraguayo(a)	paraguay.png	\N
117	Perú	Peruano(a)	peru.png	\N
118	Polonia	Polaco(a)	polinia.jpg	\N
119	Portugal	Portugués(a)	portugal.png	\N
120	Puerto Rico	Puertorriqueño(a)	puertorico.png	\N
121	Qatar	Catarí	qatar.png	\N
122	República Checa	Checo(a)	repcheca.png	\N
123	República Dominicana	Dominicano(a)	repdominicana.png	\N
124	Ruanda	Ruandés	ruanda.png	\N
125	Rumania	Rumano(a)	rumania.jpg	\N
126	Rusia	Ruso(a)	rusia.png	\N
127	Senegal	Senegalés(a)	senegal.png	\N
128	Serbia	Serbio(a)	serbia.png	\N
129	Sudáfrica	Sudafricano(a)	sudafrica.png	\N
130	Suecia	Sueco(a)	suecia.png	\N
131	Suiza	Suizo(a)	suiza.jpg	\N
132	Tahití	Tahitiano(a)	tahiti.jpg	\N
133	Togo	Togolés(a)	togo.png	\N
134	Túnez	tunecino(a)	tunez.png	\N
135	Turkmenistán	Turcomano(a)	turkm.png	\N
136	Panamá	Panameño(a)	panama.png	\N
137	Paraguay	Paraguayo(a)	paraguay.png	\N
138	Perú	Peruano(a)	peru.png	\N
139	Polonia	Polaco(a)	polinia.jpg	\N
140	Portugal	Portugués(a)	portugal.png	\N
141	Puerto Rico	Puertorriqueño(a)	puertorico.png	\N
142	Qatar	Catarí	qatar.png	\N
143	República Checa	Checo(a)	repcheca.png	\N
144	República Dominicana	Dominicano(a)	repdominicana.png	\N
145	Ruanda	Ruandés	ruanda.png	\N
146	Rumania	Rumano(a)	rumania.jpg	\N
147	Rusia	Ruso(a)	rusia.png	\N
148	Senegal	Senegalés(a)	senegal.png	\N
149	Serbia	Serbio(a)	serbia.png	\N
150	Sudáfrica	Sudafricano(a)	sudafrica.png	\N
151	Suecia	Sueco(a)	suecia.png	\N
152	Suiza	Suizo(a)	suiza.jpg	\N
153	Tahití	Tahitiano(a)	tahiti.jpg	\N
154	Togo	Togolés(a)	togo.png	\N
155	Túnez	tunecino(a)	tunez.png	\N
156	Turkmenistán	Turcomano(a)	turkm.png	\N
157	Turquía	Turco(a)	turquia.png	\N
158	Ucrania	Ucraniano(a)	ucrania.jpg	\N
159	Uruguay	Uruguayo(a)	uruguay.jpg	\N
160	Vietnam	Vietnamita	vn.png	\N
161	Yugoslavia	Yugoslavo(a)	yugoslavia.jpg	\N
162	Zaire	Zaireño	zaire.png	\N
163	Brasil	Brasileño(a)	brasil.png	\N
\.


--
-- Name: paises_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('paises_id_seq', 163, true);


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

COPY publicaciones (id, id_usuario, id_grupo, id_archivo, id_materia, fecha, visibilidad, contenido, hora, calificacion, num_calif) FROM stdin;
\.


--
-- Name: publicaciones_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('publicaciones_id_seq', 6, true);


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

SELECT pg_catalog.setval('usuario_id_seq', 4, true);


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
-- Name: escuela_id_inst_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY escuela
    ADD CONSTRAINT escuela_id_inst_fkey FOREIGN KEY (id_inst) REFERENCES institucion(id);


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

