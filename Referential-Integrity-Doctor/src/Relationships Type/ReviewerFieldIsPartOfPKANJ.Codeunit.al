/// <summary>
/// Codeunit "ReviewerFieldIsPartOfPK_ANJ" (ID 80702).
/// </summary>
codeunit 80702 ReviewerFieldIsPartOfPK_ANJ
{
    Access = Public;

    /// <summary>
    /// Check.
    /// </summary>
    /// <param name="TableNo">Integer.</param>
    /// <param name="FieldNo">Integer.</param>
    /// <returns>Return variable Return of type Boolean.</returns>
    internal procedure Check(TableNo: Integer; FieldNo: Integer) Return: Boolean;
    var
        IsHandled: Boolean;
    begin
        OnBeforeCheck(TableNo, FieldNo, IsHandled);
        Return := DoCheck(TableNo, FieldNo, IsHandled);
        OnAfterCheck(TableNo, FieldNo, Return);
    end;

    /// <summary>
    /// OnBeforeCheck.
    /// </summary>
    /// <param name="TableNo">VAR Integer.</param>
    /// <param name="FieldNo">Integer.</param>
    /// <param name="IsHandled">VAR Boolean.</param>
    /// <returns>Return value of type Boolean.</returns>
    local procedure DoCheck(TableNo: Integer; FieldNo: Integer; IsHandled: Boolean): Boolean;
    var
        AuxField: Record Field;
    begin
        if IsHandled then
            exit;

        if (TableNo = 0) or (FieldNo = 0) then
            exit;

        AuxField.SetRange(TableNo, TableNo);
        AuxField.SetRange("No.", FieldNo);
        AuxField.SetRange(IsPartOfPrimaryKey, true);
        exit(not AuxField.IsEmpty());
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeCheck(var TableNo: Integer; tionFieldNo: Integer; var IsHandled: Boolean);
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterCheck(TableNo: Integer; FieldNo: Integer; var Return: Boolean);
    begin
    end;
}