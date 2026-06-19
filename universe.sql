--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
    name character varying(30) NOT NULL,
    description text,
    galaxy_types_id integer NOT NULL,
    age_in_millions_of_years integer,
    distance_from_earth numeric
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
-- Name: galaxy_types; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_types (
    galaxy_types_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text
);


ALTER TABLE public.galaxy_types OWNER TO freecodecamp;

--
-- Name: galaxy_types_galaxy_types_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_types_galaxy_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_types_galaxy_types_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_types_galaxy_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_types_galaxy_types_id_seq OWNED BY public.galaxy_types.galaxy_types_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    planet_id integer NOT NULL,
    is_spherical boolean,
    age_in_millions_of_years integer,
    distance_from_earth numeric
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
    name character varying(30) NOT NULL,
    description text,
    star_id integer,
    planet_types_id integer NOT NULL,
    has_life boolean,
    is_spherical boolean,
    age_in_millions_of_years integer,
    distance_from_earth numeric
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
-- Name: planet_types; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_types (
    planet_types_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text
);


ALTER TABLE public.planet_types OWNER TO freecodecamp;

--
-- Name: planet_types_planet_types_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_types_planet_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_types_planet_types_id_seq OWNER TO freecodecamp;

--
-- Name: planet_types_planet_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_types_planet_types_id_seq OWNED BY public.planet_types.planet_types_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    galaxy_id integer,
    is_spherical boolean,
    age_in_millions_of_years integer,
    distance_from_earth numeric
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
-- Name: galaxy_types galaxy_types_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types ALTER COLUMN galaxy_types_id SET DEFAULT nextval('public.galaxy_types_galaxy_types_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: planet_types planet_types_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types ALTER COLUMN planet_types_id SET DEFAULT nextval('public.planet_types_planet_types_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our home galaxy, a barred spiral', 1, 13600, 0);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Nearest major spiral galaxy', 1, 10000, 2537000);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Small spiral in the Local Group', 1, 12000, 2730000);
INSERT INTO public.galaxy VALUES (4, 'Centaurus A', 'Elliptical galaxy with a prominent dust lane', 2, 11000, 13700000);
INSERT INTO public.galaxy VALUES (5, 'Large Magellanic Cloud', 'Irregular satellite of the Milky Way', 3, 11000, 163000);
INSERT INTO public.galaxy VALUES (6, 'Small Magellanic Cloud', 'Smaller irregular satellite galaxy', 3, 11000, 200000);


