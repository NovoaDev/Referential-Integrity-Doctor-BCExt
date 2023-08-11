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
}