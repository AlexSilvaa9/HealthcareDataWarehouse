USE UCIDW;
GO

SET ANSI_NULLS ON;
GO
SET QUOTED_IDENTIFIER ON;
GO

CREATE OR ALTER PROCEDURE BorrarAlmacen	
AS
BEGIN
    BEGIN TRY
        -- Iniciar transacción
        BEGIN TRANSACTION;

        -- Eliminar datos de las tablas
		
		DELETE FROM Relation_10;
        DELETE FROM Relation_11;

		DELETE FROM GastoMedicamento;


        DELETE FROM Medicamento;
        DELETE FROM Alergia;
        DELETE FROM Anyo;
        DELETE FROM Tratamiento;

		DELETE FROM Hospital;
        DELETE FROM Region;
        
		DELETE FROM IngresoUCI;
        DELETE FROM EstanciaHospital;
        
        DELETE FROM Paciente;
        
        

        -- Reiniciar los valores de identidad
        DBCC CHECKIDENT ('Medicamento', RESEED, 0);
        DBCC CHECKIDENT ('Alergia', RESEED, 0);
        
        DBCC CHECKIDENT ('Tratamiento', RESEED, 0);
        DBCC CHECKIDENT ('Region', RESEED, 0);
        DBCC CHECKIDENT ('Hospital', RESEED, 0);
        DBCC CHECKIDENT ('EstanciaHospital', RESEED, 0);
        DBCC CHECKIDENT ('IngresoUCI', RESEED, 0);
        DBCC CHECKIDENT ('Paciente', RESEED, 0);
       
        DBCC CHECKIDENT ('GastoMedicamento', RESEED, 0);

        -- Confirmar transacción
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        -- Deshacer transacción si ocurre un error
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;

        -- Rethrow del error para depuración
        THROW;
    END CATCH;
END;
GO
