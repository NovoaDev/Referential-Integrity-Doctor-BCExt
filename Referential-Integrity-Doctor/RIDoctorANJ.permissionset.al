permissionset 80700 RIDoctor_ANJ
{
    Access = Public;
    Assignable = true;
    Permissions = tabledata FieldsToAnalyze_ANJ = RIMD,
        tabledata MedicalTests_ANJ = RIMD,
        tabledata TablesToClean_ANJ = RIMD,
        tabledata TheRIDoctor_ANJ = RIMD,
        table FieldsToAnalyze_ANJ = X,
        table MedicalTests_ANJ = X,
        table TablesToClean_ANJ = X,
        table TheRIDoctor_ANJ = X,
        codeunit FillFieldsTable_ANJ = X,
        page FieldsToAnalyze_ANJ = X,
        page MedicalTests_ANJ = X,
        page MedicalTest_ANJ = X,
        page TablesToClean_ANJ = X,
        page TheRIDoctor_ANJ = X,
        codeunit FieldCheckerRealTR_ANJ = X,
        codeunit ForeignKeysImp_ANJ = X,
        codeunit ReviewerFieldIsPartOfPK_ANJ = X,
        codeunit InfoTableCleaner_ANJ = X,
        codeunit InfoTableGenerator_ANJ = X,
        codeunit PerRangeImplementation_ANJ = X,
        page FillIdByRange_ANJ = X,
        page ShowTableList_ANJ = X;
}