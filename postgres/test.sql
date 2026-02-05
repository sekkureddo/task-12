--
-- PostgreSQL database dump
--

\restrict jrTCEg0Y9B2K6OfgzVDfQ845rI0domWYNMb8kslPwQrbNXmXWnR683IOQQ51Kuo

-- Dumped from database version 13.23 (Debian 13.23-1.pgdg13+1)
-- Dumped by pg_dump version 17.7 (Ubuntu 17.7-3.pgdg24.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: public; Type: SCHEMA; Schema: -; Owner: reddo
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO reddo;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: test1; Type: TABLE; Schema: public; Owner: reddo
--

CREATE TABLE public.test1 (
    id integer NOT NULL,
    name character varying(10) NOT NULL
);


ALTER TABLE public.test1 OWNER TO reddo;

--
-- Name: test1_id_seq; Type: SEQUENCE; Schema: public; Owner: reddo
--

CREATE SEQUENCE public.test1_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.test1_id_seq OWNER TO reddo;

--
-- Name: test1_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: reddo
--

ALTER SEQUENCE public.test1_id_seq OWNED BY public.test1.id;


--
-- Name: test1 id; Type: DEFAULT; Schema: public; Owner: reddo
--

ALTER TABLE ONLY public.test1 ALTER COLUMN id SET DEFAULT nextval('public.test1_id_seq'::regclass);


--
-- Data for Name: test1; Type: TABLE DATA; Schema: public; Owner: reddo
--

COPY public.test1 (id, name) FROM stdin;
1	vanya
2	petya
3	sasha
\.


--
-- Name: test1_id_seq; Type: SEQUENCE SET; Schema: public; Owner: reddo
--

SELECT pg_catalog.setval('public.test1_id_seq', 3, true);


--
-- Name: test1 test1_pkey; Type: CONSTRAINT; Schema: public; Owner: reddo
--

ALTER TABLE ONLY public.test1
    ADD CONSTRAINT test1_pkey PRIMARY KEY (id);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: reddo
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

\unrestrict jrTCEg0Y9B2K6OfgzVDfQ845rI0domWYNMb8kslPwQrbNXmXWnR683IOQQ51Kuo

