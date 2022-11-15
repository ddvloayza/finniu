--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Drop databases
--

DROP DATABASE blog_database;




--
-- Drop roles
--

DROP ROLE blog_database;
DROP ROLE postgres;


--
-- Roles
--

CREATE ROLE blog_database;
ALTER ROLE blog_database WITH SUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS PASSWORD 'md58f8ba9cae6c4e2560b3ae824c27d6b74';
CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS;






--
-- Database creation
--

CREATE DATABASE blog_database WITH TEMPLATE = template0 OWNER = postgres;
REVOKE CONNECT,TEMPORARY ON DATABASE template1 FROM PUBLIC;
GRANT CONNECT ON DATABASE template1 TO PUBLIC;


\connect blog_database

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

-- Dumped from database version 10.3
-- Dumped by pg_dump version 10.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
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
-- Name: auth_group; Type: TABLE; Schema: public; Owner: blog_database
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO blog_database;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: blog_database
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO blog_database;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: blog_database
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: blog_database
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO blog_database;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: blog_database
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO blog_database;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: blog_database
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: blog_database
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO blog_database;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: blog_database
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO blog_database;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: blog_database
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: blog_database
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO blog_database;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: blog_database
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO blog_database;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: blog_database
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO blog_database;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: blog_database
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: blog_database
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO blog_database;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: blog_database
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: blog_database
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO blog_database;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: blog_database
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO blog_database;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: blog_database
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: blog_blogarticle; Type: TABLE; Schema: public; Owner: blog_database
--

CREATE TABLE public.blog_blogarticle (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    title character varying(128) NOT NULL,
    slug character varying(128) NOT NULL,
    video text,
    highlighting_weight integer NOT NULL,
    category_id integer,
    user_id integer,
    intro text,
    image_intro character varying(100),
    quotes text,
    is_active boolean NOT NULL,
    CONSTRAINT blog_blogarticle_highlighting_weight_check CHECK ((highlighting_weight >= 0))
);


ALTER TABLE public.blog_blogarticle OWNER TO blog_database;

--
-- Name: blog_blogarticle_id_seq; Type: SEQUENCE; Schema: public; Owner: blog_database
--

CREATE SEQUENCE public.blog_blogarticle_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.blog_blogarticle_id_seq OWNER TO blog_database;

--
-- Name: blog_blogarticle_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: blog_database
--

ALTER SEQUENCE public.blog_blogarticle_id_seq OWNED BY public.blog_blogarticle.id;


--
-- Name: blog_blogarticle_tags; Type: TABLE; Schema: public; Owner: blog_database
--

CREATE TABLE public.blog_blogarticle_tags (
    id integer NOT NULL,
    blogarticle_id integer NOT NULL,
    blogtag_id integer NOT NULL
);


ALTER TABLE public.blog_blogarticle_tags OWNER TO blog_database;

--
-- Name: blog_blogarticle_tags_id_seq; Type: SEQUENCE; Schema: public; Owner: blog_database
--

CREATE SEQUENCE public.blog_blogarticle_tags_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.blog_blogarticle_tags_id_seq OWNER TO blog_database;

--
-- Name: blog_blogarticle_tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: blog_database
--

ALTER SEQUENCE public.blog_blogarticle_tags_id_seq OWNED BY public.blog_blogarticle_tags.id;


--
-- Name: blog_blogtag; Type: TABLE; Schema: public; Owner: blog_database
--

CREATE TABLE public.blog_blogtag (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    name character varying(128) NOT NULL,
    slug character varying(128) NOT NULL,
    color integer,
    user_id integer,
    CONSTRAINT blog_blogtag_color_check CHECK ((color >= 0))
);


ALTER TABLE public.blog_blogtag OWNER TO blog_database;

--
-- Name: blog_blogtag_id_seq; Type: SEQUENCE; Schema: public; Owner: blog_database
--

CREATE SEQUENCE public.blog_blogtag_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.blog_blogtag_id_seq OWNER TO blog_database;

--
-- Name: blog_blogtag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: blog_database
--

ALTER SEQUENCE public.blog_blogtag_id_seq OWNED BY public.blog_blogtag.id;


--
-- Name: blog_categoryarticle; Type: TABLE; Schema: public; Owner: blog_database
--

CREATE TABLE public.blog_categoryarticle (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    title character varying(128) NOT NULL,
    slug character varying(128) NOT NULL,
    image character varying(100) NOT NULL,
    video text,
    highlighting_weight integer NOT NULL,
    user_id integer,
    CONSTRAINT blog_categoryarticle_highlighting_weight_check CHECK ((highlighting_weight >= 0))
);


