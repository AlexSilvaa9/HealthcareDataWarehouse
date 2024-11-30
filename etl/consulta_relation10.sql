SELECT DISTINCT
   
  gmDW.GastoMedicamento_ID, allDW.alergiaID
FROM 
    [eICU Collaborative Research Database].dbo.Patient paDB,
    [eICU Collaborative Research Database].dbo.InfusionDrug infDB,
	[eICU Collaborative Research Database].dbo.Allergy allDB,

    UCIDW.dbo.GastoMedicamento gmDW,
    UCIDW.dbo.Alergia allDW
WHERE 
    paDB.PatientUnitStayID = infDB.PatientUnitStayID  AND 
	paDB.PatientUnitStayID = allDB.PatientUnitStayID   AND

	gmDW.nombre_gasto_medicamento = infDB.InfusionDrugID AND
	allDB.AllergyName = allDW.nombreAlergia 



