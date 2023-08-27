/// <summary>
/// Enum DiagnosticStatus_ANJ (ID 80703).
/// </summary>
enum 80703 DiagnosticStatus_ANJ implements DiagnosticStatus_ANJ
{
    Access = Internal;
    Caption = 'Diagnostic Status';
    Extensible = true;

    value(0; Warning)
    {
        Caption = 'Warning';
        Implementation = DiagnosticStatus_ANJ = WarningStatusIMP_ANJ;
    }
    value(1; Error)
    {
        Caption = 'Error';
        Implementation = DiagnosticStatus_ANJ = ErrorStatusIMP_ANJ;
    }
    value(2; FixedOk)
    {
        Caption = 'Fixed';
        Implementation = DiagnosticStatus_ANJ = OKStatusIMP_ANJ;
    }
    value(3; "None")
    {
        Caption = 'None';
        Implementation = DiagnosticStatus_ANJ = NOStatusIMP_ANJ;
    }
}