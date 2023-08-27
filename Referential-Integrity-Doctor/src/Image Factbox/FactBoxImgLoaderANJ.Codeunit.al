/// <summary>
/// Codeunit FactBoxImgLoader_ANJ (ID 80719).
/// </summary>
codeunit 80719 FactBoxImgLoader_ANJ
{
    Access = Public;

    /// <summary>
    /// GetValue.
    /// </summary>
    /// <param name="DiagnosticStatus">Integer.</param>
    /// <param name="FactBoxPictureBase64">VAR Text.</param>
    internal procedure GetValue(var DiagnosticStatus: Enum DiagnosticStatus_ANJ; var FactBoxPictureBase64: Text)
    var
        IsHandled: Boolean;
    begin
        OnBeforeGetValue(DiagnosticStatus.AsInteger(), FactBoxPictureBase64, IsHandled);
        DoGetValue(DiagnosticStatus, FactBoxPictureBase64, IsHandled);
        OnAfterGetValue(DiagnosticStatus.AsInteger(), FactBoxPictureBase64);
    end;

    /// <summary>
    /// DoGetValue.
    /// </summary>
    /// <param name="DiagnosticStatus">Integer.</param>
    /// <param name="FactBoxPictureBase64">VAR Text.</param>
    /// <param name="IsHandled">VAR Boolean.</param>
    local procedure DoGetValue(var DiagnosticStatus: Enum DiagnosticStatus_ANJ; var FactBoxPictureBase64: Text; IsHandled: Boolean);
    var
        IDiagnosticStatus: Interface DiagnosticStatus_ANJ;
    begin
        if IsHandled then
            exit;

        IDiagnosticStatus := DiagnosticStatus;
        FactBoxPictureBase64 := IDiagnosticStatus.GetPictureBase64();
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeGetValue(DiagnosticStatus: Integer; var FactBoxPictureBase64: Text; var IsHandled: Boolean);
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterGetValue(DiagnosticStatus: Integer; var FactBoxPictureBase64: Text);
    begin
    end;
}