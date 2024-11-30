SELECT 
    infDB.InfusionRate, 
    infDB.VolumeOfFluid, 
    infDB.DrugAmount, 
    paDW.uniquePID, 
    anyDW.anyoID, 
    hospDW.hospitalID, 
    ingrDW.ingresoUCIID, 
    medDW.medicamentoId,
	infDB.InfusionDrugID 
FROM 
    [eICU Collaborative Research Database].dbo.Patient paDB,
    [eICU Collaborative Research Database].dbo.InfusionDrug infDB,
    UCIDW.dbo.Paciente paDW,
    UCIDW.dbo.Anyo anyDW,
    UCIDW.dbo.Hospital hospDW,
    UCIDW.dbo.IngresoUCI ingrDW,
    UCIDW.dbo.Medicamento medDW
WHERE 
    paDB.PatientUnitStayID = infDB.PatientUnitStayID 
    AND paDW.nombrePaciente = paDB.UniquePID 
    AND paDB.HospitalDischargeYear = anyDW.anyo 
    AND paDB.HospitalID = hospDW.nombreHospital 
    AND ingrDW.nombreIngresoUCI = paDB.PatientUnitStayID 
    AND infDB.DrugName = medDW.nombreMedicamento 
    AND infDB.InfusionRate IS NOT NULL
    AND infDB.VolumeOfFluid IS NOT NULL
    AND infDB.DrugAmount IS NOT NULL
    AND paDW.uniquePID IS NOT NULL
    AND anyDW.anyoID IS NOT NULL
    AND hospDW.hospitalID IS NOT NULL
    AND ingrDW.ingresoUCIID IS NOT NULL
    AND medDW.medicamentoId IS NOT NULL;
