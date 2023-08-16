/// <summary>
/// Page TableFilters_ANJ (ID 80707).
/// </summary>
page 80707 TableFilters_ANJ
{
    ApplicationArea = All;
    Caption = 'Filters';
    PageType = List;
    SourceTable = TableFilters_ANJ;
    UsageCategory = None;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(FieldNo; Rec.FieldNo)
                {
                    ToolTip = 'Specifies the value of the Field No. field.';
                }
                field(FieldName; Rec.FieldName)
                {
                    ToolTip = 'Specifies the value of the Field Name field.';
                }
                field(FilterValue; Rec.FilterValue)
                {
                    ToolTip = 'Specifies the value of the Value field.';
                }
            }
        }
    }
}