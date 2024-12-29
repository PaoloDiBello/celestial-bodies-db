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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(255) NOT NULL,
    beltname character varying(255),
    orbitdistance numeric(10,2) NOT NULL,
    composition text
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroidid_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroidid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroidid_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroidid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroidid_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(255) NOT NULL,
    age numeric(10,2) NOT NULL,
    description text,
    type character varying(255),
    distance numeric(10,2)
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxyid_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxyid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxyid_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxyid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxyid_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(255) NOT NULL,
    planet_id integer NOT NULL,
    diameter numeric(8,2) NOT NULL,
    orbit_period numeric(8,2),
    surface_composition text
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moonid_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moonid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moonid_seq OWNER TO freecodecamp;

--
-- Name: moon_moonid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moonid_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(255) NOT NULL,
    star_id integer NOT NULL,
    mass integer NOT NULL,
    haslife boolean,
    radius numeric(10,2),
    atmosphere text
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planetid_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planetid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planetid_seq OWNER TO freecodecamp;

--
-- Name: planet_planetid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planetid_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(255) NOT NULL,
    galaxy_id integer NOT NULL,
    luminosity integer NOT NULL,
    ismainsequence boolean,
    age numeric(10,2),
    temperature integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_starid_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_starid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_starid_seq OWNER TO freecodecamp;

--
-- Name: star_starid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_starid_seq OWNED BY public.star.star_id;


--
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroidid_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxyid_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moonid_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planetid_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_starid_seq'::regclass);


