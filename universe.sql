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
    size numeric,
    has_life boolean NOT NULL,
    has_definite_shape boolean,
    age_in_millions_of_years integer NOT NULL,
    mass_in_kg bigint,
    planet_id integer NOT NULL
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
    name character varying(100) NOT NULL,
    galaxy_type character varying(100),
    number_of_stars bigint,
    age_in_millions_of_years integer NOT NULL,
    description text,
    number_of_planets integer NOT NULL
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
    age_in_millions_of_years integer NOT NULL,
    is_spherical boolean,
    has_life boolean,
    mass_in_kg bigint,
    description text,
    planet_id integer NOT NULL
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
    distance_from_star bigint NOT NULL,
    mass integer,
    has_life boolean NOT NULL,
    description text,
    star_id integer NOT NULL,
    planet_temperature integer
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
    age_in_millions_of_years integer NOT NULL,
    description text,
    galaxy_id integer NOT NULL,
    number_of_planets_associated integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_start_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_start_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_start_id_seq OWNER TO freecodecamp;

--
-- Name: star_start_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_start_id_seq OWNED BY public.star.star_id;


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

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_start_id_seq'::regclass);


--
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'Ceres', 940, false, true, 4600, 9000000000000, 1);
INSERT INTO public.asteroid VALUES (2, 'Vesta', 525, false, true, 4600, 2600000000000, 2);
INSERT INTO public.asteroid VALUES (3, 'Pallas', 510, false, true, 4600, 1000000000000, 3);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 200000000000, 13600, 'Our home galaxy, containing the Solar System.', 8);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 1000000000000, 10000, 'Closest spiral galaxy to the Milky Way.', 14);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 40000000000, 12000, 'Part of the Local Group, smaller than Andromeda.', 3);
INSERT INTO public.galaxy VALUES (4, 'Messier 87', 'Elliptical', 2000000000000, 14000, 'A giant elliptical galaxy with a supermassive black hole.', 5);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 'Spiral', 100000000000, 400, 'A famous spiral galaxy interacting with a companion galaxy.', 2);
INSERT INTO public.galaxy VALUES (6, 'Sombrero', 'Spiral', 80000000000, 9000, 'A bright galaxy with a large central bulge, resembling a hat.', 4);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 4500, true, true, 734800000000000, 'Earth’s natural satellite, with a barren, rocky surface.', 1);
INSERT INTO public.moon VALUES (2, 'Phobos', 4600, true, false, 1000000000000, 'A small, irregularly shaped moon of Mars, with craters and grooves.', 2);
INSERT INTO public.moon VALUES (3, 'Deimos', 4600, true, false, 220000000000, 'The smaller and more distant moon of Mars, less cratered than Phobos.', 2);
INSERT INTO public.moon VALUES (4, 'Io', 4500, true, false, 899000000000, 'A volcanic moon of Jupiter, known for its active volcanism.', 3);
INSERT INTO public.moon VALUES (5, 'Europa', 4500, true, false, 480000000000, 'A moon of Jupiter with a possible subsurface ocean beneath its icy surface.', 3);
INSERT INTO public.moon VALUES (6, 'Ganymede', 4500, true, false, 1482000000000, 'The largest moon of Jupiter, larger than the planet Mercury.', 3);
INSERT INTO public.moon VALUES (7, 'Callisto', 4500, true, false, 1075900000000, 'The second largest moon of Jupiter, covered by ice and cratered.', 3);
INSERT INTO public.moon VALUES (8, 'Titan', 4500, true, false, 1355000000000, 'The largest moon of Saturn, with a thick atmosphere and lakes of methane.', 4);
INSERT INTO public.moon VALUES (9, 'Rhea', 4500, true, false, 232500000000, 'A large moon of Saturn, with a heavily cratered surface and thin atmosphere.', 4);
INSERT INTO public.moon VALUES (10, 'Iapetus', 4500, true, false, 181300000000, 'A moon of Saturn, known for its two-tone coloration.', 4);
INSERT INTO public.moon VALUES (11, 'Enceladus', 4500, true, false, 108000000000, 'A small icy moon of Saturn with geysers erupting from its surface.', 4);
INSERT INTO public.moon VALUES (12, 'Mimas', 4500, true, false, 39700000000, 'A moon of Saturn, with a large impact crater known as Herschel.', 4);
INSERT INTO public.moon VALUES (13, 'Ariel', 4500, true, false, 492000000000, 'A moon of Uranus, with a surface full of ridges and valleys.', 5);
INSERT INTO public.moon VALUES (14, 'Umbriel', 4500, true, false, 198000000000, 'A moon of Uranus, with a darker surface and fewer impact craters.', 5);
INSERT INTO public.moon VALUES (15, 'Titania', 4500, true, false, 734000000000, 'The largest moon of Uranus, with a mix of ridges, valleys, and impact craters.', 5);
INSERT INTO public.moon VALUES (16, 'Oberon', 4500, true, false, 730000000000, 'A large moon of Uranus, with an icy and heavily cratered surface.', 5);
INSERT INTO public.moon VALUES (17, 'Miranda', 4500, true, false, 66000000000, 'A small moon of Uranus, known for its bizarre and varied surface features.', 5);
INSERT INTO public.moon VALUES (18, 'Triton', 4500, true, false, 2130000000000, 'The largest moon of Neptune, with a retrograde orbit and geysers on its surface.', 6);
INSERT INTO public.moon VALUES (19, 'Proteus', 4500, true, false, 435000000000, 'A large moon of Neptune, irregularly shaped and with a heavily cratered surface.', 6);
INSERT INTO public.moon VALUES (20, 'Nereid', 4500, true, false, 105000000000, 'A moon of Neptune, known for its irregular orbit and large distance from the planet.', 6);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 149600000, 5972, true, 'The only known planet to support life.', 1, 288);
INSERT INTO public.planet VALUES (2, 'Mars', 227900000, 641, false, 'The red planet, known for its reddish appearance.', 1, 210);
INSERT INTO public.planet VALUES (3, 'Venus', 108200000, 4868, false, 'A hot and inhospitable planet with a thick atmosphere.', 2, 462);
INSERT INTO public.planet VALUES (4, 'Jupiter', 778300000, 1898000, false, 'The largest planet in our Solar System, with a massive storm called the Great Red Spot.', 3, -108);
INSERT INTO public.planet VALUES (5, 'Saturn', 1427000000, 568000, false, 'Famous for its beautiful rings made of ice and rock.', 4, -139);
INSERT INTO public.planet VALUES (6, 'Uranus', 2871000000, 86800, false, 'A gas giant with a distinct blue-green color, tipped on its side.', 5, -197);
INSERT INTO public.planet VALUES (7, 'Neptune', 4495000000, 102400, false, 'A distant ice giant known for its deep blue color.', 6, -200);
INSERT INTO public.planet VALUES (8, 'Mercury', 57910000, 330, false, 'The closest planet to the Sun with extreme temperature variations.', 1, 440);
INSERT INTO public.planet VALUES (9, 'Pluto', 5906000000, 1300, false, 'A dwarf planet, located in the Kuiper belt, with a cold environment.', 7, -229);
INSERT INTO public.planet VALUES (10, 'Titan', 12000000, 135, false, 'The largest moon of Saturn, with a thick atmosphere and lakes of methane.', 4, 94);
INSERT INTO public.planet VALUES (11, 'Europa', 670900000, 313, false, 'A moon of Jupiter with a possible subsurface ocean beneath its icy surface.', 3, -160);
INSERT INTO public.planet VALUES (12, 'Io', 421700000, 227, false, 'A moon of Jupiter with the most active volcanoes in the Solar System.', 3, 130);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 4600, 'The star at the center of our Solar System.', 1, 8);
INSERT INTO public.star VALUES (2, 'Alpha Centauri', 6000, 'The closest star system to Earth, consisting of three stars.', 2, 2);
INSERT INTO public.star VALUES (3, 'Proxima Centauri', 4500, 'A red dwarf star located in the Alpha Centauri star system.', 2, 1);
INSERT INTO public.star VALUES (4, 'Sirius', 230, 'The brightest star in the night sky, located in the constellation Canis Major.', 1, 5);
INSERT INTO public.star VALUES (5, 'Betelgeuse', 800, 'A red supergiant star in the constellation Orion.', 3, 3);
INSERT INTO public.star VALUES (6, 'Aldebaran', 650, 'A red giant star in the constellation Taurus, the bull.', 4, 4);
INSERT INTO public.star VALUES (7, 'Rigel', 800, 'A blue supergiant star in the constellation Orion.', 1, 5);
INSERT INTO public.star VALUES (8, 'Vega', 450, 'The brightest star in the constellation Lyra.', 2, 3);
INSERT INTO public.star VALUES (9, 'Altair', 600, 'A bright star in the constellation Aquila.', 3, 2);
INSERT INTO public.star VALUES (10, 'Antares', 1200, 'A red supergiant star in the constellation Scorpius.', 4, 6);
INSERT INTO public.star VALUES (11, 'Spica', 1100, 'A binary star system in the constellation Virgo.', 1, 4);
INSERT INTO public.star VALUES (12, 'Canopus', 1000, 'The second-brightest star in the sky, located in the constellation Carina.', 2, 7);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 3, true);


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
-- Name: star_start_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_start_id_seq', 12, true);


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
-- Name: galaxy galaxy_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_description_key UNIQUE (description);


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
-- Name: asteroid asteroid_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


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

