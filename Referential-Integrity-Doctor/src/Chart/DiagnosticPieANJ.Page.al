/// <summary>
/// Page DiagnosticPie_ANJ (ID 80710).
/// </summary>
page 80710 DiagnosticPie_ANJ
{
    ApplicationArea = All;
    Caption = 'Global Diagnostic Chart';
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = CardPart;
    UsageCategory = None;

    layout
    {
        area(Content)
        {
            usercontrol(DiagnosticPie; "Microsoft.Dynamics.Nav.Client.BusinessChart")
            {
            }
        }
    }

    /// <summary>
    /// SetParameter.
    /// </summary>
    /// <param name="AuxMedicalTest">Code[20].</param>
    internal procedure SetParameter(AuxMedicalTest: Code[20])
    begin
        MedicalTest := AuxMedicalTest;
    end;

    /// <summary>
    /// FillChart.
    /// </summary>
    internal procedure FillChart()
    var
        TempBusinessChartBuffer: Record "Business Chart Buffer" temporary;
    begin
        TempBusinessChartBuffer.Initialize();
        if MedicalTest <> '' then
            FillingOfPieGraphics.FillChart(MedicalTest, TempBusinessChartBuffer);
        TempBusinessChartBuffer.Update(CurrPage.DiagnosticPie);
    end;

    var
        FillingOfPieGraphics: Codeunit FillingOfPieGraphics_ANJ;
        MedicalTest: Code[20];
}