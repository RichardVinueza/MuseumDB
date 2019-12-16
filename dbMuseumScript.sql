-- Database: db_museum

-- DROP DATABASE db_museum;

CREATE DATABASE db_museum
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'English_United States.1252'
    LC_CTYPE = 'English_United States.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;
	
-- Table: public.users

-- DROP TABLE public.users;

CREATE TABLE public.users
(
    id_user integer NOT NULL DEFAULT nextval('users_id_user_seq'::regclass),
    full_name character varying(255) COLLATE pg_catalog."default",
    email character varying(255) COLLATE pg_catalog."default",
    nationality character varying(255) COLLATE pg_catalog."default",
    password character varying(255) COLLATE pg_catalog."default",
    admin boolean,
    CONSTRAINT users_pkey PRIMARY KEY (id_user)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.users
    OWNER to postgres;

-- Table: public.user_interactions

-- DROP TABLE public.user_interactions;

CREATE TABLE public.user_interactions
(
    usersid_user integer NOT NULL,
    beaconsid_beacon integer NOT NULL,
    date_interaction timestamp without time zone NOT NULL,
    CONSTRAINT user_interactions_pkey PRIMARY KEY (usersid_user, beaconsid_beacon, date_interaction),
    CONSTRAINT fkuser_inter43840 FOREIGN KEY (beaconsid_beacon)
        REFERENCES public.beacons (id_beacon) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT fkuser_inter487296 FOREIGN KEY (usersid_user)
        REFERENCES public.users (id_user) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.user_interactions
    OWNER to postgres;
	
-- Table: public.beacons

-- DROP TABLE public.beacons;

CREATE TABLE public.beacons
(
    id_beacon integer NOT NULL DEFAULT nextval('beacons_id_beacon_seq'::regclass),
    status boolean,
    expositionsid_exposition integer NOT NULL,
    CONSTRAINT beacons_pkey PRIMARY KEY (id_beacon),
    CONSTRAINT fkbeacons109578 FOREIGN KEY (expositionsid_exposition)
        REFERENCES public.expositions (id_exposition) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.beacons
    OWNER to postgres;
	
-- Table: public.expositions

-- DROP TABLE public.expositions;

CREATE TABLE public.expositions
(
    id_exposition integer NOT NULL DEFAULT nextval('expositions_id_exposition_seq'::regclass),
    name character varying(255) COLLATE pg_catalog."default",
    artworks_number integer,
    time_frame timestamp without time zone,
    CONSTRAINT expositions_pkey PRIMARY KEY (id_exposition)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.expositions
    OWNER to postgres;
	
-- Table: public.artworks

-- DROP TABLE public.artworks;

CREATE TABLE public.artworks
(
    id_artwork integer NOT NULL DEFAULT nextval('artworks_id_artwork_seq'::regclass),
    name character varying(255) COLLATE pg_catalog."default",
    author_full_name character varying(255) COLLATE pg_catalog."default",
    author_nationality character varying(255) COLLATE pg_catalog."default",
    category character varying(255) COLLATE pg_catalog."default",
    creation_date integer,
    creation_period character varying(255) COLLATE pg_catalog."default",
    expositionsid_exposition integer NOT NULL,
    image character varying(255) COLLATE pg_catalog."default",
    CONSTRAINT artworks_pkey PRIMARY KEY (id_artwork),
    CONSTRAINT fkartworks719482 FOREIGN KEY (expositionsid_exposition)
        REFERENCES public.expositions (id_exposition) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.artworks
    OWNER to postgres;
	
-- Table: public.resources

-- DROP TABLE public.resources;

CREATE TABLE public.resources
(
    id_resource integer NOT NULL DEFAULT nextval('resources_id_resource_seq'::regclass),
    type character varying(255) COLLATE pg_catalog."default",
    link character varying(255) COLLATE pg_catalog."default",
    expositionsid_exposition integer NOT NULL,
    artworksid_artwork integer NOT NULL,
    name character varying(255) COLLATE pg_catalog."default",
    CONSTRAINT resources_pkey PRIMARY KEY (id_resource),
    CONSTRAINT fkresources21393 FOREIGN KEY (artworksid_artwork)
        REFERENCES public.artworks (id_artwork) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT fkresources880640 FOREIGN KEY (expositionsid_exposition)
        REFERENCES public.expositions (id_exposition) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.resources
    OWNER to postgres;