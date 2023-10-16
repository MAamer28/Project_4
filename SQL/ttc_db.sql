-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE bus_delay_2022 (
    Date date,
    Route varchar(200),
    Time time,
    Day varchar(200),
    Location varchar(200),
    Incident varchar(200),
    Min_Delay int,
    Min_Gap int,
    Direction varchar(200),
    Vehicle int   
);

