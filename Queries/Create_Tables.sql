CREATE TABLE Languages(
    ID INT(250) AUTO_INCREMENT PRIMARY KEY,
    -- BookLanguage renamed from Language due to reserved keyword
    BookLanguage VARCHAR(25) NOT NULL UNIQUE
);

CREATE TABLE BookGenres(
    ID INT(50) AUTO_INCREMENT PRIMARY KEY,
    Genre VARCHAR(15) NOT NULL UNIQUE
);

CREATE TABLE AvailabilityStatuses(
    ID INT(4) AUTO_INCREMENT PRIMARY KEY,
    -- AvailStatus renamed from Status due to reserved keyword
    AvailStatus VARCHAR(25) NOT NULL UNIQUE 
);

CREATE TABLE RentalStatuses()

CREATE TABLE MembershipTypes()

CREATE TABLE UserPermissionLevels()

CREATE TABLE Publishers()

CREATE TABLE Authors()

CREATE TABLE Publishers()

CREATE TABLE Members()

CREATE TABLE Credentials()

CREATE TABLE Staff()

CREATE TABLE Books (
    BookBarcode VARCHAR(40) PRIMARY KEY,
    Title VARCHAR(200) NOT NULL,
    Publisher 
)

CREATE TABLE RentRecords()