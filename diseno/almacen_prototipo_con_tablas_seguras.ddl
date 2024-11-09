-- Generado por Oracle SQL Developer Data Modeler 23.1.0.087.0806
--   en:        2024-11-09 23:57:54 CET
--   sitio:      SQL Server 2012
--   tipo:      SQL Server 2012



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
     cantidad BIGINT , 
     tasa_infusion BIGINT , 
     volumen_fluido BIGINT , 
     Anyo_anyoID INTEGER , 
     Hospital_hospitalID INTEGER , 
     Medicamento_medicamentoId VARCHAR , 
     IngresoUCI_ingresoUCIID INTEGER NOT NULL 
    )
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
     medicamentoId VARCHAR NOT NULL 
    )
GO

ALTER TABLE Medicamento ADD CONSTRAINT Medicamento_PK PRIMARY KEY CLUSTERED (medicamentoId)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE Region 
    (
     regionId VARCHAR (255) NOT NULL 
    )
GO

ALTER TABLE Region ADD CONSTRAINT Region_PK PRIMARY KEY CLUSTERED (regionId)
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



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                             7
-- CREATE INDEX                             0
-- ALTER TABLE                             12
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
