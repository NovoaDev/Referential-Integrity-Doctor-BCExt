/// <summary>
/// Page MedicalTests_ANJ (ID 80702).
/// </summary>
page 80702 MedicalTests_ANJ
{
    ApplicationArea = All;
    Caption = 'Medical Tests';
    CardPageId = MedicalTest_ANJ;
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = MedicalTests_ANJ;
    UsageCategory = None;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(No; Rec.No)
                {
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.';
                }
            }
        }
    }
}