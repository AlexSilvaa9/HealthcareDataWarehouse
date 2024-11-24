-- Generado por Oracle SQL Developer Data Modeler 23.1.0.087.0806
--   en:        2024-11-24 22:45:39 CET
--   sitio:      SQL Server 2012
--   tipo:      SQL Server 2012



CREATE TABLE Alergia 
    (
     alergiaID INTEGER NOT NULL , 
     nombreAlergia VARCHAR (255) , 
     tipoAlergia VARCHAR (255) , 
     nombreMedicamento VARCHAR (255) 
    )
GO

ALTER TABLE Alergia ADD CONSTRAINT Alergia_PK PRIMARY KEY CLUSTERED (alergiaID)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE Anyo 
    (
     anyoID INTEGER NOT NULL 
    )
GO

ALTER TABLE Anyo ADD CONSTRAINT Anyo_PK PRIMARY KEY CLUSTERED (anyoID)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE EstanciaHospital 
    (
     estanciaHospitalID INTEGER NOT NULL , 
     fuenteAdmision VARCHAR (30) , 
     estadoAltaHospitalaria VARCHAR (10) 
    )
GO

ALTER TABLE EstanciaHospital ADD CONSTRAINT EstanciaHospital_PK PRIMARY KEY CLUSTERED (estanciaHospitalID)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE GastoMedicamento 
    (
     GastoMedicamento_ID NUMERIC (28) NOT NULL IDENTITY NOT FOR REPLICATION , 
     cantidad BIGINT , 
     tasa_infusion BIGINT , 
     volumen_fluido BIGINT , 
     Anyo_anyoID INTEGER , 
     Hospital_hospitalID INTEGER , 
     Medicamento_medicamentoId VARCHAR , 
     IngresoUCI_ingresoUCIID INTEGER NOT NULL , 
     Paciente_uniquePID VARCHAR (10) 
    )
GO

ALTER TABLE GastoMedicamento ADD CONSTRAINT GastoMedicamento_PK PRIMARY KEY CLUSTERED (GastoMedicamento_ID)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE Hospital 
    (
     hospitalID INTEGER NOT NULL , 
     numeroCamasCategoria VARCHAR (255) , 
     Region_regionId VARCHAR (255) 
    )
GO

ALTER TABLE Hospital ADD CONSTRAINT Hospital_PK PRIMARY KEY CLUSTERED (hospitalID)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE IngresoUCI 
    (
     ingresoUCIID INTEGER NOT NULL , 
     tipoUnidad VARCHAR (50) , 
     alturaAdmision BIGINT , 
     pesoAdmision BIGINT , 
     edadAdmision VARCHAR (10) , 
     generoAdmision VARCHAR (25) , 
     EstanciaHospital_estanciaHospitalID INTEGER 
    )
GO

ALTER TABLE IngresoUCI ADD CONSTRAINT IngresoUCI_PK PRIMARY KEY CLUSTERED (ingresoUCIID)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE Medicamento 
    (
     medicamentoId VARCHAR NOT NULL , 
     nombreMedicamento VARCHAR (255) 
    )
GO

ALTER TABLE Medicamento ADD CONSTRAINT Medicamento_PK PRIMARY KEY CLUSTERED (medicamentoId)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE Paciente 
    (
     uniquePID VARCHAR (10) NOT NULL , 
     genero VARCHAR (1) , 
     etnia VARCHAR (50) 
    )
GO

ALTER TABLE Paciente ADD CONSTRAINT Paciente_PK PRIMARY KEY CLUSTERED (uniquePID)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE Region 
    (
     regionId VARCHAR (255) NOT NULL , 
     nombreRegion VARCHAR (64) 
    )
GO

ALTER TABLE Region ADD CONSTRAINT Region_PK PRIMARY KEY CLUSTERED (regionId)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE Relation_10 
    (
     Alergia_alergiaID INTEGER NOT NULL , 
     GastoMedicamento_GastoMedicamento_ID NUMERIC (28) NOT NULL 
    )
GO

