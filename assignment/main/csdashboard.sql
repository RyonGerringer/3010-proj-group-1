--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-0ubuntu0.20.04.1)

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
-- Name: comittee_assignments; Type: TABLE; Schema: public; Owner: webuser1
--

CREATE TABLE public.comittee_assignments (
    "ID" smallint NOT NULL,
    committee_id smallint NOT NULL,
    start_date character varying(10),
    end_date character varying(10),
    remarks character varying(250)
);


ALTER TABLE public.comittee_assignments OWNER TO webuser1;

--
-- Name: comittee_names; Type: TABLE; Schema: public; Owner: webuser1
--

CREATE TABLE public.comittee_names (
    id smallint NOT NULL,
    name character varying(250),
    remarks character varying(250)
);


ALTER TABLE public.comittee_names OWNER TO webuser1;

--
-- Name: course_directors; Type: TABLE; Schema: public; Owner: webuser1
--

CREATE TABLE public.course_directors (
    prefix character varying(4) NOT NULL,
    number smallint NOT NULL,
    "ID" smallint NOT NULL,
    remarks character varying(250)
);


ALTER TABLE public.course_directors OWNER TO webuser1;

--
-- Name: course_history; Type: TABLE; Schema: public; Owner: webuser1
--

CREATE TABLE public.course_history (
    crn smallint NOT NULL,
    year smallint NOT NULL,
    semester character varying(6) NOT NULL,
    prefix character varying(5) NOT NULL,
    number smallint NOT NULL,
    section smallint NOT NULL,
    enrollment smallint NOT NULL,
    "ID" smallint NOT NULL,
    days character varying(4),
    begin_time character varying(4),
    end_time character varying(4),
    remarks character varying(10)
);


ALTER TABLE public.course_history OWNER TO webuser1;

--
-- Name: faculty; Type: TABLE; Schema: public; Owner: webuser1
--

CREATE TABLE public.faculty (
    "ID" integer NOT NULL,
    prefix character varying(5) NOT NULL,
    "First_Name" character varying(50) NOT NULL,
    "MI" character varying(3),
    "Last_Name" character varying(50) NOT NULL,
    email character varying(255),
    phone character varying(20),
    office character varying(50),
    research character varying(250),
    rank character varying(30) NOT NULL,
    remarks character varying(50),
    employed character varying(10)
);


ALTER TABLE public.faculty OWNER TO webuser1;

--
-- Name: faculty_faculty_id_seq; Type: SEQUENCE; Schema: public; Owner: webuser1
--

CREATE SEQUENCE public.faculty_faculty_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.faculty_faculty_id_seq OWNER TO webuser1;

--
-- Name: faculty_faculty_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: webuser1
--

ALTER SEQUENCE public.faculty_faculty_id_seq OWNED BY public.faculty."ID";


--
-- Name: faculty ID; Type: DEFAULT; Schema: public; Owner: webuser1
--

ALTER TABLE ONLY public.faculty ALTER COLUMN "ID" SET DEFAULT nextval('public.faculty_faculty_id_seq'::regclass);


--
-- Data for Name: comittee_assignments; Type: TABLE DATA; Schema: public; Owner: webuser1
--

COPY public.comittee_assignments ("ID", committee_id, start_date, end_date, remarks) FROM stdin;
1	1	Aug-2018	Jul-2021	\N
4	1	Aug-2018	Jul-2021	\N
9	1	Aug-2019	Jul-2022	\N
15	2	Aug-2018	Jul-2021	\N
8	2	Aug-2019	Jul-2022	\N
12	2	Aug-2018	Jul-2021	\N
1	3	Aug-2020	Jul-2023	\N
7	3	Aug-2018	Jul-2021	\N
9	3	Aug-2008	Jul-2021	\N
3	4	Jan-2021	Dec-2023	\N
5	4	Jan-2021	Dec-2023	\N
5	5	Jan-2021	Dec-2023	\N
12	5	Jan-2021	Dec-2023	\N
1	6	\N	\N	\N
4	6	\N	\N	\N
5	6	\N	\N	\N
8	6	\N	\N	\N
15	6	\N	\N	\N
1	7	\N	\N	\N
4	7	\N	\N	\N
5	7	\N	\N	\N
8	7	\N	\N	\N
15	7	\N	\N	\N
15	8	Jan-2021	May-2021	\N
\.