ALTER TABLE public.blog_categoryarticle OWNER TO blog_database;

--
-- Name: blog_categoryarticle_id_seq; Type: SEQUENCE; Schema: public; Owner: blog_database
--

CREATE SEQUENCE public.blog_categoryarticle_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.blog_categoryarticle_id_seq OWNER TO blog_database;

--
-- Name: blog_categoryarticle_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: blog_database
--

ALTER SEQUENCE public.blog_categoryarticle_id_seq OWNED BY public.blog_categoryarticle.id;


--
-- Name: blog_configblog; Type: TABLE; Schema: public; Owner: blog_database
--

CREATE TABLE public.blog_configblog (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    name_page character varying(128) NOT NULL,
    image character varying(100) NOT NULL,
    content text,
    user_id integer
);


ALTER TABLE public.blog_configblog OWNER TO blog_database;

--
-- Name: blog_configblog_id_seq; Type: SEQUENCE; Schema: public; Owner: blog_database
--

CREATE SEQUENCE public.blog_configblog_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.blog_configblog_id_seq OWNER TO blog_database;

--
-- Name: blog_configblog_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: blog_database
--

ALTER SEQUENCE public.blog_configblog_id_seq OWNED BY public.blog_configblog.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: blog_database
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO blog_database;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: blog_database
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO blog_database;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: blog_database
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: blog_database
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO blog_database;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: blog_database
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO blog_database;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: blog_database
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: blog_database
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO blog_database;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: blog_database
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO blog_database;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: blog_database
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: blog_database
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO blog_database;

--
-- Name: userprofile_userprofile; Type: TABLE; Schema: public; Owner: blog_database
--

CREATE TABLE public.userprofile_userprofile (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    first_name character varying(128) NOT NULL,
    last_name character varying(128) NOT NULL,
    ocupation character varying(128),
    image character varying(100),
    slug character varying(128) NOT NULL,
    facebook_url character varying(200),
    linkedin_url character varying(200),
    twitter_url character varying(200),
    instagram_url character varying(200),
    user_id integer
);


ALTER TABLE public.userprofile_userprofile OWNER TO blog_database;

--
-- Name: userprofile_userprofile_id_seq; Type: SEQUENCE; Schema: public; Owner: blog_database
--

CREATE SEQUENCE public.userprofile_userprofile_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.userprofile_userprofile_id_seq OWNER TO blog_database;

--
-- Name: userprofile_userprofile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: blog_database
--

ALTER SEQUENCE public.userprofile_userprofile_id_seq OWNED BY public.userprofile_userprofile.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: blog_database
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: blog_database
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: blog_database
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: blog_database
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: blog_database
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: blog_database
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: blog_blogarticle id; Type: DEFAULT; Schema: public; Owner: blog_database
--

ALTER TABLE ONLY public.blog_blogarticle ALTER COLUMN id SET DEFAULT nextval('public.blog_blogarticle_id_seq'::regclass);


--
-- Name: blog_blogarticle_tags id; Type: DEFAULT; Schema: public; Owner: blog_database
--

ALTER TABLE ONLY public.blog_blogarticle_tags ALTER COLUMN id SET DEFAULT nextval('public.blog_blogarticle_tags_id_seq'::regclass);


--
-- Name: blog_blogtag id; Type: DEFAULT; Schema: public; Owner: blog_database
--

ALTER TABLE ONLY public.blog_blogtag ALTER COLUMN id SET DEFAULT nextval('public.blog_blogtag_id_seq'::regclass);


--
-- Name: blog_categoryarticle id; Type: DEFAULT; Schema: public; Owner: blog_database
--

ALTER TABLE ONLY public.blog_categoryarticle ALTER COLUMN id SET DEFAULT nextval('public.blog_categoryarticle_id_seq'::regclass);


--
-- Name: blog_configblog id; Type: DEFAULT; Schema: public; Owner: blog_database
--

