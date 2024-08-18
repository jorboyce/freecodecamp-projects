--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(45) NOT NULL,
    galactic_group text,
    galaxy_shape character varying(60),
    shift character varying(30)
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    planet_id integer NOT NULL,
    name character varying(60) NOT NULL,
    tidally_locked boolean,
    moon_type text,
    year_discovered integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    star_id integer NOT NULL,
    name character varying(60) NOT NULL,
    mass_earth_masses numeric(4,1),
    habitable_zone boolean,
    planet_type character varying(45),
    active_magnetosphere boolean,
    atmosphere_type text,
    number_of_moons integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: pulsar; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.pulsar (
    pulsar_id integer NOT NULL,
    galaxy_id integer,
    pulses_per_minute integer,
    included_on_voyager_disk boolean,
    distance_from_sol_parsecs numeric(10,2),
    name character varying(60) NOT NULL
);


ALTER TABLE public.pulsar OWNER TO freecodecamp;

--
-- Name: pulsar_pulsar_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.pulsar_pulsar_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pulsar_pulsar_id_seq OWNER TO freecodecamp;

--
-- Name: pulsar_pulsar_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.pulsar_pulsar_id_seq OWNED BY public.pulsar.pulsar_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    galaxy_id integer NOT NULL,
    name character varying(60) NOT NULL,
    morgan_keenan_class character varying(10),
    mass_solar_masses numeric(4,2),
    distance_from_sol_parsecs numeric(10,2),
    constellation text,
    on_main_sequence boolean
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: pulsar pulsar_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.pulsar ALTER COLUMN pulsar_id SET DEFAULT nextval('public.pulsar_pulsar_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (7, 'MGC+01-02-015', NULL, 'spiral', NULL);
INSERT INTO public.galaxy VALUES (4, 'Messier 86', 'Virgo Cluster', 'elliptical/lenticular', 'redshifted');
INSERT INTO public.galaxy VALUES (5, 'Maffei 1', 'IC 342/Maffei Group', 'elliptical', 'redshifted');
INSERT INTO public.galaxy VALUES (6, 'NGC 7319', 'Stephan''s Quintet', 'barred spiral', 'redshifted');
INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Local Group', 'barred spiral', 'blueshifted');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Local Group', 'barred spiral', 'blueshifted');
INSERT INTO public.galaxy VALUES (3, 'Large Magellanic Cloud', 'Local Group', 'dwarf Magellanic spiral', 'blueshifted');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 1, 'Luna', true, 'rocky planetoid', NULL);
INSERT INTO public.moon VALUES (3, 3, 'Io', true, 'rocky planetoid', 1610);
INSERT INTO public.moon VALUES (4, 3, 'Callisto', true, 'rocky/icy planetoid', 1610);
INSERT INTO public.moon VALUES (5, 3, 'Europa', true, 'rocky/icy planetoid', 1610);
INSERT INTO public.moon VALUES (6, 3, 'Ganymede', true, 'rocky/watery planetoid', 1610);
INSERT INTO public.moon VALUES (7, 4, 'Phobos', true, 'rocky asteroid', 1877);
INSERT INTO public.moon VALUES (8, 4, 'Deimos', true, 'rocky asteroid', 1877);
INSERT INTO public.moon VALUES (9, 3, 'Himalia', true, 'rocky asteroid', 1904);
INSERT INTO public.moon VALUES (10, 3, 'Amalthea', true, 'icy asteroid', 1892);
INSERT INTO public.moon VALUES (11, 5, 'Titan
', true, 'rocky/icy planetoid', 1655);
INSERT INTO public.moon VALUES (12, 5, 'Enceladus', true, 'rocky/icy planetoid', 1789);
INSERT INTO public.moon VALUES (13, 5, 'Tethys', true, 'icy planetoid', 1684);
INSERT INTO public.moon VALUES (14, 5, 'Dione', true, 'rocky/icy planetoid', 1684);
INSERT INTO public.moon VALUES (15, 5, 'Rhea', true, 'rocky/icy planetoid', 1684);
INSERT INTO public.moon VALUES (16, 5, 'Iapetus', true, 'rocky/icy planetoid', 1671);
INSERT INTO public.moon VALUES (17, 6, 'Miranda', true, 'rocky/icy planetoid', 1948);
INSERT INTO public.moon VALUES (18, 6, 'Ariel', true, 'rocky/icy planetoid', 1851);
INSERT INTO public.moon VALUES (19, 6, 'Umbriel', true, 'rocky/icy planetoid', 1851);
INSERT INTO public.moon VALUES (20, 6, 'Oberon', true, 'rocky/icy planetoid', 1787);
INSERT INTO public.moon VALUES (21, 6, 'Titania', true, 'rocky/icy planetoid', 1787);
INSERT INTO public.moon VALUES (22, 7, 'Triton', true, 'rocky/icy planetoid', 1846);
INSERT INTO public.moon VALUES (23, 7, 'Proteus', true, 'rocky asteroid', 1989);
INSERT INTO public.moon VALUES (24, 7, 'Nereid', NULL, NULL, 1989);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 1, 'Earth', 1.0, true, 'rocky', true, 'nitrogen/oxygen', NULL);
INSERT INTO public.planet VALUES (2, 1, 'Venus', 0.8, false, 'rocky', true, 'carbon dioxide', NULL);
INSERT INTO public.planet VALUES (4, 1, 'Mars', 0.1, true, 'rocky', false, 'carbon dioxide', NULL);
INSERT INTO public.planet VALUES (5, 1, 'Saturn', 95.2, false, 'gas giant', true, 'hydrogen', NULL);
INSERT INTO public.planet VALUES (6, 1, 'Uranus', 14.5, false, 'gas giant', true, 'hydrogen/helium', NULL);
INSERT INTO public.planet VALUES (7, 1, 'Neptune', 17.1, false, 'gas giant', true, 'hydrogen/helium', NULL);
INSERT INTO public.planet VALUES (8, 1, 'Mercury', 0.1, false, 'rocky', true, NULL, NULL);
INSERT INTO public.planet VALUES (9, 3, 'Gliese 581c', 6.8, false, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (10, 2, 'Tau Ceti e', 3.9, false, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (11, 2, 'Tau Ceti f', 3.9, true, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (12, 3, 'Gliese 581e', 2.5, false, 'rocky', NULL, NULL, NULL);
INSERT INTO public.planet VALUES (3, 1, 'Jupiter', 317.8, false, 'gas giant', true, 'hydrogen/helium', NULL);


--
-- Data for Name: pulsar; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.pulsar VALUES (1, 1, 44, true, 300.00, 'PSR B1919+21');
INSERT INTO public.pulsar VALUES (2, 1, NULL, true, 262.00, 'PSR B0950+08');
INSERT INTO public.pulsar VALUES (3, 1, 1020, false, 6400.00, 'PSR B1913+16');
INSERT INTO public.pulsar VALUES (5, 1, 38520, false, 3600.00, 'PSR B1937+21');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 1, 'Sol', 'G2V', 1.00, 0.00, NULL, true);
INSERT INTO public.star VALUES (2, 1, 'Tau Ceti', 'G8V', 0.69, 3.65, 'Cetus, the Whale', true);
INSERT INTO public.star VALUES (3, 1, 'Gliese 581', 'M3V', 0.30, 6.30, 'Libra, the Scales', true);
INSERT INTO public.star VALUES (4, 1, 'Polaris', 'F7Ib', 5.40, 116.00, 'Ursa Minor, the Little Bear', false);
INSERT INTO public.star VALUES (5, 1, 'Rigel', 'B8Ia', 21.00, 260.00, 'Orion, the Hunter', true);
INSERT INTO public.star VALUES (6, 1, 'van Maanen 2', 'DZ8', 0.67, 4.31, 'Pisces, the Fishes', false);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 24, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: pulsar_pulsar_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.pulsar_pulsar_id_seq', 5, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: pulsar pulsar_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.pulsar
    ADD CONSTRAINT pulsar_pkey PRIMARY KEY (pulsar_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: pulsar unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.pulsar
    ADD CONSTRAINT unique_name UNIQUE (name);


--
-- Name: galaxy unique_name_galaxy; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_name_galaxy UNIQUE (name);


--
-- Name: moon unique_name_moon; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_name_moon UNIQUE (name);


--
-- Name: planet unique_name_planet; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_name_planet UNIQUE (name);


--
-- Name: star unique_name_star; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_name_star UNIQUE (name);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: pulsar pulsar_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.pulsar
    ADD CONSTRAINT pulsar_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

