--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4
-- Dumped by pg_dump version 17.5 (Homebrew)

-- Started on 2025-08-08 13:38:24 KST

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
--SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 9 (class 2615 OID 18191)
-- Name: public; Type: SCHEMA; Schema: -; Owner: -
--

-- *not* creating schema, since initdb creates it


--
-- TOC entry 6395 (class 0 OID 0)
-- Dependencies: 9
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON SCHEMA public IS '';


--
-- TOC entry 10 (class 2615 OID 17552)
-- Name: topology; Type: SCHEMA; Schema: -; Owner: -
--

--CREATE SCHEMA topology;


--
-- TOC entry 6396 (class 0 OID 0)
-- Dependencies: 10
-- Name: SCHEMA topology; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON SCHEMA topology IS 'PostGIS Topology schema';


--
-- TOC entry 4 (class 3079 OID 25849)
-- Name: pgcrypto; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA public;


--
-- TOC entry 6397 (class 0 OID 0)
-- Dependencies: 4
-- Name: EXTENSION pgcrypto; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';


--
-- TOC entry 2 (class 3079 OID 21004)
-- Name: postgis; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;


--
-- TOC entry 6398 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION postgis; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION postgis IS 'PostGIS geometry and geography spatial types and functions';


--
-- TOC entry 3 (class 3079 OID 22078)
-- Name: postgis_topology; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgis_topology WITH SCHEMA topology;


--
-- TOC entry 6399 (class 0 OID 0)
-- Dependencies: 3
-- Name: EXTENSION postgis_topology; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION postgis_topology IS 'PostGIS topology spatial types and functions';


--
-- TOC entry 5 (class 3079 OID 28114)
-- Name: vector; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS vector WITH SCHEMA public;


--
-- TOC entry 6400 (class 0 OID 0)
-- Dependencies: 5
-- Name: EXTENSION vector; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION vector IS 'vector data type and ivfflat and hnsw access methods';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 297 (class 1259 OID 27500)
-- Name: ab_permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ab_permission (
id integer NOT NULL,
name character varying(100) NOT NULL
);


--
-- TOC entry 296 (class 1259 OID 27499)
-- Name: ab_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.ab_permission_id_seq
AS integer
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


--
-- TOC entry 6401 (class 0 OID 0)
-- Dependencies: 296
-- Name: ab_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.ab_permission_id_seq OWNED BY public.ab_permission.id;


--
-- TOC entry 326 (class 1259 OID 27720)
-- Name: ab_permission_view; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ab_permission_view (
id integer NOT NULL,
permission_id integer,
view_menu_id integer
);


--
-- TOC entry 325 (class 1259 OID 27719)
-- Name: ab_permission_view_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.ab_permission_view_id_seq
AS integer
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


--
-- TOC entry 6402 (class 0 OID 0)
-- Dependencies: 325
-- Name: ab_permission_view_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.ab_permission_view_id_seq OWNED BY public.ab_permission_view.id;


--
-- TOC entry 334 (class 1259 OID 27830)
-- Name: ab_permission_view_role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ab_permission_view_role (
id integer NOT NULL,
permission_view_id integer,
role_id integer
);


--
-- TOC entry 333 (class 1259 OID 27829)
-- Name: ab_permission_view_role_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.ab_permission_view_role_id_seq
AS integer
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


--
-- TOC entry 6403 (class 0 OID 0)
-- Dependencies: 333
-- Name: ab_permission_view_role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.ab_permission_view_role_id_seq OWNED BY public.ab_permission_view_role.id;


--
-- TOC entry 305 (class 1259 OID 27551)
-- Name: ab_register_user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ab_register_user (
id integer NOT NULL,
first_name character varying(256) NOT NULL,
last_name character varying(256) NOT NULL,
username character varying(512) NOT NULL,
password character varying(256),
email character varying(512) NOT NULL,
registration_date timestamp without time zone,
registration_hash character varying(256)
);


--
-- TOC entry 304 (class 1259 OID 27550)
-- Name: ab_register_user_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.ab_register_user_id_seq
AS integer
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


--
-- TOC entry 6404 (class 0 OID 0)
-- Dependencies: 304
-- Name: ab_register_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.ab_register_user_id_seq OWNED BY public.ab_register_user.id;


--
-- TOC entry 301 (class 1259 OID 27518)
-- Name: ab_role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ab_role (
id integer NOT NULL,
name character varying(64) NOT NULL
);


--
-- TOC entry 300 (class 1259 OID 27517)
-- Name: ab_role_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.ab_role_id_seq
AS integer
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


--
-- TOC entry 6405 (class 0 OID 0)
-- Dependencies: 300
-- Name: ab_role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.ab_role_id_seq OWNED BY public.ab_role.id;


--
-- TOC entry 303 (class 1259 OID 27527)
-- Name: ab_user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ab_user (
id integer NOT NULL,
first_name character varying(256) NOT NULL,
last_name character varying(256) NOT NULL,
username character varying(512) NOT NULL,
password character varying(256),
active boolean,
email character varying(512) NOT NULL,
last_login timestamp without time zone,
login_count integer,
fail_login_count integer,
created_on timestamp without time zone,
changed_on timestamp without time zone,
created_by_fk integer,
changed_by_fk integer
);


--
-- TOC entry 302 (class 1259 OID 27526)
-- Name: ab_user_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.ab_user_id_seq
AS integer
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


--
-- TOC entry 6406 (class 0 OID 0)
-- Dependencies: 302
-- Name: ab_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.ab_user_id_seq OWNED BY public.ab_user.id;


--
-- TOC entry 328 (class 1259 OID 27739)
-- Name: ab_user_role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ab_user_role (
id integer NOT NULL,
user_id integer,
role_id integer
);


--
-- TOC entry 327 (class 1259 OID 27738)
-- Name: ab_user_role_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.ab_user_role_id_seq
AS integer
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


--
-- TOC entry 6407 (class 0 OID 0)
-- Dependencies: 327
-- Name: ab_user_role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.ab_user_role_id_seq OWNED BY public.ab_user_role.id;


--
-- TOC entry 299 (class 1259 OID 27509)
-- Name: ab_view_menu; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ab_view_menu (
id integer NOT NULL,
name character varying(250) NOT NULL
);


--
-- TOC entry 298 (class 1259 OID 27508)
-- Name: ab_view_menu_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.ab_view_menu_id_seq
AS integer
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


--
-- TOC entry 6408 (class 0 OID 0)
-- Dependencies: 298
-- Name: ab_view_menu_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.ab_view_menu_id_seq OWNED BY public.ab_view_menu.id;


--
-- TOC entry 257 (class 1259 OID 22344)
-- Name: admins; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.admins (
admin_id bigint NOT NULL,
admin_name character varying(255),
admin_email character varying(255),
admin_password character varying(255),
admin_role character varying(255) NOT NULL
);


--
-- TOC entry 256 (class 1259 OID 22343)
-- Name: admins_admin_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.admins ALTER COLUMN admin_id ADD GENERATED BY DEFAULT AS IDENTITY (
SEQUENCE NAME public.admins_admin_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1
);


--
-- TOC entry 345 (class 1259 OID 27955)
-- Name: alembic_version; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.alembic_version (
version_num character varying(32) NOT NULL
);


--
-- TOC entry 309 (class 1259 OID 27574)
-- Name: callback_request; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.callback_request (
id integer NOT NULL,
created_at timestamp with time zone NOT NULL,
priority_weight integer NOT NULL,
callback_data json NOT NULL,
callback_type character varying(20) NOT NULL,
processor_subdir character varying(2000)
);


--
-- TOC entry 308 (class 1259 OID 27573)
-- Name: callback_request_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.callback_request_id_seq
AS integer
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


--
-- TOC entry 6409 (class 0 OID 0)
-- Dependencies: 308
-- Name: callback_request_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.callback_request_id_seq OWNED BY public.callback_request.id;


--
-- TOC entry 245 (class 1259 OID 22298)
-- Name: commoncode; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.commoncode (
groupcode_id character varying NOT NULL,
coomoncode_id character varying NOT NULL,
code_desc character varying
);


--
-- TOC entry 307 (class 1259 OID 27563)
-- Name: connection; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.connection (
id integer NOT NULL,
conn_id character varying(250) NOT NULL,
conn_type character varying(500) NOT NULL,
description text,
host character varying(500),
schema character varying(500),
login text,
password text,
port integer,
is_encrypted boolean,
is_extra_encrypted boolean,
extra text
);


--
-- TOC entry 306 (class 1259 OID 27562)
-- Name: connection_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.connection_id_seq
AS integer
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


--
-- TOC entry 6410 (class 0 OID 0)
-- Dependencies: 306
-- Name: connection_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.connection_id_seq OWNED BY public.connection.id;


--
-- TOC entry 253 (class 1259 OID 22328)
-- Name: coupon_templates; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.coupon_templates (
coupon_template_id bigint NOT NULL,
discount_policy_detail_id bigint,
coupon_name character varying(255),
remaining_quantity integer,
coupon_start timestamp(6) without time zone,
coupon_end timestamp(6) without time zone,
discount_code character varying(255),
membership_code character varying(255),
marker_code character varying(255),
is_deleted boolean DEFAULT false,
unear_event_id bigint
);


--
-- TOC entry 252 (class 1259 OID 22327)
-- Name: coupon_templates_coupon_templates_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.coupon_templates ALTER COLUMN coupon_template_id ADD GENERATED BY DEFAULT AS IDENTITY (
SEQUENCE NAME public.coupon_templates_coupon_templates_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1
);


--
-- TOC entry 295 (class 1259 OID 27489)
-- Name: dag; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.dag (
dag_id character varying(250) NOT NULL,
root_dag_id character varying(250),
is_paused boolean,
is_subdag boolean,
is_active boolean,
last_parsed_time timestamp with time zone,
last_pickled timestamp with time zone,
last_expired timestamp with time zone,
scheduler_lock boolean,
pickle_id integer,
fileloc character varying(2000),
processor_subdir character varying(2000),
owners character varying(2000),
dag_display_name character varying(2000),
description text,
default_view character varying(25),
schedule_interval text,
timetable_description character varying(1000),
dataset_expression json,
max_active_tasks integer NOT NULL,
max_active_runs integer,
max_consecutive_failed_dag_runs integer NOT NULL,
has_task_concurrency_limits boolean NOT NULL,
has_import_errors boolean DEFAULT false,
next_dagrun timestamp with time zone,
next_dagrun_data_interval_start timestamp with time zone,
next_dagrun_data_interval_end timestamp with time zone,
next_dagrun_create_after timestamp with time zone
);


--
-- TOC entry 292 (class 1259 OID 27473)
-- Name: dag_code; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.dag_code (
fileloc_hash bigint NOT NULL,
fileloc character varying(2000) NOT NULL,
last_updated timestamp with time zone NOT NULL,
source_code text NOT NULL
);


--
-- TOC entry 324 (class 1259 OID 27707)
-- Name: dag_owner_attributes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.dag_owner_attributes (
dag_id character varying(250) NOT NULL,
owner character varying(500) NOT NULL,
link character varying(500) NOT NULL
);


--
-- TOC entry 294 (class 1259 OID 27481)
-- Name: dag_pickle; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.dag_pickle (
id integer NOT NULL,
pickle bytea,
created_dttm timestamp with time zone,
pickle_hash bigint
);


--
-- TOC entry 293 (class 1259 OID 27480)
-- Name: dag_pickle_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.dag_pickle_id_seq
AS integer
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


--
-- TOC entry 6411 (class 0 OID 0)
-- Dependencies: 293
-- Name: dag_pickle_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.dag_pickle_id_seq OWNED BY public.dag_pickle.id;


--
-- TOC entry 322 (class 1259 OID 27675)
-- Name: dag_run; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.dag_run (
id integer NOT NULL,
dag_id character varying(250) NOT NULL,
queued_at timestamp with time zone,
execution_date timestamp with time zone NOT NULL,
start_date timestamp with time zone,
end_date timestamp with time zone,
state character varying(50),
run_id character varying(250) NOT NULL,
creating_job_id integer,
external_trigger boolean,
run_type character varying(50) NOT NULL,
conf bytea,
data_interval_start timestamp with time zone,
data_interval_end timestamp with time zone,
last_scheduling_decision timestamp with time zone,
dag_hash character varying(32),
log_template_id integer,
updated_at timestamp with time zone,
clear_number integer NOT NULL
);


