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

    trigger OnDelete()
    var
        TablesToClean: Record TablesToClean_ANJ;
    begin
        TablesToClean.SetRange(MedicalTests, Rec.No);
        if not TablesToClean.IsEmpty() then
            TablesToClean.DeleteAll();
    end;

    /// <summary>
    /// GenerateTablesByRange.
    /// </summary>
    /// <param name="TableRangeAllocator">Enum TableRangeAllocator_ANJ.</param>
    internal procedure GenerateTables(TableRangeAllocator: Enum TableRangeAllocator_ANJ)
    var
        RemoveFromListTablesWithoutFieldsWithRelations: Boolean;
        EndTableId: Integer;
        InitTableId: Integer;
        ITableRangeAllocator: Interface TableRangeAllocator_ANJ;
    begin
        ITableRangeAllocator := TableRangeAllocator;
        ITableRangeAllocator.GetInfoToGenerateData(InitTableId, EndTableId, RemoveFromListTablesWithoutFieldsWithRelations);

        InfoTableGenerator.Generate(Rec.No, InitTableId, EndTableId, false);
        if RemoveFromListTablesWithoutFieldsWithRelations then
            InfoTableCleaner.CleanTablesWitoutRelations();
    end;

    var
        InfoTableCleaner: Codeunit InfoTableCleaner_ANJ;
        InfoTableGenerator: Codeunit InfoTableGenerator_ANJ;
}