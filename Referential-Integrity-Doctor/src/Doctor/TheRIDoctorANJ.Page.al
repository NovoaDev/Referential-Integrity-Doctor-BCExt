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
                        DiagnosticCleaner.Clean();
                        UpdateFactBoxes();
                    end;
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.';
                }
            }
            part(DiagnosticResults; Diagnostic_ANJ)
            {
            }
        }
        area(FactBoxes)
        {
            part(DiagnosticPie_ANJ; DiagnosticPie_ANJ)
            {
                UpdatePropagation = Both;
            }
            part(DiagnosticChart_ANJ; DiagnosticChart_ANJ)
            {
                UpdatePropagation = Both;
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(Diagnostic)
            {
                Caption = 'Diagnostic';
                Image = ViewCheck;
                ToolTip = 'Executes the Diagnostic action.';

                trigger OnAction()
                begin
                    DiagnosticCleaner.Clean();
                    TheRIDoctor.Diagnostic(Rec.MedicalTests, false);
                    UpdateFactBoxes();
                end;
            }
            action(SolveTheProblem)
            {
                Caption = 'Solve The Problems';
                Image = ServiceMan;
                ToolTip = 'Executes the Solve The Problems action.';

                trigger OnAction()
                begin
                    SolveTheProblems.Solve(false);
                end;
            }
        }
        area(Promoted)
        {
            actionref(DiagnosticRef; Diagnostic)
            {
            }
            actionref(SolveTheProblemsRef; SolveTheProblem)
            {
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
        CurrPage.DiagnosticPie_ANJ.Page.SetParameter(Rec.MedicalTests);
        CurrPage.DiagnosticPie_ANJ.Page.FillChart();

        CurrPage.DiagnosticChart_ANJ.Page.SetParameter(Rec.MedicalTests);
        CurrPage.DiagnosticChart_ANJ.Page.FillChart();
    end;

    var
        DiagnosticCleaner: Codeunit DiagnosticCleaner_ANJ;
        SolveTheProblems: Codeunit SolveTheProblems_ANJ;
        TheRIDoctor: Codeunit TheRIDoctor_ANJ;
}