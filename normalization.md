
First normal formal
this is passed because there are no repeating group


Secound normal formal
This is passed because there are no patial dependecies


Third normal formal
Identified that `city` and `country` in `Property` are transitively dependent

Solution
create new table named Location that will be linked to Properties

Table
Location
location_id
city
country

Then readjust the property table
Table
Property
property_id (PK)
host_id (FK → User)
location_id (FK → Location)
title
description
price_per_night
created_at
