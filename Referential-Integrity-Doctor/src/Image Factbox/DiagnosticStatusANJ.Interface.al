/// <summary>
/// Interface DiagnosticStatus_ANJ.
/// </summary>
interface DiagnosticStatus_ANJ
{
    Access = Public;

    /// <summary>
    /// GetIndicatorValue.
    /// </summary>
    /// <param name="Indicator">VAR Text.</param>
    procedure GetIndicatorValue(var Indicator: Text)

    /// <summary>
    /// GetFactBoxText.
    /// </summary>
    /// <param name="FactBoxText">VAR Text.</param>
    procedure GetFactBoxText(var FactBoxText: Text)

    /// <summary>
    /// GetPictureBase64.
    /// </summary>
    /// <returns>Return value of type Text.</returns>
    procedure GetPictureBase64(): Text;
}