--
-- TOC entry 321 (class 1259 OID 27674)
-- Name: dag_run_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.dag_run_id_seq
AS integer
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


--
-- TOC entry 6412 (class 0 OID 0)
-- Dependencies: 321
-- Name: dag_run_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.dag_run_id_seq OWNED BY public.dag_run.id;


--
-- TOC entry 332 (class 1259 OID 27812)
-- Name: dag_run_note; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.dag_run_note (
user_id integer,
dag_run_id integer NOT NULL,
content character varying(1000),
created_at timestamp with time zone NOT NULL,
updated_at timestamp with time zone NOT NULL
);


--
-- TOC entry 318 (class 1259 OID 27627)
-- Name: dag_schedule_dataset_reference; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.dag_schedule_dataset_reference (
dataset_id integer NOT NULL,
dag_id character varying(250) NOT NULL,
created_at timestamp with time zone NOT NULL,
updated_at timestamp with time zone NOT NULL
);


--
-- TOC entry 323 (class 1259 OID 27697)
-- Name: dag_tag; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.dag_tag (
name character varying(100) NOT NULL,
dag_id character varying(250) NOT NULL
);


--
-- TOC entry 329 (class 1259 OID 27757)
-- Name: dag_warning; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.dag_warning (
dag_id character varying(250) NOT NULL,
warning_type character varying(50) NOT NULL,
message text NOT NULL,
"timestamp" timestamp with time zone NOT NULL
);


--
-- TOC entry 330 (class 1259 OID 27769)
-- Name: dagrun_dataset_event; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.dagrun_dataset_event (
dag_run_id integer NOT NULL,
event_id integer NOT NULL
);


--
-- TOC entry 281 (class 1259 OID 27408)
-- Name: dataset; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.dataset (
id integer NOT NULL,
uri character varying(3000) NOT NULL,
extra json NOT NULL,
created_at timestamp with time zone NOT NULL,
updated_at timestamp with time zone NOT NULL,
is_orphaned boolean DEFAULT false NOT NULL
);


--
-- TOC entry 320 (class 1259 OID 27659)
-- Name: dataset_dag_run_queue; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.dataset_dag_run_queue (
dataset_id integer NOT NULL,
target_dag_id character varying(250) NOT NULL,
created_at timestamp with time zone NOT NULL
);


--
-- TOC entry 283 (class 1259 OID 27419)
-- Name: dataset_event; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.dataset_event (
id integer NOT NULL,
dataset_id integer NOT NULL,
extra json NOT NULL,
source_task_id character varying(250),
source_dag_id character varying(250),
source_run_id character varying(250),
source_map_index integer DEFAULT '-1'::integer,
"timestamp" timestamp with time zone NOT NULL
);


--
-- TOC entry 282 (class 1259 OID 27418)
-- Name: dataset_event_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.dataset_event_id_seq
AS integer
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


--
-- TOC entry 6413 (class 0 OID 0)
-- Dependencies: 282
-- Name: dataset_event_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.dataset_event_id_seq OWNED BY public.dataset_event.id;


--
-- TOC entry 280 (class 1259 OID 27407)
-- Name: dataset_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.dataset_id_seq
AS integer
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


--
-- TOC entry 6414 (class 0 OID 0)
-- Dependencies: 280
-- Name: dataset_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.dataset_id_seq OWNED BY public.dataset.id;


--
-- TOC entry 234 (class 1259 OID 22253)
-- Name: general_discount_policy; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.general_discount_policy (
general_discount_policy_id bigint NOT NULL,
place_id bigint NOT NULL,
unit_base_amount integer,
fixed_discount integer,
discount_percent integer,
min_purchase_amount integer,
max_discount_amount integer,
discount_code character varying(255),
membership_code character varying(255),
marker_code character varying(255)
);


--
-- TOC entry 233 (class 1259 OID 22252)
-- Name: discount_policy_detail_discount_policy_detail_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.general_discount_policy ALTER COLUMN general_discount_policy_id ADD GENERATED BY DEFAULT AS IDENTITY (
SEQUENCE NAME public.discount_policy_detail_discount_policy_detail_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1
);


--
-- TOC entry 265 (class 1259 OID 22372)
-- Name: event_places; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.event_places (
event_place_id bigint NOT NULL,
unear_event_id bigint NOT NULL,
place_id bigint NOT NULL,
event_code character varying(255)
);


--
-- TOC entry 264 (class 1259 OID 22371)
-- Name: event_places_event_places_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.event_places ALTER COLUMN event_place_id ADD GENERATED BY DEFAULT AS IDENTITY (
SEQUENCE NAME public.event_places_event_places_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1
);


--
-- TOC entry 261 (class 1259 OID 22360)
-- Name: favorite_places; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.favorite_places (
favorite_place_id bigint NOT NULL,
place_id bigint NOT NULL,
user_id bigint NOT NULL,
created_at timestamp(6) without time zone,
deleted_at timestamp(6) without time zone,
is_favorited boolean
);


--
-- TOC entry 260 (class 1259 OID 22359)
-- Name: favorite_places_favorite_places_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.favorite_places ALTER COLUMN favorite_place_id ADD GENERATED BY DEFAULT AS IDENTITY (
SEQUENCE NAME public.favorite_places_favorite_places_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1
);


--
-- TOC entry 259 (class 1259 OID 22352)
-- Name: franchise_discount_policy; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.franchise_discount_policy (
franchise_id bigint NOT NULL,
membership_code character varying(255),
discount_code character varying(255),
unit_base_amount integer,
fixed_discount integer,
discount_percent integer,
min_purchase_amount integer,
max_discount_amount integer,
franchise_discount_policy_id bigint NOT NULL
);


--
-- TOC entry 268 (class 1259 OID 22890)
-- Name: franchise_discount_policy_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.franchise_discount_policy_id_seq
AS integer
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


--
-- TOC entry 6415 (class 0 OID 0)
-- Dependencies: 268
-- Name: franchise_discount_policy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.franchise_discount_policy_id_seq OWNED BY public.franchise_discount_policy.franchise_discount_policy_id;


--
-- TOC entry 258 (class 1259 OID 22351)
-- Name: franchise_franchise_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.franchise_discount_policy ALTER COLUMN franchise_id ADD GENERATED BY DEFAULT AS IDENTITY (
SEQUENCE NAME public.franchise_franchise_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1
);


--
-- TOC entry 267 (class 1259 OID 22834)
-- Name: franchises; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.franchises (
franchise_id bigint NOT NULL,
name character varying(255) NOT NULL,
category_code character varying(255) NOT NULL,
image_url character varying(255),
description text
);


--
-- TOC entry 266 (class 1259 OID 22833)
-- Name: franchises_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.franchises_id_seq
AS integer
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


--
-- TOC entry 6416 (class 0 OID 0)
-- Dependencies: 266
-- Name: franchises_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.franchises_id_seq OWNED BY public.franchises.franchise_id;


--
-- TOC entry 277 (class 1259 OID 26928)
-- Name: hashtags_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.hashtags_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


--
-- TOC entry 275 (class 1259 OID 26916)
-- Name: hashtags; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.hashtags (
hashtag_id bigint DEFAULT nextval('public.hashtags_seq'::regclass) NOT NULL,
name character varying(100)
);


--
-- TOC entry 311 (class 1259 OID 27583)
-- Name: import_error; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.import_error (
id integer NOT NULL,
"timestamp" timestamp with time zone,
filename character varying(1024),
stacktrace text,
processor_subdir character varying(2000)
);


--
-- TOC entry 310 (class 1259 OID 27582)
-- Name: import_error_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.import_error_id_seq
AS integer
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


--
-- TOC entry 6417 (class 0 OID 0)
-- Dependencies: 310
-- Name: import_error_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.import_error_id_seq OWNED BY public.import_error.id;


--
-- TOC entry 285 (class 1259 OID 27430)
-- Name: job; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.job (
id integer NOT NULL,
dag_id character varying(250),
state character varying(20),
job_type character varying(30),
start_date timestamp with time zone,
end_date timestamp with time zone,
latest_heartbeat timestamp with time zone,
executor_class character varying(500),
hostname character varying(500),
unixname character varying(1000)
);


--
-- TOC entry 284 (class 1259 OID 27429)
-- Name: job_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.job_id_seq
AS integer
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


--
-- TOC entry 6418 (class 0 OID 0)
-- Dependencies: 284
-- Name: job_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.job_id_seq OWNED BY public.job.id;


--
-- TOC entry 289 (class 1259 OID 27453)
-- Name: log; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.log (
id integer NOT NULL,
dttm timestamp with time zone,
dag_id character varying(250),
task_id character varying(250),
map_index integer,
event character varying(60),
execution_date timestamp with time zone,
run_id character varying(250),
owner character varying(500),
owner_display_name character varying(500),
extra text
);


--
-- TOC entry 288 (class 1259 OID 27452)
-- Name: log_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.log_id_seq
AS integer
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


--
-- TOC entry 6419 (class 0 OID 0)
-- Dependencies: 288
-- Name: log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.log_id_seq OWNED BY public.log.id;


--
-- TOC entry 291 (class 1259 OID 27465)
-- Name: log_template; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.log_template (
id integer NOT NULL,
filename text NOT NULL,
elasticsearch_id text NOT NULL,
created_at timestamp with time zone NOT NULL
);


--
-- TOC entry 290 (class 1259 OID 27464)
-- Name: log_template_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.log_template_id_seq
AS integer
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


--
-- TOC entry 6420 (class 0 OID 0)
-- Dependencies: 290
-- Name: log_template_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.log_template_id_seq OWNED BY public.log_template.id;


--
-- TOC entry 270 (class 1259 OID 25928)
-- Name: owners; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.owners (
owner_id bigint NOT NULL,
owner_name character varying(255),
owner_password character varying(255),
pos_id bigint
);


--
-- TOC entry 269 (class 1259 OID 25927)
-- Name: owners_owner_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.owners_owner_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


--
-- TOC entry 6421 (class 0 OID 0)
-- Dependencies: 269
-- Name: owners_owner_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.owners_owner_id_seq OWNED BY public.owners.owner_id;


--
-- TOC entry 278 (class 1259 OID 26930)
-- Name: payment_type_tags_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.payment_type_tags_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


--
-- TOC entry 276 (class 1259 OID 26921)
-- Name: payment_type_tags; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.payment_type_tags (
payment_type_tag_id bigint DEFAULT nextval('public.payment_type_tags_seq'::regclass) NOT NULL,
name character varying(100),
description text
);


--
-- TOC entry 346 (class 1259 OID 28542)
-- Name: place_embeddings; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.place_embeddings (
place_id integer NOT NULL,
embedding public.vector(1536),
created_at timestamp without time zone DEFAULT now()
);


--
-- TOC entry 251 (class 1259 OID 22320)
-- Name: places; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.places (
place_id bigint NOT NULL,
franchise_id bigint,
place_name character varying(255),
place_desc character varying(255),
address character varying(255),
latitude numeric(10,7),
longitude numeric(10,7),
marker_code character varying(255),
event_type_code character varying(255),
category_code character varying(255),
start_time integer,
end_time integer,
benefit_category character varying(255),
tel character varying(255),
location public.geography(Point,4326),
is_deleted boolean DEFAULT false
);


--
-- TOC entry 250 (class 1259 OID 22319)
-- Name: places_places_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.places ALTER COLUMN place_id ADD GENERATED BY DEFAULT AS IDENTITY (
SEQUENCE NAME public.places_places_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1
);


--
-- TOC entry 244 (class 1259 OID 22293)
-- Name: pos; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.pos (
pos_id bigint NOT NULL,
place_id bigint NOT NULL
);


--
-- TOC entry 263 (class 1259 OID 22366)
-- Name: pos_histories; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.pos_histories (
pos_history_id bigint NOT NULL,
pos_id bigint NOT NULL,
user_history_id bigint NOT NULL
);


