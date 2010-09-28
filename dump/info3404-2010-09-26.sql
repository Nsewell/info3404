--
-- PostgreSQL database dump
--

SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: employee; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE employee (
    ssnum bigint NOT NULL,
    name character varying(255),
    manager character varying(255),
    dept character varying(255),
    salary integer,
    numfriends integer
);


ALTER TABLE public.employee OWNER TO postgres;

--
-- Name: employee_ssnum_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE employee_ssnum_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.employee_ssnum_seq OWNER TO postgres;

--
-- Name: employee_ssnum_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE employee_ssnum_seq OWNED BY employee.ssnum;


--
-- Name: employee_ssnum_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('employee_ssnum_seq', 1, false);


--
-- Name: student; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE student (
    ssnum bigint NOT NULL,
    name character varying(255),
    course character varying(8),
    grade integer
);


ALTER TABLE public.student OWNER TO postgres;

--
-- Name: student_ssnum_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE student_ssnum_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.student_ssnum_seq OWNER TO postgres;

--
-- Name: student_ssnum_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE student_ssnum_seq OWNED BY student.ssnum;


--
-- Name: student_ssnum_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('student_ssnum_seq', 1, false);


--
-- Name: techdept; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE techdept (
    dept character varying(255),
    manager character varying(255),
    location character varying(255)
);


ALTER TABLE public.techdept OWNER TO postgres;

--
-- Name: ssnum; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE employee ALTER COLUMN ssnum SET DEFAULT nextval('employee_ssnum_seq'::regclass);


--
-- Name: ssnum; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE student ALTER COLUMN ssnum SET DEFAULT nextval('student_ssnum_seq'::regclass);


--
-- Data for Name: employee; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY employee (ssnum, name, manager, dept, salary, numfriends) FROM stdin;
\.


--
-- Data for Name: student; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY student (ssnum, name, course, grade) FROM stdin;
\.


--
-- Data for Name: techdept; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY techdept (dept, manager, location) FROM stdin;
\.


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

