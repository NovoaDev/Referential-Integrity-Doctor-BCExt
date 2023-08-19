/// <summary>
/// Codeunit FillDictFromTableFilters_ANJ (ID 80709).
/// </summary>
codeunit 80709 FillDictFromTableFilters_ANJ
{
    Access = Public;

    /// <summary>
    /// FillDictionary.
    /// </summary>
    /// <param name="MedicalTests">Code[20].</param>
    /// <param name="TableNo">Integer.</param>
    /// <param name="FiltersToApply">VAR Dictionary of [Integer, Text[2048]].</param>
    internal procedure FillDictionary(MedicalTests: Code[20]; TableNo: Integer; var FiltersToApply: Dictionary of [Integer, Text[2048]])
    var
        IsHandled: Boolean;
    begin
        OnBeforeFillDictionary(MedicalTests, TableNo, FiltersToApply, IsHandled);
        DoFillDictionary(MedicalTests, TableNo, FiltersToApply, IsHandled);
        OnAfterFillDictionary(MedicalTests, TableNo, FiltersToApply);
    end;

    /// <summary>
    /// DoFillDictionary.
    /// </summary>
    /// <param name="MedicalTests">Code[20].</param>
    /// <param name="TableNo">Integer.</param>
    /// <param name="FiltersToApply">VAR Dictionary of [Integer, Text[2048]].</param>
    /// <param name="IsHandled">Boolean.</param>
    local procedure DoFillDictionary(MedicalTests: Code[20]; TableNo: Integer; var FiltersToApply: Dictionary of [Integer, Text[2048]]; IsHandled: Boolean);
    var
        TableFilters: Record TableFilters_ANJ;
    begin
        if IsHandled then
            exit;

        TableFilters.SetRange(MedicalTests, MedicalTests);
        TableFilters.SetRange(TableNo, TableNo);
        if TableFilters.FindSet(false) then
            repeat
                if not FiltersToApply.ContainsKey(TableFilters.FieldNo) then
                    FiltersToApply.Add(TableFilters.FieldNo, TableFilters.FilterValue)
            until TableFilters.Next() = 0;
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeFillDictionary(MedicalTests: Code[20]; TableNo: Integer; var FiltersToApply: Dictionary of [Integer, Text[2048]]; var IsHandled: Boolean);
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterFillDictionary(MedicalTests: Code[20]; TableNo: Integer; var FiltersToApply: Dictionary of [Integer, Text[2048]]);
    begin
    end;
}