--
-- TOC entry 262 (class 1259 OID 22365)
-- Name: pos_histories_pos_histories_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.pos_histories ALTER COLUMN pos_history_id ADD GENERATED BY DEFAULT AS IDENTITY (
SEQUENCE NAME public.pos_histories_pos_histories_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1
);


--
-- TOC entry 243 (class 1259 OID 22292)
-- Name: pos_pos_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.pos ALTER COLUMN pos_id ADD GENERATED BY DEFAULT AS IDENTITY (
SEQUENCE NAME public.pos_pos_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1
);


--
-- TOC entry 342 (class 1259 OID 27931)
-- Name: rendered_task_instance_fields; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.rendered_task_instance_fields (
dag_id character varying(250) NOT NULL,
task_id character varying(250) NOT NULL,
run_id character varying(250) NOT NULL,
map_index integer DEFAULT '-1'::integer NOT NULL,
rendered_fields json NOT NULL,
k8s_pod_yaml json
);


--
-- TOC entry 249 (class 1259 OID 22312)
-- Name: roulette_results; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.roulette_results (
roulette_result_id bigint NOT NULL,
unear_event_id bigint NOT NULL,
user_id bigint NOT NULL,
reward character varying(255),
participated boolean
);


--
-- TOC entry 248 (class 1259 OID 22311)
-- Name: roulette_results_roulette_results_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.roulette_results ALTER COLUMN roulette_result_id ADD GENERATED BY DEFAULT AS IDENTITY (
SEQUENCE NAME public.roulette_results_roulette_results_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1
);


--
-- TOC entry 317 (class 1259 OID 27619)
-- Name: serialized_dag; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.serialized_dag (
dag_id character varying(250) NOT NULL,
fileloc character varying(2000) NOT NULL,
fileloc_hash bigint NOT NULL,
data json,
data_compressed bytea,
last_updated timestamp with time zone NOT NULL,
dag_hash character varying(32) NOT NULL,
processor_subdir character varying(2000)
);


--
-- TOC entry 344 (class 1259 OID 27945)
-- Name: session; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.session (
id integer NOT NULL,
session_id character varying(255),
data bytea,
expiry timestamp without time zone
);


--
-- TOC entry 343 (class 1259 OID 27944)
-- Name: session_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.session_id_seq
AS integer
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


--
-- TOC entry 6422 (class 0 OID 0)
-- Dependencies: 343
-- Name: session_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.session_id_seq OWNED BY public.session.id;


--
-- TOC entry 312 (class 1259 OID 27591)
-- Name: sla_miss; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sla_miss (
task_id character varying(250) NOT NULL,
dag_id character varying(250) NOT NULL,
execution_date timestamp with time zone NOT NULL,
email_sent boolean,
"timestamp" timestamp with time zone,
description text,
notification_sent boolean
);


--
-- TOC entry 287 (class 1259 OID 27442)
-- Name: slot_pool; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.slot_pool (
id integer NOT NULL,
pool character varying(256),
slots integer,
description text,
include_deferred boolean NOT NULL
);


--
-- TOC entry 286 (class 1259 OID 27441)
-- Name: slot_pool_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.slot_pool_id_seq
AS integer
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


--
-- TOC entry 6423 (class 0 OID 0)
-- Dependencies: 286
-- Name: slot_pool_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.slot_pool_id_seq OWNED BY public.slot_pool.id;


--
-- TOC entry 247 (class 1259 OID 22304)
-- Name: stamps; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.stamps (
stamp_id bigint NOT NULL,
user_id bigint NOT NULL,
event_place_id bigint NOT NULL,
stamped_at timestamp(6) without time zone,
event_code character varying(255),
place_name character varying(255),
unear_event_id bigint
);


--
-- TOC entry 246 (class 1259 OID 22303)
-- Name: stamps_stamps_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.stamps ALTER COLUMN stamp_id ADD GENERATED BY DEFAULT AS IDENTITY (
SEQUENCE NAME public.stamps_stamps_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1
);


--
-- TOC entry 236 (class 1259 OID 22261)
-- Name: store_owners; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.store_owners (
owner_id bigint NOT NULL,
pos_id bigint NOT NULL,
owner_name character varying,
owner_password character varying
);


--
-- TOC entry 235 (class 1259 OID 22260)
-- Name: store_owners_owner_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.store_owners ALTER COLUMN owner_id ADD GENERATED BY DEFAULT AS IDENTITY (
SEQUENCE NAME public.store_owners_owner_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1
);


--
-- TOC entry 350 (class 1259 OID 30598)
-- Name: story_representative_log; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.story_representative_log (
id bigint NOT NULL,
story_summary_id bigint NOT NULL,
date date NOT NULL,
store_name text NOT NULL,
amount integer NOT NULL,
logo_url text
);


--
-- TOC entry 349 (class 1259 OID 30597)
-- Name: story_representative_log_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.story_representative_log_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


--
-- TOC entry 6424 (class 0 OID 0)
-- Dependencies: 349
-- Name: story_representative_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.story_representative_log_id_seq OWNED BY public.story_representative_log.id;


--
-- TOC entry 348 (class 1259 OID 30587)
-- Name: story_summary; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.story_summary (
id bigint NOT NULL,
user_id bigint NOT NULL,
target_month character varying(7) NOT NULL,
comment text,
image_url text,
created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- TOC entry 347 (class 1259 OID 30586)
-- Name: story_summary_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.story_summary_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


--
-- TOC entry 6425 (class 0 OID 0)
-- Dependencies: 347
-- Name: story_summary_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.story_summary_id_seq OWNED BY public.story_summary.id;


--
-- TOC entry 336 (class 1259 OID 27849)
-- Name: task_fail; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.task_fail (
id integer NOT NULL,
task_id character varying(250) NOT NULL,
dag_id character varying(250) NOT NULL,
run_id character varying(250) NOT NULL,
map_index integer DEFAULT '-1'::integer NOT NULL,
start_date timestamp with time zone,
end_date timestamp with time zone,
duration integer
);


--
-- TOC entry 335 (class 1259 OID 27848)
-- Name: task_fail_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.task_fail_id_seq
AS integer
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


--
-- TOC entry 6426 (class 0 OID 0)
-- Dependencies: 335
-- Name: task_fail_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.task_fail_id_seq OWNED BY public.task_fail.id;


--
-- TOC entry 331 (class 1259 OID 27786)
-- Name: task_instance; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.task_instance (
task_id character varying(250) NOT NULL,
dag_id character varying(250) NOT NULL,
run_id character varying(250) NOT NULL,
map_index integer DEFAULT '-1'::integer NOT NULL,
start_date timestamp with time zone,
end_date timestamp with time zone,
duration double precision,
state character varying(20),
try_number integer,
max_tries integer DEFAULT '-1'::integer,
hostname character varying(1000),
unixname character varying(1000),
job_id integer,
pool character varying(256) NOT NULL,
pool_slots integer NOT NULL,
queue character varying(256),
priority_weight integer,
operator character varying(1000),
custom_operator_name character varying(1000),
queued_dttm timestamp with time zone,
queued_by_job_id integer,
pid integer,
executor_config bytea,
updated_at timestamp with time zone,
rendered_map_index character varying(250),
external_executor_id character varying(250),
trigger_id integer,
trigger_timeout timestamp without time zone,
next_method character varying(1000),
next_kwargs json,
task_display_name character varying(2000)
);


--
-- TOC entry 341 (class 1259 OID 27914)
-- Name: task_instance_note; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.task_instance_note (
user_id integer,
task_id character varying(250) NOT NULL,
dag_id character varying(250) NOT NULL,
run_id character varying(250) NOT NULL,
map_index integer NOT NULL,
content character varying(1000),
created_at timestamp with time zone NOT NULL,
updated_at timestamp with time zone NOT NULL
);


--
-- TOC entry 337 (class 1259 OID 27864)
-- Name: task_map; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.task_map (
dag_id character varying(250) NOT NULL,
task_id character varying(250) NOT NULL,
run_id character varying(250) NOT NULL,
map_index integer NOT NULL,
length integer NOT NULL,
keys json,
CONSTRAINT ck_task_map_task_map_length_not_negative CHECK ((length >= 0))
);


--
-- TOC entry 319 (class 1259 OID 27642)
-- Name: task_outlet_dataset_reference; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.task_outlet_dataset_reference (
dataset_id integer NOT NULL,
dag_id character varying(250) NOT NULL,
task_id character varying(250) NOT NULL,
created_at timestamp with time zone NOT NULL,
updated_at timestamp with time zone NOT NULL
);


--
-- TOC entry 339 (class 1259 OID 27878)
-- Name: task_reschedule; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.task_reschedule (
id integer NOT NULL,
task_id character varying(250) NOT NULL,
dag_id character varying(250) NOT NULL,
run_id character varying(250) NOT NULL,
map_index integer DEFAULT '-1'::integer NOT NULL,
try_number integer NOT NULL,
start_date timestamp with time zone NOT NULL,
end_date timestamp with time zone NOT NULL,
duration integer NOT NULL,
reschedule_date timestamp with time zone NOT NULL
);


--
-- TOC entry 338 (class 1259 OID 27877)
-- Name: task_reschedule_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.task_reschedule_id_seq
AS integer
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


--
-- TOC entry 6427 (class 0 OID 0)
-- Dependencies: 338
-- Name: task_reschedule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.task_reschedule_id_seq OWNED BY public.task_reschedule.id;


--
-- TOC entry 314 (class 1259 OID 27600)
-- Name: trigger; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.trigger (
id integer NOT NULL,
classpath character varying(1000) NOT NULL,
kwargs text NOT NULL,
created_date timestamp with time zone NOT NULL,
triggerer_id integer
);


--
-- TOC entry 313 (class 1259 OID 27599)
-- Name: trigger_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.trigger_id_seq
AS integer
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


--
-- TOC entry 6428 (class 0 OID 0)
-- Dependencies: 313
-- Name: trigger_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.trigger_id_seq OWNED BY public.trigger.id;


--
-- TOC entry 242 (class 1259 OID 22285)
-- Name: unear_events; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.unear_events (
unear_event_id bigint NOT NULL,
coupon_template_id bigint,
event_name character varying(255),
event_description character varying(255),
latitude numeric(10,7),
longitude numeric(10,7),
radius_meter integer,
start_at date,
end_at date,
popup_store_id bigint,
is_active boolean DEFAULT false
);


--
-- TOC entry 241 (class 1259 OID 22284)
-- Name: unear_events_unear_events_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.unear_events ALTER COLUMN unear_event_id ADD GENERATED BY DEFAULT AS IDENTITY (
SEQUENCE NAME public.unear_events_unear_events_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1
);


--
-- TOC entry 273 (class 1259 OID 25959)
-- Name: user_action_logs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.user_action_logs_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


--
-- TOC entry 271 (class 1259 OID 25936)
-- Name: user_action_logs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.user_action_logs (
user_action_log_id bigint DEFAULT nextval('public.user_action_logs_id_seq'::regclass) NOT NULL,
user_id bigint,
action_type character varying(255),
create_at timestamp(6) without time zone,
screen character varying(255),
metadata text
);


--
-- TOC entry 272 (class 1259 OID 25944)
-- Name: user_action_summary; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.user_action_summary (
action_type character varying(50),
group_by_field character varying(50),
group_by_text character varying(100),
distinct_user_count integer,
count integer,
summary_date date,
id bigint NOT NULL
);


--
-- TOC entry 274 (class 1259 OID 26040)
-- Name: user_action_summary_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.user_action_summary_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


--
-- TOC entry 6429 (class 0 OID 0)
-- Dependencies: 274
-- Name: user_action_summary_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.user_action_summary_id_seq OWNED BY public.user_action_summary.id;


--
-- TOC entry 255 (class 1259 OID 22336)
-- Name: user_coupons; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.user_coupons (
user_coupon_id bigint NOT NULL,
user_id bigint NOT NULL,
coupon_template_id bigint NOT NULL,
coupon_status_code character varying(255),
barcode_number character varying(255),
created_at timestamp(6) without time zone,
used_at timestamp(6) without time zone
);


--
-- TOC entry 254 (class 1259 OID 22335)
-- Name: user_coupons_user_coupons_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.user_coupons ALTER COLUMN user_coupon_id ADD GENERATED BY DEFAULT AS IDENTITY (
SEQUENCE NAME public.user_coupons_user_coupons_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1
);


--
-- TOC entry 238 (class 1259 OID 22269)
-- Name: user_histories; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.user_histories (
user_history_id bigint NOT NULL,
user_id bigint NOT NULL,
user_coupon_id bigint,
place_id bigint NOT NULL,
used_at timestamp without time zone,
original_amount integer,
membership_discount_amount integer,
coupon_discount_amount integer,
total_discount_amount integer,
total_payment_amount integer,
is_coupon_used boolean,
is_membership_used boolean,
paid_at timestamp without time zone,
discount_code character varying,
membership_code character varying,
place_category character varying
);


--
-- TOC entry 237 (class 1259 OID 22268)
-- Name: user_histories_user_histories_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.user_histories ALTER COLUMN user_history_id ADD GENERATED BY DEFAULT AS IDENTITY (
SEQUENCE NAME public.user_histories_user_histories_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1
);


--
-- TOC entry 279 (class 1259 OID 27272)
-- Name: user_recommendation_profile; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.user_recommendation_profile (
user_id bigint NOT NULL,
age_group character varying(10),
gender character varying(10),
vector_similarity double precision,
payment_type_tag character varying(100),
hashtag character varying(100),
recommend_message character varying(256),
created_at date,
updated_at date,
user_embedding public.vector(1536),
id bigint NOT NULL
);


--
-- TOC entry 351 (class 1259 OID 30614)
-- Name: user_recommendation_profile_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.user_recommendation_profile_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


--
-- TOC entry 6430 (class 0 OID 0)
-- Dependencies: 351
-- Name: user_recommendation_profile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.user_recommendation_profile_id_seq OWNED BY public.user_recommendation_profile.id;


--
-- TOC entry 240 (class 1259 OID 22277)
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
user_id bigint NOT NULL,
name character varying(255),
email character varying(255),
tel character varying(255),
password character varying(255),
birthdate timestamp(6) without time zone,
membership_code character varying(255),
gender character varying(255),
created_at timestamp(6) without time zone,
updated_at timestamp(6) without time zone,
is_profile_complete boolean,
barcode_number character varying(255),
provider character varying(20) DEFAULT 'EMAIL'::character varying NOT NULL,
provider_id character varying(255)
);


