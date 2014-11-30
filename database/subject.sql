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
    nacionalidad text NOT NULL
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
    visibilidad integer
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
-- Name: usuario; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE usuario (
    id integer NOT NULL,
    nombre text NOT NULL,
    apellido text NOT NULL,
    genero character(1),
    nick_name text,
    foto bytea,
    escuela integer,
    password character varying NOT NULL,
    nacionalidad integer,
    f_nacimiento date NOT NULL,
    rating real NOT NULL
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

COPY paises (id, pais, nacionalidad) FROM stdin;
\.


--
-- Name: paises_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('paises_id_seq', 1, false);


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

COPY publicaciones (id, id_usuario, id_grupo, id_archivo, id_materia, fecha, visibilidad) FROM stdin;
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
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY usuario (id, nombre, apellido, genero, nick_name, foto, escuela, password, nacionalidad, f_nacimiento, rating) FROM stdin;
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