ALTER TABLE Relation_10 ADD CONSTRAINT Relation_10_PK PRIMARY KEY CLUSTERED (Alergia_alergiaID, GastoMedicamento_GastoMedicamento_ID)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE Relation_11 
    (
     Tratamiento_tratamientoID INTEGER NOT NULL , 
     GastoMedicamento_GastoMedicamento_ID NUMERIC (28) NOT NULL 
    )
GO

ALTER TABLE Relation_11 ADD CONSTRAINT Relation_11_PK PRIMARY KEY CLUSTERED (Tratamiento_tratamientoID, GastoMedicamento_GastoMedicamento_ID)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE Tratamiento 
    (
     tratamientoID INTEGER NOT NULL , 
     descripcion VARCHAR (200) 
    )
GO

ALTER TABLE Tratamiento ADD CONSTRAINT Tratamiento_PK PRIMARY KEY CLUSTERED (tratamientoID)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

ALTER TABLE GastoMedicamento 
    ADD CONSTRAINT GastoMedicamento_Anyo_FK FOREIGN KEY 
    ( 
     Anyo_anyoID
    ) 
    REFERENCES Anyo 
    ( 
     anyoID 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE GastoMedicamento 
    ADD CONSTRAINT GastoMedicamento_Hospital_FK FOREIGN KEY 
    ( 
     Hospital_hospitalID
    ) 
    REFERENCES Hospital 
    ( 
     hospitalID 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE GastoMedicamento 
    ADD CONSTRAINT GastoMedicamento_IngresoUCI_FK FOREIGN KEY 
    ( 
     IngresoUCI_ingresoUCIID
    ) 
    REFERENCES IngresoUCI 
    ( 
     ingresoUCIID 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE GastoMedicamento 
    ADD CONSTRAINT GastoMedicamento_Medicamento_FK FOREIGN KEY 
    ( 
     Medicamento_medicamentoId
    ) 
    REFERENCES Medicamento 
    ( 
     medicamentoId 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE GastoMedicamento 
    ADD CONSTRAINT GastoMedicamento_Paciente_FK FOREIGN KEY 
    ( 
     Paciente_uniquePID
    ) 
    REFERENCES Paciente 
    ( 
     uniquePID 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Hospital 
    ADD CONSTRAINT Hospital_Region_FK FOREIGN KEY 
    ( 
     Region_regionId
    ) 
    REFERENCES Region 
    ( 
     regionId 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE IngresoUCI 
    ADD CONSTRAINT IngresoUCI_EstanciaHospital_FK FOREIGN KEY 
    ( 
     EstanciaHospital_estanciaHospitalID
    ) 
    REFERENCES EstanciaHospital 
    ( 
     estanciaHospitalID 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Relation_10 
    ADD CONSTRAINT Relation_10_Alergia_FK FOREIGN KEY 
    ( 
     Alergia_alergiaID
    ) 
    REFERENCES Alergia 
    ( 
     alergiaID 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Relation_10 
    ADD CONSTRAINT Relation_10_GastoMedicamento_FK FOREIGN KEY 
    ( 
     GastoMedicamento_GastoMedicamento_ID
    ) 
    REFERENCES GastoMedicamento 
    ( 
     GastoMedicamento_ID 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Relation_11 
    ADD CONSTRAINT Relation_11_GastoMedicamento_FK FOREIGN KEY 
    ( 
     GastoMedicamento_GastoMedicamento_ID
    ) 
    REFERENCES GastoMedicamento 
    ( 
     GastoMedicamento_ID 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Relation_11 
    ADD CONSTRAINT Relation_11_Tratamiento_FK FOREIGN KEY 
    ( 
     Tratamiento_tratamientoID
    ) 
    REFERENCES Tratamiento 
    ( 
     tratamientoID 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            12
-- CREATE INDEX                             0
-- ALTER TABLE                             23
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE DATABASE                          0
-- CREATE DEFAULT                           0
-- CREATE INDEX ON VIEW                     0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE ROLE                              0
-- CREATE RULE                              0
-- CREATE SCHEMA                            0
-- CREATE SEQUENCE                          0
-- CREATE PARTITION FUNCTION                0
-- CREATE PARTITION SCHEME                  0
-- 
-- DROP DATABASE                            0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
