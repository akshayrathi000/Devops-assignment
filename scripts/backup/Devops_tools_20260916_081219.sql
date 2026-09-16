--
-- PostgreSQL database dump
--

\restrict sRkZPczGXtsmUDkFF1FH6mdJdeTds3i5W5JRp69KW53bwihVq1SjauWa85Il5g3

-- Dumped from database version 16.15 (Debian 16.15-1.pgdg13+2)
-- Dumped by pg_dump version 16.15 (Debian 16.15-1.pgdg13+2)

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
-- Name: pgcrypto; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA public;


--
-- Name: EXTENSION pgcrypto; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: booking_events; Type: TABLE; Schema: public; Owner: Devops
--

CREATE TABLE public.booking_events (
    id bigint NOT NULL,
    booking_id uuid NOT NULL,
    event_type character varying(100) NOT NULL,
    payload jsonb,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.booking_events OWNER TO "Devops";

--
-- Name: booking_events_id_seq; Type: SEQUENCE; Schema: public; Owner: Devops
--

CREATE SEQUENCE public.booking_events_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.booking_events_id_seq OWNER TO "Devops";

--
-- Name: booking_events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Devops
--

ALTER SEQUENCE public.booking_events_id_seq OWNED BY public.booking_events.id;


--
-- Name: hotel_bookings; Type: TABLE; Schema: public; Owner: Devops
--

CREATE TABLE public.hotel_bookings (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    org_id uuid NOT NULL,
    hotel_id character varying(100) NOT NULL,
    city character varying(100) NOT NULL,
    checkin_date date NOT NULL,
    checkout_date date NOT NULL,
    amount numeric(12,2) NOT NULL,
    status character varying(50) NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.hotel_bookings OWNER TO "Devops";

--
-- Name: booking_events id; Type: DEFAULT; Schema: public; Owner: Devops
--

ALTER TABLE ONLY public.booking_events ALTER COLUMN id SET DEFAULT nextval('public.booking_events_id_seq'::regclass);


--
-- Data for Name: booking_events; Type: TABLE DATA; Schema: public; Owner: Devops
--

COPY public.booking_events (id, booking_id, event_type, payload, created_at) FROM stdin;
1	adc176e0-2ac2-4c10-88a9-cd2b6f687112	booking_created	{"source": "web", "channel": "online"}	2026-07-23 03:37:57.743091
2	9e3b893a-f5a7-4f4b-a978-0aaedac43245	booking_created	{"source": "web", "channel": "online"}	2026-08-13 03:37:57.743091
3	158d0128-9e22-4421-91db-a0be69e7a432	booking_created	{"source": "web", "channel": "online"}	2026-07-22 03:37:57.743091
4	3d82f94e-0afb-4d79-8915-21ce74df51aa	booking_created	{"source": "web", "channel": "online"}	2026-09-08 03:37:57.743091
5	9880cd73-ae50-4deb-b3ca-af46eff83e31	booking_created	{"source": "web", "channel": "online"}	2026-08-13 03:37:57.743091
6	0f7f1ebc-5288-454f-ac78-a2f3583b01f8	booking_created	{"source": "web", "channel": "online"}	2026-08-20 03:37:57.743091
7	77bc20d2-62a6-4ee2-bc38-98d4c5d04b9b	booking_created	{"source": "web", "channel": "online"}	2026-09-07 03:37:57.743091
8	4b859364-517b-4e68-9b9e-3dee3512cf27	booking_created	{"source": "web", "channel": "online"}	2026-09-06 03:37:57.743091
9	9539da5b-50ee-4ba6-9919-a2c0de224e87	booking_created	{"source": "web", "channel": "online"}	2026-08-01 03:37:57.743091
10	93cd6c48-8624-4bfd-b0a7-62ebcfc7fa7c	booking_created	{"source": "web", "channel": "online"}	2026-08-17 03:37:57.743091
11	fa4c8f7b-78e5-47a5-925c-88ff71435a20	booking_created	{"source": "web", "channel": "online"}	2026-08-01 03:37:57.743091
12	6ed495fe-e682-40c0-8a06-6970fe949be9	booking_created	{"source": "web", "channel": "online"}	2026-08-13 03:37:57.743091
13	7c826b68-87a9-4289-9a0d-049f670ec019	booking_created	{"source": "web", "channel": "online"}	2026-08-03 03:37:57.743091
14	9a1f63d9-e198-4999-a961-d86e159cb08d	booking_created	{"source": "web", "channel": "online"}	2026-09-11 03:37:57.743091
15	7bc71649-5e5d-426a-a448-524ee55252bc	booking_created	{"source": "web", "channel": "online"}	2026-08-08 03:37:57.743091
16	6abb2366-4eeb-48b1-b06d-1dc2a07d51d1	booking_created	{"source": "web", "channel": "online"}	2026-08-10 03:37:57.743091
17	0ac0621c-e7d6-4f31-ba8e-4fecce5ee5e5	booking_created	{"source": "web", "channel": "online"}	2026-09-03 03:37:57.743091
18	938815ab-3674-4879-ab2d-b8907b08ffb5	booking_created	{"source": "web", "channel": "online"}	2026-07-25 03:37:57.743091
19	7780d960-c41b-4bd6-983b-ed31281b3649	booking_created	{"source": "web", "channel": "online"}	2026-07-28 03:37:57.743091
20	75ce4b66-5718-4593-b938-484b2de48b6f	booking_created	{"source": "web", "channel": "online"}	2026-08-07 03:37:57.743091
21	cd00c683-5880-4a0f-a949-b0c538d166ca	booking_created	{"source": "web", "channel": "online"}	2026-08-12 03:37:57.743091
22	978ea577-de02-491b-bc4b-c69508ec36fe	booking_created	{"source": "web", "channel": "online"}	2026-09-12 03:37:57.743091
23	c7094acb-7849-413e-a826-cf9aef8e247d	booking_created	{"source": "web", "channel": "online"}	2026-07-20 03:37:57.743091
24	ab86daa7-73c3-4232-bc86-0afd90bec969	booking_created	{"source": "web", "channel": "online"}	2026-08-11 03:37:57.743091
25	fe06f4f5-a342-4281-9ee5-bee5eed877ae	booking_created	{"source": "web", "channel": "online"}	2026-07-29 03:37:57.743091
26	2ab3882d-fbc3-4c5c-8b20-1fff90e3ac03	booking_created	{"source": "web", "channel": "online"}	2026-09-16 03:37:57.743091
27	6144d567-8ed9-46e1-8a71-0d8be7e58689	booking_created	{"source": "web", "channel": "online"}	2026-08-06 03:37:57.743091
28	4c85271c-14f2-4c48-85a6-1fcedda9620d	booking_created	{"source": "web", "channel": "online"}	2026-09-02 03:37:57.743091
29	928f18cf-a13c-42dd-ba07-673794e49bc2	booking_created	{"source": "web", "channel": "online"}	2026-08-29 03:37:57.743091
30	08954bdb-dd53-474a-910a-af5924e28809	booking_created	{"source": "web", "channel": "online"}	2026-08-23 03:37:57.743091
31	c824954d-ee14-4e6b-9755-06bb17a6d900	booking_created	{"source": "web", "channel": "online"}	2026-09-10 03:37:57.743091
32	6a619aa0-e70b-478a-b52e-9ac1f542f8a6	booking_created	{"source": "web", "channel": "online"}	2026-08-27 03:37:57.743091
33	d671a690-3fc2-4de5-9db1-890707b9fb5e	booking_created	{"source": "web", "channel": "online"}	2026-09-01 03:37:57.743091
34	930536a7-66f6-4c97-9990-f42a0c8bafde	booking_created	{"source": "web", "channel": "online"}	2026-08-10 03:37:57.743091
35	144b4335-9c47-43ad-83e9-66e4d59f4a83	booking_created	{"source": "web", "channel": "online"}	2026-07-21 03:37:57.743091
36	a203566c-e141-45b5-9257-1b6178c27168	booking_created	{"source": "web", "channel": "online"}	2026-08-01 03:37:57.743091
37	c5b1418f-3cbe-4bcc-a111-1417ccde14f0	booking_created	{"source": "web", "channel": "online"}	2026-08-08 03:37:57.743091
38	d0d1283e-2ab1-4651-bfc4-d87d07450dcf	booking_created	{"source": "web", "channel": "online"}	2026-08-21 03:37:57.743091
39	e5bcf74e-68b8-4f21-afe5-97491f25c5fe	booking_created	{"source": "web", "channel": "online"}	2026-07-19 03:37:57.743091
40	7606fdaa-d00e-4274-b8b3-099aa9f9f235	booking_created	{"source": "web", "channel": "online"}	2026-08-23 03:37:57.743091
41	119b7e91-2a9f-4075-bfca-0889a5bce417	booking_created	{"source": "web", "channel": "online"}	2026-08-18 03:37:57.743091
42	7bd3e118-943d-4c23-9716-ecd21a09f347	booking_created	{"source": "web", "channel": "online"}	2026-07-24 03:37:57.743091
43	1524e8da-f609-4c30-ad0b-2ba7af4087ac	booking_created	{"source": "web", "channel": "online"}	2026-08-05 03:37:57.743091
44	d18b3a47-0519-4695-a898-34f5436a6ba9	booking_created	{"source": "web", "channel": "online"}	2026-08-13 03:37:57.743091
45	4764825e-a153-407a-8fcc-122202d201fa	booking_created	{"source": "web", "channel": "online"}	2026-08-06 03:37:57.743091
46	c2132af7-4d45-4839-8be0-1900c99bf99f	booking_created	{"source": "web", "channel": "online"}	2026-09-10 03:37:57.743091
47	8a591255-804d-49af-9569-6ed0c12c10e2	booking_created	{"source": "web", "channel": "online"}	2026-08-15 03:37:57.743091
48	2e2ef421-0903-4853-82ac-4ddfc4e67fd8	booking_created	{"source": "web", "channel": "online"}	2026-07-24 03:37:57.743091
49	15493eb8-4b14-4969-b42b-16eba221a106	booking_created	{"source": "web", "channel": "online"}	2026-08-04 03:37:57.743091
50	c217cb0a-a949-46cd-bd04-311ba2206fd5	booking_created	{"source": "web", "channel": "online"}	2026-08-15 03:37:57.743091
51	a158da6e-577d-4542-8b56-af9e128586b0	booking_created	{"source": "web", "channel": "online"}	2026-08-30 03:37:57.743091
52	e0b12f15-5896-4849-8be7-3b5064c84935	booking_created	{"source": "web", "channel": "online"}	2026-08-02 03:37:57.743091
53	cc4f4a82-f7b9-43cc-af2f-2e9f0b6a700b	booking_created	{"source": "web", "channel": "online"}	2026-08-02 03:37:57.743091
54	f32da916-6f3c-4cc2-b8a9-5c8ec0ca2525	booking_created	{"source": "web", "channel": "online"}	2026-07-30 03:37:57.743091
55	71e4d660-3ff8-4a31-a1ca-03abd4a16cc2	booking_created	{"source": "web", "channel": "online"}	2026-08-28 03:37:57.743091
56	261082ce-e593-4780-9c69-66157bf762a6	booking_created	{"source": "web", "channel": "online"}	2026-07-30 03:37:57.743091
57	1cd775b9-29f9-4114-9824-57748f932106	booking_created	{"source": "web", "channel": "online"}	2026-08-09 03:37:57.743091
58	24b1cdef-5b2b-417b-b611-9d8d30686cc9	booking_created	{"source": "web", "channel": "online"}	2026-07-28 03:37:57.743091
59	27515c59-0962-458a-880f-6c7133673eaf	booking_created	{"source": "web", "channel": "online"}	2026-07-30 03:37:57.743091
60	a8312099-db7b-487a-880c-e389330763d1	booking_created	{"source": "web", "channel": "online"}	2026-09-15 03:37:57.743091
61	ac53fe14-30df-45ca-ac05-471ca9adb710	booking_created	{"source": "web", "channel": "online"}	2026-08-03 03:37:57.743091
62	9fa41201-aeba-4bb2-8f15-2f3fd63b8ece	booking_created	{"source": "web", "channel": "online"}	2026-09-11 03:37:57.743091
63	8f4693a1-4e32-4cc0-bf63-c86e7b74813a	booking_created	{"source": "web", "channel": "online"}	2026-08-09 03:37:57.743091
64	7b38bd0b-5250-4a63-b652-f4539ee5639c	booking_created	{"source": "web", "channel": "online"}	2026-07-19 03:37:57.743091
65	ef5c0bd1-123b-4a3b-9418-318069d206ac	booking_created	{"source": "web", "channel": "online"}	2026-08-13 03:37:57.743091
66	53702a23-6798-4985-9319-c5c2f0c261d4	booking_created	{"source": "web", "channel": "online"}	2026-09-10 03:37:57.743091
67	7f64abcf-fdac-49a6-821d-f83af4a9334d	booking_created	{"source": "web", "channel": "online"}	2026-08-07 03:37:57.743091
68	9e99418e-d390-407e-afd1-7363412b65c8	booking_created	{"source": "web", "channel": "online"}	2026-08-10 03:37:57.743091
69	dbf4f354-7dd3-414e-b678-49ebebf652dd	booking_created	{"source": "web", "channel": "online"}	2026-08-04 03:37:57.743091
70	20e79393-6e30-4b1c-bb3b-d4fc52115246	booking_created	{"source": "web", "channel": "online"}	2026-08-03 03:37:57.743091
71	a7fdf5ad-b78e-4faf-9d89-52612653176f	booking_created	{"source": "web", "channel": "online"}	2026-07-23 03:37:57.743091
72	0003e58d-b733-4388-8e99-11bf5232dd09	booking_created	{"source": "web", "channel": "online"}	2026-07-27 03:37:57.743091
73	d7ac8814-99f2-425f-913b-732f8650ff3c	booking_created	{"source": "web", "channel": "online"}	2026-07-31 03:37:57.743091
74	2dc985d4-51b4-4bf0-bf13-bfdea6654122	booking_created	{"source": "web", "channel": "online"}	2026-09-14 03:37:57.743091
75	344120cc-758f-48b4-a3b7-85927daacdb3	booking_created	{"source": "web", "channel": "online"}	2026-08-02 03:37:57.743091
76	1799b1a8-09cf-44de-8d74-e1d3acf7be44	booking_created	{"source": "web", "channel": "online"}	2026-08-02 03:37:57.743091
77	20b9ecc3-2aba-4eaf-8d54-d20e69a8a80a	booking_created	{"source": "web", "channel": "online"}	2026-09-15 03:37:57.743091
78	c09ed008-e7bc-433e-8e07-bd99ac53c012	booking_created	{"source": "web", "channel": "online"}	2026-08-04 03:37:57.743091
79	837f9408-8f0d-42c5-84cf-e42d52a51c27	booking_created	{"source": "web", "channel": "online"}	2026-08-05 03:37:57.743091
80	4350e308-b85b-4795-a6d4-d5d88cb68353	booking_created	{"source": "web", "channel": "online"}	2026-08-01 03:37:57.743091
81	4bad01ea-07ff-4e8d-bbe9-d05a137a759f	booking_created	{"source": "web", "channel": "online"}	2026-08-22 03:37:57.743091
82	d7e761c2-b397-472a-a151-1c2c761dff3b	booking_created	{"source": "web", "channel": "online"}	2026-08-28 03:37:57.743091
83	34a0672c-18d8-495e-b260-e9ec1a431f2d	booking_created	{"source": "web", "channel": "online"}	2026-08-12 03:37:57.743091
84	46430a5d-474a-4989-a7f5-7c375882a631	booking_created	{"source": "web", "channel": "online"}	2026-08-06 03:37:57.743091
85	e1e6b998-2222-45ae-8160-0cc6a3a76b9e	booking_created	{"source": "web", "channel": "online"}	2026-09-06 03:37:57.743091
86	de190042-ef11-4eab-b65b-65e4799f0cd4	booking_created	{"source": "web", "channel": "online"}	2026-08-18 03:37:57.743091
87	542a7b1b-e61f-422c-a605-8ed462cbf435	booking_created	{"source": "web", "channel": "online"}	2026-09-10 03:37:57.743091
88	fb5a5bfc-d2b0-442f-a1d4-4a616d5fabe5	booking_created	{"source": "web", "channel": "online"}	2026-07-25 03:37:57.743091
89	f3b4aa81-2d96-49ed-b372-0c0f1610b495	booking_created	{"source": "web", "channel": "online"}	2026-09-16 03:37:57.743091
90	e1f6856f-0990-42e0-a17a-2e4da2c30cd5	booking_created	{"source": "web", "channel": "online"}	2026-08-14 03:37:57.743091
91	6f366b40-06f7-4321-88b0-4c235361c771	booking_created	{"source": "web", "channel": "online"}	2026-09-11 03:37:57.743091
92	6f8a5be6-6d1e-496f-84ad-0c10d1e086cf	booking_created	{"source": "web", "channel": "online"}	2026-09-11 03:37:57.743091
93	7b72ac48-a639-42c1-a5d9-71e494625b6b	booking_created	{"source": "web", "channel": "online"}	2026-09-07 03:37:57.743091
94	5380b744-6bf5-4644-b395-4103bef396c3	booking_created	{"source": "web", "channel": "online"}	2026-09-03 03:37:57.743091
95	ae759285-a520-40f6-b8c3-4dc1a38fa5ae	booking_created	{"source": "web", "channel": "online"}	2026-08-23 03:37:57.743091
96	fab882dd-8301-4053-8d91-469440c69bca	booking_created	{"source": "web", "channel": "online"}	2026-08-27 03:37:57.743091
97	158d0128-9e22-4421-91db-a0be69e7a432	booking_status_updated	{"source": "system", "updated_by": "booking-service"}	2026-07-22 04:37:57.743091
98	9880cd73-ae50-4deb-b3ca-af46eff83e31	booking_status_updated	{"source": "system", "updated_by": "booking-service"}	2026-08-13 04:37:57.743091
99	287d8922-02ed-459d-86e4-de7a2674b8d8	booking_status_updated	{"source": "system", "updated_by": "booking-service"}	2026-08-06 04:37:57.743091
100	4b859364-517b-4e68-9b9e-3dee3512cf27	booking_status_updated	{"source": "system", "updated_by": "booking-service"}	2026-09-06 04:37:57.743091
101	8dcc68bd-b0e7-4ce4-81e1-51adc867baf3	booking_status_updated	{"source": "system", "updated_by": "booking-service"}	2026-09-07 04:37:57.743091
102	2ab3882d-fbc3-4c5c-8b20-1fff90e3ac03	booking_status_updated	{"source": "system", "updated_by": "booking-service"}	2026-09-16 04:37:57.743091
103	7f9c1f6d-e575-4542-934f-575f815fe477	booking_status_updated	{"source": "system", "updated_by": "booking-service"}	2026-08-12 04:37:57.743091
104	a203566c-e141-45b5-9257-1b6178c27168	booking_status_updated	{"source": "system", "updated_by": "booking-service"}	2026-08-01 04:37:57.743091
105	e5bcf74e-68b8-4f21-afe5-97491f25c5fe	booking_status_updated	{"source": "system", "updated_by": "booking-service"}	2026-07-19 04:37:57.743091
106	119b7e91-2a9f-4075-bfca-0889a5bce417	booking_status_updated	{"source": "system", "updated_by": "booking-service"}	2026-08-18 04:37:57.743091
107	7bd3e118-943d-4c23-9716-ecd21a09f347	booking_status_updated	{"source": "system", "updated_by": "booking-service"}	2026-07-24 04:37:57.743091
108	d18b3a47-0519-4695-a898-34f5436a6ba9	booking_status_updated	{"source": "system", "updated_by": "booking-service"}	2026-08-13 04:37:57.743091
109	c2132af7-4d45-4839-8be0-1900c99bf99f	booking_status_updated	{"source": "system", "updated_by": "booking-service"}	2026-09-10 04:37:57.743091
110	2e2ef421-0903-4853-82ac-4ddfc4e67fd8	booking_status_updated	{"source": "system", "updated_by": "booking-service"}	2026-07-24 04:37:57.743091
111	b9eddc8b-0215-4246-a8e4-39bc77d69611	booking_status_updated	{"source": "system", "updated_by": "booking-service"}	2026-09-10 04:37:57.743091
112	f32da916-6f3c-4cc2-b8a9-5c8ec0ca2525	booking_status_updated	{"source": "system", "updated_by": "booking-service"}	2026-07-30 04:37:57.743091
113	24b1cdef-5b2b-417b-b611-9d8d30686cc9	booking_status_updated	{"source": "system", "updated_by": "booking-service"}	2026-07-28 04:37:57.743091
114	3b409e5a-c851-48fe-9373-c0a61edc681e	booking_status_updated	{"source": "system", "updated_by": "booking-service"}	2026-09-15 04:37:57.743091
115	9fa41201-aeba-4bb2-8f15-2f3fd63b8ece	booking_status_updated	{"source": "system", "updated_by": "booking-service"}	2026-09-11 04:37:57.743091
116	c0e46736-f374-4358-88c1-315ce3bebd5c	booking_status_updated	{"source": "system", "updated_by": "booking-service"}	2026-08-19 04:37:57.743091
117	dbf4f354-7dd3-414e-b678-49ebebf652dd	booking_status_updated	{"source": "system", "updated_by": "booking-service"}	2026-08-04 04:37:57.743091
118	80d3e9c7-417a-45b8-a0d9-659eb2fe0bf2	booking_status_updated	{"source": "system", "updated_by": "booking-service"}	2026-09-01 04:37:57.743091
119	1799b1a8-09cf-44de-8d74-e1d3acf7be44	booking_status_updated	{"source": "system", "updated_by": "booking-service"}	2026-08-02 04:37:57.743091
120	05f55ba4-2895-4613-b3c8-a4beb3207190	booking_status_updated	{"source": "system", "updated_by": "booking-service"}	2026-07-20 04:37:57.743091
121	46430a5d-474a-4989-a7f5-7c375882a631	booking_status_updated	{"source": "system", "updated_by": "booking-service"}	2026-08-06 04:37:57.743091
122	e1e6b998-2222-45ae-8160-0cc6a3a76b9e	booking_status_updated	{"source": "system", "updated_by": "booking-service"}	2026-09-06 04:37:57.743091
123	986cc64d-cbda-4124-975a-eeb9d8690e96	booking_status_updated	{"source": "system", "updated_by": "booking-service"}	2026-08-02 04:37:57.743091
124	0b1d5dbb-02b9-4e74-bfdf-dce08bc1e9a8	booking_status_updated	{"source": "system", "updated_by": "booking-service"}	2026-09-10 04:37:57.743091
125	e1f6856f-0990-42e0-a17a-2e4da2c30cd5	booking_status_updated	{"source": "system", "updated_by": "booking-service"}	2026-08-14 04:37:57.743091
126	6f366b40-06f7-4321-88b0-4c235361c771	booking_status_updated	{"source": "system", "updated_by": "booking-service"}	2026-09-11 04:37:57.743091
127	1dee88c6-c98c-4bdf-be68-ced7e4ab61e4	booking_status_updated	{"source": "system", "updated_by": "booking-service"}	2026-08-18 04:37:57.743091
128	b9ee4488-4bd2-4963-8c7e-64430e80ad32	booking_status_updated	{"source": "system", "updated_by": "booking-service"}	2026-09-03 04:37:57.743091
129	fab882dd-8301-4053-8d91-469440c69bca	booking_status_updated	{"source": "system", "updated_by": "booking-service"}	2026-08-27 04:37:57.743091
\.


--
-- Data for Name: hotel_bookings; Type: TABLE DATA; Schema: public; Owner: Devops
--

COPY public.hotel_bookings (id, org_id, hotel_id, city, checkin_date, checkout_date, amount, status, created_at) FROM stdin;
adc176e0-2ac2-4c10-88a9-cd2b6f687112	11111111-1111-1111-1111-111111111111	HOTEL-1	delhi	2026-09-29	2026-10-31	16573.57	confirmed	2026-07-23 03:37:57.743091
fe7a9bc7-ff7c-435a-b73c-c4b2d830212c	11111111-1111-1111-1111-111111111111	HOTEL-15	mumbai	2026-09-17	2026-10-16	46981.85	cancelled	2026-09-04 03:37:57.743091
9e3b893a-f5a7-4f4b-a978-0aaedac43245	44444444-4444-4444-4444-444444444444	HOTEL-13	hyderabad	2026-09-23	2026-11-13	47643.07	pending	2026-08-13 03:37:57.743091
158d0128-9e22-4421-91db-a0be69e7a432	11111111-1111-1111-1111-111111111111	HOTEL-19	mumbai	2026-10-15	2026-11-05	39669.72	completed	2026-07-22 03:37:57.743091
75bc77ae-459c-4911-b84b-aed613f13128	22222222-2222-2222-2222-222222222222	HOTEL-20	hyderabad	2026-09-29	2026-11-02	6958.62	pending	2026-09-12 03:37:57.743091
3d82f94e-0afb-4d79-8915-21ce74df51aa	33333333-3333-3333-3333-333333333333	HOTEL-1	delhi	2026-10-02	2026-10-26	19302.71	completed	2026-09-08 03:37:57.743091
9880cd73-ae50-4deb-b3ca-af46eff83e31	11111111-1111-1111-1111-111111111111	HOTEL-9	delhi	2026-09-30	2026-10-23	26107.66	completed	2026-08-13 03:37:57.743091
0f7f1ebc-5288-454f-ac78-a2f3583b01f8	11111111-1111-1111-1111-111111111111	HOTEL-11	delhi	2026-10-13	2026-11-12	31211.23	cancelled	2026-08-20 03:37:57.743091
287d8922-02ed-459d-86e4-de7a2674b8d8	44444444-4444-4444-4444-444444444444	HOTEL-13	delhi	2026-09-30	2026-11-13	44092.77	confirmed	2026-08-06 03:37:57.743091
2a30f3b0-ac75-47e5-a43d-d8722fd7bdc5	11111111-1111-1111-1111-111111111111	HOTEL-9	bangalore	2026-09-17	2026-10-25	29451.06	pending	2026-08-03 03:37:57.743091
77bc20d2-62a6-4ee2-bc38-98d4c5d04b9b	11111111-1111-1111-1111-111111111111	HOTEL-13	hyderabad	2026-09-25	2026-10-26	29899.45	confirmed	2026-09-07 03:37:57.743091
4b859364-517b-4e68-9b9e-3dee3512cf27	44444444-4444-4444-4444-444444444444	HOTEL-11	bangalore	2026-09-19	2026-11-13	48878.79	completed	2026-09-06 03:37:57.743091
9539da5b-50ee-4ba6-9919-a2c0de224e87	44444444-4444-4444-4444-444444444444	HOTEL-10	pune	2026-09-23	2026-11-05	39376.05	cancelled	2026-08-01 03:37:57.743091
93cd6c48-8624-4bfd-b0a7-62ebcfc7fa7c	44444444-4444-4444-4444-444444444444	HOTEL-15	delhi	2026-09-24	2026-11-10	1272.28	completed	2026-08-17 03:37:57.743091
fa4c8f7b-78e5-47a5-925c-88ff71435a20	44444444-4444-4444-4444-444444444444	HOTEL-12	pune	2026-09-22	2026-11-07	48677.74	pending	2026-08-01 03:37:57.743091
8dcc68bd-b0e7-4ce4-81e1-51adc867baf3	11111111-1111-1111-1111-111111111111	HOTEL-11	bangalore	2026-09-21	2026-10-22	45199.24	completed	2026-09-07 03:37:57.743091
bfc537e2-fac1-45c2-9f14-7a457e660e07	11111111-1111-1111-1111-111111111111	HOTEL-14	hyderabad	2026-09-21	2026-11-09	20586.92	cancelled	2026-07-24 03:37:57.743091
6ed495fe-e682-40c0-8a06-6970fe949be9	44444444-4444-4444-4444-444444444444	HOTEL-9	pune	2026-09-23	2026-10-21	43359.19	cancelled	2026-08-13 03:37:57.743091
7c826b68-87a9-4289-9a0d-049f670ec019	44444444-4444-4444-4444-444444444444	HOTEL-20	bangalore	2026-10-12	2026-11-03	8635.64	cancelled	2026-08-03 03:37:57.743091
9a1f63d9-e198-4999-a961-d86e159cb08d	22222222-2222-2222-2222-222222222222	HOTEL-16	mumbai	2026-10-02	2026-10-26	8577.38	cancelled	2026-09-11 03:37:57.743091
ccb6f7ef-3745-4c3f-a6b9-02136c85eb87	33333333-3333-3333-3333-333333333333	HOTEL-19	delhi	2026-09-18	2026-10-31	27162.13	cancelled	2026-09-12 03:37:57.743091
7bc71649-5e5d-426a-a448-524ee55252bc	11111111-1111-1111-1111-111111111111	HOTEL-7	mumbai	2026-09-29	2026-11-09	16884.50	pending	2026-08-08 03:37:57.743091
6abb2366-4eeb-48b1-b06d-1dc2a07d51d1	44444444-4444-4444-4444-444444444444	HOTEL-15	hyderabad	2026-09-22	2026-11-03	21109.56	confirmed	2026-08-10 03:37:57.743091
0ac0621c-e7d6-4f31-ba8e-4fecce5ee5e5	22222222-2222-2222-2222-222222222222	HOTEL-9	bangalore	2026-09-25	2026-10-24	12228.82	cancelled	2026-09-03 03:37:57.743091
7f876146-72fc-43bb-8f9a-7789298a1bb4	44444444-4444-4444-4444-444444444444	HOTEL-12	mumbai	2026-09-27	2026-10-21	21498.61	cancelled	2026-09-09 03:37:57.743091
938815ab-3674-4879-ab2d-b8907b08ffb5	11111111-1111-1111-1111-111111111111	HOTEL-18	hyderabad	2026-10-03	2026-11-12	33437.89	pending	2026-07-25 03:37:57.743091
7780d960-c41b-4bd6-983b-ed31281b3649	11111111-1111-1111-1111-111111111111	HOTEL-9	hyderabad	2026-10-04	2026-10-20	24807.40	cancelled	2026-07-28 03:37:57.743091
36ab0fdd-bd4a-4738-8252-902ecf5ea502	22222222-2222-2222-2222-222222222222	HOTEL-5	bangalore	2026-10-05	2026-11-12	6861.46	pending	2026-08-19 03:37:57.743091
75ce4b66-5718-4593-b938-484b2de48b6f	22222222-2222-2222-2222-222222222222	HOTEL-5	mumbai	2026-10-07	2026-11-10	37411.54	confirmed	2026-08-07 03:37:57.743091
cd00c683-5880-4a0f-a949-b0c538d166ca	44444444-4444-4444-4444-444444444444	HOTEL-11	pune	2026-10-02	2026-10-16	10815.21	cancelled	2026-08-12 03:37:57.743091
978ea577-de02-491b-bc4b-c69508ec36fe	44444444-4444-4444-4444-444444444444	HOTEL-12	hyderabad	2026-10-04	2026-10-29	36146.93	pending	2026-09-12 03:37:57.743091
3c67d735-d2f6-4f46-885d-28ace7649680	22222222-2222-2222-2222-222222222222	HOTEL-20	delhi	2026-09-17	2026-10-26	47909.48	pending	2026-08-26 03:37:57.743091
c7094acb-7849-413e-a826-cf9aef8e247d	44444444-4444-4444-4444-444444444444	HOTEL-13	delhi	2026-09-19	2026-10-24	41946.68	cancelled	2026-07-20 03:37:57.743091
ab86daa7-73c3-4232-bc86-0afd90bec969	11111111-1111-1111-1111-111111111111	HOTEL-19	hyderabad	2026-09-16	2026-11-08	30261.73	pending	2026-08-11 03:37:57.743091
fe06f4f5-a342-4281-9ee5-bee5eed877ae	33333333-3333-3333-3333-333333333333	HOTEL-18	pune	2026-10-12	2026-11-09	8760.86	cancelled	2026-07-29 03:37:57.743091
2ab3882d-fbc3-4c5c-8b20-1fff90e3ac03	11111111-1111-1111-1111-111111111111	HOTEL-20	delhi	2026-10-15	2026-10-28	32920.50	completed	2026-09-16 03:37:57.743091
6144d567-8ed9-46e1-8a71-0d8be7e58689	11111111-1111-1111-1111-111111111111	HOTEL-11	bangalore	2026-10-05	2026-11-07	12870.62	cancelled	2026-08-06 03:37:57.743091
4c85271c-14f2-4c48-85a6-1fcedda9620d	33333333-3333-3333-3333-333333333333	HOTEL-6	hyderabad	2026-10-08	2026-10-25	1139.36	pending	2026-09-02 03:37:57.743091
7f9c1f6d-e575-4542-934f-575f815fe477	11111111-1111-1111-1111-111111111111	HOTEL-16	hyderabad	2026-09-27	2026-11-13	19608.30	completed	2026-08-12 03:37:57.743091
928f18cf-a13c-42dd-ba07-673794e49bc2	44444444-4444-4444-4444-444444444444	HOTEL-15	hyderabad	2026-10-11	2026-10-23	18118.66	cancelled	2026-08-29 03:37:57.743091
08954bdb-dd53-474a-910a-af5924e28809	22222222-2222-2222-2222-222222222222	HOTEL-1	pune	2026-09-30	2026-11-06	29430.57	cancelled	2026-08-23 03:37:57.743091
80a0cb9e-b2e9-43d0-9449-f0fe428da08d	44444444-4444-4444-4444-444444444444	HOTEL-15	bangalore	2026-09-22	2026-11-11	45561.63	cancelled	2026-08-01 03:37:57.743091
c824954d-ee14-4e6b-9755-06bb17a6d900	11111111-1111-1111-1111-111111111111	HOTEL-20	bangalore	2026-10-15	2026-10-27	21531.73	pending	2026-09-10 03:37:57.743091
f3c2ee4d-e5c3-46db-bc48-62012d25ee2b	33333333-3333-3333-3333-333333333333	HOTEL-7	mumbai	2026-10-07	2026-10-29	25845.63	pending	2026-08-22 03:37:57.743091
c038902a-5dd1-4144-832a-1c165f3b2492	33333333-3333-3333-3333-333333333333	HOTEL-16	bangalore	2026-10-04	2026-10-17	14855.94	confirmed	2026-08-14 03:37:57.743091
d2fa3958-622d-4c68-b953-af50f1d18f1d	33333333-3333-3333-3333-333333333333	HOTEL-16	hyderabad	2026-09-30	2026-10-16	4005.91	cancelled	2026-08-20 03:37:57.743091
6a619aa0-e70b-478a-b52e-9ac1f542f8a6	11111111-1111-1111-1111-111111111111	HOTEL-15	hyderabad	2026-09-28	2026-11-11	46618.64	pending	2026-08-27 03:37:57.743091
d671a690-3fc2-4de5-9db1-890707b9fb5e	44444444-4444-4444-4444-444444444444	HOTEL-13	delhi	2026-09-25	2026-11-02	7429.96	confirmed	2026-09-01 03:37:57.743091
930536a7-66f6-4c97-9990-f42a0c8bafde	33333333-3333-3333-3333-333333333333	HOTEL-16	pune	2026-09-23	2026-11-08	10669.56	completed	2026-08-10 03:37:57.743091
b6c6e5a3-8608-4b37-8f8b-868aa59d4a86	11111111-1111-1111-1111-111111111111	HOTEL-16	pune	2026-09-23	2026-11-11	44641.52	pending	2026-07-31 03:37:57.743091
144b4335-9c47-43ad-83e9-66e4d59f4a83	22222222-2222-2222-2222-222222222222	HOTEL-15	delhi	2026-09-23	2026-11-07	4945.01	cancelled	2026-07-21 03:37:57.743091
29c9328a-7f05-4477-a052-f860beccdcda	22222222-2222-2222-2222-222222222222	HOTEL-9	pune	2026-10-06	2026-10-18	15888.39	cancelled	2026-09-14 03:37:57.743091
1d7b8217-cf82-44f3-9273-09b932e671d2	22222222-2222-2222-2222-222222222222	HOTEL-10	delhi	2026-10-07	2026-10-18	18821.95	confirmed	2026-09-10 03:37:57.743091
a203566c-e141-45b5-9257-1b6178c27168	22222222-2222-2222-2222-222222222222	HOTEL-7	bangalore	2026-09-18	2026-11-08	21707.77	completed	2026-08-01 03:37:57.743091
c5b1418f-3cbe-4bcc-a111-1417ccde14f0	22222222-2222-2222-2222-222222222222	HOTEL-19	delhi	2026-09-27	2026-10-27	25083.56	pending	2026-08-08 03:37:57.743091
acde57fa-69ed-4bc5-9fc0-6da25099b330	22222222-2222-2222-2222-222222222222	HOTEL-10	mumbai	2026-09-20	2026-10-24	19835.79	completed	2026-07-29 03:37:57.743091
d0d1283e-2ab1-4651-bfc4-d87d07450dcf	11111111-1111-1111-1111-111111111111	HOTEL-18	hyderabad	2026-10-10	2026-10-28	48232.14	cancelled	2026-08-21 03:37:57.743091
4e28bd52-f04f-494c-8a2f-495a3cf3c23f	22222222-2222-2222-2222-222222222222	HOTEL-14	pune	2026-09-17	2026-10-16	17520.08	pending	2026-08-04 03:37:57.743091
e5bcf74e-68b8-4f21-afe5-97491f25c5fe	22222222-2222-2222-2222-222222222222	HOTEL-8	pune	2026-10-08	2026-10-19	42256.90	completed	2026-07-19 03:37:57.743091
7606fdaa-d00e-4274-b8b3-099aa9f9f235	22222222-2222-2222-2222-222222222222	HOTEL-11	mumbai	2026-09-16	2026-11-03	22347.27	cancelled	2026-08-23 03:37:57.743091
119b7e91-2a9f-4075-bfca-0889a5bce417	22222222-2222-2222-2222-222222222222	HOTEL-8	hyderabad	2026-10-06	2026-11-09	6004.38	confirmed	2026-08-18 03:37:57.743091
7bd3e118-943d-4c23-9716-ecd21a09f347	22222222-2222-2222-2222-222222222222	HOTEL-18	pune	2026-10-02	2026-11-07	13270.08	confirmed	2026-07-24 03:37:57.743091
1524e8da-f609-4c30-ad0b-2ba7af4087ac	33333333-3333-3333-3333-333333333333	HOTEL-4	hyderabad	2026-10-11	2026-10-28	36395.57	cancelled	2026-08-05 03:37:57.743091
d18b3a47-0519-4695-a898-34f5436a6ba9	11111111-1111-1111-1111-111111111111	HOTEL-18	pune	2026-09-23	2026-11-06	31784.93	completed	2026-08-13 03:37:57.743091
4764825e-a153-407a-8fcc-122202d201fa	22222222-2222-2222-2222-222222222222	HOTEL-3	hyderabad	2026-09-23	2026-10-21	3308.76	pending	2026-08-06 03:37:57.743091
c2132af7-4d45-4839-8be0-1900c99bf99f	44444444-4444-4444-4444-444444444444	HOTEL-13	delhi	2026-09-20	2026-11-13	13056.33	confirmed	2026-09-10 03:37:57.743091
8a591255-804d-49af-9569-6ed0c12c10e2	33333333-3333-3333-3333-333333333333	HOTEL-19	hyderabad	2026-10-06	2026-11-02	5509.28	cancelled	2026-08-15 03:37:57.743091
2e2ef421-0903-4853-82ac-4ddfc4e67fd8	44444444-4444-4444-4444-444444444444	HOTEL-5	delhi	2026-09-18	2026-10-27	43909.54	confirmed	2026-07-24 03:37:57.743091
75aec3a1-227c-47bd-8ba4-e14a8d595186	22222222-2222-2222-2222-222222222222	HOTEL-5	pune	2026-10-14	2026-11-11	36537.71	pending	2026-07-23 03:37:57.743091
a7c57c92-8efd-414a-96eb-6d9df7fe10d9	11111111-1111-1111-1111-111111111111	HOTEL-3	pune	2026-09-27	2026-11-13	31148.46	cancelled	2026-08-01 03:37:57.743091
15493eb8-4b14-4969-b42b-16eba221a106	11111111-1111-1111-1111-111111111111	HOTEL-4	bangalore	2026-10-10	2026-10-31	21277.00	pending	2026-08-04 03:37:57.743091
c217cb0a-a949-46cd-bd04-311ba2206fd5	11111111-1111-1111-1111-111111111111	HOTEL-8	mumbai	2026-09-28	2026-11-06	44413.67	confirmed	2026-08-15 03:37:57.743091
a158da6e-577d-4542-8b56-af9e128586b0	11111111-1111-1111-1111-111111111111	HOTEL-5	hyderabad	2026-10-08	2026-10-31	45875.36	pending	2026-08-30 03:37:57.743091
b9eddc8b-0215-4246-a8e4-39bc77d69611	11111111-1111-1111-1111-111111111111	HOTEL-4	mumbai	2026-10-13	2026-10-23	18736.39	completed	2026-09-10 03:37:57.743091
e0b12f15-5896-4849-8be7-3b5064c84935	33333333-3333-3333-3333-333333333333	HOTEL-9	bangalore	2026-09-30	2026-11-03	48600.55	confirmed	2026-08-02 03:37:57.743091
bc3140f1-5278-481c-8f61-1507d41fd0eb	11111111-1111-1111-1111-111111111111	HOTEL-2	hyderabad	2026-10-11	2026-10-23	15450.49	pending	2026-08-30 03:37:57.743091
cc4f4a82-f7b9-43cc-af2f-2e9f0b6a700b	11111111-1111-1111-1111-111111111111	HOTEL-13	delhi	2026-10-14	2026-11-04	10653.84	pending	2026-08-02 03:37:57.743091
2fea1f30-6cd7-473b-8e72-42ec972d541a	22222222-2222-2222-2222-222222222222	HOTEL-16	hyderabad	2026-10-14	2026-10-22	18278.33	cancelled	2026-09-06 03:37:57.743091
f32da916-6f3c-4cc2-b8a9-5c8ec0ca2525	33333333-3333-3333-3333-333333333333	HOTEL-3	bangalore	2026-09-24	2026-11-10	13393.02	completed	2026-07-30 03:37:57.743091
71e4d660-3ff8-4a31-a1ca-03abd4a16cc2	22222222-2222-2222-2222-222222222222	HOTEL-15	delhi	2026-10-13	2026-10-20	29532.22	cancelled	2026-08-28 03:37:57.743091
261082ce-e593-4780-9c69-66157bf762a6	44444444-4444-4444-4444-444444444444	HOTEL-17	hyderabad	2026-10-04	2026-11-11	37761.46	cancelled	2026-07-30 03:37:57.743091
1cd775b9-29f9-4114-9824-57748f932106	22222222-2222-2222-2222-222222222222	HOTEL-8	mumbai	2026-09-26	2026-10-18	13569.16	cancelled	2026-08-09 03:37:57.743091
24b1cdef-5b2b-417b-b611-9d8d30686cc9	44444444-4444-4444-4444-444444444444	HOTEL-11	mumbai	2026-09-24	2026-10-26	19453.27	confirmed	2026-07-28 03:37:57.743091
27515c59-0962-458a-880f-6c7133673eaf	22222222-2222-2222-2222-222222222222	HOTEL-16	delhi	2026-09-26	2026-10-30	47670.14	confirmed	2026-07-30 03:37:57.743091
a8312099-db7b-487a-880c-e389330763d1	44444444-4444-4444-4444-444444444444	HOTEL-7	mumbai	2026-10-15	2026-11-05	45421.90	pending	2026-09-15 03:37:57.743091
ac53fe14-30df-45ca-ac05-471ca9adb710	33333333-3333-3333-3333-333333333333	HOTEL-9	bangalore	2026-10-05	2026-11-08	41715.56	confirmed	2026-08-03 03:37:57.743091
3b409e5a-c851-48fe-9373-c0a61edc681e	11111111-1111-1111-1111-111111111111	HOTEL-11	delhi	2026-10-12	2026-10-31	11404.89	confirmed	2026-09-15 03:37:57.743091
e4fb4e36-3043-4d88-9f05-9ac8d3815dba	11111111-1111-1111-1111-111111111111	HOTEL-2	bangalore	2026-09-20	2026-10-30	27624.96	confirmed	2026-09-03 03:37:57.743091
9fa41201-aeba-4bb2-8f15-2f3fd63b8ece	44444444-4444-4444-4444-444444444444	HOTEL-5	bangalore	2026-09-29	2026-11-05	25919.39	completed	2026-09-11 03:37:57.743091
c0e46736-f374-4358-88c1-315ce3bebd5c	33333333-3333-3333-3333-333333333333	HOTEL-2	hyderabad	2026-09-26	2026-10-27	18664.39	confirmed	2026-08-19 03:37:57.743091
c19a8ec4-e438-4d6c-a28d-35bbb60b86e6	33333333-3333-3333-3333-333333333333	HOTEL-12	mumbai	2026-09-30	2026-11-06	18226.69	pending	2026-08-10 03:37:57.743091
8f4693a1-4e32-4cc0-bf63-c86e7b74813a	22222222-2222-2222-2222-222222222222	HOTEL-8	delhi	2026-10-03	2026-10-22	49220.24	pending	2026-08-09 03:37:57.743091
7b38bd0b-5250-4a63-b652-f4539ee5639c	22222222-2222-2222-2222-222222222222	HOTEL-12	hyderabad	2026-10-02	2026-10-23	35742.97	cancelled	2026-07-19 03:37:57.743091
ef5c0bd1-123b-4a3b-9418-318069d206ac	44444444-4444-4444-4444-444444444444	HOTEL-2	hyderabad	2026-09-28	2026-11-01	37746.76	cancelled	2026-08-13 03:37:57.743091
53702a23-6798-4985-9319-c5c2f0c261d4	22222222-2222-2222-2222-222222222222	HOTEL-9	mumbai	2026-09-23	2026-10-23	28596.23	pending	2026-09-10 03:37:57.743091
7f64abcf-fdac-49a6-821d-f83af4a9334d	11111111-1111-1111-1111-111111111111	HOTEL-16	bangalore	2026-09-29	2026-10-18	49198.53	completed	2026-08-07 03:37:57.743091
9e99418e-d390-407e-afd1-7363412b65c8	11111111-1111-1111-1111-111111111111	HOTEL-19	pune	2026-10-11	2026-11-10	27849.99	cancelled	2026-08-10 03:37:57.743091
dbf4f354-7dd3-414e-b678-49ebebf652dd	22222222-2222-2222-2222-222222222222	HOTEL-6	delhi	2026-10-03	2026-10-28	27232.16	completed	2026-08-04 03:37:57.743091
20e79393-6e30-4b1c-bb3b-d4fc52115246	11111111-1111-1111-1111-111111111111	HOTEL-5	pune	2026-10-01	2026-10-18	40581.75	pending	2026-08-03 03:37:57.743091
0325f7d9-e877-4baf-9ea2-f5d6ae3ec77a	33333333-3333-3333-3333-333333333333	HOTEL-7	delhi	2026-10-13	2026-10-23	9945.63	cancelled	2026-09-04 03:37:57.743091
a7fdf5ad-b78e-4faf-9d89-52612653176f	33333333-3333-3333-3333-333333333333	HOTEL-1	hyderabad	2026-10-05	2026-10-19	31917.23	cancelled	2026-07-23 03:37:57.743091
0003e58d-b733-4388-8e99-11bf5232dd09	44444444-4444-4444-4444-444444444444	HOTEL-8	pune	2026-10-02	2026-10-16	35506.08	pending	2026-07-27 03:37:57.743091
d7ac8814-99f2-425f-913b-732f8650ff3c	11111111-1111-1111-1111-111111111111	HOTEL-1	bangalore	2026-09-21	2026-10-27	8848.53	confirmed	2026-07-31 03:37:57.743091
2dc985d4-51b4-4bf0-bf13-bfdea6654122	33333333-3333-3333-3333-333333333333	HOTEL-18	bangalore	2026-10-11	2026-11-04	47834.70	cancelled	2026-09-14 03:37:57.743091
04d9ae7c-0677-44d6-9a4a-69ab00fea899	33333333-3333-3333-3333-333333333333	HOTEL-2	bangalore	2026-09-29	2026-11-11	45599.65	completed	2026-09-11 03:37:57.743091
80d3e9c7-417a-45b8-a0d9-659eb2fe0bf2	44444444-4444-4444-4444-444444444444	HOTEL-1	pune	2026-10-05	2026-10-31	42774.42	confirmed	2026-09-01 03:37:57.743091
344120cc-758f-48b4-a3b7-85927daacdb3	22222222-2222-2222-2222-222222222222	HOTEL-5	mumbai	2026-10-13	2026-11-14	5598.94	cancelled	2026-08-02 03:37:57.743091
1799b1a8-09cf-44de-8d74-e1d3acf7be44	44444444-4444-4444-4444-444444444444	HOTEL-8	pune	2026-10-12	2026-10-23	34460.60	confirmed	2026-08-02 03:37:57.743091
20b9ecc3-2aba-4eaf-8d54-d20e69a8a80a	22222222-2222-2222-2222-222222222222	HOTEL-18	delhi	2026-10-02	2026-11-14	16391.37	pending	2026-09-15 03:37:57.743091
1979dc2c-3f7f-43b2-872f-20cd5511305f	11111111-1111-1111-1111-111111111111	HOTEL-18	pune	2026-10-12	2026-11-08	6202.92	pending	2026-08-28 03:37:57.743091
c09ed008-e7bc-433e-8e07-bd99ac53c012	11111111-1111-1111-1111-111111111111	HOTEL-20	bangalore	2026-09-30	2026-10-23	45897.11	cancelled	2026-08-04 03:37:57.743091
9f294806-bda9-42b8-a96c-6ab4a9cfcbd3	33333333-3333-3333-3333-333333333333	HOTEL-16	pune	2026-10-15	2026-10-31	23756.19	cancelled	2026-08-24 03:37:57.743091
00cdb2e6-2e58-4d15-bf11-b6c2562a9d4e	11111111-1111-1111-1111-111111111111	HOTEL-7	delhi	2026-09-17	2026-10-16	19947.11	pending	2026-07-21 03:37:57.743091
f027873a-a5d3-41da-afad-1dd280cce94e	11111111-1111-1111-1111-111111111111	HOTEL-1	delhi	2026-09-30	2026-11-06	18995.79	cancelled	2026-08-07 03:37:57.743091
837f9408-8f0d-42c5-84cf-e42d52a51c27	22222222-2222-2222-2222-222222222222	HOTEL-12	hyderabad	2026-09-21	2026-10-19	47972.07	completed	2026-08-05 03:37:57.743091
05f55ba4-2895-4613-b3c8-a4beb3207190	22222222-2222-2222-2222-222222222222	HOTEL-8	hyderabad	2026-09-27	2026-10-30	10323.21	confirmed	2026-07-20 03:37:57.743091
4350e308-b85b-4795-a6d4-d5d88cb68353	44444444-4444-4444-4444-444444444444	HOTEL-9	hyderabad	2026-10-10	2026-11-01	22782.62	completed	2026-08-01 03:37:57.743091
4bad01ea-07ff-4e8d-bbe9-d05a137a759f	22222222-2222-2222-2222-222222222222	HOTEL-8	delhi	2026-10-15	2026-10-27	7565.84	completed	2026-08-22 03:37:57.743091
db782c2c-8a0d-4810-bbde-04dcba435281	33333333-3333-3333-3333-333333333333	HOTEL-17	bangalore	2026-09-25	2026-10-23	16252.85	cancelled	2026-08-24 03:37:57.743091
d7e761c2-b397-472a-a151-1c2c761dff3b	11111111-1111-1111-1111-111111111111	HOTEL-14	hyderabad	2026-09-25	2026-10-18	38114.13	pending	2026-08-28 03:37:57.743091
45eb8cc7-0a87-4759-928f-afad7717c343	11111111-1111-1111-1111-111111111111	HOTEL-2	delhi	2026-09-29	2026-10-20	32790.30	pending	2026-09-14 03:37:57.743091
34a0672c-18d8-495e-b260-e9ec1a431f2d	44444444-4444-4444-4444-444444444444	HOTEL-1	mumbai	2026-10-07	2026-10-18	22363.97	completed	2026-08-12 03:37:57.743091
46430a5d-474a-4989-a7f5-7c375882a631	44444444-4444-4444-4444-444444444444	HOTEL-8	pune	2026-10-01	2026-11-13	6256.95	confirmed	2026-08-06 03:37:57.743091
e1e6b998-2222-45ae-8160-0cc6a3a76b9e	44444444-4444-4444-4444-444444444444	HOTEL-7	delhi	2026-09-28	2026-11-14	9115.06	confirmed	2026-09-06 03:37:57.743091
de190042-ef11-4eab-b65b-65e4799f0cd4	44444444-4444-4444-4444-444444444444	HOTEL-6	hyderabad	2026-09-18	2026-11-03	49525.71	pending	2026-08-18 03:37:57.743091
542a7b1b-e61f-422c-a605-8ed462cbf435	22222222-2222-2222-2222-222222222222	HOTEL-11	pune	2026-10-10	2026-11-08	38060.25	cancelled	2026-09-10 03:37:57.743091
fb5a5bfc-d2b0-442f-a1d4-4a616d5fabe5	44444444-4444-4444-4444-444444444444	HOTEL-4	bangalore	2026-09-29	2026-10-29	16871.28	pending	2026-07-25 03:37:57.743091
f3b4aa81-2d96-49ed-b372-0c0f1610b495	33333333-3333-3333-3333-333333333333	HOTEL-11	mumbai	2026-09-23	2026-10-21	10105.51	completed	2026-09-16 03:37:57.743091
986cc64d-cbda-4124-975a-eeb9d8690e96	11111111-1111-1111-1111-111111111111	HOTEL-4	pune	2026-09-19	2026-10-27	5753.68	completed	2026-08-02 03:37:57.743091
f332aa40-3254-40c2-b16d-d295d57dd7cf	33333333-3333-3333-3333-333333333333	HOTEL-12	pune	2026-09-23	2026-11-03	44921.67	cancelled	2026-09-02 03:37:57.743091
0b1d5dbb-02b9-4e74-bfdf-dce08bc1e9a8	22222222-2222-2222-2222-222222222222	HOTEL-15	delhi	2026-10-09	2026-11-13	30194.50	completed	2026-09-10 03:37:57.743091
6878f33b-54ed-4e07-8915-82d7005eaa8b	22222222-2222-2222-2222-222222222222	HOTEL-18	hyderabad	2026-10-07	2026-10-24	5082.73	completed	2026-09-11 03:37:57.743091
3c706047-f071-4997-b3e3-0f4e7096fe2b	33333333-3333-3333-3333-333333333333	HOTEL-3	hyderabad	2026-09-19	2026-10-20	2879.11	completed	2026-09-16 03:37:57.743091
d0864f54-f103-42d3-9302-3c77b6370a92	44444444-4444-4444-4444-444444444444	HOTEL-17	mumbai	2026-10-01	2026-11-02	38817.94	cancelled	2026-09-13 03:37:57.743091
e1f6856f-0990-42e0-a17a-2e4da2c30cd5	33333333-3333-3333-3333-333333333333	HOTEL-3	hyderabad	2026-10-05	2026-11-05	11023.51	confirmed	2026-08-14 03:37:57.743091
830e4b1b-6f7a-49fa-a7f8-530966d51a47	11111111-1111-1111-1111-111111111111	HOTEL-20	pune	2026-09-25	2026-11-08	44903.53	pending	2026-08-22 03:37:57.743091
6f366b40-06f7-4321-88b0-4c235361c771	22222222-2222-2222-2222-222222222222	HOTEL-1	delhi	2026-09-25	2026-10-31	9216.35	confirmed	2026-09-11 03:37:57.743091
6f8a5be6-6d1e-496f-84ad-0c10d1e086cf	44444444-4444-4444-4444-444444444444	HOTEL-7	delhi	2026-09-29	2026-11-13	5965.93	cancelled	2026-09-11 03:37:57.743091
1bb546ee-d612-49bb-863a-7e64845835a2	44444444-4444-4444-4444-444444444444	HOTEL-17	delhi	2026-09-23	2026-10-20	41088.88	pending	2026-07-19 03:37:57.743091
63203f15-724c-4e8b-924b-2967283b4b9a	33333333-3333-3333-3333-333333333333	HOTEL-17	bangalore	2026-10-11	2026-10-20	9139.81	pending	2026-09-01 03:37:57.743091
98863da2-30a5-4042-91e4-a0cc22e318c9	33333333-3333-3333-3333-333333333333	HOTEL-13	delhi	2026-09-25	2026-11-08	14731.49	cancelled	2026-07-22 03:37:57.743091
7b72ac48-a639-42c1-a5d9-71e494625b6b	44444444-4444-4444-4444-444444444444	HOTEL-12	pune	2026-10-06	2026-10-28	22205.00	completed	2026-09-07 03:37:57.743091
5380b744-6bf5-4644-b395-4103bef396c3	33333333-3333-3333-3333-333333333333	HOTEL-8	mumbai	2026-09-18	2026-11-14	30923.02	confirmed	2026-09-03 03:37:57.743091
ae759285-a520-40f6-b8c3-4dc1a38fa5ae	11111111-1111-1111-1111-111111111111	HOTEL-7	delhi	2026-10-04	2026-11-10	38567.45	pending	2026-08-23 03:37:57.743091
11073058-fcbd-4385-9532-1fcfa625bfa0	11111111-1111-1111-1111-111111111111	HOTEL-15	hyderabad	2026-10-11	2026-10-18	49175.12	cancelled	2026-08-09 03:37:57.743091
3f25b7db-263c-47d6-a9dd-3152e17c84de	33333333-3333-3333-3333-333333333333	HOTEL-2	bangalore	2026-09-30	2026-11-01	1102.81	cancelled	2026-08-07 03:37:57.743091
1dee88c6-c98c-4bdf-be68-ced7e4ab61e4	44444444-4444-4444-4444-444444444444	HOTEL-19	pune	2026-10-12	2026-10-17	42549.84	completed	2026-08-18 03:37:57.743091
b9ee4488-4bd2-4963-8c7e-64430e80ad32	44444444-4444-4444-4444-444444444444	HOTEL-13	mumbai	2026-10-06	2026-10-28	28384.50	confirmed	2026-09-03 03:37:57.743091
09cb7f9f-c2b2-44ab-8758-04d18f732814	33333333-3333-3333-3333-333333333333	HOTEL-18	bangalore	2026-09-28	2026-10-25	35567.96	cancelled	2026-09-02 03:37:57.743091
fab882dd-8301-4053-8d91-469440c69bca	11111111-1111-1111-1111-111111111111	HOTEL-15	mumbai	2026-10-07	2026-11-11	44973.92	completed	2026-08-27 03:37:57.743091
\.


--
-- Name: booking_events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Devops
--

SELECT pg_catalog.setval('public.booking_events_id_seq', 129, true);


--
-- Name: booking_events booking_events_pkey; Type: CONSTRAINT; Schema: public; Owner: Devops
--

ALTER TABLE ONLY public.booking_events
    ADD CONSTRAINT booking_events_pkey PRIMARY KEY (id);


--
-- Name: hotel_bookings hotel_bookings_pkey; Type: CONSTRAINT; Schema: public; Owner: Devops
--

ALTER TABLE ONLY public.hotel_bookings
    ADD CONSTRAINT hotel_bookings_pkey PRIMARY KEY (id);


--
-- Name: idx_booking_events_booking_id; Type: INDEX; Schema: public; Owner: Devops
--

CREATE INDEX idx_booking_events_booking_id ON public.booking_events USING btree (booking_id);


--
-- Name: idx_hotel_bookings_city_created_at; Type: INDEX; Schema: public; Owner: Devops
--

CREATE INDEX idx_hotel_bookings_city_created_at ON public.hotel_bookings USING btree (city, created_at);


--
-- Name: booking_events fk_booking_events_booking; Type: FK CONSTRAINT; Schema: public; Owner: Devops
--

ALTER TABLE ONLY public.booking_events
    ADD CONSTRAINT fk_booking_events_booking FOREIGN KEY (booking_id) REFERENCES public.hotel_bookings(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

\unrestrict sRkZPczGXtsmUDkFF1FH6mdJdeTds3i5W5JRp69KW53bwihVq1SjauWa85Il5g3

