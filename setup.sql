CREATE TABLE BubbleTeaShop
(
    BTS_name char(50),
    location char(50),
    rating   int,
    PRIMARY KEY (BTS_name, location)
);


CREATE TABLE Beverage1
(
    name     char(50),
    BTS_name char(50),
    location char(50),
    teaType  char(50) NOT NULL,
    PRIMARY KEY (BTS_name, name),
    FOREIGN KEY (BTS_name, location) REFERENCES BubbleTeaShop (BTS_name, location) ON DELETE CASCADE
);

CREATE TABLE Beverage2
(
    name     char(50),
    BTS_name char(50),
    price    float NOT NULL,
    PRIMARY KEY (BTS_name, name),
    FOREIGN KEY (BTS_name) REFERENCES BubbleTeaShop (BTS_name, location) ON DELETE CASCADE
);

CREATE TABLE Beverage3
(
    price      float NOT NULL,
    iceLevel   char(50) DEFAULT '100%',
    sugarLevel char(50) DEFAULT '100%',
    PRIMARY KEY (price)
);

CREATE TABLE Of
(
    B_name char(50),
    logo   ORDIMAGE,
    PRIMARY KEY (B_name, logo),
    FOREIGN KEY (B_name) REFERENCES Beverage1 ON DELETE CASCADE,
    FOREIGN KEY (logo) REFERENCES Packaging1
);

CREATE TABLE Collaborates
(
    BTS_name char(50),
    location char(50),
    TOP_name char(50),
    PRIMARY KEY (BTS_name, location, TOP_name),
    FOREIGN KEY (BTS_name, location) REFERENCES BubbleTeaShop (BTS_name, location) ON DELETE CASCADE,
    FOREIGN KEY (TOP_name) REFERENCES TakeOutPlatform ON DELETE CASCADE
);

CREATE TABLE TakeOutPlatform
(
    name           char(50) UNIQUE,
    delivery_speed char(50),
    deliveryFee    float NOT NULL,
    PRIMARY KEY (name)
);


CREATE TABLE Customer
(
    C_id   int PRIMARY KEY,
    C_name char(50)
);

CREATE TABLE Review
(
    review_number int PRIMARY KEY,
    rate          int  NOT NULL,
    photo         ORDIMAGE,
    paragraph     char(150),
    rDate         date NOT NULL,
    C_id          int,
    FOREIGN KEY (C_id) REFERENCES Customer ON DELETE CASCADE
);


CREATE TABLE OpinionOf
(
    TOP_name      char(50),
    review_number int,
    PRIMARY KEY (TOP_name, review_number),
    FOREIGN KEY (TOP_name) REFERENCES TakeOutPlatform,
    FOREIGN KEY (review_number) REFERENCES Review ON DELETE CASCADE
);

CREATE TABLE Judgement
(
    B_name        char(50),
    review_number int,
    PRIMARY KEY (B_name, review_number),
    FOREIGN KEY (B_name) REFERENCES Beverage1,
    FOREIGN KEY (review_number) REFERENCES Review ON DELETE CASCADE
);

CREATE TABLE About
(
    logo          ORDIMAGE,
    review_number int,
    PRIMARY KEY (logo, review_number),
    FOREIGN KEY (logo) REFERENCES Packaging1,
    FOREIGN KEY (review_number) REFERENCES Review ON DELETE CASCADE
);

CREATE TABLE FruitTea
(
    BTS_name char(50),
    B_name   char(50),
    location char(50),
    I_name   char(50),
    fruit    char(50),
    PRIMARY KEY (BTS_name, B_name, location, I_name),
    FOREIGN KEY (BTS_name, location) REFERENCES BubbleTeaShop ON DELETE CASCADE,
    FOREIGN KEY (I_name) REFERENCES Ingredients,
    FOREIGN KEY (B_name) REFERENCES Beverage1
);

CREATE TABLE MilkTea
(
    BTS_name  char(50),
    B_name    char(50),
    location  char(50),
    I_name    char(50),
    milk_foam char(50),
    PRIMARY KEY (BTS_name, B_name, location, I_name),
    FOREIGN KEY (BTS_name, location) REFERENCES BubbleTeaShop ON DELETE CASCADE,
    FOREIGN KEY (I_name) REFERENCES Ingredients,
    FOREIGN KEY (B_name) REFERENCES Beverage1
);

CREATE TABLE Ingredients
(
    name char(50) PRIMARY KEY
);

CREATE TABLE Have
(
    BTS_name char(50),
    B_name   char(50),
    location char(50),
    I_name   char(50),
    PRIMARY KEY (BTS_name, B_name, location, I_name),
    FOREIGN KEY (BTS_name, location) REFERENCES BubbleTeaShop ON DELETE CASCADE,
    FOREIGN KEY (I_name) REFERENCES Ingredients,
    FOREIGN KEY (B_name) REFERENCES Beverage1
);


CREATE TABLE Milk
(
    name      char(50) PRIMARY KEY,
    fat_level char(50),
    FOREIGN KEY (name) REFERENCES Ingredients ON DELETE CASCADE

);

CREATE TABLE Topping
(
    name    char(50) PRIMARY KEY,
    texture char(50),
    flavour char (50),
    FOREIGN KEY (name) REFERENCES Ingredients ON DELETE CASCADE
);

CREATE TABLE Packaging1
(
    logo ORDIMAGE PRIMARY KEY,
    type char(50)
);

CREATE TABLE Packaging2
(
    logo           ORDIMAGE PRIMARY KEY,
    seasonal_style char(50)
);

CREATE TABLE Packaging3
(
    seasonal_style char(50) PRIMARY KEY,
    ambassador     char(50)
);