--
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'Ceres', 'Asteroid Belt', 413.00, 'Rock and ice');
INSERT INTO public.asteroid VALUES (2, 'Vesta', 'Asteroid Belt', 353.00, 'Basaltic rock');
INSERT INTO public.asteroid VALUES (3, 'Pallas', 'Asteroid Belt', 414.00, 'Rock and ice');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 13.51, 'A barred spiral galaxy', 'Spiral', 0.00);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 10.00, 'The nearest spiral galaxy', 'Spiral', 2537000.00);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 4.00, 'A member of the Local Group', 'Spiral', 3000000.00);
INSERT INTO public.galaxy VALUES (4, 'Large Magellanic Cloud', 1.50, 'Satellite galaxy of the Milky Way', 'Irregular', 1630000.00);
INSERT INTO public.galaxy VALUES (5, 'Small Magellanic Cloud', 1.20, 'Satellite galaxy of the Milky Way', 'Irregular', 2000000.00);
INSERT INTO public.galaxy VALUES (6, 'Whirlpool Galaxy', 8.00, 'An interacting grand-design spiral galaxy', 'Spiral', 23000000.00);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, 3474.80, 27.30, 'Rock, dust');
INSERT INTO public.moon VALUES (2, 'Phobos', 2, 22.40, 7.66, 'Rocky, cratered surface');
INSERT INTO public.moon VALUES (3, 'Deimos', 2, 12.40, 30.30, 'Rocky, cratered surface');
INSERT INTO public.moon VALUES (4, 'Io', 3, 3643.20, 1.77, 'Volcanic rock, sulfur');
INSERT INTO public.moon VALUES (5, 'Europa', 3, 3121.60, 3.55, 'Ice and rocky material');
INSERT INTO public.moon VALUES (6, 'Ganymede', 3, 5262.40, 7.15, 'Ice and rock');
INSERT INTO public.moon VALUES (7, 'Callisto', 3, 4820.60, 16.69, 'Ice and rock');
INSERT INTO public.moon VALUES (8, 'Titan', 3, 5149.40, 15.95, 'Nitrogen, methane');
INSERT INTO public.moon VALUES (9, 'Rhea', 3, 1528.60, 4.52, 'Ice and rock');
INSERT INTO public.moon VALUES (10, 'Iapetus', 3, 1469.80, 79.32, 'Ice and rock');
INSERT INTO public.moon VALUES (11, 'Dione', 3, 1122.80, 2.74, 'Ice and rock');
INSERT INTO public.moon VALUES (12, 'Tethys', 3, 1062.20, 1.89, 'Ice and rock');
INSERT INTO public.moon VALUES (13, 'Enceladus', 3, 504.20, 1.37, 'Water ice, salt');
INSERT INTO public.moon VALUES (14, 'Mimas', 3, 396.40, 0.94, 'Ice and rock');
INSERT INTO public.moon VALUES (15, 'Oberon', 3, 1522.80, 13.46, 'Ice and rock');
INSERT INTO public.moon VALUES (16, 'Titania', 3, 1577.80, 8.71, 'Ice and rock');
INSERT INTO public.moon VALUES (17, 'Ariel', 3, 1158.80, 2.52, 'Ice and rock');
INSERT INTO public.moon VALUES (18, 'Umbriel', 3, 1169.20, 4.12, 'Ice and rock');
INSERT INTO public.moon VALUES (19, 'Miranda', 3, 471.60, 1.41, 'Ice and rock');
INSERT INTO public.moon VALUES (20, 'Triton', 3, 2706.80, 5.88, 'Ice and rock, nitrogen');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 1, true, 6371.00, 'Oxygen, nitrogen, carbon dioxide');
INSERT INTO public.planet VALUES (2, 'Mars', 1, 0, false, 3389.00, 'Carbon dioxide, nitrogen');
INSERT INTO public.planet VALUES (3, 'Jupiter', 1, 318, false, 69911.00, 'Hydrogen, helium');
INSERT INTO public.planet VALUES (4, 'Venus', 1, 1, false, 6051.00, 'Carbon dioxide, sulfuric acid');
INSERT INTO public.planet VALUES (5, 'Kepler-22b', 2, 2, false, 6100.00, 'Unknown');
INSERT INTO public.planet VALUES (6, 'Proxima b', 2, 1, false, 6371.00, 'Thin atmosphere with possible water vapor');
INSERT INTO public.planet VALUES (7, 'Gliese 581g', 2, 2, false, 6200.00, 'Possibly habitable');
INSERT INTO public.planet VALUES (8, 'HD 209458b', 2, 1, false, 12900.00, 'Hydrogen, helium');
INSERT INTO public.planet VALUES (9, 'GJ 1214b', 3, 7, false, 20000.00, 'Dense atmosphere');
INSERT INTO public.planet VALUES (10, 'Kepler-452b', 3, 5, false, 14000.00, 'Possible Earth-like conditions');
INSERT INTO public.planet VALUES (11, 'TRAPPIST-1e', 3, 1, false, 7300.00, 'Earth-like atmosphere');
INSERT INTO public.planet VALUES (12, 'TRAPPIST-1f', 3, 1, false, 7200.00, 'Earth-like atmosphere');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 1, true, 4.60, 5778);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 1, 0, true, 4.85, 3050);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 1, 1000, false, 10.00, 3500);
INSERT INTO public.star VALUES (4, 'Sirius', 2, 25, true, 0.25, 9940);
INSERT INTO public.star VALUES (5, 'Vega', 3, 37, true, 0.50, 9602);
INSERT INTO public.star VALUES (6, 'Alpha Centauri A', 1, 2, true, 5.00, 5790);


--
-- Name: asteroid_asteroidid_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroidid_seq', 3, true);


--
-- Name: galaxy_galaxyid_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxyid_seq', 6, true);


--
-- Name: moon_moonid_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moonid_seq', 20, true);


--
-- Name: planet_planetid_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planetid_seq', 12, true);


--
-- Name: star_starid_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_starid_seq', 6, true);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


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
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: asteroid unique_asteroid_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT unique_asteroid_name UNIQUE (name);


--
-- Name: galaxy unique_galaxy_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_galaxy_name UNIQUE (name);


--
-- Name: moon unique_moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon_name UNIQUE (name);


--
-- Name: planet unique_planet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet_name UNIQUE (name);


--
-- Name: star unique_star_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_name UNIQUE (name);


--
-- Name: moon moon_planetid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planetid_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id) ON DELETE CASCADE;


--
-- Name: planet planet_starid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_starid_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id) ON DELETE CASCADE;


--
-- Name: star star_galaxyid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxyid_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

