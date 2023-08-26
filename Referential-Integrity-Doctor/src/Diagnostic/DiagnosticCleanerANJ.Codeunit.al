/// <summary>
/// Codeunit DiagnosticCleaner_ANJ (ID 80712).
/// </summary>
codeunit 80712 DiagnosticCleaner_ANJ
{
    Access = Public;

    /// <summary>
    /// Clean.
    /// </summary>
    internal procedure Clean()
    var
        Diagnostic: Record Diagnostic_ANJ;
        IsHandled: Boolean;
    begin
        OnBeforeClean(Diagnostic, IsHandled);
        DoClean(Diagnostic, IsHandled);
        OnAfterClean(Diagnostic);
    end;

    /// <summary>
    /// DoClean.
    /// </summary>
    /// <param name="Diagnostic">VAR Record Diagnostic_ANJ.</param>
    /// <param name="IsHandled">VAR Boolean.</param>
    local procedure DoClean(var Diagnostic: Record Diagnostic_ANJ; IsHandled: Boolean);
    begin
        if IsHandled then
            exit;

        if not Diagnostic.IsEmpty() then
            Diagnostic.DeleteAll(true);
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeClean(var Diagnostic: Record Diagnostic_ANJ; var IsHandled: Boolean);
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterClean(var Diagnostic: Record Diagnostic_ANJ);
    begin
    end;
}