--
-- Data for Name: galaxy_types; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_types VALUES (1, 'spiral', NULL);
INSERT INTO public.galaxy_types VALUES (2, 'elliptical', NULL);
INSERT INTO public.galaxy_types VALUES (3, 'irregular', NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 'Earths only natural satellite', 3, true, 4500, 0);
INSERT INTO public.moon VALUES (2, 'Phobos', 'Larger inner moon of Mars', 4, false, 4500, 0);
INSERT INTO public.moon VALUES (3, 'Deimos', 'Smaller outer moon of Mars', 4, false, 4500, 0);
INSERT INTO public.moon VALUES (4, 'Io', 'Volcanically active moon of Jupiter', 5, true, 4500, 0);
INSERT INTO public.moon VALUES (5, 'Europa', 'Icy moon with subsurface ocean', 5, true, 4500, 0);
INSERT INTO public.moon VALUES (6, 'Ganymede', 'Largest moon in the solar system', 5, true, 4500, 0);
INSERT INTO public.moon VALUES (7, 'Callisto', 'Heavily cratered outer Galilean moon', 5, true, 4500, 0);
INSERT INTO public.moon VALUES (8, 'Titan', 'Saturns largest moon with thick atmosphere', 6, true, 4500, 0);
INSERT INTO public.moon VALUES (9, 'Rhea', 'Second largest moon of Saturn', 6, true, 4500, 0);
INSERT INTO public.moon VALUES (10, 'Iapetus', 'Two-toned moon of Saturn', 6, true, 4500, 0);
INSERT INTO public.moon VALUES (11, 'Dione', 'Moon with bright wisps', 6, true, 4500, 0);
INSERT INTO public.moon VALUES (12, 'Tethys', 'Moon with Odysseus crater', 6, true, 4500, 0);
INSERT INTO public.moon VALUES (13, 'Enceladus', 'Icy moon with geysers', 6, true, 4500, 0);
INSERT INTO public.moon VALUES (14, 'Mimas', 'Moon resembling the Death Star', 6, false, 4500, 0);
INSERT INTO public.moon VALUES (15, 'Miranda', 'Uranian moon with patchwork terrain', 7, true, 4500, 0);
INSERT INTO public.moon VALUES (16, 'Ariel', 'Brightest moon of Uranus', 7, true, 4500, 0);
INSERT INTO public.moon VALUES (17, 'Umbriel', 'Dark surfaced Uranian moon', 7, true, 4500, 0);
INSERT INTO public.moon VALUES (18, 'Titania', 'Largest moon of Uranus', 7, true, 4500, 0);
INSERT INTO public.moon VALUES (19, 'Oberon', 'Outermost large moon of Uranus', 7, true, 4500, 0);
INSERT INTO public.moon VALUES (20, 'Triton', 'Neptunes largest moon with retrograde orbit', 8, true, 4500, 0);
INSERT INTO public.moon VALUES (21, 'Proteus', 'Irregularly shaped moon of Neptune', 8, false, 4500, 0);
INSERT INTO public.moon VALUES (22, 'Nereid', 'Moon with highly eccentric orbit', 8, false, 4500, 0);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'Innermost planet, heavily cratered', 1, 1, false, true, 4500, 0);
INSERT INTO public.planet VALUES (2, 'Venus', 'Hottest planet, thick atmosphere', 1, 1, false, true, 4500, 0);
INSERT INTO public.planet VALUES (3, 'Earth', 'Our home, the only known planet with life', 1, 1, true, true, 4500, 0);
INSERT INTO public.planet VALUES (4, 'Mars', 'The Red Planet, home to Olympus Mons', 1, 1, false, true, 4500, 0);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'Largest planet, Great Red Spot', 1, 2, false, true, 4500, 0);
INSERT INTO public.planet VALUES (6, 'Saturn', 'Famous for its stunning ring system', 1, 2, false, true, 4500, 0);
INSERT INTO public.planet VALUES (7, 'Uranus', 'Ice giant tilted on its side', 1, 3, false, true, 4500, 0);
INSERT INTO public.planet VALUES (8, 'Neptune', 'Windiest planet in the solar system', 1, 3, false, true, 4500, 0);
INSERT INTO public.planet VALUES (9, 'Proxima b', 'Exoplanet in the habitable zone of Proxima Centauri', 4, 1, false, true, 4850, 4.246);
INSERT INTO public.planet VALUES (10, 'Sirius Alpha I', 'Terrestrial planet in the Sirius system (fictional)', 2, 1, false, true, 240, 8.6);
INSERT INTO public.planet VALUES (11, 'Sirius Alpha II', 'Gas giant orbiting Sirius (fictional)', 2, 2, false, false, 240, 8.6);
INSERT INTO public.planet VALUES (12, 'Vega Prime', 'Fictional terrestrial world near Vega', 5, 1, false, true, 450, 25.04);


--
-- Data for Name: planet_types; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_types VALUES (1, 'terrestrial', NULL);
INSERT INTO public.planet_types VALUES (2, 'gas giant', NULL);
INSERT INTO public.planet_types VALUES (3, 'ice giant', NULL);
INSERT INTO public.planet_types VALUES (4, 'dwarf', NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'Our star, a G-type main sequence', 1, true, 4600, 0.00001581);
INSERT INTO public.star VALUES (2, 'Sirius', 'Brightest star in the night sky', 1, true, 242, 8.6);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 'Red supergiant in Orion', 1, true, 10, 642.5);
INSERT INTO public.star VALUES (4, 'Proxima Centauri', 'Closest known star to the Sun', 1, true, 4850, 4.246);
INSERT INTO public.star VALUES (5, 'Vega', 'Bright star in Lyra', 1, true, 455, 25.04);
INSERT INTO public.star VALUES (6, 'Andromeda-I', 'A star in the Andromeda galaxy', 2, true, 5000, 2537000);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: galaxy_types_galaxy_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_types_galaxy_types_id_seq', 3, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 22, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: planet_types_planet_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_types_planet_types_id_seq', 4, true);


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
-- Name: galaxy_types galaxy_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types
    ADD CONSTRAINT galaxy_types_pkey PRIMARY KEY (galaxy_types_id);


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
-- Name: planet_types planet_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types
    ADD CONSTRAINT planet_types_pkey PRIMARY KEY (planet_types_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy uq_galaxy_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT uq_galaxy_name UNIQUE (name);


--
-- Name: galaxy_types uq_galaxy_types_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types
    ADD CONSTRAINT uq_galaxy_types_name UNIQUE (name);


--
-- Name: moon uq_moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT uq_moon_name UNIQUE (name);


--
-- Name: planet uq_planet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT uq_planet_name UNIQUE (name);


--
-- Name: planet_types uq_planet_types_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types
    ADD CONSTRAINT uq_planet_types_name UNIQUE (name);


--
-- Name: star uq_star_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT uq_star_name UNIQUE (name);


--
-- Name: galaxy galaxy_galaxy_types_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_types_id_fkey FOREIGN KEY (galaxy_types_id) REFERENCES public.galaxy_types(galaxy_types_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_planet_types_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_types_id_fkey FOREIGN KEY (planet_types_id) REFERENCES public.planet_types(planet_types_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

