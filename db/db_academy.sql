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
--

CREATE TABLE public.alumno (
    id integer NOT NULL,
    persona integer NOT NULL,
    institucion integer NOT NULL
);



--
--

CREATE SEQUENCE public.alumno_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;



--
--

ALTER SEQUENCE public.alumno_id_seq OWNED BY public.alumno.id;


--
--

CREATE TABLE public.ciudad (
    id integer NOT NULL,
    descripcion character varying(45) NOT NULL
);



--
--

CREATE SEQUENCE public.ciudad_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;



--
--

ALTER SEQUENCE public.ciudad_id_seq OWNED BY public.ciudad.id;


--
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



--
--

CREATE SEQUENCE public.clase_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;



--
--

ALTER SEQUENCE public.clase_id_seq OWNED BY public.clase.id;


--
--

CREATE TABLE public.estado (
    id integer NOT NULL,
    descripcion character varying(45) NOT NULL
);



--
--

CREATE SEQUENCE public.estado_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;



--
--

ALTER SEQUENCE public.estado_id_seq OWNED BY public.estado.id;


--
--

CREATE SEQUENCE public.hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;



--
--

CREATE TABLE public.inscripcion (
    id integer NOT NULL,
    id_alumno integer,
    id_clase integer,
    fechainscripcion timestamp without time zone
);



--
--

CREATE SEQUENCE public.inscripcion_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;



--
--

ALTER SEQUENCE public.inscripcion_id_seq OWNED BY public.inscripcion.id;


--
--

CREATE TABLE public.institucion (
    id integer NOT NULL,
    descripcion character varying(45) NOT NULL
);



--
--

CREATE SEQUENCE public.institucion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;



--
--

ALTER SEQUENCE public.institucion_id_seq OWNED BY public.institucion.id;


--
--

CREATE TABLE public.materia (
    id integer NOT NULL,
    descripcion character varying(45) NOT NULL
);



--
--

CREATE SEQUENCE public.materia_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;



--
--

ALTER SEQUENCE public.materia_id_seq OWNED BY public.materia.id;


--
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



--
--

CREATE SEQUENCE public.persona_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;



--
--

ALTER SEQUENCE public.persona_id_seq OWNED BY public.persona.id;


--
--

CREATE TABLE public.profesor (
    id integer NOT NULL,
    persona integer NOT NULL
);



--
--

CREATE SEQUENCE public.profesor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;



--
--

ALTER SEQUENCE public.profesor_id_seq OWNED BY public.profesor.id;


--
--

CREATE TABLE public.profesor_materia (
    profesor integer NOT NULL,
    materia integer NOT NULL
);



--
--

CREATE TABLE public.tipo_documento (
    id integer NOT NULL,
    descripcion character varying
);



--
--

CREATE SEQUENCE public.tipo_documento_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;



--
--

ALTER SEQUENCE public.tipo_documento_id_seq OWNED BY public.tipo_documento.id;


--
--

ALTER TABLE ONLY public.alumno ALTER COLUMN id SET DEFAULT nextval('public.alumno_id_seq'::regclass);


--
--

ALTER TABLE ONLY public.ciudad ALTER COLUMN id SET DEFAULT nextval('public.ciudad_id_seq'::regclass);


--
--

ALTER TABLE ONLY public.clase ALTER COLUMN id SET DEFAULT nextval('public.clase_id_seq'::regclass);


--
--

ALTER TABLE ONLY public.estado ALTER COLUMN id SET DEFAULT nextval('public.estado_id_seq'::regclass);


--
--

ALTER TABLE ONLY public.inscripcion ALTER COLUMN id SET DEFAULT nextval('public.inscripcion_id_seq'::regclass);


--
--

ALTER TABLE ONLY public.institucion ALTER COLUMN id SET DEFAULT nextval('public.institucion_id_seq'::regclass);


--
--

ALTER TABLE ONLY public.materia ALTER COLUMN id SET DEFAULT nextval('public.materia_id_seq'::regclass);


--
--

ALTER TABLE ONLY public.persona ALTER COLUMN id SET DEFAULT nextval('public.persona_id_seq'::regclass);


--
--

ALTER TABLE ONLY public.profesor ALTER COLUMN id SET DEFAULT nextval('public.profesor_id_seq'::regclass);


--
--

ALTER TABLE ONLY public.tipo_documento ALTER COLUMN id SET DEFAULT nextval('public.tipo_documento_id_seq'::regclass);


--
--

COPY public.alumno (id, persona, institucion) FROM stdin;
\.


--
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
--

COPY public.clase (id, descripcion, fecha, estado, capacidad, materia_id, profesor_id) FROM stdin;
\.


--
--

COPY public.estado (id, descripcion) FROM stdin;
1	A CONFIRMAR
2	CONFIRMADO
3	CANCELADO
4	REALIZADO
5	AUSENTE
\.


--
--

