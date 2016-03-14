-- Schema for the AthenaSIS database.
-- Dumped from the ISIS catalog, from databases permanent and accounting.
-- Both databases will be combined into one database. This should simplify
-- management.

CREATE TABLE "person" (
	"isisno" character(10) NOT NULL,
	"last" character(30) NOT NULL,
	"first" character(30) NOT NULL,
	"middle" character(30),
	"sex" character(1) NOT NULL,
	"dob" date,
	"father" character(30),
	"mother" character(30),
	"address" character(30),
	Constraint "person_pkey" Primary Key ("isisno")
);

CREATE TABLE "enrol" (
	"isisno" character(10) NOT NULL,
	"sidn" character(5) NOT NULL,
	"section" character(16),
	"year" integer,
	"school_year" integer,
	Constraint "enrol_pkey" Primary Key ("sidn")
);

CREATE TABLE "grades" (
	"isisno" character(8) NOT NULL,
	"subjname" character(64) NOT NULL,
	"year" integer,
	"sy" integer,
	"gp" integer NOT NULL,
	"grade" integer NOT NULL
);

CREATE TABLE "gastpe" (
	"isisno" character(10) NOT NULL,
	"type" character(3) NOT NULL,
	"granted" integer,
	"status" character(3) NOT NULL,
	"idnum" character(10)
);

CREATE VIEW "student" as SELECT person.isisno, enrol.sidn, person.last, person.first, person.middle, person.sex, enrol.section, enrol."year" FROM person, enrol WHERE (person.isisno = enrol.isisno);


CREATE UNIQUE INDEX enrol_isisno_key ON enrol USING btree (isisno, sidn);


CREATE UNIQUE INDEX grades_isisno_key ON grades USING btree (isisno, subjname, sy, gp, grade);


CREATE UNIQUE INDEX gastpe_isisno_key ON gastpe USING btree (isisno);

CREATE TABLE "lognames" (
	"isisno" character(10),
	"logname" character(10)
);

CREATE TABLE "receipts" (
	"isisno" character(10),
	"date" date,
	"amount" numeric(12,2),
	"account" character(20),
	"remarks" character(20)
);

CREATE TABLE "dues" (
	"isisno" character(10),
	"account" character(20),
	"amount" numeric(12,2),
	"date" date,
	"remarks" character(30)
);

CREATE TABLE "voucher" (
	"isisno" character(10),
	"date" date,
	"amount" numeric(12,2),
	"account" character(20),
	"remarks" character(20)
);

CREATE TABLE "expenses" (
	"amount" numeric(12,2) NOT NULL,
	"article" character(20) NOT NULL,
	"date" date,
	"supplier" character(20),
	"remark" character(30)
);

