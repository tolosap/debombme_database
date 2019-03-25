-- Exported from QuickDBD: https://www.quickdatatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).

CREATE TABLE `Usuario` (
    `UsuarioID` int  NOT NULL ,
    `Nombre` string  NOT NULL ,
    `Password` string  NOT NULL ,
    PRIMARY KEY (
        `UsuarioID`
    )
);

CREATE TABLE `Usuarios_Bombas` (
    `UsuarioFK` int  NOT NULL ,
    `BombaFK` int  NOT NULL ,
    PRIMARY KEY (
        `UsuarioFK`,`BombaFK`
    )
);

CREATE TABLE `Bomba` (
    `BombaID` int  NOT NULL ,
    `Puntuacion` int  NOT NULL ,
    `Dificultad` int  NOT NULL ,
    `BotonFK` int  NOT NULL ,
    `PasswordFK` int  NOT NULL ,
    `SimonFK` int  NOT NULL ,
    `ContadorFK` int  NOT NULL ,
    `TemporizadorFK` int  NOT NULL ,
    PRIMARY KEY (
        `BombaID`
    )
);

CREATE TABLE `Mod_Boton` (
    `BotonID` int  NOT NULL ,
    `Texto` string  NOT NULL ,
    `Color` string  NOT NULL ,
    `Valor` int  NOT NULL ,
    PRIMARY KEY (
        `BotonID`
    )
);

CREATE TABLE `Mod_Password` (
    `PasswordID` int  NOT NULL ,
    `Texto` string  NOT NULL ,
    PRIMARY KEY (
        `PasswordID`
    )
);

CREATE TABLE `Mod_Simbolos` (
    `SimboloID` int  NOT NULL ,
    `Simbolo` string  NOT NULL ,
    PRIMARY KEY (
        `SimboloID`
    )
);

CREATE TABLE `Mod_Simon` (
    `SimonID` int  NOT NULL ,
    `Secuencia` string  NOT NULL ,
    PRIMARY KEY (
        `SimonID`
    )
);

CREATE TABLE `Mod_Contador` (
    `ContadorID` int  NOT NULL ,
    `Valor` int  NOT NULL ,
    PRIMARY KEY (
        `ContadorID`
    )
);

CREATE TABLE `Mod_Temporizador` (
    `TempoID` int  NOT NULL ,
    `Valor` int  NOT NULL ,
    PRIMARY KEY (
        `TempoID`
    )
);

CREATE TABLE `Bombas_Simbolos` (
    `BombaFK` int  NOT NULL ,
    `SimboloFK` int  NOT NULL ,
    PRIMARY KEY (
        `BombaFK`,`SimboloFK`
    )
);

ALTER TABLE `Usuarios_Bombas` ADD CONSTRAINT `fk_Usuarios_Bombas_UsuarioFK` FOREIGN KEY(`UsuarioFK`)
REFERENCES `Usuario` (`UsuarioID`);

ALTER TABLE `Usuarios_Bombas` ADD CONSTRAINT `fk_Usuarios_Bombas_BombaFK` FOREIGN KEY(`BombaFK`)
REFERENCES `bmb` (`BombaID`);

ALTER TABLE `Bomba` ADD CONSTRAINT `fk_Bomba_BotonFK` FOREIGN KEY(`BotonFK`)
REFERENCES `Mod_Boton` (`BotonID`);

ALTER TABLE `Bomba` ADD CONSTRAINT `fk_Bomba_PasswordFK` FOREIGN KEY(`PasswordFK`)
REFERENCES `Mod_Password` (`PasswordID`);

ALTER TABLE `Bomba` ADD CONSTRAINT `fk_Bomba_SimonFK` FOREIGN KEY(`SimonFK`)
REFERENCES `Mod_Simon` (`SimonID`);

ALTER TABLE `Bomba` ADD CONSTRAINT `fk_Bomba_ContadorFK` FOREIGN KEY(`ContadorFK`)
REFERENCES `Mod_Contador` (`ContadorID`);

ALTER TABLE `Bomba` ADD CONSTRAINT `fk_Bomba_TemporizadorFK` FOREIGN KEY(`TemporizadorFK`)
REFERENCES `Mod_Temporizador` (`TempoID`);

ALTER TABLE `Bombas_Simbolos` ADD CONSTRAINT `fk_Bombas_Simbolos_BombaFK` FOREIGN KEY(`BombaFK`)
REFERENCES `bmb` (`BombaID`);

ALTER TABLE `Bombas_Simbolos` ADD CONSTRAINT `fk_Bombas_Simbolos_SimboloFK` FOREIGN KEY(`SimboloFK`)
REFERENCES `simb` (`SimboloID`);