--
-- Data for Name: comittee_names; Type: TABLE DATA; Schema: public; Owner: webuser1
--

COPY public.comittee_names (id, name, remarks) FROM stdin;
1	Undergraduate Curriculum Committee	\N
2	Graduate Curriculum Committee	\N
3	Assessment Committee	\N
4	Awards Committee	\N
5	Scholarships Committee	\N
6	Personnel Committee	\N
7	Promotion and Tenure Committee	\N
8	CET Budget Workgroup Committee	 CET ad hoc committee to explore ways to meet projected budget cuts
\.


--
-- Data for Name: course_directors; Type: TABLE DATA; Schema: public; Owner: webuser1
--

COPY public.course_directors (prefix, number, "ID", remarks) FROM stdin;
CSCI	1000	14	\N
CSCI	1003	14	\N
CSCI	1010	14	\N
CSCI	1011	14	\N
CSCI	2400	12	\N
CSCI	2405	12	\N
CSCI	2410	5	\N
CSCI	2530	1	\N
CSCI	2540	1	\N
CSCI	3000	9	\N
CSCI	3010	9	\N
CSCI	3030	12	\N
CSCI	3200	12	\N
CSCI	3550	9	\N
CSCI	3584	5	\N
CSCI	3650	5	\N
CSCI	3675	1	\N
CSCI	3700	4	\N
CSCI	3800	9	\N
CSCI	4110	7	\N
CSCI	4120	16	\N
CSCI	4130	6	\N
CSCI	4140	7	\N
CSCI	4150	6	\N
CSCI	4160	5	\N
CSCI	4170	8	\N
CSCI	4180	7	\N
CSCI	4190	5	\N
CSCI	4230	8	\N
CSCI	4231	8	\N
CSCI	4300	6	\N
CSCI	4520	9	\N
CSCI	4540	8	\N
CSCI	4550	9	\N
CSCI	4602	1	\N
CSCI	4627	1	\N
CSCI	4710	16	\N
CSCI	4900	14	\N
CSCI	4905	6	\N
SENG	1000	15	\N
SENG	1010	16	\N
SENG	1020	16	\N
SENG	1030	16	\N
SENG	2000	11	\N
SENG	2010	11	\N
SENG	2020	8	\N
SENG	3000	8	\N
SENG	3010	3	\N
SENG	3020	3	\N
SENG	3700	6	\N
SENG	4500	11	\N
SENG	4510	11	\N
CSCI	5002	5	\N
CSCI	5220	1	\N
CSCI	5501	6	\N
CSCI	5502	6	\N
CSCI	5503	6	\N
CSCI	5800	7	\N
CSCI	6010	7	\N
CSCI	6020	16	\N
CSCI	6030	6	\N
CSCI	6040	7	\N
CSCI	6045	15	\N
CSCI	6050	6	\N
CSCI	6100	5	\N
CSCI	6120	15	\N
CSCI	6130	15	\N
CSCI	6140	15	\N
CSCI	6150	5	\N
CSCI	6220	1	\N
CSCI	6230	8	\N
CSCI	6300	5	\N
CSCI	6410	5	\N
CSCI	6420	1	\N
CSCI	6510	5	\N
CSCI	6600	4	\N
CSCI	6710	16	\N
CSCI	6810	7	\N
CSCI	6820	6	\N
CSCI	6840	4	\N
CSCI	6905	6	\N
CSCI	6995	1	\N
CSCI	7000	8	\N
CSCI	7001	8	\N
SENG	5000	8	\N
SENG	5005	5	\N
SENG	6230	8	\N
SENG	6235	15	\N
SENG	6240	15	\N
SENG	6245	8	\N
SENG	6247	12	\N
SENG	6250	8	\N
SENG	6255	3	\N
SENG	6260	3	\N
SENG	6265	3	\N
SENG	6270	3	\N
SENG	6275	3	\N
SENG	6280	8	\N
SENG	6285	15	\N
SENG	6290	15	\N
SENG	7000	15	\N
DASC	6000	6	\N
DASC	6005	6	\N
DASC	6010	7	\N
DASC	6020	16	\N
DASC	6030	6	\N
DASC	6040	7	\N
DASC	6050	6	\N
DASC	6060	6	\N
DASC	6070	6	\N
DASC	6090	6	\N
\.


