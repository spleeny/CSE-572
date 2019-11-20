-- Phillip Pascual
-- CSE 572
-- Homework 3

-- SQL script to build hotel, room, booking, and guest tables

SET ECHO ON;

CREATE TABLE Hotel (
    HotelNo VARCHAR2(7) NOT NULL,
    HotelName VARCHAR2(20) UNIQUE NOT NULL,
    HotelCity VARCHAR2(10) UNIQUE NOT NULL,
    CONSTRAINTS Hotel_PK PRIMARY KEY (HotelNo)
);

CREATE TABLE Room (
    RoomNo VARCHAR2(7) NOT NULL,
    HNo VARCHAR2(7),
    RoomType VARCHAR2(10),
    RoomPrice INT,
    CONSTRAINTS Room_PK PRIMARY KEY (RoomNo,HNo)
);

ALTER TABLE Room
    ADD CONSTRAINTS Room_HNo_FK FOREIGN KEY (HNo) REFERENCES Hotel(HotelNo)
    ON DELETE SET NULL DEFERRABLE INITIALLY IMMEDIATE;

CREATE TABLE Guest (
    GuestNo VARCHAR2(7) NOT NULL,
    GuestName VARCHAR2(20),
    GuestAddress VARCHAR2(20),
    CONSTRAINTS Guest_PK PRIMARY KEY (GuestNo)
);

CREATE TABLE Booking (
    HNo VARCHAR2(7),
    GNo VARCHAR2(7),
    DateFrom DATE NOT NULL,
    DateTo DATE,
    RNo VARCHAR2(7),
    CONSTRAINTS Booking_PK PRIMARY KEY (HNo,GNo,DateFrom)
);

ALTER TABLE Booking
    ADD CONSTRAINTS Booking_HNo_FK FOREIGN KEY (HNo) REFERENCES Hotel(HotelNo)
    ON DELETE SET NULL DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE Booking
    ADD CONSTRAINTS Booking_GNo_FK FOREIGN KEY (GNo) REFERENCES GUEST(GuestNo)
    ON DELETE SET NULL DEFERRABLE INITIALLY IMMEDIATE;