--
-- TOC entry 239 (class 1259 OID 22276)
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.users ALTER COLUMN user_id ADD GENERATED BY DEFAULT AS IDENTITY (
SEQUENCE NAME public.users_user_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1
);


--
-- TOC entry 316 (class 1259 OID 27609)
-- Name: variable; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.variable (
id integer NOT NULL,
key character varying(250),
val text,
description text,
is_encrypted boolean
);


--
-- TOC entry 315 (class 1259 OID 27608)
-- Name: variable_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.variable_id_seq
AS integer
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


--
-- TOC entry 6431 (class 0 OID 0)
-- Dependencies: 315
-- Name: variable_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.variable_id_seq OWNED BY public.variable.id;


--
-- TOC entry 340 (class 1259 OID 27899)
-- Name: xcom; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.xcom (
dag_run_id integer NOT NULL,
task_id character varying(250) NOT NULL,
map_index integer DEFAULT '-1'::integer NOT NULL,
key character varying(512) NOT NULL,
dag_id character varying(250) NOT NULL,
run_id character varying(250) NOT NULL,
value bytea,
"timestamp" timestamp with time zone NOT NULL
);


--
-- TOC entry 5813 (class 2604 OID 27503)
-- Name: ab_permission id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ab_permission ALTER COLUMN id SET DEFAULT nextval('public.ab_permission_id_seq'::regclass);


--
-- TOC entry 5824 (class 2604 OID 27723)
-- Name: ab_permission_view id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ab_permission_view ALTER COLUMN id SET DEFAULT nextval('public.ab_permission_view_id_seq'::regclass);


--
-- TOC entry 5828 (class 2604 OID 27833)
-- Name: ab_permission_view_role id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ab_permission_view_role ALTER COLUMN id SET DEFAULT nextval('public.ab_permission_view_role_id_seq'::regclass);


--
-- TOC entry 5817 (class 2604 OID 27554)
-- Name: ab_register_user id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ab_register_user ALTER COLUMN id SET DEFAULT nextval('public.ab_register_user_id_seq'::regclass);


--
-- TOC entry 5815 (class 2604 OID 27521)
-- Name: ab_role id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ab_role ALTER COLUMN id SET DEFAULT nextval('public.ab_role_id_seq'::regclass);


--
-- TOC entry 5816 (class 2604 OID 27530)
-- Name: ab_user id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ab_user ALTER COLUMN id SET DEFAULT nextval('public.ab_user_id_seq'::regclass);


--
-- TOC entry 5825 (class 2604 OID 27742)
-- Name: ab_user_role id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ab_user_role ALTER COLUMN id SET DEFAULT nextval('public.ab_user_role_id_seq'::regclass);


--
-- TOC entry 5814 (class 2604 OID 27512)
-- Name: ab_view_menu id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ab_view_menu ALTER COLUMN id SET DEFAULT nextval('public.ab_view_menu_id_seq'::regclass);


--
-- TOC entry 5819 (class 2604 OID 27577)
-- Name: callback_request id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.callback_request ALTER COLUMN id SET DEFAULT nextval('public.callback_request_id_seq'::regclass);


--
-- TOC entry 5818 (class 2604 OID 27566)
-- Name: connection id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.connection ALTER COLUMN id SET DEFAULT nextval('public.connection_id_seq'::regclass);


--
-- TOC entry 5811 (class 2604 OID 27484)
-- Name: dag_pickle id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dag_pickle ALTER COLUMN id SET DEFAULT nextval('public.dag_pickle_id_seq'::regclass);


--
-- TOC entry 5823 (class 2604 OID 27678)
-- Name: dag_run id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dag_run ALTER COLUMN id SET DEFAULT nextval('public.dag_run_id_seq'::regclass);


--
-- TOC entry 5803 (class 2604 OID 27411)
-- Name: dataset id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dataset ALTER COLUMN id SET DEFAULT nextval('public.dataset_id_seq'::regclass);


--
-- TOC entry 5805 (class 2604 OID 27422)
-- Name: dataset_event id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dataset_event ALTER COLUMN id SET DEFAULT nextval('public.dataset_event_id_seq'::regclass);


--
-- TOC entry 5795 (class 2604 OID 22983)
-- Name: franchise_discount_policy franchise_discount_policy_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.franchise_discount_policy ALTER COLUMN franchise_discount_policy_id SET DEFAULT nextval('public.franchise_discount_policy_id_seq'::regclass);


--
-- TOC entry 5796 (class 2604 OID 23086)
-- Name: franchises franchise_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.franchises ALTER COLUMN franchise_id SET DEFAULT nextval('public.franchises_id_seq'::regclass);


--
-- TOC entry 5820 (class 2604 OID 27586)
-- Name: import_error id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.import_error ALTER COLUMN id SET DEFAULT nextval('public.import_error_id_seq'::regclass);


--
-- TOC entry 5807 (class 2604 OID 27433)
-- Name: job id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.job ALTER COLUMN id SET DEFAULT nextval('public.job_id_seq'::regclass);


--
-- TOC entry 5809 (class 2604 OID 27456)
-- Name: log id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.log ALTER COLUMN id SET DEFAULT nextval('public.log_id_seq'::regclass);


--
-- TOC entry 5810 (class 2604 OID 27468)
-- Name: log_template id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.log_template ALTER COLUMN id SET DEFAULT nextval('public.log_template_id_seq'::regclass);


--
-- TOC entry 5797 (class 2604 OID 25931)
-- Name: owners owner_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.owners ALTER COLUMN owner_id SET DEFAULT nextval('public.owners_owner_id_seq'::regclass);


--
-- TOC entry 5835 (class 2604 OID 27948)
-- Name: session id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.session ALTER COLUMN id SET DEFAULT nextval('public.session_id_seq'::regclass);


--
-- TOC entry 5808 (class 2604 OID 27445)
-- Name: slot_pool id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.slot_pool ALTER COLUMN id SET DEFAULT nextval('public.slot_pool_id_seq'::regclass);


--
-- TOC entry 5840 (class 2604 OID 30601)
-- Name: story_representative_log id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.story_representative_log ALTER COLUMN id SET DEFAULT nextval('public.story_representative_log_id_seq'::regclass);


--
-- TOC entry 5837 (class 2604 OID 30590)
-- Name: story_summary id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.story_summary ALTER COLUMN id SET DEFAULT nextval('public.story_summary_id_seq'::regclass);


--
-- TOC entry 5829 (class 2604 OID 27852)
-- Name: task_fail id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.task_fail ALTER COLUMN id SET DEFAULT nextval('public.task_fail_id_seq'::regclass);


--
-- TOC entry 5831 (class 2604 OID 27881)
-- Name: task_reschedule id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.task_reschedule ALTER COLUMN id SET DEFAULT nextval('public.task_reschedule_id_seq'::regclass);


--
-- TOC entry 5821 (class 2604 OID 27603)
-- Name: trigger id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trigger ALTER COLUMN id SET DEFAULT nextval('public.trigger_id_seq'::regclass);


--
-- TOC entry 5799 (class 2604 OID 26041)
-- Name: user_action_summary id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_action_summary ALTER COLUMN id SET DEFAULT nextval('public.user_action_summary_id_seq'::regclass);


--
-- TOC entry 5802 (class 2604 OID 30615)
-- Name: user_recommendation_profile id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_recommendation_profile ALTER COLUMN id SET DEFAULT nextval('public.user_recommendation_profile_id_seq'::regclass);


--
-- TOC entry 5822 (class 2604 OID 27612)
-- Name: variable id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.variable ALTER COLUMN id SET DEFAULT nextval('public.variable_id_seq'::regclass);


--
-- TOC entry 6432 (class 0 OID 0)
-- Dependencies: 296
-- Name: ab_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.ab_permission_id_seq', 5, true);


--
-- TOC entry 6433 (class 0 OID 0)
-- Dependencies: 325
-- Name: ab_permission_view_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.ab_permission_view_id_seq', 113, true);


--
-- TOC entry 6434 (class 0 OID 0)
-- Dependencies: 333
-- Name: ab_permission_view_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.ab_permission_view_role_id_seq', 228, true);


--
-- TOC entry 6435 (class 0 OID 0)
-- Dependencies: 304
-- Name: ab_register_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.ab_register_user_id_seq', 1, false);


--
-- TOC entry 6436 (class 0 OID 0)
-- Dependencies: 300
-- Name: ab_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.ab_role_id_seq', 5, true);


--
-- TOC entry 6437 (class 0 OID 0)
-- Dependencies: 302
-- Name: ab_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.ab_user_id_seq', 3, true);


--
-- TOC entry 6438 (class 0 OID 0)
-- Dependencies: 327
-- Name: ab_user_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.ab_user_role_id_seq', 3, true);


--
-- TOC entry 6439 (class 0 OID 0)
-- Dependencies: 298
-- Name: ab_view_menu_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.ab_view_menu_id_seq', 60, true);


--
-- TOC entry 6440 (class 0 OID 0)
-- Dependencies: 256
-- Name: admins_admin_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.admins_admin_id_seq', 3, true);


--
-- TOC entry 6441 (class 0 OID 0)
-- Dependencies: 308
-- Name: callback_request_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.callback_request_id_seq', 1, false);


--
-- TOC entry 6442 (class 0 OID 0)
-- Dependencies: 306
-- Name: connection_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.connection_id_seq', 59, true);


--
-- TOC entry 6443 (class 0 OID 0)
-- Dependencies: 252
-- Name: coupon_templates_coupon_templates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.coupon_templates_coupon_templates_id_seq', 329, true);


