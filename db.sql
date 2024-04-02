CREATE SCHEMA hotel;

CREATE COLUMN TABLE hotel.city(
	zip CHAR(5) PRIMARY KEY,
	name CHAR(30) NOT NULL,
	state CHAR(2) NOT NULL
);
CREATE COLUMN TABLE hotel.customer(
	cno NUMERIC(4) PRIMARY KEY,
	title CHAR(7),
	firstname CHAR(20),
	name CHAR(40) NOT NULL,
	zip CHAR(5),
	address CHAR(40) NOT NULL
);
CREATE COLUMN TABLE hotel.hotel(
	hno NUMERIC(4) PRIMARY KEY,
	name CHAR(50) NOT NULL,
	zip CHAR(5),
	address CHAR(40) NOT NULL
);
CREATE COLUMN TABLE hotel.room(
	hno NUMERIC(4),
	type CHAR(6),
	free NUMERIC(3),
	price NUMERIC(6, 2),
	PRIMARY KEY (hno, type)
);
CREATE COLUMN TABLE hotel.reservation(
	rno NUMERIC(4) PRIMARY KEY,
	cno NUMERIC(4),
	hno NUMERIC(4),
	type CHAR(6),
	arrival DATE NOT NULL,
	departure DATE NOT NULL
);

INSERT INTO hotel.city VALUES('12203', 'Albany', 'NY');
INSERT INTO hotel.city VALUES('60601', 'Chicago', 'IL');
INSERT INTO hotel.city VALUES('60615', 'Chicago', 'IL');
INSERT INTO hotel.city VALUES('45211', 'Cincinnati', 'OH');
INSERT INTO hotel.city VALUES('33575', 'Clearwater', 'FL');
INSERT INTO hotel.city VALUES('75243', 'Dallas', 'TX');
INSERT INTO hotel.city VALUES('32018', 'Daytona Beach', 'FL');
INSERT INTO hotel.city VALUES('33441', 'Deerfield Beach', 'FL');
INSERT INTO hotel.city VALUES('48226', 'Detroit', 'MI');
INSERT INTO hotel.city VALUES('90029', 'Hollywood', 'CA');
INSERT INTO hotel.city VALUES('92714', 'Irvine', 'CA');
INSERT INTO hotel.city VALUES('90804', 'Long Beach', 'CA');
INSERT INTO hotel.city VALUES('11788', 'Long Island', 'NY');
INSERT INTO hotel.city VALUES('90018', 'Los Angeles', 'CA');
INSERT INTO hotel.city VALUES('70112', 'New Orleans', 'LA');
INSERT INTO hotel.city VALUES('10580', 'New York', 'NY');
INSERT INTO hotel.city VALUES('10019', 'New York', 'NY');
INSERT INTO hotel.city VALUES('92262', 'Palm Springs', 'CA');
INSERT INTO hotel.city VALUES('97213', 'Portland', 'OR');
INSERT INTO hotel.city VALUES('60018', 'Rosemont', 'IL');
INSERT INTO hotel.city VALUES('95054', 'Santa Clara', 'CA');
INSERT INTO hotel.city VALUES('20903', 'Silver Spring', 'MD');
INSERT INTO hotel.city VALUES('20037', 'Seattle', 'WA');
INSERT INTO hotel.city VALUES('20005', 'Seattle', 'WA');
INSERT INTO hotel.city VALUES('20019', 'Seattle', 'WA');
INSERT INTO hotel.city VALUES('45455', 'San Diego', 'CA');
INSERT INTO hotel.city VALUES('33344', 'Boston', 'MD');
INSERT INTO hotel.city VALUES('88811', 'Springfield', 'WA');
INSERT INTO hotel.city VALUES('15505', 'Twin Peaks', 'MO');
INSERT INTO hotel.city VALUES('77709', 'Gardner', 'MA');

