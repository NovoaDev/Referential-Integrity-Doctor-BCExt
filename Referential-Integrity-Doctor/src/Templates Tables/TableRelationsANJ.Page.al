/// <summary>
/// Page TableRelations_ANJ (ID 80708).
/// </summary>
page 80708 TableRelations_ANJ
{
    ApplicationArea = All;
    Caption = 'Table Relations';
    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = List;
    SourceTable = TableRelations_ANJ;
    UsageCategory = None;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(RelationTableNo; Rec.RelationTableNo)
                {
                    Editable = false;
                    ToolTip = 'Specifies the value of the Table No. field.';
                }
                field(RelationFieldNo; Rec.RelationFieldNo)
                {
                    Editable = false;
                    ToolTip = 'Specifies the value of the Table No. field.';
                }
                field(RelationFieldName; Rec.RelationFieldName)
                {
                    ToolTip = 'Specifies the value of the Relation Field Name field.';
                }
                field(FieldsType; Rec.FieldsType)
                {
                    ToolTip = 'Specifies the value of the FieldsType field.';
                }
                field(FilterValue; FilterValue)
                {
                    AssistEdit = true;
                    Caption = 'Filter Value';
                    ToolTip = 'Specifies the value of the Relation Filter Value field.';

                    trigger OnValidate()
                    begin
                        Rec.SetFilterValue(FilterValue);
                    end;

                    trigger OnAssistEdit()
                    begin
                        Rec.OnAssistEditField(FilterValue);
                        Rec.SetFilterValue(FilterValue);
                    end;
                }
                field(SourceFieldName; Rec.SourceFieldName)
                {
                    ToolTip = 'Specifies the value of the Source Field Name field.';
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        Rec.GetFilterValue(FilterValue);
    end;

    var
        FilterValue: Text[2048];
}