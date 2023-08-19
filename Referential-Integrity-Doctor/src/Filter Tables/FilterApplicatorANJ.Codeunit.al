/// <summary>
/// Codeunit FilterApplicator_ANJ (ID 80708).
/// </summary>
codeunit 80708 FilterApplicator_ANJ
{
    Access = Public;

    /// <summary>
    /// ApplyFilter.
    /// </summary>
    /// <param name="AuxRecordRef">VAR RecordRef.</param>
    internal procedure ApplyFilter(FiltersToApply: Dictionary of [Integer, Text[2048]]; var AuxRecordRef: RecordRef)
    var
        IsHandled: Boolean;
    begin
        OnBeforeApplyFilter(FiltersToApply, AuxRecordRef, IsHandled);
        DoApplyFilter(FiltersToApply, AuxRecordRef, IsHandled);
        OnAfterApplyFilter(FiltersToApply, AuxRecordRef);
    end;

    /// <summary>
    /// DoApplyFilter.
    /// </summary>
    /// <param name="AuxRecordRef">VAR RecordRef.</param>
    /// <param name="IsHandled">Boolean.</param>
    local procedure DoApplyFilter(FiltersToApply: Dictionary of [Integer, Text[2048]]; var AuxRecordRef: RecordRef; IsHandled: Boolean);
    var
        FilterNo: Integer;
        Filters: List of [Integer];
    begin
        if IsHandled then
            exit;

        if FiltersToApply.Count() = 0 then
            exit;

        Filters := FiltersToApply.Keys();
        foreach FilterNo in Filters do
            ApplyFilterToRecordRef(AuxRecordRef, FilterNo, FiltersToApply.Get(FilterNo));
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
    local procedure OnBeforeApplyFilter(FiltersToApply: Dictionary of [Integer, Text[2048]]; var AuxRecordRef: RecordRef; var IsHandled: Boolean);
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterApplyFilter(FiltersToApply: Dictionary of [Integer, Text[2048]]; var AuxRecordRef: RecordRef);
    begin
    end;
}