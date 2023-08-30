/// <summary>
/// Table TableRelations_ANJ (ID 80705).
/// </summary>
table 80705 TableRelations_ANJ
{
    Access = Public;
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
                CalcFields(FieldName);
            end;
        }
        field(4; FieldName; Text[150])
        {
            CalcFormula = lookup(Field.FieldName where(TableNo = field(TableNo), "No." = field(FieldNo)));
            Caption = 'Field Name';
            Editable = false;
            FieldClass = FlowField;
        }
        field(5; RelationNo; Integer)
        {
            Caption = 'Relation No.';
        }
        field(6; FieldsType; Enum FilterType_ANJ)
        {
            Caption = 'Field Type';

            trigger OnValidate()
            begin
                ClearRelatedFields();
            end;
        }
        field(7; FieldFormat; Enum FieldFormat_ANJ)
        {
            Caption = 'Field Type';
        }
        field(8; RelationTableNo; Integer)
        {
            Caption = 'Table No.';
            TableRelation = "Table Metadata";

            trigger OnValidate()
            begin
                Clear(RelationFieldNo);
                Validate(RelationFieldNo);
            end;
        }
        field(9; RelationFieldNo; Integer)
        {
            Caption = 'Relation Field No.';
            Tablerelation = Field."No." where(TableNo = field(RelationTableNo));

            trigger OnValidate()
            begin
                CalcFields(RelationFieldName);
            end;
        }
        field(10; RelationFieldName; Text[150])
        {
            CalcFormula = lookup(Field.FieldName where(TableNo = field(RelationTableNo), "No." = field(RelationFieldNo)));
            Caption = 'Relation Field Name';
            Editable = false;
            FieldClass = FlowField;
        }
        field(11; SourceFieldNo; Integer)
        {
            Caption = 'Source Field No.';
            Tablerelation = Field."No." where(TableNo = field(TableNo));

            trigger OnValidate()
            begin
                CalcFields(SourceFieldName);
            end;
        }
        field(12; SourceFieldName; Text[150])
        {
            CalcFormula = lookup(Field.FieldName where(TableNo = field(TableNo), "No." = field(SourceFieldNo)));
            Caption = 'Source Field Name';
            Editable = false;
            FieldClass = FlowField;
        }
        field(13; FilterValue; Text[2048])
        {
            Caption = 'Filter Value';
        }
    }
    keys
    {
        key(Key1; MedicalTests, TableNo, FieldNo, RelationNo)
        {
            Clustered = true;
        }
    }
    fieldgroups
    {
        fieldgroup(DropDown; MedicalTests, TableNo, FieldNo, RelationNo)
        {
        }
        fieldgroup(Brick; MedicalTests, TableNo, FieldNo, RelationNo)
        {
        }
    }

    trigger OnInsert()
    begin
        Validate(RelationNo, GetNextRelationNo());
    end;

    /// <summary>
    /// OnAssistEditField.
    /// </summary>
    /// <param name="AuxFilterValue">VAR Text.</param>
    internal procedure OnAssistEditField(var AuxFilterValue: Text[2048])
    var
        AuxFieldNo: Integer;
        FilterType: Interface FilterType_ANJ;
    begin
        Clear(AuxFilterValue);
        FilterType := FieldsType;
        AuxFieldNo := FilterType.OnAssistEditField(TableNo, FieldFormat);
        AuxFilterValue := Format(AuxFieldNo);
    end;

    /// <summary>
    /// SetFilterValue.
    /// </summary>
    /// <param name="AuxFilterValue">Text[2048].</param>
    internal procedure SetFilterValue(AuxFilterValue: Text[2048])
    var
        FilterType: Interface FilterType_ANJ;
    begin
        ClearRelatedFields();

        FilterType := FieldsType;
        FilterType.SetFilterValue(Rec, AuxFilterValue);
    end;

    /// <summary>
    /// GetFilterValue.
    /// </summary>
    /// <param name="AuxFilterValue">Text[2048].</param>
    internal procedure GetFilterValue(var AuxFilterValue: Text[2048])
    var
        FilterType: Interface FilterType_ANJ;
    begin
        FilterType := FieldsType;
        FilterType.GetFilterValue(Rec, AuxFilterValue);
        Rec.CalcFields(SourceFieldName);
    end;

    /// <summary>
    /// GetNextRelationNo.
    /// </summary>
    /// <returns>Return variable NextRelationNo of type Integer.</returns>
    local procedure GetNextRelationNo() NextRelationNo: Integer
    var
        TableRelations: Record TableRelations_ANJ;
    begin
        NextRelationNo := 1;
        TableRelations.SetLoadFields(RelationNo);
        TableRelations.SetRange(MedicalTests, MedicalTests);
        TableRelations.SetRange(TableNo, TableNo);
        TableRelations.SetRange(FieldNo, FieldNo);
        if TableRelations.FindLast() then
            NextRelationNo += TableRelations.RelationNo;
    end;

    /// <summary>
    /// ClearRelatedFields.
    /// </summary>
    local procedure ClearRelatedFields()
    begin
        Clear(Rec.SourceFieldNo);
        Clear(Rec.FilterValue);
        Rec.CalcFields(SourceFieldName);
    end;
}