--
-- TOC entry 6444 (class 0 OID 0)
-- Dependencies: 293
-- Name: dag_pickle_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.dag_pickle_id_seq', 1, false);


--
-- TOC entry 6445 (class 0 OID 0)
-- Dependencies: 321
-- Name: dag_run_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.dag_run_id_seq', 41, true);


--
-- TOC entry 6446 (class 0 OID 0)
-- Dependencies: 282
-- Name: dataset_event_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.dataset_event_id_seq', 1, false);


--
-- TOC entry 6447 (class 0 OID 0)
-- Dependencies: 280
-- Name: dataset_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.dataset_id_seq', 1, false);


--
-- TOC entry 6448 (class 0 OID 0)
-- Dependencies: 233
-- Name: discount_policy_detail_discount_policy_detail_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.discount_policy_detail_discount_policy_detail_id_seq', 134, true);


--
-- TOC entry 6449 (class 0 OID 0)
-- Dependencies: 264
-- Name: event_places_event_places_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.event_places_event_places_id_seq', 158, true);


--
-- TOC entry 6450 (class 0 OID 0)
-- Dependencies: 260
-- Name: favorite_places_favorite_places_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.favorite_places_favorite_places_id_seq', 102, true);


--
-- TOC entry 6451 (class 0 OID 0)
-- Dependencies: 268
-- Name: franchise_discount_policy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.franchise_discount_policy_id_seq', 114, true);


--
-- TOC entry 6452 (class 0 OID 0)
-- Dependencies: 258
-- Name: franchise_franchise_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.franchise_franchise_id_seq', 1, false);


--
-- TOC entry 6453 (class 0 OID 0)
-- Dependencies: 266
-- Name: franchises_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.franchises_id_seq', 37, true);


--
-- TOC entry 6454 (class 0 OID 0)
-- Dependencies: 277
-- Name: hashtags_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.hashtags_seq', 21, true);


--
-- TOC entry 6455 (class 0 OID 0)
-- Dependencies: 310
-- Name: import_error_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.import_error_id_seq', 3, true);


--
-- TOC entry 6456 (class 0 OID 0)
-- Dependencies: 284
-- Name: job_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.job_id_seq', 169, true);


--
-- TOC entry 6457 (class 0 OID 0)
-- Dependencies: 288
-- Name: log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.log_id_seq', 852, true);


--
-- TOC entry 6458 (class 0 OID 0)
-- Dependencies: 290
-- Name: log_template_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.log_template_id_seq', 2, true);


--
-- TOC entry 6459 (class 0 OID 0)
-- Dependencies: 269
-- Name: owners_owner_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.owners_owner_id_seq', 1, false);


--
-- TOC entry 6460 (class 0 OID 0)
-- Dependencies: 278
-- Name: payment_type_tags_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.payment_type_tags_seq', 9, true);


--
-- TOC entry 6461 (class 0 OID 0)
-- Dependencies: 250
-- Name: places_places_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.places_places_id_seq', 492, true);


--
-- TOC entry 6462 (class 0 OID 0)
-- Dependencies: 262
-- Name: pos_histories_pos_histories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.pos_histories_pos_histories_id_seq', 1, false);


--
-- TOC entry 6463 (class 0 OID 0)
-- Dependencies: 243
-- Name: pos_pos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.pos_pos_id_seq', 307, true);


--
-- TOC entry 6464 (class 0 OID 0)
-- Dependencies: 248
-- Name: roulette_results_roulette_results_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.roulette_results_roulette_results_id_seq', 23, true);


--
-- TOC entry 6465 (class 0 OID 0)
-- Dependencies: 343
-- Name: session_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.session_id_seq', 281, true);


--
-- TOC entry 6466 (class 0 OID 0)
-- Dependencies: 286
-- Name: slot_pool_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.slot_pool_id_seq', 1, true);


--
-- TOC entry 6467 (class 0 OID 0)
-- Dependencies: 246
-- Name: stamps_stamps_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.stamps_stamps_id_seq', 69, true);


--
-- TOC entry 6468 (class 0 OID 0)
-- Dependencies: 235
-- Name: store_owners_owner_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.store_owners_owner_id_seq', 308, false);


--
-- TOC entry 6469 (class 0 OID 0)
-- Dependencies: 349
-- Name: story_representative_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.story_representative_log_id_seq', 45, true);


--
-- TOC entry 6470 (class 0 OID 0)
-- Dependencies: 347
-- Name: story_summary_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.story_summary_id_seq', 45, true);


--
-- TOC entry 6471 (class 0 OID 0)
-- Dependencies: 335
-- Name: task_fail_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.task_fail_id_seq', 11, true);


--
-- TOC entry 6472 (class 0 OID 0)
-- Dependencies: 338
-- Name: task_reschedule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.task_reschedule_id_seq', 1, false);


--
-- TOC entry 6473 (class 0 OID 0)
-- Dependencies: 313
-- Name: trigger_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.trigger_id_seq', 1, false);


--
-- TOC entry 6474 (class 0 OID 0)
-- Dependencies: 241
-- Name: unear_events_unear_events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.unear_events_unear_events_id_seq', 32, true);


--
-- TOC entry 6475 (class 0 OID 0)
-- Dependencies: 273
-- Name: user_action_logs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.user_action_logs_id_seq', 47623, true);


--
-- TOC entry 6476 (class 0 OID 0)
-- Dependencies: 274
-- Name: user_action_summary_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.user_action_summary_id_seq', 109276, true);


--
-- TOC entry 6477 (class 0 OID 0)
-- Dependencies: 254
-- Name: user_coupons_user_coupons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.user_coupons_user_coupons_id_seq', 363, true);


--
-- TOC entry 6478 (class 0 OID 0)
-- Dependencies: 237
-- Name: user_histories_user_histories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.user_histories_user_histories_id_seq', 1410, true);


--
-- TOC entry 6479 (class 0 OID 0)
-- Dependencies: 351
-- Name: user_recommendation_profile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.user_recommendation_profile_id_seq', 10, true);


--
-- TOC entry 6480 (class 0 OID 0)
-- Dependencies: 239
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_user_id_seq', 10345, true);


--
-- TOC entry 6481 (class 0 OID 0)
-- Dependencies: 315
-- Name: variable_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.variable_id_seq', 1, false);


--
-- TOC entry 6482 (class 0 OID 0)
-- Dependencies: 227
-- Name: topology_id_seq; Type: SEQUENCE SET; Schema: topology; Owner: -
--

SELECT pg_catalog.setval('topology.topology_id_seq', 1, false);


--
-- TOC entry 5905 (class 2606 OID 26920)
-- Name: hashtags PK_HASHTAGS; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.hashtags
ADD CONSTRAINT "PK_HASHTAGS" PRIMARY KEY (hashtag_id);


--
-- TOC entry 5907 (class 2606 OID 26925)
-- Name: payment_type_tags PK_PAYMENT_TYPE_TAGS; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.payment_type_tags
ADD CONSTRAINT "PK_PAYMENT_TYPE_TAGS" PRIMARY KEY (payment_type_tag_id);


--
-- TOC entry 5901 (class 2606 OID 25942)
-- Name: user_action_logs PK_USER_ACTION_LOGS; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_action_logs
ADD CONSTRAINT "PK_USER_ACTION_LOGS" PRIMARY KEY (user_action_log_id);


--
-- TOC entry 5909 (class 2606 OID 27276)
-- Name: user_recommendation_profile PK_USER_RECOMMENDATION_PROFILE; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_recommendation_profile
ADD CONSTRAINT "PK_USER_RECOMMENDATION_PROFILE" PRIMARY KEY (user_id);


--
-- TOC entry 5941 (class 2606 OID 27507)
-- Name: ab_permission ab_permission_name_uq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ab_permission
ADD CONSTRAINT ab_permission_name_uq UNIQUE (name);


--
-- TOC entry 5943 (class 2606 OID 27505)
-- Name: ab_permission ab_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ab_permission
ADD CONSTRAINT ab_permission_pkey PRIMARY KEY (id);


--
-- TOC entry 6006 (class 2606 OID 27727)
-- Name: ab_permission_view ab_permission_view_permission_id_view_menu_id_uq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ab_permission_view
ADD CONSTRAINT ab_permission_view_permission_id_view_menu_id_uq UNIQUE (permission_id, view_menu_id);


--
-- TOC entry 6008 (class 2606 OID 27725)
-- Name: ab_permission_view ab_permission_view_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ab_permission_view
ADD CONSTRAINT ab_permission_view_pkey PRIMARY KEY (id);


--
-- TOC entry 6031 (class 2606 OID 27837)
-- Name: ab_permission_view_role ab_permission_view_role_permission_view_id_role_id_uq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ab_permission_view_role
ADD CONSTRAINT ab_permission_view_role_permission_view_id_role_id_uq UNIQUE (permission_view_id, role_id);


--
-- TOC entry 6033 (class 2606 OID 27835)
-- Name: ab_permission_view_role ab_permission_view_role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ab_permission_view_role
ADD CONSTRAINT ab_permission_view_role_pkey PRIMARY KEY (id);


--
-- TOC entry 5960 (class 2606 OID 27558)
-- Name: ab_register_user ab_register_user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ab_register_user
ADD CONSTRAINT ab_register_user_pkey PRIMARY KEY (id);


--
-- TOC entry 5962 (class 2606 OID 27560)
-- Name: ab_register_user ab_register_user_username_uq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ab_register_user
ADD CONSTRAINT ab_register_user_username_uq UNIQUE (username);


--
-- TOC entry 5949 (class 2606 OID 27525)
-- Name: ab_role ab_role_name_uq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ab_role
ADD CONSTRAINT ab_role_name_uq UNIQUE (name);


--
-- TOC entry 5951 (class 2606 OID 27523)
-- Name: ab_role ab_role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ab_role
ADD CONSTRAINT ab_role_pkey PRIMARY KEY (id);


--
-- TOC entry 5953 (class 2606 OID 27538)
-- Name: ab_user ab_user_email_uq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ab_user
ADD CONSTRAINT ab_user_email_uq UNIQUE (email);


--
-- TOC entry 5955 (class 2606 OID 27534)
-- Name: ab_user ab_user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ab_user
ADD CONSTRAINT ab_user_pkey PRIMARY KEY (id);


--
-- TOC entry 6010 (class 2606 OID 27744)
-- Name: ab_user_role ab_user_role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ab_user_role
ADD CONSTRAINT ab_user_role_pkey PRIMARY KEY (id);


--
-- TOC entry 6012 (class 2606 OID 27746)
-- Name: ab_user_role ab_user_role_user_id_role_id_uq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ab_user_role
ADD CONSTRAINT ab_user_role_user_id_role_id_uq UNIQUE (user_id, role_id);


--
-- TOC entry 5957 (class 2606 OID 27536)
-- Name: ab_user ab_user_username_uq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ab_user
ADD CONSTRAINT ab_user_username_uq UNIQUE (username);


--
-- TOC entry 5945 (class 2606 OID 27516)
-- Name: ab_view_menu ab_view_menu_name_uq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ab_view_menu
ADD CONSTRAINT ab_view_menu_name_uq UNIQUE (name);


--
-- TOC entry 5947 (class 2606 OID 27514)
-- Name: ab_view_menu ab_view_menu_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ab_view_menu
ADD CONSTRAINT ab_view_menu_pkey PRIMARY KEY (id);


--
-- TOC entry 5885 (class 2606 OID 22350)
-- Name: admins admins_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.admins
ADD CONSTRAINT admins_pkey PRIMARY KEY (admin_id);


--
-- TOC entry 6056 (class 2606 OID 27959)
-- Name: alembic_version alembic_version_pkc; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.alembic_version
ADD CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num);


--
-- TOC entry 5969 (class 2606 OID 27581)
-- Name: callback_request callback_request_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.callback_request
ADD CONSTRAINT callback_request_pkey PRIMARY KEY (id);


--
-- TOC entry 5965 (class 2606 OID 27572)
-- Name: connection connection_conn_id_uq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.connection
ADD CONSTRAINT connection_conn_id_uq UNIQUE (conn_id);


--
-- TOC entry 5967 (class 2606 OID 27570)
-- Name: connection connection_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.connection
ADD CONSTRAINT connection_pkey PRIMARY KEY (id);


