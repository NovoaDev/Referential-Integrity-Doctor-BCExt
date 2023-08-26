/// <summary>
/// Codeunit FamilyTree_ANJ (ID 80703).
/// </summary>
codeunit 80703 FamilyTree_ANJ
{
    Access = Public;

    /// <summary>
    /// GetRelationship.
    /// </summary>
    /// <param name="AuxField">Record Field.</param>
    /// <param name="RelationTableNo">VAR Integer.</param>
    /// <param name="RelationFieldNo">VAR Integer.</param>
    /// <param name="FiltersToApply">VAR Dictionary of [Integer, Text].</param>
    internal procedure GetRelationship(var AuxField: Record Field; var RelationTableNo: Integer; var RelationFieldNo: Integer; var FiltersToApply: Dictionary of [Integer, Text[250]])
    var
        IsHandled: Boolean;
    begin
        OnBeforeGetRelationship(AuxField, RelationTableNo, RelationFieldNo, FiltersToApply, IsHandled);
        DoGetRelationship(AuxField, RelationTableNo, RelationFieldNo, FiltersToApply, IsHandled);
        OnAfterGetRelationship(AuxField, RelationTableNo, RelationFieldNo, FiltersToApply);
    end;

    /// <summary>
    /// DoGetRelationship.
    /// </summary>
    /// <param name="AuxField">Record Field.</param>
    /// <param name="RelationTableNo">VAR Integer.</param>
    /// <param name="RelationFieldNo">VAR Integer.</param>
    /// <param name="FiltersToApply">VAR Dictionary of [Integer, Text].</param>
    /// <param name="IsHandled">Boolean.</param>
    local procedure DoGetRelationship(var AuxField: Record Field; var RelationTableNo: Integer; var RelationFieldNo: Integer; var FiltersToApply: Dictionary of [Integer, Text[250]]; IsHandled: Boolean)
    var
        FieldList: List of [Integer];
    begin
        if IsHandled then
            exit;

        RelationTableNo := AuxField.RelationTableNo;

        GetKeyFieldList(RelationTableNo, FieldList);
        GetRelationship(AuxField, RelationFieldNo, FiltersToApply, FieldList);
    end;

    /// <summary>
    /// GetRelationship.
    /// </summary>
    /// <param name="AuxField">VAR Record Field.</param>
    /// <param name="RelationFieldNo">VAR Integer.</param>
    /// <param name="FiltersToApply">VAR Text.</param>
    /// <param name="FieldList">List of [Integer].</param>
    local procedure GetRelationship(var AuxField: Record Field; var RelationFieldNo: Integer; var FiltersToApply: Dictionary of [Integer, Text[250]]; FieldList: List of [Integer])
    begin
        Clear(RelationFieldNo);
        Clear(FiltersToApply);

        if FieldList.Count() = 1 then begin
            RelationFieldNo := FieldList.Get(1);
            FiltersToApply.Add(AuxField."No.", StrSubstNo(FieldLbl, RelationFieldNo));
            exit;
        end;

        // TODO: Missing composite relationship data
    end;

    /// <summary>
    /// GetKeyFieldList.
    /// </summary>
    /// <param name="TableNo">Integer.</param>
    /// <param name="FieldList">VAR List of [Integer].</param>
    local procedure GetKeyFieldList(TableNo: Integer; var FieldList: List of [Integer])
    var
        AuxRecordRef: RecordRef;
        AuxFieldRefs: FieldRef;
        Iterator: Integer;
        AuxKeyRef: KeyRef;
    begin
        AuxRecordRef.Open(TableNo);
        AuxKeyRef := AuxRecordRef.KeyIndex(AuxRecordRef.CurrentKeyIndex());

        for Iterator := 1 to AuxKeyRef.FieldCount() do begin
            AuxFieldRefs := AuxKeyRef.FieldIndex(Iterator);
            if not FieldList.Contains(AuxFieldRefs.Number()) then
                FieldList.Add(AuxFieldRefs.Number);
        end;
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeGetRelationship(AuxField: Record Field; var RelationTableNo: Integer; var RelationFieldNo: Integer; var FiltersToApply: Dictionary of [Integer, Text[250]]; var IsHandled: Boolean);
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterGetRelationship(AuxField: Record Field; var RelationTableNo: Integer; var RelationFieldNo: Integer; FiltersToApply: Dictionary of [Integer, Text[250]]);
    begin
    end;

    var
        FieldLbl: Label 'Field:%1';
}