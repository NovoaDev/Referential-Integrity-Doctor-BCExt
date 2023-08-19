/// <summary>
/// Codeunit TotalRecordCalculator_ANJ (ID 80706).
/// </summary>
codeunit 80706 TotalRecordCalculator_ANJ
{
    Access = Public;

    /// <summary>
    /// Calculate.
    /// </summary>
    /// <param name="TablesToClean">VAR Record TablesToClean_ANJ.</param>
    internal procedure Calculate(var TablesToClean: Record TablesToClean_ANJ);
    var
        IsHandled: Boolean;
    begin
        OnBeforeCalculate(TablesToClean, IsHandled);
        DoCalculate(TablesToClean, IsHandled);
        OnAfterCalculate(TablesToClean);
    end;

    /// <summary>
    /// DoCalculate.
    /// </summary>
    /// <param name="TablesToClean">VAR Record TablesToClean_ANJ.</param>
    /// <param name="IsHandled">Boolean.</param>
    local procedure DoCalculate(var TablesToClean: Record TablesToClean_ANJ; IsHandled: Boolean);
    var
        AuxRecordRef: RecordRef;
        FiltersToApply: Dictionary of [Integer, Text[2048]];
    begin
        if IsHandled then
            exit;

        if TablesToClean.TableNo = 0 then
            exit;

        AuxRecordRef.Open(TablesToClean.TableNo);
        FillDictFromTableFilters.FillDictionary(TablesToClean.MedicalTests, TablesToClean.TableNo, FiltersToApply);
        FilterApplicator.ApplyFilter(FiltersToApply, AuxRecordRef);
        TablesToClean.Validate(TotalOfRecords, AuxRecordRef.Count());
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeCalculate(var TablesToClean: Record TablesToClean_ANJ; var IsHandled: Boolean);
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterCalculate(var TablesToClean: Record TablesToClean_ANJ);
    begin
    end;

    var
        FillDictFromTableFilters: Codeunit FillDictFromTableFilters_ANJ;
        FilterApplicator: Codeunit FilterApplicator_ANJ;
}