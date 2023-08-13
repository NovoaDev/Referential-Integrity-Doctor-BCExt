/// <summary>
/// Page TablesToClean_ANJ (ID 80703).
/// </summary>
page 80703 TablesToClean_ANJ
{
    ApplicationArea = All;
    AutoSplitKey = true;
    Caption = 'Tables To Clean';
    PageType = ListPart;
    SourceTable = TablesToClean_ANJ;
    UsageCategory = None;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                Caption = 'General';

                field(TableNo; Rec.TableNo)
                {
                    ToolTip = 'Specifies the value of the Table No. field.';
                }
                field(TableName; Rec.TableName)
                {
                    ToolTip = 'Specifies the value of the Table Name field.';
                }
                field(RelationshipsType; Rec.RelationshipsType)
                {
                    ToolTip = 'Specifies the value of the Relationships Type field.';
                }
                field(Analyze; Rec.Analyze)
                {
                    ToolTip = 'Specifies the value of the Analyze field.';
                }
            }
        }
    }
}