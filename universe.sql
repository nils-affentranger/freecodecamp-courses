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
    name character varying(100) NOT NULL,
    description text,
    is_in_asteroid_belt boolean NOT NULL,
    diameter_in_km numeric(7,3)
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    description text,
    name character varying(100) NOT NULL,
    diameter_in_ly integer,
    age integer
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
    name character varying(100) NOT NULL,
    diameter_in_km integer NOT NULL,
    description text,
    planet_id integer
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
    name character varying(100) NOT NULL,
    number_of_moons integer,
    description text,
    star_id integer
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
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(100) NOT NULL,
    luminosity numeric(10,2),
    description text,
    is_dead boolean NOT NULL,
    has_planetary_system boolean NOT NULL,
    galaxy_id integer
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
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


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
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'Ceres', 'The largest asteroid and a dwarf planet in the asteroid belt.', true, 946.000);
INSERT INTO public.asteroid VALUES (2, 'Vesta', 'The second-largest asteroid in the asteroid belt.', true, 525.400);
INSERT INTO public.asteroid VALUES (3, 'Pallas', 'An asteroid with a highly inclined orbit in the asteroid belt.', true, 512.000);
INSERT INTO public.asteroid VALUES (4, 'Hygiea', 'The fourth-largest asteroid in the asteroid belt.', true, 407.000);
INSERT INTO public.asteroid VALUES (5, 'Eunomia', 'An asteroid in the asteroid belt, a member of the Eunomia family.', true, 268.000);
INSERT INTO public.asteroid VALUES (6, 'Juno', 'An asteroid in the inner asteroid belt.', true, 233.000);
INSERT INTO public.asteroid VALUES (7, 'Euphrosyne', 'A dark asteroid in the outer asteroid belt.', true, 256.000);
INSERT INTO public.asteroid VALUES (8, 'Psyche', 'A metallic asteroid in the asteroid belt.', true, 226.000);
INSERT INTO public.asteroid VALUES (9, 'Davida', 'One of the largest asteroids in the asteroid belt.', true, 326.000);
INSERT INTO public.asteroid VALUES (10, 'Interamnia', 'A large asteroid in the asteroid belt.', true, 306.000);
INSERT INTO public.asteroid VALUES (11, 'Apophis', 'A near-Earth asteroid with a small chance of collision with Earth.', false, 0.370);
INSERT INTO public.asteroid VALUES (12, 'Bennu', 'A near-Earth asteroid visited by the OSIRIS-REx spacecraft.', false, 0.490);
INSERT INTO public.asteroid VALUES (13, 'Eros', 'A near-Earth asteroid visited by the NEAR Shoemaker spacecraft.', false, 10.400);
INSERT INTO public.asteroid VALUES (14, 'Itokawa', 'A near-Earth asteroid studied by the Hayabusa mission.', false, 0.320);
INSERT INTO public.asteroid VALUES (15, 'Toutatis', 'A near-Earth asteroid with a highly irregular shape.', false, 2.800);
INSERT INTO public.asteroid VALUES (16, 'Hektor', 'A Trojan asteroid associated with Jupiter.', false, 225.000);
INSERT INTO public.asteroid VALUES (17, 'Patroclus', 'A binary Trojan asteroid associated with Jupiter.', false, 140.000);
INSERT INTO public.asteroid VALUES (18, 'Eurydamas', 'A Jupiter Trojan asteroid.', false, 80.000);
INSERT INTO public.asteroid VALUES (19, 'Ryugu', 'A near-Earth asteroid studied by the Hayabusa2 mission.', false, 0.850);
INSERT INTO public.asteroid VALUES (20, 'Chiron', 'A centaur, part comet and part asteroid.', false, 166.000);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'The galaxy that contains our Solar System.', 'Milky Way', NULL, NULL);
INSERT INTO public.galaxy VALUES (2, 'A large spiral galaxy neighboring the Milky Way.', 'Andromeda', NULL, NULL);
INSERT INTO public.galaxy VALUES (3, 'A smaller spiral galaxy in the Local Group.', 'Triangulum', NULL, NULL);
INSERT INTO public.galaxy VALUES (4, 'A galaxy with a distinctive bright nucleus and dust lane.', 'Sombrero', NULL, NULL);
INSERT INTO public.galaxy VALUES (5, 'A classic spiral galaxy interacting with a smaller galaxy.', 'Whirlpool', NULL, NULL);
INSERT INTO public.galaxy VALUES (6, 'A peculiar galaxy with a supermassive black hole at its center.', 'Centaurus A', NULL, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3474, 'Earth’s only natural satellite.', 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 22, 'One of Mars’ irregularly shaped moons.', 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 12, 'The smaller and outer moon of Mars.', 4);
INSERT INTO public.moon VALUES (4, 'Ganymede', 5268, 'The largest moon in the Solar System.', 5);
INSERT INTO public.moon VALUES (5, 'Callisto', 4821, 'A heavily cratered moon of Jupiter.', 5);
INSERT INTO public.moon VALUES (6, 'Io', 3643, 'The most volcanically active body in the Solar System.', 5);
INSERT INTO public.moon VALUES (7, 'Europa', 3122, 'An icy moon with a subsurface ocean.', 5);
INSERT INTO public.moon VALUES (8, 'Titan', 5150, 'The second-largest moon in the Solar System.', 6);
INSERT INTO public.moon VALUES (9, 'Enceladus', 504, 'An icy moon with plumes of water vapor.', 6);
INSERT INTO public.moon VALUES (10, 'Mimas', 396, 'A moon with a large crater resembling the Death Star.', 6);
INSERT INTO public.moon VALUES (11, 'Titania', 1577, 'The largest moon of Uranus.', 7);
INSERT INTO public.moon VALUES (12, 'Oberon', 1523, 'The second-largest moon of Uranus.', 7);
INSERT INTO public.moon VALUES (13, 'Miranda', 471, 'A small moon with an unusual surface.', 7);
INSERT INTO public.moon VALUES (14, 'Triton', 2706, 'A retrograde orbit moon of Neptune.', 8);
INSERT INTO public.moon VALUES (15, 'Nereid', 340, 'A highly eccentric orbit moon of Neptune.', 8);
INSERT INTO public.moon VALUES (16, 'Proxima b Moon 1', 100, 'A hypothetical moon orbiting Proxima b.', 9);
INSERT INTO public.moon VALUES (17, 'Proxima b Moon 2', 80, 'Another possible moon of Proxima b.', 9);
INSERT INTO public.moon VALUES (18, 'Sirius b Moon 1', 50, 'A theoretical moon orbiting Sirius b.', 11);
INSERT INTO public.moon VALUES (19, 'Rigel b Moon 1', 200, 'A theoretical moon orbiting Rigel b.', 12);
INSERT INTO public.moon VALUES (20, 'Rigel b Moon 2', 150, 'Another theoretical moon of Rigel b.', 12);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 0, 'The smallest and closest planet to the Sun.', 1);
INSERT INTO public.planet VALUES (2, 'Venus', 0, 'A hot planet with a thick, toxic atmosphere.', 1);
INSERT INTO public.planet VALUES (3, 'Earth', 1, 'The only planet known to support life.', 1);
INSERT INTO public.planet VALUES (4, 'Mars', 2, 'Known as the Red Planet, it may have had water.', 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 79, 'The largest planet with a Great Red Spot.', 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 83, 'Famous for its extensive ring system.', 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 27, 'An ice giant with a tilted rotational axis.', 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 14, 'An ice giant with supersonic winds.', 1);
INSERT INTO public.planet VALUES (9, 'Proxima b', 0, 'A planet in the habitable zone of Proxima Centauri.', 4);
INSERT INTO public.planet VALUES (10, 'Betelgeuse b', NULL, 'A hypothetical planet orbiting Betelgeuse.', 2);
INSERT INTO public.planet VALUES (11, 'Sirius b', 0, 'A planet orbiting Sirius.', 3);
INSERT INTO public.planet VALUES (12, 'Rigel b', NULL, 'A theoretical planet orbiting the blue supergiant Rigel.', 5);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1.00, 'The star at the center of our Solar System.', false, true, 1);
INSERT INTO public.star VALUES (2, 'Betelgeuse', 120000.00, 'A red supergiant star in the Orion constellation.', false, false, 2);
INSERT INTO public.star VALUES (3, 'Sirius', 25.40, 'The brightest star in the night sky.', false, true, 1);
INSERT INTO public.star VALUES (4, 'Proxima Centauri', 0.00, 'The closest known star to the Sun.', false, true, 1);
INSERT INTO public.star VALUES (5, 'Rigel', 120000.00, 'A blue supergiant in the Orion constellation.', false, false, 2);
INSERT INTO public.star VALUES (6, 'Black Hole Remnant', NULL, 'A dead star that has collapsed into a black hole.', true, false, 3);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 20, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: asteroid asteroid_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_key UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


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
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

