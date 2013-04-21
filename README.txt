
Using PostgreSQL 9.2.3 on x86_64-unknown-linux-gnu, compiled by gcc (GCC) 4.4.6 20120305 (Red Hat 4.4.6-4), 64-bit

As a superuser of the database
create user moon password 'nasa';

CREATE DATABASE moon
  WITH ENCODING='UTF8'
       OWNER=moon
       CONNECTION LIMIT=-1;
       
create extension postgis;       
       
To connect to database 

psql -h localhost moon moon     



create table image (
image_id bigint,
center_lng double precision,
center_lat double precision,
nadir_lng double precision,
nadir_lat double precision,
corner1_lng double precision,
corner1_lat double precision,
corner2_lng double precision,
corner2_lat double precision,
corner3_lng double precision,
corner3_lat double precision,
corner4_lng double precision,
corner4_lat double precision,
altitude double precision,
lens_size integer,
frame_width double precision,
frame_height double precision,
taken_utc timestamp,
mission_name text,
spacecraft text,
camera_dir text,
orbit_num integer,
image_page text,
image_link text,
kml_link text,
schools text,
id serial primary key
);  

drop table crater;
create table crater(
name text,
diam double precision,
latitude  double precision,
longitude double precision,
radiuskm double precision,
radiusm double precision,
radiusdeg double precision,
rimheight double precision,
rimwidth double precision,
floordiameter double precision,
volume double precision,
apparentdepth double precision,
diameterpeak double precision,
basalareapeak double precision,
heightpeak double precision,
ejectakm1 double precision,
ejectad1 double precision,
ejectakm2 double precision,
ejectad2 double precision,
maxdejecta1 double precision,
maxdejecta2 double precision,
thickejecta1r double precision,
thickejecta2r double precision,
thickejecta3r double precision,
thickejecta4r double precision,
thickejecta5r double precision,
thickejectarim10km double precision,
thickejecta10km1 double precision,
thickejecta10km2 double precision,
thickejecta10km3 double precision,
radarhalokm double precision,
radarhalod double precision,
ag double precision,
ah double precision,
ai double precision,
aj double precision,
ak double precision,
al double precision,
am double precision,
an double precision,
ao double precision,
ap double precision,
aq double precision,
ar double precision,
"as" double precision,
at double precision,
au double precision,
av double precision,
aw double precision,
citation text,
ageclass double precision,
age text,
agegroup text,
remarks text,
agesource text,
ageother text,
source text,
chron text,
distribution integer,
size double precision,
willhelms boolean,
typicality integer,
agerelation integer,
other7 text,
other8 text,
dated text,
datingexpl text,
sum double precision,
id serial primary key
);
copy crater(name, diam, latitude, longitude, radiuskm, radiusm, radiusdeg, rimheight, rimwidth, floordiameter, volume, apparentdepth, diameterpeak, basalareapeak, heightpeak, ejectakm1, ejectad1, ejectakm2, ejectad2, maxdejecta1, maxdejecta2, thickejecta1r, thickejecta2r, thickejecta3r, thickejecta4r, thickejecta5r, thickejectarim10km, thickejecta10km1, thickejecta10km2, thickejecta10km3, radarhalokm, radarhalod, ag, ah, ai, aj, ak, al, am, an, ao, ap, aq, ar, "as", at, au, av, aw, citation, ageclass, age, agegroup, remarks, agesource, ageother, source, chron, distribution, size, willhelms, typicality, agerelation, other7, other8, dated, datingexpl, sum) from '/tmp/crater.csv' delimiter ',' CSV HEADER;



UPDATE image SET nadir = ST_GeogFromText('SRID=4326;POINT(' || nadir_lng || ' ' || nadir_lat || ')');
ALTER TABLE image ADD COLUMN nadir geography(POINT,4326);
CREATE INDEX nadir_index ON image USING GIST (nadir);

ALTER TABLE image ADD COLUMN corner1 geography(POINT,4326);
ALTER TABLE image ADD COLUMN corner2 geography(POINT,4326);
ALTER TABLE image ADD COLUMN corner3 geography(POINT,4326);
ALTER TABLE image ADD COLUMN corner4 geography(POINT,4326);
CREATE INDEX corner1_index ON image USING GIST (corner1);
CREATE INDEX corner2_index ON image USING GIST (corner2);
CREATE INDEX corner3_index ON image USING GIST (corner3);
CREATE INDEX corner4_index ON image USING GIST (corner4);

UPDATE image SET corner1 = ST_GeogFromText('SRID=4326;POINT(' || corner1_lng || ' ' || corner1_lat || ')') where corner1_lat is not null and corner1_lng is not null;
UPDATE image SET corner2 = ST_GeogFromText('SRID=4326;POINT(' || corner2_lng || ' ' || corner2_lat || ')') where corner2_lat is not null and corner2_lng is not null;
UPDATE image SET corner3 = ST_GeogFromText('SRID=4326;POINT(' || corner3_lng || ' ' || corner3_lat || ')') where corner3_lat is not null and corner3_lng is not null;
UPDATE image SET corner4 = ST_GeogFromText('SRID=4326;POINT(' || corner4_lng || ' ' || corner4_lat || ')') where corner4_lat is not null and corner4_lng is not null;


ALTER TABLE crater ADD COLUMN center geography(POINT,4326);
UPDATE crater SET center = ST_GeogFromText('SRID=4326;POINT(' || longitude || ' ' || latitude || ')') where longitude is not null and latitude is not null;
CREATE INDEX center_index ON crater USING GIST (center);

Create circles

SELECT ST_Buffer(point, 600000, 'quad_segs=8') 
   FROM points
   
Select   ST_Buffer(geography( 
                ST_Transform( point, 4326 )), 
                600000)), 
            900913) FROM points`

Moon 
http://pds.nasa.gov/ds-view/pds/viewTargetProfile.jsp?TARGET_NAME=MOON
Target Information
TARGET_NAME 	MOON
PRIMARY_BODY_NAME 	EARTH
TARGET_TYPE 	SATELLITE
TARGET_DESCRIPTION 	


    Target Overview
    ===============
    The target name MOON is used for those data sets concerned with
    observations of Earth's moon. The following parameters are from
    the tabulation in K.R. Lang, 'Astrophysical Data: Planets and
    Stars', pp. 70-73 [LANG1992]:
 
    Distance from planet center:  384.4e03   km
    60.2 planet radii
    Orbital period:               27.3217 days
    Eccentricity:                 0.05490 degrees
    Inclination:                  18.2 to 28.8 degrees
 
    Radius:                       1738 km
    Mass:                         735 1.e23 grams
    Density:                      3.34 grams/cm^3
    Visual Magnitude at Opposition: N/A
    at Unit Distance:             +0.21
    Geometric Visual Albedo:       0.12
        

REFERENCE_DESCRIPTION 	
RESOURCE_LINK