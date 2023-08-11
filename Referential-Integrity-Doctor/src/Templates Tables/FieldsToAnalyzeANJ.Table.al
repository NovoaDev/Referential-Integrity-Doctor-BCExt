/// <summary>
/// Table FieldsToAnalyze_ANJ (ID 80703).
/// </summary>
table 80703 FieldsToAnalyze_ANJ
{
    Access = Internal;
    Caption = 'Fields To Analyze';
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
                Rec.CalcFields(FieldName);
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
            Tablerelation = "Table Metadata".ID;

            trigger OnValidate()
            begin
                Clear(RelationFieldNo);
                Validate(RelationFieldNo);
                Rec.CalcFields(RelationTableName);
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
                Rec.CalcFields(RelationFieldName);
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
}