INSERT INTO hotel.customer VALUES(3000, 'Mrs', 'Jenny', 'Porter', '10580', '1340 N. Ash Street, #3');
INSERT INTO hotel.customer VALUES(3100, 'Mr', 'Peter', 'Brown', '48226', '1001 34th St., APT.3');
INSERT INTO hotel.customer VALUES(3200, 'Company', NULL, 'Datasoft', '90018', '486 Maple St.');
INSERT INTO hotel.customer VALUES(3300, 'Mrs', 'Rose', 'Brian', '75243', '500 Yellowstone Drive, #2');
INSERT INTO hotel.customer VALUES(3400, 'Mrs', 'Mary', 'Griffith', '20005', '3401 Elder Lane');
INSERT INTO hotel.customer VALUES(3500, 'Mr', 'Martin', 'Randolph', '60615', '340 MAIN STREET, #7');
INSERT INTO hotel.customer VALUES(3600, 'Mrs', 'Sally', 'Smith', '75243', '250 Curtis Street');
INSERT INTO hotel.customer VALUES(3700, 'Mr', 'Mike', 'Jackson', '45211', '133 BROADWAY APT. 1');
INSERT INTO hotel.customer VALUES(3800, 'Mrs', 'Rita', 'Doe', '97213', '2000 Humboldt St., #6');
INSERT INTO hotel.customer VALUES(3900, 'Mr', 'George', 'Howe', '75243', '111 B Parkway, #23');
INSERT INTO hotel.customer VALUES(4000, 'Mr', 'Frank', 'Miller', '95054', '27 5th St., 76');
INSERT INTO hotel.customer VALUES(4100, 'Mrs', 'Susan', 'Baker', '90018', '200 MAIN STREET, #94');
INSERT INTO hotel.customer VALUES(4200, 'Mr', 'Joseph', 'Peters', '92714', '700 S. Ash St., APT.12');
INSERT INTO hotel.customer VALUES(4300, 'Company', NULL, 'TOOLware', '20019', '410 Mariposa St., #10');
INSERT INTO hotel.customer VALUES(4400, 'Mr', 'Antony', 'Jenkins', '20903', '55 A Parkway, #15');

INSERT INTO hotel.hotel VALUES(10, 'Congress', '20005', '155 Beechwood St.');
INSERT INTO hotel.hotel VALUES(30, 'Regency', '20037', '477 17th Avenue');
INSERT INTO hotel.hotel VALUES(20, 'Long Island', '11788', '1499 Grove Street');
INSERT INTO hotel.hotel VALUES(70, 'Empire State', '12203', '65 Yellowstone Dr.');
INSERT INTO hotel.hotel VALUES(80, 'Midtown', '10019', '12 Barnard St.');
INSERT INTO hotel.hotel VALUES(40, 'Eighth Avenue', '10019', '112 8th Avenue');
INSERT INTO hotel.hotel VALUES(50, 'Lake Michigan', '60601', '354 OAK Terrace');
INSERT INTO hotel.hotel VALUES(60, 'Airport', '60018', '650 C Parkway');
INSERT INTO hotel.hotel VALUES(90, 'Sunshine', '33575', '200 Yellowstone Dr.');
INSERT INTO hotel.hotel VALUES(100, 'Beach', '32018', '1980 34th St.');
INSERT INTO hotel.hotel VALUES(110, 'Atlantic', '33441', '111 78th St.');
INSERT INTO hotel.hotel VALUES(120, 'Long Beach', '90804', '35 Broadway');
INSERT INTO hotel.hotel VALUES(150, 'Indian Horse', '92262', '16 MAIN STREET');
INSERT INTO hotel.hotel VALUES(130, 'Star', '90029', '13 Beechwood Place');
INSERT INTO hotel.hotel VALUES(140, 'River Boat', '70112', '788 MAIN STREET');
INSERT INTO hotel.hotel VALUES(300, 'Ocean Star', '44332', '16 MAIN STREET');
INSERT INTO hotel.hotel VALUES(310, 'Bella Ciente', '77111', '13 Beechwood Place');
INSERT INTO hotel.hotel VALUES(320, 'River Boat', '79872', '788 MAIN STREET');

