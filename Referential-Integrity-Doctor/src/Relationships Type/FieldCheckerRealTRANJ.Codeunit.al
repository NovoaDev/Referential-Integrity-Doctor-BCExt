/// <summary>
/// Codeunit FieldCheckerRealTR_ANJ (ID 80703).
/// </summary>
codeunit 80703 FieldCheckerRealTR_ANJ
{
    Access = Public;

    /// <summary>
    /// CheckAndGetNewFieldID.
    /// </summary>
    /// <param name="TableNo">Integer.</param>
    /// <param name="FieldNo">Integer.</param>
    /// <returns>Return variable NewRelationFieldNo of type Integer.</returns>
    internal procedure CheckAndGetNewFieldID(TableNo: Integer; FieldNo: Integer) NewRelationFieldNo: Integer;
    var
        IsHandled: Boolean;
    begin
        OnBeforeCheckAndGetNewFieldID(TableNo, FieldNo, IsHandled);
        NewRelationFieldNo := DoCheckAndGetNewFieldID(TableNo, FieldNo, IsHandled);
        OnAfterCheckAndGetNewFieldID(TableNo, FieldNo, NewRelationFieldNo);
    end;

    /// <summary>
    /// DoCheckAndGetNewFieldID.
    /// </summary>
    /// <param name="TableNo">Integer.</param>
    /// <param name="FieldNo">Integer.</param>
    /// <param name="IsHandled">VAR Boolean.</param>
    local procedure DoCheckAndGetNewFieldID(TableNo: Integer; FieldNo: Integer; IsHandled: Boolean) NewRelationFieldNo: Integer;
    var
        AuxField: Record Field;
    begin
        if IsHandled then
            exit;

        if TableNo = 0 then
            exit;

        NewRelationFieldNo := FieldNo;
        if NewRelationFieldNo <> 0 then
            exit;

        // It is assumed that all fields that arrive with value 0 is that the relation points directly to the table without specifying the field.
        AuxField.SetLoadFields("No.");
        AuxField.SetRange(TableNo, TableNo);
        AuxField.SetRange(IsPartOfPrimaryKey, true);
        AuxField.FindFirst();
        NewRelationFieldNo := AuxField."No.";
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeCheckAndGetNewFieldID(TableNo: Integer; FieldNo: Integer; var IsHandled: Boolean);
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterCheckAndGetNewFieldID(TableNo: Integer; FieldNo: Integer; var NewRelationFieldNo: Integer);
    begin
    end;
}