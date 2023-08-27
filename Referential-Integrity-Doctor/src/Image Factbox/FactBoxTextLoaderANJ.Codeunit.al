/// <summary>
/// Codeunit FactBoxTextLoader_ANJ (ID 80725).
/// </summary>
codeunit 80725 FactBoxTextLoader_ANJ
{
    Access = Public;

    /// <summary>
    /// GetText.
    /// </summary>
    /// <param name="DiagnosticStatus">VAR Enum DiagnosticStatus_ANJ.</param>
    /// <param name="FactBoxText">Text.</param>
    internal procedure GetText(var DiagnosticStatus: Enum DiagnosticStatus_ANJ; var FactBoxText: Text)
    var
        IsHandled: Boolean;
    begin
        OnBeforeGetText(DiagnosticStatus, FactBoxText, IsHandled);
        DoGetText(DiagnosticStatus, FactBoxText, IsHandled);
        OnAfterGetText(DiagnosticStatus, FactBoxText);
    end;

    /// <summary>
    /// DoGetText.
    /// </summary>
    /// <param name="DiagnosticStatus">VAR Enum DiagnosticStatus_ANJ.</param>
    /// <param name="FactBoxText">Text.</param>
    /// <param name="IsHandled">Boolean.</param>
    local procedure DoGetText(var DiagnosticStatus: Enum DiagnosticStatus_ANJ; var FactBoxText: Text; IsHandled: Boolean);
    var
        IDiagnosticStatus: Interface DiagnosticStatus_ANJ;
    begin
        if IsHandled then
            exit;

        IDiagnosticStatus := DiagnosticStatus;
        IDiagnosticStatus.GetFactBoxText(FactBoxText);
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeGetText(var DiagnosticStatus: Enum DiagnosticStatus_ANJ; var FactBoxText: Text; var IsHandled: Boolean);
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterGetText(DiagnosticStatus: Enum DiagnosticStatus_ANJ; FactBoxText: Text);
    begin
    end;
}