INSERT INTO hotel.room VALUES(10, 'single', 20, 135.00);
INSERT INTO hotel.room VALUES(10, 'double', 45, 200.00);
INSERT INTO hotel.room VALUES(30, 'single', 12, 45.00);
INSERT INTO hotel.room VALUES(30, 'double', 15, 80.00);
INSERT INTO hotel.room VALUES(20, 'single', 10, 70.00);
INSERT INTO hotel.room VALUES(20, 'double', 13, 100.00);
INSERT INTO hotel.room VALUES(70, 'single', 4, 115.00);
INSERT INTO hotel.room VALUES(70, 'double', 11, 180.00);
INSERT INTO hotel.room VALUES(80, 'single', 15, 90.00);
INSERT INTO hotel.room VALUES(80, 'double', 19, 150.00);
INSERT INTO hotel.room VALUES(80, 'suite', 5, 400.00);
INSERT INTO hotel.room VALUES(40, 'single', 20, 85.00);
INSERT INTO hotel.room VALUES(40, 'double', 35, 140.00);
INSERT INTO hotel.room VALUES(50, 'single', 50, 105.00);
INSERT INTO hotel.room VALUES(50, 'double', 230, 180.00);
INSERT INTO hotel.room VALUES(50, 'suite', 12, 500.00);
INSERT INTO hotel.room VALUES(60, 'single', 10, 120.00);
INSERT INTO hotel.room VALUES(60, 'double', 39, 200.00);
INSERT INTO hotel.room VALUES(60, 'suite', 20, 500.00);
INSERT INTO hotel.room VALUES(90, 'single', 45, 90.00);
INSERT INTO hotel.room VALUES(90, 'double', 145, 150.00);
INSERT INTO hotel.room VALUES(90, 'suite', 60, 300.00);
INSERT INTO hotel.room VALUES(100, 'single', 11, 60.00);
INSERT INTO hotel.room VALUES(100, 'double', 24, 100.00);
INSERT INTO hotel.room VALUES(110, 'single', 2, 70.00);
INSERT INTO hotel.room VALUES(110, 'double', 10, 130.00);
INSERT INTO hotel.room VALUES(120, 'single', 34, 80.00);
INSERT INTO hotel.room VALUES(120, 'double', 78, 140.00);
INSERT INTO hotel.room VALUES(120, 'suite', 55, 350.00);
INSERT INTO hotel.room VALUES(150, 'single', 44, 100.00);
INSERT INTO hotel.room VALUES(150, 'double', 115, 190.00);
INSERT INTO hotel.room VALUES(150, 'suite', 6, 450.00);
INSERT INTO hotel.room VALUES(130, 'single', 89, 160.00);
INSERT INTO hotel.room VALUES(130, 'double', 300, 270.00);
INSERT INTO hotel.room VALUES(130, 'suite', 100, 700.00);
INSERT INTO hotel.room VALUES(140, 'single', 10, 125.00);
INSERT INTO hotel.room VALUES(140, 'double', 9, 200.00);
INSERT INTO hotel.room VALUES(140, 'suite', 78, 600.00);

INSERT INTO hotel.reservation VALUES(100, 3000, 80, 'single', '2004-11-13', '2004-11-15');
INSERT INTO hotel.reservation VALUES(110, 3000, 100, 'double', '2004-12-24', '2005-01-06');
INSERT INTO hotel.reservation VALUES(120, 3200, 50, 'suite', '2004-11-14', '2004-11-18');
INSERT INTO hotel.reservation VALUES(130, 3900, 110, 'single', '2005-02-01', '2005-02-03');
INSERT INTO hotel.reservation VALUES(150, 3600, 70, 'double', '2005-03-14', '2005-03-24');
INSERT INTO hotel.reservation VALUES(140, 4300, 80, 'double', '2004-04-12', '2004-04-30');
INSERT INTO hotel.reservation VALUES(160, 4100, 70, 'single', '2004-04-12', '2004-04-15');
INSERT INTO hotel.reservation VALUES(170, 4400, 150, 'suite', '2004-09-01', '2004-09-03');
INSERT INTO hotel.reservation VALUES(180, 3100, 120, 'double', '2004-12-23', '2005-01-08');
INSERT INTO hotel.reservation VALUES(190, 4300, 140, 'double', '2004-11-14', '2004-11-17');