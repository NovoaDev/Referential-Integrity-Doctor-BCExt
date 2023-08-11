/// <summary>
/// Table "MedicalTests_ANJ" (ID 80701).
/// </summary>
table 80701 MedicalTests_ANJ
{
    Access = Internal;
    Caption = 'Medical Tests';
    DataClassification = CustomerContent;
    DrillDownPageId = MedicalTests_ANJ;
    LookupPageId = MedicalTests_ANJ;

    fields
    {
        field(1; No; Code[20])
        {
            Caption = 'No.';
            NotBlank = true;
        }
        field(2; Description; Text[100])
        {
            Caption = 'Description';
        }
    }
    keys
    {
        key(Key1; No)
        {
            Clustered = true;
        }
    }
    fieldgroups
    {
        fieldgroup(Brick; No, Description)
        {
        }
        fieldgroup(DropDown; No, Description)
        {
        }
    }
}