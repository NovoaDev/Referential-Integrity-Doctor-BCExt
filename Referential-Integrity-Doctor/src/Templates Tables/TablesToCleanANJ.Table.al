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
            TableRelation = MedicalTests_ANJ;
        }
        field(2; TableNo; Integer)
        {
            Caption = 'Table No.';
            Tablerelation = "Table Metadata";

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
        field(6; HasRelationshipLines; Boolean)
        {
            CalcFormula = exist(FieldsToAnalyze_ANJ where(MedicalTests = field(MedicalTests), TableNo = field(TableNo)));
            Caption = 'Has Relationship Lines';
            Description = 'Control field';
            Editable = false;
            FieldClass = FlowField;
        }
        field(7; TotalOfRecords; Integer)
        {
            Caption = 'Total Of Records';
        }
        field(8; TableFilters; Integer)
        {
            CalcFormula = count(TableFilters_ANJ where(MedicalTests = field(MedicalTests), TableNo = field(TableNo)));
            Caption = 'Table Filters';
            Editable = false;
            FieldClass = FlowField;
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

    trigger OnInsert()
    begin
        UpdateTotals();
    end;

    trigger OnModify()
    begin
        UpdateTotals();
    end;

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
        TableFiltersANJ: Record TableFilters_ANJ;
    begin
        FieldsToAnalyze.SetRange(MedicalTests, MedicalTests);
        FieldsToAnalyze.SetRange(TableNo, TableNo);
        if not FieldsToAnalyze.IsEmpty() then
            FieldsToAnalyze.DeleteAll(true);

        TableFiltersANJ.SetRange(MedicalTests, MedicalTests);
        TableFiltersANJ.SetRange(TableNo, TableNo);
        if not TableFiltersANJ.IsEmpty() then
            TableFiltersANJ.DeleteAll(true);
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

    /// <summary>
    /// UpdateTotals.
    /// </summary>
    internal procedure UpdateTotals()
    var
        TotalRecordCalculator: Codeunit TotalRecordCalculator_ANJ;
    begin
        TotalRecordCalculator.Calculate(Rec);
    end;
}