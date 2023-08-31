/// <summary>
/// Table TableFilters_ANJ (ID 80704).
/// </summary>
table 80704 TableFilters_ANJ
{
    Access = Internal;
    Caption = 'Filters';
    DataClassification = CustomerContent;
    DrillDownPageId = TableFilters_ANJ;
    LookupPageId = TableFilters_ANJ;

    fields
    {
        field(1; MedicalTests; Code[20])
        {
            Caption = 'Medical Tests';
            NotBlank = true;
            TableRelation = TablesToClean_ANJ.MedicalTests;
        }
        field(2; TableNo; Integer)
        {
            Caption = 'Table No.';
            TableRelation = TablesToClean_ANJ.TableNo where(TableNo = field(TableNo));
        }
        field(3; FieldNo; Integer)
        {
            Caption = 'Field No.';
            Tablerelation = Field."No." where(TableNo = field(TableNo));

            trigger OnValidate()
            begin
                CalcFields(FieldName);
                UpdateFileType();
            end;
        }
        field(5; FieldName; Text[150])
        {
            CalcFormula = lookup(Field.FieldName where(TableNo = field(TableNo), "No." = field(FieldNo)));
            Caption = 'Field Name';
            Editable = false;
            FieldClass = FlowField;
        }
        field(6; FilterValue; Text[2048])
        {
            Caption = 'Value';
        }
        field(7; FieldFormat; Enum FieldFormat_ANJ)
        {
            Caption = 'Field Format';
            InitValue = Empty;
        }
    }
    keys
    {
        key(Key1; MedicalTests, TableNo, FieldNo)
        {
            Clustered = true;
        }
    }
    fieldgroups
    {
        fieldgroup(DropDown; MedicalTests, TableNo, FieldNo) { }
        fieldgroup(Brick; MedicalTests, TableNo, FieldNo) { }
    }
    /// <summary>
    /// UpdateFileType.
    /// </summary>
    local procedure UpdateFileType()
    var
        AuxField: Record Field;
    begin
        Clear(FieldFormat);
        if not AuxField.Get(TableNo, FieldNo) then
            exit;

        FieldFormat := Enum::FieldFormat_ANJ.FromInteger(AuxField.Type);
    end;
}