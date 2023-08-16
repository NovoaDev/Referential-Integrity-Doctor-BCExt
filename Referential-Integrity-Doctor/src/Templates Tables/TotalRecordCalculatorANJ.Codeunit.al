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
    /// <param name="ApplyTableFilters">Boolean.</param>
    internal procedure Calculate(var TablesToClean: Record TablesToClean_ANJ; ApplyTableFilters: Boolean);
    var
        IsHandled: Boolean;
    begin
        OnBeforeCalculate(TablesToClean, ApplyTableFilters, IsHandled);
        DoCalculate(TablesToClean, ApplyTableFilters, IsHandled);
        OnAfterCalculate(TablesToClean);
    end;

    /// <summary>
    /// DoCalculate.
    /// </summary>
    /// <param name="TablesToClean">VAR Record TablesToClean_ANJ.</param>
    /// <param name="ApplyTableFilters">Boolean.</param>
    /// <param name="IsHandled">Boolean.</param>
    local procedure DoCalculate(var TablesToClean: Record TablesToClean_ANJ; ApplyTableFilters: Boolean; IsHandled: Boolean);
    var
        AuxRecordRef: RecordRef;
    begin
        if IsHandled then
            exit;

        if TablesToClean.TableNo = 0 then
            exit;

        AuxRecordRef.Open(TablesToClean.TableNo);
        if ApplyTableFilters then
            FilterApplicator.ApplyFilter(TablesToClean.MedicalTests, TablesToClean.TableNo, AuxRecordRef);
        TablesToClean.Validate(TotalOfRecords, AuxRecordRef.Count());
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeCalculate(var TablesToClean: Record TablesToClean_ANJ; var ApplyTableFilters: Boolean; var IsHandled: Boolean);
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterCalculate(var TablesToClean: Record TablesToClean_ANJ);
    begin
    end;

    var
        FilterApplicator: Codeunit FilterApplicator_ANJ;
}