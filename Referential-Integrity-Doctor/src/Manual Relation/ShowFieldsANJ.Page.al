/// <summary>
/// Page ShowFields_ANJ (ID 80713).
/// </summary>
page 80713 ShowFields_ANJ
{
    ApplicationArea = All;
    Caption = 'Table fields';
    Editable = false;
    PageType = List;
    SourceTable = Field;
    UsageCategory = None;

    layout
    {
        area(Content)
        {
            repeater(FieldsList)
            {
                field("No."; Rec."No.")
                {
                    ToolTip = 'No. Campo';
                }
                field(FieldName; Rec.FieldName)
                {
                    ToolTip = 'Field Name';
                }
            }
        }
    }
}