CREATE DATABASE universe;
\connect universe

CREATE TABLE galaxy (
  galaxy_id SERIAL PRIMARY KEY,
  name VARCHAR(60) UNIQUE NOT NULL,
  description TEXT NOT NULL,
  age_in_millions_of_years INT NOT NULL,
  distance_from_earth NUMERIC(12, 2) NOT NULL,
  has_life BOOLEAN NOT NULL
);

CREATE TABLE star (
  star_id SERIAL PRIMARY KEY,
  name VARCHAR(60) UNIQUE NOT NULL,
  galaxy_id INT NOT NULL REFERENCES galaxy(galaxy_id),
  description TEXT NOT NULL,
  mass NUMERIC(10, 2) NOT NULL,
  temperature_kelvin INT NOT NULL,
  is_spherical BOOLEAN NOT NULL
);

CREATE TABLE planet (
  planet_id SERIAL PRIMARY KEY,
  name VARCHAR(60) UNIQUE NOT NULL,
  star_id INT NOT NULL REFERENCES star(star_id),
  description TEXT NOT NULL,
  has_life BOOLEAN NOT NULL,
  is_spherical BOOLEAN NOT NULL,
  age_in_millions_of_years NUMERIC(10, 2) NOT NULL,
  orbital_period_days INT NOT NULL
);

CREATE TABLE moon (
  moon_id SERIAL PRIMARY KEY,
  name VARCHAR(60) UNIQUE NOT NULL,
  planet_id INT NOT NULL REFERENCES planet(planet_id),
  description TEXT NOT NULL,
  age_in_millions_of_years NUMERIC(10, 2) NOT NULL,
  has_life BOOLEAN NOT NULL
);

CREATE TABLE asteroid (
  asteroid_id SERIAL PRIMARY KEY,
  name VARCHAR(60) UNIQUE NOT NULL,
  description TEXT NOT NULL,
  planet_id INT NOT NULL REFERENCES planet(planet_id),
  diameter_km NUMERIC(8, 2) NOT NULL,
  is_spherical BOOLEAN NOT NULL
);

INSERT INTO galaxy (name, description, age_in_millions_of_years, distance_from_earth, has_life) VALUES
  ('Milky Way', 'A barred spiral galaxy with a bright central bulge.', 13600, 0.00, TRUE),
  ('Andromeda', 'A neighboring spiral galaxy approaching the Milky Way.', 10000, 2537000.00, FALSE),
  ('Triangulum', 'A small spiral galaxy in the Local Group.', 12000, 2730000.00, FALSE),
  ('Whirlpool', 'A grand-design spiral galaxy interacting with a companion.', 13000, 23000000.00, FALSE),
  ('Sombrero', 'A luminous galaxy with a prominent dust lane.', 9000, 29350000.00, FALSE),
  ('Pinwheel', 'A face-on spiral galaxy rich in star-forming regions.', 10500, 20900000.00, FALSE);

INSERT INTO star (name, galaxy_id, description, mass, temperature_kelvin, is_spherical) VALUES
  ('Sol', 1, 'A steady yellow dwarf at the center of our planetary system.', 1.00, 5778, TRUE),
  ('Proxima Centauri', 1, 'A small red dwarf and the nearest known stellar neighbor.', 0.12, 3042, TRUE),
  ('Mirach', 2, 'An orange giant visible in the constellation Andromeda.', 3.50, 4500, TRUE),
  ('Trianguli Prime', 3, 'A blue-white star in a quiet outer arm.', 2.10, 9200, TRUE),
  ('Mira', 4, 'A red giant in the Whirlpool Galaxy.', 1.40, 3500, TRUE),
  ('Sombrero Alpha', 5, 'A bright star near the Sombrero Galaxy core.', 4.20, 11000, TRUE);

