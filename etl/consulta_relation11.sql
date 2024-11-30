SELECT 
   
  gmDW.GastoMedicamento_ID, trDW.tratamientoID 
FROM 
    [eICU Collaborative Research Database].dbo.Patient paDB,
    [eICU Collaborative Research Database].dbo.InfusionDrug infDB,
	[eICU Collaborative Research Database].dbo.Treatment trDB,

    UCIDW.dbo.GastoMedicamento gmDW,
    UCIDW.dbo.Tratamiento trDW
WHERE 
    paDB.PatientUnitStayID = infDB.PatientUnitStayID  AND 
	paDB.PatientUnitStayID = trDB.PatientUnitStayID  AND

	gmDW.nombre_gasto_medicamento = infDB.InfusionDrugID AND
	trDW.nombreTratamiento = trDB.TreatmentID 




