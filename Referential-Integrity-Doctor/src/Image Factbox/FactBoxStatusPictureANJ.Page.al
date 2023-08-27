/// <summary>
/// Page FactBoxStatusPicture_ANJ (ID 80712).
/// </summary>
page 80712 FactBoxStatusPicture_ANJ
{
    ApplicationArea = All;
    Caption = 'Status Picture';
    DeleteAllowed = false;
    InsertAllowed = false;
    LinksAllowed = false;
    PageType = CardPart;
    SourceTable = TheRIDoctor_ANJ;
    UsageCategory = None;

    layout
    {
        area(Content)
        {
            field(FactBoxText; Rec.FactBoxText)
            {
                Caption = 'Diagnostic:';
                ToolTip = 'Specifies the value of the Diagnostic: field.';
            }
            group(tar)
            {
                ShowCaption = false;
                field(FactBoxPicture; Rec.FactBoxPicture)
                {
                    Caption = 'Status Picture';
                    ShowCaption = false;
                }
            }
        }
    }
}