ALTER TABLE ONLY public.blog_configblog ALTER COLUMN id SET DEFAULT nextval('public.blog_configblog_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: blog_database
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: blog_database
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: blog_database
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: userprofile_userprofile id; Type: DEFAULT; Schema: public; Owner: blog_database
--

ALTER TABLE ONLY public.userprofile_userprofile ALTER COLUMN id SET DEFAULT nextval('public.userprofile_userprofile_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: blog_database
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: blog_database
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: blog_database
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add Blog configuracion	7	add_configblog
26	Can change Blog configuracion	7	change_configblog
27	Can delete Blog configuracion	7	delete_configblog
28	Can view Blog configuracion	7	view_configblog
29	Can add Categoria	8	add_categoryarticle
30	Can change Categoria	8	change_categoryarticle
31	Can delete Categoria	8	delete_categoryarticle
32	Can view Categoria	8	view_categoryarticle
33	Can add Etiqueta de articulo	9	add_blogtag
34	Can change Etiqueta de articulo	9	change_blogtag
35	Can delete Etiqueta de articulo	9	delete_blogtag
36	Can view Etiqueta de articulo	9	view_blogtag
37	Can add Artículo	10	add_blogarticle
38	Can change Artículo	10	change_blogarticle
39	Can delete Artículo	10	delete_blogarticle
40	Can view Artículo	10	view_blogarticle
41	Can add Perfil del Usuario	11	add_userprofile
42	Can change Perfil del Usuario	11	change_userprofile
43	Can delete Perfil del Usuario	11	delete_userprofile
44	Can view Perfil del Usuario	11	view_userprofile
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: blog_database
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$180000$57NRhc5gjRue$NV538rUFR84bF7uYnv8EnLNJ0wbXsrrGhnjNBpSvzbk=	2021-07-26 07:01:55.166312+00	t	admin			admin@admin.com	t	t	2021-07-26 06:59:56.568808+00
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: blog_database
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: blog_database
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: blog_blogarticle; Type: TABLE DATA; Schema: public; Owner: blog_database
--

COPY public.blog_blogarticle (id, created, modified, title, slug, video, highlighting_weight, category_id, user_id, intro, image_intro, quotes, is_active) FROM stdin;
1	2021-07-26 07:04:24.065961+00	2021-07-26 09:13:15.879663+00	prueba	prueba		100	1	1	<pre class="language-python"><code>ddddddddd</code></pre>	blog-images/intro/descarga.png		t
\.


--
-- Data for Name: blog_blogarticle_tags; Type: TABLE DATA; Schema: public; Owner: blog_database
--

COPY public.blog_blogarticle_tags (id, blogarticle_id, blogtag_id) FROM stdin;
\.


--
-- Data for Name: blog_blogtag; Type: TABLE DATA; Schema: public; Owner: blog_database
--

COPY public.blog_blogtag (id, created, modified, name, slug, color, user_id) FROM stdin;
\.


--
-- Data for Name: blog_categoryarticle; Type: TABLE DATA; Schema: public; Owner: blog_database
--

COPY public.blog_categoryarticle (id, created, modified, title, slug, image, video, highlighting_weight, user_id) FROM stdin;
1	2021-07-26 07:04:11.420568+00	2021-07-26 07:04:11.420594+00	Kubernetes	kubernetes	blog-images/descarga.png		100	1
\.


--
-- Data for Name: blog_configblog; Type: TABLE DATA; Schema: public; Owner: blog_database
--

COPY public.blog_configblog (id, created, modified, name_page, image, content, user_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: blog_database
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2021-07-26 07:04:11.423792+00	1	Kubernetes	1	[{"added": {}}]	8	1
2	2021-07-26 07:04:24.070566+00	1	prueba	1	[{"added": {}}]	10	1
3	2021-07-26 08:43:01.487015+00	1	prueba	2	[]	10	1
4	2021-07-26 09:12:24.938159+00	1	prueba	2	[{"changed": {"fields": ["Imagen de Introduccion"]}}]	10	1
5	2021-07-26 09:13:15.882751+00	1	prueba	2	[{"changed": {"fields": ["Introduccion"]}}]	10	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: blog_database
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	blog	configblog
8	blog	categoryarticle
9	blog	blogtag
10	blog	blogarticle
11	userprofile	userprofile
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: blog_database
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2021-07-26 06:56:44.318938+00
2	auth	0001_initial	2021-07-26 06:56:44.370277+00
3	admin	0001_initial	2021-07-26 06:56:44.446372+00
4	admin	0002_logentry_remove_auto_add	2021-07-26 06:56:44.46541+00
5	admin	0003_logentry_add_action_flag_choices	2021-07-26 06:56:44.475627+00
6	contenttypes	0002_remove_content_type_name	2021-07-26 06:56:44.498634+00
7	auth	0002_alter_permission_name_max_length	2021-07-26 06:56:44.505115+00
8	auth	0003_alter_user_email_max_length	2021-07-26 06:56:44.515021+00
9	auth	0004_alter_user_username_opts	2021-07-26 06:56:44.524942+00
10	auth	0005_alter_user_last_login_null	2021-07-26 06:56:44.53509+00
11	auth	0006_require_contenttypes_0002	2021-07-26 06:56:44.53801+00
12	auth	0007_alter_validators_add_error_messages	2021-07-26 06:56:44.548039+00
13	auth	0008_alter_user_username_max_length	2021-07-26 06:56:44.562996+00
14	auth	0009_alter_user_last_name_max_length	2021-07-26 06:56:44.573737+00
15	auth	0010_alter_group_name_max_length	2021-07-26 06:56:44.583446+00
16	auth	0011_update_proxy_permissions	2021-07-26 06:56:44.594588+00
17	blog	0001_initial	2021-07-26 06:56:44.661042+00
18	blog	0002_auto_20210417_2232	2021-07-26 06:56:44.722452+00
19	blog	0003_auto_20210417_2308	2021-07-26 06:56:44.758099+00
20	blog	0004_auto_20210417_2317	2021-07-26 06:56:44.794658+00
21	blog	0005_auto_20210417_2332	2021-07-26 06:56:44.854344+00
22	blog	0006_blogarticle_quotes	2021-07-26 06:56:44.867447+00
23	blog	0007_auto_20210627_1914	2021-07-26 06:56:44.917561+00
24	sessions	0001_initial	2021-07-26 06:56:44.929097+00
25	userprofile	0001_initial	2021-07-26 06:56:44.962265+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: blog_database
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
udvggrnzulcp18rw7wrgway3u4qnqcu6	Nzc1NWJjYmNjOGM5ZjAxMGEwNWM4MThmMjJmY2MzNDk3NmQwMjllMjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjODJhN2U4MzI5Njg0NzM2ZDFjYTEwOWYwNGM5ODFhNDk3NGQ1NTBmIn0=	2021-08-09 07:01:55.169575+00
\.


--
-- Data for Name: userprofile_userprofile; Type: TABLE DATA; Schema: public; Owner: blog_database
--

COPY public.userprofile_userprofile (id, created, modified, first_name, last_name, ocupation, image, slug, facebook_url, linkedin_url, twitter_url, instagram_url, user_id) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: blog_database
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: blog_database
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: blog_database
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 44, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: blog_database
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: blog_database
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: blog_database
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: blog_blogarticle_id_seq; Type: SEQUENCE SET; Schema: public; Owner: blog_database
--

SELECT pg_catalog.setval('public.blog_blogarticle_id_seq', 1, true);


--
-- Name: blog_blogarticle_tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: blog_database
--

SELECT pg_catalog.setval('public.blog_blogarticle_tags_id_seq', 1, false);


--
-- Name: blog_blogtag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: blog_database
--

SELECT pg_catalog.setval('public.blog_blogtag_id_seq', 1, false);


--
-- Name: blog_categoryarticle_id_seq; Type: SEQUENCE SET; Schema: public; Owner: blog_database
--

SELECT pg_catalog.setval('public.blog_categoryarticle_id_seq', 1, true);


--
-- Name: blog_configblog_id_seq; Type: SEQUENCE SET; Schema: public; Owner: blog_database
--

SELECT pg_catalog.setval('public.blog_configblog_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: blog_database
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 5, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: blog_database
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 11, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: blog_database
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 25, true);


--
-- Name: userprofile_userprofile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: blog_database
--

SELECT pg_catalog.setval('public.userprofile_userprofile_id_seq', 1, false);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: blog_database
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: blog_database
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: blog_database
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: blog_database
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: blog_database
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: blog_database
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: blog_database
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: blog_database
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: blog_database
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: blog_database
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: blog_database
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: blog_database
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: blog_blogarticle blog_blogarticle_pkey; Type: CONSTRAINT; Schema: public; Owner: blog_database
--

ALTER TABLE ONLY public.blog_blogarticle
    ADD CONSTRAINT blog_blogarticle_pkey PRIMARY KEY (id);


--
-- Name: blog_blogarticle_tags blog_blogarticle_tags_blogarticle_id_blogtag_id_41ef922b_uniq; Type: CONSTRAINT; Schema: public; Owner: blog_database
--

ALTER TABLE ONLY public.blog_blogarticle_tags
    ADD CONSTRAINT blog_blogarticle_tags_blogarticle_id_blogtag_id_41ef922b_uniq UNIQUE (blogarticle_id, blogtag_id);


--
-- Name: blog_blogarticle_tags blog_blogarticle_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: blog_database
--

ALTER TABLE ONLY public.blog_blogarticle_tags
    ADD CONSTRAINT blog_blogarticle_tags_pkey PRIMARY KEY (id);


--
-- Name: blog_blogtag blog_blogtag_pkey; Type: CONSTRAINT; Schema: public; Owner: blog_database
--

ALTER TABLE ONLY public.blog_blogtag
    ADD CONSTRAINT blog_blogtag_pkey PRIMARY KEY (id);


--
-- Name: blog_categoryarticle blog_categoryarticle_pkey; Type: CONSTRAINT; Schema: public; Owner: blog_database
--

ALTER TABLE ONLY public.blog_categoryarticle
    ADD CONSTRAINT blog_categoryarticle_pkey PRIMARY KEY (id);


--
-- Name: blog_configblog blog_configblog_pkey; Type: CONSTRAINT; Schema: public; Owner: blog_database
--

ALTER TABLE ONLY public.blog_configblog
    ADD CONSTRAINT blog_configblog_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: blog_database
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: blog_database
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: blog_database
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: blog_database
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: blog_database
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: userprofile_userprofile userprofile_userprofile_pkey; Type: CONSTRAINT; Schema: public; Owner: blog_database
--

ALTER TABLE ONLY public.userprofile_userprofile
    ADD CONSTRAINT userprofile_userprofile_pkey PRIMARY KEY (id);


--
-- Name: userprofile_userprofile userprofile_userprofile_user_id_key; Type: CONSTRAINT; Schema: public; Owner: blog_database
--

ALTER TABLE ONLY public.userprofile_userprofile
    ADD CONSTRAINT userprofile_userprofile_user_id_key UNIQUE (user_id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: blog_database
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: blog_database
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: blog_database
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: blog_database
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: blog_database
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: blog_database
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: blog_database
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: blog_database
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: blog_database
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: blog_blogarticle_category_id_10be0fb4; Type: INDEX; Schema: public; Owner: blog_database
--

CREATE INDEX blog_blogarticle_category_id_10be0fb4 ON public.blog_blogarticle USING btree (category_id);


--
-- Name: blog_blogarticle_slug_553e3058; Type: INDEX; Schema: public; Owner: blog_database
--

CREATE INDEX blog_blogarticle_slug_553e3058 ON public.blog_blogarticle USING btree (slug);


--
-- Name: blog_blogarticle_slug_553e3058_like; Type: INDEX; Schema: public; Owner: blog_database
--

CREATE INDEX blog_blogarticle_slug_553e3058_like ON public.blog_blogarticle USING btree (slug varchar_pattern_ops);


--
-- Name: blog_blogarticle_tags_blogarticle_id_ca8846c1; Type: INDEX; Schema: public; Owner: blog_database
--

CREATE INDEX blog_blogarticle_tags_blogarticle_id_ca8846c1 ON public.blog_blogarticle_tags USING btree (blogarticle_id);


--
-- Name: blog_blogarticle_tags_blogtag_id_72df2fc5; Type: INDEX; Schema: public; Owner: blog_database
--

CREATE INDEX blog_blogarticle_tags_blogtag_id_72df2fc5 ON public.blog_blogarticle_tags USING btree (blogtag_id);


--
-- Name: blog_blogarticle_user_id_49ae3033; Type: INDEX; Schema: public; Owner: blog_database
--

CREATE INDEX blog_blogarticle_user_id_49ae3033 ON public.blog_blogarticle USING btree (user_id);


--
-- Name: blog_blogtag_slug_eecf3988; Type: INDEX; Schema: public; Owner: blog_database
--

CREATE INDEX blog_blogtag_slug_eecf3988 ON public.blog_blogtag USING btree (slug);


--
-- Name: blog_blogtag_slug_eecf3988_like; Type: INDEX; Schema: public; Owner: blog_database
--

CREATE INDEX blog_blogtag_slug_eecf3988_like ON public.blog_blogtag USING btree (slug varchar_pattern_ops);


--
-- Name: blog_blogtag_user_id_5b5b3cd4; Type: INDEX; Schema: public; Owner: blog_database
--

CREATE INDEX blog_blogtag_user_id_5b5b3cd4 ON public.blog_blogtag USING btree (user_id);


--
-- Name: blog_categoryarticle_slug_21d3d61d; Type: INDEX; Schema: public; Owner: blog_database
--

CREATE INDEX blog_categoryarticle_slug_21d3d61d ON public.blog_categoryarticle USING btree (slug);


--
-- Name: blog_categoryarticle_slug_21d3d61d_like; Type: INDEX; Schema: public; Owner: blog_database
--

CREATE INDEX blog_categoryarticle_slug_21d3d61d_like ON public.blog_categoryarticle USING btree (slug varchar_pattern_ops);


--
-- Name: blog_categoryarticle_user_id_c5aa5398; Type: INDEX; Schema: public; Owner: blog_database
--

CREATE INDEX blog_categoryarticle_user_id_c5aa5398 ON public.blog_categoryarticle USING btree (user_id);


--
-- Name: blog_configblog_user_id_8b4fbd4b; Type: INDEX; Schema: public; Owner: blog_database
--

CREATE INDEX blog_configblog_user_id_8b4fbd4b ON public.blog_configblog USING btree (user_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: blog_database
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: blog_database
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: blog_database
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: blog_database
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: userprofile_userprofile_slug_319777db; Type: INDEX; Schema: public; Owner: blog_database
--

CREATE INDEX userprofile_userprofile_slug_319777db ON public.userprofile_userprofile USING btree (slug);


--
-- Name: userprofile_userprofile_slug_319777db_like; Type: INDEX; Schema: public; Owner: blog_database
--

CREATE INDEX userprofile_userprofile_slug_319777db_like ON public.userprofile_userprofile USING btree (slug varchar_pattern_ops);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: blog_database
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: blog_database
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: blog_database
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: blog_database
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: blog_database
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: blog_database
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: blog_database
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: blog_blogarticle blog_blogarticle_category_id_10be0fb4_fk_blog_cate; Type: FK CONSTRAINT; Schema: public; Owner: blog_database
--

ALTER TABLE ONLY public.blog_blogarticle
    ADD CONSTRAINT blog_blogarticle_category_id_10be0fb4_fk_blog_cate FOREIGN KEY (category_id) REFERENCES public.blog_categoryarticle(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: blog_blogarticle_tags blog_blogarticle_tag_blogarticle_id_ca8846c1_fk_blog_blog; Type: FK CONSTRAINT; Schema: public; Owner: blog_database
--

ALTER TABLE ONLY public.blog_blogarticle_tags
    ADD CONSTRAINT blog_blogarticle_tag_blogarticle_id_ca8846c1_fk_blog_blog FOREIGN KEY (blogarticle_id) REFERENCES public.blog_blogarticle(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: blog_blogarticle_tags blog_blogarticle_tags_blogtag_id_72df2fc5_fk_blog_blogtag_id; Type: FK CONSTRAINT; Schema: public; Owner: blog_database
--

ALTER TABLE ONLY public.blog_blogarticle_tags
    ADD CONSTRAINT blog_blogarticle_tags_blogtag_id_72df2fc5_fk_blog_blogtag_id FOREIGN KEY (blogtag_id) REFERENCES public.blog_blogtag(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: blog_blogarticle blog_blogarticle_user_id_49ae3033_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: blog_database
--

ALTER TABLE ONLY public.blog_blogarticle
    ADD CONSTRAINT blog_blogarticle_user_id_49ae3033_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: blog_blogtag blog_blogtag_user_id_5b5b3cd4_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: blog_database
--

ALTER TABLE ONLY public.blog_blogtag
    ADD CONSTRAINT blog_blogtag_user_id_5b5b3cd4_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: blog_categoryarticle blog_categoryarticle_user_id_c5aa5398_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: blog_database
--

ALTER TABLE ONLY public.blog_categoryarticle
    ADD CONSTRAINT blog_categoryarticle_user_id_c5aa5398_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: blog_configblog blog_configblog_user_id_8b4fbd4b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: blog_database
--

ALTER TABLE ONLY public.blog_configblog
    ADD CONSTRAINT blog_configblog_user_id_8b4fbd4b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: blog_database
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: blog_database
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: userprofile_userprofile userprofile_userprofile_user_id_59dda034_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: blog_database
--

ALTER TABLE ONLY public.userprofile_userprofile
    ADD CONSTRAINT userprofile_userprofile_user_id_59dda034_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

\connect postgres

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

-- Dumped from database version 10.3
-- Dumped by pg_dump version 10.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: DATABASE postgres; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- PostgreSQL database dump complete
--

\connect template1

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

-- Dumped from database version 10.3
-- Dumped by pg_dump version 10.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: DATABASE template1; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE template1 IS 'default template for new databases';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--

