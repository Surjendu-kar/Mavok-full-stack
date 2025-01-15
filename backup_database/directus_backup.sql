--
-- PostgreSQL database dump
--

-- Dumped from database version 17.2 (Debian 17.2-1.pgdg110+1)
-- Dumped by pg_dump version 17.2 (Debian 17.2-1.pgdg110+1)

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
-- Name: tiger; Type: SCHEMA; Schema: -; Owner: directus
--

CREATE SCHEMA tiger;


ALTER SCHEMA tiger OWNER TO directus;

--
-- Name: tiger_data; Type: SCHEMA; Schema: -; Owner: directus
--

CREATE SCHEMA tiger_data;


ALTER SCHEMA tiger_data OWNER TO directus;

--
-- Name: topology; Type: SCHEMA; Schema: -; Owner: directus
--

CREATE SCHEMA topology;


ALTER SCHEMA topology OWNER TO directus;

--
-- Name: SCHEMA topology; Type: COMMENT; Schema: -; Owner: directus
--

COMMENT ON SCHEMA topology IS 'PostGIS Topology schema';


--
-- Name: fuzzystrmatch; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS fuzzystrmatch WITH SCHEMA public;


--
-- Name: EXTENSION fuzzystrmatch; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION fuzzystrmatch IS 'determine similarities and distance between strings';


--
-- Name: postgis; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;


--
-- Name: EXTENSION postgis; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis IS 'PostGIS geometry and geography spatial types and functions';


--
-- Name: postgis_tiger_geocoder; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgis_tiger_geocoder WITH SCHEMA tiger;


--
-- Name: EXTENSION postgis_tiger_geocoder; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis_tiger_geocoder IS 'PostGIS tiger geocoder and reverse geocoder';


--
-- Name: postgis_topology; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgis_topology WITH SCHEMA topology;


--
-- Name: EXTENSION postgis_topology; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis_topology IS 'PostGIS topology spatial types and functions';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: accessories; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.accessories (
    id integer NOT NULL,
    heading character varying(255),
    sub_heading character varying(255),
    price integer,
    type integer,
    main_image uuid
);


ALTER TABLE public.accessories OWNER TO directus;

--
-- Name: accessories_files; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.accessories_files (
    id integer NOT NULL,
    accessories_id integer,
    directus_files_id uuid
);


ALTER TABLE public.accessories_files OWNER TO directus;

--
-- Name: accessories_files_id_seq; Type: SEQUENCE; Schema: public; Owner: directus
--

CREATE SEQUENCE public.accessories_files_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.accessories_files_id_seq OWNER TO directus;

--
-- Name: accessories_files_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: directus
--

ALTER SEQUENCE public.accessories_files_id_seq OWNED BY public.accessories_files.id;


--
-- Name: accessories_id_seq; Type: SEQUENCE; Schema: public; Owner: directus
--

CREATE SEQUENCE public.accessories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.accessories_id_seq OWNER TO directus;

--
-- Name: accessories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: directus
--

ALTER SEQUENCE public.accessories_id_seq OWNED BY public.accessories.id;


--
-- Name: accessories_type; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.accessories_type (
    id integer NOT NULL,
    type character varying(255),
    image uuid
);


ALTER TABLE public.accessories_type OWNER TO directus;

--
-- Name: accessories_type_id_seq; Type: SEQUENCE; Schema: public; Owner: directus
--

CREATE SEQUENCE public.accessories_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.accessories_type_id_seq OWNER TO directus;

--
-- Name: accessories_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: directus
--

ALTER SEQUENCE public.accessories_type_id_seq OWNED BY public.accessories_type.id;


--
-- Name: directus_access; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_access (
    id uuid NOT NULL,
    role uuid,
    "user" uuid,
    policy uuid NOT NULL,
    sort integer
);


ALTER TABLE public.directus_access OWNER TO directus;

--
-- Name: directus_activity; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_activity (
    id integer NOT NULL,
    action character varying(45) NOT NULL,
    "user" uuid,
    "timestamp" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    ip character varying(50),
    user_agent text,
    collection character varying(64) NOT NULL,
    item character varying(255) NOT NULL,
    origin character varying(255)
);


ALTER TABLE public.directus_activity OWNER TO directus;

--
-- Name: directus_activity_id_seq; Type: SEQUENCE; Schema: public; Owner: directus
--

CREATE SEQUENCE public.directus_activity_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.directus_activity_id_seq OWNER TO directus;

--
-- Name: directus_activity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: directus
--

ALTER SEQUENCE public.directus_activity_id_seq OWNED BY public.directus_activity.id;


--
-- Name: directus_collections; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_collections (
    collection character varying(64) NOT NULL,
    icon character varying(64),
    note text,
    display_template character varying(255),
    hidden boolean DEFAULT false NOT NULL,
    singleton boolean DEFAULT false NOT NULL,
    translations json,
    archive_field character varying(64),
    archive_app_filter boolean DEFAULT true NOT NULL,
    archive_value character varying(255),
    unarchive_value character varying(255),
    sort_field character varying(64),
    accountability character varying(255) DEFAULT 'all'::character varying,
    color character varying(255),
    item_duplication_fields json,
    sort integer,
    "group" character varying(64),
    collapse character varying(255) DEFAULT 'open'::character varying NOT NULL,
    preview_url character varying(255),
    versioning boolean DEFAULT false NOT NULL
);


ALTER TABLE public.directus_collections OWNER TO directus;

--
-- Name: directus_comments; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_comments (
    id uuid NOT NULL,
    collection character varying(64) NOT NULL,
    item character varying(255) NOT NULL,
    comment text NOT NULL,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    date_updated timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created uuid,
    user_updated uuid
);


ALTER TABLE public.directus_comments OWNER TO directus;

--
-- Name: directus_dashboards; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_dashboards (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    icon character varying(64) DEFAULT 'dashboard'::character varying NOT NULL,
    note text,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created uuid,
    color character varying(255)
);


ALTER TABLE public.directus_dashboards OWNER TO directus;

--
-- Name: directus_extensions; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_extensions (
    enabled boolean DEFAULT true NOT NULL,
    id uuid NOT NULL,
    folder character varying(255) NOT NULL,
    source character varying(255) NOT NULL,
    bundle uuid
);


ALTER TABLE public.directus_extensions OWNER TO directus;

--
-- Name: directus_fields; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_fields (
    id integer NOT NULL,
    collection character varying(64) NOT NULL,
    field character varying(64) NOT NULL,
    special character varying(64),
    interface character varying(64),
    options json,
    display character varying(64),
    display_options json,
    readonly boolean DEFAULT false NOT NULL,
    hidden boolean DEFAULT false NOT NULL,
    sort integer,
    width character varying(30) DEFAULT 'full'::character varying,
    translations json,
    note text,
    conditions json,
    required boolean DEFAULT false,
    "group" character varying(64),
    validation json,
    validation_message text
);


ALTER TABLE public.directus_fields OWNER TO directus;

--
-- Name: directus_fields_id_seq; Type: SEQUENCE; Schema: public; Owner: directus
--

CREATE SEQUENCE public.directus_fields_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.directus_fields_id_seq OWNER TO directus;

--
-- Name: directus_fields_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: directus
--

ALTER SEQUENCE public.directus_fields_id_seq OWNED BY public.directus_fields.id;


--
-- Name: directus_files; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_files (
    id uuid NOT NULL,
    storage character varying(255) NOT NULL,
    filename_disk character varying(255),
    filename_download character varying(255) NOT NULL,
    title character varying(255),
    type character varying(255),
    folder uuid,
    uploaded_by uuid,
    created_on timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    modified_by uuid,
    modified_on timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    charset character varying(50),
    filesize bigint,
    width integer,
    height integer,
    duration integer,
    embed character varying(200),
    description text,
    location text,
    tags text,
    metadata json,
    focal_point_x integer,
    focal_point_y integer,
    tus_id character varying(64),
    tus_data json,
    uploaded_on timestamp with time zone
);


ALTER TABLE public.directus_files OWNER TO directus;

--
-- Name: directus_flows; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_flows (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    icon character varying(64),
    color character varying(255),
    description text,
    status character varying(255) DEFAULT 'active'::character varying NOT NULL,
    trigger character varying(255),
    accountability character varying(255) DEFAULT 'all'::character varying,
    options json,
    operation uuid,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created uuid
);


ALTER TABLE public.directus_flows OWNER TO directus;

--
-- Name: directus_folders; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_folders (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    parent uuid
);


ALTER TABLE public.directus_folders OWNER TO directus;

--
-- Name: directus_migrations; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_migrations (
    version character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    "timestamp" timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.directus_migrations OWNER TO directus;

--
-- Name: directus_notifications; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_notifications (
    id integer NOT NULL,
    "timestamp" timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    status character varying(255) DEFAULT 'inbox'::character varying,
    recipient uuid NOT NULL,
    sender uuid,
    subject character varying(255) NOT NULL,
    message text,
    collection character varying(64),
    item character varying(255)
);


ALTER TABLE public.directus_notifications OWNER TO directus;

--
-- Name: directus_notifications_id_seq; Type: SEQUENCE; Schema: public; Owner: directus
--

CREATE SEQUENCE public.directus_notifications_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.directus_notifications_id_seq OWNER TO directus;

--
-- Name: directus_notifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: directus
--

ALTER SEQUENCE public.directus_notifications_id_seq OWNED BY public.directus_notifications.id;


--
-- Name: directus_operations; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_operations (
    id uuid NOT NULL,
    name character varying(255),
    key character varying(255) NOT NULL,
    type character varying(255) NOT NULL,
    position_x integer NOT NULL,
    position_y integer NOT NULL,
    options json,
    resolve uuid,
    reject uuid,
    flow uuid NOT NULL,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created uuid
);


ALTER TABLE public.directus_operations OWNER TO directus;

--
-- Name: directus_panels; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_panels (
    id uuid NOT NULL,
    dashboard uuid NOT NULL,
    name character varying(255),
    icon character varying(64) DEFAULT NULL::character varying,
    color character varying(10),
    show_header boolean DEFAULT false NOT NULL,
    note text,
    type character varying(255) NOT NULL,
    position_x integer NOT NULL,
    position_y integer NOT NULL,
    width integer NOT NULL,
    height integer NOT NULL,
    options json,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created uuid
);


ALTER TABLE public.directus_panels OWNER TO directus;

--
-- Name: directus_permissions; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_permissions (
    id integer NOT NULL,
    collection character varying(64) NOT NULL,
    action character varying(10) NOT NULL,
    permissions json,
    validation json,
    presets json,
    fields text,
    policy uuid NOT NULL
);


ALTER TABLE public.directus_permissions OWNER TO directus;

--
-- Name: directus_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: directus
--

CREATE SEQUENCE public.directus_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.directus_permissions_id_seq OWNER TO directus;

--
-- Name: directus_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: directus
--

ALTER SEQUENCE public.directus_permissions_id_seq OWNED BY public.directus_permissions.id;


--
-- Name: directus_policies; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_policies (
    id uuid NOT NULL,
    name character varying(100) NOT NULL,
    icon character varying(64) DEFAULT 'badge'::character varying NOT NULL,
    description text,
    ip_access text,
    enforce_tfa boolean DEFAULT false NOT NULL,
    admin_access boolean DEFAULT false NOT NULL,
    app_access boolean DEFAULT false NOT NULL
);


ALTER TABLE public.directus_policies OWNER TO directus;

--
-- Name: directus_presets; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_presets (
    id integer NOT NULL,
    bookmark character varying(255),
    "user" uuid,
    role uuid,
    collection character varying(64),
    search character varying(100),
    layout character varying(100) DEFAULT 'tabular'::character varying,
    layout_query json,
    layout_options json,
    refresh_interval integer,
    filter json,
    icon character varying(64) DEFAULT 'bookmark'::character varying,
    color character varying(255)
);


ALTER TABLE public.directus_presets OWNER TO directus;

--
-- Name: directus_presets_id_seq; Type: SEQUENCE; Schema: public; Owner: directus
--

CREATE SEQUENCE public.directus_presets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.directus_presets_id_seq OWNER TO directus;

--
-- Name: directus_presets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: directus
--

ALTER SEQUENCE public.directus_presets_id_seq OWNED BY public.directus_presets.id;


--
-- Name: directus_relations; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_relations (
    id integer NOT NULL,
    many_collection character varying(64) NOT NULL,
    many_field character varying(64) NOT NULL,
    one_collection character varying(64),
    one_field character varying(64),
    one_collection_field character varying(64),
    one_allowed_collections text,
    junction_field character varying(64),
    sort_field character varying(64),
    one_deselect_action character varying(255) DEFAULT 'nullify'::character varying NOT NULL
);


ALTER TABLE public.directus_relations OWNER TO directus;

--
-- Name: directus_relations_id_seq; Type: SEQUENCE; Schema: public; Owner: directus
--

CREATE SEQUENCE public.directus_relations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.directus_relations_id_seq OWNER TO directus;

--
-- Name: directus_relations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: directus
--

ALTER SEQUENCE public.directus_relations_id_seq OWNED BY public.directus_relations.id;


--
-- Name: directus_revisions; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_revisions (
    id integer NOT NULL,
    activity integer NOT NULL,
    collection character varying(64) NOT NULL,
    item character varying(255) NOT NULL,
    data json,
    delta json,
    parent integer,
    version uuid
);


ALTER TABLE public.directus_revisions OWNER TO directus;

--
-- Name: directus_revisions_id_seq; Type: SEQUENCE; Schema: public; Owner: directus
--

CREATE SEQUENCE public.directus_revisions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.directus_revisions_id_seq OWNER TO directus;

--
-- Name: directus_revisions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: directus
--

ALTER SEQUENCE public.directus_revisions_id_seq OWNED BY public.directus_revisions.id;


--
-- Name: directus_roles; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_roles (
    id uuid NOT NULL,
    name character varying(100) NOT NULL,
    icon character varying(64) DEFAULT 'supervised_user_circle'::character varying NOT NULL,
    description text,
    parent uuid
);


ALTER TABLE public.directus_roles OWNER TO directus;

--
-- Name: directus_sessions; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_sessions (
    token character varying(64) NOT NULL,
    "user" uuid,
    expires timestamp with time zone NOT NULL,
    ip character varying(255),
    user_agent text,
    share uuid,
    origin character varying(255),
    next_token character varying(64)
);


ALTER TABLE public.directus_sessions OWNER TO directus;

--
-- Name: directus_settings; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_settings (
    id integer NOT NULL,
    project_name character varying(100) DEFAULT 'Directus'::character varying NOT NULL,
    project_url character varying(255),
    project_color character varying(255) DEFAULT '#6644FF'::character varying NOT NULL,
    project_logo uuid,
    public_foreground uuid,
    public_background uuid,
    public_note text,
    auth_login_attempts integer DEFAULT 25,
    auth_password_policy character varying(100),
    storage_asset_transform character varying(7) DEFAULT 'all'::character varying,
    storage_asset_presets json,
    custom_css text,
    storage_default_folder uuid,
    basemaps json,
    mapbox_key character varying(255),
    module_bar json,
    project_descriptor character varying(100),
    default_language character varying(255) DEFAULT 'en-US'::character varying NOT NULL,
    custom_aspect_ratios json,
    public_favicon uuid,
    default_appearance character varying(255) DEFAULT 'auto'::character varying NOT NULL,
    default_theme_light character varying(255),
    theme_light_overrides json,
    default_theme_dark character varying(255),
    theme_dark_overrides json,
    report_error_url character varying(255),
    report_bug_url character varying(255),
    report_feature_url character varying(255),
    public_registration boolean DEFAULT false NOT NULL,
    public_registration_verify_email boolean DEFAULT true NOT NULL,
    public_registration_role uuid,
    public_registration_email_filter json
);


ALTER TABLE public.directus_settings OWNER TO directus;

--
-- Name: directus_settings_id_seq; Type: SEQUENCE; Schema: public; Owner: directus
--

CREATE SEQUENCE public.directus_settings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.directus_settings_id_seq OWNER TO directus;

--
-- Name: directus_settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: directus
--

ALTER SEQUENCE public.directus_settings_id_seq OWNED BY public.directus_settings.id;


--
-- Name: directus_shares; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_shares (
    id uuid NOT NULL,
    name character varying(255),
    collection character varying(64) NOT NULL,
    item character varying(255) NOT NULL,
    role uuid,
    password character varying(255),
    user_created uuid,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    date_start timestamp with time zone,
    date_end timestamp with time zone,
    times_used integer DEFAULT 0,
    max_uses integer
);


ALTER TABLE public.directus_shares OWNER TO directus;

--
-- Name: directus_translations; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_translations (
    id uuid NOT NULL,
    language character varying(255) NOT NULL,
    key character varying(255) NOT NULL,
    value text NOT NULL
);


ALTER TABLE public.directus_translations OWNER TO directus;

--
-- Name: directus_users; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_users (
    id uuid NOT NULL,
    first_name character varying(50),
    last_name character varying(50),
    email character varying(128),
    password character varying(255),
    location character varying(255),
    title character varying(50),
    description text,
    tags json,
    avatar uuid,
    language character varying(255) DEFAULT NULL::character varying,
    tfa_secret character varying(255),
    status character varying(16) DEFAULT 'active'::character varying NOT NULL,
    role uuid,
    token character varying(255),
    last_access timestamp with time zone,
    last_page character varying(255),
    provider character varying(128) DEFAULT 'default'::character varying NOT NULL,
    external_identifier character varying(255),
    auth_data json,
    email_notifications boolean DEFAULT true,
    appearance character varying(255),
    theme_dark character varying(255),
    theme_light character varying(255),
    theme_light_overrides json,
    theme_dark_overrides json
);


ALTER TABLE public.directus_users OWNER TO directus;

--
-- Name: directus_versions; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_versions (
    id uuid NOT NULL,
    key character varying(64) NOT NULL,
    name character varying(255),
    collection character varying(64) NOT NULL,
    item character varying(255) NOT NULL,
    hash character varying(255),
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    date_updated timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created uuid,
    user_updated uuid,
    delta json
);


ALTER TABLE public.directus_versions OWNER TO directus;

--
-- Name: directus_webhooks; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_webhooks (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    method character varying(10) DEFAULT 'POST'::character varying NOT NULL,
    url character varying(255) NOT NULL,
    status character varying(10) DEFAULT 'active'::character varying NOT NULL,
    data boolean DEFAULT true NOT NULL,
    actions character varying(100) NOT NULL,
    collections character varying(255) NOT NULL,
    headers json,
    was_active_before_deprecation boolean DEFAULT false NOT NULL,
    migrated_flow uuid
);


ALTER TABLE public.directus_webhooks OWNER TO directus;

--
-- Name: directus_webhooks_id_seq; Type: SEQUENCE; Schema: public; Owner: directus
--

CREATE SEQUENCE public.directus_webhooks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.directus_webhooks_id_seq OWNER TO directus;

--
-- Name: directus_webhooks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: directus
--

ALTER SEQUENCE public.directus_webhooks_id_seq OWNED BY public.directus_webhooks.id;


--
-- Name: feature_section; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.feature_section (
    id integer NOT NULL,
    heading json,
    bg_img uuid
);


ALTER TABLE public.feature_section OWNER TO directus;

--
-- Name: feature_section_id_seq; Type: SEQUENCE; Schema: public; Owner: directus
--

CREATE SEQUENCE public.feature_section_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.feature_section_id_seq OWNER TO directus;

--
-- Name: feature_section_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: directus
--

ALTER SEQUENCE public.feature_section_id_seq OWNED BY public.feature_section.id;


--
-- Name: footer; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.footer (
    id integer NOT NULL,
    category json,
    social_icons json
);


ALTER TABLE public.footer OWNER TO directus;

--
-- Name: footer_files; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.footer_files (
    id integer NOT NULL,
    footer_id integer,
    directus_files_id uuid
);


ALTER TABLE public.footer_files OWNER TO directus;

--
-- Name: footer_files_id_seq; Type: SEQUENCE; Schema: public; Owner: directus
--

CREATE SEQUENCE public.footer_files_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.footer_files_id_seq OWNER TO directus;

--
-- Name: footer_files_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: directus
--

ALTER SEQUENCE public.footer_files_id_seq OWNED BY public.footer_files.id;


--
-- Name: footer_id_seq; Type: SEQUENCE; Schema: public; Owner: directus
--

CREATE SEQUENCE public.footer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.footer_id_seq OWNER TO directus;

--
-- Name: footer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: directus
--

ALTER SEQUENCE public.footer_id_seq OWNED BY public.footer.id;


--
-- Name: footer_social_icons; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.footer_social_icons (
    id integer NOT NULL,
    image uuid
);


ALTER TABLE public.footer_social_icons OWNER TO directus;

--
-- Name: footer_social_icons_id_seq; Type: SEQUENCE; Schema: public; Owner: directus
--

CREATE SEQUENCE public.footer_social_icons_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.footer_social_icons_id_seq OWNER TO directus;

--
-- Name: footer_social_icons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: directus
--

ALTER SEQUENCE public.footer_social_icons_id_seq OWNED BY public.footer_social_icons.id;


--
-- Name: header; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.header (
    id integer NOT NULL,
    title character varying(255),
    slug character varying(255)
);


ALTER TABLE public.header OWNER TO directus;

--
-- Name: header_id_seq; Type: SEQUENCE; Schema: public; Owner: directus
--

CREATE SEQUENCE public.header_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.header_id_seq OWNER TO directus;

--
-- Name: header_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: directus
--

ALTER SEQUENCE public.header_id_seq OWNED BY public.header.id;


--
-- Name: hero_section; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.hero_section (
    id integer NOT NULL,
    sort integer,
    bg_img uuid,
    heading character varying(255),
    sub_heading character varying(255),
    button_text json,
    "Lists" json
);


ALTER TABLE public.hero_section OWNER TO directus;

--
-- Name: hero_section_id_seq; Type: SEQUENCE; Schema: public; Owner: directus
--

CREATE SEQUENCE public.hero_section_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.hero_section_id_seq OWNER TO directus;

--
-- Name: hero_section_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: directus
--

ALTER SEQUENCE public.hero_section_id_seq OWNED BY public.hero_section.id;


--
-- Name: accessories id; Type: DEFAULT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.accessories ALTER COLUMN id SET DEFAULT nextval('public.accessories_id_seq'::regclass);


--
-- Name: accessories_files id; Type: DEFAULT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.accessories_files ALTER COLUMN id SET DEFAULT nextval('public.accessories_files_id_seq'::regclass);


--
-- Name: accessories_type id; Type: DEFAULT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.accessories_type ALTER COLUMN id SET DEFAULT nextval('public.accessories_type_id_seq'::regclass);


--
-- Name: directus_activity id; Type: DEFAULT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_activity ALTER COLUMN id SET DEFAULT nextval('public.directus_activity_id_seq'::regclass);


--
-- Name: directus_fields id; Type: DEFAULT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_fields ALTER COLUMN id SET DEFAULT nextval('public.directus_fields_id_seq'::regclass);


--
-- Name: directus_notifications id; Type: DEFAULT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_notifications ALTER COLUMN id SET DEFAULT nextval('public.directus_notifications_id_seq'::regclass);


--
-- Name: directus_permissions id; Type: DEFAULT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_permissions ALTER COLUMN id SET DEFAULT nextval('public.directus_permissions_id_seq'::regclass);


--
-- Name: directus_presets id; Type: DEFAULT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_presets ALTER COLUMN id SET DEFAULT nextval('public.directus_presets_id_seq'::regclass);


--
-- Name: directus_relations id; Type: DEFAULT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_relations ALTER COLUMN id SET DEFAULT nextval('public.directus_relations_id_seq'::regclass);


--
-- Name: directus_revisions id; Type: DEFAULT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_revisions ALTER COLUMN id SET DEFAULT nextval('public.directus_revisions_id_seq'::regclass);


--
-- Name: directus_settings id; Type: DEFAULT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_settings ALTER COLUMN id SET DEFAULT nextval('public.directus_settings_id_seq'::regclass);


--
-- Name: directus_webhooks id; Type: DEFAULT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_webhooks ALTER COLUMN id SET DEFAULT nextval('public.directus_webhooks_id_seq'::regclass);


--
-- Name: feature_section id; Type: DEFAULT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.feature_section ALTER COLUMN id SET DEFAULT nextval('public.feature_section_id_seq'::regclass);


--
-- Name: footer id; Type: DEFAULT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.footer ALTER COLUMN id SET DEFAULT nextval('public.footer_id_seq'::regclass);


--
-- Name: footer_files id; Type: DEFAULT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.footer_files ALTER COLUMN id SET DEFAULT nextval('public.footer_files_id_seq'::regclass);


--
-- Name: footer_social_icons id; Type: DEFAULT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.footer_social_icons ALTER COLUMN id SET DEFAULT nextval('public.footer_social_icons_id_seq'::regclass);


--
-- Name: header id; Type: DEFAULT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.header ALTER COLUMN id SET DEFAULT nextval('public.header_id_seq'::regclass);


--
-- Name: hero_section id; Type: DEFAULT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.hero_section ALTER COLUMN id SET DEFAULT nextval('public.hero_section_id_seq'::regclass);


--
-- Data for Name: accessories; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.accessories (id, heading, sub_heading, price, type, main_image) FROM stdin;
3	26 TIG Torch	Velit velit amet lacus a sem felis. Blandit hendrerit imperdiet turpis purus	999	2	e74a1d3b-51c7-4aaa-9d8a-6f9e0b66c4b6
4	machine	Velit velit amet lacus a sem felis. Blandit hendrerit imperdiet turpis purus	1999	3	88e27c2c-5994-40d4-a1b5-f73792f84608
5	18 WC TIG Torch	Velit velit amet lacus a sem felis. Blandit hendrerit imperdiet turpis purus	1999	3	88e27c2c-5994-40d4-a1b5-f73792f84608
6	Plasma Torch	Velit velit amet lacus a sem felis. Blandit hendrerit imperdiet turpis purus	1000	2	88e27c2c-5994-40d4-a1b5-f73792f84608
7	Push-Pull Torch	Velit velit amet lacus a sem felis. Blandit hendrerit imperdiet turpis purus	1009	3	e74a1d3b-51c7-4aaa-9d8a-6f9e0b66c4b6
8	Spool Gun	Velit velit amet lacus a sem felis. Blandit hendrerit imperdiet turpis purus	1999	2	fa387a8b-bb5f-447a-a550-2e89d6f66365
9	MMA Torch	Velit velit amet lacus a sem felis. Blandit hendrerit imperdiet turpis purus	799	2	88e27c2c-5994-40d4-a1b5-f73792f84608
10	36 WC MIG Torch	Velit velit amet lacus a sem felis. Blandit hendrerit imperdiet turpis purus	899	2	88e27c2c-5994-40d4-a1b5-f73792f84608
11	MMA Torch	Velit velit amet lacus a sem felis. Blandit hendrerit imperdiet turpis purus	999	3	5d37f41b-7aad-49fd-8667-c4dfcec743da
2	36 WC MIG Torch	Velit velit amet lacus a sem felis. Blandit hendrerit imperdiet turpis purus	1099	2	fa387a8b-bb5f-447a-a550-2e89d6f66365
\.


--
-- Data for Name: accessories_files; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.accessories_files (id, accessories_id, directus_files_id) FROM stdin;
4	3	eff018c2-0258-444b-bc82-6b422d9a0406
5	3	f7260eca-814a-44f4-8ea3-0f875b0f97b1
6	3	4fbbe243-5c7d-49a3-9851-d1d6f96aef51
7	3	c70383cb-f76a-4eec-866f-2a22b593cc34
8	3	53e4a952-f407-43ca-b43e-6fab99c32186
9	3	9d93b3af-7085-45bc-970a-26721b04ef40
10	4	b05ce73f-b76f-4248-91b6-e71df2360d8f
11	4	cb8682cd-b80d-4658-895d-f47dc8a9c23a
12	4	6bef1de6-3665-471c-ba4b-d32ed83ce9bc
1	\N	eff018c2-0258-444b-bc82-6b422d9a0406
2	\N	f7260eca-814a-44f4-8ea3-0f875b0f97b1
3	\N	c70383cb-f76a-4eec-866f-2a22b593cc34
13	2	dea5add6-517b-416b-ad89-3ab128143b23
14	2	f1418393-8118-4161-88f4-1df01313003a
15	2	baad0908-6731-47af-9a0b-71f1398a0502
16	2	dab41adf-1f8b-41c9-bd15-73e587a9a286
17	5	92bea263-2997-4b8a-b8a6-d920d8d9c895
18	5	4dbb5c1e-c066-438f-a907-74d197b6df0e
19	5	99b1444f-d6be-4731-a71e-1a091c5ec3fc
20	5	8014f172-e017-4d41-9cde-c31ea0562ef3
21	6	4dbb5c1e-c066-438f-a907-74d197b6df0e
22	6	baad0908-6731-47af-9a0b-71f1398a0502
23	6	99b1444f-d6be-4731-a71e-1a091c5ec3fc
24	6	6bef1de6-3665-471c-ba4b-d32ed83ce9bc
25	7	4dbb5c1e-c066-438f-a907-74d197b6df0e
26	7	baad0908-6731-47af-9a0b-71f1398a0502
27	8	8014f172-e017-4d41-9cde-c31ea0562ef3
28	8	baad0908-6731-47af-9a0b-71f1398a0502
29	8	dab41adf-1f8b-41c9-bd15-73e587a9a286
30	9	b05ce73f-b76f-4248-91b6-e71df2360d8f
31	9	6bef1de6-3665-471c-ba4b-d32ed83ce9bc
32	9	cb8682cd-b80d-4658-895d-f47dc8a9c23a
33	9	f7260eca-814a-44f4-8ea3-0f875b0f97b1
34	10	c70383cb-f76a-4eec-866f-2a22b593cc34
35	10	dab41adf-1f8b-41c9-bd15-73e587a9a286
36	11	6bef1de6-3665-471c-ba4b-d32ed83ce9bc
37	11	92bea263-2997-4b8a-b8a6-d920d8d9c895
38	11	99b1444f-d6be-4731-a71e-1a091c5ec3fc
\.


--
-- Data for Name: accessories_type; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.accessories_type (id, type, image) FROM stdin;
2	Torches	a5b5e1c0-98b1-4885-add5-aa708433b615
3	Machine Accessories	f79cc4e0-ef7f-4a26-a52a-1d018bb0808b
1	All	405c8b4c-933f-42cd-9121-8f31eb516a87
\.


--
-- Data for Name: directus_access; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_access (id, role, "user", policy, sort) FROM stdin;
94f32e11-c221-4b6f-9c3f-d5133f8089bc	bf6d7676-be1a-4615-a5d8-71760789aa47	\N	89c77a9a-7220-4886-b2dd-2f222280b158	\N
707ad5f5-982e-4459-a955-f16c1fdcfe22	\N	\N	abf8a154-5b1c-4a46-ac9c-7300570f4f17	1
\.


--
-- Data for Name: directus_activity; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, origin) FROM stdin;
1	login	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-07 12:34:15.834+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_users	10c73097-e1f9-4f52-9007-ac783d8d74e9	http://localhost:8055
2	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-07 12:35:10.191+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	1	http://localhost:8055
3	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-07 12:35:10.216+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	header	http://localhost:8055
4	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-07 12:35:35.068+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	2	http://localhost:8055
5	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-07 12:35:53.263+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	3	http://localhost:8055
6	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-07 12:36:07.1+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	2	http://localhost:8055
7	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-07 12:36:09.552+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	3	http://localhost:8055
8	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-07 12:37:23.804+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	header	1	http://localhost:8055
9	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-07 12:38:05.117+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	header	2	http://localhost:8055
10	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-07 12:38:48.822+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	header	3	http://localhost:8055
11	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-07 12:39:09.15+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	header	4	http://localhost:8055
12	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-07 12:39:44.203+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_permissions	1	http://localhost:8055
13	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-07 12:39:44.238+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_policies	abf8a154-5b1c-4a46-ac9c-7300570f4f17	http://localhost:8055
14	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-07 12:47:30.681+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	4	http://localhost:8055
15	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-07 12:47:30.743+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	footer	http://localhost:8055
16	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-07 12:49:45.904+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	5	http://localhost:8055
17	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-07 12:53:39.681+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	5	http://localhost:8055
18	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-07 13:02:32.484+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	6	http://localhost:8055
19	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-07 13:02:38.931+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	6	http://localhost:8055
25	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-07 13:14:46.818+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_permissions	2	http://localhost:8055
26	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-07 13:14:46.871+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_policies	abf8a154-5b1c-4a46-ac9c-7300570f4f17	http://localhost:8055
27	delete	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-07 13:23:28.683+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	footer	http://localhost:8055
28	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-07 13:23:38.758+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	7	http://localhost:8055
29	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-07 13:23:38.81+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	footer	http://localhost:8055
30	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-07 13:24:36.388+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	8	http://localhost:8055
31	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-07 13:26:33.479+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	9	http://localhost:8055
32	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-07 13:28:04.909+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	10	http://localhost:8055
35	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-07 13:29:53.516+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	11	http://localhost:8055
36	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-07 13:29:53.534+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	footer_options	http://localhost:8055
37	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-07 13:31:13.881+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	12	http://localhost:8055
38	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-07 13:31:14.134+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	13	http://localhost:8055
39	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-07 13:31:14.151+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	footer_options_undefined	http://localhost:8055
40	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-07 13:31:14.364+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	14	http://localhost:8055
41	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-07 13:31:14.677+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	15	http://localhost:8055
42	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-07 13:31:15.296+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	16	http://localhost:8055
43	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-07 13:31:24.079+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	17	http://localhost:8055
44	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-07 13:31:33.49+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	18	http://localhost:8055
48	delete	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-07 13:33:39.027+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	footer_options_undefined	http://localhost:8055
49	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-07 13:35:11.648+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	19	http://localhost:8055
51	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-07 13:37:40.508+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	20	http://localhost:8055
52	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-07 13:37:40.523+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	user	http://localhost:8055
53	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-07 13:37:47.797+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	21	http://localhost:8055
54	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-07 13:37:53.721+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	22	http://localhost:8055
56	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-07 13:38:54.896+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	23	http://localhost:8055
57	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-07 13:38:54.907+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	fav_things	http://localhost:8055
58	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-07 13:39:09.227+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	24	http://localhost:8055
64	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-07 13:40:40.144+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	25	http://localhost:8055
65	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-07 13:49:54.533+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	26	http://localhost:8055
66	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-07 13:49:54.556+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	things_user_map	http://localhost:8055
67	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-07 13:51:22.684+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	27	http://localhost:8055
68	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-07 13:51:58.6+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	28	http://localhost:8055
69	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-07 13:51:58.967+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	29	http://localhost:8055
70	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-07 13:51:59.03+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	things_user_map_test	http://localhost:8055
71	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-07 13:51:59.431+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	30	http://localhost:8055
72	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-07 13:51:59.688+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	31	http://localhost:8055
73	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-07 13:52:00.081+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	32	http://localhost:8055
92	delete	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-07 14:00:39.832+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	fav_things	http://localhost:8055
80	delete	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-07 13:52:58.287+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	things_user_map_test	http://localhost:8055
81	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-07 13:53:40.769+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	33	http://localhost:8055
82	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-07 13:54:02.554+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	34	http://localhost:8055
89	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-07 13:55:53.056+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	33	http://localhost:8055
90	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-07 13:57:24.654+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	12	http://localhost:8055
93	delete	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-07 14:01:19.519+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	footer	http://localhost:8055
94	delete	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-07 14:01:23.957+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	footer_options	http://localhost:8055
95	delete	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-07 14:01:38.394+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	things_user_map	http://localhost:8055
96	delete	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-07 14:01:41.479+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	user	http://localhost:8055
97	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-07 14:04:06.834+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	35	http://localhost:8055
98	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-07 14:04:06.849+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	footer_category	http://localhost:8055
99	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-07 14:04:22.154+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	36	http://localhost:8055
102	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-07 14:09:28.246+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	37	http://localhost:8055
103	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-07 14:09:28.262+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	footer_options	http://localhost:8055
104	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-07 14:11:11.508+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	38	http://localhost:8055
105	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-07 14:12:45.217+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	39	http://localhost:8055
106	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-07 14:18:32.962+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	40	http://localhost:8055
107	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-07 14:19:09.094+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	40	http://localhost:8055
108	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-07 14:19:53.631+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	40	http://localhost:8055
109	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-07 14:21:10.019+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	40	http://localhost:8055
110	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-07 14:22:25.403+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	41	http://localhost:8055
111	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-07 14:22:34.793+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	42	http://localhost:8055
126	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-07 14:32:47.824+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_permissions	3	http://localhost:8055
127	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-07 14:32:47.938+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_permissions	4	http://localhost:8055
128	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-07 14:32:47.959+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_policies	abf8a154-5b1c-4a46-ac9c-7300570f4f17	http://localhost:8055
129	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-07 17:05:51.129+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	43	http://localhost:8055
130	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-07 17:05:51.174+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	footer_payment	http://localhost:8055
131	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-07 17:07:55.927+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	44	http://localhost:8055
132	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-07 17:11:59.82+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	aa23ba5d-a8ba-4fe5-be6d-a083127753bf	http://localhost:8055
133	delete	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-07 17:11:59.925+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	aa23ba5d-a8ba-4fe5-be6d-a083127753bf	http://localhost:8055
134	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-07 17:12:41.384+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	bb7bc0e9-041f-4927-8978-19ff8e4bc3e7	http://localhost:8055
135	delete	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-07 17:12:41.412+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	bb7bc0e9-041f-4927-8978-19ff8e4bc3e7	http://localhost:8055
136	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-07 17:20:20.392+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	921e244c-af89-4656-8342-9be852694e8a	http://localhost:8055
137	delete	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-07 17:20:20.478+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	921e244c-af89-4656-8342-9be852694e8a	http://localhost:8055
138	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-07 17:22:27.309+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	3cab4ff4-8fc7-4694-aece-a576037b8917	http://localhost:8055
139	delete	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-07 17:22:27.389+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	3cab4ff4-8fc7-4694-aece-a576037b8917	http://localhost:8055
140	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-07 17:22:39.597+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	3004340e-8d0f-4a9d-ad05-c868d2caf718	http://localhost:8055
141	delete	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-07 17:22:39.662+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	3004340e-8d0f-4a9d-ad05-c868d2caf718	http://localhost:8055
142	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-07 17:22:47.771+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	1bcbb62a-555b-44cd-801d-e1ad5d576297	http://localhost:8055
143	delete	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-07 17:22:47.793+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	1bcbb62a-555b-44cd-801d-e1ad5d576297	http://localhost:8055
144	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-07 17:28:17.776+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	44	http://localhost:8055
145	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-07 17:29:29.952+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	621d21b0-e062-404f-ba24-274dba50c612	http://localhost:8055
146	delete	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-07 17:29:29.974+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	621d21b0-e062-404f-ba24-274dba50c612	http://localhost:8055
147	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-07 17:30:18.082+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	964faff6-77e3-48f6-8d42-2aed544c63e1	http://localhost:8055
148	delete	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-07 17:30:18.103+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	964faff6-77e3-48f6-8d42-2aed544c63e1	http://localhost:8055
149	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-07 17:33:10.738+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	fabfdd9b-fa75-4f77-a78c-6ccadf12148f	http://localhost:8055
150	delete	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-07 17:33:10.787+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	fabfdd9b-fa75-4f77-a78c-6ccadf12148f	http://localhost:8055
151	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 07:21:43.879+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	44	http://localhost:8055
152	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 07:21:54.419+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	4a788cf0-1f2b-40cb-b5ea-fcb95dda5ea3	http://localhost:8055
153	delete	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 07:21:54.481+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	4a788cf0-1f2b-40cb-b5ea-fcb95dda5ea3	http://localhost:8055
154	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 07:51:33.882+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	30da001e-5f30-4811-9351-67b36b802bc0	http://localhost:8055
155	delete	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 07:51:34.068+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	30da001e-5f30-4811-9351-67b36b802bc0	http://localhost:8055
156	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 08:02:26.515+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	4368cb7a-b475-4c58-af55-accbfe293a8d	http://localhost:8055
157	delete	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 08:02:26.755+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	4368cb7a-b475-4c58-af55-accbfe293a8d	http://localhost:8055
158	delete	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 08:02:46.865+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	footer_payment	http://localhost:8055
159	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 08:03:00.696+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	45	http://localhost:8055
160	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 08:03:00.766+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	footer_payment	http://localhost:8055
161	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 08:03:25.502+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	46	http://localhost:8055
162	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 08:03:54.611+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	47	http://localhost:8055
163	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 08:04:03.638+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	46	http://localhost:8055
164	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 08:04:05.685+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	47	http://localhost:8055
165	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 08:04:29.599+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	e1a2a9f7-bb44-4d1e-a5d5-398ad0953ba9	http://localhost:8055
166	delete	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 08:04:29.753+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	e1a2a9f7-bb44-4d1e-a5d5-398ad0953ba9	http://localhost:8055
167	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 08:21:26.327+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	48	http://localhost:8055
168	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 08:21:26.374+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	footer_bottom	http://localhost:8055
169	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 08:22:11.469+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	49	http://localhost:8055
170	delete	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 08:23:44.79+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	footer_bottom	http://localhost:8055
171	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 08:25:57.558+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	50	http://localhost:8055
172	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 08:25:57.588+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	footer_legal	http://localhost:8055
173	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 08:26:19.275+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	51	http://localhost:8055
174	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 08:26:23.423+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	51	http://localhost:8055
175	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 08:26:26.842+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	51	http://localhost:8055
177	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 08:30:08.805+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	52	http://localhost:8055
178	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 08:30:08.855+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	footer_img	http://localhost:8055
179	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 08:34:13.233+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	53	http://localhost:8055
180	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 08:34:48.7+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	54	http://localhost:8055
181	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 08:35:07.56+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	55	http://localhost:8055
182	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 08:35:21.193+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	53	http://localhost:8055
183	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 08:35:25.049+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	54	http://localhost:8055
184	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 08:35:43.314+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	1f84b4b3-7ff9-481b-9d40-e40bc8b3994b	http://localhost:8055
185	delete	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 08:35:43.393+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	1f84b4b3-7ff9-481b-9d40-e40bc8b3994b	http://localhost:8055
186	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 08:37:54.327+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	0080df53-00fd-4835-a135-1918a5408e3a	http://localhost:8055
187	delete	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 08:37:54.431+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	0080df53-00fd-4835-a135-1918a5408e3a	http://localhost:8055
188	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 08:40:44.068+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	1d6477c8-91ba-4a9a-bb76-9b7ca53bede6	http://localhost:8055
189	delete	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 08:40:44.171+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	1d6477c8-91ba-4a9a-bb76-9b7ca53bede6	http://localhost:8055
190	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 09:01:01.896+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	cc353a63-8ab9-4939-91ef-f676d17b974e	http://localhost:8055
191	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 09:05:44.68+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	a793b016-2c16-4129-86d1-163b00b8b8bf	http://localhost:8055
192	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 09:08:42.321+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	56	http://localhost:8055
193	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 09:08:42.348+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	footer_constant	http://localhost:8055
194	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 09:08:57.082+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	57	http://localhost:8055
195	delete	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 09:09:44.667+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	footer_constant	http://localhost:8055
196	delete	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 09:10:00.641+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	footer_legal	http://localhost:8055
197	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 09:13:30.039+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	11d8ff7d-85ef-4f52-a1e6-0512a56069e1	http://localhost:8055
199	delete	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 09:19:04.79+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	footer_img	http://localhost:8055
200	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 09:19:14.686+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	58	http://localhost:8055
201	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 09:19:14.712+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	footer_img	http://localhost:8055
202	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 09:20:53.093+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	59	http://localhost:8055
203	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 09:21:04.107+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	60	http://localhost:8055
204	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 09:21:54.832+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	61	http://localhost:8055
205	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 09:22:15.388+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	62	http://localhost:8055
206	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 09:24:43.622+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	63	http://localhost:8055
208	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 09:26:51.336+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	4a14cc70-8e7b-4f99-99c4-70cb9aa19871	http://localhost:8055
210	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 09:27:17.849+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	af5b8b78-b8ec-46df-98c4-e96733b0df96	http://localhost:8055
212	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 09:28:34.521+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	f7b80867-d7db-4f11-9858-43e7eb2ec32f	http://localhost:8055
214	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 09:29:34.366+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	4e8f51fb-20af-4626-b706-7e81d56ed082	http://localhost:8055
216	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 09:29:59.851+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	eb495b29-6b15-4880-988b-67c11552ce55	http://localhost:8055
218	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 09:30:47.846+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	9550d554-3f3a-4192-803a-281cb0d12b59	http://localhost:8055
220	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 09:32:53.624+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	9a9071d9-b797-4c66-a446-54c41ffc3085	http://localhost:8055
222	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 09:35:14.058+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	b856390d-a075-4286-9e40-a22a96b1e196	http://localhost:8055
224	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 09:36:31.19+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	daeb079a-4b31-456c-9eda-e66a3a13e37a	http://localhost:8055
226	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 09:37:26.063+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	4648b320-3c4a-47a8-8cec-13ea71f0aa96	http://localhost:8055
228	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 09:38:29.851+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	d6fd9548-7a6f-4237-8d75-5184fcdc751a	http://localhost:8055
230	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 09:39:34.636+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	13a6f94a-2576-4cdc-aa48-c142802143d9	http://localhost:8055
232	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 09:40:12.028+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	7e8e0ea1-4c4f-429c-85c6-c00af2d9c11e	http://localhost:8055
233	delete	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 09:40:24.981+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	footer_payment	http://localhost:8055
234	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 09:40:43.629+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_permissions	5	http://localhost:8055
235	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 09:40:43.65+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_policies	abf8a154-5b1c-4a46-ac9c-7300570f4f17	http://localhost:8055
236	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 11:54:03.036+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	64	http://localhost:8055
237	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 11:54:03.08+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	footer	http://localhost:8055
238	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 11:56:22.74+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	65	http://localhost:8055
239	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 11:58:05.679+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	65	http://localhost:8055
240	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 12:01:47.934+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	65	http://localhost:8055
241	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 12:03:37.144+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	65	http://localhost:8055
242	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 12:06:31.335+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	66	http://localhost:8055
243	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 12:07:39.56+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	footer	1	http://localhost:8055
244	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 12:09:05.083+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	66	http://localhost:8055
245	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 12:11:56.354+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	66	http://localhost:8055
246	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 12:13:14.577+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	footer	1	http://localhost:8055
247	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 12:14:14.916+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	66	http://localhost:8055
248	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 12:17:34.792+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	67	http://localhost:8055
249	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 12:18:12.944+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	footer	1	http://localhost:8055
250	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 12:20:53.894+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	68	http://localhost:8055
251	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 12:22:25.66+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	68	http://localhost:8055
252	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 12:25:58.595+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	69	http://localhost:8055
253	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 12:25:58.645+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	test	http://localhost:8055
254	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 12:26:42.901+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	70	http://localhost:8055
256	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 12:29:25.115+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	68	http://localhost:8055
257	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 12:34:04.449+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	71	http://localhost:8055
258	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 12:35:24.903+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	footer	1	http://localhost:8055
259	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 12:35:46.089+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	71	http://localhost:8055
260	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 12:36:23.17+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	71	http://localhost:8055
261	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 12:38:42.158+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	72	http://localhost:8055
262	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 12:50:33.933+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	73	http://localhost:8055
263	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 12:51:13.346+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	74	http://localhost:8055
264	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 12:51:14.009+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	75	http://localhost:8055
265	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 12:51:14.068+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	footer_files	http://localhost:8055
266	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 12:51:14.223+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	76	http://localhost:8055
267	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 12:51:14.441+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	77	http://localhost:8055
268	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 12:51:46.775+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	31c4ccd1-0ece-49b8-b638-d40d54450580	http://localhost:8055
269	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 12:51:46.795+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	989aead1-e19c-4a11-a769-ac4f3a730dc8	http://localhost:8055
270	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 12:51:58.413+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	e6e8100e-d5c9-436a-84b6-e56f31961045	http://localhost:8055
271	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 12:51:58.444+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	09f5207e-46a5-4c18-a7e7-d7edae487b94	http://localhost:8055
272	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 12:51:58.47+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	db4b3099-fcff-417b-8ddc-b7ce856592a0	http://localhost:8055
273	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 12:51:58.487+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	12267427-7782-4f14-9f51-e6ac19032e6d	http://localhost:8055
280	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 12:53:26.957+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	footer	1	http://localhost:8055
281	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 12:57:14.066+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	71	http://localhost:8055
282	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 12:58:34.162+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	71	http://localhost:8055
283	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 13:00:20.845+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	78	http://localhost:8055
284	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 13:00:48.557+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	64	http://localhost:8055
285	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 13:00:48.597+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	78	http://localhost:8055
286	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 13:00:48.619+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	74	http://localhost:8055
287	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 13:01:44.464+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	78	http://localhost:8055
288	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 13:02:59.889+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	footer	1	http://localhost:8055
289	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 13:06:47.579+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	79	http://localhost:8055
290	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 13:12:28.127+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	80	http://localhost:8055
291	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 13:12:33.82+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	79	http://localhost:8055
292	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 13:12:33.834+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	64	http://localhost:8055
293	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 13:12:33.95+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	78	http://localhost:8055
294	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 13:12:33.993+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	74	http://localhost:8055
295	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 13:12:34.053+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	80	http://localhost:8055
296	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 13:13:30.258+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	64	http://localhost:8055
297	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 13:13:30.282+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	78	http://localhost:8055
298	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 13:13:30.3+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	74	http://localhost:8055
299	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 13:13:30.317+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	80	http://localhost:8055
300	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 13:13:30.333+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	79	http://localhost:8055
301	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 13:20:10.515+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	81	http://localhost:8055
302	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 13:20:10.553+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	footer_social_icons	http://localhost:8055
303	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 13:20:31.124+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	82	http://localhost:8055
304	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 13:20:43.912+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	4c2e15a6-b9bb-4cb7-b565-82daff0d1b10	http://localhost:8055
305	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 13:20:44.643+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	footer_social_icons	1	http://localhost:8055
306	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 13:20:53.289+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	a3a41661-38b3-4cd2-883f-bae5d89b4d15	http://localhost:8055
307	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 13:20:57.912+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	footer_social_icons	2	http://localhost:8055
308	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 13:22:14.046+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	83	http://localhost:8055
309	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 13:23:34.775+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	83	http://localhost:8055
310	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 13:24:34.65+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	footer	1	http://localhost:8055
311	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 13:25:26.3+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	83	http://localhost:8055
312	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 13:26:02.398+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	footer	1	http://localhost:8055
313	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 13:27:07.442+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	homepage	http://localhost:8055
314	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 13:27:13.195+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	homepage	http://localhost:8055
315	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 13:27:13.212+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	footer	http://localhost:8055
316	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 13:27:13.228+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	footer_category	http://localhost:8055
317	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 13:27:13.243+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	footer_files	http://localhost:8055
318	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 13:27:13.257+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	footer_img	http://localhost:8055
319	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 13:27:13.27+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	footer_options	http://localhost:8055
320	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 13:27:13.28+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	footer_social_icons	http://localhost:8055
321	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 13:27:13.293+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	header	http://localhost:8055
322	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 13:27:13.306+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	test	http://localhost:8055
323	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 13:27:52.535+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	header	http://localhost:8055
324	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 13:27:52.537+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	homepage	http://localhost:8055
325	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 13:27:52.586+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	footer	http://localhost:8055
326	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 13:27:52.611+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	footer_category	http://localhost:8055
327	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 13:27:52.642+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	footer_files	http://localhost:8055
328	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 13:27:52.673+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	footer_img	http://localhost:8055
329	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 13:27:52.715+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	footer_options	http://localhost:8055
330	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 13:27:52.735+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	footer_social_icons	http://localhost:8055
331	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 13:27:52.748+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	test	http://localhost:8055
332	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 13:31:44.611+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	homepage	http://localhost:8055
333	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 13:31:44.709+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	header	http://localhost:8055
334	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 13:31:44.725+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	footer	http://localhost:8055
335	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 13:31:44.743+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	footer_category	http://localhost:8055
336	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 13:31:44.758+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	footer_files	http://localhost:8055
337	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 13:31:44.773+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	footer_img	http://localhost:8055
338	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 13:31:44.787+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	footer_options	http://localhost:8055
339	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 13:31:44.801+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	footer_social_icons	http://localhost:8055
340	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 13:31:44.816+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	test	http://localhost:8055
341	delete	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 13:31:55.953+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	homepage	http://localhost:8055
342	delete	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 13:32:02.053+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	footer_files	http://localhost:8055
343	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 13:38:32.642+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	Modules	http://localhost:8055
344	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 13:38:49.727+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	Modules	http://localhost:8055
345	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 13:38:49.744+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	header	http://localhost:8055
346	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 13:38:49.761+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	footer	http://localhost:8055
347	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 13:38:49.794+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	footer_category	http://localhost:8055
348	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 13:38:49.808+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	footer_img	http://localhost:8055
349	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 13:38:49.825+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	footer_options	http://localhost:8055
350	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 13:38:49.838+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	footer_social_icons	http://localhost:8055
351	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 13:38:49.855+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	test	http://localhost:8055
352	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 13:38:53.026+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	header	http://localhost:8055
353	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 13:38:53.042+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	Modules	http://localhost:8055
354	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 13:38:53.067+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	footer	http://localhost:8055
355	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 13:38:53.099+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	footer_category	http://localhost:8055
356	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 13:38:53.125+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	footer_img	http://localhost:8055
357	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 13:38:53.162+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	footer_options	http://localhost:8055
358	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 13:38:53.187+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	footer_social_icons	http://localhost:8055
359	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 13:38:53.232+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	test	http://localhost:8055
360	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 13:38:54.632+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	Modules	http://localhost:8055
362	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 13:38:54.653+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	footer_category	http://localhost:8055
361	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 13:38:54.634+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	footer	http://localhost:8055
363	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 13:38:54.677+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	footer_img	http://localhost:8055
364	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 13:38:54.713+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	footer_options	http://localhost:8055
365	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 13:38:54.774+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	footer_social_icons	http://localhost:8055
366	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 13:38:54.804+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	test	http://localhost:8055
367	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 13:38:58.991+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	footer	http://localhost:8055
368	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 13:38:59.002+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	header	http://localhost:8055
369	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 13:39:00.613+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	header	http://localhost:8055
370	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 13:39:00.627+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	footer	http://localhost:8055
371	delete	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 13:39:08.141+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	test	http://localhost:8055
372	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 13:42:04.128+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	footer	1	http://localhost:8055
373	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 13:43:14.752+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	84	http://localhost:8055
374	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 13:43:15.222+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	85	http://localhost:8055
375	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 13:43:15.274+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	footer_files	http://localhost:8055
376	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 13:43:15.685+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	86	http://localhost:8055
377	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 13:43:15.9+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	87	http://localhost:8055
378	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 13:43:18.553+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	64	http://localhost:8055
379	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 13:43:18.579+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	78	http://localhost:8055
380	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 13:43:18.594+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	84	http://localhost:8055
381	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 13:43:18.611+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	83	http://localhost:8055
382	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 13:44:09.622+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	9df3b5a1-4cbe-4d02-b01c-9dae5b799fc0	http://localhost:8055
383	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 13:44:09.669+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	2a85c8fb-a99a-468e-8f8f-e2615e111b1b	http://localhost:8055
384	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 13:44:09.697+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	4219d9db-edc1-43b4-81dd-ffec3298e076	http://localhost:8055
385	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 13:44:09.729+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	f6e583ca-7af1-4191-bf08-0b4a9466d016	http://localhost:8055
386	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 13:44:09.731+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	48b1f54a-d584-40ce-82df-3c3d8037e8fc	http://localhost:8055
389	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 13:44:09.993+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	fe68783d-b5c1-4689-b856-590750e06d8c	http://localhost:8055
387	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 13:44:09.732+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	9c822518-4d10-4d6c-b792-a5a5c66f6db2	http://localhost:8055
388	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 13:44:09.99+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	2c3254b8-bafc-46da-a6af-e25f6afebca8	http://localhost:8055
398	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 13:44:34.011+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	footer	1	http://localhost:8055
399	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 13:45:58.89+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	78	http://localhost:8055
400	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 13:47:23.323+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	78	http://localhost:8055
401	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 13:49:09.671+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	footer	1	http://localhost:8055
402	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 13:49:25.212+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	78	http://localhost:8055
403	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 13:51:24.635+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	footer	1	http://localhost:8055
404	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 13:53:27.404+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	footer	1	http://localhost:8055
405	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 13:53:43.598+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	footer	1	http://localhost:8055
406	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 13:54:52.556+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	6568ed47-6d94-4f5b-8f3b-c09fa1a25f36	http://localhost:8055
407	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 13:54:54.17+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	footer_social_icons	3	http://localhost:8055
408	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 13:54:59.904+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	3329912f-e82c-4f2c-8417-7e26a0e307da	http://localhost:8055
409	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 13:55:01.051+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	footer_social_icons	4	http://localhost:8055
410	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 13:56:07.643+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	footer	1	http://localhost:8055
411	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 13:56:23.54+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	footer	1	http://localhost:8055
412	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 13:58:06.259+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	83	http://localhost:8055
413	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 13:58:51.55+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	header	http://localhost:8055
414	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 13:58:51.566+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	footer	http://localhost:8055
415	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 13:58:51.578+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	footer_social_icons	http://localhost:8055
416	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 13:58:51.82+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	Modules	http://localhost:8055
417	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 13:58:51.855+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	footer_category	http://localhost:8055
418	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 13:58:51.882+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	footer_img	http://localhost:8055
419	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 13:58:51.912+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	footer_options	http://localhost:8055
420	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 13:58:51.941+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	footer_files	http://localhost:8055
421	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 14:01:24.972+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	83	http://localhost:8055
422	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 14:02:35.622+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	footer	1	http://localhost:8055
423	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 14:06:14.268+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_permissions	6	http://localhost:8055
424	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 14:06:14.359+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_policies	abf8a154-5b1c-4a46-ac9c-7300570f4f17	http://localhost:8055
425	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 14:43:01.917+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_permissions	7	http://localhost:8055
426	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 14:43:01.97+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_policies	abf8a154-5b1c-4a46-ac9c-7300570f4f17	http://localhost:8055
427	delete	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 15:48:38.905+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	footer_options	http://localhost:8055
428	delete	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 15:48:42.643+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	footer_category	http://localhost:8055
429	delete	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 15:48:45.594+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	footer_img	http://localhost:8055
430	delete	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 15:48:50.481+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	footer_files	http://localhost:8055
431	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 15:55:38.597+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	88	http://localhost:8055
432	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 15:55:38.634+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	89	http://localhost:8055
433	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 15:55:38.656+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	hero_section	http://localhost:8055
434	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 15:56:04.833+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	90	http://localhost:8055
435	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 15:56:16.167+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	b65a1efc-d3f1-4718-835a-68a42332f4d4	http://localhost:8055
436	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 15:56:29.765+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	hero_section	1	http://localhost:8055
437	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 15:57:33.174+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	90	http://localhost:8055
438	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 15:59:27.208+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	91	http://localhost:8055
439	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 16:00:42.529+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	92	http://localhost:8055
440	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 16:01:05.054+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	92	http://localhost:8055
441	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 16:01:14.548+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	92	http://localhost:8055
442	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 16:01:24.341+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	93	http://localhost:8055
443	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 16:02:06.327+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	hero_section	1	http://localhost:8055
444	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 16:02:18.209+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	93	http://localhost:8055
445	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 16:03:16.367+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	94	http://localhost:8055
446	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 16:06:12.505+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	95	http://localhost:8055
447	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 16:06:16.607+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	95	http://localhost:8055
448	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 16:06:46.647+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	hero_section	1	http://localhost:8055
449	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 16:08:48.141+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	96	http://localhost:8055
450	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 16:09:03.906+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	90	http://localhost:8055
451	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 16:09:23.116+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	90	http://localhost:8055
452	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 16:09:30.223+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	92	http://localhost:8055
453	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 16:09:38.218+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	95	http://localhost:8055
454	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 16:09:41.165+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	93	http://localhost:8055
455	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 16:11:33.703+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	hero_section	1	http://localhost:8055
456	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 16:12:06.476+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	hero_section	1	http://localhost:8055
457	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 16:12:50.233+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_permissions	8	http://localhost:8055
458	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 16:12:50.292+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_policies	abf8a154-5b1c-4a46-ac9c-7300570f4f17	http://localhost:8055
459	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 16:12:57.519+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	hero_section	http://localhost:8055
460	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 16:12:57.533+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	Modules	http://localhost:8055
461	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 17:42:05.095+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	97	http://localhost:8055
462	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 17:42:05.18+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	feature_section	http://localhost:8055
463	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 17:42:12.355+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	hero_section	http://localhost:8055
464	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 17:42:12.387+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	feature_section	http://localhost:8055
465	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 17:42:12.434+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	Modules	http://localhost:8055
466	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 17:43:21.557+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	98	http://localhost:8055
467	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 17:45:40.885+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	99	http://localhost:8055
468	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 17:46:09.965+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	feature_section	1	http://localhost:8055
469	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 17:47:23.286+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	99	http://localhost:8055
470	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 17:47:36.359+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	feature_section	1	http://localhost:8055
471	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 17:47:56.989+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	100	http://localhost:8055
472	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 17:48:38.146+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	87b8e117-bbab-4fa3-95ac-7036da47315b	http://localhost:8055
473	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 17:48:44.138+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	feature_section	1	http://localhost:8055
474	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 17:48:50.606+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	100	http://localhost:8055
475	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 17:49:37.332+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_permissions	9	http://localhost:8055
476	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 17:49:37.418+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_policies	abf8a154-5b1c-4a46-ac9c-7300570f4f17	http://localhost:8055
477	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 17:54:40.857+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	9e292dff-6889-445a-a930-76bc403b725b	http://localhost:8055
478	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 17:54:45.083+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	feature_section	1	http://localhost:8055
479	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 19:00:12.946+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	101	http://localhost:8055
480	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 19:00:13.979+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	102	http://localhost:8055
481	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 19:00:14.095+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	footer_files	http://localhost:8055
482	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 19:00:14.386+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	103	http://localhost:8055
483	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 19:00:14.883+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	104	http://localhost:8055
484	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 19:00:19.062+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	64	http://localhost:8055
485	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 19:00:19.151+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	78	http://localhost:8055
486	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 19:00:19.248+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	101	http://localhost:8055
487	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 19:00:19.307+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	83	http://localhost:8055
488	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 19:00:42.581+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	ad3bf48d-0a62-4391-ade8-59a7b3c86c0b	http://localhost:8055
489	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 19:00:42.621+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	562fdc17-cf8c-415c-827c-9977c84d8dba	http://localhost:8055
490	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 19:00:42.663+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	7bcea581-1f8a-4c05-9255-7b103587f32b	http://localhost:8055
492	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 19:00:42.803+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	8e8d0df1-c31d-4606-9c22-385b01a0f528	http://localhost:8055
493	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 19:00:42.926+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	9eb924c9-09eb-435a-bb4e-b3d9078573b0	http://localhost:8055
495	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 19:00:43.53+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	943c1113-90ac-4030-9226-f50f4f7590f5	http://localhost:8055
496	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 19:00:45.971+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	footer_files	1	http://localhost:8055
497	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 19:00:45.983+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	footer_files	2	http://localhost:8055
498	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 19:00:45.991+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	footer_files	3	http://localhost:8055
499	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 19:00:46+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	footer_files	4	http://localhost:8055
500	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 19:00:46.009+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	footer_files	5	http://localhost:8055
501	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 19:00:46.02+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	footer_files	6	http://localhost:8055
502	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 19:00:46.027+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	footer_files	7	http://localhost:8055
503	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 19:00:46.037+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	footer_files	8	http://localhost:8055
504	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 19:00:46.044+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	footer	1	http://localhost:8055
491	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 19:00:42.731+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	c84e680e-64b7-4dfd-8113-265b3985feb2	http://localhost:8055
494	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 19:00:43.514+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	908752e2-dbdf-48d7-8d11-f0d2821d238e	http://localhost:8055
505	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 19:05:29.375+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	footer_files	http://localhost:8055
506	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 19:05:39.583+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	header	http://localhost:8055
507	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 19:05:39.616+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	footer	http://localhost:8055
508	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 19:05:39.651+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	footer_files	http://localhost:8055
509	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 19:05:39.68+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	footer_social_icons	http://localhost:8055
510	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 19:05:39.919+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	hero_section	http://localhost:8055
511	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 19:05:39.943+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	feature_section	http://localhost:8055
512	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 19:05:39.972+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	Modules	http://localhost:8055
513	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 19:06:11.768+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	footer_files	http://localhost:8055
514	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 19:06:16.83+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	hero_section	http://localhost:8055
515	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 19:06:16.845+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	feature_section	http://localhost:8055
516	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 19:06:16.859+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	Modules	http://localhost:8055
517	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 19:06:16.868+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	footer_files	http://localhost:8055
518	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 19:06:16.994+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	header	http://localhost:8055
519	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 19:06:17.008+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	footer	http://localhost:8055
520	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 19:06:17.027+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	footer_social_icons	http://localhost:8055
521	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 08:00:53.132+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	homepage	http://localhost:8055
522	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 08:00:57.44+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	homepage	http://localhost:8055
523	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 08:00:57.461+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	hero_section	http://localhost:8055
524	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 08:00:57.482+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	feature_section	http://localhost:8055
525	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 08:00:57.502+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	Modules	http://localhost:8055
526	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 08:00:57.549+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	footer_files	http://localhost:8055
527	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 08:00:59.327+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	hero_section	http://localhost:8055
528	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 08:00:59.345+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	homepage	http://localhost:8055
529	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 08:00:59.372+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	feature_section	http://localhost:8055
530	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 08:00:59.406+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	Modules	http://localhost:8055
531	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 08:00:59.461+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	footer_files	http://localhost:8055
532	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 08:01:00.717+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	homepage	http://localhost:8055
533	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 08:01:00.723+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	feature_section	http://localhost:8055
534	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 08:01:00.736+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	Modules	http://localhost:8055
535	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 08:01:00.755+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	footer_files	http://localhost:8055
536	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 08:01:06.295+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	feature_section	http://localhost:8055
537	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 08:01:06.312+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	hero_section	http://localhost:8055
538	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 08:01:07.888+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	hero_section	http://localhost:8055
539	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 08:01:07.906+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	feature_section	http://localhost:8055
540	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 08:02:12.77+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	accessories_page	http://localhost:8055
541	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 08:02:17.398+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	homepage	http://localhost:8055
542	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 08:02:17.408+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	accessories_page	http://localhost:8055
543	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 08:02:17.421+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	Modules	http://localhost:8055
544	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 08:02:17.437+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	footer_files	http://localhost:8055
545	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 08:02:29.629+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	105	http://localhost:8055
546	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 08:02:29.642+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	accessories	http://localhost:8055
547	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 08:05:39.644+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	accessories	http://localhost:8055
548	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 08:05:40.038+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	homepage	http://localhost:8055
549	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 08:05:40.103+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	accessories_page	http://localhost:8055
550	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 08:05:40.144+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	Modules	http://localhost:8055
551	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 08:05:40.165+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	footer_files	http://localhost:8055
552	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 08:06:05.434+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	106	http://localhost:8055
553	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 08:06:05.468+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	accessories_type	http://localhost:8055
554	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 08:06:26.169+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	107	http://localhost:8055
555	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 08:07:59.825+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	108	http://localhost:8055
556	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 08:09:49.974+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	108	http://localhost:8055
557	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 08:11:54.386+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	109	http://localhost:8055
558	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 08:20:51.675+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	110	http://localhost:8055
559	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 08:21:45.632+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	22283f06-1f1a-4f0d-9c0e-f1a7ad95bcec	http://localhost:8055
561	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 08:21:57.327+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	fa1a83fd-0a8c-45f4-b169-2f139c788e0f	http://localhost:8055
564	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 08:26:58.291+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	aed535a2-2de3-4655-ba7a-53e87b7490ed	http://localhost:8055
566	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 08:27:09.018+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	34a7daba-9659-41bf-b36c-26e86fd8c3f8	http://localhost:8055
568	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 08:27:15.851+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	6cc6c198-8876-440b-92d5-76277f9016a6	http://localhost:8055
570	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 08:27:22.081+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	107	http://localhost:8055
581	delete	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 08:36:23.677+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	accessories	http://localhost:8055
582	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 08:36:37.013+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	111	http://localhost:8055
583	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 08:36:37.054+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	accessories	http://localhost:8055
572	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 08:30:53.008+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	108	http://localhost:8055
573	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 08:32:00.243+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	9b9bc378-8916-4735-9f05-16c51f9ce165	http://localhost:8055
580	delete	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 08:36:11.807+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	accessories_type	http://localhost:8055
584	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 08:37:52.538+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	112	http://localhost:8055
585	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 08:38:20.794+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	113	http://localhost:8055
586	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 08:38:44.541+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	114	http://localhost:8055
587	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 08:38:52.056+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	114	http://localhost:8055
588	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 08:39:15.299+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	115	http://localhost:8055
589	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 08:40:17.763+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	116	http://localhost:8055
590	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 08:40:22.594+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	116	http://localhost:8055
591	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 08:40:49.864+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	7bcf9cf4-3a7d-4c24-b4ab-b183e746d268	http://localhost:8055
592	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 08:41:53.099+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	accessories	1	http://localhost:8055
593	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 08:42:03.257+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	113	http://localhost:8055
594	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 08:42:28.08+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	eb053b63-b683-4b9a-9f23-dde825593f61	http://localhost:8055
595	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 08:42:56.685+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	accessories	2	http://localhost:8055
596	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 08:43:06.506+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	f960f2fc-4dc0-4743-b27d-5097f52f7d5b	http://localhost:8055
597	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 08:43:31.151+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	accessories	3	http://localhost:8055
598	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 08:44:07.757+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	e422f5ed-6233-4bd6-adf6-b8033cf452d1	http://localhost:8055
599	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 08:44:08.538+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	accessories	4	http://localhost:8055
600	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 08:45:30.685+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	accessories	http://localhost:8055
601	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 08:45:31+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	homepage	http://localhost:8055
602	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 08:45:31.033+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	accessories_page	http://localhost:8055
603	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 08:45:31.059+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	Modules	http://localhost:8055
604	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 08:45:31.077+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	footer_files	http://localhost:8055
605	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 08:45:42.658+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	117	http://localhost:8055
606	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 08:45:42.679+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	accessories_type	http://localhost:8055
607	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 08:46:17.77+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	118	http://localhost:8055
608	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 08:46:38.384+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	119	http://localhost:8055
609	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 08:46:41.962+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	119	http://localhost:8055
610	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 08:46:43.484+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	117	http://localhost:8055
611	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 08:46:43.501+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	119	http://localhost:8055
612	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 08:46:43.518+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	118	http://localhost:8055
613	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 08:46:56.284+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	accessories_type	http://localhost:8055
614	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 08:46:56.411+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	homepage	http://localhost:8055
615	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 08:46:56.422+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	accessories_page	http://localhost:8055
616	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 08:46:56.432+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	Modules	http://localhost:8055
617	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 08:46:56.443+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	footer_files	http://localhost:8055
618	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 08:46:59.125+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	accessories_type	http://localhost:8055
619	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 08:46:59.136+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	accessories	http://localhost:8055
622	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 08:47:47.889+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	15caa33e-9426-4f84-abe6-a8cc3fe84d67	http://localhost:8055
620	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 08:47:16.979+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	349ac9f4-b421-43d5-8262-821534505d09	http://localhost:8055
624	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 08:51:32.742+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	120	http://localhost:8055
625	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 08:52:49.15+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	accessories	1	http://localhost:8055
626	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 08:53:41.114+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	111	http://localhost:8055
627	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 08:53:41.177+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	120	http://localhost:8055
628	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 08:53:41.218+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	113	http://localhost:8055
629	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 08:53:41.27+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	114	http://localhost:8055
630	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 08:53:41.306+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	115	http://localhost:8055
631	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 08:53:41.331+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	116	http://localhost:8055
632	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 08:54:18.972+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	121	http://localhost:8055
633	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 08:54:49.681+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	accessories	1	http://localhost:8055
634	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 08:55:21.447+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	121	http://localhost:8055
635	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 08:55:31.871+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	accessories	2	http://localhost:8055
636	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 08:55:40.922+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	accessories	3	http://localhost:8055
637	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 08:55:47.718+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	accessories	4	http://localhost:8055
639	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 09:00:41.059+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_permissions	10	http://localhost:8055
640	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 09:00:41.634+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_permissions	11	http://localhost:8055
641	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 09:00:41.749+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_policies	abf8a154-5b1c-4a46-ac9c-7300570f4f17	http://localhost:8055
642	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 09:12:40.398+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_access	707ad5f5-982e-4459-a955-f16c1fdcfe22	http://localhost:8055
643	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 09:13:08.852+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_permissions	12	http://localhost:8055
644	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 09:13:08.922+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_policies	abf8a154-5b1c-4a46-ac9c-7300570f4f17	http://localhost:8055
645	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 09:33:37.463+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	562fdc17-cf8c-415c-827c-9977c84d8dba	http://localhost:8055
646	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 09:33:37.604+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	562fdc17-cf8c-415c-827c-9977c84d8dba	http://localhost:8055
647	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 09:33:54.595+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	c84e680e-64b7-4dfd-8113-265b3985feb2	http://localhost:8055
648	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 09:33:54.694+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	c84e680e-64b7-4dfd-8113-265b3985feb2	http://localhost:8055
649	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 09:36:33.06+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	562fdc17-cf8c-415c-827c-9977c84d8dba	http://localhost:8055
650	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 09:36:33.079+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	footer_files	1	http://localhost:8055
651	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 09:36:33.094+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	footer	1	http://localhost:8055
652	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 09:36:51.97+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	footer_files	1	http://localhost:8055
653	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 09:36:51.972+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	footer_files	2	http://localhost:8055
654	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 09:36:51.974+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	footer_files	3	http://localhost:8055
655	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 09:36:51.977+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	footer_files	4	http://localhost:8055
656	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 09:36:51.98+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	footer_files	5	http://localhost:8055
657	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 09:36:51.982+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	footer_files	6	http://localhost:8055
658	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 09:36:51.984+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	footer_files	7	http://localhost:8055
659	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 09:36:51.987+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	footer_files	8	http://localhost:8055
660	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 09:36:52.013+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	footer	1	http://localhost:8055
661	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 09:37:42.701+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	26676457-a204-4b32-b2c5-0c56f5ff6aa8	http://localhost:8055
662	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 09:37:42.77+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	e3bf3998-03f2-4e7f-b165-5bc99f640e78	http://localhost:8055
663	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 09:37:42.833+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	7cc48476-1d9f-4a50-a628-e44448e4d0a7	http://localhost:8055
664	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 09:37:42.848+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	186c34a8-1848-48c0-b470-363eec7099d4	http://localhost:8055
665	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 09:37:42.87+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	32991033-7c21-48e3-b17a-116f1f124dbc	http://localhost:8055
666	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 09:37:42.895+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	e6d19d80-da1a-4176-9d4e-13d0dc4501c7	http://localhost:8055
667	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 09:37:43.011+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	ffa48906-4187-495e-8cb8-d4e3da720d8e	http://localhost:8055
668	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 09:37:43.058+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	023d05b1-81b5-45e6-9e30-83713d86f370	http://localhost:8055
669	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 09:38:14.671+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	footer_files	9	http://localhost:8055
670	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 09:38:14.686+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	footer_files	10	http://localhost:8055
671	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 09:38:14.692+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	footer_files	11	http://localhost:8055
672	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 09:38:14.702+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	footer_files	12	http://localhost:8055
673	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 09:38:14.709+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	footer_files	13	http://localhost:8055
674	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 09:38:14.731+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	footer_files	14	http://localhost:8055
675	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 09:38:14.738+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	footer_files	15	http://localhost:8055
676	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 09:38:14.746+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	footer_files	16	http://localhost:8055
677	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 09:38:14.753+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	footer	1	http://localhost:8055
678	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 10:07:47.574+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	e1d9a978-7d06-4146-9e8c-0e7a845fc8d9	http://localhost:8055
680	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 10:08:28.786+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	0e06fc89-79a6-40f0-86d4-437e53413133	http://localhost:8055
683	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 10:08:47.1+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	b7f75a5b-74e2-4c4d-aab8-a8c025b55dee	http://localhost:8055
686	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 11:34:09.007+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	111	http://localhost:8055
687	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 11:34:09.127+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	121	http://localhost:8055
688	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 11:34:09.163+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	113	http://localhost:8055
689	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 11:34:09.215+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	114	http://localhost:8055
690	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 11:34:09.275+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	115	http://localhost:8055
691	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 11:34:09.326+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	116	http://localhost:8055
692	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 11:35:15.722+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	122	http://localhost:8055
693	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 11:35:16.193+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	123	http://localhost:8055
694	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 11:35:16.293+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	accessories_accessories_type	http://localhost:8055
695	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 11:35:16.624+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	124	http://localhost:8055
696	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 11:35:17.123+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	125	http://localhost:8055
697	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 11:36:31.4+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	accessories	1	http://localhost:8055
698	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 11:36:44.035+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	accessories	2	http://localhost:8055
699	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 11:36:49.375+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	accessories	3	http://localhost:8055
700	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 11:36:53.955+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	accessories	4	http://localhost:8055
701	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 11:37:43.623+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	dcee2a16-211f-4f7e-ba4c-5da43b669023	http://localhost:8055
704	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 11:37:50.715+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	accessories	1	http://localhost:8055
705	delete	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 11:38:32.352+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	accessories	1	http://localhost:8055
706	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 11:47:25.51+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	126	http://localhost:8055
707	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 11:47:25.856+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	127	http://localhost:8055
708	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 11:47:25.869+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	accessories_accessories_type_1	http://localhost:8055
709	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 11:47:26.004+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	128	http://localhost:8055
710	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 11:47:26.232+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	129	http://localhost:8055
711	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 11:47:31.477+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	111	http://localhost:8055
712	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 11:47:31.494+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	126	http://localhost:8055
713	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 11:47:31.513+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	113	http://localhost:8055
714	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 11:47:31.534+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	114	http://localhost:8055
715	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 11:47:31.558+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	115	http://localhost:8055
716	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 11:47:31.605+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	116	http://localhost:8055
718	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 11:47:58.621+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	accessories	2	http://localhost:8055
720	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 11:48:19.475+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	accessories	2	http://localhost:8055
721	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 11:49:55.329+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	130	http://localhost:8055
722	delete	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 11:51:31.788+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	accessories_type	http://localhost:8055
723	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 11:51:55.549+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	131	http://localhost:8055
724	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 11:51:55.565+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	accessories_type	http://localhost:8055
725	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 11:52:35.345+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	132	http://localhost:8055
726	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 11:52:46.285+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	133	http://localhost:8055
727	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 11:52:49.413+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	133	http://localhost:8055
728	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 11:53:02.17+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	405c8b4c-933f-42cd-9121-8f31eb516a87	http://localhost:8055
729	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 11:53:05.513+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	accessories_type	1	http://localhost:8055
730	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 11:53:45.88+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	a5b5e1c0-98b1-4885-add5-aa708433b615	http://localhost:8055
731	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 11:53:51.38+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	accessories_type	2	http://localhost:8055
732	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 11:54:13.758+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	f79cc4e0-ef7f-4a26-a52a-1d018bb0808b	http://localhost:8055
733	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 11:54:17.027+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	accessories_type	3	http://localhost:8055
734	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 11:54:22.173+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	131	http://localhost:8055
735	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 11:54:22.202+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	133	http://localhost:8055
736	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 11:54:22.218+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	132	http://localhost:8055
737	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 11:54:38.4+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	accessories_type	http://localhost:8055
738	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 11:54:38.416+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	accessories	http://localhost:8055
739	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 11:54:38.509+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	homepage	http://localhost:8055
740	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 11:54:38.523+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	accessories_page	http://localhost:8055
741	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 11:54:38.534+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	Modules	http://localhost:8055
742	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 11:54:38.544+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	footer_files	http://localhost:8055
743	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 11:54:38.559+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	accessories_accessories_type	http://localhost:8055
744	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 11:54:38.57+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	accessories_accessories_type_1	http://localhost:8055
745	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 11:54:52.638+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_permissions	13	http://localhost:8055
746	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 11:54:52.663+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_policies	abf8a154-5b1c-4a46-ac9c-7300570f4f17	http://localhost:8055
747	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 11:55:31.741+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	accessories_type	1	http://localhost:8055
748	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 11:55:44.034+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	accessories_type	1	http://localhost:8055
749	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 11:57:11.514+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	134	http://localhost:8055
750	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 11:57:11.767+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	135	http://localhost:8055
751	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 11:57:11.781+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	accessories_accessories_type_2	http://localhost:8055
752	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 11:57:11.913+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	136	http://localhost:8055
753	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 11:57:12.129+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	137	http://localhost:8055
754	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 11:57:17.286+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	111	http://localhost:8055
755	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 11:57:17.303+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	134	http://localhost:8055
756	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 11:57:17.321+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	113	http://localhost:8055
757	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 11:57:17.34+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	114	http://localhost:8055
758	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 11:57:17.36+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	115	http://localhost:8055
759	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 11:57:17.388+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	116	http://localhost:8055
762	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 11:57:38.986+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	accessories	2	http://localhost:8055
765	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 11:57:50.641+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	accessories	3	http://localhost:8055
768	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 11:57:58.752+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	accessories	4	http://localhost:8055
769	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 12:01:46.953+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_permissions	14	http://localhost:8055
770	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 12:01:47+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_policies	abf8a154-5b1c-4a46-ac9c-7300570f4f17	http://localhost:8055
771	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 12:08:37.474+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	138	http://localhost:8055
772	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 12:08:40.884+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	111	http://localhost:8055
773	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 12:08:40.915+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	138	http://localhost:8055
774	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 12:08:40.932+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	113	http://localhost:8055
775	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 12:08:40.952+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	114	http://localhost:8055
776	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 12:08:40.968+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	115	http://localhost:8055
777	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 12:08:40.985+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	116	http://localhost:8055
778	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 12:08:52.006+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	accessories	2	http://localhost:8055
779	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 12:08:57.123+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	accessories	3	http://localhost:8055
780	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 12:09:01.985+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	accessories	4	http://localhost:8055
781	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 12:15:40.368+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	139	http://localhost:8055
782	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 12:15:41.466+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	140	http://localhost:8055
783	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 12:15:41.55+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	accessories_accessories_type_3	http://localhost:8055
784	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 12:15:41.766+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	141	http://localhost:8055
785	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 12:15:42.088+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	142	http://localhost:8055
786	delete	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 12:17:42.027+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	accessories_accessories_type	http://localhost:8055
787	delete	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 12:17:45.303+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	accessories_accessories_type_1	http://localhost:8055
788	delete	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 12:17:48.324+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	accessories_accessories_type_2	http://localhost:8055
789	delete	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 12:17:57.163+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	accessories_accessories_type_3	http://localhost:8055
790	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 12:53:15.211+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	65971f09-8765-47ce-a742-e79e3fd56e1e	http://localhost:8055
791	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 12:53:56.09+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	accessories	5	http://localhost:8055
792	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 13:35:00.555+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	e161e149-7a3c-4f14-beb8-84db2fbcc345	http://localhost:8055
793	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 13:35:20.608+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	accessories	6	http://localhost:8055
794	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 14:27:01.685+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	20f7943c-d70d-48d6-a690-0411c74399eb	http://localhost:8055
795	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 14:27:03.263+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	accessories	7	http://localhost:8055
796	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 14:28:11.834+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	ab586d2a-ba28-4e07-add9-33ff3850d91d	http://localhost:8055
797	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 14:28:13.859+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	accessories	8	http://localhost:8055
798	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 14:38:31.139+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	accessories	2	http://localhost:8055
799	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 14:38:39.139+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	accessories	3	http://localhost:8055
800	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 14:38:47.806+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	accessories	6	http://localhost:8055
801	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 14:39:00.248+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	accessories	7	http://localhost:8055
802	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 16:33:19.074+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	footer_files	11	http://localhost:8055
803	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 16:33:19.112+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	footer	1	http://localhost:8055
804	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 16:35:08.15+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	b65b8bfb-13fb-4f9c-af0f-dfcf68600d3c	http://localhost:8055
805	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 16:35:12.139+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	footer_files	17	http://localhost:8055
806	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 16:35:12.148+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	footer	1	http://localhost:8055
807	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 16:49:27.563+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	4f432983-1c62-4ada-aff1-72407a39f3c4	http://localhost:8055
808	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 16:49:49.508+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	accessories	9	http://localhost:8055
809	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 16:50:01.588+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	accessories	9	http://localhost:8055
810	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 20:38:24.813+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	hero_section	1	http://localhost:8055
811	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 06:54:44.077+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	c2ced0b0-0c3f-430d-84da-442cf00517ba	http://localhost:8055
812	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 06:55:22.744+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	accessories	10	http://localhost:8055
813	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 06:56:06.629+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	53fcdf48-e8d3-4330-814e-0a5e0c816df4	http://localhost:8055
814	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 06:56:09.286+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	accessories	11	http://localhost:8055
815	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 14:48:53.407+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	143	http://localhost:8055
816	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 14:48:53.44+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	144	http://localhost:8055
817	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 14:48:53.457+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	home	http://localhost:8055
818	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 14:50:24.572+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	145	http://localhost:8055
819	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 14:50:24.842+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	146	http://localhost:8055
820	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 14:50:24.871+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	home_hero_section	http://localhost:8055
821	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 14:50:25.063+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	147	http://localhost:8055
822	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 14:50:25.332+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	148	http://localhost:8055
823	delete	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 14:54:01.016+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	home_hero_section	http://localhost:8055
824	delete	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 14:54:10.124+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	home	http://localhost:8055
825	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 15:51:15.944+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	149	http://localhost:8055
826	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 15:51:16.293+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	150	http://localhost:8055
827	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 15:51:16.308+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	accessories_files	http://localhost:8055
828	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 15:51:16.424+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	151	http://localhost:8055
829	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 15:51:16.659+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	152	http://localhost:8055
830	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 15:51:33.601+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_permissions	15	http://localhost:8055
831	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 15:51:33.631+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_policies	abf8a154-5b1c-4a46-ac9c-7300570f4f17	http://localhost:8055
833	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 15:53:07.506+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	5861d0d2-08b9-488c-89ac-b4158c90c290	http://localhost:8055
832	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 15:53:07.499+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	79bd4f79-104e-4afe-b243-191c52fe7f95	http://localhost:8055
834	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 15:53:07.533+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	b3f12688-dd6a-43fb-8277-1a6e8de88a65	http://localhost:8055
838	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 15:53:12.439+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	accessories	2	http://localhost:8055
839	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 15:58:26.856+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	a8c2af70-b873-4089-9db5-31adc0e95ef4	http://localhost:8055
840	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 15:58:26.859+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	4d1ccf79-73e8-4392-91bc-abc59c6cd748	http://localhost:8055
841	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 15:58:26.874+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	96164914-bf98-4865-aaeb-686f9a85603b	http://localhost:8055
842	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 15:59:39.342+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	9db4d987-76ad-442c-aa5c-bf851b8cd50c	http://localhost:8055
847	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 15:59:42.78+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	accessories	3	http://localhost:8055
848	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 15:59:57.008+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	53e4a952-f407-43ca-b43e-6fab99c32186	http://localhost:8055
849	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 15:59:57.026+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	c4a56dea-c873-4184-87be-98bbd525c451	http://localhost:8055
850	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 15:59:57.048+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	c70383cb-f76a-4eec-866f-2a22b593cc34	http://localhost:8055
851	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 15:59:57.057+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	9d93b3af-7085-45bc-970a-26721b04ef40	http://localhost:8055
856	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 16:00:18.844+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	accessories	4	http://localhost:8055
857	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 16:21:57.328+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	f7260eca-814a-44f4-8ea3-0f875b0f97b1	http://localhost:8055
858	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 16:21:57.332+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	4fbbe243-5c7d-49a3-9851-d1d6f96aef51	http://localhost:8055
859	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 16:21:57.36+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	15dc53a3-aa2f-499d-84e8-e92faf02229e	http://localhost:8055
863	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 16:22:01.092+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	accessories	11	http://localhost:8055
864	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 16:25:53.262+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	111	http://localhost:8055
865	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 16:25:53.289+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	138	http://localhost:8055
866	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 16:25:53.319+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	113	http://localhost:8055
867	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 16:25:53.342+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	149	http://localhost:8055
868	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 16:25:53.372+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	114	http://localhost:8055
869	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 16:25:53.408+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	115	http://localhost:8055
870	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 16:25:53.435+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	116	http://localhost:8055
872	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 16:50:25.24+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	accessories	2	http://localhost:8055
873	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 17:02:01.134+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	153	http://localhost:8055
874	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 17:02:15.687+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	eff018c2-0258-444b-bc82-6b422d9a0406	http://localhost:8055
875	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 17:02:18.962+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	accessories	2	http://localhost:8055
876	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 17:02:26.578+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	e74a1d3b-51c7-4aaa-9d8a-6f9e0b66c4b6	http://localhost:8055
877	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 17:02:27.356+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	accessories	3	http://localhost:8055
878	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 17:02:36.254+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	88e27c2c-5994-40d4-a1b5-f73792f84608	http://localhost:8055
879	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 17:02:37.076+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	accessories	4	http://localhost:8055
880	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 17:02:47.848+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	accessories	5	http://localhost:8055
881	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 17:02:56.077+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	accessories	6	http://localhost:8055
882	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 17:03:03.406+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	accessories	7	http://localhost:8055
885	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 17:03:30.279+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	accessories	9	http://localhost:8055
886	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 17:03:40.652+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	accessories	10	http://localhost:8055
883	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 17:03:20.284+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	fa387a8b-bb5f-447a-a550-2e89d6f66365	http://localhost:8055
884	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 17:03:21.19+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	accessories	8	http://localhost:8055
887	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 17:03:47.965+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	5d37f41b-7aad-49fd-8667-c4dfcec743da	http://localhost:8055
888	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 17:03:48.935+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	accessories	11	http://localhost:8055
889	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 17:06:24.195+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	153	http://localhost:8055
890	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 17:06:29.08+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	111	http://localhost:8055
891	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 17:06:29.099+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	138	http://localhost:8055
892	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 17:06:29.116+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	153	http://localhost:8055
893	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 17:06:29.131+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	113	http://localhost:8055
894	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 17:06:29.148+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	149	http://localhost:8055
895	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 17:06:29.165+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	114	http://localhost:8055
896	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 17:06:29.19+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	115	http://localhost:8055
897	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 17:06:29.207+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	116	http://localhost:8055
898	delete	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 17:07:40.054+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	accessories_files	http://localhost:8055
899	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 17:07:54.951+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	154	http://localhost:8055
900	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 17:07:55.163+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	155	http://localhost:8055
901	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 17:07:55.178+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_collections	accessories_files	http://localhost:8055
902	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 17:07:55.28+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	156	http://localhost:8055
903	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 17:07:55.432+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	157	http://localhost:8055
904	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 17:07:58.416+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	111	http://localhost:8055
905	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 17:07:58.43+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	138	http://localhost:8055
906	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 17:07:58.443+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	153	http://localhost:8055
907	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 17:07:58.458+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	154	http://localhost:8055
908	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 17:07:58.474+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	114	http://localhost:8055
909	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 17:07:58.488+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	115	http://localhost:8055
910	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 17:07:58.504+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_fields	116	http://localhost:8055
911	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 17:08:16.298+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_permissions	16	http://localhost:8055
912	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 17:08:16.383+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_policies	abf8a154-5b1c-4a46-ac9c-7300570f4f17	http://localhost:8055
913	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 17:09:31.377+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	accessories_files	1	http://localhost:8055
914	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 17:09:31.394+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	accessories_files	2	http://localhost:8055
915	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 17:09:31.402+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	accessories_files	3	http://localhost:8055
916	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 17:09:31.411+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	accessories	2	http://localhost:8055
917	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 17:09:49.381+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	accessories_files	4	http://localhost:8055
918	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 17:09:49.397+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	accessories_files	5	http://localhost:8055
919	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 17:09:49.424+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	accessories_files	6	http://localhost:8055
920	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 17:09:49.457+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	accessories_files	7	http://localhost:8055
921	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 17:09:49.472+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	accessories_files	8	http://localhost:8055
922	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 17:09:49.485+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	accessories	3	http://localhost:8055
923	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 17:10:16.708+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	accessories_files	9	http://localhost:8055
924	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 17:10:16.718+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	accessories	3	http://localhost:8055
925	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 17:53:16.134+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	b05ce73f-b76f-4248-91b6-e71df2360d8f	http://localhost:8055
926	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 17:53:16.141+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	6bef1de6-3665-471c-ba4b-d32ed83ce9bc	http://localhost:8055
927	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 17:53:16.292+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	cb8682cd-b80d-4658-895d-f47dc8a9c23a	http://localhost:8055
928	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 17:53:18.093+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	accessories_files	10	http://localhost:8055
929	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 17:53:18.114+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	accessories_files	11	http://localhost:8055
930	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 17:53:18.127+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	accessories_files	12	http://localhost:8055
931	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 17:53:18.158+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	accessories	4	http://localhost:8055
932	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 17:53:27.455+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	accessories_files	1	http://localhost:8055
933	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 17:53:27.46+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	accessories_files	2	http://localhost:8055
934	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 17:53:27.463+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	accessories_files	3	http://localhost:8055
935	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 17:53:27.481+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	accessories	2	http://localhost:8055
936	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 17:53:40.685+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	dea5add6-517b-416b-ad89-3ab128143b23	http://localhost:8055
937	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 17:53:40.755+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	dab41adf-1f8b-41c9-bd15-73e587a9a286	http://localhost:8055
938	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 17:53:40.813+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	f1418393-8118-4161-88f4-1df01313003a	http://localhost:8055
939	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 17:53:40.832+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	baad0908-6731-47af-9a0b-71f1398a0502	http://localhost:8055
940	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 17:53:43.007+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	accessories_files	13	http://localhost:8055
941	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 17:53:43.049+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	accessories_files	14	http://localhost:8055
942	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 17:53:43.081+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	accessories_files	15	http://localhost:8055
943	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 17:53:43.128+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	accessories_files	16	http://localhost:8055
944	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 17:53:43.161+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	accessories	2	http://localhost:8055
945	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 17:54:01.311+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	92bea263-2997-4b8a-b8a6-d920d8d9c895	http://localhost:8055
946	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 17:54:01.479+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	99b1444f-d6be-4731-a71e-1a091c5ec3fc	http://localhost:8055
947	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 17:54:01.499+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	8014f172-e017-4d41-9cde-c31ea0562ef3	http://localhost:8055
948	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 17:54:01.531+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	directus_files	4dbb5c1e-c066-438f-a907-74d197b6df0e	http://localhost:8055
949	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 17:54:03.306+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	accessories_files	17	http://localhost:8055
950	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 17:54:03.323+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	accessories_files	18	http://localhost:8055
951	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 17:54:03.34+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	accessories_files	19	http://localhost:8055
952	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 17:54:03.352+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	accessories_files	20	http://localhost:8055
953	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 17:54:03.365+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	accessories	5	http://localhost:8055
954	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 17:54:19.492+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	accessories_files	21	http://localhost:8055
955	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 17:54:19.501+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	accessories_files	22	http://localhost:8055
956	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 17:54:19.509+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	accessories_files	23	http://localhost:8055
957	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 17:54:19.515+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	accessories_files	24	http://localhost:8055
958	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 17:54:19.523+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	accessories	6	http://localhost:8055
959	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 17:54:31.546+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	accessories_files	25	http://localhost:8055
960	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 17:54:31.556+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	accessories_files	26	http://localhost:8055
961	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 17:54:31.563+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	accessories	7	http://localhost:8055
962	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 17:54:47.336+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	accessories_files	27	http://localhost:8055
963	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 17:54:47.346+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	accessories_files	28	http://localhost:8055
964	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 17:54:47.354+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	accessories_files	29	http://localhost:8055
965	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 17:54:47.361+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	accessories	8	http://localhost:8055
966	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 17:54:58.224+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	accessories_files	30	http://localhost:8055
967	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 17:54:58.232+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	accessories_files	31	http://localhost:8055
968	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 17:54:58.24+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	accessories_files	32	http://localhost:8055
969	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 17:54:58.248+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	accessories_files	33	http://localhost:8055
970	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 17:54:58.256+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	accessories	9	http://localhost:8055
971	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 17:55:10.985+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	accessories_files	34	http://localhost:8055
972	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 17:55:11.005+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	accessories_files	35	http://localhost:8055
973	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 17:55:11.016+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	accessories	10	http://localhost:8055
974	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 17:55:20.259+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	accessories_files	36	http://localhost:8055
975	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 17:55:20.268+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	accessories_files	37	http://localhost:8055
976	create	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 17:55:20.277+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	accessories_files	38	http://localhost:8055
977	update	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 17:55:20.282+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	accessories	11	http://localhost:8055
\.


--
-- Data for Name: directus_collections; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_collections (collection, icon, note, display_template, hidden, singleton, translations, archive_field, archive_app_filter, archive_value, unarchive_value, sort_field, accountability, color, item_duplication_fields, sort, "group", collapse, preview_url, versioning) FROM stdin;
accessories_type	\N	\N	\N	f	f	\N	\N	t	\N	\N	\N	all	\N	\N	1	accessories_page	open	\N	f
header	\N	\N	\N	f	f	\N	\N	t	\N	\N	\N	all	\N	\N	1	Modules	open	\N	f
footer	\N	\N	\N	f	t	\N	\N	t	\N	\N	\N	all	\N	\N	2	Modules	open	\N	f
footer_social_icons	\N	\N	\N	f	f	\N	\N	t	\N	\N	\N	all	\N	\N	3	Modules	open	\N	f
accessories	\N	\N	\N	f	f	\N	\N	t	\N	\N	\N	all	\N	\N	2	accessories_page	open	\N	f
homepage	home_app_logo	\N	\N	f	f	\N	\N	t	\N	\N	\N	all	#E35169	\N	1	\N	open	\N	f
accessories_page	folder	\N	\N	f	f	\N	\N	t	\N	\N	\N	all	#FFA439	\N	2	\N	open	\N	f
Modules	view_module	\N	\N	f	f	\N	\N	t	\N	\N	\N	all	#3399FF	\N	3	\N	open	\N	f
footer_files	import_export	\N	\N	t	f	\N	\N	t	\N	\N	\N	all	\N	\N	4	\N	open	\N	f
accessories_files	import_export	\N	\N	t	f	\N	\N	t	\N	\N	\N	all	\N	\N	\N	\N	open	\N	f
hero_section	\N	\N	\N	f	f	\N	\N	t	\N	\N	sort	all	\N	\N	1	homepage	open	\N	f
feature_section	\N	\N	\N	f	f	\N	\N	t	\N	\N	\N	all	\N	\N	2	homepage	open	\N	f
\.


--
-- Data for Name: directus_comments; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_comments (id, collection, item, comment, date_created, date_updated, user_created, user_updated) FROM stdin;
\.


--
-- Data for Name: directus_dashboards; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_dashboards (id, name, icon, note, date_created, user_created, color) FROM stdin;
\.


--
-- Data for Name: directus_extensions; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_extensions (enabled, id, folder, source, bundle) FROM stdin;
\.


--
-- Data for Name: directus_fields; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_fields (id, collection, field, special, interface, options, display, display_options, readonly, hidden, sort, width, translations, note, conditions, required, "group", validation, validation_message) FROM stdin;
1	header	id	\N	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N
2	header	title	\N	input	\N	\N	\N	f	f	2	half	\N	\N	\N	t	\N	\N	\N
3	header	slug	\N	input	\N	\N	\N	f	f	3	half	\N	\N	\N	t	\N	\N	\N
96	hero_section	Lists	cast-json	list	{"fields":[{"field":"title","name":"title","type":"string","meta":{"field":"title","type":"string","required":true,"interface":"input","options":{"placeholder":"Enter the title"}}},{"field":"sub_title","name":"sub_title","type":"string","meta":{"field":"sub_title","type":"string","required":true,"interface":"input","options":{"placeholder":"Enter the subtitle"}}}]}	\N	\N	f	f	7	full	\N	\N	\N	f	\N	\N	\N
90	hero_section	bg_img	file	file-image	\N	\N	\N	f	f	3	half	\N	\N	\N	t	\N	\N	\N
92	hero_section	heading	\N	input	\N	\N	\N	f	f	4	full	\N	\N	\N	t	\N	\N	\N
95	hero_section	button_text	cast-json	list	{"fields":[{"field":"text","name":"text","type":"string","meta":{"field":"text","type":"string","required":true,"interface":"input","options":{"placeholder":"Enter the text"}}},{"field":"link","name":"link","type":"string","meta":{"field":"link","type":"string","required":true,"interface":"input","options":{"placeholder":"Enter the link"}}}]}	\N	\N	f	f	6	full	\N	\N	\N	t	\N	\N	\N
93	hero_section	sub_heading	\N	input	\N	\N	\N	f	f	5	full	\N	\N	\N	t	\N	\N	\N
97	feature_section	id	\N	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N
99	feature_section	heading	cast-json	list	{"fields":[{"field":"heading","name":"heading","type":"string","meta":{"field":"heading","type":"string","interface":"input","required":true}},{"field":"sub_heading","name":"sub_heading","type":"string","meta":{"field":"sub_heading","type":"string","interface":"input","required":true}},{"field":"description","name":"description","type":"string","meta":{"field":"description","type":"string","required":true,"interface":"input"}}]}	\N	\N	f	f	2	full	\N	\N	\N	f	\N	\N	\N
100	feature_section	bg_img	file	file-image	\N	\N	\N	f	f	3	half	\N	\N	\N	t	\N	\N	\N
102	footer_files	id	\N	\N	\N	\N	\N	f	t	1	full	\N	\N	\N	f	\N	\N	\N
103	footer_files	footer_id	\N	\N	\N	\N	\N	f	t	2	full	\N	\N	\N	f	\N	\N	\N
104	footer_files	directus_files_id	\N	\N	\N	\N	\N	f	t	3	full	\N	\N	\N	f	\N	\N	\N
64	footer	id	\N	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N
78	footer	category	cast-json	list	{"fields":[{"field":"name","name":"name","type":"string","meta":{"field":"name","type":"string","interface":"input","options":{"placeholder":"Enter Category Name"},"required":true}},{"field":"options","name":"options","type":"json","meta":{"field":"options","type":"json","interface":"list","options":{"fields":[{"field":"name","name":"name","type":"string","meta":{"field":"name","type":"string","interface":"input","required":true,"options":{"placeholder":"Enter the name"}}},{"field":"slug","name":"slug","type":"string","meta":{"field":"slug","type":"string","interface":"input","options":{"placeholder":"Enter the slug"},"required":true}}]},"required":true}}]}	\N	\N	f	f	2	full	\N	\N	\N	f	\N	\N	\N
101	footer	payemnt_img	files	files	\N	\N	\N	f	f	3	full	\N	\N	\N	t	\N	\N	\N
83	footer	social_icons	cast-json	list	{"fields":[{"field":"name","name":"name","type":"string","meta":{"field":"name","type":"string","interface":"input","required":true,"options":{"placeholder":"Enter the name"}}},{"field":"link","name":"link","type":"string","meta":{"field":"link","required":true,"type":"string","interface":"input","options":{"placeholder":"Enter the link"}}},{"field":"icon","name":"icon","type":"json","meta":{"field":"icon","type":"json","interface":"collection-item-dropdown","options":{"selectedCollection":"footer_social_icons","template":"{{image.title}}"},"width":"half","display":"labels","required":true}}]}	\N	\N	f	f	4	full	\N	\N	\N	f	\N	\N	\N
88	hero_section	id	\N	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N
89	hero_section	sort	\N	input	\N	\N	\N	f	t	2	full	\N	\N	\N	f	\N	\N	\N
81	footer_social_icons	id	\N	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N
82	footer_social_icons	image	file	file-image	\N	\N	\N	f	f	2	full	\N	\N	\N	f	\N	\N	\N
131	accessories_type	id	\N	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N
133	accessories_type	image	file	file-image	\N	\N	\N	f	f	2	half	\N	\N	\N	t	\N	\N	\N
132	accessories_type	type	\N	input	\N	\N	\N	f	f	3	full	\N	\N	\N	f	\N	\N	\N
155	accessories_files	id	\N	\N	\N	\N	\N	f	t	1	full	\N	\N	\N	f	\N	\N	\N
156	accessories_files	accessories_id	\N	\N	\N	\N	\N	f	t	2	full	\N	\N	\N	f	\N	\N	\N
157	accessories_files	directus_files_id	\N	\N	\N	\N	\N	f	t	3	full	\N	\N	\N	f	\N	\N	\N
111	accessories	id	\N	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N
138	accessories	type	m2o	select-dropdown-m2o	{"template":"{{type}}"}	\N	\N	f	f	2	full	\N	\N	\N	t	\N	\N	\N
153	accessories	main_image	file	file-image	\N	\N	\N	f	f	3	half	\N	\N	\N	t	\N	\N	\N
154	accessories	additional_images	files	files	\N	\N	\N	f	f	4	full	\N	\N	\N	t	\N	\N	\N
114	accessories	heading	\N	input	{"placeholder":"Enter the heading"}	\N	\N	f	f	5	full	\N	\N	\N	t	\N	\N	\N
115	accessories	sub_heading	\N	input	{"placeholder":"Enter the subheading"}	\N	\N	f	f	6	full	\N	\N	\N	t	\N	\N	\N
116	accessories	price	\N	input	{"placeholder":"Enter the price"}	\N	\N	f	f	7	full	\N	\N	\N	t	\N	\N	\N
\.


--
-- Data for Name: directus_files; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_files (id, storage, filename_disk, filename_download, title, type, folder, uploaded_by, created_on, modified_by, modified_on, charset, filesize, width, height, duration, embed, description, location, tags, metadata, focal_point_x, focal_point_y, tus_id, tus_data, uploaded_on) FROM stdin;
cc353a63-8ab9-4939-91ef-f676d17b974e	local	cc353a63-8ab9-4939-91ef-f676d17b974e.png	image 2.png	Image 2	image/png	\N	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 09:01:01.883+00	\N	2025-01-08 09:01:02.482+00	\N	1275909	1440	900	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2025-01-08 09:01:02.48+00
a793b016-2c16-4129-86d1-163b00b8b8bf	local	a793b016-2c16-4129-86d1-163b00b8b8bf.png	Group (3).png	Group (3)	image/png	\N	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 09:05:44.667+00	\N	2025-01-08 09:05:44.856+00	\N	705	32	20	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2025-01-08 09:05:44.851+00
11d8ff7d-85ef-4f52-a1e6-0512a56069e1	local	11d8ff7d-85ef-4f52-a1e6-0512a56069e1.png	GooglePay.png	Google Pay	image/png	\N	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 09:13:30.032+00	\N	2025-01-08 09:13:30.119+00	\N	679	29	20	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2025-01-08 09:13:30.117+00
4a14cc70-8e7b-4f99-99c4-70cb9aa19871	local	4a14cc70-8e7b-4f99-99c4-70cb9aa19871.png	GooglePay.png	Google Pay	image/png	\N	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 09:26:51.329+00	\N	2025-01-08 09:26:51.437+00	\N	679	29	20	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2025-01-08 09:26:51.432+00
af5b8b78-b8ec-46df-98c4-e96733b0df96	local	af5b8b78-b8ec-46df-98c4-e96733b0df96.png	Group.png	Group	image/png	\N	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 09:27:17.83+00	\N	2025-01-08 09:27:17.947+00	\N	581	32	20	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2025-01-08 09:27:17.944+00
f7b80867-d7db-4f11-9858-43e7eb2ec32f	local	f7b80867-d7db-4f11-9858-43e7eb2ec32f.png	Mastercard.png	Mastercard	image/png	\N	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 09:28:34.516+00	\N	2025-01-08 09:28:34.588+00	\N	498	30	20	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2025-01-08 09:28:34.584+00
4e8f51fb-20af-4626-b706-7e81d56ed082	local	4e8f51fb-20af-4626-b706-7e81d56ed082.png	Group (1).png	Group (1)	image/png	\N	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 09:29:34.361+00	\N	2025-01-08 09:29:34.4+00	\N	762	33	20	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2025-01-08 09:29:34.399+00
eb495b29-6b15-4880-988b-67c11552ce55	local	eb495b29-6b15-4880-988b-67c11552ce55.png	Group (2).png	Group (2)	image/png	\N	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 09:29:59.844+00	\N	2025-01-08 09:29:59.899+00	\N	945	33	20	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2025-01-08 09:29:59.898+00
9550d554-3f3a-4192-803a-281cb0d12b59	local	9550d554-3f3a-4192-803a-281cb0d12b59.png	Group (3).png	Group (3)	image/png	\N	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 09:30:47.816+00	\N	2025-01-08 09:30:47.966+00	\N	705	32	20	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2025-01-08 09:30:47.963+00
9a9071d9-b797-4c66-a446-54c41ffc3085	local	9a9071d9-b797-4c66-a446-54c41ffc3085.png	ApplePay.png	Apple Pay	image/png	\N	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 09:32:53.61+00	\N	2025-01-08 09:32:53.684+00	\N	552	30	20	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2025-01-08 09:32:53.682+00
b856390d-a075-4286-9e40-a22a96b1e196	local	b856390d-a075-4286-9e40-a22a96b1e196.png	Paypal.png	Paypal	image/png	\N	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 09:35:14.05+00	\N	2025-01-08 09:35:14.136+00	\N	810	30	20	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2025-01-08 09:35:14.133+00
daeb079a-4b31-456c-9eda-e66a3a13e37a	local	daeb079a-4b31-456c-9eda-e66a3a13e37a.png	InstagramLogo.png	Instagram Logo	image/png	\N	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 09:36:31.173+00	\N	2025-01-08 09:36:31.289+00	\N	440	20	20	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2025-01-08 09:36:31.278+00
4648b320-3c4a-47a8-8cec-13ea71f0aa96	local	4648b320-3c4a-47a8-8cec-13ea71f0aa96.png	ic_round-facebook.png	Ic Round Facebook	image/png	\N	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 09:37:26.054+00	\N	2025-01-08 09:37:26.114+00	\N	512	20	20	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2025-01-08 09:37:26.113+00
d6fd9548-7a6f-4237-8d75-5184fcdc751a	local	d6fd9548-7a6f-4237-8d75-5184fcdc751a.png	ph_tiktok-logo-fill.png	pH Tiktok Logo Fill	image/png	\N	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 09:38:29.845+00	\N	2025-01-08 09:38:29.906+00	\N	439	20	20	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2025-01-08 09:38:29.904+00
13a6f94a-2576-4cdc-aa48-c142802143d9	local	13a6f94a-2576-4cdc-aa48-c142802143d9.png	YoutubeLogo.png	YouTube Logo	image/png	\N	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 09:39:34.633+00	\N	2025-01-08 09:39:34.833+00	\N	386	20	20	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2025-01-08 09:39:34.831+00
7e8e0ea1-4c4f-429c-85c6-c00af2d9c11e	local	7e8e0ea1-4c4f-429c-85c6-c00af2d9c11e.png	ph_tiktok-logo-fill.png	pH Tiktok Logo Fill	image/png	\N	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 09:40:12.018+00	\N	2025-01-08 09:40:12.083+00	\N	439	20	20	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2025-01-08 09:40:12.081+00
31c4ccd1-0ece-49b8-b638-d40d54450580	local	31c4ccd1-0ece-49b8-b638-d40d54450580.png	Paypal.png	Paypal	image/png	\N	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 12:51:46.757+00	\N	2025-01-08 12:51:47.059+00	\N	810	30	20	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2025-01-08 12:51:47.055+00
989aead1-e19c-4a11-a769-ac4f3a730dc8	local	989aead1-e19c-4a11-a769-ac4f3a730dc8.png	GooglePay (1).png	Google Pay (1)	image/png	\N	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 12:51:46.737+00	\N	2025-01-08 12:51:47.061+00	\N	679	29	20	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2025-01-08 12:51:47.056+00
e6e8100e-d5c9-436a-84b6-e56f31961045	local	e6e8100e-d5c9-436a-84b6-e56f31961045.png	Group (3).png	Group (3)	image/png	\N	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 12:51:58.402+00	\N	2025-01-08 12:51:58.539+00	\N	705	32	20	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2025-01-08 12:51:58.536+00
09f5207e-46a5-4c18-a7e7-d7edae487b94	local	09f5207e-46a5-4c18-a7e7-d7edae487b94.png	Group (1).png	Group (1)	image/png	\N	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 12:51:58.434+00	\N	2025-01-08 12:51:58.602+00	\N	762	33	20	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2025-01-08 12:51:58.595+00
db4b3099-fcff-417b-8ddc-b7ce856592a0	local	db4b3099-fcff-417b-8ddc-b7ce856592a0.png	Group (2).png	Group (2)	image/png	\N	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 12:51:58.439+00	\N	2025-01-08 12:51:58.619+00	\N	945	33	20	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2025-01-08 12:51:58.606+00
12267427-7782-4f14-9f51-e6ac19032e6d	local	12267427-7782-4f14-9f51-e6ac19032e6d.png	ApplePay.png	Apple Pay	image/png	\N	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 12:51:58.476+00	\N	2025-01-08 12:51:58.64+00	\N	552	30	20	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2025-01-08 12:51:58.632+00
4c2e15a6-b9bb-4cb7-b565-82daff0d1b10	local	4c2e15a6-b9bb-4cb7-b565-82daff0d1b10.png	YoutubeLogo.png	YouTube Logo	image/png	\N	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 13:20:43.905+00	\N	2025-01-08 13:20:44.142+00	\N	386	20	20	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2025-01-08 13:20:44.139+00
a3a41661-38b3-4cd2-883f-bae5d89b4d15	local	a3a41661-38b3-4cd2-883f-bae5d89b4d15.png	ph_tiktok-logo-fill.png	pH Tiktok Logo Fill	image/png	\N	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 13:20:53.284+00	\N	2025-01-08 13:20:53.398+00	\N	439	20	20	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2025-01-08 13:20:53.395+00
4219d9db-edc1-43b4-81dd-ffec3298e076	local	4219d9db-edc1-43b4-81dd-ffec3298e076.png	ApplePay.png	Apple Pay	image/png	\N	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 13:44:09.681+00	\N	2025-01-08 13:44:09.833+00	\N	552	30	20	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2025-01-08 13:44:09.829+00
2a85c8fb-a99a-468e-8f8f-e2615e111b1b	local	2a85c8fb-a99a-468e-8f8f-e2615e111b1b.png	Group (3).png	Group (3)	image/png	\N	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 13:44:09.653+00	\N	2025-01-08 13:44:09.835+00	\N	705	32	20	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2025-01-08 13:44:09.83+00
f6e583ca-7af1-4191-bf08-0b4a9466d016	local	f6e583ca-7af1-4191-bf08-0b4a9466d016.png	Group (2).png	Group (2)	image/png	\N	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 13:44:09.708+00	\N	2025-01-08 13:44:09.832+00	\N	945	33	20	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2025-01-08 13:44:09.828+00
9c822518-4d10-4d6c-b792-a5a5c66f6db2	local	9c822518-4d10-4d6c-b792-a5a5c66f6db2.png	GooglePay.png	Google Pay	image/png	\N	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 13:44:09.725+00	\N	2025-01-08 13:44:09.841+00	\N	679	29	20	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2025-01-08 13:44:09.83+00
48b1f54a-d584-40ce-82df-3c3d8037e8fc	local	48b1f54a-d584-40ce-82df-3c3d8037e8fc.png	Group (1).png	Group (1)	image/png	\N	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 13:44:09.72+00	\N	2025-01-08 13:44:09.842+00	\N	762	33	20	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2025-01-08 13:44:09.831+00
9df3b5a1-4cbe-4d02-b01c-9dae5b799fc0	local	9df3b5a1-4cbe-4d02-b01c-9dae5b799fc0.png	Paypal.png	Paypal	image/png	\N	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 13:44:09.598+00	\N	2025-01-08 13:44:09.853+00	\N	810	30	20	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2025-01-08 13:44:09.847+00
2c3254b8-bafc-46da-a6af-e25f6afebca8	local	2c3254b8-bafc-46da-a6af-e25f6afebca8.png	Mastercard.png	Mastercard	image/png	\N	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 13:44:09.959+00	\N	2025-01-08 13:44:10.055+00	\N	498	30	20	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2025-01-08 13:44:10.054+00
fe68783d-b5c1-4689-b856-590750e06d8c	local	fe68783d-b5c1-4689-b856-590750e06d8c.png	Group.png	Group	image/png	\N	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 13:44:09.963+00	\N	2025-01-08 13:44:10.077+00	\N	581	32	20	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2025-01-08 13:44:10.075+00
6568ed47-6d94-4f5b-8f3b-c09fa1a25f36	local	6568ed47-6d94-4f5b-8f3b-c09fa1a25f36.png	ic_round-facebook.png	Ic Round Facebook	image/png	\N	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 13:54:52.541+00	\N	2025-01-08 13:54:52.971+00	\N	512	20	20	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2025-01-08 13:54:52.968+00
3329912f-e82c-4f2c-8417-7e26a0e307da	local	3329912f-e82c-4f2c-8417-7e26a0e307da.png	InstagramLogo.png	Instagram Logo	image/png	\N	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 13:54:59.898+00	\N	2025-01-08 13:55:00.092+00	\N	440	20	20	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2025-01-08 13:55:00.09+00
b65a1efc-d3f1-4718-835a-68a42332f4d4	local	b65a1efc-d3f1-4718-835a-68a42332f4d4.png	image 2.png	Image 2	image/png	\N	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 15:56:16.149+00	\N	2025-01-08 15:56:16.401+00	\N	1275909	1440	900	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2025-01-08 15:56:16.4+00
87b8e117-bbab-4fa3-95ac-7036da47315b	local	87b8e117-bbab-4fa3-95ac-7036da47315b.png	Content - Image 1.png	Content   Image 1	image/png	\N	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 17:48:38.119+00	\N	2025-01-08 17:48:38.526+00	\N	2505150	6000	3000	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2025-01-08 17:48:38.524+00
9e292dff-6889-445a-a930-76bc403b725b	local	9e292dff-6889-445a-a930-76bc403b725b.png	image 9.png	Image 9	image/png	\N	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 17:54:40.717+00	\N	2025-01-08 17:54:41.604+00	\N	374842	1200	600	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2025-01-08 17:54:41.596+00
7bcea581-1f8a-4c05-9255-7b103587f32b	local	7bcea581-1f8a-4c05-9255-7b103587f32b.png	Group (1).png	Group (1)	image/png	\N	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 19:00:42.636+00	\N	2025-01-08 19:00:43.134+00	\N	762	33	20	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2025-01-08 19:00:43.124+00
908752e2-dbdf-48d7-8d11-f0d2821d238e	local	908752e2-dbdf-48d7-8d11-f0d2821d238e.png	Group.png	Group	image/png	\N	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 19:00:43.451+00	\N	2025-01-08 19:00:43.666+00	\N	581	32	20	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2025-01-08 19:00:43.663+00
c84e680e-64b7-4dfd-8113-265b3985feb2	local	c84e680e-64b7-4dfd-8113-265b3985feb2.png	🦆 icon _Visa_.png	Apple Pay	image/png	\N	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 19:00:42.66+00	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 09:33:54.681+00	\N	2229	155	100	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2025-01-09 09:33:54.657+00
ad3bf48d-0a62-4391-ade8-59a7b3c86c0b	local	ad3bf48d-0a62-4391-ade8-59a7b3c86c0b.png	Group (2).png	Group (2)	image/png	\N	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 19:00:42.552+00	\N	2025-01-08 19:00:43.148+00	\N	945	33	20	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2025-01-08 19:00:43.132+00
8e8d0df1-c31d-4606-9c22-385b01a0f528	local	8e8d0df1-c31d-4606-9c22-385b01a0f528.png	Mastercard.png	Mastercard	image/png	\N	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 19:00:42.728+00	\N	2025-01-08 19:00:43.138+00	\N	498	30	20	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2025-01-08 19:00:43.126+00
943c1113-90ac-4030-9226-f50f4f7590f5	local	943c1113-90ac-4030-9226-f50f4f7590f5.png	GooglePay.png	Google Pay	image/png	\N	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 19:00:43.447+00	\N	2025-01-08 19:00:43.69+00	\N	679	29	20	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2025-01-08 19:00:43.687+00
9eb924c9-09eb-435a-bb4e-b3d9078573b0	local	9eb924c9-09eb-435a-bb4e-b3d9078573b0.png	Group (3).png	Group (3)	image/png	\N	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 19:00:42.839+00	\N	2025-01-08 19:00:43.171+00	\N	705	32	20	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2025-01-08 19:00:43.158+00
22283f06-1f1a-4f0d-9c0e-f1a7ad95bcec	local	22283f06-1f1a-4f0d-9c0e-f1a7ad95bcec.png	image 9.png	Image 9	image/png	\N	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 08:21:45.598+00	\N	2025-01-09 08:21:46.3+00	\N	374842	1200	600	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2025-01-09 08:21:46.297+00
fa1a83fd-0a8c-45f4-b169-2f139c788e0f	local	fa1a83fd-0a8c-45f4-b169-2f139c788e0f.png	Overlay.png	Overlay	image/png	\N	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 08:21:57.323+00	\N	2025-01-09 08:21:58.845+00	\N	7501592	6000	3000	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2025-01-09 08:21:58.841+00
aed535a2-2de3-4655-ba7a-53e87b7490ed	local	aed535a2-2de3-4655-ba7a-53e87b7490ed.png	image 8.png	Image 8	image/png	\N	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 08:26:58.274+00	\N	2025-01-09 08:26:58.873+00	\N	102369	900	900	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2025-01-09 08:26:58.871+00
34a7daba-9659-41bf-b36c-26e86fd8c3f8	local	34a7daba-9659-41bf-b36c-26e86fd8c3f8.png	image 8.png	Image 8	image/png	\N	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 08:27:09.013+00	\N	2025-01-09 08:27:09.217+00	\N	102369	900	900	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2025-01-09 08:27:09.214+00
6cc6c198-8876-440b-92d5-76277f9016a6	local	6cc6c198-8876-440b-92d5-76277f9016a6.png	image 8.png	Image 8	image/png	\N	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 08:27:15.839+00	\N	2025-01-09 08:27:16.224+00	\N	102369	900	900	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2025-01-09 08:27:16.215+00
9b9bc378-8916-4735-9f05-16c51f9ce165	local	9b9bc378-8916-4735-9f05-16c51f9ce165.png	image 8.png	Image 8	image/png	\N	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 08:32:00.235+00	\N	2025-01-09 08:32:00.295+00	\N	102369	900	900	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2025-01-09 08:32:00.293+00
7bcf9cf4-3a7d-4c24-b4ab-b183e746d268	local	7bcf9cf4-3a7d-4c24-b4ab-b183e746d268.png	image 8.png	Image 8	image/png	\N	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 08:40:49.838+00	\N	2025-01-09 08:40:50.061+00	\N	102369	900	900	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2025-01-09 08:40:50.05+00
eb053b63-b683-4b9a-9f23-dde825593f61	local	eb053b63-b683-4b9a-9f23-dde825593f61.png	image 8.png	Image 8	image/png	\N	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 08:42:28.066+00	\N	2025-01-09 08:42:28.173+00	\N	102369	900	900	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2025-01-09 08:42:28.167+00
f960f2fc-4dc0-4743-b27d-5097f52f7d5b	local	f960f2fc-4dc0-4743-b27d-5097f52f7d5b.png	image 8.png	Image 8	image/png	\N	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 08:43:06.494+00	\N	2025-01-09 08:43:06.582+00	\N	102369	900	900	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2025-01-09 08:43:06.58+00
e422f5ed-6233-4bd6-adf6-b8033cf452d1	local	e422f5ed-6233-4bd6-adf6-b8033cf452d1.png	image 8.png	Image 8	image/png	\N	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 08:44:07.751+00	\N	2025-01-09 08:44:07.86+00	\N	102369	900	900	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2025-01-09 08:44:07.85+00
349ac9f4-b421-43d5-8262-821534505d09	local	349ac9f4-b421-43d5-8262-821534505d09.png	image 8.png	Image 8	image/png	\N	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 08:47:16.973+00	\N	2025-01-09 08:47:17.04+00	\N	102369	900	900	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2025-01-09 08:47:17.038+00
15caa33e-9426-4f84-abe6-a8cc3fe84d67	local	15caa33e-9426-4f84-abe6-a8cc3fe84d67.png	image 8.png	Image 8	image/png	\N	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 08:47:47.883+00	\N	2025-01-09 08:47:47.929+00	\N	102369	900	900	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2025-01-09 08:47:47.925+00
ffa48906-4187-495e-8cb8-d4e3da720d8e	local	ffa48906-4187-495e-8cb8-d4e3da720d8e.png	🦆 icon _Visa_.png	🦆 Icon  Visa 	image/png	\N	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 09:37:42.995+00	\N	2025-01-09 09:37:43.086+00	\N	2229	155	100	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2025-01-09 09:37:43.085+00
023d05b1-81b5-45e6-9e30-83713d86f370	local	023d05b1-81b5-45e6-9e30-83713d86f370.png	GooglePay (2).png	Google Pay (2)	image/png	\N	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 09:37:43.052+00	\N	2025-01-09 09:37:43.091+00	\N	3485	145	100	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2025-01-09 09:37:43.09+00
562fdc17-cf8c-415c-827c-9977c84d8dba	local	562fdc17-cf8c-415c-827c-9977c84d8dba.png	GooglePay (2).png	g-pay	image/png	\N	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-08 19:00:42.606+00	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 09:36:33.054+00	\N	3485	145	100	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2025-01-09 09:33:37.585+00
26676457-a204-4b32-b2c5-0c56f5ff6aa8	local	26676457-a204-4b32-b2c5-0c56f5ff6aa8.png	🦆 icon _Visa_ (1).png	🦆 Icon  Visa  (1)	image/png	\N	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 09:37:42.688+00	\N	2025-01-09 09:37:42.904+00	\N	2962	161	100	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2025-01-09 09:37:42.901+00
e3bf3998-03f2-4e7f-b165-5bc99f640e78	local	e3bf3998-03f2-4e7f-b165-5bc99f640e78.png	🦆 icon _amex_.png	🦆 Icon  Amex 	image/png	\N	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 09:37:42.76+00	\N	2025-01-09 09:37:42.92+00	\N	4058	160	100	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2025-01-09 09:37:42.911+00
7cc48476-1d9f-4a50-a628-e44448e4d0a7	local	7cc48476-1d9f-4a50-a628-e44448e4d0a7.png	ApplePay (1).png	Apple Pay (1)	image/png	\N	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 09:37:42.825+00	\N	2025-01-09 09:37:42.985+00	\N	12913	186	140	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2025-01-09 09:37:42.976+00
186c34a8-1848-48c0-b470-363eec7099d4	local	186c34a8-1848-48c0-b470-363eec7099d4.png	🦆 icon _discover_.png	🦆 Icon  Discover 	image/png	\N	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 09:37:42.839+00	\N	2025-01-09 09:37:42.989+00	\N	2836	157	100	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2025-01-09 09:37:42.977+00
32991033-7c21-48e3-b17a-116f1f124dbc	local	32991033-7c21-48e3-b17a-116f1f124dbc.png	Paypal (1).png	Paypal (1)	image/png	\N	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 09:37:42.859+00	\N	2025-01-09 09:37:43.018+00	\N	3796	146	100	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2025-01-09 09:37:43.004+00
e6d19d80-da1a-4176-9d4e-13d0dc4501c7	local	e6d19d80-da1a-4176-9d4e-13d0dc4501c7.png	Mastercard.png	Mastercard	image/png	\N	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 09:37:42.886+00	\N	2025-01-09 09:37:43.043+00	\N	2109	147	100	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2025-01-09 09:37:43.029+00
e1d9a978-7d06-4146-9e8c-0e7a845fc8d9	local	e1d9a978-7d06-4146-9e8c-0e7a845fc8d9.png	image 8.png	Image 8	image/png	\N	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 10:07:47.565+00	\N	2025-01-09 10:07:47.674+00	\N	102369	900	900	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2025-01-09 10:07:47.672+00
0e06fc89-79a6-40f0-86d4-437e53413133	local	0e06fc89-79a6-40f0-86d4-437e53413133.png	image 8.png	Image 8	image/png	\N	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 10:08:28.781+00	\N	2025-01-09 10:08:28.848+00	\N	102369	900	900	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2025-01-09 10:08:28.846+00
b7f75a5b-74e2-4c4d-aab8-a8c025b55dee	local	b7f75a5b-74e2-4c4d-aab8-a8c025b55dee.png	image 8.png	Image 8	image/png	\N	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 10:08:47.096+00	\N	2025-01-09 10:08:47.268+00	\N	102369	900	900	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2025-01-09 10:08:47.266+00
dcee2a16-211f-4f7e-ba4c-5da43b669023	local	dcee2a16-211f-4f7e-ba4c-5da43b669023.png	Mastercard.png	Mastercard	image/png	\N	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 11:37:43.601+00	\N	2025-01-09 11:37:43.694+00	\N	2109	147	100	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2025-01-09 11:37:43.693+00
405c8b4c-933f-42cd-9121-8f31eb516a87	local	405c8b4c-933f-42cd-9121-8f31eb516a87.png	image 8.png	Image 8	image/png	\N	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 11:53:02.157+00	\N	2025-01-09 11:53:02.242+00	\N	102369	900	900	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2025-01-09 11:53:02.241+00
a5b5e1c0-98b1-4885-add5-aa708433b615	local	a5b5e1c0-98b1-4885-add5-aa708433b615.png	image 8.png	Image 8	image/png	\N	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 11:53:45.876+00	\N	2025-01-09 11:53:45.927+00	\N	102369	900	900	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2025-01-09 11:53:45.924+00
f79cc4e0-ef7f-4a26-a52a-1d018bb0808b	local	f79cc4e0-ef7f-4a26-a52a-1d018bb0808b.png	image 8.png	Image 8	image/png	\N	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 11:54:13.755+00	\N	2025-01-09 11:54:13.812+00	\N	102369	900	900	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2025-01-09 11:54:13.811+00
65971f09-8765-47ce-a742-e79e3fd56e1e	local	65971f09-8765-47ce-a742-e79e3fd56e1e.png	image 8.png	Image 8	image/png	\N	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 12:53:15.173+00	\N	2025-01-09 12:53:15.381+00	\N	102369	900	900	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2025-01-09 12:53:15.379+00
e161e149-7a3c-4f14-beb8-84db2fbcc345	local	e161e149-7a3c-4f14-beb8-84db2fbcc345.png	image 8.png	Image 8	image/png	\N	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 13:35:00.53+00	\N	2025-01-09 13:35:00.712+00	\N	102369	900	900	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2025-01-09 13:35:00.71+00
20f7943c-d70d-48d6-a690-0411c74399eb	local	20f7943c-d70d-48d6-a690-0411c74399eb.png	image 8.png	Image 8	image/png	\N	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 14:27:01.637+00	\N	2025-01-09 14:27:01.959+00	\N	102369	900	900	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2025-01-09 14:27:01.943+00
ab586d2a-ba28-4e07-add9-33ff3850d91d	local	ab586d2a-ba28-4e07-add9-33ff3850d91d.png	image 8.png	Image 8	image/png	\N	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 14:28:11.776+00	\N	2025-01-09 14:28:12.075+00	\N	102369	900	900	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2025-01-09 14:28:12.073+00
b65b8bfb-13fb-4f9c-af0f-dfcf68600d3c	local	b65b8bfb-13fb-4f9c-af0f-dfcf68600d3c.png	ApplePay (2).png	Apple Pay (2)	image/png	\N	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 16:35:08.128+00	\N	2025-01-09 16:35:08.577+00	\N	2563	146	100	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2025-01-09 16:35:08.574+00
4f432983-1c62-4ada-aff1-72407a39f3c4	local	4f432983-1c62-4ada-aff1-72407a39f3c4.png	image 8.png	Image 8	image/png	\N	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-09 16:49:27.519+00	\N	2025-01-09 16:49:27.758+00	\N	102369	900	900	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2025-01-09 16:49:27.754+00
c2ced0b0-0c3f-430d-84da-442cf00517ba	local	c2ced0b0-0c3f-430d-84da-442cf00517ba.png	image 8.png	Image 8	image/png	\N	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 06:54:44.033+00	\N	2025-01-10 06:54:44.332+00	\N	102369	900	900	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2025-01-10 06:54:44.33+00
53fcdf48-e8d3-4330-814e-0a5e0c816df4	local	53fcdf48-e8d3-4330-814e-0a5e0c816df4.png	image 8.png	Image 8	image/png	\N	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 06:56:06.624+00	\N	2025-01-10 06:56:06.706+00	\N	102369	900	900	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2025-01-10 06:56:06.701+00
79bd4f79-104e-4afe-b243-191c52fe7f95	local	79bd4f79-104e-4afe-b243-191c52fe7f95.png	image 8.png	Image 8	image/png	\N	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 15:53:07.473+00	\N	2025-01-10 15:53:07.756+00	\N	102369	900	900	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2025-01-10 15:53:07.754+00
5861d0d2-08b9-488c-89ac-b4158c90c290	local	5861d0d2-08b9-488c-89ac-b4158c90c290.png	image 9.png	Image 9	image/png	\N	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 15:53:07.496+00	\N	2025-01-10 15:53:07.75+00	\N	374842	1200	600	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2025-01-10 15:53:07.748+00
b3f12688-dd6a-43fb-8277-1a6e8de88a65	local	b3f12688-dd6a-43fb-8277-1a6e8de88a65.png	image 2.png	Image 2	image/png	\N	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 15:53:07.529+00	\N	2025-01-10 15:53:07.827+00	\N	1275909	1440	900	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2025-01-10 15:53:07.825+00
a8c2af70-b873-4089-9db5-31adc0e95ef4	local	a8c2af70-b873-4089-9db5-31adc0e95ef4.jpg	andrew-palmer-LetTqcaCx9o-unsplash.jpg	Andrew Palmer Let Tqca Cx9o Unsplash	image/jpeg	\N	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 15:58:26.748+00	\N	2025-01-10 15:58:27.385+00	\N	1297360	4145	2394	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2025-01-10 15:58:27.379+00
4d1ccf79-73e8-4392-91bc-abc59c6cd748	local	4d1ccf79-73e8-4392-91bc-abc59c6cd748.jpg	seb-mooze-IzgsIKFghrw-unsplash.jpg	Seb Mooze Izgs Ik Fghrw Unsplash	image/jpeg	\N	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 15:58:26.76+00	\N	2025-01-10 15:58:27.389+00	\N	1448279	3872	2592	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2025-01-10 15:58:27.381+00
96164914-bf98-4865-aaeb-686f9a85603b	local	96164914-bf98-4865-aaeb-686f9a85603b.jpg	marc-wieland-PEX-0qAH5Is-unsplash.jpg	Marc Wieland Pex 0q a H5 Is Unsplash	image/jpeg	\N	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 15:58:26.828+00	\N	2025-01-10 15:58:27.395+00	\N	1181406	3454	2303	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2025-01-10 15:58:27.383+00
9db4d987-76ad-442c-aa5c-bf851b8cd50c	local	9db4d987-76ad-442c-aa5c-bf851b8cd50c.jpg	cristian-grecu-ipckz_9zDXY-unsplash.jpg	Cristian Grecu Ipckz 9z Dxy Unsplash	image/jpeg	\N	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 15:59:39.31+00	\N	2025-01-10 15:59:39.446+00	\N	886861	3861	2574	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2025-01-10 15:59:39.445+00
53e4a952-f407-43ca-b43e-6fab99c32186	local	53e4a952-f407-43ca-b43e-6fab99c32186.jpg	andrew-palmer-LetTqcaCx9o-unsplash.jpg	Andrew Palmer Let Tqca Cx9o Unsplash	image/jpeg	\N	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 15:59:56.99+00	\N	2025-01-10 15:59:57.216+00	\N	1297360	4145	2394	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2025-01-10 15:59:57.213+00
c70383cb-f76a-4eec-866f-2a22b593cc34	local	c70383cb-f76a-4eec-866f-2a22b593cc34.jpg	cristian-grecu-ipckz_9zDXY-unsplash.jpg	Cristian Grecu Ipckz 9z Dxy Unsplash	image/jpeg	\N	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 15:59:57.029+00	\N	2025-01-10 15:59:57.232+00	\N	886861	3861	2574	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2025-01-10 15:59:57.23+00
c4a56dea-c873-4184-87be-98bbd525c451	local	c4a56dea-c873-4184-87be-98bbd525c451.jpg	marc-wieland-PEX-0qAH5Is-unsplash.jpg	Marc Wieland Pex 0q a H5 Is Unsplash	image/jpeg	\N	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 15:59:57.011+00	\N	2025-01-10 15:59:57.246+00	\N	1181406	3454	2303	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2025-01-10 15:59:57.244+00
9d93b3af-7085-45bc-970a-26721b04ef40	local	9d93b3af-7085-45bc-970a-26721b04ef40.jpg	seb-mooze-IzgsIKFghrw-unsplash.jpg	Seb Mooze Izgs Ik Fghrw Unsplash	image/jpeg	\N	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 15:59:57.052+00	\N	2025-01-10 15:59:57.297+00	\N	1448279	3872	2592	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2025-01-10 15:59:57.295+00
4fbbe243-5c7d-49a3-9851-d1d6f96aef51	local	4fbbe243-5c7d-49a3-9851-d1d6f96aef51.jpg	marc-wieland-PEX-0qAH5Is-unsplash.jpg	Marc Wieland Pex 0q a H5 Is Unsplash	image/jpeg	\N	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 16:21:57.313+00	\N	2025-01-10 16:21:57.626+00	\N	1181406	3454	2303	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2025-01-10 16:21:57.618+00
15dc53a3-aa2f-499d-84e8-e92faf02229e	local	15dc53a3-aa2f-499d-84e8-e92faf02229e.jpg	andrew-palmer-LetTqcaCx9o-unsplash.jpg	Andrew Palmer Let Tqca Cx9o Unsplash	image/jpeg	\N	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 16:21:57.34+00	\N	2025-01-10 16:21:57.632+00	\N	1297360	4145	2394	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2025-01-10 16:21:57.628+00
f7260eca-814a-44f4-8ea3-0f875b0f97b1	local	f7260eca-814a-44f4-8ea3-0f875b0f97b1.jpg	seb-mooze-IzgsIKFghrw-unsplash.jpg	Seb Mooze Izgs Ik Fghrw Unsplash	image/jpeg	\N	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 16:21:57.306+00	\N	2025-01-10 16:21:57.717+00	\N	1448279	3872	2592	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2025-01-10 16:21:57.693+00
eff018c2-0258-444b-bc82-6b422d9a0406	local	eff018c2-0258-444b-bc82-6b422d9a0406.jpg	andrew-palmer-LetTqcaCx9o-unsplash.jpg	Andrew Palmer Let Tqca Cx9o Unsplash	image/jpeg	\N	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 17:02:15.64+00	\N	2025-01-10 17:02:16.008+00	\N	1297360	4145	2394	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2025-01-10 17:02:16.005+00
e74a1d3b-51c7-4aaa-9d8a-6f9e0b66c4b6	local	e74a1d3b-51c7-4aaa-9d8a-6f9e0b66c4b6.png	image 8.png	Image 8	image/png	\N	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 17:02:26.574+00	\N	2025-01-10 17:02:26.661+00	\N	102369	900	900	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2025-01-10 17:02:26.66+00
88e27c2c-5994-40d4-a1b5-f73792f84608	local	88e27c2c-5994-40d4-a1b5-f73792f84608.png	image 8.png	Image 8	image/png	\N	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 17:02:36.249+00	\N	2025-01-10 17:02:36.294+00	\N	102369	900	900	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2025-01-10 17:02:36.292+00
fa387a8b-bb5f-447a-a550-2e89d6f66365	local	fa387a8b-bb5f-447a-a550-2e89d6f66365.png	image 8.png	Image 8	image/png	\N	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 17:03:20.281+00	\N	2025-01-10 17:03:20.34+00	\N	102369	900	900	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2025-01-10 17:03:20.338+00
5d37f41b-7aad-49fd-8667-c4dfcec743da	local	5d37f41b-7aad-49fd-8667-c4dfcec743da.png	image 8.png	Image 8	image/png	\N	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 17:03:47.953+00	\N	2025-01-10 17:03:48.012+00	\N	102369	900	900	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2025-01-10 17:03:48.01+00
b05ce73f-b76f-4248-91b6-e71df2360d8f	local	b05ce73f-b76f-4248-91b6-e71df2360d8f.jpg	pexels-juanico-3492103.jpg	Pexels Juanico 3492103	image/jpeg	\N	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 17:53:15.943+00	\N	2025-01-10 17:53:16.446+00	\N	197108	1824	2736	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2025-01-10 17:53:16.44+00
cb8682cd-b80d-4658-895d-f47dc8a9c23a	local	cb8682cd-b80d-4658-895d-f47dc8a9c23a.jpg	pexels-chaikong2511-104755.jpg	Pexels Chaikong2511 104755	image/jpeg	\N	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 17:53:16.271+00	\N	2025-01-10 17:53:16.448+00	\N	443627	5760	3346	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2025-01-10 17:53:16.443+00
6bef1de6-3665-471c-ba4b-d32ed83ce9bc	local	6bef1de6-3665-471c-ba4b-d32ed83ce9bc.jpg	pexels-enginakyurt-1486842.jpg	Pexels Enginakyurt 1486842	image/jpeg	\N	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 17:53:15.965+00	\N	2025-01-10 17:53:16.451+00	\N	481459	4500	3001	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2025-01-10 17:53:16.444+00
f1418393-8118-4161-88f4-1df01313003a	local	f1418393-8118-4161-88f4-1df01313003a.jpg	jonatan-pie-E_evyqBBFEQ-unsplash.jpg	Jonatan Pie E Evyq Bbfeq Unsplash	image/jpeg	\N	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 17:53:40.797+00	\N	2025-01-10 17:53:41.117+00	\N	1183972	4240	2832	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2025-01-10 17:53:41.115+00
dea5add6-517b-416b-ad89-3ab128143b23	local	dea5add6-517b-416b-ad89-3ab128143b23.jpg	pexels-messalaciulla-914381.jpg	Pexels Messalaciulla 914381	image/jpeg	\N	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 17:53:40.677+00	\N	2025-01-10 17:53:41.237+00	\N	1985730	4928	3264	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2025-01-10 17:53:41.222+00
dab41adf-1f8b-41c9-bd15-73e587a9a286	local	dab41adf-1f8b-41c9-bd15-73e587a9a286.jpg	neil-mark-thomas-hgIJfyEaQQQ-unsplash.jpg	Neil Mark Thomas Hg I Jfy Ea Qqq Unsplash	image/jpeg	\N	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 17:53:40.735+00	\N	2025-01-10 17:53:41.38+00	\N	3595240	3180	4770	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2025-01-10 17:53:41.378+00
baad0908-6731-47af-9a0b-71f1398a0502	local	baad0908-6731-47af-9a0b-71f1398a0502.jpg	tim-dennert-yKhAns1tW54-unsplash.jpg	Tim Dennert Y Kh Ans1t W54 Unsplash	image/jpeg	\N	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 17:53:40.75+00	\N	2025-01-10 17:53:41.417+00	\N	3841342	5184	3456	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2025-01-10 17:53:41.412+00
8014f172-e017-4d41-9cde-c31ea0562ef3	local	8014f172-e017-4d41-9cde-c31ea0562ef3.jpg	cristian-grecu-ipckz_9zDXY-unsplash.jpg	Cristian Grecu Ipckz 9z Dxy Unsplash	image/jpeg	\N	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 17:54:01.483+00	\N	2025-01-10 17:54:01.758+00	\N	886861	3861	2574	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2025-01-10 17:54:01.75+00
92bea263-2997-4b8a-b8a6-d920d8d9c895	local	92bea263-2997-4b8a-b8a6-d920d8d9c895.jpg	pexels-sevenstormphotography-1479425.jpg	Pexels Sevenstormphotography 1479425	image/jpeg	\N	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 17:54:01.263+00	\N	2025-01-10 17:54:01.781+00	\N	1016077	5184	3786	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2025-01-10 17:54:01.778+00
99b1444f-d6be-4731-a71e-1a091c5ec3fc	local	99b1444f-d6be-4731-a71e-1a091c5ec3fc.jpg	jonatan-pie-E_evyqBBFEQ-unsplash.jpg	Jonatan Pie E Evyq Bbfeq Unsplash	image/jpeg	\N	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 17:54:01.446+00	\N	2025-01-10 17:54:01.837+00	\N	1183972	4240	2832	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2025-01-10 17:54:01.833+00
4dbb5c1e-c066-438f-a907-74d197b6df0e	local	4dbb5c1e-c066-438f-a907-74d197b6df0e.jpg	pexels-messalaciulla-914381.jpg	Pexels Messalaciulla 914381	image/jpeg	\N	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 17:54:01.521+00	\N	2025-01-10 17:54:01.899+00	\N	1985730	4928	3264	\N	\N	\N	\N	\N	{}	\N	\N	\N	\N	2025-01-10 17:54:01.898+00
\.


--
-- Data for Name: directus_flows; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_flows (id, name, icon, color, description, status, trigger, accountability, options, operation, date_created, user_created) FROM stdin;
\.


--
-- Data for Name: directus_folders; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_folders (id, name, parent) FROM stdin;
\.


--
-- Data for Name: directus_migrations; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_migrations (version, name, "timestamp") FROM stdin;
20201028A	Remove Collection Foreign Keys	2025-01-07 12:33:40.593921+00
20201029A	Remove System Relations	2025-01-07 12:33:40.629023+00
20201029B	Remove System Collections	2025-01-07 12:33:40.660988+00
20201029C	Remove System Fields	2025-01-07 12:33:40.69775+00
20201105A	Add Cascade System Relations	2025-01-07 12:33:40.87782+00
20201105B	Change Webhook URL Type	2025-01-07 12:33:40.905208+00
20210225A	Add Relations Sort Field	2025-01-07 12:33:40.927315+00
20210304A	Remove Locked Fields	2025-01-07 12:33:40.940424+00
20210312A	Webhooks Collections Text	2025-01-07 12:33:40.963156+00
20210331A	Add Refresh Interval	2025-01-07 12:33:40.976294+00
20210415A	Make Filesize Nullable	2025-01-07 12:33:41.005526+00
20210416A	Add Collections Accountability	2025-01-07 12:33:41.027536+00
20210422A	Remove Files Interface	2025-01-07 12:33:41.043773+00
20210506A	Rename Interfaces	2025-01-07 12:33:41.141102+00
20210510A	Restructure Relations	2025-01-07 12:33:41.241312+00
20210518A	Add Foreign Key Constraints	2025-01-07 12:33:41.269469+00
20210519A	Add System Fk Triggers	2025-01-07 12:33:41.361891+00
20210521A	Add Collections Icon Color	2025-01-07 12:33:41.372165+00
20210525A	Add Insights	2025-01-07 12:33:41.466146+00
20210608A	Add Deep Clone Config	2025-01-07 12:33:41.476172+00
20210626A	Change Filesize Bigint	2025-01-07 12:33:41.541798+00
20210716A	Add Conditions to Fields	2025-01-07 12:33:41.552565+00
20210721A	Add Default Folder	2025-01-07 12:33:41.573459+00
20210802A	Replace Groups	2025-01-07 12:33:41.596432+00
20210803A	Add Required to Fields	2025-01-07 12:33:41.608349+00
20210805A	Update Groups	2025-01-07 12:33:41.626387+00
20210805B	Change Image Metadata Structure	2025-01-07 12:33:41.654688+00
20210811A	Add Geometry Config	2025-01-07 12:33:41.671837+00
20210831A	Remove Limit Column	2025-01-07 12:33:41.703436+00
20210903A	Add Auth Provider	2025-01-07 12:33:41.82497+00
20210907A	Webhooks Collections Not Null	2025-01-07 12:33:41.912747+00
20210910A	Move Module Setup	2025-01-07 12:33:41.949038+00
20210920A	Webhooks URL Not Null	2025-01-07 12:33:42.011248+00
20210924A	Add Collection Organization	2025-01-07 12:33:42.039124+00
20210927A	Replace Fields Group	2025-01-07 12:33:42.067911+00
20210927B	Replace M2M Interface	2025-01-07 12:33:42.081489+00
20210929A	Rename Login Action	2025-01-07 12:33:42.090909+00
20211007A	Update Presets	2025-01-07 12:33:42.13453+00
20211009A	Add Auth Data	2025-01-07 12:33:42.145418+00
20211016A	Add Webhook Headers	2025-01-07 12:33:42.155418+00
20211103A	Set Unique to User Token	2025-01-07 12:33:42.174163+00
20211103B	Update Special Geometry	2025-01-07 12:33:42.186573+00
20211104A	Remove Collections Listing	2025-01-07 12:33:42.203226+00
20211118A	Add Notifications	2025-01-07 12:33:42.294945+00
20211211A	Add Shares	2025-01-07 12:33:42.374288+00
20211230A	Add Project Descriptor	2025-01-07 12:33:42.384569+00
20220303A	Remove Default Project Color	2025-01-07 12:33:42.408541+00
20220308A	Add Bookmark Icon and Color	2025-01-07 12:33:42.421193+00
20220314A	Add Translation Strings	2025-01-07 12:33:42.436859+00
20220322A	Rename Field Typecast Flags	2025-01-07 12:33:42.453658+00
20220323A	Add Field Validation	2025-01-07 12:33:42.469571+00
20220325A	Fix Typecast Flags	2025-01-07 12:33:42.493731+00
20220325B	Add Default Language	2025-01-07 12:33:42.529475+00
20220402A	Remove Default Value Panel Icon	2025-01-07 12:33:42.562062+00
20220429A	Add Flows	2025-01-07 12:33:42.736361+00
20220429B	Add Color to Insights Icon	2025-01-07 12:33:42.747318+00
20220429C	Drop Non Null From IP of Activity	2025-01-07 12:33:42.762332+00
20220429D	Drop Non Null From Sender of Notifications	2025-01-07 12:33:42.774487+00
20220614A	Rename Hook Trigger to Event	2025-01-07 12:33:42.788358+00
20220801A	Update Notifications Timestamp Column	2025-01-07 12:33:42.819834+00
20220802A	Add Custom Aspect Ratios	2025-01-07 12:33:42.832482+00
20220826A	Add Origin to Accountability	2025-01-07 12:33:42.857951+00
20230401A	Update Material Icons	2025-01-07 12:33:42.903992+00
20230525A	Add Preview Settings	2025-01-07 12:33:42.91566+00
20230526A	Migrate Translation Strings	2025-01-07 12:33:42.980503+00
20230721A	Require Shares Fields	2025-01-07 12:33:43.017297+00
20230823A	Add Content Versioning	2025-01-07 12:33:43.14352+00
20230927A	Themes	2025-01-07 12:33:43.207448+00
20231009A	Update CSV Fields to Text	2025-01-07 12:33:43.219322+00
20231009B	Update Panel Options	2025-01-07 12:33:43.231259+00
20231010A	Add Extensions	2025-01-07 12:33:43.264355+00
20231215A	Add Focalpoints	2025-01-07 12:33:43.277045+00
20240122A	Add Report URL Fields	2025-01-07 12:33:43.292819+00
20240204A	Marketplace	2025-01-07 12:33:43.404348+00
20240305A	Change Useragent Type	2025-01-07 12:33:43.433979+00
20240311A	Deprecate Webhooks	2025-01-07 12:33:43.475141+00
20240422A	Public Registration	2025-01-07 12:33:43.50249+00
20240515A	Add Session Window	2025-01-07 12:33:43.517225+00
20240701A	Add Tus Data	2025-01-07 12:33:43.532846+00
20240716A	Update Files Date Fields	2025-01-07 12:33:43.554444+00
20240806A	Permissions Policies	2025-01-07 12:33:43.743966+00
20240817A	Update Icon Fields Length	2025-01-07 12:33:43.834199+00
20240909A	Separate Comments	2025-01-07 12:33:43.886992+00
20240909B	Consolidate Content Versioning	2025-01-07 12:33:43.897846+00
20240924A	Migrate Legacy Comments	2025-01-07 12:33:43.916724+00
20240924B	Populate Versioning Deltas	2025-01-07 12:33:43.934259+00
\.


--
-- Data for Name: directus_notifications; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_notifications (id, "timestamp", status, recipient, sender, subject, message, collection, item) FROM stdin;
\.


--
-- Data for Name: directus_operations; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_operations (id, name, key, type, position_x, position_y, options, resolve, reject, flow, date_created, user_created) FROM stdin;
\.


--
-- Data for Name: directus_panels; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_panels (id, dashboard, name, icon, color, show_header, note, type, position_x, position_y, width, height, options, date_created, user_created) FROM stdin;
\.


--
-- Data for Name: directus_permissions; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_permissions (id, collection, action, permissions, validation, presets, fields, policy) FROM stdin;
1	header	read	\N	\N	\N	*	abf8a154-5b1c-4a46-ac9c-7300570f4f17
6	footer	read	\N	\N	\N	*	abf8a154-5b1c-4a46-ac9c-7300570f4f17
7	footer_social_icons	read	\N	\N	\N	*	abf8a154-5b1c-4a46-ac9c-7300570f4f17
8	hero_section	read	\N	\N	\N	*	abf8a154-5b1c-4a46-ac9c-7300570f4f17
9	feature_section	read	\N	\N	\N	*	abf8a154-5b1c-4a46-ac9c-7300570f4f17
10	accessories	read	\N	\N	\N	*	abf8a154-5b1c-4a46-ac9c-7300570f4f17
12	footer_files	read	\N	\N	\N	*	abf8a154-5b1c-4a46-ac9c-7300570f4f17
13	accessories_type	read	\N	\N	\N	*	abf8a154-5b1c-4a46-ac9c-7300570f4f17
16	accessories_files	read	\N	\N	\N	*	abf8a154-5b1c-4a46-ac9c-7300570f4f17
\.


--
-- Data for Name: directus_policies; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_policies (id, name, icon, description, ip_access, enforce_tfa, admin_access, app_access) FROM stdin;
abf8a154-5b1c-4a46-ac9c-7300570f4f17	$t:public_label	public	$t:public_description	\N	f	f	f
89c77a9a-7220-4886-b2dd-2f222280b158	Administrator	verified	$t:admin_description	\N	f	t	t
\.


--
-- Data for Name: directus_presets; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_presets (id, bookmark, "user", role, collection, search, layout, layout_query, layout_options, refresh_interval, filter, icon, color) FROM stdin;
7	\N	10c73097-e1f9-4f52-9007-ac783d8d74e9	\N	directus_files	\N	cards	{"cards":{"sort":["-uploaded_on"],"page":1}}	{"cards":{"icon":"insert_drive_file","title":"{{ title }}","subtitle":"{{ type }} • {{ filesize }}","size":4,"imageFit":"crop"}}	\N	\N	bookmark	\N
9	\N	10c73097-e1f9-4f52-9007-ac783d8d74e9	\N	footer_social_icons	\N	\N	{"tabular":{"fields":["image","image.title","image.$thumbnail"]}}	\N	\N	\N	bookmark	\N
11	\N	10c73097-e1f9-4f52-9007-ac783d8d74e9	\N	header	\N	\N	{"tabular":{"page":1}}	\N	\N	\N	bookmark	\N
10	\N	10c73097-e1f9-4f52-9007-ac783d8d74e9	\N	feature_section	\N	\N	{"tabular":{"page":1}}	\N	\N	\N	bookmark	\N
12	\N	10c73097-e1f9-4f52-9007-ac783d8d74e9	\N	hero_section	\N	\N	{"tabular":{"page":1}}	\N	\N	\N	bookmark	\N
13	\N	10c73097-e1f9-4f52-9007-ac783d8d74e9	\N	accessories	\N	\N	{"tabular":{"page":1,"fields":["heading","image","price","sub_heading","type"]}}	\N	\N	\N	bookmark	\N
\.


--
-- Data for Name: directus_relations; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_relations (id, many_collection, many_field, one_collection, one_field, one_collection_field, one_allowed_collections, junction_field, sort_field, one_deselect_action) FROM stdin;
16	footer_social_icons	image	directus_files	\N	\N	\N	\N	\N	nullify
19	hero_section	bg_img	directus_files	\N	\N	\N	\N	\N	nullify
20	feature_section	bg_img	directus_files	\N	\N	\N	\N	\N	nullify
21	footer_files	directus_files_id	directus_files	\N	\N	\N	footer_id	\N	nullify
22	footer_files	footer_id	footer	payemnt_img	\N	\N	directus_files_id	\N	nullify
32	accessories_type	image	directus_files	\N	\N	\N	\N	\N	nullify
35	accessories	type	accessories_type	\N	\N	\N	\N	\N	nullify
42	accessories	main_image	directus_files	\N	\N	\N	\N	\N	nullify
43	accessories_files	directus_files_id	directus_files	\N	\N	\N	accessories_id	\N	nullify
44	accessories_files	accessories_id	accessories	additional_images	\N	\N	directus_files_id	\N	nullify
\.


--
-- Data for Name: directus_revisions; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_revisions (id, activity, collection, item, data, delta, parent, version) FROM stdin;
1	2	directus_fields	1	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"header"}	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"header"}	\N	\N
2	3	directus_collections	header	{"singleton":false,"collection":"header"}	{"singleton":false,"collection":"header"}	\N	\N
3	4	directus_fields	2	{"sort":2,"interface":"input","special":null,"required":true,"collection":"header","field":"title"}	{"sort":2,"interface":"input","special":null,"required":true,"collection":"header","field":"title"}	\N	\N
4	5	directus_fields	3	{"sort":3,"interface":"input","special":null,"required":true,"collection":"header","field":"slug"}	{"sort":3,"interface":"input","special":null,"required":true,"collection":"header","field":"slug"}	\N	\N
5	6	directus_fields	2	{"id":2,"collection":"header","field":"title","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":2,"width":"half","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"header","field":"title","width":"half"}	\N	\N
6	7	directus_fields	3	{"id":3,"collection":"header","field":"slug","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":3,"width":"half","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"header","field":"slug","width":"half"}	\N	\N
7	8	header	1	{"title":"200 MP","slug":"200-mp"}	{"title":"200 MP","slug":"200-mp"}	\N	\N
8	9	header	2	{"title":"Accessories","slug":"accessories"}	{"title":"Accessories","slug":"accessories"}	\N	\N
9	10	header	3	{"title":"Consumables","slug":"consumables"}	{"title":"Consumables","slug":"consumables"}	\N	\N
10	11	header	4	{"title":"Company","slug":"company"}	{"title":"Company","slug":"company"}	\N	\N
11	12	directus_permissions	1	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"header","action":"read"}	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"header","action":"read"}	\N	\N
12	14	directus_fields	4	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"footer"}	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"footer"}	\N	\N
13	15	directus_collections	footer	{"singleton":false,"collection":"footer"}	{"singleton":false,"collection":"footer"}	\N	\N
14	16	directus_fields	5	{"sort":2,"interface":"input","special":null,"collection":"footer","field":"title"}	{"sort":2,"interface":"input","special":null,"collection":"footer","field":"title"}	\N	\N
15	17	directus_fields	5	{"id":5,"collection":"footer","field":"title","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":2,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"footer","field":"title","width":"half"}	\N	\N
16	18	directus_fields	6	{"sort":3,"interface":"tags","special":["cast-json"],"options":{"presets":[]},"collection":"footer","field":"items"}	{"sort":3,"interface":"tags","special":["cast-json"],"options":{"presets":[]},"collection":"footer","field":"items"}	\N	\N
17	19	directus_fields	6	{"id":6,"collection":"footer","field":"items","special":["cast-json"],"interface":"tags","options":{"presets":[]},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":3,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"footer","field":"items","width":"half"}	\N	\N
23	25	directus_permissions	2	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"footer","action":"read"}	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"footer","action":"read"}	\N	\N
24	28	directus_fields	7	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"footer"}	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"footer"}	\N	\N
25	29	directus_collections	footer	{"singleton":false,"collection":"footer"}	{"singleton":false,"collection":"footer"}	\N	\N
26	30	directus_fields	8	{"sort":2,"interface":"input","special":null,"collection":"footer","field":"category"}	{"sort":2,"interface":"input","special":null,"collection":"footer","field":"category"}	\N	\N
27	31	directus_fields	9	{"sort":3,"interface":"tags","special":["cast-json"],"collection":"footer","field":"options"}	{"sort":3,"interface":"tags","special":["cast-json"],"collection":"footer","field":"options"}	\N	\N
28	32	directus_fields	10	{"sort":3,"interface":"select-dropdown","special":null,"options":{"choices":null},"collection":"footer","field":"options"}	{"sort":3,"interface":"select-dropdown","special":null,"options":{"choices":null},"collection":"footer","field":"options"}	\N	\N
30	35	directus_fields	11	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"footer_options"}	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"footer_options"}	\N	\N
31	36	directus_collections	footer_options	{"singleton":false,"collection":"footer_options"}	{"singleton":false,"collection":"footer_options"}	\N	\N
32	37	directus_fields	12	{"sort":2,"interface":"select-dropdown-m2o","special":["m2o"],"options":{"template":"{{category}}"},"collection":"footer_options","field":"cat_id"}	{"sort":2,"interface":"select-dropdown-m2o","special":["m2o"],"options":{"template":"{{category}}"},"collection":"footer_options","field":"cat_id"}	\N	\N
33	38	directus_fields	13	{"sort":1,"hidden":true,"field":"id","collection":"footer_options_undefined"}	{"sort":1,"hidden":true,"field":"id","collection":"footer_options_undefined"}	\N	\N
34	39	directus_collections	footer_options_undefined	{"hidden":true,"icon":"import_export","collection":"footer_options_undefined"}	{"hidden":true,"icon":"import_export","collection":"footer_options_undefined"}	\N	\N
35	40	directus_fields	14	{"sort":2,"hidden":true,"collection":"footer_options_undefined","field":"footer_options_id"}	{"sort":2,"hidden":true,"collection":"footer_options_undefined","field":"footer_options_id"}	\N	\N
36	41	directus_fields	15	{"sort":3,"hidden":true,"collection":"footer_options_undefined","field":"item"}	{"sort":3,"hidden":true,"collection":"footer_options_undefined","field":"item"}	\N	\N
37	42	directus_fields	16	{"sort":4,"hidden":true,"collection":"footer_options_undefined","field":"collection"}	{"sort":4,"hidden":true,"collection":"footer_options_undefined","field":"collection"}	\N	\N
38	43	directus_fields	17	{"sort":3,"interface":"input","special":null,"collection":"footer_options","field":"slug"}	{"sort":3,"interface":"input","special":null,"collection":"footer_options","field":"slug"}	\N	\N
39	44	directus_fields	18	{"sort":4,"interface":"input","special":null,"collection":"footer_options","field":"name"}	{"sort":4,"interface":"input","special":null,"collection":"footer_options","field":"name"}	\N	\N
43	49	directus_fields	19	{"sort":5,"interface":"list-o2m","special":["o2m"],"collection":"footer_options","field":"cat_id_2"}	{"sort":5,"interface":"list-o2m","special":["o2m"],"collection":"footer_options","field":"cat_id_2"}	\N	\N
45	51	directus_fields	20	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"user"}	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"user"}	\N	\N
46	52	directus_collections	user	{"singleton":false,"collection":"user"}	{"singleton":false,"collection":"user"}	\N	\N
47	53	directus_fields	21	{"sort":2,"interface":"input","special":null,"collection":"user","field":"name"}	{"sort":2,"interface":"input","special":null,"collection":"user","field":"name"}	\N	\N
48	54	directus_fields	22	{"sort":3,"interface":"input","special":null,"collection":"user","field":"email"}	{"sort":3,"interface":"input","special":null,"collection":"user","field":"email"}	\N	\N
50	56	directus_fields	23	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"fav_things"}	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"fav_things"}	\N	\N
51	57	directus_collections	fav_things	{"singleton":false,"collection":"fav_things"}	{"singleton":false,"collection":"fav_things"}	\N	\N
52	58	directus_fields	24	{"sort":2,"interface":"input","special":null,"collection":"fav_things","field":"name"}	{"sort":2,"interface":"input","special":null,"collection":"fav_things","field":"name"}	\N	\N
58	64	directus_fields	25	{"sort":4,"interface":"list-o2m","special":["o2m"],"collection":"user","field":"likes"}	{"sort":4,"interface":"list-o2m","special":["o2m"],"collection":"user","field":"likes"}	\N	\N
59	65	directus_fields	26	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"things_user_map"}	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"things_user_map"}	\N	\N
60	66	directus_collections	things_user_map	{"singleton":false,"collection":"things_user_map"}	{"singleton":false,"collection":"things_user_map"}	\N	\N
61	67	directus_fields	27	{"sort":2,"interface":"list-o2m","special":["o2m"],"options":{"sort":null},"required":false,"collection":"things_user_map","field":"user_id"}	{"sort":2,"interface":"list-o2m","special":["o2m"],"options":{"sort":null},"required":false,"collection":"things_user_map","field":"user_id"}	\N	\N
62	68	directus_fields	28	{"sort":2,"interface":"list-m2a","special":["m2a"],"collection":"things_user_map","field":"test"}	{"sort":2,"interface":"list-m2a","special":["m2a"],"collection":"things_user_map","field":"test"}	\N	\N
63	69	directus_fields	29	{"sort":1,"hidden":true,"field":"id","collection":"things_user_map_test"}	{"sort":1,"hidden":true,"field":"id","collection":"things_user_map_test"}	\N	\N
64	70	directus_collections	things_user_map_test	{"hidden":true,"icon":"import_export","collection":"things_user_map_test"}	{"hidden":true,"icon":"import_export","collection":"things_user_map_test"}	\N	\N
65	71	directus_fields	30	{"sort":2,"hidden":true,"collection":"things_user_map_test","field":"things_user_map_id"}	{"sort":2,"hidden":true,"collection":"things_user_map_test","field":"things_user_map_id"}	\N	\N
66	72	directus_fields	31	{"sort":3,"hidden":true,"collection":"things_user_map_test","field":"item"}	{"sort":3,"hidden":true,"collection":"things_user_map_test","field":"item"}	\N	\N
67	73	directus_fields	32	{"sort":4,"hidden":true,"collection":"things_user_map_test","field":"collection"}	{"sort":4,"hidden":true,"collection":"things_user_map_test","field":"collection"}	\N	\N
73	81	directus_fields	33	{"sort":2,"interface":"select-dropdown-m2o","special":["m2o"],"options":{"template":"{{name}}"},"collection":"things_user_map","field":"user_id"}	{"sort":2,"interface":"select-dropdown-m2o","special":["m2o"],"options":{"template":"{{name}}"},"collection":"things_user_map","field":"user_id"}	\N	\N
74	82	directus_fields	34	{"sort":3,"interface":"select-dropdown-m2o","special":["m2o"],"required":false,"options":{"template":"{{name}}"},"collection":"things_user_map","field":"thing_id"}	{"sort":3,"interface":"select-dropdown-m2o","special":["m2o"],"required":false,"options":{"template":"{{name}}"},"collection":"things_user_map","field":"thing_id"}	\N	\N
81	89	directus_fields	33	{"id":33,"collection":"things_user_map","field":"user_id","special":["m2o"],"interface":"select-dropdown-m2o","options":{"template":"{{name}}{{email}}","enableLink":true},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":2,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"things_user_map","field":"user_id","options":{"template":"{{name}}{{email}}","enableLink":true}}	\N	\N
82	90	directus_fields	12	{"id":12,"collection":"footer_options","field":"cat_id","special":["m2o"],"interface":"select-dropdown-m2o","options":{"template":"{{category}}","enableLink":true},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":2,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"footer_options","field":"cat_id","options":{"template":"{{category}}","enableLink":true}}	\N	\N
84	97	directus_fields	35	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"footer_category"}	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"footer_category"}	\N	\N
85	98	directus_collections	footer_category	{"singleton":false,"collection":"footer_category"}	{"singleton":false,"collection":"footer_category"}	\N	\N
86	99	directus_fields	36	{"sort":2,"interface":"input","special":null,"required":true,"collection":"footer_category","field":"category"}	{"sort":2,"interface":"input","special":null,"required":true,"collection":"footer_category","field":"category"}	\N	\N
89	102	directus_fields	37	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"footer_options"}	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"footer_options"}	\N	\N
90	103	directus_collections	footer_options	{"singleton":false,"collection":"footer_options"}	{"singleton":false,"collection":"footer_options"}	\N	\N
91	104	directus_fields	38	{"sort":2,"interface":"select-dropdown-m2o","special":["m2o"],"collection":"footer_options","field":"options"}	{"sort":2,"interface":"select-dropdown-m2o","special":["m2o"],"collection":"footer_options","field":"options"}	\N	\N
92	105	directus_fields	39	{"sort":3,"interface":"select-dropdown-m2o","special":["m2o"],"options":{"template":"{{category}}"},"collection":"footer_options","field":"cat"}	{"sort":3,"interface":"select-dropdown-m2o","special":["m2o"],"options":{"template":"{{category}}"},"collection":"footer_options","field":"cat"}	\N	\N
93	106	directus_fields	40	{"sort":2,"interface":"select-dropdown-m2o","special":["m2o"],"options":{"template":"{{id}}"},"collection":"footer_options","field":"cat_id"}	{"sort":2,"interface":"select-dropdown-m2o","special":["m2o"],"options":{"template":"{{id}}"},"collection":"footer_options","field":"cat_id"}	\N	\N
94	107	directus_fields	40	{"id":40,"collection":"footer_options","field":"cat_id","special":["m2o"],"interface":"select-dropdown-m2o","options":{"template":"{{id}}{{category}}"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":2,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"footer_options","field":"cat_id","options":{"template":"{{id}}{{category}}"}}	\N	\N
95	108	directus_fields	40	{"id":40,"collection":"footer_options","field":"cat_id","special":["m2o"],"interface":"select-dropdown-m2o","options":{"template":"{{id}}-{{category}}"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":2,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"footer_options","field":"cat_id","options":{"template":"{{id}}-{{category}}"}}	\N	\N
96	109	directus_fields	40	{"id":40,"collection":"footer_options","field":"cat_id","special":["m2o"],"interface":"select-dropdown-m2o","options":{"template":"{{category}}"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":2,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"footer_options","field":"cat_id","options":{"template":"{{category}}"}}	\N	\N
97	110	directus_fields	41	{"sort":3,"interface":"input","special":null,"collection":"footer_options","field":"options"}	{"sort":3,"interface":"input","special":null,"collection":"footer_options","field":"options"}	\N	\N
98	111	directus_fields	42	{"sort":4,"interface":"input","special":null,"collection":"footer_options","field":"slug"}	{"sort":4,"interface":"input","special":null,"collection":"footer_options","field":"slug"}	\N	\N
113	126	directus_permissions	3	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"footer_category","action":"read"}	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"footer_category","action":"read"}	\N	\N
114	127	directus_permissions	4	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"footer_options","action":"read"}	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"footer_options","action":"read"}	\N	\N
115	129	directus_fields	43	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"footer_payment"}	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"footer_payment"}	\N	\N
116	130	directus_collections	footer_payment	{"singleton":false,"collection":"footer_payment"}	{"singleton":false,"collection":"footer_payment"}	\N	\N
117	131	directus_fields	44	{"sort":2,"interface":"file-image","special":["file"],"required":true,"collection":"footer_payment","field":"image"}	{"sort":2,"interface":"file-image","special":["file"],"required":true,"collection":"footer_payment","field":"image"}	\N	\N
118	132	directus_files	aa23ba5d-a8ba-4fe5-be6d-a083127753bf	{"title":"Google Pay","filename_download":"GooglePay.svg","type":"image/svg+xml","storage":"local"}	{"title":"Google Pay","filename_download":"GooglePay.svg","type":"image/svg+xml","storage":"local"}	\N	\N
119	134	directus_files	bb7bc0e9-041f-4927-8978-19ff8e4bc3e7	{"title":"Google Pay","filename_download":"GooglePay.svg","type":"image/svg+xml","storage":"local"}	{"title":"Google Pay","filename_download":"GooglePay.svg","type":"image/svg+xml","storage":"local"}	\N	\N
120	136	directus_files	921e244c-af89-4656-8342-9be852694e8a	{"title":"Google Pay","filename_download":"GooglePay.svg","type":"image/svg+xml","storage":"local"}	{"title":"Google Pay","filename_download":"GooglePay.svg","type":"image/svg+xml","storage":"local"}	\N	\N
121	138	directus_files	3cab4ff4-8fc7-4694-aece-a576037b8917	{"title":"Magnifying Glass","filename_download":"MagnifyingGlass.svg","type":"image/svg+xml","storage":"local"}	{"title":"Magnifying Glass","filename_download":"MagnifyingGlass.svg","type":"image/svg+xml","storage":"local"}	\N	\N
122	140	directus_files	3004340e-8d0f-4a9d-ad05-c868d2caf718	{"title":"Google Pay","filename_download":"GooglePay.png","type":"image/png","storage":"local"}	{"title":"Google Pay","filename_download":"GooglePay.png","type":"image/png","storage":"local"}	\N	\N
123	142	directus_files	1bcbb62a-555b-44cd-801d-e1ad5d576297	{"title":"Google Pay","filename_download":"GooglePay.png","type":"image/png","storage":"local"}	{"title":"Google Pay","filename_download":"GooglePay.png","type":"image/png","storage":"local"}	\N	\N
124	144	directus_fields	44	{"id":44,"collection":"footer_payment","field":"image","special":["file"],"interface":"file-image","options":null,"display":"image","display_options":null,"readonly":false,"hidden":false,"sort":2,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"footer_payment","field":"image","interface":"file-image","display":"image"}	\N	\N
125	145	directus_files	621d21b0-e062-404f-ba24-274dba50c612	{"title":"Google Pay","filename_download":"GooglePay.png","type":"image/png","storage":"local"}	{"title":"Google Pay","filename_download":"GooglePay.png","type":"image/png","storage":"local"}	\N	\N
126	147	directus_files	964faff6-77e3-48f6-8d42-2aed544c63e1	{"title":"Google Pay (1)","filename_download":"GooglePay (1).png","type":"image/png","storage":"local"}	{"title":"Google Pay (1)","filename_download":"GooglePay (1).png","type":"image/png","storage":"local"}	\N	\N
127	149	directus_files	fabfdd9b-fa75-4f77-a78c-6ccadf12148f	{"title":"Google Pay (1)","filename_download":"GooglePay (1).png","type":"image/png","storage":"local"}	{"title":"Google Pay (1)","filename_download":"GooglePay (1).png","type":"image/png","storage":"local"}	\N	\N
128	151	directus_fields	44	{"id":44,"collection":"footer_payment","field":"image","special":["file"],"interface":"file-image","options":null,"display":"image","display_options":null,"readonly":false,"hidden":false,"sort":2,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"footer_payment","field":"image","interface":"file-image","required":false}	\N	\N
129	152	directus_files	4a788cf0-1f2b-40cb-b5ea-fcb95dda5ea3	{"title":"Google Pay (1)","filename_download":"GooglePay (1).png","type":"image/png","storage":"local"}	{"title":"Google Pay (1)","filename_download":"GooglePay (1).png","type":"image/png","storage":"local"}	\N	\N
130	154	directus_files	30da001e-5f30-4811-9351-67b36b802bc0	{"title":"Image 2","filename_download":"image 2.png","type":"image/png","storage":"local"}	{"title":"Image 2","filename_download":"image 2.png","type":"image/png","storage":"local"}	\N	\N
131	156	directus_files	4368cb7a-b475-4c58-af55-accbfe293a8d	{"title":"Image 2","filename_download":"image 2.png","type":"image/png","storage":"local"}	{"title":"Image 2","filename_download":"image 2.png","type":"image/png","storage":"local"}	\N	\N
132	159	directus_fields	45	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"footer_payment"}	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"footer_payment"}	\N	\N
133	160	directus_collections	footer_payment	{"singleton":false,"collection":"footer_payment"}	{"singleton":false,"collection":"footer_payment"}	\N	\N
134	161	directus_fields	46	{"sort":2,"interface":"file-image","special":["file"],"collection":"footer_payment","field":"img"}	{"sort":2,"interface":"file-image","special":["file"],"collection":"footer_payment","field":"img"}	\N	\N
135	162	directus_fields	47	{"sort":3,"special":null,"collection":"footer_payment","field":"alt"}	{"sort":3,"special":null,"collection":"footer_payment","field":"alt"}	\N	\N
136	163	directus_fields	46	{"id":46,"collection":"footer_payment","field":"img","special":["file"],"interface":"file-image","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":2,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"footer_payment","field":"img","width":"half"}	\N	\N
137	164	directus_fields	47	{"id":47,"collection":"footer_payment","field":"alt","special":null,"interface":null,"options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":3,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"footer_payment","field":"alt","width":"half"}	\N	\N
599	659	footer_files	8	{"id":8,"footer_id":null,"directus_files_id":"943c1113-90ac-4030-9226-f50f4f7590f5"}	{"footer_id":null}	\N	\N
678	748	accessories_type	1	{"id":1,"type":"All","image":"405c8b4c-933f-42cd-9121-8f31eb516a87"}	{"type":"All"}	\N	\N
138	165	directus_files	e1a2a9f7-bb44-4d1e-a5d5-398ad0953ba9	{"title":"Image 2","filename_download":"image 2.png","type":"image/png","storage":"local"}	{"title":"Image 2","filename_download":"image 2.png","type":"image/png","storage":"local"}	\N	\N
139	167	directus_fields	48	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"footer_bottom"}	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"footer_bottom"}	\N	\N
140	168	directus_collections	footer_bottom	{"singleton":false,"collection":"footer_bottom"}	{"singleton":false,"collection":"footer_bottom"}	\N	\N
141	169	directus_fields	49	{"sort":2,"interface":"input","special":null,"collection":"footer_bottom","field":"legal"}	{"sort":2,"interface":"input","special":null,"collection":"footer_bottom","field":"legal"}	\N	\N
142	171	directus_fields	50	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"footer_legal"}	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"footer_legal"}	\N	\N
143	172	directus_collections	footer_legal	{"singleton":false,"collection":"footer_legal"}	{"singleton":false,"collection":"footer_legal"}	\N	\N
144	173	directus_fields	51	{"sort":2,"interface":"input","special":null,"collection":"footer_legal","field":"legal"}	{"sort":2,"interface":"input","special":null,"collection":"footer_legal","field":"legal"}	\N	\N
145	174	directus_fields	51	{"id":51,"collection":"footer_legal","field":"legal","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":2,"width":"fill","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"footer_legal","field":"legal","width":"fill"}	\N	\N
146	175	directus_fields	51	{"id":51,"collection":"footer_legal","field":"legal","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":2,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"footer_legal","field":"legal","width":"half"}	\N	\N
148	177	directus_fields	52	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"footer_img"}	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"footer_img"}	\N	\N
149	178	directus_collections	footer_img	{"singleton":false,"collection":"footer_img"}	{"singleton":false,"collection":"footer_img"}	\N	\N
150	179	directus_fields	53	{"sort":2,"interface":"select-dropdown","special":null,"options":{"choices":[{"text":"Social","value":"social"},{"text":"Payment","value":"payment"}]},"collection":"footer_img","field":"type"}	{"sort":2,"interface":"select-dropdown","special":null,"options":{"choices":[{"text":"Social","value":"social"},{"text":"Payment","value":"payment"}]},"collection":"footer_img","field":"type"}	\N	\N
151	180	directus_fields	54	{"sort":3,"interface":"file-image","special":["file"],"collection":"footer_img","field":"img"}	{"sort":3,"interface":"file-image","special":["file"],"collection":"footer_img","field":"img"}	\N	\N
152	181	directus_fields	55	{"sort":4,"interface":"input","special":null,"collection":"footer_img","field":"slug"}	{"sort":4,"interface":"input","special":null,"collection":"footer_img","field":"slug"}	\N	\N
153	182	directus_fields	53	{"id":53,"collection":"footer_img","field":"type","special":null,"interface":"select-dropdown","options":{"choices":[{"text":"Social","value":"social"},{"text":"Payment","value":"payment"}]},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":2,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"footer_img","field":"type","width":"half"}	\N	\N
154	183	directus_fields	54	{"id":54,"collection":"footer_img","field":"img","special":["file"],"interface":"file-image","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":3,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"footer_img","field":"img","width":"half"}	\N	\N
155	184	directus_files	1f84b4b3-7ff9-481b-9d40-e40bc8b3994b	{"title":"Image 2","filename_download":"image 2.png","type":"image/png","storage":"local"}	{"title":"Image 2","filename_download":"image 2.png","type":"image/png","storage":"local"}	\N	\N
156	186	directus_files	0080df53-00fd-4835-a135-1918a5408e3a	{"title":"Image 2","filename_download":"image 2.png","type":"image/png","storage":"local"}	{"title":"Image 2","filename_download":"image 2.png","type":"image/png","storage":"local"}	\N	\N
157	188	directus_files	1d6477c8-91ba-4a9a-bb76-9b7ca53bede6	{"title":"Image 2","filename_download":"image 2.png","type":"image/png","storage":"local"}	{"title":"Image 2","filename_download":"image 2.png","type":"image/png","storage":"local"}	\N	\N
158	190	directus_files	cc353a63-8ab9-4939-91ef-f676d17b974e	{"title":"Image 2","filename_download":"image 2.png","type":"image/png","storage":"local"}	{"title":"Image 2","filename_download":"image 2.png","type":"image/png","storage":"local"}	\N	\N
159	191	directus_files	a793b016-2c16-4129-86d1-163b00b8b8bf	{"title":"Group (3)","filename_download":"Group (3).png","type":"image/png","storage":"local"}	{"title":"Group (3)","filename_download":"Group (3).png","type":"image/png","storage":"local"}	\N	\N
160	192	directus_fields	56	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"footer_constant"}	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"footer_constant"}	\N	\N
161	193	directus_collections	footer_constant	{"singleton":false,"collection":"footer_constant"}	{"singleton":false,"collection":"footer_constant"}	\N	\N
162	194	directus_fields	57	{"sort":2,"interface":"input","special":null,"collection":"footer_constant","field":"title"}	{"sort":2,"interface":"input","special":null,"collection":"footer_constant","field":"title"}	\N	\N
163	197	directus_files	11d8ff7d-85ef-4f52-a1e6-0512a56069e1	{"title":"Google Pay","filename_download":"GooglePay.png","type":"image/png","storage":"local"}	{"title":"Google Pay","filename_download":"GooglePay.png","type":"image/png","storage":"local"}	\N	\N
165	200	directus_fields	58	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"footer_img"}	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"footer_img"}	\N	\N
166	201	directus_collections	footer_img	{"singleton":false,"collection":"footer_img"}	{"singleton":false,"collection":"footer_img"}	\N	\N
168	203	directus_fields	60	{"sort":3,"interface":"file-image","special":["file"],"collection":"footer_img","field":"img"}	{"sort":3,"interface":"file-image","special":["file"],"collection":"footer_img","field":"img"}	\N	\N
167	202	directus_fields	59	{"sort":2,"interface":"select-dropdown","special":null,"options":{"choices":[{"text":"Payment","value":"payment","icon":"payments"},{"text":"Social","value":"social"}]},"collection":"footer_img","field":"type"}	{"sort":2,"interface":"select-dropdown","special":null,"options":{"choices":[{"text":"Payment","value":"payment","icon":"payments"},{"text":"Social","value":"social"}]},"collection":"footer_img","field":"type"}	\N	\N
169	204	directus_fields	61	{"sort":3,"interface":"file-image","special":["file"],"collection":"footer_img","field":"image"}	{"sort":3,"interface":"file-image","special":["file"],"collection":"footer_img","field":"image"}	\N	\N
170	205	directus_fields	62	{"sort":4,"interface":"input","special":null,"collection":"footer_img","field":"alt"}	{"sort":4,"interface":"input","special":null,"collection":"footer_img","field":"alt"}	\N	\N
171	206	directus_fields	63	{"sort":5,"special":null,"validation":{"_and":[{"link":{"_regex":"[-a-zA-Z0-9@:%._\\\\+~#=]{1,256}\\\\.[a-zA-Z0-9()]{1,6}\\\\b([-a-zA-Z0-9()@:%_\\\\+.~#?&//=]*)"}}]},"collection":"footer_img","field":"link"}	{"sort":5,"special":null,"validation":{"_and":[{"link":{"_regex":"[-a-zA-Z0-9@:%._\\\\+~#=]{1,256}\\\\.[a-zA-Z0-9()]{1,6}\\\\b([-a-zA-Z0-9()@:%_\\\\+.~#?&//=]*)"}}]},"collection":"footer_img","field":"link"}	\N	\N
173	208	directus_files	4a14cc70-8e7b-4f99-99c4-70cb9aa19871	{"title":"Google Pay","filename_download":"GooglePay.png","type":"image/png","storage":"local"}	{"title":"Google Pay","filename_download":"GooglePay.png","type":"image/png","storage":"local"}	\N	\N
175	210	directus_files	af5b8b78-b8ec-46df-98c4-e96733b0df96	{"title":"Group","filename_download":"Group.png","type":"image/png","storage":"local"}	{"title":"Group","filename_download":"Group.png","type":"image/png","storage":"local"}	\N	\N
177	212	directus_files	f7b80867-d7db-4f11-9858-43e7eb2ec32f	{"title":"Mastercard","filename_download":"Mastercard.png","type":"image/png","storage":"local"}	{"title":"Mastercard","filename_download":"Mastercard.png","type":"image/png","storage":"local"}	\N	\N
179	214	directus_files	4e8f51fb-20af-4626-b706-7e81d56ed082	{"title":"Group (1)","filename_download":"Group (1).png","type":"image/png","storage":"local"}	{"title":"Group (1)","filename_download":"Group (1).png","type":"image/png","storage":"local"}	\N	\N
181	216	directus_files	eb495b29-6b15-4880-988b-67c11552ce55	{"title":"Group (2)","filename_download":"Group (2).png","type":"image/png","storage":"local"}	{"title":"Group (2)","filename_download":"Group (2).png","type":"image/png","storage":"local"}	\N	\N
183	218	directus_files	9550d554-3f3a-4192-803a-281cb0d12b59	{"title":"Group (3)","filename_download":"Group (3).png","type":"image/png","storage":"local"}	{"title":"Group (3)","filename_download":"Group (3).png","type":"image/png","storage":"local"}	\N	\N
185	220	directus_files	9a9071d9-b797-4c66-a446-54c41ffc3085	{"title":"Apple Pay","filename_download":"ApplePay.png","type":"image/png","storage":"local"}	{"title":"Apple Pay","filename_download":"ApplePay.png","type":"image/png","storage":"local"}	\N	\N
187	222	directus_files	b856390d-a075-4286-9e40-a22a96b1e196	{"title":"Paypal","filename_download":"Paypal.png","type":"image/png","storage":"local"}	{"title":"Paypal","filename_download":"Paypal.png","type":"image/png","storage":"local"}	\N	\N
189	224	directus_files	daeb079a-4b31-456c-9eda-e66a3a13e37a	{"title":"Instagram Logo","filename_download":"InstagramLogo.png","type":"image/png","storage":"local"}	{"title":"Instagram Logo","filename_download":"InstagramLogo.png","type":"image/png","storage":"local"}	\N	\N
191	226	directus_files	4648b320-3c4a-47a8-8cec-13ea71f0aa96	{"title":"Ic Round Facebook","filename_download":"ic_round-facebook.png","type":"image/png","storage":"local"}	{"title":"Ic Round Facebook","filename_download":"ic_round-facebook.png","type":"image/png","storage":"local"}	\N	\N
193	228	directus_files	d6fd9548-7a6f-4237-8d75-5184fcdc751a	{"title":"pH Tiktok Logo Fill","filename_download":"ph_tiktok-logo-fill.png","type":"image/png","storage":"local"}	{"title":"pH Tiktok Logo Fill","filename_download":"ph_tiktok-logo-fill.png","type":"image/png","storage":"local"}	\N	\N
195	230	directus_files	13a6f94a-2576-4cdc-aa48-c142802143d9	{"title":"YouTube Logo","filename_download":"YoutubeLogo.png","type":"image/png","storage":"local"}	{"title":"YouTube Logo","filename_download":"YoutubeLogo.png","type":"image/png","storage":"local"}	\N	\N
197	232	directus_files	7e8e0ea1-4c4f-429c-85c6-c00af2d9c11e	{"title":"pH Tiktok Logo Fill","filename_download":"ph_tiktok-logo-fill.png","type":"image/png","storage":"local"}	{"title":"pH Tiktok Logo Fill","filename_download":"ph_tiktok-logo-fill.png","type":"image/png","storage":"local"}	\N	\N
198	234	directus_permissions	5	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"footer_img","action":"read"}	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"footer_img","action":"read"}	\N	\N
199	236	directus_fields	64	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"footer"}	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"footer"}	\N	\N
200	237	directus_collections	footer	{"singleton":true,"collection":"footer"}	{"singleton":true,"collection":"footer"}	\N	\N
201	238	directus_fields	65	{"sort":2,"interface":"list","special":["cast-json"],"collection":"footer","field":"title"}	{"sort":2,"interface":"list","special":["cast-json"],"collection":"footer","field":"title"}	\N	\N
202	239	directus_fields	65	{"id":65,"collection":"footer","field":"title","special":["cast-json"],"interface":"list","options":{"fields":[{"field":"category","name":"category","type":"string","meta":{"field":"category","width":"half","type":"string","interface":null}}]},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":2,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"footer","field":"title","options":{"fields":[{"field":"category","name":"category","type":"string","meta":{"field":"category","width":"half","type":"string","interface":null}}]}}	\N	\N
203	240	directus_fields	65	{"id":65,"collection":"footer","field":"title","special":["cast-json"],"interface":"list","options":{"fields":[{"field":"category","name":"category","type":"string","meta":{"field":"category","width":"half","type":"string","interface":"input","options":{"defaultView":{"center":{"lng":0,"lat":0},"zoom":0,"bearing":0,"pitch":0},"geometryType":"Point"}}}]},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":2,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"footer","field":"title","options":{"fields":[{"field":"category","name":"category","type":"string","meta":{"field":"category","width":"half","type":"string","interface":"input","options":{"defaultView":{"center":{"lng":0,"lat":0},"zoom":0,"bearing":0,"pitch":0},"geometryType":"Point"}}}]}}	\N	\N
204	241	directus_fields	65	{"id":65,"collection":"footer","field":"title","special":["cast-json"],"interface":"list","options":{"fields":[{"field":"category","name":"category","type":"string","meta":{"field":"category","width":"half","type":"string","interface":"input","options":{"defaultView":{"center":{"lng":0,"lat":0},"zoom":0,"bearing":0,"pitch":0},"geometryType":"Point"}}},{"field":"subItems","name":"subItems","type":"string","meta":{"field":"subItems","type":"string","interface":null}}]},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":2,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"footer","field":"title","options":{"fields":[{"field":"category","name":"category","type":"string","meta":{"field":"category","width":"half","type":"string","interface":"input","options":{"defaultView":{"center":{"lng":0,"lat":0},"zoom":0,"bearing":0,"pitch":0},"geometryType":"Point"}}},{"field":"subItems","name":"subItems","type":"string","meta":{"field":"subItems","type":"string","interface":null}}]}}	\N	\N
205	242	directus_fields	66	{"sort":2,"interface":"list","special":["cast-json"],"options":{"fields":[{"field":"category","name":"category","type":"string","meta":{"field":"category","width":"half","type":"string","required":false,"interface":null}}]},"collection":"footer","field":"footer_items"}	{"sort":2,"interface":"list","special":["cast-json"],"options":{"fields":[{"field":"category","name":"category","type":"string","meta":{"field":"category","width":"half","type":"string","required":false,"interface":null}}]},"collection":"footer","field":"footer_items"}	\N	\N
206	243	footer	1	{"footer_items":[{"category":"product"},{"category":"Support"},{"category":"privacy & terms"},{"category":"company"}]}	{"footer_items":[{"category":"product"},{"category":"Support"},{"category":"privacy & terms"},{"category":"company"}]}	\N	\N
207	244	directus_fields	66	{"id":66,"collection":"footer","field":"footer_items","special":["cast-json"],"interface":"list","options":{"fields":[{"field":"category","name":"category","type":"string","meta":{"field":"category","width":"half","type":"string","required":true,"interface":"select-dropdown","options":{"choices":[{"text":"A","value":"a"},{"text":"B","value":"b"}]}}}]},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":2,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"footer","field":"footer_items","options":{"fields":[{"field":"category","name":"category","type":"string","meta":{"field":"category","width":"half","type":"string","required":true,"interface":"select-dropdown","options":{"choices":[{"text":"A","value":"a"},{"text":"B","value":"b"}]}}}]}}	\N	\N
208	245	directus_fields	66	{"id":66,"collection":"footer","field":"footer_items","special":["cast-json"],"interface":"list","options":{"fields":[{"field":"category","name":"category","type":"string","meta":{"field":"category","width":"half","type":"string","required":true,"interface":"input","options":{"choices":[{"text":"A","value":"a"},{"text":"B","value":"b"}],"placeholder":"Enter category name"}}}]},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":2,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"footer","field":"footer_items","options":{"fields":[{"field":"category","name":"category","type":"string","meta":{"field":"category","width":"half","type":"string","required":true,"interface":"input","options":{"choices":[{"text":"A","value":"a"},{"text":"B","value":"b"}],"placeholder":"Enter category name"}}}]}}	\N	\N
209	246	footer	1	{"id":1,"footer_items":[{"category":"Product"},{"category":"Support"},{"category":"Privacy & Terms"},{"category":"Company"}]}	{"footer_items":[{"category":"Product"},{"category":"Support"},{"category":"Privacy & Terms"},{"category":"Company"}]}	\N	\N
210	247	directus_fields	66	{"id":66,"collection":"footer","field":"footer_items","special":["cast-json"],"interface":"list","options":{"fields":[{"field":"title","name":"title","type":"string","meta":{"field":"title","width":"half","type":"string","required":true,"interface":"input","options":{"choices":[{"text":"A","value":"a"},{"text":"B","value":"b"}],"placeholder":"Enter category title"}}},{"field":"slug","name":"slug","type":"string","meta":{"field":"slug","type":"string","interface":"input","options":{"placeholder":"Enter slug "}}}]},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":2,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"footer","field":"footer_items","options":{"fields":[{"field":"title","name":"title","type":"string","meta":{"field":"title","width":"half","type":"string","required":true,"interface":"input","options":{"choices":[{"text":"A","value":"a"},{"text":"B","value":"b"}],"placeholder":"Enter category title"}}},{"field":"slug","name":"slug","type":"string","meta":{"field":"slug","type":"string","interface":"input","options":{"placeholder":"Enter slug "}}}]}}	\N	\N
211	248	directus_fields	67	{"sort":2,"interface":"list","special":["cast-json"],"options":{"fields":[{"field":"name","name":"name","type":"string","meta":{"field":"name","type":"string","interface":"input","options":{"placeholder":"Enter category name"}}}]},"collection":"footer","field":"category"}	{"sort":2,"interface":"list","special":["cast-json"],"options":{"fields":[{"field":"name","name":"name","type":"string","meta":{"field":"name","type":"string","interface":"input","options":{"placeholder":"Enter category name"}}}]},"collection":"footer","field":"category"}	\N	\N
212	249	footer	1	{"id":1,"category":[{"name":"Product"},{"name":"Support"}]}	{"category":[{"name":"Product"},{"name":"Support"}]}	\N	\N
213	250	directus_fields	68	{"sort":3,"interface":"list","special":["cast-json"],"options":{"fields":[{"field":"title","name":"title","type":"string","meta":{"field":"title","type":"string","interface":"input","options":{"placeholder":"Enter item name"}}},{"field":"slug","name":"slug","type":"string","meta":{"field":"slug","type":"string","interface":"input","options":{"placeholder":"Enter item slug"}}},{"field":"category","name":"category","type":"json","meta":{"field":"category","width":"half","type":"json","interface":"collection-item-dropdown","options":{"defaultView":{"center":{"lng":0,"lat":0},"zoom":0,"bearing":0,"pitch":0},"geometryType":"Point","selectedCollection":"footer_category"}}}]},"collection":"footer","field":"category_items"}	{"sort":3,"interface":"list","special":["cast-json"],"options":{"fields":[{"field":"title","name":"title","type":"string","meta":{"field":"title","type":"string","interface":"input","options":{"placeholder":"Enter item name"}}},{"field":"slug","name":"slug","type":"string","meta":{"field":"slug","type":"string","interface":"input","options":{"placeholder":"Enter item slug"}}},{"field":"category","name":"category","type":"json","meta":{"field":"category","width":"half","type":"json","interface":"collection-item-dropdown","options":{"defaultView":{"center":{"lng":0,"lat":0},"zoom":0,"bearing":0,"pitch":0},"geometryType":"Point","selectedCollection":"footer_category"}}}]},"collection":"footer","field":"category_items"}	\N	\N
214	251	directus_fields	68	{"id":68,"collection":"footer","field":"category_items","special":["cast-json"],"interface":"list","options":{"fields":[{"field":"title","name":"title","type":"string","meta":{"field":"title","type":"string","interface":"input","options":{"placeholder":"Enter item name"}}},{"field":"slug","name":"slug","type":"string","meta":{"field":"slug","type":"string","interface":"input","options":{"placeholder":"Enter item slug"}}},{"field":"category","name":"category","type":"string","meta":{"field":"category","width":"half","type":"string","interface":null,"options":{"defaultView":{"center":{"lng":0,"lat":0},"zoom":0,"bearing":0,"pitch":0},"geometryType":"Point","selectedCollection":"footer_category"}}}]},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":3,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"footer","field":"category_items","options":{"fields":[{"field":"title","name":"title","type":"string","meta":{"field":"title","type":"string","interface":"input","options":{"placeholder":"Enter item name"}}},{"field":"slug","name":"slug","type":"string","meta":{"field":"slug","type":"string","interface":"input","options":{"placeholder":"Enter item slug"}}},{"field":"category","name":"category","type":"string","meta":{"field":"category","width":"half","type":"string","interface":null,"options":{"defaultView":{"center":{"lng":0,"lat":0},"zoom":0,"bearing":0,"pitch":0},"geometryType":"Point","selectedCollection":"footer_category"}}}]}}	\N	\N
215	252	directus_fields	69	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"test"}	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"test"}	\N	\N
216	253	directus_collections	test	{"singleton":false,"collection":"test"}	{"singleton":false,"collection":"test"}	\N	\N
217	254	directus_fields	70	{"sort":2,"interface":"list","special":["cast-json"],"options":{"template":null,"fields":[{"field":"name","name":"name","type":"string","meta":{"field":"name","width":"half","type":"string","interface":"input"}}]},"collection":"test","field":"type"}	{"sort":2,"interface":"list","special":["cast-json"],"options":{"template":null,"fields":[{"field":"name","name":"name","type":"string","meta":{"field":"name","width":"half","type":"string","interface":"input"}}]},"collection":"test","field":"type"}	\N	\N
219	256	directus_fields	68	{"id":68,"collection":"footer","field":"category_items","special":["cast-json"],"interface":"list","options":{"fields":[{"field":"title","name":"title","type":"string","meta":{"field":"title","type":"string","interface":"input","options":{"placeholder":"Enter item name"}}},{"field":"slug","name":"slug","type":"string","meta":{"field":"slug","type":"string","interface":"input","options":{"placeholder":"Enter item slug"}}},{"field":"category","name":"category","type":"json","meta":{"field":"category","width":"half","type":"json","interface":"collection-item-dropdown","options":{"defaultView":{"center":{"lng":0,"lat":0},"zoom":0,"bearing":0,"pitch":0},"geometryType":"Point","selectedCollection":"footer_category"}}}]},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":3,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"footer","field":"category_items","options":{"fields":[{"field":"title","name":"title","type":"string","meta":{"field":"title","type":"string","interface":"input","options":{"placeholder":"Enter item name"}}},{"field":"slug","name":"slug","type":"string","meta":{"field":"slug","type":"string","interface":"input","options":{"placeholder":"Enter item slug"}}},{"field":"category","name":"category","type":"json","meta":{"field":"category","width":"half","type":"json","interface":"collection-item-dropdown","options":{"defaultView":{"center":{"lng":0,"lat":0},"zoom":0,"bearing":0,"pitch":0},"geometryType":"Point","selectedCollection":"footer_category"}}}]}}	\N	\N
220	257	directus_fields	71	{"sort":2,"interface":"list","special":["cast-json"],"options":{"fields":[{"field":"name","name":"name","type":"string","meta":{"field":"name","type":"string","interface":"input","options":{"placeholder":"Enter item name"}}},{"field":"slug","name":"slug","type":"string","meta":{"field":"slug","type":"string","interface":"input","options":{"placeholder":"Enter slug"}}},{"field":"type","name":"type","type":"string","meta":{"field":"type","type":"string","required":true,"interface":"select-dropdown","options":{"choices":[{"text":"Products","value":"products","icon":"production_quantity_limits","color":"#E35169"},{"text":"Support","value":"support","icon":"contact_support","color":"#2ECDA7"},{"text":"Privacy & Terms","value":"privacy-terms","icon":"privacy_tip","color":"#FFA439"},{"text":"Company","value":"company","icon":"compare","color":"#3399FF"}]}}}]},"collection":"footer","field":"category"}	{"sort":2,"interface":"list","special":["cast-json"],"options":{"fields":[{"field":"name","name":"name","type":"string","meta":{"field":"name","type":"string","interface":"input","options":{"placeholder":"Enter item name"}}},{"field":"slug","name":"slug","type":"string","meta":{"field":"slug","type":"string","interface":"input","options":{"placeholder":"Enter slug"}}},{"field":"type","name":"type","type":"string","meta":{"field":"type","type":"string","required":true,"interface":"select-dropdown","options":{"choices":[{"text":"Products","value":"products","icon":"production_quantity_limits","color":"#E35169"},{"text":"Support","value":"support","icon":"contact_support","color":"#2ECDA7"},{"text":"Privacy & Terms","value":"privacy-terms","icon":"privacy_tip","color":"#FFA439"},{"text":"Company","value":"company","icon":"compare","color":"#3399FF"}]}}}]},"collection":"footer","field":"category"}	\N	\N
221	258	footer	1	{"id":1,"category":[{"name":"220 MP","slug":"200-mp","type":"products"},{"name":"Accessories ","slug":"accessories ","type":"products"},{"name":"Consumables","slug":"consumables","type":"products"},{"name":"Order Tracking","slug":"order-tracking","type":"support"},{"name":"FAQ","slug":"faq","type":"support"}]}	{"category":[{"name":"220 MP","slug":"200-mp","type":"products"},{"name":"Accessories ","slug":"accessories ","type":"products"},{"name":"Consumables","slug":"consumables","type":"products"},{"name":"Order Tracking","slug":"order-tracking","type":"support"},{"name":"FAQ","slug":"faq","type":"support"}]}	\N	\N
278	316	directus_collections	footer_category	{"collection":"footer_category","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":3,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":3,"group":null}	\N	\N
295	333	directus_collections	header	{"collection":"header","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":2,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":2,"group":null}	\N	\N
222	259	directus_fields	71	{"id":71,"collection":"footer","field":"category","special":["cast-json"],"interface":"list","options":{"fields":[{"field":"name","name":"name","type":"string","meta":{"field":"name","type":"string","interface":"input","options":{"placeholder":"Enter item name"},"required":true}},{"field":"slug","name":"slug","type":"string","meta":{"field":"slug","type":"string","interface":"input","options":{"placeholder":"Enter slug"}}},{"field":"type","name":"type","type":"string","meta":{"field":"type","type":"string","required":true,"interface":"select-dropdown","options":{"choices":[{"text":"Products","value":"products","icon":"production_quantity_limits","color":"#E35169"},{"text":"Support","value":"support","icon":"contact_support","color":"#2ECDA7"},{"text":"Privacy & Terms","value":"privacy-terms","icon":"privacy_tip","color":"#FFA439"},{"text":"Company","value":"company","icon":"compare","color":"#3399FF"}]}}}],"template":"{{ type }}"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":2,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"footer","field":"category","options":{"fields":[{"field":"name","name":"name","type":"string","meta":{"field":"name","type":"string","interface":"input","options":{"placeholder":"Enter item name"},"required":true}},{"field":"slug","name":"slug","type":"string","meta":{"field":"slug","type":"string","interface":"input","options":{"placeholder":"Enter slug"}}},{"field":"type","name":"type","type":"string","meta":{"field":"type","type":"string","required":true,"interface":"select-dropdown","options":{"choices":[{"text":"Products","value":"products","icon":"production_quantity_limits","color":"#E35169"},{"text":"Support","value":"support","icon":"contact_support","color":"#2ECDA7"},{"text":"Privacy & Terms","value":"privacy-terms","icon":"privacy_tip","color":"#FFA439"},{"text":"Company","value":"company","icon":"compare","color":"#3399FF"}]}}}],"template":"{{ type }}"}}	\N	\N
223	260	directus_fields	71	{"id":71,"collection":"footer","field":"category","special":["cast-json"],"interface":"list","options":{"fields":[{"field":"name","name":"name","type":"string","meta":{"field":"name","type":"string","interface":"input","options":{"placeholder":"Enter item name"},"required":true}},{"field":"slug","name":"slug","type":"string","meta":{"field":"slug","type":"string","interface":"input","options":{"placeholder":"Enter slug"}}},{"field":"type","name":"type","type":"string","meta":{"field":"type","type":"string","required":true,"interface":"select-dropdown","options":{"choices":[{"text":"Products","value":"products","icon":"production_quantity_limits","color":"#E35169"},{"text":"Support","value":"support","icon":"contact_support","color":"#2ECDA7"},{"text":"Privacy & Terms","value":"privacy-terms","icon":"privacy_tip","color":"#FFA439"},{"text":"Company","value":"company","icon":"compare","color":"#3399FF"}]}}}],"template":"{{ name }} - {{ type }}"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":2,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"footer","field":"category","options":{"fields":[{"field":"name","name":"name","type":"string","meta":{"field":"name","type":"string","interface":"input","options":{"placeholder":"Enter item name"},"required":true}},{"field":"slug","name":"slug","type":"string","meta":{"field":"slug","type":"string","interface":"input","options":{"placeholder":"Enter slug"}}},{"field":"type","name":"type","type":"string","meta":{"field":"type","type":"string","required":true,"interface":"select-dropdown","options":{"choices":[{"text":"Products","value":"products","icon":"production_quantity_limits","color":"#E35169"},{"text":"Support","value":"support","icon":"contact_support","color":"#2ECDA7"},{"text":"Privacy & Terms","value":"privacy-terms","icon":"privacy_tip","color":"#FFA439"},{"text":"Company","value":"company","icon":"compare","color":"#3399FF"}]}}}],"template":"{{ name }} - {{ type }}"}}	\N	\N
224	261	directus_fields	72	{"sort":3,"interface":"list","special":["cast-json"],"options":{"fields":[{"field":"name","name":"name","type":"string","meta":{"field":"name","type":"string","required":true,"interface":"input","options":{"placeholder":null}}},{"field":"image","name":"image","type":"string","meta":{"field":"image","type":"string","interface":"select-icon"}}]},"collection":"footer","field":"payment_icons"}	{"sort":3,"interface":"list","special":["cast-json"],"options":{"fields":[{"field":"name","name":"name","type":"string","meta":{"field":"name","type":"string","required":true,"interface":"input","options":{"placeholder":null}}},{"field":"image","name":"image","type":"string","meta":{"field":"image","type":"string","interface":"select-icon"}}]},"collection":"footer","field":"payment_icons"}	\N	\N
225	262	directus_fields	73	{"sort":3,"interface":"file-image","special":["file"],"collection":"footer","field":"icons"}	{"sort":3,"interface":"file-image","special":["file"],"collection":"footer","field":"icons"}	\N	\N
226	263	directus_fields	74	{"sort":3,"interface":"files","special":["files"],"collection":"footer","field":"payment_icons"}	{"sort":3,"interface":"files","special":["files"],"collection":"footer","field":"payment_icons"}	\N	\N
227	264	directus_fields	75	{"sort":1,"hidden":true,"field":"id","collection":"footer_files"}	{"sort":1,"hidden":true,"field":"id","collection":"footer_files"}	\N	\N
228	265	directus_collections	footer_files	{"hidden":true,"icon":"import_export","collection":"footer_files"}	{"hidden":true,"icon":"import_export","collection":"footer_files"}	\N	\N
229	266	directus_fields	76	{"sort":2,"hidden":true,"collection":"footer_files","field":"footer_id"}	{"sort":2,"hidden":true,"collection":"footer_files","field":"footer_id"}	\N	\N
230	267	directus_fields	77	{"sort":3,"hidden":true,"collection":"footer_files","field":"directus_files_id"}	{"sort":3,"hidden":true,"collection":"footer_files","field":"directus_files_id"}	\N	\N
231	268	directus_files	31c4ccd1-0ece-49b8-b638-d40d54450580	{"title":"Paypal","filename_download":"Paypal.png","type":"image/png","storage":"local"}	{"title":"Paypal","filename_download":"Paypal.png","type":"image/png","storage":"local"}	\N	\N
232	269	directus_files	989aead1-e19c-4a11-a769-ac4f3a730dc8	{"title":"Google Pay (1)","filename_download":"GooglePay (1).png","type":"image/png","storage":"local"}	{"title":"Google Pay (1)","filename_download":"GooglePay (1).png","type":"image/png","storage":"local"}	\N	\N
233	270	directus_files	e6e8100e-d5c9-436a-84b6-e56f31961045	{"title":"Group (3)","filename_download":"Group (3).png","type":"image/png","storage":"local"}	{"title":"Group (3)","filename_download":"Group (3).png","type":"image/png","storage":"local"}	\N	\N
234	271	directus_files	09f5207e-46a5-4c18-a7e7-d7edae487b94	{"title":"Group (1)","filename_download":"Group (1).png","type":"image/png","storage":"local"}	{"title":"Group (1)","filename_download":"Group (1).png","type":"image/png","storage":"local"}	\N	\N
235	272	directus_files	db4b3099-fcff-417b-8ddc-b7ce856592a0	{"title":"Group (2)","filename_download":"Group (2).png","type":"image/png","storage":"local"}	{"title":"Group (2)","filename_download":"Group (2).png","type":"image/png","storage":"local"}	\N	\N
236	273	directus_files	12267427-7782-4f14-9f51-e6ac19032e6d	{"title":"Apple Pay","filename_download":"ApplePay.png","type":"image/png","storage":"local"}	{"title":"Apple Pay","filename_download":"ApplePay.png","type":"image/png","storage":"local"}	\N	\N
243	281	directus_fields	71	{"id":71,"collection":"footer","field":"category","special":["cast-json"],"interface":"list","options":{"fields":[{"field":"name","name":"name","type":"string","meta":{"field":"name","type":"string","interface":"input","options":{"placeholder":"Enter item name"},"required":true}},{"field":"slug","name":"slug","type":"string","meta":{"field":"slug","type":"string","interface":"input","options":{"placeholder":"Enter slug"}}},{"field":"type","name":"type","type":"string","meta":{"field":"type","type":"string","required":true,"interface":"select-dropdown","options":{"choices":[{"text":"Products","value":"products","icon":"production_quantity_limits","color":"#E35169"},{"text":"Support","value":"support","icon":"contact_support","color":"#2ECDA7"},{"text":"Privacy & Terms","value":"privacy-terms","icon":"privacy_tip","color":"#FFA439"},{"text":"Company","value":"company","icon":"compare","color":"#3399FF"}]}}},{"field":"email","name":"email","type":"json","meta":{"field":"email","width":"half","type":"json","interface":null}}],"template":"{{ name }} - {{ type }}"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":2,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"footer","field":"category","options":{"fields":[{"field":"name","name":"name","type":"string","meta":{"field":"name","type":"string","interface":"input","options":{"placeholder":"Enter item name"},"required":true}},{"field":"slug","name":"slug","type":"string","meta":{"field":"slug","type":"string","interface":"input","options":{"placeholder":"Enter slug"}}},{"field":"type","name":"type","type":"string","meta":{"field":"type","type":"string","required":true,"interface":"select-dropdown","options":{"choices":[{"text":"Products","value":"products","icon":"production_quantity_limits","color":"#E35169"},{"text":"Support","value":"support","icon":"contact_support","color":"#2ECDA7"},{"text":"Privacy & Terms","value":"privacy-terms","icon":"privacy_tip","color":"#FFA439"},{"text":"Company","value":"company","icon":"compare","color":"#3399FF"}]}}},{"field":"email","name":"email","type":"json","meta":{"field":"email","width":"half","type":"json","interface":null}}],"template":"{{ name }} - {{ type }}"}}	\N	\N
244	282	directus_fields	71	{"id":71,"collection":"footer","field":"category","special":["cast-json"],"interface":"list","options":{"fields":[{"field":"name","name":"name","type":"string","meta":{"field":"name","type":"string","interface":"input","options":{"placeholder":"Enter item name"},"required":true}},{"field":"slug","name":"slug","type":"string","meta":{"field":"slug","type":"string","interface":"input","options":{"placeholder":"Enter slug"}}},{"field":"type","name":"type","type":"string","meta":{"field":"type","type":"string","required":true,"interface":"select-dropdown","options":{"choices":[{"text":"Products","value":"products","icon":"production_quantity_limits","color":"#E35169"},{"text":"Support","value":"support","icon":"contact_support","color":"#2ECDA7"},{"text":"Privacy & Terms","value":"privacy-terms","icon":"privacy_tip","color":"#FFA439"},{"text":"Company","value":"company","icon":"compare","color":"#3399FF"}]}}}],"template":"{{ name }} - {{ type }}"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":2,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"footer","field":"category","options":{"fields":[{"field":"name","name":"name","type":"string","meta":{"field":"name","type":"string","interface":"input","options":{"placeholder":"Enter item name"},"required":true}},{"field":"slug","name":"slug","type":"string","meta":{"field":"slug","type":"string","interface":"input","options":{"placeholder":"Enter slug"}}},{"field":"type","name":"type","type":"string","meta":{"field":"type","type":"string","required":true,"interface":"select-dropdown","options":{"choices":[{"text":"Products","value":"products","icon":"production_quantity_limits","color":"#E35169"},{"text":"Support","value":"support","icon":"contact_support","color":"#2ECDA7"},{"text":"Privacy & Terms","value":"privacy-terms","icon":"privacy_tip","color":"#FFA439"},{"text":"Company","value":"company","icon":"compare","color":"#3399FF"}]}}}],"template":"{{ name }} - {{ type }}"}}	\N	\N
245	283	directus_fields	78	{"sort":4,"interface":"list","special":["cast-json"],"options":{"fields":[{"field":"name","name":"name","type":"json","meta":{"field":"name","type":"json","interface":"list","options":{"fields":[{"field":"name","name":"name","type":"string","meta":{"field":"name","type":"string","interface":null}},{"field":"type","name":"type","meta":{"field":"type"}},{"field":"slug","name":"slug","meta":{"field":"slug"}}]}}}]},"collection":"footer","field":"category"}	{"sort":4,"interface":"list","special":["cast-json"],"options":{"fields":[{"field":"name","name":"name","type":"json","meta":{"field":"name","type":"json","interface":"list","options":{"fields":[{"field":"name","name":"name","type":"string","meta":{"field":"name","type":"string","interface":null}},{"field":"type","name":"type","meta":{"field":"type"}},{"field":"slug","name":"slug","meta":{"field":"slug"}}]}}}]},"collection":"footer","field":"category"}	\N	\N
246	284	directus_fields	64	{"id":64,"collection":"footer","field":"id","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"footer","field":"id","sort":1,"group":null}	\N	\N
247	285	directus_fields	78	{"id":78,"collection":"footer","field":"category","special":["cast-json"],"interface":"list","options":{"fields":[{"field":"name","name":"name","type":"json","meta":{"field":"name","type":"json","interface":"list","options":{"fields":[{"field":"name","name":"name","type":"string","meta":{"field":"name","type":"string","interface":null}},{"field":"type","name":"type","meta":{"field":"type"}},{"field":"slug","name":"slug","meta":{"field":"slug"}}]}}}]},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":2,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"footer","field":"category","sort":2,"group":null}	\N	\N
248	286	directus_fields	74	{"id":74,"collection":"footer","field":"payment_icons","special":["files"],"interface":"files","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":3,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"footer","field":"payment_icons","sort":3,"group":null}	\N	\N
249	287	directus_fields	78	{"id":78,"collection":"footer","field":"category","special":["cast-json"],"interface":"list","options":{"fields":[{"field":"name","name":"name","type":"string","meta":{"field":"name","type":"string","interface":"input","options":{"placeholder":"Enter Category Name"}}},{"field":"options","name":"options","type":"json","meta":{"field":"options","type":"json","interface":"list","options":{"fields":[{"field":"name","name":"name","type":"string","meta":{"field":"name","type":"string","interface":null}},{"field":"slug","name":"slug","meta":{"field":"slug"}}]}}}]},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":2,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"footer","field":"category","options":{"fields":[{"field":"name","name":"name","type":"string","meta":{"field":"name","type":"string","interface":"input","options":{"placeholder":"Enter Category Name"}}},{"field":"options","name":"options","type":"json","meta":{"field":"options","type":"json","interface":"list","options":{"fields":[{"field":"name","name":"name","type":"string","meta":{"field":"name","type":"string","interface":null}},{"field":"slug","name":"slug","meta":{"field":"slug"}}]}}}]}}	\N	\N
250	288	footer	1	{"id":1,"category":[{"name":"Products","options":[{"name":"220MP","slug":"220-mp"},{"name":"Accessories ","slug":"accessories "},{"name":"Consumables","slug":"consumables"}]},{"name":"Support"}],"payment_icons":[1,2,3,4,5,6]}	{"category":[{"name":"Products","options":[{"name":"220MP","slug":"220-mp"},{"name":"Accessories ","slug":"accessories "},{"name":"Consumables","slug":"consumables"}]},{"name":"Support"}]}	\N	\N
251	289	directus_fields	79	{"sort":4,"interface":"list","special":["cast-json"],"options":{"fields":[{"field":"heading","name":"heading","type":"string","meta":{"field":"heading","type":"string","interface":"input","options":{"placeholder":"Enter the heading"}}},{"field":"options","name":"options","type":"json","meta":{"field":"options","type":"json","interface":"list","options":{"fields":[{"field":"name","name":"name","type":"string","meta":{"field":"name","type":"string","interface":"input","options":{"placeholder":"enter the name"}}},{"field":"slug","name":"slug","type":"string","meta":{"field":"slug","type":"string","interface":"input","options":{"placeholder":"Enter the slug"}}}]}}}]},"collection":"footer","field":"hero"}	{"sort":4,"interface":"list","special":["cast-json"],"options":{"fields":[{"field":"heading","name":"heading","type":"string","meta":{"field":"heading","type":"string","interface":"input","options":{"placeholder":"Enter the heading"}}},{"field":"options","name":"options","type":"json","meta":{"field":"options","type":"json","interface":"list","options":{"fields":[{"field":"name","name":"name","type":"string","meta":{"field":"name","type":"string","interface":"input","options":{"placeholder":"enter the name"}}},{"field":"slug","name":"slug","type":"string","meta":{"field":"slug","type":"string","interface":"input","options":{"placeholder":"Enter the slug"}}}]}}}]},"collection":"footer","field":"hero"}	\N	\N
252	290	directus_fields	80	{"sort":5,"interface":"group-detail","special":["alias","no-data","group"],"collection":"footer","field":"footer_links"}	{"sort":5,"interface":"group-detail","special":["alias","no-data","group"],"collection":"footer","field":"footer_links"}	\N	\N
253	291	directus_fields	79	{"id":79,"collection":"footer","field":"hero","special":["cast-json"],"interface":"list","options":{"fields":[{"field":"heading","name":"heading","type":"string","meta":{"field":"heading","type":"string","interface":"input","options":{"placeholder":"Enter the heading"}}},{"field":"options","name":"options","type":"json","meta":{"field":"options","type":"json","interface":"list","options":{"fields":[{"field":"name","name":"name","type":"string","meta":{"field":"name","type":"string","interface":"input","options":{"placeholder":"enter the name"}}},{"field":"slug","name":"slug","type":"string","meta":{"field":"slug","type":"string","interface":"input","options":{"placeholder":"Enter the slug"}}}]}}}]},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":"footer_links","validation":null,"validation_message":null}	{"collection":"footer","field":"hero","sort":1,"group":"footer_links"}	\N	\N
254	292	directus_fields	64	{"id":64,"collection":"footer","field":"id","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"footer","field":"id","sort":1,"group":null}	\N	\N
255	293	directus_fields	78	{"id":78,"collection":"footer","field":"category","special":["cast-json"],"interface":"list","options":{"fields":[{"field":"name","name":"name","type":"string","meta":{"field":"name","type":"string","interface":"input","options":{"placeholder":"Enter Category Name"}}},{"field":"options","name":"options","type":"json","meta":{"field":"options","type":"json","interface":"list","options":{"fields":[{"field":"name","name":"name","type":"string","meta":{"field":"name","type":"string","interface":null}},{"field":"slug","name":"slug","meta":{"field":"slug"}}]}}}]},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":2,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"footer","field":"category","sort":2,"group":null}	\N	\N
256	294	directus_fields	74	{"id":74,"collection":"footer","field":"payment_icons","special":["files"],"interface":"files","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":3,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"footer","field":"payment_icons","sort":3,"group":null}	\N	\N
257	295	directus_fields	80	{"id":80,"collection":"footer","field":"footer_links","special":["alias","no-data","group"],"interface":"group-detail","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":4,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"footer","field":"footer_links","sort":4,"group":null}	\N	\N
258	296	directus_fields	64	{"id":64,"collection":"footer","field":"id","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"footer","field":"id","sort":1,"group":null}	\N	\N
259	297	directus_fields	78	{"id":78,"collection":"footer","field":"category","special":["cast-json"],"interface":"list","options":{"fields":[{"field":"name","name":"name","type":"string","meta":{"field":"name","type":"string","interface":"input","options":{"placeholder":"Enter Category Name"}}},{"field":"options","name":"options","type":"json","meta":{"field":"options","type":"json","interface":"list","options":{"fields":[{"field":"name","name":"name","type":"string","meta":{"field":"name","type":"string","interface":null}},{"field":"slug","name":"slug","meta":{"field":"slug"}}]}}}]},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":2,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"footer","field":"category","sort":2,"group":null}	\N	\N
260	298	directus_fields	74	{"id":74,"collection":"footer","field":"payment_icons","special":["files"],"interface":"files","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":3,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"footer","field":"payment_icons","sort":3,"group":null}	\N	\N
261	299	directus_fields	80	{"id":80,"collection":"footer","field":"footer_links","special":["alias","no-data","group"],"interface":"group-detail","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":4,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"footer","field":"footer_links","sort":4,"group":null}	\N	\N
277	315	directus_collections	footer	{"collection":"footer","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":true,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":2,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":2,"group":null}	\N	\N
262	300	directus_fields	79	{"id":79,"collection":"footer","field":"hero","special":["cast-json"],"interface":"list","options":{"fields":[{"field":"heading","name":"heading","type":"string","meta":{"field":"heading","type":"string","interface":"input","options":{"placeholder":"Enter the heading"}}},{"field":"options","name":"options","type":"json","meta":{"field":"options","type":"json","interface":"list","options":{"fields":[{"field":"name","name":"name","type":"string","meta":{"field":"name","type":"string","interface":"input","options":{"placeholder":"enter the name"}}},{"field":"slug","name":"slug","type":"string","meta":{"field":"slug","type":"string","interface":"input","options":{"placeholder":"Enter the slug"}}}]}}}]},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":5,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"footer","field":"hero","sort":5,"group":null}	\N	\N
263	301	directus_fields	81	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"footer_social_icons"}	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"footer_social_icons"}	\N	\N
264	302	directus_collections	footer_social_icons	{"singleton":false,"collection":"footer_social_icons"}	{"singleton":false,"collection":"footer_social_icons"}	\N	\N
265	303	directus_fields	82	{"sort":2,"interface":"file-image","special":["file"],"collection":"footer_social_icons","field":"image"}	{"sort":2,"interface":"file-image","special":["file"],"collection":"footer_social_icons","field":"image"}	\N	\N
266	304	directus_files	4c2e15a6-b9bb-4cb7-b565-82daff0d1b10	{"title":"YouTube Logo","filename_download":"YoutubeLogo.png","type":"image/png","storage":"local"}	{"title":"YouTube Logo","filename_download":"YoutubeLogo.png","type":"image/png","storage":"local"}	\N	\N
267	305	footer_social_icons	1	{"image":"4c2e15a6-b9bb-4cb7-b565-82daff0d1b10"}	{"image":"4c2e15a6-b9bb-4cb7-b565-82daff0d1b10"}	\N	\N
268	306	directus_files	a3a41661-38b3-4cd2-883f-bae5d89b4d15	{"title":"pH Tiktok Logo Fill","filename_download":"ph_tiktok-logo-fill.png","type":"image/png","storage":"local"}	{"title":"pH Tiktok Logo Fill","filename_download":"ph_tiktok-logo-fill.png","type":"image/png","storage":"local"}	\N	\N
269	307	footer_social_icons	2	{"image":"a3a41661-38b3-4cd2-883f-bae5d89b4d15"}	{"image":"a3a41661-38b3-4cd2-883f-bae5d89b4d15"}	\N	\N
270	308	directus_fields	83	{"sort":4,"interface":"list","special":["cast-json"],"options":{"fields":[{"field":"name","name":"name","type":"string","meta":{"field":"name","type":"string","interface":null}},{"field":"link","name":"link","meta":{"field":"link"}},{"field":"icon","name":"icon","type":"json","meta":{"field":"icon","type":"json","interface":"collection-item-dropdown","options":{"selectedCollection":"footer_social_icons"}}}]},"collection":"footer","field":"social_icons"}	{"sort":4,"interface":"list","special":["cast-json"],"options":{"fields":[{"field":"name","name":"name","type":"string","meta":{"field":"name","type":"string","interface":null}},{"field":"link","name":"link","meta":{"field":"link"}},{"field":"icon","name":"icon","type":"json","meta":{"field":"icon","type":"json","interface":"collection-item-dropdown","options":{"selectedCollection":"footer_social_icons"}}}]},"collection":"footer","field":"social_icons"}	\N	\N
271	309	directus_fields	83	{"id":83,"collection":"footer","field":"social_icons","special":["cast-json"],"interface":"list","options":{"fields":[{"field":"name","name":"name","type":"string","meta":{"field":"name","type":"string","interface":null}},{"field":"link","name":"link","meta":{"field":"link"}},{"field":"icon","name":"icon","type":"json","meta":{"field":"icon","type":"json","interface":"collection-item-dropdown","options":{"selectedCollection":"footer_social_icons","template":"{{image.title}}{{image.$thumbnail}}"}}}]},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":4,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"footer","field":"social_icons","options":{"fields":[{"field":"name","name":"name","type":"string","meta":{"field":"name","type":"string","interface":null}},{"field":"link","name":"link","meta":{"field":"link"}},{"field":"icon","name":"icon","type":"json","meta":{"field":"icon","type":"json","interface":"collection-item-dropdown","options":{"selectedCollection":"footer_social_icons","template":"{{image.title}}{{image.$thumbnail}}"}}}]}}	\N	\N
272	310	footer	1	{"id":1,"category":[{"name":"Products","options":[{"name":"220MP","slug":"220-mp"},{"name":"Accessories ","slug":"accessories "},{"name":"Consumables","slug":"consumables"}]},{"name":"Support"}],"social_icons":[{"name":"youtube","link":"youtube.com","icon":{"key":1,"collection":"footer_social_icons"}}],"payment_icons":[1,2,3,4,5,6]}	{"social_icons":[{"name":"youtube","link":"youtube.com","icon":{"key":1,"collection":"footer_social_icons"}}]}	\N	\N
273	311	directus_fields	83	{"id":83,"collection":"footer","field":"social_icons","special":["cast-json"],"interface":"list","options":{"fields":[{"field":"name","name":"name","type":"string","meta":{"field":"name","type":"string","interface":null}},{"field":"link","name":"link","meta":{"field":"link"}},{"field":"icon","name":"icon","type":"json","meta":{"field":"icon","type":"json","interface":"collection-item-dropdown","options":{"selectedCollection":"footer_social_icons","template":"{{image.title}}"},"width":"half","display":"labels"}}]},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":4,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"footer","field":"social_icons","options":{"fields":[{"field":"name","name":"name","type":"string","meta":{"field":"name","type":"string","interface":null}},{"field":"link","name":"link","meta":{"field":"link"}},{"field":"icon","name":"icon","type":"json","meta":{"field":"icon","type":"json","interface":"collection-item-dropdown","options":{"selectedCollection":"footer_social_icons","template":"{{image.title}}"},"width":"half","display":"labels"}}]}}	\N	\N
274	312	footer	1	{"id":1,"category":[{"name":"Products","options":[{"name":"220MP","slug":"220-mp"},{"name":"Accessories ","slug":"accessories "},{"name":"Consumables","slug":"consumables"}]},{"name":"Support"}],"social_icons":[{"name":"youtube","link":"youtube.com","icon":{"key":1,"collection":"footer_social_icons"}},{"name":"Test","link":"t.com","icon":{"key":1,"collection":"footer_social_icons"}}],"payment_icons":[1,2,3,4,5,6]}	{"social_icons":[{"name":"youtube","link":"youtube.com","icon":{"key":1,"collection":"footer_social_icons"}},{"name":"Test","link":"t.com","icon":{"key":1,"collection":"footer_social_icons"}}]}	\N	\N
275	313	directus_collections	homepage	{"collection":"homepage","icon":"folder","note":null,"color":null,"translations":null}	{"collection":"homepage","icon":"folder","note":null,"color":null,"translations":null}	\N	\N
276	314	directus_collections	homepage	{"collection":"homepage","icon":"folder","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":1,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":1,"group":null}	\N	\N
279	317	directus_collections	footer_files	{"collection":"footer_files","icon":"import_export","note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":4,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":4,"group":null}	\N	\N
280	318	directus_collections	footer_img	{"collection":"footer_img","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":5,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":5,"group":null}	\N	\N
281	319	directus_collections	footer_options	{"collection":"footer_options","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":6,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":6,"group":null}	\N	\N
282	320	directus_collections	footer_social_icons	{"collection":"footer_social_icons","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":7,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":7,"group":null}	\N	\N
283	321	directus_collections	header	{"collection":"header","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":8,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":8,"group":null}	\N	\N
284	322	directus_collections	test	{"collection":"test","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":9,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":9,"group":null}	\N	\N
285	323	directus_collections	header	{"collection":"header","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":1,"group":"homepage","collapse":"open","preview_url":null,"versioning":false}	{"sort":1,"group":"homepage"}	\N	\N
286	324	directus_collections	homepage	{"collection":"homepage","icon":"folder","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":1,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":1,"group":null}	\N	\N
287	325	directus_collections	footer	{"collection":"footer","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":true,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":2,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":2,"group":null}	\N	\N
288	326	directus_collections	footer_category	{"collection":"footer_category","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":3,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":3,"group":null}	\N	\N
289	327	directus_collections	footer_files	{"collection":"footer_files","icon":"import_export","note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":4,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":4,"group":null}	\N	\N
290	328	directus_collections	footer_img	{"collection":"footer_img","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":5,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":5,"group":null}	\N	\N
291	329	directus_collections	footer_options	{"collection":"footer_options","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":6,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":6,"group":null}	\N	\N
292	330	directus_collections	footer_social_icons	{"collection":"footer_social_icons","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":7,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":7,"group":null}	\N	\N
293	331	directus_collections	test	{"collection":"test","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":8,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":8,"group":null}	\N	\N
294	332	directus_collections	homepage	{"collection":"homepage","icon":"folder","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":1,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":1,"group":null}	\N	\N
296	334	directus_collections	footer	{"collection":"footer","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":true,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":3,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":3,"group":null}	\N	\N
297	335	directus_collections	footer_category	{"collection":"footer_category","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":4,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":4,"group":null}	\N	\N
298	336	directus_collections	footer_files	{"collection":"footer_files","icon":"import_export","note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":5,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":5,"group":null}	\N	\N
299	337	directus_collections	footer_img	{"collection":"footer_img","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":6,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":6,"group":null}	\N	\N
300	338	directus_collections	footer_options	{"collection":"footer_options","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":7,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":7,"group":null}	\N	\N
301	339	directus_collections	footer_social_icons	{"collection":"footer_social_icons","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":8,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":8,"group":null}	\N	\N
302	340	directus_collections	test	{"collection":"test","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":9,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":9,"group":null}	\N	\N
303	343	directus_collections	Modules	{"collection":"Modules","icon":"view_module","note":null,"color":"#3399FF","translations":null}	{"collection":"Modules","icon":"view_module","note":null,"color":"#3399FF","translations":null}	\N	\N
304	344	directus_collections	Modules	{"collection":"Modules","icon":"view_module","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":"#3399FF","item_duplication_fields":null,"sort":1,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":1,"group":null}	\N	\N
305	345	directus_collections	header	{"collection":"header","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":2,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":2,"group":null}	\N	\N
306	346	directus_collections	footer	{"collection":"footer","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":true,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":3,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":3,"group":null}	\N	\N
307	347	directus_collections	footer_category	{"collection":"footer_category","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":4,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":4,"group":null}	\N	\N
308	348	directus_collections	footer_img	{"collection":"footer_img","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":5,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":5,"group":null}	\N	\N
309	349	directus_collections	footer_options	{"collection":"footer_options","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":6,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":6,"group":null}	\N	\N
310	350	directus_collections	footer_social_icons	{"collection":"footer_social_icons","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":7,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":7,"group":null}	\N	\N
311	351	directus_collections	test	{"collection":"test","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":8,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":8,"group":null}	\N	\N
312	352	directus_collections	header	{"collection":"header","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":1,"group":"Modules","collapse":"open","preview_url":null,"versioning":false}	{"sort":1,"group":"Modules"}	\N	\N
313	353	directus_collections	Modules	{"collection":"Modules","icon":"view_module","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":"#3399FF","item_duplication_fields":null,"sort":1,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":1,"group":null}	\N	\N
314	354	directus_collections	footer	{"collection":"footer","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":true,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":2,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":2,"group":null}	\N	\N
315	355	directus_collections	footer_category	{"collection":"footer_category","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":3,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":3,"group":null}	\N	\N
316	356	directus_collections	footer_img	{"collection":"footer_img","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":4,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":4,"group":null}	\N	\N
317	357	directus_collections	footer_options	{"collection":"footer_options","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":5,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":5,"group":null}	\N	\N
318	358	directus_collections	footer_social_icons	{"collection":"footer_social_icons","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":6,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":6,"group":null}	\N	\N
319	359	directus_collections	test	{"collection":"test","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":7,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":7,"group":null}	\N	\N
320	360	directus_collections	Modules	{"collection":"Modules","icon":"view_module","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":"#3399FF","item_duplication_fields":null,"sort":1,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":1,"group":null}	\N	\N
321	362	directus_collections	footer_category	{"collection":"footer_category","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":2,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":2,"group":null}	\N	\N
323	363	directus_collections	footer_img	{"collection":"footer_img","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":3,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":3,"group":null}	\N	\N
322	361	directus_collections	footer	{"collection":"footer","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":true,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":1,"group":"header","collapse":"open","preview_url":null,"versioning":false}	{"sort":1,"group":"header"}	\N	\N
324	364	directus_collections	footer_options	{"collection":"footer_options","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":4,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":4,"group":null}	\N	\N
325	365	directus_collections	footer_social_icons	{"collection":"footer_social_icons","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":5,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":5,"group":null}	\N	\N
326	366	directus_collections	test	{"collection":"test","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":6,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":6,"group":null}	\N	\N
327	367	directus_collections	footer	{"collection":"footer","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":true,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":1,"group":"Modules","collapse":"open","preview_url":null,"versioning":false}	{"sort":1,"group":"Modules"}	\N	\N
328	368	directus_collections	header	{"collection":"header","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":2,"group":"Modules","collapse":"open","preview_url":null,"versioning":false}	{"sort":2,"group":"Modules"}	\N	\N
329	369	directus_collections	header	{"collection":"header","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":1,"group":"Modules","collapse":"open","preview_url":null,"versioning":false}	{"sort":1,"group":"Modules"}	\N	\N
330	370	directus_collections	footer	{"collection":"footer","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":true,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":2,"group":"Modules","collapse":"open","preview_url":null,"versioning":false}	{"sort":2,"group":"Modules"}	\N	\N
331	372	footer	1	{"id":1,"category":[{"name":"Products","options":[{"name":"220MP","slug":"220-mp"},{"name":"Accessories","slug":"accessories"},{"name":"Consumables","slug":"consumables"}]},{"name":"Support"}],"social_icons":[{"name":"youtube","link":"youtube.com","icon":{"key":1,"collection":"footer_social_icons"}},{"name":"Test","link":"t.com","icon":{"key":1,"collection":"footer_social_icons"}}]}	{"category":[{"name":"Products","options":[{"name":"220MP","slug":"220-mp"},{"name":"Accessories","slug":"accessories"},{"name":"Consumables","slug":"consumables"}]},{"name":"Support"}]}	\N	\N
332	373	directus_fields	84	{"sort":5,"interface":"files","special":["files"],"collection":"footer","field":"payment_icons"}	{"sort":5,"interface":"files","special":["files"],"collection":"footer","field":"payment_icons"}	\N	\N
333	374	directus_fields	85	{"sort":1,"hidden":true,"field":"id","collection":"footer_files"}	{"sort":1,"hidden":true,"field":"id","collection":"footer_files"}	\N	\N
334	375	directus_collections	footer_files	{"hidden":true,"icon":"import_export","collection":"footer_files"}	{"hidden":true,"icon":"import_export","collection":"footer_files"}	\N	\N
335	376	directus_fields	86	{"sort":2,"hidden":true,"collection":"footer_files","field":"footer_id"}	{"sort":2,"hidden":true,"collection":"footer_files","field":"footer_id"}	\N	\N
336	377	directus_fields	87	{"sort":3,"hidden":true,"collection":"footer_files","field":"directus_files_id"}	{"sort":3,"hidden":true,"collection":"footer_files","field":"directus_files_id"}	\N	\N
337	378	directus_fields	64	{"id":64,"collection":"footer","field":"id","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"footer","field":"id","sort":1,"group":null}	\N	\N
338	379	directus_fields	78	{"id":78,"collection":"footer","field":"category","special":["cast-json"],"interface":"list","options":{"fields":[{"field":"name","name":"name","type":"string","meta":{"field":"name","type":"string","interface":"input","options":{"placeholder":"Enter Category Name"}}},{"field":"options","name":"options","type":"json","meta":{"field":"options","type":"json","interface":"list","options":{"fields":[{"field":"name","name":"name","type":"string","meta":{"field":"name","type":"string","interface":null}},{"field":"slug","name":"slug","meta":{"field":"slug"}}]}}}]},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":2,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"footer","field":"category","sort":2,"group":null}	\N	\N
339	380	directus_fields	84	{"id":84,"collection":"footer","field":"payment_icons","special":["files"],"interface":"files","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":3,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"footer","field":"payment_icons","sort":3,"group":null}	\N	\N
340	381	directus_fields	83	{"id":83,"collection":"footer","field":"social_icons","special":["cast-json"],"interface":"list","options":{"fields":[{"field":"name","name":"name","type":"string","meta":{"field":"name","type":"string","interface":null}},{"field":"link","name":"link","meta":{"field":"link"}},{"field":"icon","name":"icon","type":"json","meta":{"field":"icon","type":"json","interface":"collection-item-dropdown","options":{"selectedCollection":"footer_social_icons","template":"{{image.title}}"},"width":"half","display":"labels"}}]},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":4,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"footer","field":"social_icons","sort":4,"group":null}	\N	\N
341	382	directus_files	9df3b5a1-4cbe-4d02-b01c-9dae5b799fc0	{"title":"Paypal","filename_download":"Paypal.png","type":"image/png","storage":"local"}	{"title":"Paypal","filename_download":"Paypal.png","type":"image/png","storage":"local"}	\N	\N
342	383	directus_files	2a85c8fb-a99a-468e-8f8f-e2615e111b1b	{"title":"Group (3)","filename_download":"Group (3).png","type":"image/png","storage":"local"}	{"title":"Group (3)","filename_download":"Group (3).png","type":"image/png","storage":"local"}	\N	\N
343	384	directus_files	4219d9db-edc1-43b4-81dd-ffec3298e076	{"title":"Apple Pay","filename_download":"ApplePay.png","type":"image/png","storage":"local"}	{"title":"Apple Pay","filename_download":"ApplePay.png","type":"image/png","storage":"local"}	\N	\N
344	386	directus_files	48b1f54a-d584-40ce-82df-3c3d8037e8fc	{"title":"Group (1)","filename_download":"Group (1).png","type":"image/png","storage":"local"}	{"title":"Group (1)","filename_download":"Group (1).png","type":"image/png","storage":"local"}	\N	\N
345	387	directus_files	9c822518-4d10-4d6c-b792-a5a5c66f6db2	{"title":"Google Pay","filename_download":"GooglePay.png","type":"image/png","storage":"local"}	{"title":"Google Pay","filename_download":"GooglePay.png","type":"image/png","storage":"local"}	\N	\N
346	385	directus_files	f6e583ca-7af1-4191-bf08-0b4a9466d016	{"title":"Group (2)","filename_download":"Group (2).png","type":"image/png","storage":"local"}	{"title":"Group (2)","filename_download":"Group (2).png","type":"image/png","storage":"local"}	\N	\N
347	388	directus_files	2c3254b8-bafc-46da-a6af-e25f6afebca8	{"title":"Mastercard","filename_download":"Mastercard.png","type":"image/png","storage":"local"}	{"title":"Mastercard","filename_download":"Mastercard.png","type":"image/png","storage":"local"}	\N	\N
348	389	directus_files	fe68783d-b5c1-4689-b856-590750e06d8c	{"title":"Group","filename_download":"Group.png","type":"image/png","storage":"local"}	{"title":"Group","filename_download":"Group.png","type":"image/png","storage":"local"}	\N	\N
357	399	directus_fields	78	{"id":78,"collection":"footer","field":"category","special":["cast-json"],"interface":"list","options":{"fields":[{"field":"name","name":"name","type":"string","meta":{"field":"name","type":"string","interface":"input","options":{"placeholder":"Enter Category Name"},"required":true}},{"field":"options","name":"options","type":"json","meta":{"field":"options","type":"json","interface":"list","options":{"fields":[{"field":"name","name":"name","type":"string","meta":{"field":"name","type":"string","interface":null}},{"field":"slug","name":"slug","meta":{"field":"slug"}}]},"required":true}}]},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":2,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"footer","field":"category","options":{"fields":[{"field":"name","name":"name","type":"string","meta":{"field":"name","type":"string","interface":"input","options":{"placeholder":"Enter Category Name"},"required":true}},{"field":"options","name":"options","type":"json","meta":{"field":"options","type":"json","interface":"list","options":{"fields":[{"field":"name","name":"name","type":"string","meta":{"field":"name","type":"string","interface":null}},{"field":"slug","name":"slug","meta":{"field":"slug"}}]},"required":true}}]}}	\N	\N
358	400	directus_fields	78	{"id":78,"collection":"footer","field":"category","special":["cast-json"],"interface":"list","options":{"fields":[{"field":"name","name":"name","type":"string","meta":{"field":"name","type":"string","interface":"input","options":{"placeholder":"Enter Category Name"},"required":true}},{"field":"options","name":"options","type":"json","meta":{"field":"options","type":"json","interface":"list","options":{"fields":[{"field":"name","name":"name","type":"string","meta":{"field":"name","type":"string","interface":"input","required":true,"options":{"placeholder":"Enter the name"}}},{"field":"slug","name":"slug","type":"string","meta":{"field":"slug","type":"string","interface":"input","options":{"placeholder":"Enter the slug"}}}]},"required":true}}]},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":2,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"footer","field":"category","options":{"fields":[{"field":"name","name":"name","type":"string","meta":{"field":"name","type":"string","interface":"input","options":{"placeholder":"Enter Category Name"},"required":true}},{"field":"options","name":"options","type":"json","meta":{"field":"options","type":"json","interface":"list","options":{"fields":[{"field":"name","name":"name","type":"string","meta":{"field":"name","type":"string","interface":"input","required":true,"options":{"placeholder":"Enter the name"}}},{"field":"slug","name":"slug","type":"string","meta":{"field":"slug","type":"string","interface":"input","options":{"placeholder":"Enter the slug"}}}]},"required":true}}]}}	\N	\N
359	401	footer	1	{"id":1,"category":[{"name":"Products","options":[{"name":"220MP","slug":"220-mp"},{"name":"Accessories","slug":"accessories"},{"name":"Consumables","slug":"consumables"}]},{"name":"Support","options":[{"name":"Order Tracking","slug":"order-tracking"},{"name":"FAQs","slug":"faqs"}]},{"name":"Privacy & Terms","options":[{"name":"Terms of Use","slug":"terms-of-use"},{"name":"Privacy Policy","slug":"privacy-policy"}]}],"social_icons":[{"name":"youtube","link":"youtube.com","icon":{"key":1,"collection":"footer_social_icons"}},{"name":"Test","link":"t.com","icon":{"key":1,"collection":"footer_social_icons"}}],"payment_icons":[1,2,3,4,5,6,7,8]}	{"category":[{"name":"Products","options":[{"name":"220MP","slug":"220-mp"},{"name":"Accessories","slug":"accessories"},{"name":"Consumables","slug":"consumables"}]},{"name":"Support","options":[{"name":"Order Tracking","slug":"order-tracking"},{"name":"FAQs","slug":"faqs"}]},{"name":"Privacy & Terms","options":[{"name":"Terms of Use","slug":"terms-of-use"},{"name":"Privacy Policy","slug":"privacy-policy"}]}]}	\N	\N
360	402	directus_fields	78	{"id":78,"collection":"footer","field":"category","special":["cast-json"],"interface":"list","options":{"fields":[{"field":"name","name":"name","type":"string","meta":{"field":"name","type":"string","interface":"input","options":{"placeholder":"Enter Category Name"},"required":true}},{"field":"options","name":"options","type":"json","meta":{"field":"options","type":"json","interface":"list","options":{"fields":[{"field":"name","name":"name","type":"string","meta":{"field":"name","type":"string","interface":"input","required":true,"options":{"placeholder":"Enter the name"}}},{"field":"slug","name":"slug","type":"string","meta":{"field":"slug","type":"string","interface":"input","options":{"placeholder":"Enter the slug"},"required":true}}]},"required":true}}]},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":2,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"footer","field":"category","options":{"fields":[{"field":"name","name":"name","type":"string","meta":{"field":"name","type":"string","interface":"input","options":{"placeholder":"Enter Category Name"},"required":true}},{"field":"options","name":"options","type":"json","meta":{"field":"options","type":"json","interface":"list","options":{"fields":[{"field":"name","name":"name","type":"string","meta":{"field":"name","type":"string","interface":"input","required":true,"options":{"placeholder":"Enter the name"}}},{"field":"slug","name":"slug","type":"string","meta":{"field":"slug","type":"string","interface":"input","options":{"placeholder":"Enter the slug"},"required":true}}]},"required":true}}]}}	\N	\N
361	403	footer	1	{"id":1,"category":[{"name":"Products","options":[{"name":"220MP","slug":"220-mp"},{"name":"Accessories","slug":"accessories"},{"name":"Consumables","slug":"consumables"}]},{"name":"Support","options":[{"name":"Order Tracking","slug":"order-tracking"},{"name":"FAQs","slug":"faqs"}]},{"name":"Privacy & Terms","options":[{"name":"Terms of Use","slug":"terms-of-use"},{"name":"Privacy Policy","slug":"privacy-policy"},{"name":"Return & Refund Policy","slug":"return-refund-policy"},{"name":"Compliance Statement","slug":"compliance-statement"},{"name":"Other Policies","slug":"other-policies"}]}],"social_icons":[{"name":"youtube","link":"youtube.com","icon":{"key":1,"collection":"footer_social_icons"}},{"name":"Test","link":"t.com","icon":{"key":1,"collection":"footer_social_icons"}}],"payment_icons":[1,2,3,4,5,6,7,8]}	{"category":[{"name":"Products","options":[{"name":"220MP","slug":"220-mp"},{"name":"Accessories","slug":"accessories"},{"name":"Consumables","slug":"consumables"}]},{"name":"Support","options":[{"name":"Order Tracking","slug":"order-tracking"},{"name":"FAQs","slug":"faqs"}]},{"name":"Privacy & Terms","options":[{"name":"Terms of Use","slug":"terms-of-use"},{"name":"Privacy Policy","slug":"privacy-policy"},{"name":"Return & Refund Policy","slug":"return-refund-policy"},{"name":"Compliance Statement","slug":"compliance-statement"},{"name":"Other Policies","slug":"other-policies"}]}]}	\N	\N
362	404	footer	1	{"id":1,"category":[{"name":"Products","options":[{"name":"220MP","slug":"220-mp"},{"name":"Accessories","slug":"accessories"},{"name":"Consumables","slug":"consumables"}]},{"name":"Support","options":[{"name":"Order Tracking","slug":"order-tracking"},{"name":"FAQs","slug":"faqs"}]},{"name":"Privacy & Terms","options":[{"name":"Terms of Use","slug":"terms-of-use"},{"name":"Privacy Policy","slug":"privacy-policy"},{"name":"Return & Refund Policy","slug":"return-refund-policy"},{"name":"Compliance Statement","slug":"compliance-statement"},{"name":"Other Policies","slug":"other-policies"}]},{"name":"Company","options":[{"name":"About Us","slug":"about-us"},{"name":"Contact Us","slug":"contact-us"}]}],"social_icons":[{"name":"youtube","link":"youtube.com","icon":{"key":1,"collection":"footer_social_icons"}},{"name":"Test","link":"t.com","icon":{"key":1,"collection":"footer_social_icons"}}],"payment_icons":[1,2,3,4,5,6,7,8]}	{"category":[{"name":"Products","options":[{"name":"220MP","slug":"220-mp"},{"name":"Accessories","slug":"accessories"},{"name":"Consumables","slug":"consumables"}]},{"name":"Support","options":[{"name":"Order Tracking","slug":"order-tracking"},{"name":"FAQs","slug":"faqs"}]},{"name":"Privacy & Terms","options":[{"name":"Terms of Use","slug":"terms-of-use"},{"name":"Privacy Policy","slug":"privacy-policy"},{"name":"Return & Refund Policy","slug":"return-refund-policy"},{"name":"Compliance Statement","slug":"compliance-statement"},{"name":"Other Policies","slug":"other-policies"}]},{"name":"Company","options":[{"name":"About Us","slug":"about-us"},{"name":"Contact Us","slug":"contact-us"}]}]}	\N	\N
363	405	footer	1	{"id":1,"category":[{"name":"Products","options":[{"name":"220MP","slug":"220-mp"},{"name":"Accessories","slug":"accessories"},{"name":"Consumables","slug":"consumables"}]},{"name":"Support","options":[{"name":"Order Tracking","slug":"order-tracking"},{"name":"FAQs","slug":"faqs"}]},{"name":"Privacy & Terms","options":[{"name":"Terms of Use","slug":"terms-of-use"},{"name":"Privacy Policy","slug":"privacy-policy"},{"name":"Return & Refund Policy","slug":"return-refund-policy"},{"name":"Compliance Statement","slug":"compliance-statement"},{"name":"Other Policies","slug":"other-policies"}]},{"name":"Company","options":[{"name":"About Us","slug":"about-us"},{"name":"Contact Us","slug":"contact-us"}]}],"social_icons":null,"payment_icons":[1,2,3,4,5,6,7,8]}	{"social_icons":null}	\N	\N
364	406	directus_files	6568ed47-6d94-4f5b-8f3b-c09fa1a25f36	{"title":"Ic Round Facebook","filename_download":"ic_round-facebook.png","type":"image/png","storage":"local"}	{"title":"Ic Round Facebook","filename_download":"ic_round-facebook.png","type":"image/png","storage":"local"}	\N	\N
365	407	footer_social_icons	3	{"image":"6568ed47-6d94-4f5b-8f3b-c09fa1a25f36"}	{"image":"6568ed47-6d94-4f5b-8f3b-c09fa1a25f36"}	\N	\N
366	408	directus_files	3329912f-e82c-4f2c-8417-7e26a0e307da	{"title":"Instagram Logo","filename_download":"InstagramLogo.png","type":"image/png","storage":"local"}	{"title":"Instagram Logo","filename_download":"InstagramLogo.png","type":"image/png","storage":"local"}	\N	\N
367	409	footer_social_icons	4	{"image":"3329912f-e82c-4f2c-8417-7e26a0e307da"}	{"image":"3329912f-e82c-4f2c-8417-7e26a0e307da"}	\N	\N
368	410	footer	1	{"id":1,"category":[{"name":"Products","options":[{"name":"220MP","slug":"220-mp"},{"name":"Accessories","slug":"accessories"},{"name":"Consumables","slug":"consumables"}]},{"name":"Support","options":[{"name":"Order Tracking","slug":"order-tracking"},{"name":"FAQs","slug":"faqs"}]},{"name":"Privacy & Terms","options":[{"name":"Terms of Use","slug":"terms-of-use"},{"name":"Privacy Policy","slug":"privacy-policy"},{"name":"Return & Refund Policy","slug":"return-refund-policy"},{"name":"Compliance Statement","slug":"compliance-statement"},{"name":"Other Policies","slug":"other-policies"}]},{"name":"Company","options":[{"name":"About Us","slug":"about-us"},{"name":"Contact Us","slug":"contact-us"}]}],"social_icons":[{"name":"Insta","link":"instagram.com","icon":{"key":4,"collection":"footer_social_icons"}}],"payment_icons":[1,2,3,4,5,6,7,8]}	{"social_icons":[{"name":"Insta","link":"instagram.com","icon":{"key":4,"collection":"footer_social_icons"}}]}	\N	\N
369	411	footer	1	{"id":1,"category":[{"name":"Products","options":[{"name":"220MP","slug":"220-mp"},{"name":"Accessories","slug":"accessories"},{"name":"Consumables","slug":"consumables"}]},{"name":"Support","options":[{"name":"Order Tracking","slug":"order-tracking"},{"name":"FAQs","slug":"faqs"}]},{"name":"Privacy & Terms","options":[{"name":"Terms of Use","slug":"terms-of-use"},{"name":"Privacy Policy","slug":"privacy-policy"},{"name":"Return & Refund Policy","slug":"return-refund-policy"},{"name":"Compliance Statement","slug":"compliance-statement"},{"name":"Other Policies","slug":"other-policies"}]},{"name":"Company","options":[{"name":"About Us","slug":"about-us"},{"name":"Contact Us","slug":"contact-us"}]}],"social_icons":[{"name":"Instagram","link":"instagram.com","icon":{"key":4,"collection":"footer_social_icons"}}],"payment_icons":[1,2,3,4,5,6,7,8]}	{"social_icons":[{"name":"Instagram","link":"instagram.com","icon":{"key":4,"collection":"footer_social_icons"}}]}	\N	\N
370	412	directus_fields	83	{"id":83,"collection":"footer","field":"social_icons","special":["cast-json"],"interface":"list","options":{"fields":[{"field":"name","name":"name","type":"string","meta":{"field":"name","type":"string","interface":null,"required":true}},{"field":"link","name":"link","meta":{"field":"link","required":true}},{"field":"icon","name":"icon","type":"json","meta":{"field":"icon","type":"json","interface":"collection-item-dropdown","options":{"selectedCollection":"footer_social_icons","template":"{{image.title}}"},"width":"half","display":"labels","required":true}}]},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":4,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"footer","field":"social_icons","options":{"fields":[{"field":"name","name":"name","type":"string","meta":{"field":"name","type":"string","interface":null,"required":true}},{"field":"link","name":"link","meta":{"field":"link","required":true}},{"field":"icon","name":"icon","type":"json","meta":{"field":"icon","type":"json","interface":"collection-item-dropdown","options":{"selectedCollection":"footer_social_icons","template":"{{image.title}}"},"width":"half","display":"labels","required":true}}]}}	\N	\N
371	413	directus_collections	header	{"collection":"header","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":1,"group":"Modules","collapse":"open","preview_url":null,"versioning":false}	{"sort":1,"group":"Modules"}	\N	\N
372	414	directus_collections	footer	{"collection":"footer","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":true,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":2,"group":"Modules","collapse":"open","preview_url":null,"versioning":false}	{"sort":2,"group":"Modules"}	\N	\N
387	435	directus_files	b65a1efc-d3f1-4718-835a-68a42332f4d4	{"title":"Image 2","filename_download":"image 2.png","type":"image/png","storage":"local"}	{"title":"Image 2","filename_download":"image 2.png","type":"image/png","storage":"local"}	\N	\N
373	415	directus_collections	footer_social_icons	{"collection":"footer_social_icons","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":3,"group":"Modules","collapse":"open","preview_url":null,"versioning":false}	{"sort":3,"group":"Modules"}	\N	\N
374	416	directus_collections	Modules	{"collection":"Modules","icon":"view_module","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":"#3399FF","item_duplication_fields":null,"sort":1,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":1,"group":null}	\N	\N
375	417	directus_collections	footer_category	{"collection":"footer_category","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":2,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":2,"group":null}	\N	\N
376	418	directus_collections	footer_img	{"collection":"footer_img","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":3,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":3,"group":null}	\N	\N
377	419	directus_collections	footer_options	{"collection":"footer_options","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":4,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":4,"group":null}	\N	\N
378	420	directus_collections	footer_files	{"collection":"footer_files","icon":"import_export","note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":5,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":5,"group":null}	\N	\N
379	421	directus_fields	83	{"id":83,"collection":"footer","field":"social_icons","special":["cast-json"],"interface":"list","options":{"fields":[{"field":"name","name":"name","type":"string","meta":{"field":"name","type":"string","interface":"input","required":true,"options":{"placeholder":"Enter the name"}}},{"field":"link","name":"link","type":"string","meta":{"field":"link","required":true,"type":"string","interface":"input","options":{"placeholder":"Enter the link"}}},{"field":"icon","name":"icon","type":"json","meta":{"field":"icon","type":"json","interface":"collection-item-dropdown","options":{"selectedCollection":"footer_social_icons","template":"{{image.title}}"},"width":"half","display":"labels","required":true}}]},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":4,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"footer","field":"social_icons","options":{"fields":[{"field":"name","name":"name","type":"string","meta":{"field":"name","type":"string","interface":"input","required":true,"options":{"placeholder":"Enter the name"}}},{"field":"link","name":"link","type":"string","meta":{"field":"link","required":true,"type":"string","interface":"input","options":{"placeholder":"Enter the link"}}},{"field":"icon","name":"icon","type":"json","meta":{"field":"icon","type":"json","interface":"collection-item-dropdown","options":{"selectedCollection":"footer_social_icons","template":"{{image.title}}"},"width":"half","display":"labels","required":true}}]}}	\N	\N
380	422	footer	1	{"id":1,"category":[{"name":"Products","options":[{"name":"220MP","slug":"220-mp"},{"name":"Accessories","slug":"accessories"},{"name":"Consumables","slug":"consumables"}]},{"name":"Support","options":[{"name":"Order Tracking","slug":"order-tracking"},{"name":"FAQs","slug":"faqs"}]},{"name":"Privacy & Terms","options":[{"name":"Terms of Use","slug":"terms-of-use"},{"name":"Privacy Policy","slug":"privacy-policy"},{"name":"Return & Refund Policy","slug":"return-refund-policy"},{"name":"Compliance Statement","slug":"compliance-statement"},{"name":"Other Policies","slug":"other-policies"}]},{"name":"Company","options":[{"name":"About Us","slug":"about-us"},{"name":"Contact Us","slug":"contact-us"}]}],"social_icons":[{"name":"Instagram","link":"instagram.com","icon":{"key":4,"collection":"footer_social_icons"}},{"name":"facebook","link":"facebook.com","icon":{"key":3,"collection":"footer_social_icons"}},{"name":"tik-tok","link":"tik-tok.com","icon":{"key":2,"collection":"footer_social_icons"}},{"name":"youtube","link":"youtube.com","icon":{"key":1,"collection":"footer_social_icons"}}],"payment_icons":[1,2,3,4,5,6,7,8]}	{"social_icons":[{"name":"Instagram","link":"instagram.com","icon":{"key":4,"collection":"footer_social_icons"}},{"name":"facebook","link":"facebook.com","icon":{"key":3,"collection":"footer_social_icons"}},{"name":"tik-tok","link":"tik-tok.com","icon":{"key":2,"collection":"footer_social_icons"}},{"name":"youtube","link":"youtube.com","icon":{"key":1,"collection":"footer_social_icons"}}]}	\N	\N
381	423	directus_permissions	6	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"footer","action":"read"}	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"footer","action":"read"}	\N	\N
382	425	directus_permissions	7	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"footer_social_icons","action":"read"}	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"footer_social_icons","action":"read"}	\N	\N
383	431	directus_fields	88	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"hero_section"}	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"hero_section"}	\N	\N
384	432	directus_fields	89	{"sort":2,"interface":"input","hidden":true,"field":"sort","collection":"hero_section"}	{"sort":2,"interface":"input","hidden":true,"field":"sort","collection":"hero_section"}	\N	\N
385	433	directus_collections	hero_section	{"sort_field":"sort","singleton":false,"collection":"hero_section"}	{"sort_field":"sort","singleton":false,"collection":"hero_section"}	\N	\N
386	434	directus_fields	90	{"sort":3,"interface":"file-image","special":["file"],"required":true,"collection":"hero_section","field":"bg_img"}	{"sort":3,"interface":"file-image","special":["file"],"required":true,"collection":"hero_section","field":"bg_img"}	\N	\N
388	436	hero_section	1	{"bg_img":"b65a1efc-d3f1-4718-835a-68a42332f4d4"}	{"bg_img":"b65a1efc-d3f1-4718-835a-68a42332f4d4"}	\N	\N
389	437	directus_fields	90	{"id":90,"collection":"hero_section","field":"bg_img","special":["file"],"interface":"file-image","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":3,"width":"half","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"hero_section","field":"bg_img","width":"half"}	\N	\N
390	438	directus_fields	91	{"sort":4,"interface":"list","special":["cast-json"],"options":{"fields":[{"field":"heading","name":"heading","type":"string","meta":{"field":"heading","type":"string","note":null,"interface":"input"}}]},"collection":"hero_section","field":"heading"}	{"sort":4,"interface":"list","special":["cast-json"],"options":{"fields":[{"field":"heading","name":"heading","type":"string","meta":{"field":"heading","type":"string","note":null,"interface":"input"}}]},"collection":"hero_section","field":"heading"}	\N	\N
391	439	directus_fields	92	{"sort":4,"interface":"input","special":null,"collection":"hero_section","field":"heading"}	{"sort":4,"interface":"input","special":null,"collection":"hero_section","field":"heading"}	\N	\N
392	440	directus_fields	92	{"id":92,"collection":"hero_section","field":"heading","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":4,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"hero_section","field":"heading","required":true}	\N	\N
393	441	directus_fields	92	{"id":92,"collection":"hero_section","field":"heading","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":4,"width":"half","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"hero_section","field":"heading","width":"half"}	\N	\N
394	442	directus_fields	93	{"sort":5,"interface":"input","special":null,"required":true,"collection":"hero_section","field":"sub_heading"}	{"sort":5,"interface":"input","special":null,"required":true,"collection":"hero_section","field":"sub_heading"}	\N	\N
395	443	hero_section	1	{"id":1,"sort":null,"bg_img":"b65a1efc-d3f1-4718-835a-68a42332f4d4","heading":"MAVOK 230MP","sub_heading":"A new era of welding innovation and performance starts now."}	{"heading":"MAVOK 230MP","sub_heading":"A new era of welding innovation and performance starts now."}	\N	\N
396	444	directus_fields	93	{"id":93,"collection":"hero_section","field":"sub_heading","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":5,"width":"half","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"hero_section","field":"sub_heading","width":"half"}	\N	\N
397	445	directus_fields	94	{"sort":6,"interface":"presentation-links","special":["alias","no-data"],"options":{"links":[{"label":"buttons","icon":"smart_button","type":"normal"}]},"collection":"hero_section","field":"links-teb1yd"}	{"sort":6,"interface":"presentation-links","special":["alias","no-data"],"options":{"links":[{"label":"buttons","icon":"smart_button","type":"normal"}]},"collection":"hero_section","field":"links-teb1yd"}	\N	\N
398	446	directus_fields	95	{"sort":6,"interface":"list","special":["cast-json"],"required":true,"options":{"fields":[{"field":"text","name":"text","type":"string","meta":{"field":"text","type":"string","required":true,"interface":"input","options":{"placeholder":"Enter the text"}}},{"field":"link","name":"link","type":"string","meta":{"field":"link","type":"string","required":true,"interface":"input","options":{"placeholder":"Enter the link"}}}]},"collection":"hero_section","field":"button_text"}	{"sort":6,"interface":"list","special":["cast-json"],"required":true,"options":{"fields":[{"field":"text","name":"text","type":"string","meta":{"field":"text","type":"string","required":true,"interface":"input","options":{"placeholder":"Enter the text"}}},{"field":"link","name":"link","type":"string","meta":{"field":"link","type":"string","required":true,"interface":"input","options":{"placeholder":"Enter the link"}}}]},"collection":"hero_section","field":"button_text"}	\N	\N
399	447	directus_fields	95	{"id":95,"collection":"hero_section","field":"button_text","special":["cast-json"],"interface":"list","options":{"fields":[{"field":"text","name":"text","type":"string","meta":{"field":"text","type":"string","required":true,"interface":"input","options":{"placeholder":"Enter the text"}}},{"field":"link","name":"link","type":"string","meta":{"field":"link","type":"string","required":true,"interface":"input","options":{"placeholder":"Enter the link"}}}]},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":6,"width":"half","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"hero_section","field":"button_text","width":"half"}	\N	\N
400	448	hero_section	1	{"id":1,"sort":null,"bg_img":"b65a1efc-d3f1-4718-835a-68a42332f4d4","heading":"MAVOK 230MP","sub_heading":"A new era of welding innovation and performance starts now.","button_text":[{"text":"Shop Now","link":"category"}]}	{"button_text":[{"text":"Shop Now","link":"category"}]}	\N	\N
401	449	directus_fields	96	{"sort":7,"interface":"list","special":["cast-json"],"options":{"fields":[{"field":"title","name":"title","type":"string","meta":{"field":"title","type":"string","required":true,"interface":"input","options":{"placeholder":"Enter the title"}}},{"field":"sub_title","name":"sub_title","type":"string","meta":{"field":"sub_title","type":"string","required":true,"interface":"input","options":{"placeholder":"Enter the subtitle"}}}]},"collection":"hero_section","field":"Lists"}	{"sort":7,"interface":"list","special":["cast-json"],"options":{"fields":[{"field":"title","name":"title","type":"string","meta":{"field":"title","type":"string","required":true,"interface":"input","options":{"placeholder":"Enter the title"}}},{"field":"sub_title","name":"sub_title","type":"string","meta":{"field":"sub_title","type":"string","required":true,"interface":"input","options":{"placeholder":"Enter the subtitle"}}}]},"collection":"hero_section","field":"Lists"}	\N	\N
402	450	directus_fields	90	{"id":90,"collection":"hero_section","field":"bg_img","special":["file"],"interface":"file-image","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":3,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"hero_section","field":"bg_img","width":"full"}	\N	\N
403	451	directus_fields	90	{"id":90,"collection":"hero_section","field":"bg_img","special":["file"],"interface":"file-image","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":3,"width":"half","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"hero_section","field":"bg_img","width":"half"}	\N	\N
441	491	directus_files	c84e680e-64b7-4dfd-8113-265b3985feb2	{"title":"Apple Pay","filename_download":"ApplePay.png","type":"image/png","storage":"local"}	{"title":"Apple Pay","filename_download":"ApplePay.png","type":"image/png","storage":"local"}	\N	\N
404	452	directus_fields	92	{"id":92,"collection":"hero_section","field":"heading","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":4,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"hero_section","field":"heading","width":"full"}	\N	\N
405	453	directus_fields	95	{"id":95,"collection":"hero_section","field":"button_text","special":["cast-json"],"interface":"list","options":{"fields":[{"field":"text","name":"text","type":"string","meta":{"field":"text","type":"string","required":true,"interface":"input","options":{"placeholder":"Enter the text"}}},{"field":"link","name":"link","type":"string","meta":{"field":"link","type":"string","required":true,"interface":"input","options":{"placeholder":"Enter the link"}}}]},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":6,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"hero_section","field":"button_text","width":"full"}	\N	\N
406	454	directus_fields	93	{"id":93,"collection":"hero_section","field":"sub_heading","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":5,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"hero_section","field":"sub_heading","width":"full"}	\N	\N
407	455	hero_section	1	{"id":1,"sort":null,"bg_img":"b65a1efc-d3f1-4718-835a-68a42332f4d4","heading":"MAVOK 230MP","sub_heading":"A new era of welding innovation and performance starts now.","button_text":[{"text":"Shop Now","link":"category"}],"Lists":[{"title":"10a/15A","sub_title":"Dual Input"},{"title":"Single & Double","sub_title":"Pulse MIG"},{"title":"AC/DC","sub_title":"High Frequency TIG"},{"title":"Pilot Arc","sub_title":"Plasma Cutting"}]}	{"Lists":[{"title":"10a/15A","sub_title":"Dual Input"},{"title":"Single & Double","sub_title":"Pulse MIG"},{"title":"AC/DC","sub_title":"High Frequency TIG"},{"title":"Pilot Arc","sub_title":"Plasma Cutting"}]}	\N	\N
408	456	hero_section	1	{"id":1,"sort":null,"bg_img":"b65a1efc-d3f1-4718-835a-68a42332f4d4","heading":"MAVOK 230MP","sub_heading":"A new era of welding innovation and performance starts now.","button_text":[{"text":"Shop Now","link":"category"}],"Lists":[{"title":"10a/15A","sub_title":"Dual Input"},{"title":"Single & Double","sub_title":"Pulse MIG"},{"title":"AC/DC","sub_title":"High Frequency TIG"},{"title":"Pilot Arc","sub_title":"Plasma Cutting"},{"title":"7” LCD","sub_title":"Touch Screen"}]}	{"Lists":[{"title":"10a/15A","sub_title":"Dual Input"},{"title":"Single & Double","sub_title":"Pulse MIG"},{"title":"AC/DC","sub_title":"High Frequency TIG"},{"title":"Pilot Arc","sub_title":"Plasma Cutting"},{"title":"7” LCD","sub_title":"Touch Screen"}]}	\N	\N
409	457	directus_permissions	8	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"hero_section","action":"read"}	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"hero_section","action":"read"}	\N	\N
410	459	directus_collections	hero_section	{"collection":"hero_section","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":"sort","accountability":"all","color":null,"item_duplication_fields":null,"sort":1,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":1,"group":null}	\N	\N
411	460	directus_collections	Modules	{"collection":"Modules","icon":"view_module","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":"#3399FF","item_duplication_fields":null,"sort":2,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":2,"group":null}	\N	\N
412	461	directus_fields	97	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"feature_section"}	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"feature_section"}	\N	\N
413	462	directus_collections	feature_section	{"singleton":false,"collection":"feature_section"}	{"singleton":false,"collection":"feature_section"}	\N	\N
414	463	directus_collections	hero_section	{"collection":"hero_section","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":"sort","accountability":"all","color":null,"item_duplication_fields":null,"sort":1,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":1,"group":null}	\N	\N
415	464	directus_collections	feature_section	{"collection":"feature_section","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":2,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":2,"group":null}	\N	\N
416	465	directus_collections	Modules	{"collection":"Modules","icon":"view_module","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":"#3399FF","item_duplication_fields":null,"sort":3,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":3,"group":null}	\N	\N
417	466	directus_fields	98	{"sort":2,"interface":"input","special":null,"required":true,"options":{"placeholder":"enter the heading"},"collection":"feature_section","field":"heading"}	{"sort":2,"interface":"input","special":null,"required":true,"options":{"placeholder":"enter the heading"},"collection":"feature_section","field":"heading"}	\N	\N
418	467	directus_fields	99	{"sort":2,"interface":"list","special":["cast-json"],"options":{"fields":[{"field":"heading","name":"heading","type":"string","meta":{"field":"heading","type":"string","interface":"input"}},{"field":"sub_heading","name":"sub_heading","type":"string","meta":{"field":"sub_heading","type":"string","interface":"input"}}]},"collection":"feature_section","field":"heading"}	{"sort":2,"interface":"list","special":["cast-json"],"options":{"fields":[{"field":"heading","name":"heading","type":"string","meta":{"field":"heading","type":"string","interface":"input"}},{"field":"sub_heading","name":"sub_heading","type":"string","meta":{"field":"sub_heading","type":"string","interface":"input"}}]},"collection":"feature_section","field":"heading"}	\N	\N
419	468	feature_section	1	{"heading":[{"heading":"modules","sub_heading":"Lorem ipsum title."}]}	{"heading":[{"heading":"modules","sub_heading":"Lorem ipsum title."}]}	\N	\N
420	469	directus_fields	99	{"id":99,"collection":"feature_section","field":"heading","special":["cast-json"],"interface":"list","options":{"fields":[{"field":"heading","name":"heading","type":"string","meta":{"field":"heading","type":"string","interface":"input","required":true}},{"field":"sub_heading","name":"sub_heading","type":"string","meta":{"field":"sub_heading","type":"string","interface":"input","required":true}},{"field":"description","name":"description","type":"string","meta":{"field":"description","type":"string","required":true,"interface":"input"}}]},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":2,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"feature_section","field":"heading","options":{"fields":[{"field":"heading","name":"heading","type":"string","meta":{"field":"heading","type":"string","interface":"input","required":true}},{"field":"sub_heading","name":"sub_heading","type":"string","meta":{"field":"sub_heading","type":"string","interface":"input","required":true}},{"field":"description","name":"description","type":"string","meta":{"field":"description","type":"string","required":true,"interface":"input"}}]}}	\N	\N
421	470	feature_section	1	{"id":1,"heading":[{"heading":"modules","sub_heading":"Lorem ipsum title.","description":"Ullamcorper laoreet quis auctor tempor nisl auctor. Facilisi et purus vitae sed. Urna pellentesque ac justo dictumst egestas pellentesque maecenas "}]}	{"heading":[{"heading":"modules","sub_heading":"Lorem ipsum title.","description":"Ullamcorper laoreet quis auctor tempor nisl auctor. Facilisi et purus vitae sed. Urna pellentesque ac justo dictumst egestas pellentesque maecenas "}]}	\N	\N
422	471	directus_fields	100	{"sort":3,"interface":"file-image","special":["file"],"required":true,"collection":"feature_section","field":"bg_img"}	{"sort":3,"interface":"file-image","special":["file"],"required":true,"collection":"feature_section","field":"bg_img"}	\N	\N
423	472	directus_files	87b8e117-bbab-4fa3-95ac-7036da47315b	{"title":"Content   Image 1","filename_download":"Content - Image 1.png","type":"image/png","storage":"local"}	{"title":"Content   Image 1","filename_download":"Content - Image 1.png","type":"image/png","storage":"local"}	\N	\N
424	473	feature_section	1	{"id":1,"heading":[{"heading":"modules","sub_heading":"Lorem ipsum title.","description":"Ullamcorper laoreet quis auctor tempor nisl auctor. Facilisi et purus vitae sed. Urna pellentesque ac justo dictumst egestas pellentesque maecenas "}],"bg_img":"87b8e117-bbab-4fa3-95ac-7036da47315b"}	{"bg_img":"87b8e117-bbab-4fa3-95ac-7036da47315b"}	\N	\N
425	474	directus_fields	100	{"id":100,"collection":"feature_section","field":"bg_img","special":["file"],"interface":"file-image","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":3,"width":"half","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"feature_section","field":"bg_img","width":"half"}	\N	\N
426	475	directus_permissions	9	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"feature_section","action":"read"}	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"feature_section","action":"read"}	\N	\N
427	477	directus_files	9e292dff-6889-445a-a930-76bc403b725b	{"title":"Image 9","filename_download":"image 9.png","type":"image/png","storage":"local"}	{"title":"Image 9","filename_download":"image 9.png","type":"image/png","storage":"local"}	\N	\N
428	478	feature_section	1	{"id":1,"heading":[{"heading":"modules","sub_heading":"Lorem ipsum title.","description":"Ullamcorper laoreet quis auctor tempor nisl auctor. Facilisi et purus vitae sed. Urna pellentesque ac justo dictumst egestas pellentesque maecenas "}],"bg_img":"9e292dff-6889-445a-a930-76bc403b725b"}	{"bg_img":"9e292dff-6889-445a-a930-76bc403b725b"}	\N	\N
429	479	directus_fields	101	{"sort":5,"interface":"files","special":["files"],"required":true,"collection":"footer","field":"payemnt_img"}	{"sort":5,"interface":"files","special":["files"],"required":true,"collection":"footer","field":"payemnt_img"}	\N	\N
430	480	directus_fields	102	{"sort":1,"hidden":true,"field":"id","collection":"footer_files"}	{"sort":1,"hidden":true,"field":"id","collection":"footer_files"}	\N	\N
431	481	directus_collections	footer_files	{"hidden":true,"icon":"import_export","collection":"footer_files"}	{"hidden":true,"icon":"import_export","collection":"footer_files"}	\N	\N
432	482	directus_fields	103	{"sort":2,"hidden":true,"collection":"footer_files","field":"footer_id"}	{"sort":2,"hidden":true,"collection":"footer_files","field":"footer_id"}	\N	\N
433	483	directus_fields	104	{"sort":3,"hidden":true,"collection":"footer_files","field":"directus_files_id"}	{"sort":3,"hidden":true,"collection":"footer_files","field":"directus_files_id"}	\N	\N
434	484	directus_fields	64	{"id":64,"collection":"footer","field":"id","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"footer","field":"id","sort":1,"group":null}	\N	\N
435	485	directus_fields	78	{"id":78,"collection":"footer","field":"category","special":["cast-json"],"interface":"list","options":{"fields":[{"field":"name","name":"name","type":"string","meta":{"field":"name","type":"string","interface":"input","options":{"placeholder":"Enter Category Name"},"required":true}},{"field":"options","name":"options","type":"json","meta":{"field":"options","type":"json","interface":"list","options":{"fields":[{"field":"name","name":"name","type":"string","meta":{"field":"name","type":"string","interface":"input","required":true,"options":{"placeholder":"Enter the name"}}},{"field":"slug","name":"slug","type":"string","meta":{"field":"slug","type":"string","interface":"input","options":{"placeholder":"Enter the slug"},"required":true}}]},"required":true}}]},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":2,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"footer","field":"category","sort":2,"group":null}	\N	\N
436	486	directus_fields	101	{"id":101,"collection":"footer","field":"payemnt_img","special":["files"],"interface":"files","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":3,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"footer","field":"payemnt_img","sort":3,"group":null}	\N	\N
437	487	directus_fields	83	{"id":83,"collection":"footer","field":"social_icons","special":["cast-json"],"interface":"list","options":{"fields":[{"field":"name","name":"name","type":"string","meta":{"field":"name","type":"string","interface":"input","required":true,"options":{"placeholder":"Enter the name"}}},{"field":"link","name":"link","type":"string","meta":{"field":"link","required":true,"type":"string","interface":"input","options":{"placeholder":"Enter the link"}}},{"field":"icon","name":"icon","type":"json","meta":{"field":"icon","type":"json","interface":"collection-item-dropdown","options":{"selectedCollection":"footer_social_icons","template":"{{image.title}}"},"width":"half","display":"labels","required":true}}]},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":4,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"footer","field":"social_icons","sort":4,"group":null}	\N	\N
438	488	directus_files	ad3bf48d-0a62-4391-ade8-59a7b3c86c0b	{"title":"Group (2)","filename_download":"Group (2).png","type":"image/png","storage":"local"}	{"title":"Group (2)","filename_download":"Group (2).png","type":"image/png","storage":"local"}	\N	\N
439	489	directus_files	562fdc17-cf8c-415c-827c-9977c84d8dba	{"title":"Paypal","filename_download":"Paypal.png","type":"image/png","storage":"local"}	{"title":"Paypal","filename_download":"Paypal.png","type":"image/png","storage":"local"}	\N	\N
440	490	directus_files	7bcea581-1f8a-4c05-9255-7b103587f32b	{"title":"Group (1)","filename_download":"Group (1).png","type":"image/png","storage":"local"}	{"title":"Group (1)","filename_download":"Group (1).png","type":"image/png","storage":"local"}	\N	\N
442	492	directus_files	8e8d0df1-c31d-4606-9c22-385b01a0f528	{"title":"Mastercard","filename_download":"Mastercard.png","type":"image/png","storage":"local"}	{"title":"Mastercard","filename_download":"Mastercard.png","type":"image/png","storage":"local"}	\N	\N
445	495	directus_files	943c1113-90ac-4030-9226-f50f4f7590f5	{"title":"Google Pay","filename_download":"GooglePay.png","type":"image/png","storage":"local"}	{"title":"Google Pay","filename_download":"GooglePay.png","type":"image/png","storage":"local"}	\N	\N
443	493	directus_files	9eb924c9-09eb-435a-bb4e-b3d9078573b0	{"title":"Group (3)","filename_download":"Group (3).png","type":"image/png","storage":"local"}	{"title":"Group (3)","filename_download":"Group (3).png","type":"image/png","storage":"local"}	\N	\N
444	494	directus_files	908752e2-dbdf-48d7-8d11-f0d2821d238e	{"title":"Group","filename_download":"Group.png","type":"image/png","storage":"local"}	{"title":"Group","filename_download":"Group.png","type":"image/png","storage":"local"}	\N	\N
446	496	footer_files	1	{"footer_id":1,"directus_files_id":{"id":"562fdc17-cf8c-415c-827c-9977c84d8dba"}}	{"footer_id":1,"directus_files_id":{"id":"562fdc17-cf8c-415c-827c-9977c84d8dba"}}	\N	\N
447	497	footer_files	2	{"footer_id":1,"directus_files_id":{"id":"c84e680e-64b7-4dfd-8113-265b3985feb2"}}	{"footer_id":1,"directus_files_id":{"id":"c84e680e-64b7-4dfd-8113-265b3985feb2"}}	\N	\N
448	498	footer_files	3	{"footer_id":1,"directus_files_id":{"id":"9eb924c9-09eb-435a-bb4e-b3d9078573b0"}}	{"footer_id":1,"directus_files_id":{"id":"9eb924c9-09eb-435a-bb4e-b3d9078573b0"}}	\N	\N
449	499	footer_files	4	{"footer_id":1,"directus_files_id":{"id":"ad3bf48d-0a62-4391-ade8-59a7b3c86c0b"}}	{"footer_id":1,"directus_files_id":{"id":"ad3bf48d-0a62-4391-ade8-59a7b3c86c0b"}}	\N	\N
450	500	footer_files	5	{"footer_id":1,"directus_files_id":{"id":"7bcea581-1f8a-4c05-9255-7b103587f32b"}}	{"footer_id":1,"directus_files_id":{"id":"7bcea581-1f8a-4c05-9255-7b103587f32b"}}	\N	\N
451	501	footer_files	6	{"footer_id":1,"directus_files_id":{"id":"8e8d0df1-c31d-4606-9c22-385b01a0f528"}}	{"footer_id":1,"directus_files_id":{"id":"8e8d0df1-c31d-4606-9c22-385b01a0f528"}}	\N	\N
452	502	footer_files	7	{"footer_id":1,"directus_files_id":{"id":"908752e2-dbdf-48d7-8d11-f0d2821d238e"}}	{"footer_id":1,"directus_files_id":{"id":"908752e2-dbdf-48d7-8d11-f0d2821d238e"}}	\N	\N
453	503	footer_files	8	{"footer_id":1,"directus_files_id":{"id":"943c1113-90ac-4030-9226-f50f4f7590f5"}}	{"footer_id":1,"directus_files_id":{"id":"943c1113-90ac-4030-9226-f50f4f7590f5"}}	\N	\N
454	505	directus_collections	footer_files	{"collection":"footer_files","icon":"import_export","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":null,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"hidden":false}	\N	\N
455	506	directus_collections	header	{"collection":"header","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":1,"group":"Modules","collapse":"open","preview_url":null,"versioning":false}	{"sort":1,"group":"Modules"}	\N	\N
456	507	directus_collections	footer	{"collection":"footer","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":true,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":2,"group":"Modules","collapse":"open","preview_url":null,"versioning":false}	{"sort":2,"group":"Modules"}	\N	\N
457	508	directus_collections	footer_files	{"collection":"footer_files","icon":"import_export","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":3,"group":"Modules","collapse":"open","preview_url":null,"versioning":false}	{"sort":3,"group":"Modules"}	\N	\N
458	509	directus_collections	footer_social_icons	{"collection":"footer_social_icons","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":4,"group":"Modules","collapse":"open","preview_url":null,"versioning":false}	{"sort":4,"group":"Modules"}	\N	\N
459	510	directus_collections	hero_section	{"collection":"hero_section","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":"sort","accountability":"all","color":null,"item_duplication_fields":null,"sort":1,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":1,"group":null}	\N	\N
460	511	directus_collections	feature_section	{"collection":"feature_section","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":2,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":2,"group":null}	\N	\N
461	512	directus_collections	Modules	{"collection":"Modules","icon":"view_module","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":"#3399FF","item_duplication_fields":null,"sort":3,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":3,"group":null}	\N	\N
462	513	directus_collections	footer_files	{"collection":"footer_files","icon":"import_export","note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":3,"group":"Modules","collapse":"open","preview_url":null,"versioning":false}	{"hidden":true}	\N	\N
463	514	directus_collections	hero_section	{"collection":"hero_section","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":"sort","accountability":"all","color":null,"item_duplication_fields":null,"sort":1,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":1,"group":null}	\N	\N
464	515	directus_collections	feature_section	{"collection":"feature_section","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":2,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":2,"group":null}	\N	\N
465	516	directus_collections	Modules	{"collection":"Modules","icon":"view_module","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":"#3399FF","item_duplication_fields":null,"sort":3,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":3,"group":null}	\N	\N
513	564	directus_files	aed535a2-2de3-4655-ba7a-53e87b7490ed	{"title":"Image 8","filename_download":"image 8.png","type":"image/png","storage":"local"}	{"title":"Image 8","filename_download":"image 8.png","type":"image/png","storage":"local"}	\N	\N
466	517	directus_collections	footer_files	{"collection":"footer_files","icon":"import_export","note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":4,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":4,"group":null}	\N	\N
467	518	directus_collections	header	{"collection":"header","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":1,"group":"Modules","collapse":"open","preview_url":null,"versioning":false}	{"sort":1,"group":"Modules"}	\N	\N
468	519	directus_collections	footer	{"collection":"footer","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":true,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":2,"group":"Modules","collapse":"open","preview_url":null,"versioning":false}	{"sort":2,"group":"Modules"}	\N	\N
469	520	directus_collections	footer_social_icons	{"collection":"footer_social_icons","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":3,"group":"Modules","collapse":"open","preview_url":null,"versioning":false}	{"sort":3,"group":"Modules"}	\N	\N
470	521	directus_collections	homepage	{"collection":"homepage","icon":"home_app_logo","note":null,"color":"#E35169","translations":null}	{"collection":"homepage","icon":"home_app_logo","note":null,"color":"#E35169","translations":null}	\N	\N
471	522	directus_collections	homepage	{"collection":"homepage","icon":"home_app_logo","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":"#E35169","item_duplication_fields":null,"sort":1,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":1,"group":null}	\N	\N
472	523	directus_collections	hero_section	{"collection":"hero_section","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":"sort","accountability":"all","color":null,"item_duplication_fields":null,"sort":2,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":2,"group":null}	\N	\N
473	524	directus_collections	feature_section	{"collection":"feature_section","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":3,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":3,"group":null}	\N	\N
474	525	directus_collections	Modules	{"collection":"Modules","icon":"view_module","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":"#3399FF","item_duplication_fields":null,"sort":4,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":4,"group":null}	\N	\N
475	526	directus_collections	footer_files	{"collection":"footer_files","icon":"import_export","note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":5,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":5,"group":null}	\N	\N
476	527	directus_collections	hero_section	{"collection":"hero_section","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":"sort","accountability":"all","color":null,"item_duplication_fields":null,"sort":1,"group":"homepage","collapse":"open","preview_url":null,"versioning":false}	{"sort":1,"group":"homepage"}	\N	\N
477	528	directus_collections	homepage	{"collection":"homepage","icon":"home_app_logo","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":"#E35169","item_duplication_fields":null,"sort":1,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":1,"group":null}	\N	\N
478	529	directus_collections	feature_section	{"collection":"feature_section","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":2,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":2,"group":null}	\N	\N
479	530	directus_collections	Modules	{"collection":"Modules","icon":"view_module","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":"#3399FF","item_duplication_fields":null,"sort":3,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":3,"group":null}	\N	\N
480	531	directus_collections	footer_files	{"collection":"footer_files","icon":"import_export","note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":4,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":4,"group":null}	\N	\N
481	532	directus_collections	homepage	{"collection":"homepage","icon":"home_app_logo","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":"#E35169","item_duplication_fields":null,"sort":1,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":1,"group":null}	\N	\N
630	694	directus_collections	accessories_accessories_type	{"hidden":true,"icon":"import_export","collection":"accessories_accessories_type"}	{"hidden":true,"icon":"import_export","collection":"accessories_accessories_type"}	\N	\N
482	533	directus_collections	feature_section	{"collection":"feature_section","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":1,"group":"hero_section","collapse":"open","preview_url":null,"versioning":false}	{"sort":1,"group":"hero_section"}	\N	\N
485	536	directus_collections	feature_section	{"collection":"feature_section","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":1,"group":"homepage","collapse":"open","preview_url":null,"versioning":false}	{"sort":1,"group":"homepage"}	\N	\N
486	537	directus_collections	hero_section	{"collection":"hero_section","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":"sort","accountability":"all","color":null,"item_duplication_fields":null,"sort":2,"group":"homepage","collapse":"open","preview_url":null,"versioning":false}	{"sort":2,"group":"homepage"}	\N	\N
487	538	directus_collections	hero_section	{"collection":"hero_section","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":"sort","accountability":"all","color":null,"item_duplication_fields":null,"sort":1,"group":"homepage","collapse":"open","preview_url":null,"versioning":false}	{"sort":1,"group":"homepage"}	\N	\N
488	539	directus_collections	feature_section	{"collection":"feature_section","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":2,"group":"homepage","collapse":"open","preview_url":null,"versioning":false}	{"sort":2,"group":"homepage"}	\N	\N
489	540	directus_collections	accessories_page	{"collection":"accessories_page","icon":"folder","note":null,"color":"#FFA439","translations":null}	{"collection":"accessories_page","icon":"folder","note":null,"color":"#FFA439","translations":null}	\N	\N
490	541	directus_collections	homepage	{"collection":"homepage","icon":"home_app_logo","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":"#E35169","item_duplication_fields":null,"sort":1,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":1,"group":null}	\N	\N
491	542	directus_collections	accessories_page	{"collection":"accessories_page","icon":"folder","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":"#FFA439","item_duplication_fields":null,"sort":2,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":2,"group":null}	\N	\N
492	543	directus_collections	Modules	{"collection":"Modules","icon":"view_module","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":"#3399FF","item_duplication_fields":null,"sort":3,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":3,"group":null}	\N	\N
493	544	directus_collections	footer_files	{"collection":"footer_files","icon":"import_export","note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":4,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":4,"group":null}	\N	\N
494	545	directus_fields	105	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"accessories"}	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"accessories"}	\N	\N
495	546	directus_collections	accessories	{"singleton":false,"collection":"accessories"}	{"singleton":false,"collection":"accessories"}	\N	\N
483	534	directus_collections	Modules	{"collection":"Modules","icon":"view_module","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":"#3399FF","item_duplication_fields":null,"sort":2,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":2,"group":null}	\N	\N
484	535	directus_collections	footer_files	{"collection":"footer_files","icon":"import_export","note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":3,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":3,"group":null}	\N	\N
496	547	directus_collections	accessories	{"collection":"accessories","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":1,"group":"accessories_page","collapse":"open","preview_url":null,"versioning":false}	{"sort":1,"group":"accessories_page"}	\N	\N
497	548	directus_collections	homepage	{"collection":"homepage","icon":"home_app_logo","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":"#E35169","item_duplication_fields":null,"sort":1,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":1,"group":null}	\N	\N
498	549	directus_collections	accessories_page	{"collection":"accessories_page","icon":"folder","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":"#FFA439","item_duplication_fields":null,"sort":2,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":2,"group":null}	\N	\N
499	550	directus_collections	Modules	{"collection":"Modules","icon":"view_module","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":"#3399FF","item_duplication_fields":null,"sort":3,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":3,"group":null}	\N	\N
500	551	directus_collections	footer_files	{"collection":"footer_files","icon":"import_export","note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":4,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":4,"group":null}	\N	\N
501	552	directus_fields	106	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"accessories_type"}	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"accessories_type"}	\N	\N
502	553	directus_collections	accessories_type	{"singleton":false,"collection":"accessories_type"}	{"singleton":false,"collection":"accessories_type"}	\N	\N
503	554	directus_fields	107	{"sort":2,"interface":"file-image","special":["file"],"required":true,"collection":"accessories_type","field":"image"}	{"sort":2,"interface":"file-image","special":["file"],"required":true,"collection":"accessories_type","field":"image"}	\N	\N
504	555	directus_fields	108	{"sort":3,"interface":"select-dropdown","special":null,"required":true,"options":{"choices":[{"text":"Item","value":"item"}]},"collection":"accessories_type","field":"type"}	{"sort":3,"interface":"select-dropdown","special":null,"required":true,"options":{"choices":[{"text":"Item","value":"item"}]},"collection":"accessories_type","field":"type"}	\N	\N
505	556	directus_fields	108	{"id":108,"collection":"accessories_type","field":"type","special":null,"interface":"select-dropdown","options":{"choices":[{"text":"All","value":"all"},{"text":"Torches","value":"torches"},{"text":"Machine Accessories","value":"machine-accessories"}]},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":3,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"accessories_type","field":"type","options":{"choices":[{"text":"All","value":"all"},{"text":"Torches","value":"torches"},{"text":"Machine Accessories","value":"machine-accessories"}]}}	\N	\N
506	557	directus_fields	109	{"sort":2,"interface":"list","special":["cast-json"],"options":{"fields":[{"field":"type","name":"type","type":"json","meta":{"field":"type","type":"json","interface":"collection-item-dropdown","options":{"selectedCollection":"accessories_type"}}}]},"collection":"accessories","field":"type"}	{"sort":2,"interface":"list","special":["cast-json"],"options":{"fields":[{"field":"type","name":"type","type":"json","meta":{"field":"type","type":"json","interface":"collection-item-dropdown","options":{"selectedCollection":"accessories_type"}}}]},"collection":"accessories","field":"type"}	\N	\N
507	558	directus_fields	110	{"sort":2,"interface":"list","special":["cast-json"],"options":{"fields":[{"field":"type","name":"type","type":"json","meta":{"field":"type","type":"json","interface":"collection-item-dropdown","options":{"selectedCollection":"accessories_type"}}}]},"collection":"accessories","field":"choose_type"}	{"sort":2,"interface":"list","special":["cast-json"],"options":{"fields":[{"field":"type","name":"type","type":"json","meta":{"field":"type","type":"json","interface":"collection-item-dropdown","options":{"selectedCollection":"accessories_type"}}}]},"collection":"accessories","field":"choose_type"}	\N	\N
508	559	directus_files	22283f06-1f1a-4f0d-9c0e-f1a7ad95bcec	{"title":"Image 9","filename_download":"image 9.png","type":"image/png","storage":"local"}	{"title":"Image 9","filename_download":"image 9.png","type":"image/png","storage":"local"}	\N	\N
510	561	directus_files	fa1a83fd-0a8c-45f4-b169-2f139c788e0f	{"title":"Overlay","filename_download":"Overlay.png","type":"image/png","storage":"local"}	{"title":"Overlay","filename_download":"Overlay.png","type":"image/png","storage":"local"}	\N	\N
677	747	accessories_type	1	{"id":1,"type":"Alls","image":"405c8b4c-933f-42cd-9121-8f31eb516a87"}	{"type":"Alls"}	\N	\N
515	566	directus_files	34a7daba-9659-41bf-b36c-26e86fd8c3f8	{"title":"Image 8","filename_download":"image 8.png","type":"image/png","storage":"local"}	{"title":"Image 8","filename_download":"image 8.png","type":"image/png","storage":"local"}	\N	\N
517	568	directus_files	6cc6c198-8876-440b-92d5-76277f9016a6	{"title":"Image 8","filename_download":"image 8.png","type":"image/png","storage":"local"}	{"title":"Image 8","filename_download":"image 8.png","type":"image/png","storage":"local"}	\N	\N
519	570	directus_fields	107	{"id":107,"collection":"accessories_type","field":"image","special":["file"],"interface":"file-image","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":2,"width":"half","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"accessories_type","field":"image","width":"half"}	\N	\N
521	572	directus_fields	108	{"id":108,"collection":"accessories_type","field":"type","special":null,"interface":"input","options":{"choices":[{"text":"All","value":"all"},{"text":"Torches","value":"torches"},{"text":"Machine Accessories","value":"machine-accessories"}],"placeholder":"Enter the Input"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":3,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"accessories_type","field":"type","interface":"input","options":{"choices":[{"text":"All","value":"all"},{"text":"Torches","value":"torches"},{"text":"Machine Accessories","value":"machine-accessories"}],"placeholder":"Enter the Input"}}	\N	\N
522	573	directus_files	9b9bc378-8916-4735-9f05-16c51f9ce165	{"title":"Image 8","filename_download":"image 8.png","type":"image/png","storage":"local"}	{"title":"Image 8","filename_download":"image 8.png","type":"image/png","storage":"local"}	\N	\N
525	582	directus_fields	111	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"accessories"}	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"accessories"}	\N	\N
526	583	directus_collections	accessories	{"singleton":false,"collection":"accessories"}	{"singleton":false,"collection":"accessories"}	\N	\N
527	584	directus_fields	112	{"sort":2,"interface":"select-dropdown","special":null,"options":{"choices":[{"text":"Torches","value":"torches"},{"text":"Machine Accessories","value":"machine accessories"}]},"required":true,"collection":"accessories","field":"type"}	{"sort":2,"interface":"select-dropdown","special":null,"options":{"choices":[{"text":"Torches","value":"torches"},{"text":"Machine Accessories","value":"machine accessories"}]},"required":true,"collection":"accessories","field":"type"}	\N	\N
528	585	directus_fields	113	{"sort":3,"interface":"file-image","special":["file"],"required":true,"collection":"accessories","field":"image"}	{"sort":3,"interface":"file-image","special":["file"],"required":true,"collection":"accessories","field":"image"}	\N	\N
529	586	directus_fields	114	{"sort":4,"interface":"input","special":null,"options":{"placeholder":"Enter the heading"},"collection":"accessories","field":"heading"}	{"sort":4,"interface":"input","special":null,"options":{"placeholder":"Enter the heading"},"collection":"accessories","field":"heading"}	\N	\N
530	587	directus_fields	114	{"id":114,"collection":"accessories","field":"heading","special":null,"interface":"input","options":{"placeholder":"Enter the heading"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":4,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"accessories","field":"heading","required":true}	\N	\N
531	588	directus_fields	115	{"sort":5,"interface":"input","special":null,"required":true,"options":{"placeholder":"Enter the subheading"},"collection":"accessories","field":"sub_heading"}	{"sort":5,"interface":"input","special":null,"required":true,"options":{"placeholder":"Enter the subheading"},"collection":"accessories","field":"sub_heading"}	\N	\N
532	589	directus_fields	116	{"sort":6,"interface":"input","special":null,"options":{"placeholder":"Enter the price"},"collection":"accessories","field":"price"}	{"sort":6,"interface":"input","special":null,"options":{"placeholder":"Enter the price"},"collection":"accessories","field":"price"}	\N	\N
533	590	directus_fields	116	{"id":116,"collection":"accessories","field":"price","special":null,"interface":"input","options":{"placeholder":"Enter the price"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":6,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"accessories","field":"price","required":true}	\N	\N
534	591	directus_files	7bcf9cf4-3a7d-4c24-b4ab-b183e746d268	{"title":"Image 8","filename_download":"image 8.png","type":"image/png","storage":"local"}	{"title":"Image 8","filename_download":"image 8.png","type":"image/png","storage":"local"}	\N	\N
535	592	accessories	1	{"type":"torches","image":"7bcf9cf4-3a7d-4c24-b4ab-b183e746d268","heading":"36 mig torch","sub_heading":"Velit velit amet lacus a sem felis. Blandit hendrerit imperdiet turpis purus","price":1999}	{"type":"torches","image":"7bcf9cf4-3a7d-4c24-b4ab-b183e746d268","heading":"36 mig torch","sub_heading":"Velit velit amet lacus a sem felis. Blandit hendrerit imperdiet turpis purus","price":1999}	\N	\N
536	593	directus_fields	113	{"id":113,"collection":"accessories","field":"image","special":["file"],"interface":"file-image","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":3,"width":"half","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"accessories","field":"image","width":"half"}	\N	\N
537	594	directus_files	eb053b63-b683-4b9a-9f23-dde825593f61	{"title":"Image 8","filename_download":"image 8.png","type":"image/png","storage":"local"}	{"title":"Image 8","filename_download":"image 8.png","type":"image/png","storage":"local"}	\N	\N
538	595	accessories	2	{"type":"torches","image":"eb053b63-b683-4b9a-9f23-dde825593f61","heading":"36 WC MIG Torch","sub_heading":"Velit velit amet lacus a sem felis. Blandit hendrerit imperdiet turpis purus","price":1999}	{"type":"torches","image":"eb053b63-b683-4b9a-9f23-dde825593f61","heading":"36 WC MIG Torch","sub_heading":"Velit velit amet lacus a sem felis. Blandit hendrerit imperdiet turpis purus","price":1999}	\N	\N
539	596	directus_files	f960f2fc-4dc0-4743-b27d-5097f52f7d5b	{"title":"Image 8","filename_download":"image 8.png","type":"image/png","storage":"local"}	{"title":"Image 8","filename_download":"image 8.png","type":"image/png","storage":"local"}	\N	\N
540	597	accessories	3	{"type":"torches","image":"f960f2fc-4dc0-4743-b27d-5097f52f7d5b","heading":"26 TIG Torch","sub_heading":"Velit velit amet lacus a sem felis. Blandit hendrerit imperdiet turpis purus","price":1999}	{"type":"torches","image":"f960f2fc-4dc0-4743-b27d-5097f52f7d5b","heading":"26 TIG Torch","sub_heading":"Velit velit amet lacus a sem felis. Blandit hendrerit imperdiet turpis purus","price":1999}	\N	\N
541	598	directus_files	e422f5ed-6233-4bd6-adf6-b8033cf452d1	{"title":"Image 8","filename_download":"image 8.png","type":"image/png","storage":"local"}	{"title":"Image 8","filename_download":"image 8.png","type":"image/png","storage":"local"}	\N	\N
563	620	directus_files	349ac9f4-b421-43d5-8262-821534505d09	{"title":"Image 8","filename_download":"image 8.png","type":"image/png","storage":"local"}	{"title":"Image 8","filename_download":"image 8.png","type":"image/png","storage":"local"}	\N	\N
542	599	accessories	4	{"type":"machine accessories","sub_heading":"Velit velit amet lacus a sem felis. Blandit hendrerit imperdiet turpis purus","price":1999,"heading":"machine","image":"e422f5ed-6233-4bd6-adf6-b8033cf452d1"}	{"type":"machine accessories","sub_heading":"Velit velit amet lacus a sem felis. Blandit hendrerit imperdiet turpis purus","price":1999,"heading":"machine","image":"e422f5ed-6233-4bd6-adf6-b8033cf452d1"}	\N	\N
543	600	directus_collections	accessories	{"collection":"accessories","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":1,"group":"accessories_page","collapse":"open","preview_url":null,"versioning":false}	{"sort":1,"group":"accessories_page"}	\N	\N
544	601	directus_collections	homepage	{"collection":"homepage","icon":"home_app_logo","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":"#E35169","item_duplication_fields":null,"sort":1,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":1,"group":null}	\N	\N
545	602	directus_collections	accessories_page	{"collection":"accessories_page","icon":"folder","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":"#FFA439","item_duplication_fields":null,"sort":2,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":2,"group":null}	\N	\N
546	603	directus_collections	Modules	{"collection":"Modules","icon":"view_module","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":"#3399FF","item_duplication_fields":null,"sort":3,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":3,"group":null}	\N	\N
547	604	directus_collections	footer_files	{"collection":"footer_files","icon":"import_export","note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":4,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":4,"group":null}	\N	\N
548	605	directus_fields	117	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"accessories_type"}	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"accessories_type"}	\N	\N
549	606	directus_collections	accessories_type	{"singleton":false,"collection":"accessories_type"}	{"singleton":false,"collection":"accessories_type"}	\N	\N
550	607	directus_fields	118	{"sort":2,"interface":"input","special":null,"options":{"placeholder":"Enter the type"},"required":true,"collection":"accessories_type","field":"type"}	{"sort":2,"interface":"input","special":null,"options":{"placeholder":"Enter the type"},"required":true,"collection":"accessories_type","field":"type"}	\N	\N
551	608	directus_fields	119	{"sort":3,"interface":"file-image","special":["file"],"required":true,"collection":"accessories_type","field":"image"}	{"sort":3,"interface":"file-image","special":["file"],"required":true,"collection":"accessories_type","field":"image"}	\N	\N
552	609	directus_fields	119	{"id":119,"collection":"accessories_type","field":"image","special":["file"],"interface":"file-image","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":3,"width":"half","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"accessories_type","field":"image","width":"half"}	\N	\N
553	610	directus_fields	117	{"id":117,"collection":"accessories_type","field":"id","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"accessories_type","field":"id","sort":1,"group":null}	\N	\N
554	611	directus_fields	119	{"id":119,"collection":"accessories_type","field":"image","special":["file"],"interface":"file-image","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":2,"width":"half","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"accessories_type","field":"image","sort":2,"group":null}	\N	\N
555	612	directus_fields	118	{"id":118,"collection":"accessories_type","field":"type","special":null,"interface":"input","options":{"placeholder":"Enter the type"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":3,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"accessories_type","field":"type","sort":3,"group":null}	\N	\N
556	613	directus_collections	accessories_type	{"collection":"accessories_type","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":1,"group":"accessories","collapse":"open","preview_url":null,"versioning":false}	{"sort":1,"group":"accessories"}	\N	\N
557	614	directus_collections	homepage	{"collection":"homepage","icon":"home_app_logo","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":"#E35169","item_duplication_fields":null,"sort":1,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":1,"group":null}	\N	\N
558	615	directus_collections	accessories_page	{"collection":"accessories_page","icon":"folder","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":"#FFA439","item_duplication_fields":null,"sort":2,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":2,"group":null}	\N	\N
559	616	directus_collections	Modules	{"collection":"Modules","icon":"view_module","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":"#3399FF","item_duplication_fields":null,"sort":3,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":3,"group":null}	\N	\N
598	658	footer_files	7	{"id":7,"footer_id":null,"directus_files_id":"908752e2-dbdf-48d7-8d11-f0d2821d238e"}	{"footer_id":null}	\N	\N
560	617	directus_collections	footer_files	{"collection":"footer_files","icon":"import_export","note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":4,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":4,"group":null}	\N	\N
561	618	directus_collections	accessories_type	{"collection":"accessories_type","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":1,"group":"accessories_page","collapse":"open","preview_url":null,"versioning":false}	{"sort":1,"group":"accessories_page"}	\N	\N
562	619	directus_collections	accessories	{"collection":"accessories","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":2,"group":"accessories_page","collapse":"open","preview_url":null,"versioning":false}	{"sort":2,"group":"accessories_page"}	\N	\N
565	622	directus_files	15caa33e-9426-4f84-abe6-a8cc3fe84d67	{"title":"Image 8","filename_download":"image 8.png","type":"image/png","storage":"local"}	{"title":"Image 8","filename_download":"image 8.png","type":"image/png","storage":"local"}	\N	\N
567	624	directus_fields	120	{"sort":7,"interface":"list","special":["cast-json"],"options":{"choices":null,"fields":[{"field":"type","name":"type","type":"json","meta":{"field":"type","type":"json","interface":"collection-item-dropdown","options":{"selectedCollection":"accessories_type"}}}]},"collection":"accessories","field":"type"}	{"sort":7,"interface":"list","special":["cast-json"],"options":{"choices":null,"fields":[{"field":"type","name":"type","type":"json","meta":{"field":"type","type":"json","interface":"collection-item-dropdown","options":{"selectedCollection":"accessories_type"}}}]},"collection":"accessories","field":"type"}	\N	\N
568	625	accessories	1	{"id":1,"image":"7bcf9cf4-3a7d-4c24-b4ab-b183e746d268","heading":"36 mig torch","sub_heading":"Velit velit amet lacus a sem felis. Blandit hendrerit imperdiet turpis purus","price":1999,"type":[{"type":{"key":1,"collection":"accessories_type"}}]}	{"type":[{"type":{"key":1,"collection":"accessories_type"}}]}	\N	\N
569	626	directus_fields	111	{"id":111,"collection":"accessories","field":"id","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"accessories","field":"id","sort":1,"group":null}	\N	\N
570	627	directus_fields	120	{"id":120,"collection":"accessories","field":"type","special":["cast-json"],"interface":"list","options":{"choices":null,"fields":[{"field":"type","name":"type","type":"json","meta":{"field":"type","type":"json","interface":"collection-item-dropdown","options":{"selectedCollection":"accessories_type"}}}]},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":2,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"accessories","field":"type","sort":2,"group":null}	\N	\N
571	628	directus_fields	113	{"id":113,"collection":"accessories","field":"image","special":["file"],"interface":"file-image","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":3,"width":"half","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"accessories","field":"image","sort":3,"group":null}	\N	\N
572	629	directus_fields	114	{"id":114,"collection":"accessories","field":"heading","special":null,"interface":"input","options":{"placeholder":"Enter the heading"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":4,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"accessories","field":"heading","sort":4,"group":null}	\N	\N
573	630	directus_fields	115	{"id":115,"collection":"accessories","field":"sub_heading","special":null,"interface":"input","options":{"placeholder":"Enter the subheading"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":5,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"accessories","field":"sub_heading","sort":5,"group":null}	\N	\N
574	631	directus_fields	116	{"id":116,"collection":"accessories","field":"price","special":null,"interface":"input","options":{"placeholder":"Enter the price"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":6,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"accessories","field":"price","sort":6,"group":null}	\N	\N
575	632	directus_fields	121	{"sort":7,"interface":"select-dropdown-m2o","special":["m2o"],"options":{"template":"{{type}}"},"collection":"accessories","field":"type"}	{"sort":7,"interface":"select-dropdown-m2o","special":["m2o"],"options":{"template":"{{type}}"},"collection":"accessories","field":"type"}	\N	\N
576	633	accessories	1	{"id":1,"image":"7bcf9cf4-3a7d-4c24-b4ab-b183e746d268","heading":"36 mig torch","sub_heading":"Velit velit amet lacus a sem felis. Blandit hendrerit imperdiet turpis purus","price":1999,"type":1}	{"type":1}	\N	\N
577	634	directus_fields	121	{"id":121,"collection":"accessories","field":"type","special":["m2o"],"interface":"select-dropdown-m2o","options":{"template":"{{type}}"},"display":"related-values","display_options":{"template":"{{type}}"},"readonly":false,"hidden":false,"sort":7,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"accessories","field":"type","display":"related-values","display_options":{"template":"{{type}}"}}	\N	\N
578	635	accessories	2	{"id":2,"image":"eb053b63-b683-4b9a-9f23-dde825593f61","heading":"36 WC MIG Torch","sub_heading":"Velit velit amet lacus a sem felis. Blandit hendrerit imperdiet turpis purus","price":1999,"type":1}	{"type":1}	\N	\N
579	636	accessories	3	{"id":3,"image":"f960f2fc-4dc0-4743-b27d-5097f52f7d5b","heading":"26 TIG Torch","sub_heading":"Velit velit amet lacus a sem felis. Blandit hendrerit imperdiet turpis purus","price":1999,"type":2}	{"type":2}	\N	\N
580	637	accessories	4	{"id":4,"image":"e422f5ed-6233-4bd6-adf6-b8033cf452d1","heading":"machine","sub_heading":"Velit velit amet lacus a sem felis. Blandit hendrerit imperdiet turpis purus","price":1999,"type":2}	{"type":2}	\N	\N
582	639	directus_permissions	10	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"accessories","action":"read"}	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"accessories","action":"read"}	\N	\N
583	640	directus_permissions	11	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"accessories_type","action":"read"}	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"accessories_type","action":"read"}	\N	\N
584	642	directus_access	707ad5f5-982e-4459-a955-f16c1fdcfe22	{"id":"707ad5f5-982e-4459-a955-f16c1fdcfe22","role":null,"user":null,"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","sort":1}	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","sort":1}	\N	\N
585	643	directus_permissions	12	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"footer_files","action":"read"}	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"footer_files","action":"read"}	\N	\N
586	645	directus_files	562fdc17-cf8c-415c-827c-9977c84d8dba	{"id":"562fdc17-cf8c-415c-827c-9977c84d8dba","storage":"local","filename_disk":"562fdc17-cf8c-415c-827c-9977c84d8dba.png","filename_download":"GooglePay (2).png","title":"Paypal","type":"image/png","folder":null,"uploaded_by":"10c73097-e1f9-4f52-9007-ac783d8d74e9","created_on":"2025-01-08T19:00:42.606Z","modified_by":"10c73097-e1f9-4f52-9007-ac783d8d74e9","modified_on":"2025-01-09T09:33:37.438Z","charset":null,"filesize":"810","width":30,"height":20,"duration":null,"embed":null,"description":null,"location":null,"tags":null,"metadata":{},"focal_point_x":null,"focal_point_y":null,"tus_id":null,"tus_data":null,"uploaded_on":"2025-01-08T19:00:43.128Z"}	{"storage":"local","filename_disk":"562fdc17-cf8c-415c-827c-9977c84d8dba.png","filename_download":"GooglePay (2).png","title":"Paypal","type":"image/png","folder":null,"description":null,"metadata":{},"modified_by":"10c73097-e1f9-4f52-9007-ac783d8d74e9","modified_on":"2025-01-09T09:33:37.438Z"}	\N	\N
587	646	directus_files	562fdc17-cf8c-415c-827c-9977c84d8dba	{"id":"562fdc17-cf8c-415c-827c-9977c84d8dba","storage":"local","filename_disk":"562fdc17-cf8c-415c-827c-9977c84d8dba.png","filename_download":"GooglePay (2).png","title":"Paypal","type":"image/png","folder":null,"uploaded_by":"10c73097-e1f9-4f52-9007-ac783d8d74e9","created_on":"2025-01-08T19:00:42.606Z","modified_by":"10c73097-e1f9-4f52-9007-ac783d8d74e9","modified_on":"2025-01-09T09:33:37.600Z","charset":null,"filesize":"3485","width":145,"height":100,"duration":null,"embed":null,"description":null,"location":null,"tags":null,"metadata":{},"focal_point_x":null,"focal_point_y":null,"tus_id":null,"tus_data":null,"uploaded_on":"2025-01-09T09:33:37.585Z"}	{"modified_by":"10c73097-e1f9-4f52-9007-ac783d8d74e9","modified_on":"2025-01-09T09:33:37.600Z"}	\N	\N
588	647	directus_files	c84e680e-64b7-4dfd-8113-265b3985feb2	{"id":"c84e680e-64b7-4dfd-8113-265b3985feb2","storage":"local","filename_disk":"c84e680e-64b7-4dfd-8113-265b3985feb2.png","filename_download":"🦆 icon _Visa_.png","title":"Apple Pay","type":"image/png","folder":null,"uploaded_by":"10c73097-e1f9-4f52-9007-ac783d8d74e9","created_on":"2025-01-08T19:00:42.660Z","modified_by":"10c73097-e1f9-4f52-9007-ac783d8d74e9","modified_on":"2025-01-09T09:33:54.588Z","charset":null,"filesize":"552","width":30,"height":20,"duration":null,"embed":null,"description":null,"location":null,"tags":null,"metadata":{},"focal_point_x":null,"focal_point_y":null,"tus_id":null,"tus_data":null,"uploaded_on":"2025-01-08T19:00:43.143Z"}	{"storage":"local","filename_disk":"c84e680e-64b7-4dfd-8113-265b3985feb2.png","filename_download":"🦆 icon _Visa_.png","title":"Apple Pay","type":"image/png","folder":null,"description":null,"metadata":{},"modified_by":"10c73097-e1f9-4f52-9007-ac783d8d74e9","modified_on":"2025-01-09T09:33:54.588Z"}	\N	\N
589	648	directus_files	c84e680e-64b7-4dfd-8113-265b3985feb2	{"id":"c84e680e-64b7-4dfd-8113-265b3985feb2","storage":"local","filename_disk":"c84e680e-64b7-4dfd-8113-265b3985feb2.png","filename_download":"🦆 icon _Visa_.png","title":"Apple Pay","type":"image/png","folder":null,"uploaded_by":"10c73097-e1f9-4f52-9007-ac783d8d74e9","created_on":"2025-01-08T19:00:42.660Z","modified_by":"10c73097-e1f9-4f52-9007-ac783d8d74e9","modified_on":"2025-01-09T09:33:54.681Z","charset":null,"filesize":"2229","width":155,"height":100,"duration":null,"embed":null,"description":null,"location":null,"tags":null,"metadata":{},"focal_point_x":null,"focal_point_y":null,"tus_id":null,"tus_data":null,"uploaded_on":"2025-01-09T09:33:54.657Z"}	{"modified_by":"10c73097-e1f9-4f52-9007-ac783d8d74e9","modified_on":"2025-01-09T09:33:54.681Z"}	\N	\N
591	650	footer_files	1	{"id":1,"footer_id":1,"directus_files_id":"562fdc17-cf8c-415c-827c-9977c84d8dba"}	{"footer_id":1,"directus_files_id":"562fdc17-cf8c-415c-827c-9977c84d8dba"}	\N	\N
590	649	directus_files	562fdc17-cf8c-415c-827c-9977c84d8dba	{"id":"562fdc17-cf8c-415c-827c-9977c84d8dba","storage":"local","filename_disk":"562fdc17-cf8c-415c-827c-9977c84d8dba.png","filename_download":"GooglePay (2).png","title":"g-pay","type":"image/png","folder":null,"uploaded_by":"10c73097-e1f9-4f52-9007-ac783d8d74e9","created_on":"2025-01-08T19:00:42.606Z","modified_by":"10c73097-e1f9-4f52-9007-ac783d8d74e9","modified_on":"2025-01-09T09:36:33.054Z","charset":null,"filesize":"3485","width":145,"height":100,"duration":null,"embed":null,"description":null,"location":null,"tags":null,"metadata":{},"focal_point_x":null,"focal_point_y":null,"tus_id":null,"tus_data":null,"uploaded_on":"2025-01-09T09:33:37.585Z"}	{"title":"g-pay","modified_by":"10c73097-e1f9-4f52-9007-ac783d8d74e9","modified_on":"2025-01-09T09:36:33.054Z"}	591	\N
592	652	footer_files	1	{"id":1,"footer_id":null,"directus_files_id":"562fdc17-cf8c-415c-827c-9977c84d8dba"}	{"footer_id":null}	\N	\N
593	653	footer_files	2	{"id":2,"footer_id":null,"directus_files_id":"c84e680e-64b7-4dfd-8113-265b3985feb2"}	{"footer_id":null}	\N	\N
594	654	footer_files	3	{"id":3,"footer_id":null,"directus_files_id":"9eb924c9-09eb-435a-bb4e-b3d9078573b0"}	{"footer_id":null}	\N	\N
595	655	footer_files	4	{"id":4,"footer_id":null,"directus_files_id":"ad3bf48d-0a62-4391-ade8-59a7b3c86c0b"}	{"footer_id":null}	\N	\N
596	656	footer_files	5	{"id":5,"footer_id":null,"directus_files_id":"7bcea581-1f8a-4c05-9255-7b103587f32b"}	{"footer_id":null}	\N	\N
597	657	footer_files	6	{"id":6,"footer_id":null,"directus_files_id":"8e8d0df1-c31d-4606-9c22-385b01a0f528"}	{"footer_id":null}	\N	\N
600	661	directus_files	26676457-a204-4b32-b2c5-0c56f5ff6aa8	{"title":"🦆 Icon  Visa  (1)","filename_download":"🦆 icon _Visa_ (1).png","type":"image/png","storage":"local"}	{"title":"🦆 Icon  Visa  (1)","filename_download":"🦆 icon _Visa_ (1).png","type":"image/png","storage":"local"}	\N	\N
602	663	directus_files	7cc48476-1d9f-4a50-a628-e44448e4d0a7	{"title":"Apple Pay (1)","filename_download":"ApplePay (1).png","type":"image/png","storage":"local"}	{"title":"Apple Pay (1)","filename_download":"ApplePay (1).png","type":"image/png","storage":"local"}	\N	\N
604	665	directus_files	32991033-7c21-48e3-b17a-116f1f124dbc	{"title":"Paypal (1)","filename_download":"Paypal (1).png","type":"image/png","storage":"local"}	{"title":"Paypal (1)","filename_download":"Paypal (1).png","type":"image/png","storage":"local"}	\N	\N
601	662	directus_files	e3bf3998-03f2-4e7f-b165-5bc99f640e78	{"title":"🦆 Icon  Amex ","filename_download":"🦆 icon _amex_.png","type":"image/png","storage":"local"}	{"title":"🦆 Icon  Amex ","filename_download":"🦆 icon _amex_.png","type":"image/png","storage":"local"}	\N	\N
603	664	directus_files	186c34a8-1848-48c0-b470-363eec7099d4	{"title":"🦆 Icon  Discover ","filename_download":"🦆 icon _discover_.png","type":"image/png","storage":"local"}	{"title":"🦆 Icon  Discover ","filename_download":"🦆 icon _discover_.png","type":"image/png","storage":"local"}	\N	\N
605	666	directus_files	e6d19d80-da1a-4176-9d4e-13d0dc4501c7	{"title":"Mastercard","filename_download":"Mastercard.png","type":"image/png","storage":"local"}	{"title":"Mastercard","filename_download":"Mastercard.png","type":"image/png","storage":"local"}	\N	\N
606	667	directus_files	ffa48906-4187-495e-8cb8-d4e3da720d8e	{"title":"🦆 Icon  Visa ","filename_download":"🦆 icon _Visa_.png","type":"image/png","storage":"local"}	{"title":"🦆 Icon  Visa ","filename_download":"🦆 icon _Visa_.png","type":"image/png","storage":"local"}	\N	\N
607	668	directus_files	023d05b1-81b5-45e6-9e30-83713d86f370	{"title":"Google Pay (2)","filename_download":"GooglePay (2).png","type":"image/png","storage":"local"}	{"title":"Google Pay (2)","filename_download":"GooglePay (2).png","type":"image/png","storage":"local"}	\N	\N
608	669	footer_files	9	{"footer_id":1,"directus_files_id":{"id":"e6d19d80-da1a-4176-9d4e-13d0dc4501c7"}}	{"footer_id":1,"directus_files_id":{"id":"e6d19d80-da1a-4176-9d4e-13d0dc4501c7"}}	\N	\N
609	670	footer_files	10	{"footer_id":1,"directus_files_id":{"id":"32991033-7c21-48e3-b17a-116f1f124dbc"}}	{"footer_id":1,"directus_files_id":{"id":"32991033-7c21-48e3-b17a-116f1f124dbc"}}	\N	\N
610	671	footer_files	11	{"footer_id":1,"directus_files_id":{"id":"7cc48476-1d9f-4a50-a628-e44448e4d0a7"}}	{"footer_id":1,"directus_files_id":{"id":"7cc48476-1d9f-4a50-a628-e44448e4d0a7"}}	\N	\N
611	672	footer_files	12	{"footer_id":1,"directus_files_id":{"id":"186c34a8-1848-48c0-b470-363eec7099d4"}}	{"footer_id":1,"directus_files_id":{"id":"186c34a8-1848-48c0-b470-363eec7099d4"}}	\N	\N
612	673	footer_files	13	{"footer_id":1,"directus_files_id":{"id":"e3bf3998-03f2-4e7f-b165-5bc99f640e78"}}	{"footer_id":1,"directus_files_id":{"id":"e3bf3998-03f2-4e7f-b165-5bc99f640e78"}}	\N	\N
613	674	footer_files	14	{"footer_id":1,"directus_files_id":{"id":"26676457-a204-4b32-b2c5-0c56f5ff6aa8"}}	{"footer_id":1,"directus_files_id":{"id":"26676457-a204-4b32-b2c5-0c56f5ff6aa8"}}	\N	\N
614	675	footer_files	15	{"footer_id":1,"directus_files_id":{"id":"ffa48906-4187-495e-8cb8-d4e3da720d8e"}}	{"footer_id":1,"directus_files_id":{"id":"ffa48906-4187-495e-8cb8-d4e3da720d8e"}}	\N	\N
615	676	footer_files	16	{"footer_id":1,"directus_files_id":{"id":"023d05b1-81b5-45e6-9e30-83713d86f370"}}	{"footer_id":1,"directus_files_id":{"id":"023d05b1-81b5-45e6-9e30-83713d86f370"}}	\N	\N
616	678	directus_files	e1d9a978-7d06-4146-9e8c-0e7a845fc8d9	{"title":"Image 8","filename_download":"image 8.png","type":"image/png","storage":"local"}	{"title":"Image 8","filename_download":"image 8.png","type":"image/png","storage":"local"}	\N	\N
618	680	directus_files	0e06fc89-79a6-40f0-86d4-437e53413133	{"title":"Image 8","filename_download":"image 8.png","type":"image/png","storage":"local"}	{"title":"Image 8","filename_download":"image 8.png","type":"image/png","storage":"local"}	\N	\N
620	683	directus_files	b7f75a5b-74e2-4c4d-aab8-a8c025b55dee	{"title":"Image 8","filename_download":"image 8.png","type":"image/png","storage":"local"}	{"title":"Image 8","filename_download":"image 8.png","type":"image/png","storage":"local"}	\N	\N
622	686	directus_fields	111	{"id":111,"collection":"accessories","field":"id","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"accessories","field":"id","sort":1,"group":null}	\N	\N
623	687	directus_fields	121	{"id":121,"collection":"accessories","field":"type","special":["m2o"],"interface":"select-dropdown-m2o","options":{"template":"{{type}}"},"display":"related-values","display_options":{"template":"{{type}}"},"readonly":false,"hidden":false,"sort":2,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"accessories","field":"type","sort":2,"group":null}	\N	\N
624	688	directus_fields	113	{"id":113,"collection":"accessories","field":"image","special":["file"],"interface":"file-image","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":3,"width":"half","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"accessories","field":"image","sort":3,"group":null}	\N	\N
625	689	directus_fields	114	{"id":114,"collection":"accessories","field":"heading","special":null,"interface":"input","options":{"placeholder":"Enter the heading"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":4,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"accessories","field":"heading","sort":4,"group":null}	\N	\N
626	690	directus_fields	115	{"id":115,"collection":"accessories","field":"sub_heading","special":null,"interface":"input","options":{"placeholder":"Enter the subheading"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":5,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"accessories","field":"sub_heading","sort":5,"group":null}	\N	\N
627	691	directus_fields	116	{"id":116,"collection":"accessories","field":"price","special":null,"interface":"input","options":{"placeholder":"Enter the price"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":6,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"accessories","field":"price","sort":6,"group":null}	\N	\N
628	692	directus_fields	122	{"sort":7,"interface":"list-m2m","special":["m2m"],"collection":"accessories","field":"test"}	{"sort":7,"interface":"list-m2m","special":["m2m"],"collection":"accessories","field":"test"}	\N	\N
629	693	directus_fields	123	{"sort":1,"hidden":true,"field":"id","collection":"accessories_accessories_type"}	{"sort":1,"hidden":true,"field":"id","collection":"accessories_accessories_type"}	\N	\N
631	695	directus_fields	124	{"sort":2,"hidden":true,"collection":"accessories_accessories_type","field":"accessories_id"}	{"sort":2,"hidden":true,"collection":"accessories_accessories_type","field":"accessories_id"}	\N	\N
632	696	directus_fields	125	{"sort":3,"hidden":true,"collection":"accessories_accessories_type","field":"accessories_type_id"}	{"sort":3,"hidden":true,"collection":"accessories_accessories_type","field":"accessories_type_id"}	\N	\N
633	697	accessories	1	{"id":1,"image":"7bcf9cf4-3a7d-4c24-b4ab-b183e746d268","heading":"36 mig torch","sub_heading":"Velit velit amet lacus a sem felis. Blandit hendrerit imperdiet turpis purus","price":1999,"type":4,"test":[]}	{"type":4}	\N	\N
634	698	accessories	2	{"id":2,"image":"eb053b63-b683-4b9a-9f23-dde825593f61","heading":"36 WC MIG Torch","sub_heading":"Velit velit amet lacus a sem felis. Blandit hendrerit imperdiet turpis purus","price":1999,"type":4,"test":[]}	{"type":4}	\N	\N
635	699	accessories	3	{"id":3,"image":"f960f2fc-4dc0-4743-b27d-5097f52f7d5b","heading":"26 TIG Torch","sub_heading":"Velit velit amet lacus a sem felis. Blandit hendrerit imperdiet turpis purus","price":1999,"type":5,"test":[]}	{"type":5}	\N	\N
636	700	accessories	4	{"id":4,"image":"e422f5ed-6233-4bd6-adf6-b8033cf452d1","heading":"machine","sub_heading":"Velit velit amet lacus a sem felis. Blandit hendrerit imperdiet turpis purus","price":1999,"type":5,"test":[]}	{"type":5}	\N	\N
637	701	directus_files	dcee2a16-211f-4f7e-ba4c-5da43b669023	{"title":"Mastercard","filename_download":"Mastercard.png","type":"image/png","storage":"local"}	{"title":"Mastercard","filename_download":"Mastercard.png","type":"image/png","storage":"local"}	\N	\N
640	706	directus_fields	126	{"sort":7,"interface":"list-m2m","special":["m2m"],"required":true,"collection":"accessories","field":"type"}	{"sort":7,"interface":"list-m2m","special":["m2m"],"required":true,"collection":"accessories","field":"type"}	\N	\N
641	707	directus_fields	127	{"sort":1,"hidden":true,"field":"id","collection":"accessories_accessories_type_1"}	{"sort":1,"hidden":true,"field":"id","collection":"accessories_accessories_type_1"}	\N	\N
642	708	directus_collections	accessories_accessories_type_1	{"hidden":true,"icon":"import_export","collection":"accessories_accessories_type_1"}	{"hidden":true,"icon":"import_export","collection":"accessories_accessories_type_1"}	\N	\N
643	709	directus_fields	128	{"sort":2,"hidden":true,"collection":"accessories_accessories_type_1","field":"accessories_id"}	{"sort":2,"hidden":true,"collection":"accessories_accessories_type_1","field":"accessories_id"}	\N	\N
644	710	directus_fields	129	{"sort":3,"hidden":true,"collection":"accessories_accessories_type_1","field":"accessories_type_id"}	{"sort":3,"hidden":true,"collection":"accessories_accessories_type_1","field":"accessories_type_id"}	\N	\N
645	711	directus_fields	111	{"id":111,"collection":"accessories","field":"id","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"accessories","field":"id","sort":1,"group":null}	\N	\N
646	712	directus_fields	126	{"id":126,"collection":"accessories","field":"type","special":["m2m"],"interface":"list-m2m","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":2,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"accessories","field":"type","sort":2,"group":null}	\N	\N
647	713	directus_fields	113	{"id":113,"collection":"accessories","field":"image","special":["file"],"interface":"file-image","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":3,"width":"half","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"accessories","field":"image","sort":3,"group":null}	\N	\N
648	714	directus_fields	114	{"id":114,"collection":"accessories","field":"heading","special":null,"interface":"input","options":{"placeholder":"Enter the heading"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":4,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"accessories","field":"heading","sort":4,"group":null}	\N	\N
649	715	directus_fields	115	{"id":115,"collection":"accessories","field":"sub_heading","special":null,"interface":"input","options":{"placeholder":"Enter the subheading"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":5,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"accessories","field":"sub_heading","sort":5,"group":null}	\N	\N
650	716	directus_fields	116	{"id":116,"collection":"accessories","field":"price","special":null,"interface":"input","options":{"placeholder":"Enter the price"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":6,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"accessories","field":"price","sort":6,"group":null}	\N	\N
653	721	directus_fields	130	{"sort":7,"interface":"select-dropdown-m2o","special":["m2o"],"options":{"template":"{{type}}"},"collection":"accessories","field":"type"}	{"sort":7,"interface":"select-dropdown-m2o","special":["m2o"],"options":{"template":"{{type}}"},"collection":"accessories","field":"type"}	\N	\N
654	723	directus_fields	131	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"accessories_type"}	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"accessories_type"}	\N	\N
655	724	directus_collections	accessories_type	{"singleton":false,"collection":"accessories_type"}	{"singleton":false,"collection":"accessories_type"}	\N	\N
656	725	directus_fields	132	{"sort":2,"interface":"input","special":null,"required":false,"collection":"accessories_type","field":"type"}	{"sort":2,"interface":"input","special":null,"required":false,"collection":"accessories_type","field":"type"}	\N	\N
657	726	directus_fields	133	{"sort":3,"interface":"file-image","special":["file"],"required":true,"collection":"accessories_type","field":"image"}	{"sort":3,"interface":"file-image","special":["file"],"required":true,"collection":"accessories_type","field":"image"}	\N	\N
658	727	directus_fields	133	{"id":133,"collection":"accessories_type","field":"image","special":["file"],"interface":"file-image","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":3,"width":"half","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"accessories_type","field":"image","width":"half"}	\N	\N
659	728	directus_files	405c8b4c-933f-42cd-9121-8f31eb516a87	{"title":"Image 8","filename_download":"image 8.png","type":"image/png","storage":"local"}	{"title":"Image 8","filename_download":"image 8.png","type":"image/png","storage":"local"}	\N	\N
660	729	accessories_type	1	{"type":"All","image":"405c8b4c-933f-42cd-9121-8f31eb516a87"}	{"type":"All","image":"405c8b4c-933f-42cd-9121-8f31eb516a87"}	\N	\N
661	730	directus_files	a5b5e1c0-98b1-4885-add5-aa708433b615	{"title":"Image 8","filename_download":"image 8.png","type":"image/png","storage":"local"}	{"title":"Image 8","filename_download":"image 8.png","type":"image/png","storage":"local"}	\N	\N
662	731	accessories_type	2	{"type":"Torches","image":"a5b5e1c0-98b1-4885-add5-aa708433b615"}	{"type":"Torches","image":"a5b5e1c0-98b1-4885-add5-aa708433b615"}	\N	\N
663	732	directus_files	f79cc4e0-ef7f-4a26-a52a-1d018bb0808b	{"title":"Image 8","filename_download":"image 8.png","type":"image/png","storage":"local"}	{"title":"Image 8","filename_download":"image 8.png","type":"image/png","storage":"local"}	\N	\N
664	733	accessories_type	3	{"type":"Machine Accessories","image":"f79cc4e0-ef7f-4a26-a52a-1d018bb0808b"}	{"type":"Machine Accessories","image":"f79cc4e0-ef7f-4a26-a52a-1d018bb0808b"}	\N	\N
665	734	directus_fields	131	{"id":131,"collection":"accessories_type","field":"id","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"accessories_type","field":"id","sort":1,"group":null}	\N	\N
666	735	directus_fields	133	{"id":133,"collection":"accessories_type","field":"image","special":["file"],"interface":"file-image","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":2,"width":"half","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"accessories_type","field":"image","sort":2,"group":null}	\N	\N
667	736	directus_fields	132	{"id":132,"collection":"accessories_type","field":"type","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":3,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"accessories_type","field":"type","sort":3,"group":null}	\N	\N
668	737	directus_collections	accessories_type	{"collection":"accessories_type","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":1,"group":"accessories_page","collapse":"open","preview_url":null,"versioning":false}	{"sort":1,"group":"accessories_page"}	\N	\N
669	738	directus_collections	accessories	{"collection":"accessories","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":2,"group":"accessories_page","collapse":"open","preview_url":null,"versioning":false}	{"sort":2,"group":"accessories_page"}	\N	\N
670	739	directus_collections	homepage	{"collection":"homepage","icon":"home_app_logo","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":"#E35169","item_duplication_fields":null,"sort":1,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":1,"group":null}	\N	\N
671	740	directus_collections	accessories_page	{"collection":"accessories_page","icon":"folder","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":"#FFA439","item_duplication_fields":null,"sort":2,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":2,"group":null}	\N	\N
672	741	directus_collections	Modules	{"collection":"Modules","icon":"view_module","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":"#3399FF","item_duplication_fields":null,"sort":3,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":3,"group":null}	\N	\N
673	742	directus_collections	footer_files	{"collection":"footer_files","icon":"import_export","note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":4,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":4,"group":null}	\N	\N
674	743	directus_collections	accessories_accessories_type	{"collection":"accessories_accessories_type","icon":"import_export","note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":5,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":5,"group":null}	\N	\N
675	744	directus_collections	accessories_accessories_type_1	{"collection":"accessories_accessories_type_1","icon":"import_export","note":null,"display_template":null,"hidden":true,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":6,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"sort":6,"group":null}	\N	\N
676	745	directus_permissions	13	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"accessories_type","action":"read"}	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"accessories_type","action":"read"}	\N	\N
679	749	directus_fields	134	{"sort":7,"interface":"list-m2m","special":["m2m"],"required":true,"collection":"accessories","field":"type"}	{"sort":7,"interface":"list-m2m","special":["m2m"],"required":true,"collection":"accessories","field":"type"}	\N	\N
680	750	directus_fields	135	{"sort":1,"hidden":true,"field":"id","collection":"accessories_accessories_type_2"}	{"sort":1,"hidden":true,"field":"id","collection":"accessories_accessories_type_2"}	\N	\N
681	751	directus_collections	accessories_accessories_type_2	{"hidden":true,"icon":"import_export","collection":"accessories_accessories_type_2"}	{"hidden":true,"icon":"import_export","collection":"accessories_accessories_type_2"}	\N	\N
682	752	directus_fields	136	{"sort":2,"hidden":true,"collection":"accessories_accessories_type_2","field":"accessories_id"}	{"sort":2,"hidden":true,"collection":"accessories_accessories_type_2","field":"accessories_id"}	\N	\N
683	753	directus_fields	137	{"sort":3,"hidden":true,"collection":"accessories_accessories_type_2","field":"accessories_type_id"}	{"sort":3,"hidden":true,"collection":"accessories_accessories_type_2","field":"accessories_type_id"}	\N	\N
684	754	directus_fields	111	{"id":111,"collection":"accessories","field":"id","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"accessories","field":"id","sort":1,"group":null}	\N	\N
685	755	directus_fields	134	{"id":134,"collection":"accessories","field":"type","special":["m2m"],"interface":"list-m2m","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":2,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"accessories","field":"type","sort":2,"group":null}	\N	\N
686	756	directus_fields	113	{"id":113,"collection":"accessories","field":"image","special":["file"],"interface":"file-image","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":3,"width":"half","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"accessories","field":"image","sort":3,"group":null}	\N	\N
687	757	directus_fields	114	{"id":114,"collection":"accessories","field":"heading","special":null,"interface":"input","options":{"placeholder":"Enter the heading"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":4,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"accessories","field":"heading","sort":4,"group":null}	\N	\N
688	758	directus_fields	115	{"id":115,"collection":"accessories","field":"sub_heading","special":null,"interface":"input","options":{"placeholder":"Enter the subheading"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":5,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"accessories","field":"sub_heading","sort":5,"group":null}	\N	\N
689	759	directus_fields	116	{"id":116,"collection":"accessories","field":"price","special":null,"interface":"input","options":{"placeholder":"Enter the price"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":6,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"accessories","field":"price","sort":6,"group":null}	\N	\N
696	769	directus_permissions	14	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"accessories_accessories_type_2","action":"read"}	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"accessories_accessories_type_2","action":"read"}	\N	\N
697	771	directus_fields	138	{"sort":7,"interface":"select-dropdown-m2o","special":["m2o"],"options":{"template":"{{type}}"},"required":true,"collection":"accessories","field":"type"}	{"sort":7,"interface":"select-dropdown-m2o","special":["m2o"],"options":{"template":"{{type}}"},"required":true,"collection":"accessories","field":"type"}	\N	\N
698	772	directus_fields	111	{"id":111,"collection":"accessories","field":"id","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"accessories","field":"id","sort":1,"group":null}	\N	\N
699	773	directus_fields	138	{"id":138,"collection":"accessories","field":"type","special":["m2o"],"interface":"select-dropdown-m2o","options":{"template":"{{type}}"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":2,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"accessories","field":"type","sort":2,"group":null}	\N	\N
700	774	directus_fields	113	{"id":113,"collection":"accessories","field":"image","special":["file"],"interface":"file-image","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":3,"width":"half","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"accessories","field":"image","sort":3,"group":null}	\N	\N
701	775	directus_fields	114	{"id":114,"collection":"accessories","field":"heading","special":null,"interface":"input","options":{"placeholder":"Enter the heading"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":4,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"accessories","field":"heading","sort":4,"group":null}	\N	\N
763	848	directus_files	53e4a952-f407-43ca-b43e-6fab99c32186	{"title":"Andrew Palmer Let Tqca Cx9o Unsplash","filename_download":"andrew-palmer-LetTqcaCx9o-unsplash.jpg","type":"image/jpeg","storage":"local"}	{"title":"Andrew Palmer Let Tqca Cx9o Unsplash","filename_download":"andrew-palmer-LetTqcaCx9o-unsplash.jpg","type":"image/jpeg","storage":"local"}	\N	\N
702	776	directus_fields	115	{"id":115,"collection":"accessories","field":"sub_heading","special":null,"interface":"input","options":{"placeholder":"Enter the subheading"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":5,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"accessories","field":"sub_heading","sort":5,"group":null}	\N	\N
703	777	directus_fields	116	{"id":116,"collection":"accessories","field":"price","special":null,"interface":"input","options":{"placeholder":"Enter the price"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":6,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"accessories","field":"price","sort":6,"group":null}	\N	\N
704	778	accessories	2	{"id":2,"image":"eb053b63-b683-4b9a-9f23-dde825593f61","heading":"36 WC MIG Torch","sub_heading":"Velit velit amet lacus a sem felis. Blandit hendrerit imperdiet turpis purus","price":1999,"type":2}	{"type":2}	\N	\N
705	779	accessories	3	{"id":3,"image":"f960f2fc-4dc0-4743-b27d-5097f52f7d5b","heading":"26 TIG Torch","sub_heading":"Velit velit amet lacus a sem felis. Blandit hendrerit imperdiet turpis purus","price":1999,"type":2}	{"type":2}	\N	\N
706	780	accessories	4	{"id":4,"image":"e422f5ed-6233-4bd6-adf6-b8033cf452d1","heading":"machine","sub_heading":"Velit velit amet lacus a sem felis. Blandit hendrerit imperdiet turpis purus","price":1999,"type":3}	{"type":3}	\N	\N
707	781	directus_fields	139	{"sort":7,"interface":"list-m2m","special":["m2m"],"collection":"accessories","field":"test"}	{"sort":7,"interface":"list-m2m","special":["m2m"],"collection":"accessories","field":"test"}	\N	\N
708	782	directus_fields	140	{"sort":1,"hidden":true,"field":"id","collection":"accessories_accessories_type_3"}	{"sort":1,"hidden":true,"field":"id","collection":"accessories_accessories_type_3"}	\N	\N
709	783	directus_collections	accessories_accessories_type_3	{"hidden":true,"icon":"import_export","collection":"accessories_accessories_type_3"}	{"hidden":true,"icon":"import_export","collection":"accessories_accessories_type_3"}	\N	\N
710	784	directus_fields	141	{"sort":2,"hidden":true,"collection":"accessories_accessories_type_3","field":"accessories_id"}	{"sort":2,"hidden":true,"collection":"accessories_accessories_type_3","field":"accessories_id"}	\N	\N
711	785	directus_fields	142	{"sort":3,"hidden":true,"collection":"accessories_accessories_type_3","field":"accessories_type_id"}	{"sort":3,"hidden":true,"collection":"accessories_accessories_type_3","field":"accessories_type_id"}	\N	\N
712	790	directus_files	65971f09-8765-47ce-a742-e79e3fd56e1e	{"title":"Image 8","filename_download":"image 8.png","type":"image/png","storage":"local"}	{"title":"Image 8","filename_download":"image 8.png","type":"image/png","storage":"local"}	\N	\N
713	791	accessories	5	{"type":3,"image":"65971f09-8765-47ce-a742-e79e3fd56e1e","heading":"18 WC TIG Torch","sub_heading":"Velit velit amet lacus a sem felis. Blandit hendrerit imperdiet turpis purus","price":1999}	{"type":3,"image":"65971f09-8765-47ce-a742-e79e3fd56e1e","heading":"18 WC TIG Torch","sub_heading":"Velit velit amet lacus a sem felis. Blandit hendrerit imperdiet turpis purus","price":1999}	\N	\N
714	792	directus_files	e161e149-7a3c-4f14-beb8-84db2fbcc345	{"title":"Image 8","filename_download":"image 8.png","type":"image/png","storage":"local"}	{"title":"Image 8","filename_download":"image 8.png","type":"image/png","storage":"local"}	\N	\N
715	793	accessories	6	{"heading":"Plasma Torch","type":2,"image":"e161e149-7a3c-4f14-beb8-84db2fbcc345","sub_heading":"Velit velit amet lacus a sem felis. Blandit hendrerit imperdiet turpis purus","price":1999}	{"heading":"Plasma Torch","type":2,"image":"e161e149-7a3c-4f14-beb8-84db2fbcc345","sub_heading":"Velit velit amet lacus a sem felis. Blandit hendrerit imperdiet turpis purus","price":1999}	\N	\N
716	794	directus_files	20f7943c-d70d-48d6-a690-0411c74399eb	{"title":"Image 8","filename_download":"image 8.png","type":"image/png","storage":"local"}	{"title":"Image 8","filename_download":"image 8.png","type":"image/png","storage":"local"}	\N	\N
717	795	accessories	7	{"heading":"Push-Pull Torch","sub_heading":"Velit velit amet lacus a sem felis. Blandit hendrerit imperdiet turpis purus","price":1999,"type":3,"image":"20f7943c-d70d-48d6-a690-0411c74399eb"}	{"heading":"Push-Pull Torch","sub_heading":"Velit velit amet lacus a sem felis. Blandit hendrerit imperdiet turpis purus","price":1999,"type":3,"image":"20f7943c-d70d-48d6-a690-0411c74399eb"}	\N	\N
718	796	directus_files	ab586d2a-ba28-4e07-add9-33ff3850d91d	{"title":"Image 8","filename_download":"image 8.png","type":"image/png","storage":"local"}	{"title":"Image 8","filename_download":"image 8.png","type":"image/png","storage":"local"}	\N	\N
719	797	accessories	8	{"type":2,"heading":"Spool Gun","sub_heading":"Velit velit amet lacus a sem felis. Blandit hendrerit imperdiet turpis purus","price":1999,"image":"ab586d2a-ba28-4e07-add9-33ff3850d91d"}	{"type":2,"heading":"Spool Gun","sub_heading":"Velit velit amet lacus a sem felis. Blandit hendrerit imperdiet turpis purus","price":1999,"image":"ab586d2a-ba28-4e07-add9-33ff3850d91d"}	\N	\N
720	798	accessories	2	{"id":2,"image":"eb053b63-b683-4b9a-9f23-dde825593f61","heading":"36 WC MIG Torch","sub_heading":"Velit velit amet lacus a sem felis. Blandit hendrerit imperdiet turpis purus","price":1099,"type":2}	{"price":1099}	\N	\N
721	799	accessories	3	{"id":3,"image":"f960f2fc-4dc0-4743-b27d-5097f52f7d5b","heading":"26 TIG Torch","sub_heading":"Velit velit amet lacus a sem felis. Blandit hendrerit imperdiet turpis purus","price":999,"type":2}	{"price":999}	\N	\N
722	800	accessories	6	{"id":6,"image":"e161e149-7a3c-4f14-beb8-84db2fbcc345","heading":"Plasma Torch","sub_heading":"Velit velit amet lacus a sem felis. Blandit hendrerit imperdiet turpis purus","price":1000,"type":2}	{"price":1000}	\N	\N
723	801	accessories	7	{"id":7,"image":"20f7943c-d70d-48d6-a690-0411c74399eb","heading":"Push-Pull Torch","sub_heading":"Velit velit amet lacus a sem felis. Blandit hendrerit imperdiet turpis purus","price":1009,"type":3}	{"price":1009}	\N	\N
724	802	footer_files	11	{"id":11,"footer_id":null,"directus_files_id":"7cc48476-1d9f-4a50-a628-e44448e4d0a7"}	{"footer_id":null}	\N	\N
725	804	directus_files	b65b8bfb-13fb-4f9c-af0f-dfcf68600d3c	{"title":"Apple Pay (2)","filename_download":"ApplePay (2).png","type":"image/png","storage":"local"}	{"title":"Apple Pay (2)","filename_download":"ApplePay (2).png","type":"image/png","storage":"local"}	\N	\N
726	805	footer_files	17	{"footer_id":1,"directus_files_id":{"id":"b65b8bfb-13fb-4f9c-af0f-dfcf68600d3c"}}	{"footer_id":1,"directus_files_id":{"id":"b65b8bfb-13fb-4f9c-af0f-dfcf68600d3c"}}	\N	\N
727	807	directus_files	4f432983-1c62-4ada-aff1-72407a39f3c4	{"title":"Image 8","filename_download":"image 8.png","type":"image/png","storage":"local"}	{"title":"Image 8","filename_download":"image 8.png","type":"image/png","storage":"local"}	\N	\N
728	808	accessories	9	{"type":2,"image":"4f432983-1c62-4ada-aff1-72407a39f3c4","heading":"MMA Torch","sub_heading":"Velit velit amet lacus a sem felis. Blandit hendrerit imperdiet turpis purus","price":100}	{"type":2,"image":"4f432983-1c62-4ada-aff1-72407a39f3c4","heading":"MMA Torch","sub_heading":"Velit velit amet lacus a sem felis. Blandit hendrerit imperdiet turpis purus","price":100}	\N	\N
729	809	accessories	9	{"id":9,"image":"4f432983-1c62-4ada-aff1-72407a39f3c4","heading":"MMA Torch","sub_heading":"Velit velit amet lacus a sem felis. Blandit hendrerit imperdiet turpis purus","price":799,"type":2}	{"price":799}	\N	\N
730	810	hero_section	1	{"id":1,"sort":null,"bg_img":"b65a1efc-d3f1-4718-835a-68a42332f4d4","heading":"MAVOK 230MP","sub_heading":"A new era of welding innovation and performance starts now.","button_text":[{"text":"Shop Now","link":"accessories"}],"Lists":[{"title":"10a/15A","sub_title":"Dual Input"},{"title":"Single & Double","sub_title":"Pulse MIG"},{"title":"AC/DC","sub_title":"High Frequency TIG"},{"title":"Pilot Arc","sub_title":"Plasma Cutting"},{"title":"7” LCD","sub_title":"Touch Screen"}]}	{"button_text":[{"text":"Shop Now","link":"accessories"}]}	\N	\N
731	811	directus_files	c2ced0b0-0c3f-430d-84da-442cf00517ba	{"title":"Image 8","filename_download":"image 8.png","type":"image/png","storage":"local"}	{"title":"Image 8","filename_download":"image 8.png","type":"image/png","storage":"local"}	\N	\N
732	812	accessories	10	{"heading":"36 WC MIG Torch","type":2,"image":"c2ced0b0-0c3f-430d-84da-442cf00517ba","sub_heading":"Velit velit amet lacus a sem felis. Blandit hendrerit imperdiet turpis purus","price":899}	{"heading":"36 WC MIG Torch","type":2,"image":"c2ced0b0-0c3f-430d-84da-442cf00517ba","sub_heading":"Velit velit amet lacus a sem felis. Blandit hendrerit imperdiet turpis purus","price":899}	\N	\N
733	813	directus_files	53fcdf48-e8d3-4330-814e-0a5e0c816df4	{"title":"Image 8","filename_download":"image 8.png","type":"image/png","storage":"local"}	{"title":"Image 8","filename_download":"image 8.png","type":"image/png","storage":"local"}	\N	\N
734	814	accessories	11	{"type":3,"heading":"MMA Torch","sub_heading":"Velit velit amet lacus a sem felis. Blandit hendrerit imperdiet turpis purus","price":999,"image":"53fcdf48-e8d3-4330-814e-0a5e0c816df4"}	{"type":3,"heading":"MMA Torch","sub_heading":"Velit velit amet lacus a sem felis. Blandit hendrerit imperdiet turpis purus","price":999,"image":"53fcdf48-e8d3-4330-814e-0a5e0c816df4"}	\N	\N
735	815	directus_fields	143	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"home"}	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"home"}	\N	\N
736	816	directus_fields	144	{"sort":2,"interface":"input","hidden":true,"field":"sort","collection":"home"}	{"sort":2,"interface":"input","hidden":true,"field":"sort","collection":"home"}	\N	\N
737	817	directus_collections	home	{"sort_field":"sort","singleton":false,"collection":"home"}	{"sort_field":"sort","singleton":false,"collection":"home"}	\N	\N
738	818	directus_fields	145	{"sort":3,"interface":"list-m2m","special":["m2m"],"collection":"home","field":"sections"}	{"sort":3,"interface":"list-m2m","special":["m2m"],"collection":"home","field":"sections"}	\N	\N
739	819	directus_fields	146	{"sort":1,"hidden":true,"field":"id","collection":"home_hero_section"}	{"sort":1,"hidden":true,"field":"id","collection":"home_hero_section"}	\N	\N
740	820	directus_collections	home_hero_section	{"hidden":true,"icon":"import_export","collection":"home_hero_section"}	{"hidden":true,"icon":"import_export","collection":"home_hero_section"}	\N	\N
741	821	directus_fields	147	{"sort":2,"hidden":true,"collection":"home_hero_section","field":"home_id"}	{"sort":2,"hidden":true,"collection":"home_hero_section","field":"home_id"}	\N	\N
742	822	directus_fields	148	{"sort":3,"hidden":true,"collection":"home_hero_section","field":"hero_section_id"}	{"sort":3,"hidden":true,"collection":"home_hero_section","field":"hero_section_id"}	\N	\N
743	825	directus_fields	149	{"sort":7,"interface":"files","special":["files"],"required":false,"collection":"accessories","field":"images"}	{"sort":7,"interface":"files","special":["files"],"required":false,"collection":"accessories","field":"images"}	\N	\N
744	826	directus_fields	150	{"sort":1,"hidden":true,"field":"id","collection":"accessories_files"}	{"sort":1,"hidden":true,"field":"id","collection":"accessories_files"}	\N	\N
745	827	directus_collections	accessories_files	{"hidden":true,"icon":"import_export","collection":"accessories_files"}	{"hidden":true,"icon":"import_export","collection":"accessories_files"}	\N	\N
746	828	directus_fields	151	{"sort":2,"hidden":true,"collection":"accessories_files","field":"accessories_id"}	{"sort":2,"hidden":true,"collection":"accessories_files","field":"accessories_id"}	\N	\N
747	829	directus_fields	152	{"sort":3,"hidden":true,"collection":"accessories_files","field":"directus_files_id"}	{"sort":3,"hidden":true,"collection":"accessories_files","field":"directus_files_id"}	\N	\N
748	830	directus_permissions	15	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"accessories_files","action":"read"}	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"accessories_files","action":"read"}	\N	\N
749	833	directus_files	5861d0d2-08b9-488c-89ac-b4158c90c290	{"title":"Image 9","filename_download":"image 9.png","type":"image/png","storage":"local"}	{"title":"Image 9","filename_download":"image 9.png","type":"image/png","storage":"local"}	\N	\N
750	832	directus_files	79bd4f79-104e-4afe-b243-191c52fe7f95	{"title":"Image 8","filename_download":"image 8.png","type":"image/png","storage":"local"}	{"title":"Image 8","filename_download":"image 8.png","type":"image/png","storage":"local"}	\N	\N
751	834	directus_files	b3f12688-dd6a-43fb-8277-1a6e8de88a65	{"title":"Image 2","filename_download":"image 2.png","type":"image/png","storage":"local"}	{"title":"Image 2","filename_download":"image 2.png","type":"image/png","storage":"local"}	\N	\N
755	839	directus_files	a8c2af70-b873-4089-9db5-31adc0e95ef4	{"title":"Andrew Palmer Let Tqca Cx9o Unsplash","filename_download":"andrew-palmer-LetTqcaCx9o-unsplash.jpg","type":"image/jpeg","storage":"local"}	{"title":"Andrew Palmer Let Tqca Cx9o Unsplash","filename_download":"andrew-palmer-LetTqcaCx9o-unsplash.jpg","type":"image/jpeg","storage":"local"}	\N	\N
756	840	directus_files	4d1ccf79-73e8-4392-91bc-abc59c6cd748	{"title":"Seb Mooze Izgs Ik Fghrw Unsplash","filename_download":"seb-mooze-IzgsIKFghrw-unsplash.jpg","type":"image/jpeg","storage":"local"}	{"title":"Seb Mooze Izgs Ik Fghrw Unsplash","filename_download":"seb-mooze-IzgsIKFghrw-unsplash.jpg","type":"image/jpeg","storage":"local"}	\N	\N
757	841	directus_files	96164914-bf98-4865-aaeb-686f9a85603b	{"title":"Marc Wieland Pex 0q a H5 Is Unsplash","filename_download":"marc-wieland-PEX-0qAH5Is-unsplash.jpg","type":"image/jpeg","storage":"local"}	{"title":"Marc Wieland Pex 0q a H5 Is Unsplash","filename_download":"marc-wieland-PEX-0qAH5Is-unsplash.jpg","type":"image/jpeg","storage":"local"}	\N	\N
758	842	directus_files	9db4d987-76ad-442c-aa5c-bf851b8cd50c	{"title":"Cristian Grecu Ipckz 9z Dxy Unsplash","filename_download":"cristian-grecu-ipckz_9zDXY-unsplash.jpg","type":"image/jpeg","storage":"local"}	{"title":"Cristian Grecu Ipckz 9z Dxy Unsplash","filename_download":"cristian-grecu-ipckz_9zDXY-unsplash.jpg","type":"image/jpeg","storage":"local"}	\N	\N
764	849	directus_files	c4a56dea-c873-4184-87be-98bbd525c451	{"title":"Marc Wieland Pex 0q a H5 Is Unsplash","filename_download":"marc-wieland-PEX-0qAH5Is-unsplash.jpg","type":"image/jpeg","storage":"local"}	{"title":"Marc Wieland Pex 0q a H5 Is Unsplash","filename_download":"marc-wieland-PEX-0qAH5Is-unsplash.jpg","type":"image/jpeg","storage":"local"}	\N	\N
765	851	directus_files	9d93b3af-7085-45bc-970a-26721b04ef40	{"title":"Seb Mooze Izgs Ik Fghrw Unsplash","filename_download":"seb-mooze-IzgsIKFghrw-unsplash.jpg","type":"image/jpeg","storage":"local"}	{"title":"Seb Mooze Izgs Ik Fghrw Unsplash","filename_download":"seb-mooze-IzgsIKFghrw-unsplash.jpg","type":"image/jpeg","storage":"local"}	\N	\N
766	850	directus_files	c70383cb-f76a-4eec-866f-2a22b593cc34	{"title":"Cristian Grecu Ipckz 9z Dxy Unsplash","filename_download":"cristian-grecu-ipckz_9zDXY-unsplash.jpg","type":"image/jpeg","storage":"local"}	{"title":"Cristian Grecu Ipckz 9z Dxy Unsplash","filename_download":"cristian-grecu-ipckz_9zDXY-unsplash.jpg","type":"image/jpeg","storage":"local"}	\N	\N
771	858	directus_files	4fbbe243-5c7d-49a3-9851-d1d6f96aef51	{"title":"Marc Wieland Pex 0q a H5 Is Unsplash","filename_download":"marc-wieland-PEX-0qAH5Is-unsplash.jpg","type":"image/jpeg","storage":"local"}	{"title":"Marc Wieland Pex 0q a H5 Is Unsplash","filename_download":"marc-wieland-PEX-0qAH5Is-unsplash.jpg","type":"image/jpeg","storage":"local"}	\N	\N
772	857	directus_files	f7260eca-814a-44f4-8ea3-0f875b0f97b1	{"title":"Seb Mooze Izgs Ik Fghrw Unsplash","filename_download":"seb-mooze-IzgsIKFghrw-unsplash.jpg","type":"image/jpeg","storage":"local"}	{"title":"Seb Mooze Izgs Ik Fghrw Unsplash","filename_download":"seb-mooze-IzgsIKFghrw-unsplash.jpg","type":"image/jpeg","storage":"local"}	\N	\N
773	859	directus_files	15dc53a3-aa2f-499d-84e8-e92faf02229e	{"title":"Andrew Palmer Let Tqca Cx9o Unsplash","filename_download":"andrew-palmer-LetTqcaCx9o-unsplash.jpg","type":"image/jpeg","storage":"local"}	{"title":"Andrew Palmer Let Tqca Cx9o Unsplash","filename_download":"andrew-palmer-LetTqcaCx9o-unsplash.jpg","type":"image/jpeg","storage":"local"}	\N	\N
777	864	directus_fields	111	{"id":111,"collection":"accessories","field":"id","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"accessories","field":"id","sort":1,"group":null}	\N	\N
778	865	directus_fields	138	{"id":138,"collection":"accessories","field":"type","special":["m2o"],"interface":"select-dropdown-m2o","options":{"template":"{{type}}"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":2,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"accessories","field":"type","sort":2,"group":null}	\N	\N
779	866	directus_fields	113	{"id":113,"collection":"accessories","field":"image","special":["file"],"interface":"file-image","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":3,"width":"half","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"accessories","field":"image","sort":3,"group":null}	\N	\N
780	867	directus_fields	149	{"id":149,"collection":"accessories","field":"images","special":["files"],"interface":"files","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":4,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"accessories","field":"images","sort":4,"group":null}	\N	\N
781	868	directus_fields	114	{"id":114,"collection":"accessories","field":"heading","special":null,"interface":"input","options":{"placeholder":"Enter the heading"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":5,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"accessories","field":"heading","sort":5,"group":null}	\N	\N
782	869	directus_fields	115	{"id":115,"collection":"accessories","field":"sub_heading","special":null,"interface":"input","options":{"placeholder":"Enter the subheading"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":6,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"accessories","field":"sub_heading","sort":6,"group":null}	\N	\N
783	870	directus_fields	116	{"id":116,"collection":"accessories","field":"price","special":null,"interface":"input","options":{"placeholder":"Enter the price"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":7,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"accessories","field":"price","sort":7,"group":null}	\N	\N
785	873	directus_fields	153	{"sort":8,"interface":"file-image","special":["file"],"required":true,"collection":"accessories","field":"main_image"}	{"sort":8,"interface":"file-image","special":["file"],"required":true,"collection":"accessories","field":"main_image"}	\N	\N
786	874	directus_files	eff018c2-0258-444b-bc82-6b422d9a0406	{"title":"Andrew Palmer Let Tqca Cx9o Unsplash","filename_download":"andrew-palmer-LetTqcaCx9o-unsplash.jpg","type":"image/jpeg","storage":"local"}	{"title":"Andrew Palmer Let Tqca Cx9o Unsplash","filename_download":"andrew-palmer-LetTqcaCx9o-unsplash.jpg","type":"image/jpeg","storage":"local"}	\N	\N
787	875	accessories	2	{"id":2,"image":"eb053b63-b683-4b9a-9f23-dde825593f61","heading":"36 WC MIG Torch","sub_heading":"Velit velit amet lacus a sem felis. Blandit hendrerit imperdiet turpis purus","price":1099,"type":2,"main_image":"eff018c2-0258-444b-bc82-6b422d9a0406","images":[2,3]}	{"main_image":"eff018c2-0258-444b-bc82-6b422d9a0406"}	\N	\N
788	876	directus_files	e74a1d3b-51c7-4aaa-9d8a-6f9e0b66c4b6	{"title":"Image 8","filename_download":"image 8.png","type":"image/png","storage":"local"}	{"title":"Image 8","filename_download":"image 8.png","type":"image/png","storage":"local"}	\N	\N
789	877	accessories	3	{"id":3,"image":"f960f2fc-4dc0-4743-b27d-5097f52f7d5b","heading":"26 TIG Torch","sub_heading":"Velit velit amet lacus a sem felis. Blandit hendrerit imperdiet turpis purus","price":999,"type":2,"main_image":"e74a1d3b-51c7-4aaa-9d8a-6f9e0b66c4b6","images":[4,5,6,7]}	{"main_image":"e74a1d3b-51c7-4aaa-9d8a-6f9e0b66c4b6"}	\N	\N
790	878	directus_files	88e27c2c-5994-40d4-a1b5-f73792f84608	{"title":"Image 8","filename_download":"image 8.png","type":"image/png","storage":"local"}	{"title":"Image 8","filename_download":"image 8.png","type":"image/png","storage":"local"}	\N	\N
791	879	accessories	4	{"id":4,"image":"e422f5ed-6233-4bd6-adf6-b8033cf452d1","heading":"machine","sub_heading":"Velit velit amet lacus a sem felis. Blandit hendrerit imperdiet turpis purus","price":1999,"type":3,"main_image":"88e27c2c-5994-40d4-a1b5-f73792f84608","images":[8,9,10,11]}	{"main_image":"88e27c2c-5994-40d4-a1b5-f73792f84608"}	\N	\N
792	880	accessories	5	{"id":5,"image":"65971f09-8765-47ce-a742-e79e3fd56e1e","heading":"18 WC TIG Torch","sub_heading":"Velit velit amet lacus a sem felis. Blandit hendrerit imperdiet turpis purus","price":1999,"type":3,"main_image":"88e27c2c-5994-40d4-a1b5-f73792f84608","images":[]}	{"main_image":"88e27c2c-5994-40d4-a1b5-f73792f84608"}	\N	\N
793	881	accessories	6	{"id":6,"image":"e161e149-7a3c-4f14-beb8-84db2fbcc345","heading":"Plasma Torch","sub_heading":"Velit velit amet lacus a sem felis. Blandit hendrerit imperdiet turpis purus","price":1000,"type":2,"main_image":"88e27c2c-5994-40d4-a1b5-f73792f84608","images":[]}	{"main_image":"88e27c2c-5994-40d4-a1b5-f73792f84608"}	\N	\N
794	882	accessories	7	{"id":7,"image":"20f7943c-d70d-48d6-a690-0411c74399eb","heading":"Push-Pull Torch","sub_heading":"Velit velit amet lacus a sem felis. Blandit hendrerit imperdiet turpis purus","price":1009,"type":3,"main_image":"e74a1d3b-51c7-4aaa-9d8a-6f9e0b66c4b6","images":[]}	{"main_image":"e74a1d3b-51c7-4aaa-9d8a-6f9e0b66c4b6"}	\N	\N
797	885	accessories	9	{"id":9,"image":"4f432983-1c62-4ada-aff1-72407a39f3c4","heading":"MMA Torch","sub_heading":"Velit velit amet lacus a sem felis. Blandit hendrerit imperdiet turpis purus","price":799,"type":2,"main_image":"88e27c2c-5994-40d4-a1b5-f73792f84608","images":[]}	{"main_image":"88e27c2c-5994-40d4-a1b5-f73792f84608"}	\N	\N
798	886	accessories	10	{"id":10,"image":"c2ced0b0-0c3f-430d-84da-442cf00517ba","heading":"36 WC MIG Torch","sub_heading":"Velit velit amet lacus a sem felis. Blandit hendrerit imperdiet turpis purus","price":899,"type":2,"main_image":"88e27c2c-5994-40d4-a1b5-f73792f84608","images":[]}	{"main_image":"88e27c2c-5994-40d4-a1b5-f73792f84608"}	\N	\N
795	883	directus_files	fa387a8b-bb5f-447a-a550-2e89d6f66365	{"title":"Image 8","filename_download":"image 8.png","type":"image/png","storage":"local"}	{"title":"Image 8","filename_download":"image 8.png","type":"image/png","storage":"local"}	\N	\N
796	884	accessories	8	{"id":8,"image":"ab586d2a-ba28-4e07-add9-33ff3850d91d","heading":"Spool Gun","sub_heading":"Velit velit amet lacus a sem felis. Blandit hendrerit imperdiet turpis purus","price":1999,"type":2,"main_image":"fa387a8b-bb5f-447a-a550-2e89d6f66365","images":[]}	{"main_image":"fa387a8b-bb5f-447a-a550-2e89d6f66365"}	\N	\N
799	887	directus_files	5d37f41b-7aad-49fd-8667-c4dfcec743da	{"title":"Image 8","filename_download":"image 8.png","type":"image/png","storage":"local"}	{"title":"Image 8","filename_download":"image 8.png","type":"image/png","storage":"local"}	\N	\N
800	888	accessories	11	{"id":11,"image":"53fcdf48-e8d3-4330-814e-0a5e0c816df4","heading":"MMA Torch","sub_heading":"Velit velit amet lacus a sem felis. Blandit hendrerit imperdiet turpis purus","price":999,"type":3,"main_image":"5d37f41b-7aad-49fd-8667-c4dfcec743da","images":[12,13,14]}	{"main_image":"5d37f41b-7aad-49fd-8667-c4dfcec743da"}	\N	\N
801	889	directus_fields	153	{"id":153,"collection":"accessories","field":"main_image","special":["file"],"interface":"file-image","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":8,"width":"half","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"accessories","field":"main_image","width":"half"}	\N	\N
802	890	directus_fields	111	{"id":111,"collection":"accessories","field":"id","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"accessories","field":"id","sort":1,"group":null}	\N	\N
803	891	directus_fields	138	{"id":138,"collection":"accessories","field":"type","special":["m2o"],"interface":"select-dropdown-m2o","options":{"template":"{{type}}"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":2,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"accessories","field":"type","sort":2,"group":null}	\N	\N
804	892	directus_fields	153	{"id":153,"collection":"accessories","field":"main_image","special":["file"],"interface":"file-image","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":3,"width":"half","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"accessories","field":"main_image","sort":3,"group":null}	\N	\N
805	893	directus_fields	113	{"id":113,"collection":"accessories","field":"image","special":["file"],"interface":"file-image","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":4,"width":"half","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"accessories","field":"image","sort":4,"group":null}	\N	\N
806	894	directus_fields	149	{"id":149,"collection":"accessories","field":"images","special":["files"],"interface":"files","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":5,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"accessories","field":"images","sort":5,"group":null}	\N	\N
807	895	directus_fields	114	{"id":114,"collection":"accessories","field":"heading","special":null,"interface":"input","options":{"placeholder":"Enter the heading"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":6,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"accessories","field":"heading","sort":6,"group":null}	\N	\N
808	896	directus_fields	115	{"id":115,"collection":"accessories","field":"sub_heading","special":null,"interface":"input","options":{"placeholder":"Enter the subheading"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":7,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"accessories","field":"sub_heading","sort":7,"group":null}	\N	\N
809	897	directus_fields	116	{"id":116,"collection":"accessories","field":"price","special":null,"interface":"input","options":{"placeholder":"Enter the price"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":8,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"accessories","field":"price","sort":8,"group":null}	\N	\N
810	899	directus_fields	154	{"sort":9,"interface":"files","special":["files"],"required":true,"collection":"accessories","field":"additional_images"}	{"sort":9,"interface":"files","special":["files"],"required":true,"collection":"accessories","field":"additional_images"}	\N	\N
811	900	directus_fields	155	{"sort":1,"hidden":true,"field":"id","collection":"accessories_files"}	{"sort":1,"hidden":true,"field":"id","collection":"accessories_files"}	\N	\N
812	901	directus_collections	accessories_files	{"hidden":true,"icon":"import_export","collection":"accessories_files"}	{"hidden":true,"icon":"import_export","collection":"accessories_files"}	\N	\N
813	902	directus_fields	156	{"sort":2,"hidden":true,"collection":"accessories_files","field":"accessories_id"}	{"sort":2,"hidden":true,"collection":"accessories_files","field":"accessories_id"}	\N	\N
814	903	directus_fields	157	{"sort":3,"hidden":true,"collection":"accessories_files","field":"directus_files_id"}	{"sort":3,"hidden":true,"collection":"accessories_files","field":"directus_files_id"}	\N	\N
815	904	directus_fields	111	{"id":111,"collection":"accessories","field":"id","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"accessories","field":"id","sort":1,"group":null}	\N	\N
816	905	directus_fields	138	{"id":138,"collection":"accessories","field":"type","special":["m2o"],"interface":"select-dropdown-m2o","options":{"template":"{{type}}"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":2,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"accessories","field":"type","sort":2,"group":null}	\N	\N
817	906	directus_fields	153	{"id":153,"collection":"accessories","field":"main_image","special":["file"],"interface":"file-image","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":3,"width":"half","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"accessories","field":"main_image","sort":3,"group":null}	\N	\N
818	907	directus_fields	154	{"id":154,"collection":"accessories","field":"additional_images","special":["files"],"interface":"files","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":4,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"accessories","field":"additional_images","sort":4,"group":null}	\N	\N
819	908	directus_fields	114	{"id":114,"collection":"accessories","field":"heading","special":null,"interface":"input","options":{"placeholder":"Enter the heading"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":5,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"accessories","field":"heading","sort":5,"group":null}	\N	\N
845	939	directus_files	baad0908-6731-47af-9a0b-71f1398a0502	{"title":"Tim Dennert Y Kh Ans1t W54 Unsplash","filename_download":"tim-dennert-yKhAns1tW54-unsplash.jpg","type":"image/jpeg","storage":"local"}	{"title":"Tim Dennert Y Kh Ans1t W54 Unsplash","filename_download":"tim-dennert-yKhAns1tW54-unsplash.jpg","type":"image/jpeg","storage":"local"}	\N	\N
820	909	directus_fields	115	{"id":115,"collection":"accessories","field":"sub_heading","special":null,"interface":"input","options":{"placeholder":"Enter the subheading"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":6,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"accessories","field":"sub_heading","sort":6,"group":null}	\N	\N
821	910	directus_fields	116	{"id":116,"collection":"accessories","field":"price","special":null,"interface":"input","options":{"placeholder":"Enter the price"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":7,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"accessories","field":"price","sort":7,"group":null}	\N	\N
822	911	directus_permissions	16	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"accessories_files","action":"read"}	{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"accessories_files","action":"read"}	\N	\N
826	916	accessories	2	{"id":2,"heading":"36 WC MIG Torch","sub_heading":"Velit velit amet lacus a sem felis. Blandit hendrerit imperdiet turpis purus","price":1099,"type":2,"main_image":"fa387a8b-bb5f-447a-a550-2e89d6f66365","additional_images":[1,2,3]}	{"main_image":"fa387a8b-bb5f-447a-a550-2e89d6f66365"}	\N	\N
823	913	accessories_files	1	{"accessories_id":"2","directus_files_id":{"id":"eff018c2-0258-444b-bc82-6b422d9a0406"}}	{"accessories_id":"2","directus_files_id":{"id":"eff018c2-0258-444b-bc82-6b422d9a0406"}}	826	\N
824	914	accessories_files	2	{"accessories_id":"2","directus_files_id":{"id":"f7260eca-814a-44f4-8ea3-0f875b0f97b1"}}	{"accessories_id":"2","directus_files_id":{"id":"f7260eca-814a-44f4-8ea3-0f875b0f97b1"}}	826	\N
825	915	accessories_files	3	{"accessories_id":"2","directus_files_id":{"id":"c70383cb-f76a-4eec-866f-2a22b593cc34"}}	{"accessories_id":"2","directus_files_id":{"id":"c70383cb-f76a-4eec-866f-2a22b593cc34"}}	826	\N
827	917	accessories_files	4	{"accessories_id":"3","directus_files_id":{"id":"eff018c2-0258-444b-bc82-6b422d9a0406"}}	{"accessories_id":"3","directus_files_id":{"id":"eff018c2-0258-444b-bc82-6b422d9a0406"}}	\N	\N
828	918	accessories_files	5	{"accessories_id":"3","directus_files_id":{"id":"f7260eca-814a-44f4-8ea3-0f875b0f97b1"}}	{"accessories_id":"3","directus_files_id":{"id":"f7260eca-814a-44f4-8ea3-0f875b0f97b1"}}	\N	\N
829	919	accessories_files	6	{"accessories_id":"3","directus_files_id":{"id":"4fbbe243-5c7d-49a3-9851-d1d6f96aef51"}}	{"accessories_id":"3","directus_files_id":{"id":"4fbbe243-5c7d-49a3-9851-d1d6f96aef51"}}	\N	\N
830	920	accessories_files	7	{"accessories_id":"3","directus_files_id":{"id":"c70383cb-f76a-4eec-866f-2a22b593cc34"}}	{"accessories_id":"3","directus_files_id":{"id":"c70383cb-f76a-4eec-866f-2a22b593cc34"}}	\N	\N
831	921	accessories_files	8	{"accessories_id":"3","directus_files_id":{"id":"53e4a952-f407-43ca-b43e-6fab99c32186"}}	{"accessories_id":"3","directus_files_id":{"id":"53e4a952-f407-43ca-b43e-6fab99c32186"}}	\N	\N
832	923	accessories_files	9	{"accessories_id":"3","directus_files_id":{"id":"9d93b3af-7085-45bc-970a-26721b04ef40"}}	{"accessories_id":"3","directus_files_id":{"id":"9d93b3af-7085-45bc-970a-26721b04ef40"}}	\N	\N
833	926	directus_files	6bef1de6-3665-471c-ba4b-d32ed83ce9bc	{"title":"Pexels Enginakyurt 1486842","filename_download":"pexels-enginakyurt-1486842.jpg","type":"image/jpeg","storage":"local"}	{"title":"Pexels Enginakyurt 1486842","filename_download":"pexels-enginakyurt-1486842.jpg","type":"image/jpeg","storage":"local"}	\N	\N
834	925	directus_files	b05ce73f-b76f-4248-91b6-e71df2360d8f	{"title":"Pexels Juanico 3492103","filename_download":"pexels-juanico-3492103.jpg","type":"image/jpeg","storage":"local"}	{"title":"Pexels Juanico 3492103","filename_download":"pexels-juanico-3492103.jpg","type":"image/jpeg","storage":"local"}	\N	\N
835	927	directus_files	cb8682cd-b80d-4658-895d-f47dc8a9c23a	{"title":"Pexels Chaikong2511 104755","filename_download":"pexels-chaikong2511-104755.jpg","type":"image/jpeg","storage":"local"}	{"title":"Pexels Chaikong2511 104755","filename_download":"pexels-chaikong2511-104755.jpg","type":"image/jpeg","storage":"local"}	\N	\N
836	928	accessories_files	10	{"accessories_id":"4","directus_files_id":{"id":"b05ce73f-b76f-4248-91b6-e71df2360d8f"}}	{"accessories_id":"4","directus_files_id":{"id":"b05ce73f-b76f-4248-91b6-e71df2360d8f"}}	\N	\N
837	929	accessories_files	11	{"accessories_id":"4","directus_files_id":{"id":"cb8682cd-b80d-4658-895d-f47dc8a9c23a"}}	{"accessories_id":"4","directus_files_id":{"id":"cb8682cd-b80d-4658-895d-f47dc8a9c23a"}}	\N	\N
838	930	accessories_files	12	{"accessories_id":"4","directus_files_id":{"id":"6bef1de6-3665-471c-ba4b-d32ed83ce9bc"}}	{"accessories_id":"4","directus_files_id":{"id":"6bef1de6-3665-471c-ba4b-d32ed83ce9bc"}}	\N	\N
839	932	accessories_files	1	{"id":1,"accessories_id":null,"directus_files_id":"eff018c2-0258-444b-bc82-6b422d9a0406"}	{"accessories_id":null}	\N	\N
840	933	accessories_files	2	{"id":2,"accessories_id":null,"directus_files_id":"f7260eca-814a-44f4-8ea3-0f875b0f97b1"}	{"accessories_id":null}	\N	\N
841	934	accessories_files	3	{"id":3,"accessories_id":null,"directus_files_id":"c70383cb-f76a-4eec-866f-2a22b593cc34"}	{"accessories_id":null}	\N	\N
842	936	directus_files	dea5add6-517b-416b-ad89-3ab128143b23	{"title":"Pexels Messalaciulla 914381","filename_download":"pexels-messalaciulla-914381.jpg","type":"image/jpeg","storage":"local"}	{"title":"Pexels Messalaciulla 914381","filename_download":"pexels-messalaciulla-914381.jpg","type":"image/jpeg","storage":"local"}	\N	\N
843	937	directus_files	dab41adf-1f8b-41c9-bd15-73e587a9a286	{"title":"Neil Mark Thomas Hg I Jfy Ea Qqq Unsplash","filename_download":"neil-mark-thomas-hgIJfyEaQQQ-unsplash.jpg","type":"image/jpeg","storage":"local"}	{"title":"Neil Mark Thomas Hg I Jfy Ea Qqq Unsplash","filename_download":"neil-mark-thomas-hgIJfyEaQQQ-unsplash.jpg","type":"image/jpeg","storage":"local"}	\N	\N
844	938	directus_files	f1418393-8118-4161-88f4-1df01313003a	{"title":"Jonatan Pie E Evyq Bbfeq Unsplash","filename_download":"jonatan-pie-E_evyqBBFEQ-unsplash.jpg","type":"image/jpeg","storage":"local"}	{"title":"Jonatan Pie E Evyq Bbfeq Unsplash","filename_download":"jonatan-pie-E_evyqBBFEQ-unsplash.jpg","type":"image/jpeg","storage":"local"}	\N	\N
850	945	directus_files	92bea263-2997-4b8a-b8a6-d920d8d9c895	{"title":"Pexels Sevenstormphotography 1479425","filename_download":"pexels-sevenstormphotography-1479425.jpg","type":"image/jpeg","storage":"local"}	{"title":"Pexels Sevenstormphotography 1479425","filename_download":"pexels-sevenstormphotography-1479425.jpg","type":"image/jpeg","storage":"local"}	\N	\N
851	946	directus_files	99b1444f-d6be-4731-a71e-1a091c5ec3fc	{"title":"Jonatan Pie E Evyq Bbfeq Unsplash","filename_download":"jonatan-pie-E_evyqBBFEQ-unsplash.jpg","type":"image/jpeg","storage":"local"}	{"title":"Jonatan Pie E Evyq Bbfeq Unsplash","filename_download":"jonatan-pie-E_evyqBBFEQ-unsplash.jpg","type":"image/jpeg","storage":"local"}	\N	\N
846	940	accessories_files	13	{"accessories_id":"2","directus_files_id":{"id":"dea5add6-517b-416b-ad89-3ab128143b23"}}	{"accessories_id":"2","directus_files_id":{"id":"dea5add6-517b-416b-ad89-3ab128143b23"}}	\N	\N
847	941	accessories_files	14	{"accessories_id":"2","directus_files_id":{"id":"f1418393-8118-4161-88f4-1df01313003a"}}	{"accessories_id":"2","directus_files_id":{"id":"f1418393-8118-4161-88f4-1df01313003a"}}	\N	\N
848	942	accessories_files	15	{"accessories_id":"2","directus_files_id":{"id":"baad0908-6731-47af-9a0b-71f1398a0502"}}	{"accessories_id":"2","directus_files_id":{"id":"baad0908-6731-47af-9a0b-71f1398a0502"}}	\N	\N
849	943	accessories_files	16	{"accessories_id":"2","directus_files_id":{"id":"dab41adf-1f8b-41c9-bd15-73e587a9a286"}}	{"accessories_id":"2","directus_files_id":{"id":"dab41adf-1f8b-41c9-bd15-73e587a9a286"}}	\N	\N
852	947	directus_files	8014f172-e017-4d41-9cde-c31ea0562ef3	{"title":"Cristian Grecu Ipckz 9z Dxy Unsplash","filename_download":"cristian-grecu-ipckz_9zDXY-unsplash.jpg","type":"image/jpeg","storage":"local"}	{"title":"Cristian Grecu Ipckz 9z Dxy Unsplash","filename_download":"cristian-grecu-ipckz_9zDXY-unsplash.jpg","type":"image/jpeg","storage":"local"}	\N	\N
854	949	accessories_files	17	{"accessories_id":"5","directus_files_id":{"id":"92bea263-2997-4b8a-b8a6-d920d8d9c895"}}	{"accessories_id":"5","directus_files_id":{"id":"92bea263-2997-4b8a-b8a6-d920d8d9c895"}}	\N	\N
855	950	accessories_files	18	{"accessories_id":"5","directus_files_id":{"id":"4dbb5c1e-c066-438f-a907-74d197b6df0e"}}	{"accessories_id":"5","directus_files_id":{"id":"4dbb5c1e-c066-438f-a907-74d197b6df0e"}}	\N	\N
856	951	accessories_files	19	{"accessories_id":"5","directus_files_id":{"id":"99b1444f-d6be-4731-a71e-1a091c5ec3fc"}}	{"accessories_id":"5","directus_files_id":{"id":"99b1444f-d6be-4731-a71e-1a091c5ec3fc"}}	\N	\N
857	952	accessories_files	20	{"accessories_id":"5","directus_files_id":{"id":"8014f172-e017-4d41-9cde-c31ea0562ef3"}}	{"accessories_id":"5","directus_files_id":{"id":"8014f172-e017-4d41-9cde-c31ea0562ef3"}}	\N	\N
862	959	accessories_files	25	{"accessories_id":"7","directus_files_id":{"id":"4dbb5c1e-c066-438f-a907-74d197b6df0e"}}	{"accessories_id":"7","directus_files_id":{"id":"4dbb5c1e-c066-438f-a907-74d197b6df0e"}}	\N	\N
863	960	accessories_files	26	{"accessories_id":"7","directus_files_id":{"id":"baad0908-6731-47af-9a0b-71f1398a0502"}}	{"accessories_id":"7","directus_files_id":{"id":"baad0908-6731-47af-9a0b-71f1398a0502"}}	\N	\N
871	971	accessories_files	34	{"accessories_id":"10","directus_files_id":{"id":"c70383cb-f76a-4eec-866f-2a22b593cc34"}}	{"accessories_id":"10","directus_files_id":{"id":"c70383cb-f76a-4eec-866f-2a22b593cc34"}}	\N	\N
872	972	accessories_files	35	{"accessories_id":"10","directus_files_id":{"id":"dab41adf-1f8b-41c9-bd15-73e587a9a286"}}	{"accessories_id":"10","directus_files_id":{"id":"dab41adf-1f8b-41c9-bd15-73e587a9a286"}}	\N	\N
853	948	directus_files	4dbb5c1e-c066-438f-a907-74d197b6df0e	{"title":"Pexels Messalaciulla 914381","filename_download":"pexels-messalaciulla-914381.jpg","type":"image/jpeg","storage":"local"}	{"title":"Pexels Messalaciulla 914381","filename_download":"pexels-messalaciulla-914381.jpg","type":"image/jpeg","storage":"local"}	\N	\N
858	954	accessories_files	21	{"accessories_id":"6","directus_files_id":{"id":"4dbb5c1e-c066-438f-a907-74d197b6df0e"}}	{"accessories_id":"6","directus_files_id":{"id":"4dbb5c1e-c066-438f-a907-74d197b6df0e"}}	\N	\N
859	955	accessories_files	22	{"accessories_id":"6","directus_files_id":{"id":"baad0908-6731-47af-9a0b-71f1398a0502"}}	{"accessories_id":"6","directus_files_id":{"id":"baad0908-6731-47af-9a0b-71f1398a0502"}}	\N	\N
860	956	accessories_files	23	{"accessories_id":"6","directus_files_id":{"id":"99b1444f-d6be-4731-a71e-1a091c5ec3fc"}}	{"accessories_id":"6","directus_files_id":{"id":"99b1444f-d6be-4731-a71e-1a091c5ec3fc"}}	\N	\N
861	957	accessories_files	24	{"accessories_id":"6","directus_files_id":{"id":"6bef1de6-3665-471c-ba4b-d32ed83ce9bc"}}	{"accessories_id":"6","directus_files_id":{"id":"6bef1de6-3665-471c-ba4b-d32ed83ce9bc"}}	\N	\N
864	962	accessories_files	27	{"accessories_id":"8","directus_files_id":{"id":"8014f172-e017-4d41-9cde-c31ea0562ef3"}}	{"accessories_id":"8","directus_files_id":{"id":"8014f172-e017-4d41-9cde-c31ea0562ef3"}}	\N	\N
865	963	accessories_files	28	{"accessories_id":"8","directus_files_id":{"id":"baad0908-6731-47af-9a0b-71f1398a0502"}}	{"accessories_id":"8","directus_files_id":{"id":"baad0908-6731-47af-9a0b-71f1398a0502"}}	\N	\N
866	964	accessories_files	29	{"accessories_id":"8","directus_files_id":{"id":"dab41adf-1f8b-41c9-bd15-73e587a9a286"}}	{"accessories_id":"8","directus_files_id":{"id":"dab41adf-1f8b-41c9-bd15-73e587a9a286"}}	\N	\N
867	966	accessories_files	30	{"accessories_id":"9","directus_files_id":{"id":"b05ce73f-b76f-4248-91b6-e71df2360d8f"}}	{"accessories_id":"9","directus_files_id":{"id":"b05ce73f-b76f-4248-91b6-e71df2360d8f"}}	\N	\N
868	967	accessories_files	31	{"accessories_id":"9","directus_files_id":{"id":"6bef1de6-3665-471c-ba4b-d32ed83ce9bc"}}	{"accessories_id":"9","directus_files_id":{"id":"6bef1de6-3665-471c-ba4b-d32ed83ce9bc"}}	\N	\N
869	968	accessories_files	32	{"accessories_id":"9","directus_files_id":{"id":"cb8682cd-b80d-4658-895d-f47dc8a9c23a"}}	{"accessories_id":"9","directus_files_id":{"id":"cb8682cd-b80d-4658-895d-f47dc8a9c23a"}}	\N	\N
870	969	accessories_files	33	{"accessories_id":"9","directus_files_id":{"id":"f7260eca-814a-44f4-8ea3-0f875b0f97b1"}}	{"accessories_id":"9","directus_files_id":{"id":"f7260eca-814a-44f4-8ea3-0f875b0f97b1"}}	\N	\N
873	974	accessories_files	36	{"accessories_id":"11","directus_files_id":{"id":"6bef1de6-3665-471c-ba4b-d32ed83ce9bc"}}	{"accessories_id":"11","directus_files_id":{"id":"6bef1de6-3665-471c-ba4b-d32ed83ce9bc"}}	\N	\N
874	975	accessories_files	37	{"accessories_id":"11","directus_files_id":{"id":"92bea263-2997-4b8a-b8a6-d920d8d9c895"}}	{"accessories_id":"11","directus_files_id":{"id":"92bea263-2997-4b8a-b8a6-d920d8d9c895"}}	\N	\N
875	976	accessories_files	38	{"accessories_id":"11","directus_files_id":{"id":"99b1444f-d6be-4731-a71e-1a091c5ec3fc"}}	{"accessories_id":"11","directus_files_id":{"id":"99b1444f-d6be-4731-a71e-1a091c5ec3fc"}}	\N	\N
\.


--
-- Data for Name: directus_roles; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_roles (id, name, icon, description, parent) FROM stdin;
bf6d7676-be1a-4615-a5d8-71760789aa47	Administrator	verified	$t:admin_description	\N
\.


--
-- Data for Name: directus_sessions; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_sessions (token, "user", expires, ip, user_agent, share, origin, next_token) FROM stdin;
ugDH5Hs_FErl0S-T58xurr_X6UfWlzxOb3rBQKkK94o_hMwFQpjxBgwJmJJ4mCmW	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-10 17:55:34.151+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	\N	http://localhost:8055	OZF2NXswA9cg94YAOy1d4mGwb3u2GKK0lWfgsgabXaxjvIbDXgxXs1cPReBwhVhz
OZF2NXswA9cg94YAOy1d4mGwb3u2GKK0lWfgsgabXaxjvIbDXgxXs1cPReBwhVhz	10c73097-e1f9-4f52-9007-ac783d8d74e9	2025-01-11 17:55:24.151+00	172.18.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	\N	http://localhost:8055	\N
\.


--
-- Data for Name: directus_settings; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_settings (id, project_name, project_url, project_color, project_logo, public_foreground, public_background, public_note, auth_login_attempts, auth_password_policy, storage_asset_transform, storage_asset_presets, custom_css, storage_default_folder, basemaps, mapbox_key, module_bar, project_descriptor, default_language, custom_aspect_ratios, public_favicon, default_appearance, default_theme_light, theme_light_overrides, default_theme_dark, theme_dark_overrides, report_error_url, report_bug_url, report_feature_url, public_registration, public_registration_verify_email, public_registration_role, public_registration_email_filter) FROM stdin;
\.


--
-- Data for Name: directus_shares; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_shares (id, name, collection, item, role, password, user_created, date_created, date_start, date_end, times_used, max_uses) FROM stdin;
\.


--
-- Data for Name: directus_translations; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_translations (id, language, key, value) FROM stdin;
\.


--
-- Data for Name: directus_users; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_users (id, first_name, last_name, email, password, location, title, description, tags, avatar, language, tfa_secret, status, role, token, last_access, last_page, provider, external_identifier, auth_data, email_notifications, appearance, theme_dark, theme_light, theme_light_overrides, theme_dark_overrides) FROM stdin;
10c73097-e1f9-4f52-9007-ac783d8d74e9	Admin	User	admin@example.com	$argon2id$v=19$m=65536,t=3,p=4$mfHmHKzpGUXB5M0HSYwyDw$Fea/Hj6pCnN6k0Z2UXv0TIpzBEuh6cRi0atCdt/bVn0	\N	\N	\N	\N	\N	\N	\N	active	bf6d7676-be1a-4615-a5d8-71760789aa47	\N	2025-01-10 17:55:24.169+00	/content/accessories	default	\N	\N	t	\N	\N	\N	\N	\N
\.


--
-- Data for Name: directus_versions; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_versions (id, key, name, collection, item, hash, date_created, date_updated, user_created, user_updated, delta) FROM stdin;
\.


--
-- Data for Name: directus_webhooks; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_webhooks (id, name, method, url, status, data, actions, collections, headers, was_active_before_deprecation, migrated_flow) FROM stdin;
\.


--
-- Data for Name: feature_section; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.feature_section (id, heading, bg_img) FROM stdin;
1	[{"heading":"modules","sub_heading":"Lorem ipsum title.","description":"Ullamcorper laoreet quis auctor tempor nisl auctor. Facilisi et purus vitae sed. Urna pellentesque ac justo dictumst egestas pellentesque maecenas "}]	9e292dff-6889-445a-a930-76bc403b725b
\.


--
-- Data for Name: footer; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.footer (id, category, social_icons) FROM stdin;
1	[{"name":"Products","options":[{"name":"220MP","slug":"220-mp"},{"name":"Accessories","slug":"accessories"},{"name":"Consumables","slug":"consumables"}]},{"name":"Support","options":[{"name":"Order Tracking","slug":"order-tracking"},{"name":"FAQs","slug":"faqs"}]},{"name":"Privacy & Terms","options":[{"name":"Terms of Use","slug":"terms-of-use"},{"name":"Privacy Policy","slug":"privacy-policy"},{"name":"Return & Refund Policy","slug":"return-refund-policy"},{"name":"Compliance Statement","slug":"compliance-statement"},{"name":"Other Policies","slug":"other-policies"}]},{"name":"Company","options":[{"name":"About Us","slug":"about-us"},{"name":"Contact Us","slug":"contact-us"}]}]	[{"name":"Instagram","link":"instagram.com","icon":{"key":4,"collection":"footer_social_icons"}},{"name":"facebook","link":"facebook.com","icon":{"key":3,"collection":"footer_social_icons"}},{"name":"tik-tok","link":"tik-tok.com","icon":{"key":2,"collection":"footer_social_icons"}},{"name":"youtube","link":"youtube.com","icon":{"key":1,"collection":"footer_social_icons"}}]
\.


--
-- Data for Name: footer_files; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.footer_files (id, footer_id, directus_files_id) FROM stdin;
1	\N	562fdc17-cf8c-415c-827c-9977c84d8dba
2	\N	c84e680e-64b7-4dfd-8113-265b3985feb2
3	\N	9eb924c9-09eb-435a-bb4e-b3d9078573b0
4	\N	ad3bf48d-0a62-4391-ade8-59a7b3c86c0b
5	\N	7bcea581-1f8a-4c05-9255-7b103587f32b
6	\N	8e8d0df1-c31d-4606-9c22-385b01a0f528
7	\N	908752e2-dbdf-48d7-8d11-f0d2821d238e
8	\N	943c1113-90ac-4030-9226-f50f4f7590f5
9	1	e6d19d80-da1a-4176-9d4e-13d0dc4501c7
10	1	32991033-7c21-48e3-b17a-116f1f124dbc
12	1	186c34a8-1848-48c0-b470-363eec7099d4
13	1	e3bf3998-03f2-4e7f-b165-5bc99f640e78
14	1	26676457-a204-4b32-b2c5-0c56f5ff6aa8
15	1	ffa48906-4187-495e-8cb8-d4e3da720d8e
16	1	023d05b1-81b5-45e6-9e30-83713d86f370
11	\N	7cc48476-1d9f-4a50-a628-e44448e4d0a7
17	1	b65b8bfb-13fb-4f9c-af0f-dfcf68600d3c
\.


--
-- Data for Name: footer_social_icons; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.footer_social_icons (id, image) FROM stdin;
1	4c2e15a6-b9bb-4cb7-b565-82daff0d1b10
2	a3a41661-38b3-4cd2-883f-bae5d89b4d15
3	6568ed47-6d94-4f5b-8f3b-c09fa1a25f36
4	3329912f-e82c-4f2c-8417-7e26a0e307da
\.


--
-- Data for Name: header; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.header (id, title, slug) FROM stdin;
1	200 MP	200-mp
2	Accessories	accessories
3	Consumables	consumables
4	Company	company
\.


--
-- Data for Name: hero_section; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.hero_section (id, sort, bg_img, heading, sub_heading, button_text, "Lists") FROM stdin;
1	\N	b65a1efc-d3f1-4718-835a-68a42332f4d4	MAVOK 230MP	A new era of welding innovation and performance starts now.	[{"text":"Shop Now","link":"accessories"}]	[{"title":"10a/15A","sub_title":"Dual Input"},{"title":"Single & Double","sub_title":"Pulse MIG"},{"title":"AC/DC","sub_title":"High Frequency TIG"},{"title":"Pilot Arc","sub_title":"Plasma Cutting"},{"title":"7” LCD","sub_title":"Touch Screen"}]
\.


--
-- Data for Name: spatial_ref_sys; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.spatial_ref_sys (srid, auth_name, auth_srid, srtext, proj4text) FROM stdin;
\.


--
-- Data for Name: geocode_settings; Type: TABLE DATA; Schema: tiger; Owner: directus
--

COPY tiger.geocode_settings (name, setting, unit, category, short_desc) FROM stdin;
\.


--
-- Data for Name: pagc_gaz; Type: TABLE DATA; Schema: tiger; Owner: directus
--

COPY tiger.pagc_gaz (id, seq, word, stdword, token, is_custom) FROM stdin;
\.


--
-- Data for Name: pagc_lex; Type: TABLE DATA; Schema: tiger; Owner: directus
--

COPY tiger.pagc_lex (id, seq, word, stdword, token, is_custom) FROM stdin;
\.


--
-- Data for Name: pagc_rules; Type: TABLE DATA; Schema: tiger; Owner: directus
--

COPY tiger.pagc_rules (id, rule, is_custom) FROM stdin;
\.


--
-- Data for Name: topology; Type: TABLE DATA; Schema: topology; Owner: directus
--

COPY topology.topology (id, name, srid, "precision", hasz) FROM stdin;
\.


--
-- Data for Name: layer; Type: TABLE DATA; Schema: topology; Owner: directus
--

COPY topology.layer (topology_id, layer_id, schema_name, table_name, feature_column, feature_type, level, child_id) FROM stdin;
\.


--
-- Name: accessories_files_id_seq; Type: SEQUENCE SET; Schema: public; Owner: directus
--

SELECT pg_catalog.setval('public.accessories_files_id_seq', 38, true);


--
-- Name: accessories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: directus
--

SELECT pg_catalog.setval('public.accessories_id_seq', 11, true);


--
-- Name: accessories_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: directus
--

SELECT pg_catalog.setval('public.accessories_type_id_seq', 3, true);


--
-- Name: directus_activity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: directus
--

SELECT pg_catalog.setval('public.directus_activity_id_seq', 977, true);


--
-- Name: directus_fields_id_seq; Type: SEQUENCE SET; Schema: public; Owner: directus
--

SELECT pg_catalog.setval('public.directus_fields_id_seq', 157, true);


--
-- Name: directus_notifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: directus
--

SELECT pg_catalog.setval('public.directus_notifications_id_seq', 1, false);


--
-- Name: directus_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: directus
--

SELECT pg_catalog.setval('public.directus_permissions_id_seq', 16, true);


--
-- Name: directus_presets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: directus
--

SELECT pg_catalog.setval('public.directus_presets_id_seq', 14, true);


--
-- Name: directus_relations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: directus
--

SELECT pg_catalog.setval('public.directus_relations_id_seq', 44, true);


--
-- Name: directus_revisions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: directus
--

SELECT pg_catalog.setval('public.directus_revisions_id_seq', 875, true);


--
-- Name: directus_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: directus
--

SELECT pg_catalog.setval('public.directus_settings_id_seq', 1, false);


--
-- Name: directus_webhooks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: directus
--

SELECT pg_catalog.setval('public.directus_webhooks_id_seq', 1, false);


--
-- Name: feature_section_id_seq; Type: SEQUENCE SET; Schema: public; Owner: directus
--

SELECT pg_catalog.setval('public.feature_section_id_seq', 1, true);


--
-- Name: footer_files_id_seq; Type: SEQUENCE SET; Schema: public; Owner: directus
--

SELECT pg_catalog.setval('public.footer_files_id_seq', 17, true);


--
-- Name: footer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: directus
--

SELECT pg_catalog.setval('public.footer_id_seq', 1, true);


--
-- Name: footer_social_icons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: directus
--

SELECT pg_catalog.setval('public.footer_social_icons_id_seq', 4, true);


--
-- Name: header_id_seq; Type: SEQUENCE SET; Schema: public; Owner: directus
--

SELECT pg_catalog.setval('public.header_id_seq', 4, true);


--
-- Name: hero_section_id_seq; Type: SEQUENCE SET; Schema: public; Owner: directus
--

SELECT pg_catalog.setval('public.hero_section_id_seq', 1, true);


--
-- Name: topology_id_seq; Type: SEQUENCE SET; Schema: topology; Owner: directus
--

SELECT pg_catalog.setval('topology.topology_id_seq', 1, false);


--
-- Name: accessories_files accessories_files_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.accessories_files
    ADD CONSTRAINT accessories_files_pkey PRIMARY KEY (id);


--
-- Name: accessories accessories_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.accessories
    ADD CONSTRAINT accessories_pkey PRIMARY KEY (id);


--
-- Name: accessories_type accessories_type_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.accessories_type
    ADD CONSTRAINT accessories_type_pkey PRIMARY KEY (id);


--
-- Name: directus_access directus_access_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_access
    ADD CONSTRAINT directus_access_pkey PRIMARY KEY (id);


--
-- Name: directus_activity directus_activity_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_activity
    ADD CONSTRAINT directus_activity_pkey PRIMARY KEY (id);


--
-- Name: directus_collections directus_collections_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_collections
    ADD CONSTRAINT directus_collections_pkey PRIMARY KEY (collection);


--
-- Name: directus_comments directus_comments_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_comments
    ADD CONSTRAINT directus_comments_pkey PRIMARY KEY (id);


--
-- Name: directus_dashboards directus_dashboards_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_dashboards
    ADD CONSTRAINT directus_dashboards_pkey PRIMARY KEY (id);


--
-- Name: directus_extensions directus_extensions_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_extensions
    ADD CONSTRAINT directus_extensions_pkey PRIMARY KEY (id);


--
-- Name: directus_fields directus_fields_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_fields
    ADD CONSTRAINT directus_fields_pkey PRIMARY KEY (id);


--
-- Name: directus_files directus_files_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_files
    ADD CONSTRAINT directus_files_pkey PRIMARY KEY (id);


--
-- Name: directus_flows directus_flows_operation_unique; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_flows
    ADD CONSTRAINT directus_flows_operation_unique UNIQUE (operation);


--
-- Name: directus_flows directus_flows_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_flows
    ADD CONSTRAINT directus_flows_pkey PRIMARY KEY (id);


--
-- Name: directus_folders directus_folders_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_folders
    ADD CONSTRAINT directus_folders_pkey PRIMARY KEY (id);


--
-- Name: directus_migrations directus_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_migrations
    ADD CONSTRAINT directus_migrations_pkey PRIMARY KEY (version);


--
-- Name: directus_notifications directus_notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_notifications
    ADD CONSTRAINT directus_notifications_pkey PRIMARY KEY (id);


--
-- Name: directus_operations directus_operations_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_pkey PRIMARY KEY (id);


--
-- Name: directus_operations directus_operations_reject_unique; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_reject_unique UNIQUE (reject);


--
-- Name: directus_operations directus_operations_resolve_unique; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_resolve_unique UNIQUE (resolve);


--
-- Name: directus_panels directus_panels_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_panels
    ADD CONSTRAINT directus_panels_pkey PRIMARY KEY (id);


--
-- Name: directus_permissions directus_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_permissions
    ADD CONSTRAINT directus_permissions_pkey PRIMARY KEY (id);


--
-- Name: directus_policies directus_policies_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_policies
    ADD CONSTRAINT directus_policies_pkey PRIMARY KEY (id);


--
-- Name: directus_presets directus_presets_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_presets
    ADD CONSTRAINT directus_presets_pkey PRIMARY KEY (id);


--
-- Name: directus_relations directus_relations_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_relations
    ADD CONSTRAINT directus_relations_pkey PRIMARY KEY (id);


--
-- Name: directus_revisions directus_revisions_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_revisions
    ADD CONSTRAINT directus_revisions_pkey PRIMARY KEY (id);


--
-- Name: directus_roles directus_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_roles
    ADD CONSTRAINT directus_roles_pkey PRIMARY KEY (id);


--
-- Name: directus_sessions directus_sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_sessions
    ADD CONSTRAINT directus_sessions_pkey PRIMARY KEY (token);


--
-- Name: directus_settings directus_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_pkey PRIMARY KEY (id);


--
-- Name: directus_shares directus_shares_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_shares
    ADD CONSTRAINT directus_shares_pkey PRIMARY KEY (id);


--
-- Name: directus_translations directus_translations_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_translations
    ADD CONSTRAINT directus_translations_pkey PRIMARY KEY (id);


--
-- Name: directus_users directus_users_email_unique; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_email_unique UNIQUE (email);


--
-- Name: directus_users directus_users_external_identifier_unique; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_external_identifier_unique UNIQUE (external_identifier);


--
-- Name: directus_users directus_users_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_pkey PRIMARY KEY (id);


--
-- Name: directus_users directus_users_token_unique; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_token_unique UNIQUE (token);


--
-- Name: directus_versions directus_versions_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_versions
    ADD CONSTRAINT directus_versions_pkey PRIMARY KEY (id);


--
-- Name: directus_webhooks directus_webhooks_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_webhooks
    ADD CONSTRAINT directus_webhooks_pkey PRIMARY KEY (id);


--
-- Name: feature_section feature_section_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.feature_section
    ADD CONSTRAINT feature_section_pkey PRIMARY KEY (id);


--
-- Name: footer_files footer_files_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.footer_files
    ADD CONSTRAINT footer_files_pkey PRIMARY KEY (id);


--
-- Name: footer footer_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.footer
    ADD CONSTRAINT footer_pkey PRIMARY KEY (id);


--
-- Name: footer_social_icons footer_social_icons_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.footer_social_icons
    ADD CONSTRAINT footer_social_icons_pkey PRIMARY KEY (id);


--
-- Name: header header_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.header
    ADD CONSTRAINT header_pkey PRIMARY KEY (id);


--
-- Name: hero_section hero_section_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.hero_section
    ADD CONSTRAINT hero_section_pkey PRIMARY KEY (id);


--
-- Name: accessories_files accessories_files_accessories_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.accessories_files
    ADD CONSTRAINT accessories_files_accessories_id_foreign FOREIGN KEY (accessories_id) REFERENCES public.accessories(id) ON DELETE SET NULL;


--
-- Name: accessories_files accessories_files_directus_files_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.accessories_files
    ADD CONSTRAINT accessories_files_directus_files_id_foreign FOREIGN KEY (directus_files_id) REFERENCES public.directus_files(id) ON DELETE SET NULL;


--
-- Name: accessories accessories_main_image_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.accessories
    ADD CONSTRAINT accessories_main_image_foreign FOREIGN KEY (main_image) REFERENCES public.directus_files(id) ON DELETE SET NULL;


--
-- Name: accessories accessories_type_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.accessories
    ADD CONSTRAINT accessories_type_foreign FOREIGN KEY (type) REFERENCES public.accessories_type(id) ON DELETE SET NULL;


--
-- Name: accessories_type accessories_type_image_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.accessories_type
    ADD CONSTRAINT accessories_type_image_foreign FOREIGN KEY (image) REFERENCES public.directus_files(id) ON DELETE SET NULL;


--
-- Name: directus_access directus_access_policy_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_access
    ADD CONSTRAINT directus_access_policy_foreign FOREIGN KEY (policy) REFERENCES public.directus_policies(id) ON DELETE CASCADE;


--
-- Name: directus_access directus_access_role_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_access
    ADD CONSTRAINT directus_access_role_foreign FOREIGN KEY (role) REFERENCES public.directus_roles(id) ON DELETE CASCADE;


--
-- Name: directus_access directus_access_user_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_access
    ADD CONSTRAINT directus_access_user_foreign FOREIGN KEY ("user") REFERENCES public.directus_users(id) ON DELETE CASCADE;


--
-- Name: directus_collections directus_collections_group_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_collections
    ADD CONSTRAINT directus_collections_group_foreign FOREIGN KEY ("group") REFERENCES public.directus_collections(collection);


--
-- Name: directus_comments directus_comments_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_comments
    ADD CONSTRAINT directus_comments_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- Name: directus_comments directus_comments_user_updated_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_comments
    ADD CONSTRAINT directus_comments_user_updated_foreign FOREIGN KEY (user_updated) REFERENCES public.directus_users(id);


--
-- Name: directus_dashboards directus_dashboards_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_dashboards
    ADD CONSTRAINT directus_dashboards_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- Name: directus_files directus_files_folder_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_files
    ADD CONSTRAINT directus_files_folder_foreign FOREIGN KEY (folder) REFERENCES public.directus_folders(id) ON DELETE SET NULL;


--
-- Name: directus_files directus_files_modified_by_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_files
    ADD CONSTRAINT directus_files_modified_by_foreign FOREIGN KEY (modified_by) REFERENCES public.directus_users(id);


--
-- Name: directus_files directus_files_uploaded_by_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_files
    ADD CONSTRAINT directus_files_uploaded_by_foreign FOREIGN KEY (uploaded_by) REFERENCES public.directus_users(id);


--
-- Name: directus_flows directus_flows_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_flows
    ADD CONSTRAINT directus_flows_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- Name: directus_folders directus_folders_parent_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_folders
    ADD CONSTRAINT directus_folders_parent_foreign FOREIGN KEY (parent) REFERENCES public.directus_folders(id);


--
-- Name: directus_notifications directus_notifications_recipient_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_notifications
    ADD CONSTRAINT directus_notifications_recipient_foreign FOREIGN KEY (recipient) REFERENCES public.directus_users(id) ON DELETE CASCADE;


--
-- Name: directus_notifications directus_notifications_sender_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_notifications
    ADD CONSTRAINT directus_notifications_sender_foreign FOREIGN KEY (sender) REFERENCES public.directus_users(id);


--
-- Name: directus_operations directus_operations_flow_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_flow_foreign FOREIGN KEY (flow) REFERENCES public.directus_flows(id) ON DELETE CASCADE;


--
-- Name: directus_operations directus_operations_reject_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_reject_foreign FOREIGN KEY (reject) REFERENCES public.directus_operations(id);


--
-- Name: directus_operations directus_operations_resolve_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_resolve_foreign FOREIGN KEY (resolve) REFERENCES public.directus_operations(id);


--
-- Name: directus_operations directus_operations_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- Name: directus_panels directus_panels_dashboard_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_panels
    ADD CONSTRAINT directus_panels_dashboard_foreign FOREIGN KEY (dashboard) REFERENCES public.directus_dashboards(id) ON DELETE CASCADE;


--
-- Name: directus_panels directus_panels_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_panels
    ADD CONSTRAINT directus_panels_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- Name: directus_permissions directus_permissions_policy_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_permissions
    ADD CONSTRAINT directus_permissions_policy_foreign FOREIGN KEY (policy) REFERENCES public.directus_policies(id) ON DELETE CASCADE;


--
-- Name: directus_presets directus_presets_role_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_presets
    ADD CONSTRAINT directus_presets_role_foreign FOREIGN KEY (role) REFERENCES public.directus_roles(id) ON DELETE CASCADE;


--
-- Name: directus_presets directus_presets_user_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_presets
    ADD CONSTRAINT directus_presets_user_foreign FOREIGN KEY ("user") REFERENCES public.directus_users(id) ON DELETE CASCADE;


--
-- Name: directus_revisions directus_revisions_activity_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_revisions
    ADD CONSTRAINT directus_revisions_activity_foreign FOREIGN KEY (activity) REFERENCES public.directus_activity(id) ON DELETE CASCADE;


--
-- Name: directus_revisions directus_revisions_parent_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_revisions
    ADD CONSTRAINT directus_revisions_parent_foreign FOREIGN KEY (parent) REFERENCES public.directus_revisions(id);


--
-- Name: directus_revisions directus_revisions_version_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_revisions
    ADD CONSTRAINT directus_revisions_version_foreign FOREIGN KEY (version) REFERENCES public.directus_versions(id) ON DELETE CASCADE;


--
-- Name: directus_roles directus_roles_parent_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_roles
    ADD CONSTRAINT directus_roles_parent_foreign FOREIGN KEY (parent) REFERENCES public.directus_roles(id);


--
-- Name: directus_sessions directus_sessions_share_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_sessions
    ADD CONSTRAINT directus_sessions_share_foreign FOREIGN KEY (share) REFERENCES public.directus_shares(id) ON DELETE CASCADE;


--
-- Name: directus_sessions directus_sessions_user_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_sessions
    ADD CONSTRAINT directus_sessions_user_foreign FOREIGN KEY ("user") REFERENCES public.directus_users(id) ON DELETE CASCADE;


--
-- Name: directus_settings directus_settings_project_logo_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_project_logo_foreign FOREIGN KEY (project_logo) REFERENCES public.directus_files(id);


--
-- Name: directus_settings directus_settings_public_background_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_public_background_foreign FOREIGN KEY (public_background) REFERENCES public.directus_files(id);


--
-- Name: directus_settings directus_settings_public_favicon_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_public_favicon_foreign FOREIGN KEY (public_favicon) REFERENCES public.directus_files(id);


--
-- Name: directus_settings directus_settings_public_foreground_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_public_foreground_foreign FOREIGN KEY (public_foreground) REFERENCES public.directus_files(id);


--
-- Name: directus_settings directus_settings_public_registration_role_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_public_registration_role_foreign FOREIGN KEY (public_registration_role) REFERENCES public.directus_roles(id) ON DELETE SET NULL;


--
-- Name: directus_settings directus_settings_storage_default_folder_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_storage_default_folder_foreign FOREIGN KEY (storage_default_folder) REFERENCES public.directus_folders(id) ON DELETE SET NULL;


--
-- Name: directus_shares directus_shares_collection_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_shares
    ADD CONSTRAINT directus_shares_collection_foreign FOREIGN KEY (collection) REFERENCES public.directus_collections(collection) ON DELETE CASCADE;


--
-- Name: directus_shares directus_shares_role_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_shares
    ADD CONSTRAINT directus_shares_role_foreign FOREIGN KEY (role) REFERENCES public.directus_roles(id) ON DELETE CASCADE;


--
-- Name: directus_shares directus_shares_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_shares
    ADD CONSTRAINT directus_shares_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- Name: directus_users directus_users_role_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_role_foreign FOREIGN KEY (role) REFERENCES public.directus_roles(id) ON DELETE SET NULL;


--
-- Name: directus_versions directus_versions_collection_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_versions
    ADD CONSTRAINT directus_versions_collection_foreign FOREIGN KEY (collection) REFERENCES public.directus_collections(collection) ON DELETE CASCADE;


--
-- Name: directus_versions directus_versions_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_versions
    ADD CONSTRAINT directus_versions_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- Name: directus_versions directus_versions_user_updated_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_versions
    ADD CONSTRAINT directus_versions_user_updated_foreign FOREIGN KEY (user_updated) REFERENCES public.directus_users(id);


--
-- Name: directus_webhooks directus_webhooks_migrated_flow_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_webhooks
    ADD CONSTRAINT directus_webhooks_migrated_flow_foreign FOREIGN KEY (migrated_flow) REFERENCES public.directus_flows(id) ON DELETE SET NULL;


--
-- Name: feature_section feature_section_bg_img_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.feature_section
    ADD CONSTRAINT feature_section_bg_img_foreign FOREIGN KEY (bg_img) REFERENCES public.directus_files(id) ON DELETE SET NULL;


--
-- Name: footer_files footer_files_directus_files_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.footer_files
    ADD CONSTRAINT footer_files_directus_files_id_foreign FOREIGN KEY (directus_files_id) REFERENCES public.directus_files(id) ON DELETE SET NULL;


--
-- Name: footer_files footer_files_footer_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.footer_files
    ADD CONSTRAINT footer_files_footer_id_foreign FOREIGN KEY (footer_id) REFERENCES public.footer(id) ON DELETE SET NULL;


--
-- Name: footer_social_icons footer_social_icons_image_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.footer_social_icons
    ADD CONSTRAINT footer_social_icons_image_foreign FOREIGN KEY (image) REFERENCES public.directus_files(id) ON DELETE SET NULL;


--
-- Name: hero_section hero_section_bg_img_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.hero_section
    ADD CONSTRAINT hero_section_bg_img_foreign FOREIGN KEY (bg_img) REFERENCES public.directus_files(id) ON DELETE SET NULL;


--
-- PostgreSQL database dump complete
--

