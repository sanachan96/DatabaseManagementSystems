PRAGMA foreign_keys=ON;

CREATE TABLE FLIGHTS (fid integer,
month_id integer,
day_of_month integer,
day_of_week_id integer,
carrier_id varchar(7),
flight_num integer,
origin_city varchar(34),
origin_state varchar(47),
dest_city varchar(34),
dest_state varchar(46),
departure_delay integer,
taxi_out integer,
arrival_delay integer,
canceled integer,
actual_time integer,
distance integer,
capacity integer,
price integer,
PRIMARY KEY (fid),
FOREIGN KEY (carrier_id) REFERENCES CARRIERS(cid),
FOREIGN KEY (month_id) REFERENCES MONTHS(mid),
FOREIGN KEY (day_of_week_id) REFERENCES WEEKDAYS(did));

CREATE TABLE CARRIERS (cid varchar(7),
name varchar(83),
PRIMARY KEY(cid));

CREATE TABLE MONTHS (mid integer,
month varchar(9),
PRIMARY KEY(mid));

CREATE TABLE WEEKDAYS (did int,
day_of_week varchar(9),
PRIMARY KEY(did));