--
-- TOC entry 5879 (class 2606 OID 22334)
-- Name: coupon_templates coupon_templates_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.coupon_templates
ADD CONSTRAINT coupon_templates_pkey PRIMARY KEY (coupon_template_id);


--
-- TOC entry 5933 (class 2606 OID 27479)
-- Name: dag_code dag_code_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dag_code
ADD CONSTRAINT dag_code_pkey PRIMARY KEY (fileloc_hash);


--
-- TOC entry 6004 (class 2606 OID 27713)
-- Name: dag_owner_attributes dag_owner_attributes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dag_owner_attributes
ADD CONSTRAINT dag_owner_attributes_pkey PRIMARY KEY (dag_id, owner);


--
-- TOC entry 5935 (class 2606 OID 27488)
-- Name: dag_pickle dag_pickle_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dag_pickle
ADD CONSTRAINT dag_pickle_pkey PRIMARY KEY (id);


--
-- TOC entry 5937 (class 2606 OID 27496)
-- Name: dag dag_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dag
ADD CONSTRAINT dag_pkey PRIMARY KEY (dag_id);


--
-- TOC entry 5992 (class 2606 OID 27684)
-- Name: dag_run dag_run_dag_id_execution_date_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dag_run
ADD CONSTRAINT dag_run_dag_id_execution_date_key UNIQUE (dag_id, execution_date);


--
-- TOC entry 5994 (class 2606 OID 27686)
-- Name: dag_run dag_run_dag_id_run_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dag_run
ADD CONSTRAINT dag_run_dag_id_run_id_key UNIQUE (dag_id, run_id);


--
-- TOC entry 6029 (class 2606 OID 27818)
-- Name: dag_run_note dag_run_note_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dag_run_note
ADD CONSTRAINT dag_run_note_pkey PRIMARY KEY (dag_run_id);


--
-- TOC entry 5996 (class 2606 OID 27682)
-- Name: dag_run dag_run_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dag_run
ADD CONSTRAINT dag_run_pkey PRIMARY KEY (id);


--
-- TOC entry 6002 (class 2606 OID 27701)
-- Name: dag_tag dag_tag_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dag_tag
ADD CONSTRAINT dag_tag_pkey PRIMARY KEY (name, dag_id);


--
-- TOC entry 6014 (class 2606 OID 27763)
-- Name: dag_warning dag_warning_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dag_warning
ADD CONSTRAINT dag_warning_pkey PRIMARY KEY (dag_id, warning_type);


--
-- TOC entry 6016 (class 2606 OID 27773)
-- Name: dagrun_dataset_event dagrun_dataset_event_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dagrun_dataset_event
ADD CONSTRAINT dagrun_dataset_event_pkey PRIMARY KEY (dag_run_id, event_id);


--
-- TOC entry 5914 (class 2606 OID 27427)
-- Name: dataset_event dataset_event_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dataset_event
ADD CONSTRAINT dataset_event_pkey PRIMARY KEY (id);


--
-- TOC entry 5911 (class 2606 OID 27416)
-- Name: dataset dataset_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dataset
ADD CONSTRAINT dataset_pkey PRIMARY KEY (id);


--
-- TOC entry 5989 (class 2606 OID 27663)
-- Name: dataset_dag_run_queue datasetdagrunqueue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dataset_dag_run_queue
ADD CONSTRAINT datasetdagrunqueue_pkey PRIMARY KEY (dataset_id, target_dag_id);


--
-- TOC entry 5854 (class 2606 OID 22259)
-- Name: general_discount_policy discount_policy_detail_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.general_discount_policy
ADD CONSTRAINT discount_policy_detail_pkey PRIMARY KEY (general_discount_policy_id);


--
-- TOC entry 5985 (class 2606 OID 27631)
-- Name: dag_schedule_dataset_reference dsdr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dag_schedule_dataset_reference
ADD CONSTRAINT dsdr_pkey PRIMARY KEY (dataset_id, dag_id);


--
-- TOC entry 5893 (class 2606 OID 22378)
-- Name: event_places event_places_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.event_places
ADD CONSTRAINT event_places_pkey PRIMARY KEY (event_place_id);


--
-- TOC entry 5889 (class 2606 OID 22364)
-- Name: favorite_places favorite_places_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.favorite_places
ADD CONSTRAINT favorite_places_pkey PRIMARY KEY (favorite_place_id);


--
-- TOC entry 5887 (class 2606 OID 22985)
-- Name: franchise_discount_policy franchise_discount_policy_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.franchise_discount_policy
ADD CONSTRAINT franchise_discount_policy_pkey PRIMARY KEY (franchise_discount_policy_id);


--
-- TOC entry 5895 (class 2606 OID 23114)
-- Name: franchises franchises_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.franchises
ADD CONSTRAINT franchises_name_key UNIQUE (name);


--
-- TOC entry 5897 (class 2606 OID 23088)
-- Name: franchises franchises_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.franchises
ADD CONSTRAINT franchises_pkey PRIMARY KEY (franchise_id);


--
-- TOC entry 5971 (class 2606 OID 27590)
-- Name: import_error import_error_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.import_error
ADD CONSTRAINT import_error_pkey PRIMARY KEY (id);


--
-- TOC entry 5919 (class 2606 OID 27437)
-- Name: job job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.job
ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 5929 (class 2606 OID 27460)
-- Name: log log_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.log
ADD CONSTRAINT log_pkey PRIMARY KEY (id);


--
-- TOC entry 5931 (class 2606 OID 27472)
-- Name: log_template log_template_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.log_template
ADD CONSTRAINT log_template_pkey PRIMARY KEY (id);


--
-- TOC entry 5899 (class 2606 OID 25935)
-- Name: owners owners_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.owners
ADD CONSTRAINT owners_pkey PRIMARY KEY (owner_id);


--
-- TOC entry 6058 (class 2606 OID 28549)
-- Name: place_embeddings place_embeddings_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.place_embeddings
ADD CONSTRAINT place_embeddings_pkey PRIMARY KEY (place_id);


--
-- TOC entry 5877 (class 2606 OID 22326)
-- Name: places places_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.places
ADD CONSTRAINT places_pkey PRIMARY KEY (place_id);


--
-- TOC entry 5891 (class 2606 OID 22370)
-- Name: pos_histories pos_histories_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pos_histories
ADD CONSTRAINT pos_histories_pkey PRIMARY KEY (pos_history_id);


--
-- TOC entry 5868 (class 2606 OID 22297)
-- Name: pos pos_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pos
ADD CONSTRAINT pos_pkey PRIMARY KEY (pos_id);


--
-- TOC entry 6050 (class 2606 OID 27938)
-- Name: rendered_task_instance_fields rendered_task_instance_fields_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.rendered_task_instance_fields
ADD CONSTRAINT rendered_task_instance_fields_pkey PRIMARY KEY (dag_id, task_id, run_id, map_index);


--
-- TOC entry 5874 (class 2606 OID 22318)
-- Name: roulette_results roulette_results_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.roulette_results
ADD CONSTRAINT roulette_results_pkey PRIMARY KEY (roulette_result_id);


--
-- TOC entry 5983 (class 2606 OID 27625)
-- Name: serialized_dag serialized_dag_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.serialized_dag
ADD CONSTRAINT serialized_dag_pkey PRIMARY KEY (dag_id);


--
-- TOC entry 6052 (class 2606 OID 27952)
-- Name: session session_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.session
ADD CONSTRAINT session_pkey PRIMARY KEY (id);


--
-- TOC entry 6054 (class 2606 OID 27954)
-- Name: session session_session_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.session
ADD CONSTRAINT session_session_id_key UNIQUE (session_id);


--
-- TOC entry 5973 (class 2606 OID 27597)
-- Name: sla_miss sla_miss_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sla_miss
ADD CONSTRAINT sla_miss_pkey PRIMARY KEY (task_id, dag_id, execution_date);


--
-- TOC entry 5922 (class 2606 OID 27449)
-- Name: slot_pool slot_pool_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.slot_pool
ADD CONSTRAINT slot_pool_pkey PRIMARY KEY (id);


--
-- TOC entry 5924 (class 2606 OID 27451)
-- Name: slot_pool slot_pool_pool_uq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.slot_pool
ADD CONSTRAINT slot_pool_pool_uq UNIQUE (pool);


--
-- TOC entry 5872 (class 2606 OID 22310)
-- Name: stamps stamps_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.stamps
ADD CONSTRAINT stamps_pkey PRIMARY KEY (stamp_id);


--
-- TOC entry 5856 (class 2606 OID 22267)
-- Name: store_owners store_owners_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.store_owners
ADD CONSTRAINT store_owners_pkey PRIMARY KEY (owner_id);


--
-- TOC entry 6062 (class 2606 OID 30605)
-- Name: story_representative_log story_representative_log_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.story_representative_log
ADD CONSTRAINT story_representative_log_pkey PRIMARY KEY (id);


--
-- TOC entry 6060 (class 2606 OID 30596)
-- Name: story_summary story_summary_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.story_summary
ADD CONSTRAINT story_summary_pkey PRIMARY KEY (id);


--
-- TOC entry 6036 (class 2606 OID 27857)
-- Name: task_fail task_fail_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.task_fail
ADD CONSTRAINT task_fail_pkey PRIMARY KEY (id);


--
-- TOC entry 6048 (class 2606 OID 27920)
-- Name: task_instance_note task_instance_note_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.task_instance_note
ADD CONSTRAINT task_instance_note_pkey PRIMARY KEY (task_id, dag_id, run_id, map_index);


--
-- TOC entry 6020 (class 2606 OID 27794)
-- Name: task_instance task_instance_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.task_instance
ADD CONSTRAINT task_instance_pkey PRIMARY KEY (dag_id, task_id, run_id, map_index);


--
-- TOC entry 6038 (class 2606 OID 27871)
-- Name: task_map task_map_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.task_map
ADD CONSTRAINT task_map_pkey PRIMARY KEY (dag_id, task_id, run_id, map_index);


--
-- TOC entry 6042 (class 2606 OID 27886)
-- Name: task_reschedule task_reschedule_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.task_reschedule
ADD CONSTRAINT task_reschedule_pkey PRIMARY KEY (id);


--
-- TOC entry 5860 (class 2606 OID 26018)
-- Name: users tel; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
ADD CONSTRAINT tel UNIQUE (tel);


--
-- TOC entry 5987 (class 2606 OID 27648)
-- Name: task_outlet_dataset_reference todr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.task_outlet_dataset_reference
ADD CONSTRAINT todr_pkey PRIMARY KEY (dataset_id, dag_id, task_id);


--
-- TOC entry 5976 (class 2606 OID 27607)
-- Name: trigger trigger_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trigger
ADD CONSTRAINT trigger_pkey PRIMARY KEY (id);


--
-- TOC entry 5881 (class 2606 OID 23646)
-- Name: user_coupons uk_user_coupon; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_coupons
ADD CONSTRAINT uk_user_coupon UNIQUE (user_id, coupon_template_id);


--
-- TOC entry 5864 (class 2606 OID 23761)
-- Name: unear_events ukr478v5vrybpqvkomb5w6q45t1; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.unear_events
ADD CONSTRAINT ukr478v5vrybpqvkomb5w6q45t1 UNIQUE (popup_store_id);


--
-- TOC entry 5866 (class 2606 OID 22291)
-- Name: unear_events unear_events_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.unear_events
ADD CONSTRAINT unear_events_pkey PRIMARY KEY (unear_event_id);


--
-- TOC entry 5903 (class 2606 OID 26051)
-- Name: user_action_summary uniq_summary_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_action_summary
ADD CONSTRAINT uniq_summary_key UNIQUE (action_type, group_by_field, group_by_text, summary_date);


--
-- TOC entry 5870 (class 2606 OID 25847)
-- Name: pos uq_pos_place_id; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pos
ADD CONSTRAINT uq_pos_place_id UNIQUE (place_id);


--
-- TOC entry 5883 (class 2606 OID 22342)
-- Name: user_coupons user_coupons_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_coupons
ADD CONSTRAINT user_coupons_pkey PRIMARY KEY (user_coupon_id);


