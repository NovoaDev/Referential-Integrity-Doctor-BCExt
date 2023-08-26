/// <summary>
/// Codeunit DoNothingSolutionIMP_ANJ (ID 80716).
/// </summary>
codeunit 80716 DoNothingSolutionIMP_ANJ implements Solution_ANJ
{
    Access = Public;

    //TODO: Do implementation Issue #20
    /// <summary>
    /// ApplySolution.
    /// </summary>
    internal procedure ApplySolution()
    var
        IsHandled: Boolean;
    begin
        OnBeforeApplySolution(IsHandled);
        DoApplySolution(IsHandled);
        OnAfterApplySolution();
    end;

    /// <summary>
    /// DoApplySolution.
    /// </summary>
    /// <param name="IsHandled">VAR Boolean.</param>
    local procedure DoApplySolution(IsHandled: Boolean);
    begin
        if IsHandled then
            exit;

    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeApplySolution(var IsHandled: Boolean);
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterApplySolution();
    begin
    end;
}