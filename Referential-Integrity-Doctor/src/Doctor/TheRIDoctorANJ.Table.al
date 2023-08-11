/// <summary>
/// Table TheRIDoctor_ANJ (ID 80700).
/// </summary>
table 80700 TheRIDoctor_ANJ
{
    Access = Internal;
    Caption = 'Referential Integrity Doctor';
    DataClassification = CustomerContent;
    DrillDownPageID = TheRIDoctor_ANJ;
    LookupPageID = TheRIDoctor_ANJ;

    fields
    {
        field(1; PrimaryKey; Code[10])
        {
            Caption = 'Primary Key';
            NotBlank = true;
        }
        field(2; MedicalTests; Code[20])
        {
            Caption = 'Medical Tests';
            TableRelation = MedicalTests_ANJ.No;

            trigger OnValidate()
            begin
                CalcFields(Description);
            end;
        }
        field(3; Description; Text[100])
        {
            CalcFormula = lookup(MedicalTests_ANJ.Description where(No = field(MedicalTests)));
            Caption = 'Description';
            Editable = false;
            FieldClass = FlowField;
        }
    }
    keys
    {
        key(PK; PrimaryKey)
        {
            Clustered = true;
        }
    }
    fieldgroups
    {
        fieldgroup(Brick; MedicalTests, Description)
        {
        }
        fieldgroup(DropDown; MedicalTests, Description)
        {
        }
    }

    /// <summary>
    /// GetInstance.
    /// </summary>
    internal procedure GetInstance();
    begin
        if HasBeenRead then
            exit;

        if not Rec.Get() then begin
            Rec.Init();
            Rec.Insert(true);
        end;
        HasBeenRead := true;
    end;

    var
        HasBeenRead: Boolean;
}