--
-- TOC entry 5858 (class 2606 OID 22275)
-- Name: user_histories user_histories_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_histories
ADD CONSTRAINT user_histories_pkey PRIMARY KEY (user_history_id);


--
-- TOC entry 5862 (class 2606 OID 22283)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- TOC entry 5978 (class 2606 OID 27618)
-- Name: variable variable_key_uq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.variable
ADD CONSTRAINT variable_key_uq UNIQUE (key);


--
-- TOC entry 5980 (class 2606 OID 27616)
-- Name: variable variable_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.variable
ADD CONSTRAINT variable_pkey PRIMARY KEY (id);


--
-- TOC entry 6046 (class 2606 OID 27906)
-- Name: xcom xcom_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.xcom
ADD CONSTRAINT xcom_pkey PRIMARY KEY (dag_run_id, task_id, map_index, key);


--
-- TOC entry 5990 (class 1259 OID 27696)
-- Name: dag_id_state; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dag_id_state ON public.dag_run USING btree (dag_id, state);


--
-- TOC entry 5963 (class 1259 OID 27561)
-- Name: idx_ab_register_user_username; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX idx_ab_register_user_username ON public.ab_register_user USING btree (lower((username)::text));


--
-- TOC entry 5958 (class 1259 OID 27549)
-- Name: idx_ab_user_username; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX idx_ab_user_username ON public.ab_user USING btree (lower((username)::text));


--
-- TOC entry 5997 (class 1259 OID 27694)
-- Name: idx_dag_run_dag_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dag_run_dag_id ON public.dag_run USING btree (dag_id);


--
-- TOC entry 5998 (class 1259 OID 27692)
-- Name: idx_dag_run_queued_dags; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dag_run_queued_dags ON public.dag_run USING btree (state, dag_id) WHERE ((state)::text = 'queued'::text);


--
-- TOC entry 5999 (class 1259 OID 27693)
-- Name: idx_dag_run_running_dags; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dag_run_running_dags ON public.dag_run USING btree (state, dag_id) WHERE ((state)::text = 'running'::text);


--
-- TOC entry 6017 (class 1259 OID 27784)
-- Name: idx_dagrun_dataset_events_dag_run_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dagrun_dataset_events_dag_run_id ON public.dagrun_dataset_event USING btree (dag_run_id);


--
-- TOC entry 6018 (class 1259 OID 27785)
-- Name: idx_dagrun_dataset_events_event_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dagrun_dataset_events_event_id ON public.dagrun_dataset_event USING btree (event_id);


--
-- TOC entry 5915 (class 1259 OID 27428)
-- Name: idx_dataset_id_timestamp; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dataset_id_timestamp ON public.dataset_event USING btree (dataset_id, "timestamp");


--
-- TOC entry 5981 (class 1259 OID 27626)
-- Name: idx_fileloc_hash; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fileloc_hash ON public.serialized_dag USING btree (fileloc_hash);


--
-- TOC entry 5916 (class 1259 OID 27439)
-- Name: idx_job_dag_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_job_dag_id ON public.job USING btree (dag_id);


--
-- TOC entry 5917 (class 1259 OID 27440)
-- Name: idx_job_state_heartbeat; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_job_state_heartbeat ON public.job USING btree (state, latest_heartbeat);


--
-- TOC entry 6000 (class 1259 OID 27695)
-- Name: idx_last_scheduling_decision; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_last_scheduling_decision ON public.dag_run USING btree (last_scheduling_decision);


--
-- TOC entry 5925 (class 1259 OID 27461)
-- Name: idx_log_dag; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_log_dag ON public.log USING btree (dag_id);


--
-- TOC entry 5926 (class 1259 OID 27463)
-- Name: idx_log_dttm; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_log_dttm ON public.log USING btree (dttm);


--
-- TOC entry 5927 (class 1259 OID 27462)
-- Name: idx_log_event; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_log_event ON public.log USING btree (event);


--
-- TOC entry 5938 (class 1259 OID 27498)
-- Name: idx_next_dagrun_create_after; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_next_dagrun_create_after ON public.dag USING btree (next_dagrun_create_after);


--
-- TOC entry 5875 (class 1259 OID 23800)
-- Name: idx_places_location; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_places_location ON public.places USING gist (location);


--
-- TOC entry 5939 (class 1259 OID 27497)
-- Name: idx_root_dag_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_root_dag_id ON public.dag USING btree (root_dag_id);


--
-- TOC entry 6034 (class 1259 OID 27863)
-- Name: idx_task_fail_task_instance; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_task_fail_task_instance ON public.task_fail USING btree (dag_id, task_id, run_id, map_index);


--
-- TOC entry 6039 (class 1259 OID 27898)
-- Name: idx_task_reschedule_dag_run; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_task_reschedule_dag_run ON public.task_reschedule USING btree (dag_id, run_id);


--
-- TOC entry 6040 (class 1259 OID 27897)
-- Name: idx_task_reschedule_dag_task_run; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_task_reschedule_dag_task_run ON public.task_reschedule USING btree (dag_id, task_id, run_id, map_index);


--
-- TOC entry 5912 (class 1259 OID 27417)
-- Name: idx_uri_unique; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX idx_uri_unique ON public.dataset USING btree (uri);


--
-- TOC entry 6043 (class 1259 OID 27913)
-- Name: idx_xcom_key; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_xcom_key ON public.xcom USING btree (key);


--
-- TOC entry 6044 (class 1259 OID 27912)
-- Name: idx_xcom_task_instance; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_xcom_task_instance ON public.xcom USING btree (dag_id, task_id, run_id, map_index);


--
-- TOC entry 5920 (class 1259 OID 27438)
-- Name: job_type_heart; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX job_type_heart ON public.job USING btree (job_type, latest_heartbeat);


--
-- TOC entry 5974 (class 1259 OID 27598)
-- Name: sm_dag; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX sm_dag ON public.sla_miss USING btree (dag_id);


--
-- TOC entry 6021 (class 1259 OID 27806)
-- Name: ti_dag_run; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX ti_dag_run ON public.task_instance USING btree (dag_id, run_id);


--
-- TOC entry 6022 (class 1259 OID 27805)
-- Name: ti_dag_state; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX ti_dag_state ON public.task_instance USING btree (dag_id, state);


--
-- TOC entry 6023 (class 1259 OID 27811)
-- Name: ti_job_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX ti_job_id ON public.task_instance USING btree (job_id);


--
-- TOC entry 6024 (class 1259 OID 27807)
-- Name: ti_pool; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX ti_pool ON public.task_instance USING btree (pool, state, priority_weight);


--
-- TOC entry 6025 (class 1259 OID 27810)
-- Name: ti_state; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX ti_state ON public.task_instance USING btree (state);


--
-- TOC entry 6026 (class 1259 OID 27808)
-- Name: ti_state_lkp; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX ti_state_lkp ON public.task_instance USING btree (dag_id, task_id, run_id, state);


--
-- TOC entry 6027 (class 1259 OID 27809)
-- Name: ti_trigger_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX ti_trigger_id ON public.task_instance USING btree (trigger_id);


--
-- TOC entry 6078 (class 2606 OID 22439)
-- Name: user_coupons FK_coupon_templates_TO_user_coupons_1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_coupons
ADD CONSTRAINT "FK_coupon_templates_TO_user_coupons_1" FOREIGN KEY (coupon_template_id) REFERENCES public.coupon_templates(coupon_template_id);


--
-- TOC entry 6071 (class 2606 OID 22414)
-- Name: stamps FK_event_places_TO_stamps_1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.stamps
ADD CONSTRAINT "FK_event_places_TO_stamps_1" FOREIGN KEY (event_place_id) REFERENCES public.event_places(event_place_id);


--
-- TOC entry 6063 (class 2606 OID 22379)
-- Name: general_discount_policy FK_places_TO_discount_policy_detail_1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.general_discount_policy
ADD CONSTRAINT "FK_places_TO_discount_policy_detail_1" FOREIGN KEY (place_id) REFERENCES public.places(place_id);


--
-- TOC entry 6085 (class 2606 OID 22469)
-- Name: event_places FK_places_TO_event_places_1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.event_places
ADD CONSTRAINT "FK_places_TO_event_places_1" FOREIGN KEY (place_id) REFERENCES public.places(place_id);


--
-- TOC entry 6081 (class 2606 OID 22444)
-- Name: favorite_places FK_places_TO_favorite_places_1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.favorite_places
ADD CONSTRAINT "FK_places_TO_favorite_places_1" FOREIGN KEY (place_id) REFERENCES public.places(place_id);


--
-- TOC entry 6070 (class 2606 OID 22404)
-- Name: pos FK_places_TO_pos_1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pos
ADD CONSTRAINT "FK_places_TO_pos_1" FOREIGN KEY (place_id) REFERENCES public.places(place_id);


--
-- TOC entry 6065 (class 2606 OID 22399)
-- Name: user_histories FK_places_TO_user_histories_1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_histories
ADD CONSTRAINT "FK_places_TO_user_histories_1" FOREIGN KEY (place_id) REFERENCES public.places(place_id);


--
-- TOC entry 6083 (class 2606 OID 22454)
-- Name: pos_histories FK_pos_TO_pos_histories_1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pos_histories
ADD CONSTRAINT "FK_pos_TO_pos_histories_1" FOREIGN KEY (pos_id) REFERENCES public.pos(pos_id);


--
-- TOC entry 6064 (class 2606 OID 22384)
-- Name: store_owners FK_pos_TO_store_owners_1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.store_owners
ADD CONSTRAINT "FK_pos_TO_store_owners_1" FOREIGN KEY (pos_id) REFERENCES public.pos(pos_id);


--
-- TOC entry 6086 (class 2606 OID 22464)
-- Name: event_places FK_unear_events_TO_event_places_1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.event_places
ADD CONSTRAINT "FK_unear_events_TO_event_places_1" FOREIGN KEY (unear_event_id) REFERENCES public.unear_events(unear_event_id);


--
-- TOC entry 6074 (class 2606 OID 22419)
-- Name: roulette_results FK_unear_events_TO_roulette_results_1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.roulette_results
ADD CONSTRAINT "FK_unear_events_TO_roulette_results_1" FOREIGN KEY (unear_event_id) REFERENCES public.unear_events(unear_event_id);


--
-- TOC entry 6066 (class 2606 OID 22394)
-- Name: user_histories FK_user_coupons_TO_user_histories_1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_histories
ADD CONSTRAINT "FK_user_coupons_TO_user_histories_1" FOREIGN KEY (user_coupon_id) REFERENCES public.user_coupons(user_coupon_id);


--
-- TOC entry 6084 (class 2606 OID 22459)
-- Name: pos_histories FK_user_histories_TO_pos_histories_1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pos_histories
ADD CONSTRAINT "FK_user_histories_TO_pos_histories_1" FOREIGN KEY (user_history_id) REFERENCES public.user_histories(user_history_id);


--
-- TOC entry 6082 (class 2606 OID 22449)
-- Name: favorite_places FK_users_TO_favorite_places_1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.favorite_places
ADD CONSTRAINT "FK_users_TO_favorite_places_1" FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- TOC entry 6075 (class 2606 OID 22424)
-- Name: roulette_results FK_users_TO_roulette_results_1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.roulette_results
ADD CONSTRAINT "FK_users_TO_roulette_results_1" FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- TOC entry 6072 (class 2606 OID 22409)
-- Name: stamps FK_users_TO_stamps_1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.stamps
ADD CONSTRAINT "FK_users_TO_stamps_1" FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- TOC entry 6079 (class 2606 OID 22434)
-- Name: user_coupons FK_users_TO_user_coupons_1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_coupons
ADD CONSTRAINT "FK_users_TO_user_coupons_1" FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- TOC entry 6067 (class 2606 OID 22389)
-- Name: user_histories FK_users_TO_user_histories_1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_histories
ADD CONSTRAINT "FK_users_TO_user_histories_1" FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- TOC entry 6098 (class 2606 OID 27728)
-- Name: ab_permission_view ab_permission_view_permission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ab_permission_view
ADD CONSTRAINT ab_permission_view_permission_id_fkey FOREIGN KEY (permission_id) REFERENCES public.ab_permission(id);