INSERT INTO planet (name, star_id, description, has_life, is_spherical, age_in_millions_of_years, orbital_period_days) VALUES
  ('Earth', 1, 'An ocean-rich world with a diverse biosphere.', TRUE, TRUE, 4540.00, 365),
  ('Mars', 1, 'A cold desert world with ancient river valleys.', FALSE, TRUE, 4500.00, 687),
  ('Venus', 1, 'A rocky world wrapped in dense clouds.', FALSE, TRUE, 4500.00, 225),
  ('Jupiter', 1, 'A massive gas giant with a long-lived storm.', FALSE, TRUE, 4600.00, 4333),
  ('Proxima b', 2, 'A temperate-zone planet orbiting a red dwarf.', FALSE, TRUE, 5000.00, 11),
  ('Proxima c', 2, 'A distant candidate world on a wide orbit.', FALSE, TRUE, 5000.00, 1928),
  ('Mirach I', 3, 'A scorched rocky world close to its giant star.', FALSE, TRUE, 3100.00, 42),
  ('Mirach II', 3, 'A cool outer planet with a broad ring system.', FALSE, TRUE, 3000.00, 820),
  ('Trianguli b', 4, 'A dense world in the inner habitable region.', FALSE, TRUE, 4000.00, 93),
  ('Trianguli c', 4, 'A frozen world beyond the system snow line.', FALSE, TRUE, 3900.00, 1200),
  ('Mira I', 5, 'A giant planet glowing beneath a thick atmosphere.', FALSE, TRUE, 2800.00, 305),
  ('Mira II', 5, 'A small outer world surrounded by icy debris.', FALSE, TRUE, 2600.00, 2100);

INSERT INTO moon (name, planet_id, description, age_in_millions_of_years, has_life) VALUES
  ('Luna', 1, 'Earth''s large natural satellite.', 4510.00, FALSE),
  ('Phobos', 2, 'A small, irregular moon spiraling toward Mars.', 4500.00, FALSE),
  ('Deimos', 2, 'A distant, softly cratered moon of Mars.', 4500.00, FALSE),
  ('Io', 4, 'A volcanically active moon of Jupiter.', 4500.00, FALSE),
  ('Europa', 4, 'An icy moon with a likely subsurface ocean.', 4500.00, FALSE),
  ('Ganymede', 4, 'The largest moon in the Solar System.', 4500.00, FALSE),
  ('Callisto', 4, 'A heavily cratered moon in the outer Jovian system.', 4500.00, FALSE),
  ('Cinder', 5, 'A dark moonlet orbiting Proxima b.', 4900.00, FALSE),
  ('Frost', 6, 'An icy satellite of Proxima c.', 4800.00, FALSE),
  ('Glimmer', 6, 'A reflective companion in a distant orbit.', 4800.00, FALSE),
  ('Amber', 7, 'A warm-toned moon of Mirach I.', 3000.00, FALSE),
  ('Saffron', 8, 'A ring-shepherding moon around Mirach II.', 2900.00, FALSE),
  ('Kite', 8, 'A small moon on an inclined path.', 2900.00, FALSE),
  ('Vesper', 9, 'A bright moon crossing Trianguli b''s night sky.', 3900.00, FALSE),
  ('Wisp', 10, 'A pale satellite near the edge of Trianguli c''s system.', 3800.00, FALSE),
  ('Ember', 11, 'A warm inner moon under Mira I''s glowing clouds.', 2700.00, FALSE),
  ('Cobalt', 11, 'A blue-white moon with a frozen surface.', 2700.00, FALSE),
  ('Drift', 12, 'A slow-moving moon of the outer Mira world.', 2500.00, FALSE),
  ('Quartz', 12, 'A bright, rocky satellite with deep canyons.', 2500.00, FALSE),
  ('Halo', 3, 'A small companion orbiting Venus.', 4400.00, FALSE);

INSERT INTO asteroid (name, description, planet_id, diameter_km, is_spherical) VALUES
  ('Vesta Minor', 'A rocky fragment from an ancient collision.', 2, 18.40, FALSE),
  ('Blue Comet', 'An icy body on a long elliptical orbit.', 6, 7.25, FALSE),
  ('Asterion', 'A metallic asteroid captured in a stable orbit.', 10, 42.80, FALSE);
