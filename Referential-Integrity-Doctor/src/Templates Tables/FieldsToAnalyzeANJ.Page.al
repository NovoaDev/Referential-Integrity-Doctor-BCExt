/// <summary>
/// Page FieldsToAnalyze_ANJ (ID 80704).
/// </summary>
page 80704 FieldsToAnalyze_ANJ
{
    ApplicationArea = All;
    AutoSplitKey = true;
    Caption = 'Fields To Analyze';
    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = ListPart;
    SourceTable = FieldsToAnalyze_ANJ;
    UsageCategory = None;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(FieldNo; Rec.FieldNo)
                {
                    Editable = false;
                    ToolTip = 'Specifies the value of the Field No. field.';
                }
                field(FieldName; Rec.FieldName)
                {
                    ToolTip = 'Specifies the value of the Table Name field.';
                }
                field(RelationTableNo; Rec.RelationTableNo)
                {
                    Editable = false;
                    ToolTip = 'Specifies the value of the Relation Table No. field.';
                }
                field(RelationTableName; Rec.RelationTableName)
                {
                    ToolTip = 'Specifies the value of the Relation Table Name field.';
                }
                field(RelationFieldNo; Rec.RelationFieldNo)
                {
                    Editable = false;
                    ToolTip = 'Specifies the value of the Relation Field No. field.';
                }
                field(RelationFieldName; Rec.RelationFieldName)
                {
                    ToolTip = 'Specifies the value of the Table Name field.';
                }
                field(TestTableRelation; Rec.TestTableRelation)
                {
                    ToolTip = 'Specifies the value of the Test Table Relation field.';
                }
                field(ValidateTableRelation; Rec.ValidateTableRelation)
                {
                    ToolTip = 'Specifies the value of the Validate Table Relation field.';
                }
                field(Analyze; Rec.Analyze)
                {
                    ToolTip = 'Specifies the value of the Analyze field.';
                }
            }
        }
    }
}