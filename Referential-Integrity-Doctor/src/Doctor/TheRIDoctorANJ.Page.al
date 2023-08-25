/// <summary>
/// Table TheRIDoctor_ANJ (ID 80700).
/// </summary>
page 80700 TheRIDoctor_ANJ
{
    ApplicationArea = All;
    Caption = 'Referential Integrity Doctor';
    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = Card;
    SourceTable = TheRIDoctor_ANJ;
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field(MedicalTests; Rec.MedicalTests)
                {
                    ToolTip = 'Specifies the value of the MedicalTests field.';

                    trigger OnValidate()
                    begin
                        UpdateFactBoxes();
                    end;
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.';
                }
            }
            part(Diagnostic; Diagnostic_ANJ)
            {
            }
        }
        area(FactBoxes)
        {
            part(DiagnosticChart_ANJ; DiagnosticChart_ANJ)
            {
                UpdatePropagation = Both;
            }
            part(DiagnosticPie_ANJ; DiagnosticPie_ANJ)
            {
                UpdatePropagation = Both;
            }
        }
    }

    trigger OnOpenPage()
    begin
        Rec.GetInstance();
    end;

    /// <summary>
    /// UpdateFactBoxes
    /// </summary>
    local procedure UpdateFactBoxes()
    begin
        CurrPage.DiagnosticChart_ANJ.Page.SetParameter(Rec.MedicalTests);
        CurrPage.DiagnosticChart_ANJ.Page.FillChart();

        CurrPage.DiagnosticPie_ANJ.Page.SetParameter(Rec.MedicalTests);
        CurrPage.DiagnosticPie_ANJ.Page.FillChart();
    end;
}