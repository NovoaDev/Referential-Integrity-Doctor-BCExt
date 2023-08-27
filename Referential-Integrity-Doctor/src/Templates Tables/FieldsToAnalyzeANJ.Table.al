/// <summary>
/// Table FieldsToAnalyze_ANJ (ID 80703).
/// </summary>
table 80703 FieldsToAnalyze_ANJ
{
    Access = Internal;
    Caption = 'Fields To Analyze';
    DataClassification = CustomerContent;
    DrillDownPageId = FieldsToAnalyze_ANJ;
    LookupPageId = FieldsToAnalyze_ANJ;

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

            trigger OnValidate()
            begin
                Clear(FieldNo);
                Validate(FieldNo);
            end;
        }
        field(3; FieldNo; Integer)
        {
            Caption = 'Field No.';
            Tablerelation = Field."No." where(TableNo = field(TableNo));

            trigger OnValidate()
            begin
                CalcFields(FieldName);
            end;
        }
        field(4; FieldName; Text[30])
        {
            CalcFormula = lookup(Field.FieldName where(TableNo = field(TableNo), "No." = field(FieldNo)));
            Caption = 'Field Name';
            Editable = false;
            FieldClass = FlowField;
        }
        field(5; RelationTableNo; Integer)
        {
            Caption = 'Relation Table No.';
            Tablerelation = "Table Metadata";

            trigger OnValidate()
            begin
                Clear(RelationFieldNo);
                Validate(RelationFieldNo);
                CalcFields(RelationTableName);
            end;
        }
        field(6; RelationTableName; Text[30])
        {
            CalcFormula = lookup("Table Metadata".Name where(ID = field(RelationTableNo)));
            Caption = 'Relation Table Name';
            Editable = false;
            FieldClass = FlowField;
        }
        field(7; RelationFieldNo; Integer)
        {
            Caption = 'Relation Field No.';
            Tablerelation = Field."No." where(TableNo = field(RelationTableNo));

            trigger OnValidate()
            begin
                CalcFields(RelationFieldName);
            end;
        }
        field(8; RelationFieldName; Text[30])
        {
            CalcFormula = lookup(Field.FieldName where(TableNo = field(RelationTableNo), "No." = field(RelationFieldNo)));
            Caption = 'Relation Field Name';
            Editable = false;
            FieldClass = FlowField;
        }
        field(9; Analyze; Boolean)
        {
            Caption = 'Analyze';
            InitValue = true;
        }
        field(10; TestTableRelation; Boolean)
        {
            CalcFormula = exist("Table Relations Metadata" where("Table ID" = field(TableNo), "Field No." = field(Fieldno), "Test Table Relation" = const(true)));
            Caption = 'Test Table Relation';
            Editable = false;
            FieldClass = FlowField;
        }
        field(11; ValidateTableRelation; Boolean)
        {
            CalcFormula = exist("Table Relations Metadata" where("Table ID" = field(TableNo), "Field No." = field(Fieldno), "Validate Table Relation" = const(true)));
            Caption = 'Validate Table Relation';
            Editable = false;
            FieldClass = FlowField;
        }
        field(12; TableRelation; Integer)
        {
            CalcFormula = count(TableRelations_ANJ where(MedicalTests = field(MedicalTests), TableNo = field(TableNo), FieldNo = field(FieldNo)));
            Caption = 'Table Relation';
            Editable = false;
            FieldClass = FlowField;
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
        fieldgroup(Brick; MedicalTests, TableNo, FieldNo)
        {
        }
        fieldgroup(DropDown; MedicalTests, TableNo, FieldNo)
        {
        }
    }
    trigger OnDelete()
    var
        TableRelations: Record TableRelations_ANJ;
    begin
        TableRelations.SetRange(MedicalTests, MedicalTests);
        TableRelations.SetRange(TableNo, TableNo);
        TableRelations.SetRange(FieldNo, FieldNo);
        if not TableRelations.IsEmpty() then
            TableRelations.DeleteAll(true);
    end;
}