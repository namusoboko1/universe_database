# Universe Database Project

## Project Overview
This project involves creating a PostgreSQL database that represents the universe, including planets, stars, galaxies, and moons. The database includes tables with relevant data about these celestial bodies and their relationships.

## Database Structure
The database contains several tables, including:
- **planets**: Information about planets (e.g., name, description, size).
- **stars**: Information about stars (e.g., name, type, brightness).
- **galaxies**: Information about galaxies (e.g., name, type, distance from Earth).
- **moons**: Information about moons orbiting planets (e.g., name, planet_id).
- **characteristics**: Characteristics of celestial bodies like age, size, distance from Earth, etc.

The relationships between these tables are managed through foreign keys to ensure referential integrity. For example, each moon has a corresponding planet_id, and each planet belongs to a galaxy.

## Commands Used
The following PostgreSQL commands were used to create and manage the database:
1. **`CREATE DATABASE`**: To create the database.
2. **`CREATE TABLE`**: To define the structure of tables.
3. **`INSERT INTO`**: To insert data into tables.
4. **`SELECT`**: To query data from tables.
5. **`ALTER TABLE`**: To add constraints like foreign keys and unique keys.
6. **`pg_dump`**: To create a backup of the database.

## Steps Taken
1. **Database Creation**: The universe database was created and tables like `planets`, `stars`, `moons`, etc., were defined.
2. **Data Insertion**: Data was inserted into each table to represent various planets, stars, and other celestial bodies.
3. **Relationships**: Foreign key relationships were set up to link related data (e.g., moons to planets).
4. **Backup**: A backup of the database was created using `pg_dump`, which can be restored with `psql -U postgres < universe.sql`.

## Database Backup
To save the state of the database, a dump was created using the following command:

```bash
pg_dump -cC --inserts -U freecodecamp universe > universe.sql
