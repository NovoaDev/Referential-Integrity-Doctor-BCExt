/// <summary>
/// Page MedicalTest_ANJ (ID 80701).
/// </summary>
page 80701 MedicalTest_ANJ
{
    ApplicationArea = All;
    Caption = 'Medical Tests';
    PageType = Document;
    SourceTable = MedicalTests_ANJ;
    UsageCategory = None;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field(No; Rec.No)
                {
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.';
                }
            }
            part(TablesToClean_ANJ; TablesToClean_ANJ)
            {
                SubPageLink = MedicalTests = field(No);
            }
            part(FieldsToAnalyze_ANJ; FieldsToAnalyze_ANJ)
            {
                Provider = TablesToClean_ANJ;
                SubPageLink = MedicalTests = field(MedicalTests), TableNo = field(TableNo);
            }
        }
    }
    actions
    {
        area(processing)
        {
            action(FillIdByRange)
            {
                ApplicationArea = All;
                Caption = 'Add Tables Id By Range';
                Image = Table;
                ToolTip = 'Executes the Add Tables Id By Range action.';

                trigger OnAction()
                begin
                    Rec.GenerateTables(Enum::TableRangeAllocator_ANJ::PerRange);
                end;
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                Caption = 'Process';

                group(Category_Category4)
                {
                    Caption = 'Generate Tables';

                    actionref(FillIdByRange_Promoted; FillIdByRange)
                    {
                    }
                }
            }
        }
    }
}