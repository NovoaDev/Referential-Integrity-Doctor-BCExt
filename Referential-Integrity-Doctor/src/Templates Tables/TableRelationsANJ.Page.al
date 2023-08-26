/// <summary>
/// Page TableRelations_ANJ (ID 80708).
/// </summary>
page 80708 TableRelations_ANJ
{
    ApplicationArea = All;
    Caption = 'Table Relations';
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = TableRelations_ANJ;
    UsageCategory = None;

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
                field(FieldNo; Rec.FieldNo)
                {
                    ToolTip = 'Specifies the value of the Field No. field.';
                }
                field(FieldName; Rec.FieldName)
                {
                    ToolTip = 'Specifies the value of the Field Name field.';
                }
                field(RelationTableNo; Rec.RelationTableNo)
                {
                    ToolTip = 'Specifies the value of the Table No. field.';
                }
                field(RelationFieldNo; Rec.RelationFieldNo)
                {
                    ToolTip = 'Specifies the value of the Relation Field No. field.';
                }
                field(RelationFieldName; Rec.RelationFieldName)
                {
                    ToolTip = 'Specifies the value of the Relation Field Name field.';
                }
            }
        }
    }
}