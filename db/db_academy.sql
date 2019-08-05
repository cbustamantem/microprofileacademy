--
-- PostgreSQL database dump
--

-- Dumped from database version 10.9 (Ubuntu 10.9-1.pgdg18.04+1)
-- Dumped by pg_dump version 10.9 (Ubuntu 10.9-1.pgdg18.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: alumno; Type: TABLE; Schema: public; Owner: cbustamante
--

CREATE TABLE public.alumno (
    id integer NOT NULL,
    persona integer NOT NULL,
    institucion integer NOT NULL
);


ALTER TABLE public.alumno OWNER TO cbustamante;

--
-- Name: alumno_id_seq; Type: SEQUENCE; Schema: public; Owner: cbustamante
--

CREATE SEQUENCE public.alumno_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.alumno_id_seq OWNER TO cbustamante;

--
-- Name: alumno_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cbustamante
--

ALTER SEQUENCE public.alumno_id_seq OWNED BY public.alumno.id;


--
-- Name: ciudad; Type: TABLE; Schema: public; Owner: cbustamante
--

CREATE TABLE public.ciudad (
    id integer NOT NULL,
    descripcion character varying(45) NOT NULL
);


ALTER TABLE public.ciudad OWNER TO cbustamante;

--
-- Name: ciudad_id_seq; Type: SEQUENCE; Schema: public; Owner: cbustamante
--

CREATE SEQUENCE public.ciudad_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ciudad_id_seq OWNER TO cbustamante;

--
-- Name: ciudad_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cbustamante
--

ALTER SEQUENCE public.ciudad_id_seq OWNED BY public.ciudad.id;


--
-- Name: clase; Type: TABLE; Schema: public; Owner: cbustamante
--

CREATE TABLE public.clase (
    id integer NOT NULL,
    descripcion character varying(45),
    fecha date NOT NULL,
    estado integer NOT NULL,
    capacidad integer,
    materia_id integer,
    profesor_id integer
);


ALTER TABLE public.clase OWNER TO cbustamante;

--
-- Name: clase_id_seq; Type: SEQUENCE; Schema: public; Owner: cbustamante
--

CREATE SEQUENCE public.clase_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.clase_id_seq OWNER TO cbustamante;

--
-- Name: clase_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cbustamante
--

ALTER SEQUENCE public.clase_id_seq OWNED BY public.clase.id;


--
-- Name: estado; Type: TABLE; Schema: public; Owner: cbustamante
--

CREATE TABLE public.estado (
    id integer NOT NULL,
    descripcion character varying(45) NOT NULL
);


ALTER TABLE public.estado OWNER TO cbustamante;

--
-- Name: estado_id_seq; Type: SEQUENCE; Schema: public; Owner: cbustamante
--

CREATE SEQUENCE public.estado_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.estado_id_seq OWNER TO cbustamante;

--
-- Name: estado_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cbustamante
--

ALTER SEQUENCE public.estado_id_seq OWNED BY public.estado.id;


--
-- Name: hibernate_sequence; Type: SEQUENCE; Schema: public; Owner: cbustamante
--

CREATE SEQUENCE public.hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hibernate_sequence OWNER TO cbustamante;

--
-- Name: inscripcion; Type: TABLE; Schema: public; Owner: cbustamante
--

CREATE TABLE public.inscripcion (
    id integer NOT NULL,
    id_alumno integer,
    id_clase integer,
    fechainscripcion timestamp without time zone
);


ALTER TABLE public.inscripcion OWNER TO cbustamante;

--
-- Name: inscripcion_id_seq; Type: SEQUENCE; Schema: public; Owner: cbustamante
--

CREATE SEQUENCE public.inscripcion_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.inscripcion_id_seq OWNER TO cbustamante;

--
-- Name: inscripcion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cbustamante
--

ALTER SEQUENCE public.inscripcion_id_seq OWNED BY public.inscripcion.id;


--
-- Name: institucion; Type: TABLE; Schema: public; Owner: cbustamante
--

CREATE TABLE public.institucion (
    id integer NOT NULL,
    descripcion character varying(45) NOT NULL
);


ALTER TABLE public.institucion OWNER TO cbustamante;

--
-- Name: institucion_id_seq; Type: SEQUENCE; Schema: public; Owner: cbustamante
--

CREATE SEQUENCE public.institucion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.institucion_id_seq OWNER TO cbustamante;

--
-- Name: institucion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cbustamante
--

ALTER SEQUENCE public.institucion_id_seq OWNED BY public.institucion.id;


--
-- Name: materia; Type: TABLE; Schema: public; Owner: cbustamante
--

CREATE TABLE public.materia (
    id integer NOT NULL,
    descripcion character varying(45) NOT NULL
);


ALTER TABLE public.materia OWNER TO cbustamante;

--
-- Name: materia_id_seq; Type: SEQUENCE; Schema: public; Owner: cbustamante
--

CREATE SEQUENCE public.materia_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.materia_id_seq OWNER TO cbustamante;

--
-- Name: materia_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cbustamante
--

ALTER SEQUENCE public.materia_id_seq OWNED BY public.materia.id;


--
-- Name: persona; Type: TABLE; Schema: public; Owner: cbustamante
--

CREATE TABLE public.persona (
    id integer NOT NULL,
    nombre character varying(45) NOT NULL,
    apellido character varying(45) NOT NULL,
    email character varying(45),
    documento character varying(100),
    tipo_documento_id integer DEFAULT 1,
    sexo "char" DEFAULT 'N'::"char",
    fecha_nac date,
    telefono character varying,
    direccion character varying
);


ALTER TABLE public.persona OWNER TO cbustamante;

--
-- Name: persona_id_seq; Type: SEQUENCE; Schema: public; Owner: cbustamante
--

CREATE SEQUENCE public.persona_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.persona_id_seq OWNER TO cbustamante;

--
-- Name: persona_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cbustamante
--

ALTER SEQUENCE public.persona_id_seq OWNED BY public.persona.id;


--
-- Name: profesor; Type: TABLE; Schema: public; Owner: cbustamante
--

CREATE TABLE public.profesor (
    id integer NOT NULL,
    persona integer NOT NULL
);


ALTER TABLE public.profesor OWNER TO cbustamante;

--
-- Name: profesor_id_seq; Type: SEQUENCE; Schema: public; Owner: cbustamante
--

CREATE SEQUENCE public.profesor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.profesor_id_seq OWNER TO cbustamante;

--
-- Name: profesor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cbustamante
--

ALTER SEQUENCE public.profesor_id_seq OWNED BY public.profesor.id;


--
-- Name: profesor_materia; Type: TABLE; Schema: public; Owner: cbustamante
--

CREATE TABLE public.profesor_materia (
    profesor integer NOT NULL,
    materia integer NOT NULL
);


ALTER TABLE public.profesor_materia OWNER TO cbustamante;

--
-- Name: tipo_documento; Type: TABLE; Schema: public; Owner: cbustamante
--

CREATE TABLE public.tipo_documento (
    id integer NOT NULL,
    descripcion character varying
);


ALTER TABLE public.tipo_documento OWNER TO cbustamante;

--
-- Name: tipo_documento_id_seq; Type: SEQUENCE; Schema: public; Owner: cbustamante
--

CREATE SEQUENCE public.tipo_documento_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tipo_documento_id_seq OWNER TO cbustamante;

--
-- Name: tipo_documento_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: cbustamante
--

ALTER SEQUENCE public.tipo_documento_id_seq OWNED BY public.tipo_documento.id;


--
-- Name: alumno id; Type: DEFAULT; Schema: public; Owner: cbustamante
--

ALTER TABLE ONLY public.alumno ALTER COLUMN id SET DEFAULT nextval('public.alumno_id_seq'::regclass);


--
-- Name: ciudad id; Type: DEFAULT; Schema: public; Owner: cbustamante
--

ALTER TABLE ONLY public.ciudad ALTER COLUMN id SET DEFAULT nextval('public.ciudad_id_seq'::regclass);


--
-- Name: clase id; Type: DEFAULT; Schema: public; Owner: cbustamante
--

ALTER TABLE ONLY public.clase ALTER COLUMN id SET DEFAULT nextval('public.clase_id_seq'::regclass);


--
-- Name: estado id; Type: DEFAULT; Schema: public; Owner: cbustamante
--

ALTER TABLE ONLY public.estado ALTER COLUMN id SET DEFAULT nextval('public.estado_id_seq'::regclass);


--
-- Name: inscripcion id; Type: DEFAULT; Schema: public; Owner: cbustamante
--

ALTER TABLE ONLY public.inscripcion ALTER COLUMN id SET DEFAULT nextval('public.inscripcion_id_seq'::regclass);


--
-- Name: institucion id; Type: DEFAULT; Schema: public; Owner: cbustamante
--

ALTER TABLE ONLY public.institucion ALTER COLUMN id SET DEFAULT nextval('public.institucion_id_seq'::regclass);


--
-- Name: materia id; Type: DEFAULT; Schema: public; Owner: cbustamante
--

ALTER TABLE ONLY public.materia ALTER COLUMN id SET DEFAULT nextval('public.materia_id_seq'::regclass);


--
-- Name: persona id; Type: DEFAULT; Schema: public; Owner: cbustamante
--

ALTER TABLE ONLY public.persona ALTER COLUMN id SET DEFAULT nextval('public.persona_id_seq'::regclass);


--
-- Name: profesor id; Type: DEFAULT; Schema: public; Owner: cbustamante
--

ALTER TABLE ONLY public.profesor ALTER COLUMN id SET DEFAULT nextval('public.profesor_id_seq'::regclass);


--
-- Name: tipo_documento id; Type: DEFAULT; Schema: public; Owner: cbustamante
--

ALTER TABLE ONLY public.tipo_documento ALTER COLUMN id SET DEFAULT nextval('public.tipo_documento_id_seq'::regclass);


--
-- Data for Name: alumno; Type: TABLE DATA; Schema: public; Owner: cbustamante
--

COPY public.alumno (id, persona, institucion) FROM stdin;
\.


--
-- Data for Name: ciudad; Type: TABLE DATA; Schema: public; Owner: cbustamante
--

COPY public.ciudad (id, descripcion) FROM stdin;
1	Asunción
2	Mariano Roque Alonso
3	Luque
4	Villa Elisa
5	Lambaré
6	San Lorenzo
7	Fernando de la Mora
\.


--
-- Data for Name: clase; Type: TABLE DATA; Schema: public; Owner: cbustamante
--

COPY public.clase (id, descripcion, fecha, estado, capacidad, materia_id, profesor_id) FROM stdin;
\.


--
-- Data for Name: estado; Type: TABLE DATA; Schema: public; Owner: cbustamante
--

COPY public.estado (id, descripcion) FROM stdin;
1	A CONFIRMAR
2	CONFIRMADO
3	CANCELADO
4	REALIZADO
5	AUSENTE
\.


--
-- Data for Name: inscripcion; Type: TABLE DATA; Schema: public; Owner: cbustamante
--

COPY public.inscripcion (id, id_alumno, id_clase, fechainscripcion) FROM stdin;
\.


--
-- Data for Name: institucion; Type: TABLE DATA; Schema: public; Owner: cbustamante
--

COPY public.institucion (id, descripcion) FROM stdin;
1	MicroProfile Academy
\.


--
-- Data for Name: materia; Type: TABLE DATA; Schema: public; Owner: cbustamante
--

COPY public.materia (id, descripcion) FROM stdin;
46	Programacion Java 1
47	Matemáticas
48	Data Analysis
\.


--
-- Data for Name: persona; Type: TABLE DATA; Schema: public; Owner: cbustamante
--

COPY public.persona (id, nombre, apellido, email, documento, tipo_documento_id, sexo, fecha_nac, telefono, direccion) FROM stdin;
\.


--
-- Data for Name: profesor; Type: TABLE DATA; Schema: public; Owner: cbustamante
--

COPY public.profesor (id, persona) FROM stdin;
\.


--
-- Data for Name: profesor_materia; Type: TABLE DATA; Schema: public; Owner: cbustamante
--

COPY public.profesor_materia (profesor, materia) FROM stdin;
\.


--
-- Data for Name: tipo_documento; Type: TABLE DATA; Schema: public; Owner: cbustamante
--

COPY public.tipo_documento (id, descripcion) FROM stdin;
1	C.I.
2	R.U.C.
3	PASAPORTE
\.


--
-- Name: alumno_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cbustamante
--

SELECT pg_catalog.setval('public.alumno_id_seq', 388, true);


--
-- Name: ciudad_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cbustamante
--

SELECT pg_catalog.setval('public.ciudad_id_seq', 7, true);


--
-- Name: clase_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cbustamante
--

SELECT pg_catalog.setval('public.clase_id_seq', 679, true);


--
-- Name: estado_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cbustamante
--

SELECT pg_catalog.setval('public.estado_id_seq', 4, true);


--
-- Name: hibernate_sequence; Type: SEQUENCE SET; Schema: public; Owner: cbustamante
--

SELECT pg_catalog.setval('public.hibernate_sequence', 1, false);


--
-- Name: inscripcion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cbustamante
--

SELECT pg_catalog.setval('public.inscripcion_id_seq', 1, false);


--
-- Name: institucion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cbustamante
--

SELECT pg_catalog.setval('public.institucion_id_seq', 35, true);


--
-- Name: materia_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cbustamante
--

SELECT pg_catalog.setval('public.materia_id_seq', 48, true);


--
-- Name: persona_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cbustamante
--

SELECT pg_catalog.setval('public.persona_id_seq', 991, true);


--
-- Name: profesor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cbustamante
--

SELECT pg_catalog.setval('public.profesor_id_seq', 68, true);


--
-- Name: tipo_documento_id_seq; Type: SEQUENCE SET; Schema: public; Owner: cbustamante
--

SELECT pg_catalog.setval('public.tipo_documento_id_seq', 3, true);


--
-- Name: alumno alumno_pkey; Type: CONSTRAINT; Schema: public; Owner: cbustamante
--

ALTER TABLE ONLY public.alumno
    ADD CONSTRAINT alumno_pkey PRIMARY KEY (id);


--
-- Name: ciudad ciudad_pkey; Type: CONSTRAINT; Schema: public; Owner: cbustamante
--

ALTER TABLE ONLY public.ciudad
    ADD CONSTRAINT ciudad_pkey PRIMARY KEY (id);


--
-- Name: clase clase_pkey; Type: CONSTRAINT; Schema: public; Owner: cbustamante
--

ALTER TABLE ONLY public.clase
    ADD CONSTRAINT clase_pkey PRIMARY KEY (id);


--
-- Name: estado estado_pkey; Type: CONSTRAINT; Schema: public; Owner: cbustamante
--

ALTER TABLE ONLY public.estado
    ADD CONSTRAINT estado_pkey PRIMARY KEY (id);


--
-- Name: institucion institucion_pkey; Type: CONSTRAINT; Schema: public; Owner: cbustamante
--

ALTER TABLE ONLY public.institucion
    ADD CONSTRAINT institucion_pkey PRIMARY KEY (id);


--
-- Name: materia materia_pkey; Type: CONSTRAINT; Schema: public; Owner: cbustamante
--

ALTER TABLE ONLY public.materia
    ADD CONSTRAINT materia_pkey PRIMARY KEY (id);


--
-- Name: persona persona_pkey; Type: CONSTRAINT; Schema: public; Owner: cbustamante
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_pkey PRIMARY KEY (id);


--
-- Name: inscripcion pk_incripcion; Type: CONSTRAINT; Schema: public; Owner: cbustamante
--

ALTER TABLE ONLY public.inscripcion
    ADD CONSTRAINT pk_incripcion PRIMARY KEY (id);


--
-- Name: profesor_materia profesor_materia_pkey; Type: CONSTRAINT; Schema: public; Owner: cbustamante
--

ALTER TABLE ONLY public.profesor_materia
    ADD CONSTRAINT profesor_materia_pkey PRIMARY KEY (profesor, materia);


--
-- Name: profesor profesor_pkey; Type: CONSTRAINT; Schema: public; Owner: cbustamante
--

ALTER TABLE ONLY public.profesor
    ADD CONSTRAINT profesor_pkey PRIMARY KEY (id);


--
-- Name: tipo_documento tipo_documento_pkey; Type: CONSTRAINT; Schema: public; Owner: cbustamante
--

ALTER TABLE ONLY public.tipo_documento
    ADD CONSTRAINT tipo_documento_pkey PRIMARY KEY (id);


--
-- Name: alumno fk_alumno_institucion1; Type: FK CONSTRAINT; Schema: public; Owner: cbustamante
--

ALTER TABLE ONLY public.alumno
    ADD CONSTRAINT fk_alumno_institucion1 FOREIGN KEY (institucion) REFERENCES public.institucion(id);


--
-- Name: alumno fk_alumno_persona1; Type: FK CONSTRAINT; Schema: public; Owner: cbustamante
--

ALTER TABLE ONLY public.alumno
    ADD CONSTRAINT fk_alumno_persona1 FOREIGN KEY (persona) REFERENCES public.persona(id);


--
-- Name: clase fk_clase_estado1; Type: FK CONSTRAINT; Schema: public; Owner: cbustamante
--

ALTER TABLE ONLY public.clase
    ADD CONSTRAINT fk_clase_estado1 FOREIGN KEY (estado) REFERENCES public.estado(id);


--
-- Name: clase fk_materia_clase; Type: FK CONSTRAINT; Schema: public; Owner: cbustamante
--

ALTER TABLE ONLY public.clase
    ADD CONSTRAINT fk_materia_clase FOREIGN KEY (materia_id) REFERENCES public.materia(id);


--
-- Name: clase fk_profesor_clase; Type: FK CONSTRAINT; Schema: public; Owner: cbustamante
--

ALTER TABLE ONLY public.clase
    ADD CONSTRAINT fk_profesor_clase FOREIGN KEY (profesor_id) REFERENCES public.profesor(id);


--
-- Name: profesor_materia fk_profesor_has_materia_materia1; Type: FK CONSTRAINT; Schema: public; Owner: cbustamante
--

ALTER TABLE ONLY public.profesor_materia
    ADD CONSTRAINT fk_profesor_has_materia_materia1 FOREIGN KEY (materia) REFERENCES public.materia(id);


--
-- Name: profesor_materia fk_profesor_has_materia_profesor1; Type: FK CONSTRAINT; Schema: public; Owner: cbustamante
--

ALTER TABLE ONLY public.profesor_materia
    ADD CONSTRAINT fk_profesor_has_materia_profesor1 FOREIGN KEY (profesor) REFERENCES public.profesor(id);


--
-- Name: profesor fk_profesor_persona1; Type: FK CONSTRAINT; Schema: public; Owner: cbustamante
--

ALTER TABLE ONLY public.profesor
    ADD CONSTRAINT fk_profesor_persona1 FOREIGN KEY (persona) REFERENCES public.persona(id);


--
-- Name: persona fk_tipo_documento; Type: FK CONSTRAINT; Schema: public; Owner: cbustamante
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT fk_tipo_documento FOREIGN KEY (tipo_documento_id) REFERENCES public.tipo_documento(id);


--
-- PostgreSQL database dump complete
--

