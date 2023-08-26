/// <summary>
/// Codeunit VisualIndicator_ANJ (ID 80714).
/// Idea taken from the following link:
/// https://thatnavguy.com/d365-business-central-add-visual-indicator-to-page/
/// </summary>
codeunit 80714 VisualIndicator_ANJ
{
    Access = Public;

    /// <summary>
    /// GetValue.
    /// </summary>
    /// <param name="DiagnosticStatus">Integer.</param>
    /// <param name="Indicator">VAR Text.</param>
    internal procedure GetValue(var DiagnosticStatus: Enum DiagnosticStatus_ANJ; var Indicator: Text)
    var
        IsHandled: Boolean;
    begin
        OnBeforeGetValue(DiagnosticStatus.AsInteger(), Indicator, IsHandled);
        DoGetValue(DiagnosticStatus, Indicator, IsHandled);
        OnAfterGetValue(DiagnosticStatus.AsInteger(), Indicator);
    end;

    /// <summary>
    /// DoGetValue.
    /// </summary>
    /// <param name="DiagnosticStatus">Integer.</param>
    /// <param name="Indicator">VAR Text.</param>
    /// <param name="IsHandled">VAR Boolean.</param>
    local procedure DoGetValue(var DiagnosticStatus: Enum DiagnosticStatus_ANJ; var Indicator: Text; IsHandled: Boolean);
    begin
        if IsHandled then
            exit;

        case DiagnosticStatus of
            DiagnosticStatus::Warning:
                Indicator := '⚠️';
            DiagnosticStatus::Error:
                Indicator := '❌';
            DiagnosticStatus::FixedOk:
                Indicator := '✅'
        end;
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeGetValue(DiagnosticStatus: Integer; var Indicator: Text; var IsHandled: Boolean);
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterGetValue(DiagnosticStatus: Integer; var Indicator: Text);
    begin
    end;
}