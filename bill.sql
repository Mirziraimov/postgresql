--
-- PostgreSQL database dump
--

-- Dumped from database version 14.2
-- Dumped by pg_dump version 14.2

-- Started on 2022-04-14 22:57:44

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 216 (class 1259 OID 16429)
-- Name: tb_balances; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_balances (
    id integer NOT NULL,
    amount numeric NOT NULL,
    blocked_amount numeric NOT NULL,
    client_id integer NOT NULL
);


ALTER TABLE public.tb_balances OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16428)
-- Name: tb_balances_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.tb_balances ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.tb_balances_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 214 (class 1259 OID 16408)
-- Name: tb_charges; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_charges (
    id integer NOT NULL,
    amount numeric NOT NULL
);


ALTER TABLE public.tb_charges OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 16407)
-- Name: tb_charges_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.tb_charges ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.tb_charges_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 210 (class 1259 OID 16396)
-- Name: tb_clients; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_clients (
    id integer NOT NULL,
    name character varying(150) NOT NULL,
    address character varying(200) NOT NULL
);


ALTER TABLE public.tb_clients OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 16395)
-- Name: tb_clients_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.tb_clients ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.tb_clients_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 212 (class 1259 OID 16402)
-- Name: tb_receipts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_receipts (
    id integer NOT NULL,
    clnt_id integer NOT NULL,
    amount numeric NOT NULL,
    add_date date NOT NULL,
    process_date date NOT NULL,
    status character varying(50) NOT NULL,
    navi_user character varying(255) NOT NULL
);


ALTER TABLE public.tb_receipts OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 16401)
-- Name: tb_receipts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.tb_receipts ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.tb_receipts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 3335 (class 0 OID 16429)
-- Dependencies: 216
-- Data for Name: tb_balances; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3333 (class 0 OID 16408)
-- Dependencies: 214
-- Data for Name: tb_charges; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3329 (class 0 OID 16396)
-- Dependencies: 210
-- Data for Name: tb_clients; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3331 (class 0 OID 16402)
-- Dependencies: 212
-- Data for Name: tb_receipts; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3349 (class 0 OID 0)
-- Dependencies: 215
-- Name: tb_balances_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tb_balances_id_seq', 1, false);


--
-- TOC entry 3350 (class 0 OID 0)
-- Dependencies: 213
-- Name: tb_charges_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tb_charges_id_seq', 1, false);


--
-- TOC entry 3351 (class 0 OID 0)
-- Dependencies: 209
-- Name: tb_clients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tb_clients_id_seq', 1, false);


--
-- TOC entry 3352 (class 0 OID 0)
-- Dependencies: 211
-- Name: tb_receipts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tb_receipts_id_seq', 1, false);


--
-- TOC entry 3186 (class 2606 OID 16435)
-- Name: tb_balances tb_balances_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_balances
    ADD CONSTRAINT tb_balances_pkey PRIMARY KEY (id);


--
-- TOC entry 3184 (class 2606 OID 16414)
-- Name: tb_charges tb_charges_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_charges
    ADD CONSTRAINT tb_charges_pkey PRIMARY KEY (id);


--
-- TOC entry 3180 (class 2606 OID 16400)
-- Name: tb_clients tb_clients_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_clients
    ADD CONSTRAINT tb_clients_pkey PRIMARY KEY (id);


--
-- TOC entry 3182 (class 2606 OID 16406)
-- Name: tb_receipts tb_receipts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_receipts
    ADD CONSTRAINT tb_receipts_pkey PRIMARY KEY (id);


--
-- TOC entry 3188 (class 2606 OID 16436)
-- Name: tb_balances fk_clients_balances; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_balances
    ADD CONSTRAINT fk_clients_balances FOREIGN KEY (client_id) REFERENCES public.tb_clients(id);


--
-- TOC entry 3187 (class 2606 OID 16423)
-- Name: tb_receipts fk_clients_receipts; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_receipts
    ADD CONSTRAINT fk_clients_receipts FOREIGN KEY (clnt_id) REFERENCES public.tb_clients(id) NOT VALID;


--
-- TOC entry 3341 (class 0 OID 0)
-- Dependencies: 216
-- Name: TABLE tb_balances; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.tb_balances TO PUBLIC;


--
-- TOC entry 3342 (class 0 OID 0)
-- Dependencies: 215
-- Name: SEQUENCE tb_balances_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.tb_balances_id_seq TO PUBLIC;


--
-- TOC entry 3343 (class 0 OID 0)
-- Dependencies: 214
-- Name: TABLE tb_charges; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.tb_charges TO PUBLIC;


--
-- TOC entry 3344 (class 0 OID 0)
-- Dependencies: 213
-- Name: SEQUENCE tb_charges_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.tb_charges_id_seq TO PUBLIC;


--
-- TOC entry 3345 (class 0 OID 0)
-- Dependencies: 210
-- Name: TABLE tb_clients; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.tb_clients TO PUBLIC;


--
-- TOC entry 3346 (class 0 OID 0)
-- Dependencies: 209
-- Name: SEQUENCE tb_clients_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.tb_clients_id_seq TO PUBLIC;


--
-- TOC entry 3347 (class 0 OID 0)
-- Dependencies: 212
-- Name: TABLE tb_receipts; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.tb_receipts TO PUBLIC;


--
-- TOC entry 3348 (class 0 OID 0)
-- Dependencies: 211
-- Name: SEQUENCE tb_receipts_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.tb_receipts_id_seq TO PUBLIC;


-- Completed on 2022-04-14 22:57:44

--
-- PostgreSQL database dump complete
--

