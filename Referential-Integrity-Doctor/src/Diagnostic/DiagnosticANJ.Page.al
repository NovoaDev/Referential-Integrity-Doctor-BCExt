/// <summary>
/// Page Diagnostic_ANJ (ID 80711).
/// </summary>
page 80711 Diagnostic_ANJ
{
    ApplicationArea = All;
    Caption = 'Diagnostic';
    PageType = ListPart;
    SourceTable = Diagnostic_ANJ;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(TableNo; Rec.TableNo)
                {
                    ToolTip = 'Specifies the value of the Table No. field.';
                }
                field(TableName; Rec.TableName)
                {
                    ToolTip = 'Specifies the value of the Table Name field.';
                }
                field(RecGuid; Rec.RecGuid)
                {
                    ToolTip = 'Specifies the value of the Record Guid field.';
                }
                field(RelatedTableNo; Rec.RelatedTableNo)
                {
                    ToolTip = 'Specifies the value of the Related Table No. field.';
                }
                field(RelatedRecGuid; Rec.RelatedRecGuid)
                {
                    ToolTip = 'Specifies the value of the Related Record Guid field.';
                }
                field(Index; Rec.Index)
                {
                    ToolTip = 'Specifies the value of the Index field.';
                }
            }
        }
    }
}
