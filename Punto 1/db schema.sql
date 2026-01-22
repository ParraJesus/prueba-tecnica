CREATE TABLE SpaceTypes (
    ID BIGINT AUTO_INCREMENT PRIMARY KEY,
    Type VARCHAR(100) NOT NULL,
    Description TEXT
) ENGINE=InnoDB;

CREATE TABLE PhysicalSpaces (
    ID BIGINT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(150) NOT NULL,
    MaxCapacity INT NOT NULL,
    Description TEXT,
    Type BIGINT NOT NULL,

    CONSTRAINT fk_physicalspaces_type
        FOREIGN KEY (Type)
        REFERENCES SpaceTypes(ID)
) ENGINE=InnoDB;

CREATE TABLE Seasons (
    ID BIGINT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    StartDate DATE NOT NULL,
    EndDate DATE NOT NULL,

    CONSTRAINT chk_season_dates
        CHECK (StartDate <= EndDate)
) ENGINE=InnoDB;

CREATE TABLE Price_Space (
    ID BIGINT AUTO_INCREMENT PRIMARY KEY,
    SpaceId BIGINT NOT NULL,
    SeasonId BIGINT NOT NULL,
    PricePerDay DECIMAL(10,2) NOT NULL,

    CONSTRAINT fk_price_space_space
        FOREIGN KEY (SpaceId)
        REFERENCES PhysicalSpaces(ID),

    CONSTRAINT fk_price_space_season
        FOREIGN KEY (SeasonId)
        REFERENCES Seasons(ID),

    CONSTRAINT uq_space_season UNIQUE (SpaceId, SeasonId)
) ENGINE=InnoDB;

CREATE TABLE Roles (
    ID BIGINT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Description TEXT,

    CONSTRAINT uq_roles_name UNIQUE (Name)
) ENGINE=InnoDB;

CREATE TABLE Users (
    ID BIGINT AUTO_INCREMENT PRIMARY KEY,
    IdCard VARCHAR(50) NOT NULL,
    FirstName VARCHAR(100) NOT NULL,
    SecondName VARCHAR(100),
    FirstSurname VARCHAR(100) NOT NULL,
    SecondSurname VARCHAR(100),
    Email VARCHAR(150) NOT NULL,
    Password VARCHAR(255) NOT NULL,
    RoleID BIGINT NOT NULL,
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT uq_users_email UNIQUE (Email),
    CONSTRAINT uq_users_idcard UNIQUE (IdCard),
    CONSTRAINT fk_users_role
        FOREIGN KEY (RoleID)
        REFERENCES Roles(ID)
) ENGINE=InnoDB;

CREATE TABLE ReservationStates (
    ID BIGINT AUTO_INCREMENT PRIMARY KEY,
    State VARCHAR(50) NOT NULL,
    Description TEXT,

    CONSTRAINT uq_reservation_state UNIQUE (State)
) ENGINE=InnoDB;

CREATE TABLE Reservations (
    ID BIGINT AUTO_INCREMENT PRIMARY KEY,
    SpaceId BIGINT NOT NULL,
    UserId BIGINT NOT NULL,
    ReservationStateID BIGINT NOT NULL,
    StartDate DATE NOT NULL,
    EndDate DATE NOT NULL,
    TotalPrice DECIMAL(10,2) NOT NULL,
    TotalNumberPeople INT NOT NULL,

    CONSTRAINT fk_reservation_space
        FOREIGN KEY (SpaceId)
        REFERENCES PhysicalSpaces(ID),

    CONSTRAINT fk_reservation_user
        FOREIGN KEY (UserId)
        REFERENCES Users(ID),

    CONSTRAINT fk_reservation_state
        FOREIGN KEY (ReservationStateID)
        REFERENCES ReservationStates(ID),

    CONSTRAINT chk_reservation_dates
        CHECK (StartDate <= EndDate)
) ENGINE=InnoDB;