COPY public.inscripcion (id, id_alumno, id_clase, fechainscripcion) FROM stdin;
\.


--
--

COPY public.institucion (id, descripcion) FROM stdin;
1	MicroProfile Academy
\.


--
--

COPY public.materia (id, descripcion) FROM stdin;
46	Programacion Java 1
47	Matemáticas
48	Data Analysis
\.


--
--

COPY public.persona (id, nombre, apellido, email, documento, tipo_documento_id, sexo, fecha_nac, telefono, direccion) FROM stdin;
\.


--
--

COPY public.profesor (id, persona) FROM stdin;
\.


--
--

COPY public.profesor_materia (profesor, materia) FROM stdin;
\.


--
--

COPY public.tipo_documento (id, descripcion) FROM stdin;
1	C.I.
2	R.U.C.
3	PASAPORTE
\.


--
--

SELECT pg_catalog.setval('public.alumno_id_seq', 388, true);


--
--

SELECT pg_catalog.setval('public.ciudad_id_seq', 7, true);


--
--

SELECT pg_catalog.setval('public.clase_id_seq', 679, true);


--
--

SELECT pg_catalog.setval('public.estado_id_seq', 4, true);


--
--

SELECT pg_catalog.setval('public.hibernate_sequence', 1, false);


--
--

SELECT pg_catalog.setval('public.inscripcion_id_seq', 1, false);


--
--

SELECT pg_catalog.setval('public.institucion_id_seq', 35, true);


--
--

SELECT pg_catalog.setval('public.materia_id_seq', 48, true);


--
--

SELECT pg_catalog.setval('public.persona_id_seq', 991, true);


--
--

SELECT pg_catalog.setval('public.profesor_id_seq', 68, true);


--
--

SELECT pg_catalog.setval('public.tipo_documento_id_seq', 3, true);


--
--

ALTER TABLE ONLY public.alumno
    ADD CONSTRAINT alumno_pkey PRIMARY KEY (id);


--
--

ALTER TABLE ONLY public.ciudad
    ADD CONSTRAINT ciudad_pkey PRIMARY KEY (id);


--
--

ALTER TABLE ONLY public.clase
    ADD CONSTRAINT clase_pkey PRIMARY KEY (id);


--
--

ALTER TABLE ONLY public.estado
    ADD CONSTRAINT estado_pkey PRIMARY KEY (id);


--
--

ALTER TABLE ONLY public.institucion
    ADD CONSTRAINT institucion_pkey PRIMARY KEY (id);


--
--

ALTER TABLE ONLY public.materia
    ADD CONSTRAINT materia_pkey PRIMARY KEY (id);


--
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_pkey PRIMARY KEY (id);


--
--

ALTER TABLE ONLY public.inscripcion
    ADD CONSTRAINT pk_incripcion PRIMARY KEY (id);


--
--

ALTER TABLE ONLY public.profesor_materia
    ADD CONSTRAINT profesor_materia_pkey PRIMARY KEY (profesor, materia);


--
--

ALTER TABLE ONLY public.profesor
    ADD CONSTRAINT profesor_pkey PRIMARY KEY (id);


--
--

ALTER TABLE ONLY public.tipo_documento
    ADD CONSTRAINT tipo_documento_pkey PRIMARY KEY (id);


--
--

ALTER TABLE ONLY public.alumno
    ADD CONSTRAINT fk_alumno_institucion1 FOREIGN KEY (institucion) REFERENCES public.institucion(id);


--
--

ALTER TABLE ONLY public.alumno
    ADD CONSTRAINT fk_alumno_persona1 FOREIGN KEY (persona) REFERENCES public.persona(id);


--
--

ALTER TABLE ONLY public.clase
    ADD CONSTRAINT fk_clase_estado1 FOREIGN KEY (estado) REFERENCES public.estado(id);


--
--

ALTER TABLE ONLY public.clase
    ADD CONSTRAINT fk_materia_clase FOREIGN KEY (materia_id) REFERENCES public.materia(id);


--
--

ALTER TABLE ONLY public.clase
    ADD CONSTRAINT fk_profesor_clase FOREIGN KEY (profesor_id) REFERENCES public.profesor(id);


--
--

ALTER TABLE ONLY public.profesor_materia
    ADD CONSTRAINT fk_profesor_has_materia_materia1 FOREIGN KEY (materia) REFERENCES public.materia(id);


--
--

ALTER TABLE ONLY public.profesor_materia
    ADD CONSTRAINT fk_profesor_has_materia_profesor1 FOREIGN KEY (profesor) REFERENCES public.profesor(id);


--
--

ALTER TABLE ONLY public.profesor
    ADD CONSTRAINT fk_profesor_persona1 FOREIGN KEY (persona) REFERENCES public.persona(id);


--
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT fk_tipo_documento FOREIGN KEY (tipo_documento_id) REFERENCES public.tipo_documento(id);


--
-- PostgreSQL database dump complete
--