--
-- TOC entry 6109 (class 2606 OID 27838)
-- Name: ab_permission_view_role ab_permission_view_role_permission_view_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ab_permission_view_role
ADD CONSTRAINT ab_permission_view_role_permission_view_id_fkey FOREIGN KEY (permission_view_id) REFERENCES public.ab_permission_view(id);


--
-- TOC entry 6110 (class 2606 OID 27843)
-- Name: ab_permission_view_role ab_permission_view_role_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ab_permission_view_role
ADD CONSTRAINT ab_permission_view_role_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.ab_role(id);


--
-- TOC entry 6099 (class 2606 OID 27733)
-- Name: ab_permission_view ab_permission_view_view_menu_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ab_permission_view
ADD CONSTRAINT ab_permission_view_view_menu_id_fkey FOREIGN KEY (view_menu_id) REFERENCES public.ab_view_menu(id);


--
-- TOC entry 6087 (class 2606 OID 27544)
-- Name: ab_user ab_user_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ab_user
ADD CONSTRAINT ab_user_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- TOC entry 6088 (class 2606 OID 27539)
-- Name: ab_user ab_user_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ab_user
ADD CONSTRAINT ab_user_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- TOC entry 6100 (class 2606 OID 27752)
-- Name: ab_user_role ab_user_role_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ab_user_role
ADD CONSTRAINT ab_user_role_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.ab_role(id);


--
-- TOC entry 6101 (class 2606 OID 27747)
-- Name: ab_user_role ab_user_role_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ab_user_role
ADD CONSTRAINT ab_user_role_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.ab_user(id);


--
-- TOC entry 6097 (class 2606 OID 27714)
-- Name: dag_owner_attributes dag.dag_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dag_owner_attributes
ADD CONSTRAINT "dag.dag_id" FOREIGN KEY (dag_id) REFERENCES public.dag(dag_id) ON DELETE CASCADE;


--
-- TOC entry 6107 (class 2606 OID 27819)
-- Name: dag_run_note dag_run_note_dr_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dag_run_note
ADD CONSTRAINT dag_run_note_dr_fkey FOREIGN KEY (dag_run_id) REFERENCES public.dag_run(id) ON DELETE CASCADE;


--
-- TOC entry 6108 (class 2606 OID 27824)
-- Name: dag_run_note dag_run_note_user_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dag_run_note
ADD CONSTRAINT dag_run_note_user_fkey FOREIGN KEY (user_id) REFERENCES public.ab_user(id);


--
-- TOC entry 6096 (class 2606 OID 27702)
-- Name: dag_tag dag_tag_dag_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dag_tag
ADD CONSTRAINT dag_tag_dag_id_fkey FOREIGN KEY (dag_id) REFERENCES public.dag(dag_id) ON DELETE CASCADE;


--
-- TOC entry 6103 (class 2606 OID 27774)
-- Name: dagrun_dataset_event dagrun_dataset_event_dag_run_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dagrun_dataset_event
ADD CONSTRAINT dagrun_dataset_event_dag_run_id_fkey FOREIGN KEY (dag_run_id) REFERENCES public.dag_run(id) ON DELETE CASCADE;


--
-- TOC entry 6104 (class 2606 OID 27779)
-- Name: dagrun_dataset_event dagrun_dataset_event_event_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dagrun_dataset_event
ADD CONSTRAINT dagrun_dataset_event_event_id_fkey FOREIGN KEY (event_id) REFERENCES public.dataset_event(id) ON DELETE CASCADE;


--
-- TOC entry 6102 (class 2606 OID 27764)
-- Name: dag_warning dcw_dag_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dag_warning
ADD CONSTRAINT dcw_dag_id_fkey FOREIGN KEY (dag_id) REFERENCES public.dag(dag_id) ON DELETE CASCADE;


--
-- TOC entry 6093 (class 2606 OID 27669)
-- Name: dataset_dag_run_queue ddrq_dag_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dataset_dag_run_queue
ADD CONSTRAINT ddrq_dag_fkey FOREIGN KEY (target_dag_id) REFERENCES public.dag(dag_id) ON DELETE CASCADE;


--
-- TOC entry 6094 (class 2606 OID 27664)
-- Name: dataset_dag_run_queue ddrq_dataset_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dataset_dag_run_queue
ADD CONSTRAINT ddrq_dataset_fkey FOREIGN KEY (dataset_id) REFERENCES public.dataset(id) ON DELETE CASCADE;


--
-- TOC entry 6089 (class 2606 OID 27637)
-- Name: dag_schedule_dataset_reference dsdr_dag_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dag_schedule_dataset_reference
ADD CONSTRAINT dsdr_dag_id_fkey FOREIGN KEY (dag_id) REFERENCES public.dag(dag_id) ON DELETE CASCADE;


--
-- TOC entry 6090 (class 2606 OID 27632)
-- Name: dag_schedule_dataset_reference dsdr_dataset_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dag_schedule_dataset_reference
ADD CONSTRAINT dsdr_dataset_fkey FOREIGN KEY (dataset_id) REFERENCES public.dataset(id) ON DELETE CASCADE;


--
-- TOC entry 6068 (class 2606 OID 23762)
-- Name: unear_events fk3485g9uc7mx4m2ebc3qmpe6kt; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.unear_events
ADD CONSTRAINT fk3485g9uc7mx4m2ebc3qmpe6kt FOREIGN KEY (popup_store_id) REFERENCES public.places(place_id);


--
-- TOC entry 6080 (class 2606 OID 23094)
-- Name: franchise_discount_policy fk_franchise_discount_policy_franchise; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.franchise_discount_policy
ADD CONSTRAINT fk_franchise_discount_policy_franchise FOREIGN KEY (franchise_id) REFERENCES public.franchises(franchise_id) ON DELETE CASCADE;


--
-- TOC entry 6076 (class 2606 OID 23089)
-- Name: places fk_places_franchise; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.places
ADD CONSTRAINT fk_places_franchise FOREIGN KEY (franchise_id) REFERENCES public.franchises(franchise_id) ON DELETE SET NULL;


--
-- TOC entry 6077 (class 2606 OID 26898)
-- Name: coupon_templates fko9veqhv46hqvyu8j1tws3hp3i; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.coupon_templates
ADD CONSTRAINT fko9veqhv46hqvyu8j1tws3hp3i FOREIGN KEY (unear_event_id) REFERENCES public.unear_events(unear_event_id);


--
-- TOC entry 6069 (class 2606 OID 26328)
-- Name: unear_events fksouhglvdyn9ycealq8dvfysfr; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.unear_events
ADD CONSTRAINT fksouhglvdyn9ycealq8dvfysfr FOREIGN KEY (coupon_template_id) REFERENCES public.coupon_templates(coupon_template_id);


--
-- TOC entry 6073 (class 2606 OID 27040)
-- Name: stamps fkxx7m9lrc7h3q7frp1e8vrlnr; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.stamps
ADD CONSTRAINT fkxx7m9lrc7h3q7frp1e8vrlnr FOREIGN KEY (unear_event_id) REFERENCES public.unear_events(unear_event_id);


--
-- TOC entry 6119 (class 2606 OID 28550)
-- Name: place_embeddings place_embeddings_place_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.place_embeddings
ADD CONSTRAINT place_embeddings_place_id_fkey FOREIGN KEY (place_id) REFERENCES public.places(place_id);


--
-- TOC entry 6118 (class 2606 OID 27939)
-- Name: rendered_task_instance_fields rtif_ti_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.rendered_task_instance_fields
ADD CONSTRAINT rtif_ti_fkey FOREIGN KEY (dag_id, task_id, run_id, map_index) REFERENCES public.task_instance(dag_id, task_id, run_id, map_index) ON DELETE CASCADE;


--
-- TOC entry 6120 (class 2606 OID 30606)
-- Name: story_representative_log story_representative_log_story_summary_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.story_representative_log
ADD CONSTRAINT story_representative_log_story_summary_id_fkey FOREIGN KEY (story_summary_id) REFERENCES public.story_summary(id) ON DELETE CASCADE;


--
-- TOC entry 6111 (class 2606 OID 27858)
-- Name: task_fail task_fail_ti_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.task_fail
ADD CONSTRAINT task_fail_ti_fkey FOREIGN KEY (dag_id, task_id, run_id, map_index) REFERENCES public.task_instance(dag_id, task_id, run_id, map_index) ON DELETE CASCADE;


--
-- TOC entry 6105 (class 2606 OID 27800)
-- Name: task_instance task_instance_dag_run_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.task_instance
ADD CONSTRAINT task_instance_dag_run_fkey FOREIGN KEY (dag_id, run_id) REFERENCES public.dag_run(dag_id, run_id) ON DELETE CASCADE;


--
-- TOC entry 6095 (class 2606 OID 27687)
-- Name: dag_run task_instance_log_template_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dag_run
ADD CONSTRAINT task_instance_log_template_id_fkey FOREIGN KEY (log_template_id) REFERENCES public.log_template(id);


--
-- TOC entry 6116 (class 2606 OID 27921)
-- Name: task_instance_note task_instance_note_ti_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.task_instance_note
ADD CONSTRAINT task_instance_note_ti_fkey FOREIGN KEY (dag_id, task_id, run_id, map_index) REFERENCES public.task_instance(dag_id, task_id, run_id, map_index) ON DELETE CASCADE;


--
-- TOC entry 6117 (class 2606 OID 27926)
-- Name: task_instance_note task_instance_note_user_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.task_instance_note
ADD CONSTRAINT task_instance_note_user_fkey FOREIGN KEY (user_id) REFERENCES public.ab_user(id);


--
-- TOC entry 6106 (class 2606 OID 27795)
-- Name: task_instance task_instance_trigger_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.task_instance
ADD CONSTRAINT task_instance_trigger_id_fkey FOREIGN KEY (trigger_id) REFERENCES public.trigger(id) ON DELETE CASCADE;


--
-- TOC entry 6112 (class 2606 OID 27872)
-- Name: task_map task_map_task_instance_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.task_map
ADD CONSTRAINT task_map_task_instance_fkey FOREIGN KEY (dag_id, task_id, run_id, map_index) REFERENCES public.task_instance(dag_id, task_id, run_id, map_index) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 6113 (class 2606 OID 27892)
-- Name: task_reschedule task_reschedule_dr_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.task_reschedule
ADD CONSTRAINT task_reschedule_dr_fkey FOREIGN KEY (dag_id, run_id) REFERENCES public.dag_run(dag_id, run_id) ON DELETE CASCADE;


--
-- TOC entry 6114 (class 2606 OID 27887)
-- Name: task_reschedule task_reschedule_ti_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.task_reschedule
ADD CONSTRAINT task_reschedule_ti_fkey FOREIGN KEY (dag_id, task_id, run_id, map_index) REFERENCES public.task_instance(dag_id, task_id, run_id, map_index) ON DELETE CASCADE;


--
-- TOC entry 6091 (class 2606 OID 27654)
-- Name: task_outlet_dataset_reference todr_dag_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.task_outlet_dataset_reference
ADD CONSTRAINT todr_dag_id_fkey FOREIGN KEY (dag_id) REFERENCES public.dag(dag_id) ON DELETE CASCADE;


--
-- TOC entry 6092 (class 2606 OID 27649)
-- Name: task_outlet_dataset_reference todr_dataset_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.task_outlet_dataset_reference
ADD CONSTRAINT todr_dataset_fkey FOREIGN KEY (dataset_id) REFERENCES public.dataset(id) ON DELETE CASCADE;


--
-- TOC entry 6115 (class 2606 OID 27907)
-- Name: xcom xcom_task_instance_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.xcom
ADD CONSTRAINT xcom_task_instance_fkey FOREIGN KEY (dag_id, task_id, run_id, map_index) REFERENCES public.task_instance(dag_id, task_id, run_id, map_index) ON DELETE CASCADE;


-- Completed on 2025-08-08 13:39:11 KST

--
-- PostgreSQL database dump complete
--
