/// <summary>
/// Table TablesToClean_ANJ (ID 80702).
/// </summary>
table 80702 TablesToClean_ANJ
{
    Access = Internal;
    Caption = 'Tables To Clean';
    DataClassification = CustomerContent;

    fields
    {
        field(1; MedicalTests; Code[20])
        {
            Caption = 'Medical Tests';
            NotBlank = true;
            TableRelation = MedicalTests_ANJ.No;
        }
        field(2; TableNo; Integer)
        {
            Caption = 'Table No.';
            Tablerelation = "Table Metadata".ID;

            trigger OnValidate()
            begin
                Rec.CalcFields(TableName);
                CleanRelatedFields();
                FillRelatedFieldsTable();
            end;
        }
        field(3; TableName; Text[30])
        {
            CalcFormula = lookup("Table Metadata".Name where(ID = field(TableNo)));
            Caption = 'Table Name';
            Editable = false;
            FieldClass = FlowField;
        }
        field(4; RelationshipsType; enum RelationshipsType_ANJ)
        {
            Caption = 'Relationships Type';
        }
        field(5; Analyze; Boolean)
        {
            Caption = 'Analyze';
            InitValue = true;
        }
    }
    keys
    {
        key(Key1; MedicalTests, TableNo)
        {
            Clustered = true;
        }
    }
    fieldgroups
    {
        fieldgroup(Brick; MedicalTests, TableNo, TableName)
        {
        }
        fieldgroup(DropDown; MedicalTests, TableNo, TableName)
        {
        }
    }

    trigger OnDelete()
    begin
        CleanRelatedFields();
    end;

    /// <summary>
    /// CleanRelatedFields.
    /// </summary>
    local procedure CleanRelatedFields()
    var
        FieldsToAnalyze: Record FieldsToAnalyze_ANJ;
    begin
        FieldsToAnalyze.SetRange(MedicalTests, MedicalTests);
        FieldsToAnalyze.SetRange(TableNo, TableNo);
        if not FieldsToAnalyze.IsEmpty() then
            FieldsToAnalyze.DeleteAll(true);
    end;

    /// <summary>
    /// FillRelatedFieldsTable.
    /// </summary>
    local procedure FillRelatedFieldsTable()
    var
        FillFieldsTable: Codeunit FillFieldsTable_ANJ;
    begin
        FillFieldsTable.GenerateData(MedicalTests, TableNo, RelationshipsType);
    end;
}