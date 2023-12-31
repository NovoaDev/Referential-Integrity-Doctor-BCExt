permissionset 80700 RIDoctor_ANJ
{
    Access = Public;
    Assignable = true;

    Permissions = tabledata Diagnostic_ANJ = RIMD,
        tabledata FieldsToAnalyze_ANJ = RIMD,
        tabledata MedicalTests_ANJ = RIMD,
        tabledata TableFilters_ANJ = RIMD,
        tabledata TableRelations_ANJ = RIMD,
        tabledata TablesToClean_ANJ = RIMD,
        tabledata TheRIDoctor_ANJ = RIMD,
        table Diagnostic_ANJ = X,
        table FieldsToAnalyze_ANJ = X,
        table MedicalTests_ANJ = X,
        table TableFilters_ANJ = X,
        table TableRelations_ANJ = X,
        table TablesToClean_ANJ = X,
        table TheRIDoctor_ANJ = X,
        codeunit ConstantFieldTypeIMP_ANJ = X,
        codeunit DefaultSolutionIMP_ANJ = X,
        codeunit DiagnosticCleaner_ANJ = X,
        codeunit DoNothingSolutionIMP_ANJ = X,
        codeunit ErrorStatusIMP_ANJ = X,
        codeunit FactBoxImgLoader_ANJ = X,
        codeunit FactBoxTextLoader_ANJ = X,
        codeunit FamilyTree_ANJ = X,
        codeunit FieldFieldTypeIMP_ANJ = X,
        codeunit FillDictFromTableFilters_ANJ = X,
        codeunit FillFieldsTable_ANJ = X,
        codeunit FillingOfGraphics_ANJ = X,
        codeunit FillingOfPieGraphics_ANJ = X,
        codeunit FilterApplicator_ANJ = X,
        codeunit ForeignKeysImp_ANJ = X,
        codeunit GenerateMissingRecordsIMP_ANJ = X,
        codeunit InfoTableCleaner_ANJ = X,
        codeunit InfoTableGenerator_ANJ = X,
        codeunit NOStatusIMP_ANJ = X,
        codeunit OKStatusIMP_ANJ = X,
        codeunit PerRangeImplementation_ANJ = X,
        codeunit SolveTheProblems_ANJ = X,
        codeunit TheRIDoctor_ANJ = X,
        codeunit TotalRecordCalculator_ANJ = X,
        codeunit UpdateOrphanedSolutionIMP_ANJ = X,
        codeunit UpdateRIDocFactBox_ANJ = X,
        codeunit VisualIndicator_ANJ = X,
        codeunit WarningStatusIMP_ANJ = X,
        page DiagnosticChart_ANJ = X,
        page DiagnosticPie_ANJ = X,
        page Diagnostic_ANJ = X,
        page FactBoxStatusPicture_ANJ = X,
        page FieldsToAnalyze_ANJ = X,
        page FillIdByRange_ANJ = X,
        page MedicalTests_ANJ = X,
        page MedicalTest_ANJ = X,
        page ShowFields_ANJ = X,
        page ShowTableList_ANJ = X,
        page TableFilters_ANJ = X,
        page TableRelations_ANJ = X,
        page TablesToClean_ANJ = X,
        page TheRIDoctor_ANJ = X;
}