/// <summary>
/// Codeunit "FillFieldsTable_ANJ" (ID 80700).
/// </summary>
codeunit 80700 FillFieldsTable_ANJ
{
    Access = Public;

    /// <summary>
    /// GenerateData.
    /// </summary>
    /// <param name="MedicalTests">Code[20].</param>
    /// <param name="TableNo">Integer.</param>
    /// <param name="RelationshipsType">Enum RelationshipsType_ANJ.</param>
    internal procedure GenerateData(MedicalTests: Code[20]; TableNo: Integer; RelationshipsType: Enum RelationshipsType_ANJ)
    var
        IsHandled: Boolean;
    begin
        OnBeforeGenerateData(MedicalTests, TableNo, IsHandled);
        DoGenerateData(MedicalTests, TableNo, RelationshipsType, IsHandled);
        OnAfterGenerateData(MedicalTests, TableNo);
    end;

    /// <summary>
    /// DoGenerateData.
    /// </summary>
    /// <param name="MedicalTests">Code[20].</param>
    /// <param name="TableNo">Integer.</param>
    /// <param name="RelationshipsType">Enum RelationshipsType_ANJ.</param>
    /// <param name="IsHandled">Boolean.</param>
    local procedure DoGenerateData(MedicalTests: Code[20]; TableNo: Integer; RelationshipsType: Enum RelationshipsType_ANJ; IsHandled: Boolean);
    var
        AuxField: Record Field;
        RelationFieldNo: Integer;
        IRelationshipsType: Interface RelationshipsType_ANJ;
    begin
        if IsHandled then
            exit;

        if (MedicalTests = '') or (TableNo = 0) then
            exit;

        IRelationshipsType := RelationshipsType;
        AuxField.SetLoadFields(RelationTableNo, RelationFieldNo);
        AuxField.SetRange(TableNo, TableNo);
        AuxField.SetFilter("No.", '<%1', AuxField.FieldNo(SystemId)); // Exclude Control Fields
        AuxField.SetFilter(RelationTableNo, '>%1', 0);
        if AuxField.FindSet(false) then
            repeat
                RelationFieldNo := FieldCheckerRealTR.CheckAndGetNewFieldID(AuxField.RelationTableNo, AuxField.RelationFieldNo);
                if IRelationshipsType.CheckRulesBeforeInsertFieldLine(TableNo, AuxField."No.", AuxField.RelationTableNo, RelationFieldNo) then
                    InsertFieldLine(MedicalTests, TableNo, AuxField."No.", AuxField.RelationTableNo, RelationFieldNo);
            until AuxField.Next() = 0;
    end;

    /// <summary>
    /// InsertFieldLine.
    /// </summary>
    /// <param name="MedicalTests">Code[20].</param>
    /// <param name="TableNo">Integer.</param>
    /// <param name="FieldNo">Integer.</param>
    /// <param name="RelationTableNo">Integer.</param>
    /// <param name="RelationFieldNo">Integer.</param>
    local procedure InsertFieldLine(MedicalTests: Code[20]; TableNo: Integer; FieldNo: Integer; RelationTableNo: Integer; RelationFieldNo: Integer);
    var
        FieldsToAnalyze: Record FieldsToAnalyze_ANJ;
        IsHandled: Boolean;
    begin
        OnBeforeInsertFieldLine(MedicalTests, TableNo, FieldNo, RelationTableNo, RelationFieldNo, IsHandled);
        if IsHandled then
            exit;

        FieldsToAnalyze.Init();
        FieldsToAnalyze.Validate(MedicalTests, MedicalTests);
        FieldsToAnalyze.Validate(TableNo, TableNo);
        FieldsToAnalyze.Validate(FieldNo, FieldNo);
        FieldsToAnalyze.Insert(true);
        FieldsToAnalyze.Validate(RelationTableNo, RelationTableNo);
        FieldsToAnalyze.Validate(RelationFieldNo, RelationFieldNo);
        FieldsToAnalyze.Modify(true);

        OnAfterInsertFieldLine(MedicalTests, TableNo, FieldNo, RelationTableNo, RelationFieldNo);
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeInsertFieldLine(MedicalTests: Code[20]; TableNo: Integer; FieldNo: Integer; RelationTableNo: Integer; RelationFieldNo: Integer; var IsHandled: Boolean);
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterInsertFieldLine(MedicalTests: Code[20]; TableNo: Integer; FieldNo: Integer; RelationTableNo: Integer; RelationFieldNo: Integer);
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeGenerateData(MedicalTests: Code[20]; TableNo: Integer; var IsHandled: Boolean);
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterGenerateData(MedicalTests: Code[20]; TableNo: Integer);
    begin
    end;

    var
        FieldCheckerRealTR: Codeunit FieldCheckerRealTR_ANJ;
}