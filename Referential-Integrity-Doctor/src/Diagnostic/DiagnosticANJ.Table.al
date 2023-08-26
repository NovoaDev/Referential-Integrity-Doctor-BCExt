/// <summary>
/// Table Diagnostic_ANJ (ID 80706).
/// </summary>
table 80706 Diagnostic_ANJ
{
    Access = Internal;
    Caption = 'Diagnostic';
    DataClassification = CustomerContent;

    fields
    {
        field(1; EntryNo; Integer)
        {
            Caption = 'Entry No.';
        }
        field(2; TableNo; Integer)
        {
            Caption = 'Table No.';
            Tablerelation = "Table Metadata";

            trigger OnValidate()
            begin
                CalcFields(TableName);
            end;
        }
        field(3; TableName; Text[30])
        {
            CalcFormula = lookup("Table Metadata".Name where(ID = field(TableNo)));
            Caption = 'Table Name';
            Editable = false;
            FieldClass = FlowField;
        }
        field(4; RecGuid; Guid)
        {
            Caption = 'Record Guid';
        }
        field(5; RelatedTableNo; Integer)
        {
            Caption = 'Related Table No.';
            Tablerelation = "Table Metadata";
        }
        field(6; RelatedRecGuid; Guid)
        {
            Caption = 'Related Record Guid';
        }
        field(7; Index; Integer)
        {
            Caption = 'Index';
        }
        field(8; DiagnosticStatus; Enum DiagnosticStatus_ANJ)
        {
            Caption = 'Diagnostic Status';
        }
        field(9; SolutionType; Enum SolutionType_ANJ)
        {
            Caption = 'Solution Type';
        }
    }
    keys
    {
        key(Key1; EntryNo)
        {
            Clustered = true;
        }
    }
    fieldgroups
    {
        fieldgroup(DropDown; EntryNo)
        {
        }
        fieldgroup(Brick; EntryNo)
        {
        }
    }

    /// <summary>
    /// SolveTheProblems.
    /// </summary>
    /// <returns>Return value of type Boolean.</returns>
    internal procedure SolveTheProblems(): Boolean
    var
        Solution: Interface Solution_ANJ;
    begin
        Solution := SolutionType;
        Solution.ApplySolution();
    end;
}