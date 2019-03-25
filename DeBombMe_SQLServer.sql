-- Exported from QuickDBD: https://www.quickdatatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).

SET XACT_ABORT ON

BEGIN TRANSACTION QUICKDBD

CREATE TABLE [Usuario] (
    [UsuarioID] int  NOT NULL ,
    [Nombre] string  NOT NULL ,
    [Password] string  NOT NULL ,
    CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED (
        [UsuarioID] ASC
    )
)

CREATE TABLE [Usuarios_Bombas] (
    [UsuarioFK] int  NOT NULL ,
    [BombaFK] int  NOT NULL ,
    CONSTRAINT [PK_Usuarios_Bombas] PRIMARY KEY CLUSTERED (
        [UsuarioFK] ASC,[BombaFK] ASC
    )
)

CREATE TABLE [Bomba] (
    [BombaID] int  NOT NULL ,
    [Puntuacion] int  NOT NULL ,
    [Dificultad] int  NOT NULL ,
    [BotonFK] int  NOT NULL ,
    [PasswordFK] int  NOT NULL ,
    [SimonFK] int  NOT NULL ,
    [ContadorFK] int  NOT NULL ,
    [TemporizadorFK] int  NOT NULL ,
    CONSTRAINT [PK_Bomba] PRIMARY KEY CLUSTERED (
        [BombaID] ASC
    )
)

CREATE TABLE [Mod_Boton] (
    [BotonID] int  NOT NULL ,
    [Texto] string  NOT NULL ,
    [Color] string  NOT NULL ,
    [Valor] int  NOT NULL ,
    CONSTRAINT [PK_Mod_Boton] PRIMARY KEY CLUSTERED (
        [BotonID] ASC
    )
)

CREATE TABLE [Mod_Password] (
    [PasswordID] int  NOT NULL ,
    [Texto] string  NOT NULL ,
    CONSTRAINT [PK_Mod_Password] PRIMARY KEY CLUSTERED (
        [PasswordID] ASC
    )
)

CREATE TABLE [Mod_Simbolos] (
    [SimboloID] int  NOT NULL ,
    [Simbolo] string  NOT NULL ,
    CONSTRAINT [PK_Mod_Simbolos] PRIMARY KEY CLUSTERED (
        [SimboloID] ASC
    )
)

CREATE TABLE [Mod_Simon] (
    [SimonID] int  NOT NULL ,
    [Secuencia] string  NOT NULL ,
    CONSTRAINT [PK_Mod_Simon] PRIMARY KEY CLUSTERED (
        [SimonID] ASC
    )
)

CREATE TABLE [Mod_Contador] (
    [ContadorID] int  NOT NULL ,
    [Valor] int  NOT NULL ,
    CONSTRAINT [PK_Mod_Contador] PRIMARY KEY CLUSTERED (
        [ContadorID] ASC
    )
)

CREATE TABLE [Mod_Temporizador] (
    [TempoID] int  NOT NULL ,
    [Valor] int  NOT NULL ,
    CONSTRAINT [PK_Mod_Temporizador] PRIMARY KEY CLUSTERED (
        [TempoID] ASC
    )
)

CREATE TABLE [Bombas_Simbolos] (
    [BombaFK] int  NOT NULL ,
    [SimboloFK] int  NOT NULL ,
    CONSTRAINT [PK_Bombas_Simbolos] PRIMARY KEY CLUSTERED (
        [BombaFK] ASC,[SimboloFK] ASC
    )
)

ALTER TABLE [Usuarios_Bombas] WITH CHECK ADD CONSTRAINT [FK_Usuarios_Bombas_UsuarioFK] FOREIGN KEY([UsuarioFK])
REFERENCES [Usuario] ([UsuarioID])

ALTER TABLE [Usuarios_Bombas] CHECK CONSTRAINT [FK_Usuarios_Bombas_UsuarioFK]

ALTER TABLE [Usuarios_Bombas] WITH CHECK ADD CONSTRAINT [FK_Usuarios_Bombas_BombaFK] FOREIGN KEY([BombaFK])
REFERENCES [bmb] ([BombaID])

ALTER TABLE [Usuarios_Bombas] CHECK CONSTRAINT [FK_Usuarios_Bombas_BombaFK]

ALTER TABLE [Bomba] WITH CHECK ADD CONSTRAINT [FK_Bomba_BotonFK] FOREIGN KEY([BotonFK])
REFERENCES [Mod_Boton] ([BotonID])

ALTER TABLE [Bomba] CHECK CONSTRAINT [FK_Bomba_BotonFK]

ALTER TABLE [Bomba] WITH CHECK ADD CONSTRAINT [FK_Bomba_PasswordFK] FOREIGN KEY([PasswordFK])
REFERENCES [Mod_Password] ([PasswordID])

ALTER TABLE [Bomba] CHECK CONSTRAINT [FK_Bomba_PasswordFK]

ALTER TABLE [Bomba] WITH CHECK ADD CONSTRAINT [FK_Bomba_SimonFK] FOREIGN KEY([SimonFK])
REFERENCES [Mod_Simon] ([SimonID])

ALTER TABLE [Bomba] CHECK CONSTRAINT [FK_Bomba_SimonFK]

ALTER TABLE [Bomba] WITH CHECK ADD CONSTRAINT [FK_Bomba_ContadorFK] FOREIGN KEY([ContadorFK])
REFERENCES [Mod_Contador] ([ContadorID])

ALTER TABLE [Bomba] CHECK CONSTRAINT [FK_Bomba_ContadorFK]

ALTER TABLE [Bomba] WITH CHECK ADD CONSTRAINT [FK_Bomba_TemporizadorFK] FOREIGN KEY([TemporizadorFK])
REFERENCES [Mod_Temporizador] ([TempoID])

ALTER TABLE [Bomba] CHECK CONSTRAINT [FK_Bomba_TemporizadorFK]

ALTER TABLE [Bombas_Simbolos] WITH CHECK ADD CONSTRAINT [FK_Bombas_Simbolos_BombaFK] FOREIGN KEY([BombaFK])
REFERENCES [bmb] ([BombaID])

ALTER TABLE [Bombas_Simbolos] CHECK CONSTRAINT [FK_Bombas_Simbolos_BombaFK]

ALTER TABLE [Bombas_Simbolos] WITH CHECK ADD CONSTRAINT [FK_Bombas_Simbolos_SimboloFK] FOREIGN KEY([SimboloFK])
REFERENCES [simb] ([SimboloID])

ALTER TABLE [Bombas_Simbolos] CHECK CONSTRAINT [FK_Bombas_Simbolos_SimboloFK]

COMMIT TRANSACTION QUICKDBD