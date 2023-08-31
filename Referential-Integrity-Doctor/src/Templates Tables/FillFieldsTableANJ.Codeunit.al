/// <summary>
/// Codeunit FillFieldsTable_ANJ (ID 80700).
/// </summary>
codeunit 80700 FillFieldsTable_ANJ
{
    Access = Public;

    /// <summary>
    /// GenerateData.
    /// </summary>
    /// <param name="MedicalTests">Code[20].</param>
    /// <param name="TableNo">Integer.</param>
    internal procedure GenerateData(MedicalTests: Code[20]; TableNo: Integer)
    var
        IsHandled: Boolean;
    begin
        OnBeforeGenerateData(MedicalTests, TableNo, IsHandled);
        DoGenerateData(MedicalTests, TableNo, IsHandled);
        OnAfterGenerateData(MedicalTests, TableNo);
    end;

    /// <summary>
    /// DoGenerateData.
    /// </summary>
    /// <param name="MedicalTests">Code[20].</param>
    /// <param name="TableNo">Integer.</param>
    /// <param name="IsHandled">Boolean.</param>
    local procedure DoGenerateData(MedicalTests: Code[20]; TableNo: Integer; IsHandled: Boolean);
    begin
        if IsHandled then
            exit;

        if (MedicalTests = '') or (TableNo = 0) then
            exit;

        CheckAllFields(MedicalTests, TableNo);
    end;

    /// <summary>
    /// CheckAllFields.
    /// </summary>
    /// <param name="MedicalTests">Code[20].</param>
    /// <param name="TableNo">Integer.</param>
    local procedure CheckAllFields(MedicalTests: Code[20]; TableNo: Integer)
    var
        AuxField: Record Field;
        AuxRecordRef: RecordRef;
        FieldNo: Integer;
        RelationTableNo: Integer;
    begin
        AuxRecordRef.Open(TableNo);
        AuxField.SetLoadFields("No.");
        AuxField.SetRange(TableNo, TableNo);
        AuxField.SetRange(ObsoleteState, AuxField.ObsoleteState::"No");
        AuxField.SetFilter("No.", '<%1', AuxField.FieldNo(SystemId)); // Exclude Control Fields
        if AuxField.FindSet(false) then
            repeat
                FieldNo := AuxField."No.";
                RelationTableNo := AuxRecordRef.Field(FieldNo).Relation();
                if RelationTableNo <> 0 then
                    CheckField(MedicalTests, TableNo, FieldNo, RelationTableNo);
            until AuxField.Next() = 0;
        AuxRecordRef.Close();
    end;

    /// <summary>
    /// CheckField.
    /// </summary>
    /// <param name="MedicalTests">VAR Code[20].</param>
    /// <param name="TableNo">VAR Integer.</param>
    /// <param name="FieldNo">VAR Integer.</param>
    /// <param name="RelationTableNo">VAR Integer.</param>
    local procedure CheckField(MedicalTests: Code[20]; TableNo: Integer; FieldNo: Integer; RelationTableNo: Integer)
    var
        FamilyTree: Codeunit FamilyTree_ANJ;
        RelatedKeyFieldList: List of [Integer];
    begin
        FamilyTree.GetRelationship(RelationTableNo, RelatedKeyFieldList);
        InsertFieldLine(MedicalTests, TableNo, FieldNo, RelationTableNo, RelatedKeyFieldList);
    end;

    /// <summary>
    /// InsertFieldLine.
    /// </summary>
    /// <param name="MedicalTests">Code[20].</param>
    /// <param name="TableNo">Integer.</param>
    /// <param name="FieldNo">Integer.</param>
    /// <param name="RelationTableNo">Integer.</param>
    /// <param name="RelatedKeyFieldList">Text.</param>
    local procedure InsertFieldLine(MedicalTests: Code[20]; TableNo: Integer; FieldNo: Integer; RelationTableNo: Integer; var RelatedKeyFieldList: List of [Integer]);
    var
        FieldsToAnalyze: Record FieldsToAnalyze_ANJ;
        IsHandled: Boolean;
    begin
        if IsHandled then
            exit;

        OnBeforeInsertFieldLine(MedicalTests, TableNo, FieldNo, RelationTableNo, RelatedKeyFieldList, IsHandled);

        FieldsToAnalyze.Init();
        FieldsToAnalyze.Validate(MedicalTests, MedicalTests);
        FieldsToAnalyze.Validate(TableNo, TableNo);
        FieldsToAnalyze.Validate(FieldNo, FieldNo);
        FieldsToAnalyze.Insert(true);
        FieldsToAnalyze.Validate(RelationTableNo, RelationTableNo);
        FieldsToAnalyze.Modify(true);
        OnAfterInsertFieldLine(MedicalTests, TableNo, FieldNo, RelationTableNo, RelatedKeyFieldList);

        InsertTableRelationsLines(MedicalTests, TableNo, FieldNo, RelationTableNo, RelatedKeyFieldList);
    end;

    /// <summary>
    /// InsertTableRelationsLines.
    /// </summary>
    /// <param name="MedicalTests">Code[20].</param>
    /// <param name="TableNo">Integer.</param>
    /// <param name="RelationTableNo">Integer.</param>
    /// <param name="RelatedKeyFieldList">VAR Dictionary of [Integer, Text[250]].</param>
    local procedure InsertTableRelationsLines(MedicalTests: Code[20]; TableNo: Integer; FieldNo: Integer; RelationTableNo: Integer; var RelatedKeyFieldList: List of [Integer])
    var
        TableRelations: Record TableRelations_ANJ;
        RelationField: Integer;
    begin
        OnBeforeInsertTableRelationsLines(MedicalTests, TableNo, RelationTableNo, RelatedKeyFieldList);
        foreach RelationField in RelatedKeyFieldList do begin
            TableRelations.Init();
            TableRelations.Validate(MedicalTests, MedicalTests);
            TableRelations.Validate(TableNo, TableNo);
            TableRelations.Validate(FieldNo, FieldNo);
            TableRelations.Insert(true);
            TableRelations.Validate(RelationTableNo, RelationTableNo);
            TableRelations.Validate(RelationFieldNo, RelationField);
            FillFieldFormat(TableRelations, RelationTableNo, RelationField);
            TableRelations.Modify(true);
        end;
        OnAfterInsertTableRelationsLines(MedicalTests, TableNo, RelationTableNo, RelatedKeyFieldList);
    end;

    /// <summary>
    /// FillFieldFormat.
    /// </summary>
    /// <param name="TableRelations">VAR Record TableRelations_ANJ.</param>
    /// <param name="TableNo">Integer.</param>
    /// <param name="FieldNo">Integer.</param>
    local procedure FillFieldFormat(var TableRelations: Record TableRelations_ANJ; TableNo: Integer; FieldNo: Integer)
    var
        AuxField: Record Field;
    begin
        AuxField.SetLoadFields(Type);
        AuxField.SetRange(TableNo, TableNo);
        AuxField.SetRange("No.", FieldNo);
        if not AuxField.FindFirst() then
            exit;

        TableRelations.Validate(FieldFormat, AuxField.Type);
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeInsertFieldLine(MedicalTests: Code[20]; TableNo: Integer; FieldNo: Integer; RelationTableNo: Integer; var RelatedKeyFieldList: List of [Integer]; var IsHandled: Boolean);
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterInsertFieldLine(MedicalTests: Code[20]; TableNo: Integer; FieldNo: Integer; RelationTableNo: Integer; RelatedKeyFieldList: List of [Integer]);
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeInsertTableRelationsLines(MedicalTests: Code[20]; TableNo: Integer; RelationTableNo: Integer; var RelatedKeyFieldList: List of [Integer]);
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterInsertTableRelationsLines(MedicalTests: Code[20]; TableNo: Integer; RelationTableNo: Integer; RelatedKeyFieldList: List of [Integer]);
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
}