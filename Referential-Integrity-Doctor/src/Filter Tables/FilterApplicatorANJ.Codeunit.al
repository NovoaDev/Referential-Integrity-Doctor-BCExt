/// <summary>
/// Codeunit "FilterApplicator_ANJ" (ID 80708).
/// </summary>
codeunit 80708 FilterApplicator_ANJ
{
    Access = Public;

    /// <summary>
    /// ApplyFilter.
    /// </summary>
    /// <param name="AuxRecordRef">VAR RecordRef.</param>
    internal procedure ApplyFilter(MedicalTests: Code[20]; TableNo: Integer; var AuxRecordRef: RecordRef)
    var
        IsHandled: Boolean;
    begin
        OnBeforeApplyFilter(MedicalTests, TableNo, AuxRecordRef, IsHandled);
        DoApplyFilter(MedicalTests, TableNo, AuxRecordRef, IsHandled);
        OnAfterApplyFilter(MedicalTests, TableNo, AuxRecordRef);
    end;

    /// <summary>
    /// DoApplyFilter.
    /// </summary>
    /// <param name="MedicalTests">Code[20].</param>
    /// <param name="TableNo">Integer.</param>
    /// <param name="AuxRecordRef">VAR RecordRef.</param>
    /// <param name="IsHandled">Boolean.</param>
    local procedure DoApplyFilter(MedicalTests: Code[20]; TableNo: Integer; var AuxRecordRef: RecordRef; IsHandled: Boolean);
    var
        TableFilters: Record TableFilters_ANJ;
    begin
        if IsHandled then
            exit;

        TableFilters.SetRange(MedicalTests, MedicalTests);
        TableFilters.SetRange(TableNo, TableNo);
        if TableFilters.FindSet(false) then
            repeat
                ApplyFilterToRecordRef(AuxRecordRef, TableFilters.FieldNo, TableFilters.FilterValue);
            until TableFilters.Next() = 0;
    end;

    /// <summary>
    /// GetFieldValueFromFilterFieldref.
    /// </summary>
    /// <param name="AuxRecordRef">VAR RecordRef.</param>
    /// <param name="FieldNo">Integer.</param>
    /// <param name="ValueText">Text.</param>
    local procedure ApplyFilterToRecordRef(var AuxRecordRef: RecordRef; FieldNo: Integer; ValueText: Text);
    var
        FilterFieldFieldRef: FieldRef;
    begin
        FilterFieldFieldRef := AuxRecordRef.Field(FieldNo);
        FilterFieldFieldRef.SetFilter(ValueText);
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeApplyFilter(MedicalTests: Code[20]; TableNo: Integer; var AuxRecordRef: RecordRef; var IsHandled: Boolean);
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterApplyFilter(MedicalTests: Code[20]; TableNo: Integer; var AuxRecordRef: RecordRef);
    begin
    end;
}