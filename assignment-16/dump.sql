--
-- PostgreSQL database dump
--

\restrict ncuGIceKg2t3Q0gwGspXvctOQVHhoT9YRgGO5OMggGaoMo0N7iAZgZmt0K3P38J

-- Dumped from database version 18.1
-- Dumped by pg_dump version 18.1

-- Started on 2026-11-18 06:24:47

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 222 (class 1259 OID 49198)
-- Name: device_kinds; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.device_kinds (
    id integer NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.device_kinds OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 49197)
-- Name: device_kinds_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.device_kinds_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.device_kinds_id_seq OWNER TO postgres;

--
-- TOC entry 5042 (class 0 OID 0)
-- Dependencies: 221
-- Name: device_kinds_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.device_kinds_id_seq OWNED BY public.device_kinds.id;


--
-- TOC entry 224 (class 1259 OID 49209)
-- Name: devices; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.devices (
    id integer NOT NULL,
    inventory_number character varying(20) NOT NULL,
    kind_id integer NOT NULL,
    model character varying(100) NOT NULL,
    room_id integer,
    purchase_date date NOT NULL,
    CONSTRAINT purchase_date_not_in_future CHECK ((purchase_date <= CURRENT_DATE))
);


ALTER TABLE public.devices OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 49208)
-- Name: devices_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.devices_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.devices_id_seq OWNER TO postgres;

--
-- TOC entry 5043 (class 0 OID 0)
-- Dependencies: 223
-- Name: devices_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.devices_id_seq OWNED BY public.devices.id;


--
-- TOC entry 220 (class 1259 OID 49186)
-- Name: rooms; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rooms (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    floor smallint NOT NULL
);


ALTER TABLE public.rooms OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 49185)
-- Name: rooms_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.rooms_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.rooms_id_seq OWNER TO postgres;

--
-- TOC entry 5044 (class 0 OID 0)
-- Dependencies: 219
-- Name: rooms_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.rooms_id_seq OWNED BY public.rooms.id;


--
-- TOC entry 4867 (class 2604 OID 49201)
-- Name: device_kinds id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.device_kinds ALTER COLUMN id SET DEFAULT nextval('public.device_kinds_id_seq'::regclass);


--
-- TOC entry 4868 (class 2604 OID 49212)
-- Name: devices id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.devices ALTER COLUMN id SET DEFAULT nextval('public.devices_id_seq'::regclass);


--
-- TOC entry 4866 (class 2604 OID 49189)
-- Name: rooms id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rooms ALTER COLUMN id SET DEFAULT nextval('public.rooms_id_seq'::regclass);


--
-- TOC entry 5034 (class 0 OID 49198)
-- Dependencies: 222
-- Data for Name: device_kinds; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.device_kinds (id, name) FROM stdin;
1	Computer
2	Monitor
3	Projector
4	Printer
5	Router
\.


--
-- TOC entry 5036 (class 0 OID 49209)
-- Dependencies: 224
-- Data for Name: devices; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.devices (id, inventory_number, kind_id, model, room_id, purchase_date) FROM stdin;
1	INV-0001	1	Dell OptiPlex 3080	1	2019-09-02
2	INV-0002	1	Dell OptiPlex 3090	1	2023-01-16
3	INV-0003	2	Dell P2422H	1	2023-01-16
4	INV-0004	2	LG 24MK430H	1	2018-03-12
5	INV-0005	3	Epson EB-X49	1	2020-05-20
6	INV-0006	1	HP ProDesk 400 G7	2	2021-10-01
7	INV-0007	1	HP ProDesk 400 G9	2	2024-02-26
8	INV-0008	4	Brother HL-L2350DW	2	2022-11-30
9	INV-0009	3	BenQ MH535	3	2017-09-15
10	INV-0010	2	Samsung S24R350	3	2025-06-10
11	INV-0011	5	MikroTik RB4011	4	2022-04-04
12	INV-0012	1	Lenovo ThinkCentre M700	\N	2016-02-08
13	INV-0013	4	HP LaserJet P1102	\N	2015-10-19
14	INV-0014	2	AOC 22B1HS	\N	2025-09-01
\.


--
-- TOC entry 5032 (class 0 OID 49186)
-- Dependencies: 220
-- Data for Name: rooms; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rooms (id, name, floor) FROM stdin;
1	Lab 101	1
2	Lab 205	2
3	Classroom 310	3
4	Server Room	0
\.


--
-- TOC entry 5045 (class 0 OID 0)
-- Dependencies: 221
-- Name: device_kinds_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.device_kinds_id_seq', 5, true);


--
-- TOC entry 5046 (class 0 OID 0)
-- Dependencies: 223
-- Name: devices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.devices_id_seq', 14, true);


--
-- TOC entry 5047 (class 0 OID 0)
-- Dependencies: 219
-- Name: rooms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.rooms_id_seq', 4, true);


--
-- TOC entry 4875 (class 2606 OID 49207)
-- Name: device_kinds device_kinds_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.device_kinds
    ADD CONSTRAINT device_kinds_name_key UNIQUE (name);


--
-- TOC entry 4877 (class 2606 OID 49205)
-- Name: device_kinds device_kinds_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.device_kinds
    ADD CONSTRAINT device_kinds_pkey PRIMARY KEY (id);


--
-- TOC entry 4879 (class 2606 OID 49222)
-- Name: devices devices_inventory_number_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.devices
    ADD CONSTRAINT devices_inventory_number_key UNIQUE (inventory_number);


--
-- TOC entry 4881 (class 2606 OID 49220)
-- Name: devices devices_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.devices
    ADD CONSTRAINT devices_pkey PRIMARY KEY (id);


--
-- TOC entry 4871 (class 2606 OID 49196)
-- Name: rooms rooms_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rooms
    ADD CONSTRAINT rooms_name_key UNIQUE (name);


--
-- TOC entry 4873 (class 2606 OID 49194)
-- Name: rooms rooms_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rooms
    ADD CONSTRAINT rooms_pkey PRIMARY KEY (id);


--
-- TOC entry 4882 (class 2606 OID 49223)
-- Name: devices devices_kind_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.devices
    ADD CONSTRAINT devices_kind_id_fkey FOREIGN KEY (kind_id) REFERENCES public.device_kinds(id);


--
-- TOC entry 4883 (class 2606 OID 49228)
-- Name: devices devices_room_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.devices
    ADD CONSTRAINT devices_room_id_fkey FOREIGN KEY (room_id) REFERENCES public.rooms(id);


-- Completed on 2026-11-11 09:24:47

--
-- PostgreSQL database dump complete
--

\unrestrict ncuGIceKg2t3Q0gwGspXvctOQVHhoT9YRgGO5OMggGaoMo0N7iAZgZmt0K3P38J