--
-- Data for Name: course_history; Type: TABLE DATA; Schema: public; Owner: webuser1
--

COPY public.course_history (crn, year, semester, prefix, number, section, enrollment, "ID", days, begin_time, end_time, remarks) FROM stdin;
\.


--
-- Data for Name: faculty; Type: TABLE DATA; Schema: public; Owner: webuser1
--

COPY public.faculty ("ID", prefix, "First_Name", "MI", "Last_Name", email, phone, office, research, rank, remarks, employed) FROM stdin;
1	Dr.	Karl	\N	Arahamson	abrahamsonk@ecu.edu	252-328-9689	Sci-Tech C113	Programming Languages	Associate Professor	Undergraduate Program Director	Yes
2	Ms.	Sheaneatha	D	Applewhite-Hopkins	applewhitehopkins16@ecu.edu	252-328-9680	Sci-Tech C107	\N	Administrative Assistant	\N	Yes
3	Dr.	Maral	\N	Azizi	azizim19@ecu.edu	252-328-9680	Sci-Tech C108	Software Engineering, Information Retrieval, Database Design, Machine Learning	Assistant Professor	\N	Yes
4	Dr.	Qin	\N	Ding	dingq@ecu.edu	252-328-9686	Sci-Tech C118	Databases, Data mining, Bioinformatics	Associate Professor	\N	Yes
5	Dr.	Krishnan	\N	Gopal	gopal@ecu.edu	252-328-9688	Sci-Tech C118	Combinatorics, Cryptography and Information Security, Distributed Computing, Algorithms and Theoretical Computer Science	Associate Professor	\N	Yes
6	Dr.	Venkat	N	Gudivada	gudivadav15@ecu.edu	252-328-9680	Sci-Tech C-107	Data Management/Analytics, Information Retrieval/Systems, Natural Language Processing, Computer Vision, Personalized Learning	Professor	Department Chair	Yes
7	Dr.	Nick	\N	Herndon	herndonn19@ecu.edu	252-328-9696	Sci-Tech C108	Artificial Intelligence, Machine Learning, Data Science, Big Data Analytics, and Computational Biology	Assistant Professor	\N	Yes
8	Dr.	Mark	\N	Hills	hillsma@ecu.edu	252-328-9692	Sci-Tech C110	Program Analysis, Programming Language Implementation, Domain-Specific Languages, Software Modeling and Verification, Software Analytics, Formal Semantics of Programming Languages	Associate Professor	Graduate Program Director	Yes
9	Mr.	Bobby	\N	Hoggard	hoggardr@ecu.edu	252-328-9695	Sci-Tech C105	Cloud Computing, Computer Architecture, Web Applications, Computer Science Education	Instructor	\N	Yes
10	Mr.	John	\N	Jones	jonesjo@ecu.edu	252-328-9606	Sci-Tech 109	Data Structures and Algorithms, Digital Electronics, Software Construction, Networking, Data Center Virtualization, Distributed Computing, Storage Management, Operating Systems	Adjunct Instructor	\N	Yes
11	Dr.	Jonathan	A	Saddler	saddlerj20@ecu.edu	252-328-9687	Sci-Tech C117	Software Engineering	Teaching Assistant Professor	\N	Yes
12	Dr.	Kamran	\N	Sartipi	sartipik16@ecu.edu	252-328-9694	Sci-Tech C122	Software Engineering, Knowledge Engineering and Data Mining, Cyber Security and Data Privacy, User-Behavior based Access Control, Medical & Health Systems Integration and Informatics, Service Intelligence for Cloud, Decision Support Systems	Assistant Professor	\N	Yes
13	Dr.	Ronnie	\N	Smith	smithron@cs.ecu.edu	252-328-9687	Sci-Tech C117	Artificial Intelligence, Spoken Natural Languages	Research Associate Professor	\N	No
14	Mr.	Joel	\N	Sweatte	sweattej@ecu.edu	252-328-9439	Sci-Tech C112	Data Center Virtualization, Cloud Computing, Mainframe Platform Computing, Storage Management	Instructor	\N	Yes
15	Dr.	Nasseh	\N	Tabrizi	tabrizim@ecu.edu	252-328-9691	Sci-Tech C112	Big Data Analytics, Cloud Computing, Computer Vision, Software Requirement Engineering, Information Retrieval, Virtual Reality, Machine Learning, Computer Science and Software Engineering Education	Professor	\N	Yes
16	Dr.	Rui	\N	Wu	wur18@ecu.edu	252-328-9682	Sci-Tech C107	Data Processing and Visualization, Interdisciplinary Research	Assistant Professor	\N	Yes
17	Dr.	Patyi	\N	Imre	patyii@ecu.edu	252-328-6461	\N	\N	Associate Professor	No	\N
18	Ms.	Sumati	R	Kulkarni	\N	\N	\N	\N	Teaching Assistant	\N	No
19	Ms.	Logan	G	Childers	\N	\N	\N	\N	Teaching Assistant	\N	No
20	Mr.	Gregory	\N	Knight	\N	\N	\N	\N	Adjunct Instructor	\N	No
21	Dr.	 Sergiy	\N	Vilkomir	\N	\N	\N	Software Testing	Associate Professor	\N	No
22	Dr.	Ding	\N	Junhua	\N	\N	\N	Software Testing, Machine Learning	Associate Professor	\N	No
23	Mr.	David	M	Anderson	\N	\N	\N	\N	Teaching Assistant	\N	No
24	Mr.	Aryan	\N	Azimzadeh	\N	\N	\N	\N	Teaching Assistant	\N	No
25	Mr.	Shawn	K	Braddy	\N	\N	\N	\N	Teaching Assistant	\N	No
26	Dr.	Masao	\N	Kishore	\N	\N	\N	\N	Associate Professor	\N	No
27	Mr.	David	R	Hoffman	\N	\N	\N	\N	Teaching Assistant	\N	No
\.


--
-- Name: faculty_faculty_id_seq; Type: SEQUENCE SET; Schema: public; Owner: webuser1
--

SELECT pg_catalog.setval('public.faculty_faculty_id_seq', 1, false);


--
-- Name: comittee_names comittee_names_pkey; Type: CONSTRAINT; Schema: public; Owner: webuser1
--

ALTER TABLE ONLY public.comittee_names
    ADD CONSTRAINT comittee_names_pkey PRIMARY KEY (id);


--
-- Name: course_directors course_directors_pkey; Type: CONSTRAINT; Schema: public; Owner: webuser1
--

ALTER TABLE ONLY public.course_directors
    ADD CONSTRAINT course_directors_pkey PRIMARY KEY (prefix, number);


--
-- Name: course_history course_history_pkey; Type: CONSTRAINT; Schema: public; Owner: webuser1
--

ALTER TABLE ONLY public.course_history
    ADD CONSTRAINT course_history_pkey PRIMARY KEY (crn);


--
-- Name: faculty faculty_pkey; Type: CONSTRAINT; Schema: public; Owner: webuser1
--

ALTER TABLE ONLY public.faculty
    ADD CONSTRAINT faculty_pkey PRIMARY KEY ("ID");


--
-- PostgreSQL database dump complete
--

