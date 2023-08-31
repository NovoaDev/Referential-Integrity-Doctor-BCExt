/// <summary>
/// Codeunit FamilyTree_ANJ (ID 80703).
/// </summary>
codeunit 80703 FamilyTree_ANJ
{
    Access = Public;

    /// <summary>
    /// GetRelationship.
    /// </summary>
    /// <param name="RelationTableNo">VAR Integer.</param>
    /// <param name="FieldList">VAR Dictionary of [Integer, Text].</param>
    internal procedure GetRelationship(RelationTableNo: Integer; var FieldList: List of [Integer])
    var
        IsHandled: Boolean;
    begin
        OnBeforeGetRelationship(RelationTableNo, FieldList, IsHandled);
        DoGetRelationship(RelationTableNo, FieldList, IsHandled);
        OnAfterGetRelationship(RelationTableNo, FieldList);
    end;

    /// <summary>
    /// DoGetRelationship.
    /// </summary>
    /// <param name="RelationTableNo">VAR Integer.</param>
    /// <param name="FieldList">VAR Dictionary of [Integer, Text].</param>
    /// <param name="IsHandled">Boolean.</param>
    local procedure DoGetRelationship(RelationTableNo: Integer; var FieldList: List of [Integer]; IsHandled: Boolean)
    var
        AuxRecordRef: RecordRef;
        AuxFieldRefs: FieldRef;
        Iterator: Integer;
        AuxKeyRef: KeyRef;
    begin
        if IsHandled then
            exit;

        AuxRecordRef.Open(RelationTableNo);
        AuxKeyRef := AuxRecordRef.KeyIndex(AuxRecordRef.CurrentKeyIndex());

        for Iterator := 1 to AuxKeyRef.FieldCount() do begin
            AuxFieldRefs := AuxKeyRef.FieldIndex(Iterator);
            if not FieldList.Contains(AuxFieldRefs.Number()) then
                FieldList.Add(AuxFieldRefs.Number);
        end;
        AuxRecordRef.Close();
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeGetRelationship(var RelationTableNo: Integer; var FieldList: List of [Integer]; var IsHandled: Boolean);
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterGetRelationship(var RelationTableNo: Integer; FieldList: List of [Integer]);
    begin
    end;
}