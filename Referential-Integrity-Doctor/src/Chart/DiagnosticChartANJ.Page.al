/// <summary>
/// Page DiagnosticChart_ANJ (ID 80709).
/// </summary>
page 80709 DiagnosticChart_ANJ
{
    ApplicationArea = All;
    Caption = 'Diagnostic Chart By Table';
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
            usercontrol(DiagnosticChart; "Microsoft.Dynamics.Nav.Client.BusinessChart")
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
            FillingOfGraphics.FillChart(MedicalTest, TempBusinessChartBuffer);
        TempBusinessChartBuffer.Update(CurrPage.DiagnosticChart);
    end;

    var
        FillingOfGraphics: Codeunit FillingOfGraphics_ANJ;
        MedicalTest: Code[20];
}