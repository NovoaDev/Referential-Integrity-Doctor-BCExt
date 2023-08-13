/// <summary>
/// Page ShowTableList_ANJ (ID 80706).
/// </summary>
page 80706 ShowTableList_ANJ
{
    ApplicationArea = All;
    Caption = 'Tables';
    PageType = List;
    SourceTable = "Table Metadata";
    UsageCategory = None;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(ID; Rec.ID)
                {
                    ToolTip = 'Specifies the value of the ID field.';
                }
                field(Name; Rec.Name)
                {
                    ToolTip = 'Specifies the names of the available Windows languages.';
                }
            }
        }
    }
}