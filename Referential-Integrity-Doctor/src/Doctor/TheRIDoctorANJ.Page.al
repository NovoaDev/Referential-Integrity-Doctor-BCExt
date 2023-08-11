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
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.';
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        Rec.GetInstance();
    end;
}