/// <summary>
/// Table TableRelations_ANJ (ID 80705).
/// </summary>
table 80705 TableRelations_ANJ
{
    Access = Internal;
    Caption = 'Table Relations';
    DataClassification = CustomerContent;
    DrillDownPageId = TableRelations_ANJ;
    LookupPageId = TableRelations_ANJ;

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
                Rec.CalcFields(FieldName);
            end;
        }
        field(4; FieldName; Text[150])
        {
            CalcFormula = lookup(Field.FieldName where(TableNo = field(TableNo), "No." = field(FieldNo)));
            Caption = 'Field Name';
            Editable = false;
            FieldClass = FlowField;
        }
        field(5; RelationTableNo; Integer)
        {
            Caption = 'Table No.';
            TableRelation = "Table Metadata";

            trigger OnValidate()
            begin
                Clear(RelationFieldNo);
                Validate(RelationFieldNo);
            end;
        }
        field(6; RelationFieldNo; Integer)
        {
            Caption = 'Relation Field No.';
            Tablerelation = Field."No." where(TableNo = field(RelationTableNo));

            trigger OnValidate()
            begin
                Rec.CalcFields(RelationFieldName);
            end;
        }
        field(7; RelationFieldName; Text[150])
        {
            CalcFormula = lookup(Field.FieldName where(TableNo = field(RelationTableNo), "No." = field(RelationFieldNo)));
            Caption = 'Relation Field Name';
            Editable = false;
            FieldClass = FlowField;
        }
    }
    keys
    {
        key(Key1; MedicalTests, TableNo, FieldNo, RelationFieldNo)
        {
            Clustered = true;
        }
    }
    fieldgroups
    {
        fieldgroup(DropDown; MedicalTests, TableNo, FieldNo, RelationFieldNo)
        {
        }
        fieldgroup(Brick; MedicalTests, TableNo, FieldNo, RelationFieldNo)
        {
        }
    }
}