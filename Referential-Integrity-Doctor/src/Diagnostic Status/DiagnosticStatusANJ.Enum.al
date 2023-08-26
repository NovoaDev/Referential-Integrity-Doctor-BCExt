/// <summary>
/// Enum DiagnosticStatus_ANJ (ID 80703).
/// </summary>
enum 80703 DiagnosticStatus_ANJ
{
    Access = Internal;
    Caption = 'Diagnostic Status';
    Extensible = true;

    value(0; Warning)
    {
        Caption = 'Warning';
    }
    value(1; Error)
    {
        Caption = 'Error';
    }
    value(2; FixedOk)
    {
        Caption = 'Fixed';
    }
}