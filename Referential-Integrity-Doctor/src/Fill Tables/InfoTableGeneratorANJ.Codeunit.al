/// <summary>
/// Codeunit InfoTableGenerator_ANJ (ID 80704).
/// </summary>
codeunit 80704 InfoTableGenerator_ANJ
{
    Access = Public;

    /// <summary>
    /// Generate.
    /// </summary>
    /// <param name="MedicalTests">Code[20].</param>
    /// <param name="InitTableId">Integer.</param>
    /// <param name="EndTableId">Integer.</param>
    /// <param name="HideDialog">Boolean.</param>
    internal procedure Generate(MedicalTests: Code[20]; InitTableId: Integer; EndTableId: Integer; HideDialog: Boolean)
    var
        TablesToClean: Record TablesToClean_ANJ;
        IsHandled: Boolean;
    begin
        if not CleanTable(TablesToClean, HideDialog) then
            exit;

        OnBeforeGenerate(InitTableId, EndTableId, IsHandled);
        DoGenerate(TablesToClean, MedicalTests, InitTableId, EndTableId, IsHandled);
        OnAfterGenerate(InitTableId, EndTableId);
    end;

    /// <summary>
    /// CleanTable.
    /// </summary>
    /// <param name="TablesToClean">VAR Record TablesToClean_ANJ.</param>
    /// <param name="HideDialog">Boolean.</param>
    /// <returns>Return value of type Boolean.</returns>
    local procedure CleanTable(var TablesToClean: Record TablesToClean_ANJ; HideDialog: Boolean): Boolean
    var
        DefaultAnswer: Boolean;
    begin
        DefaultAnswer := true;

        if TablesToClean.IsEmpty() then
            exit(DefaultAnswer);

        if not HideDialog then
            if not (ConfirmManagement.GetResponseOrDefault(ConfirmQst, DefaultAnswer)) then
                exit;

        TablesToClean.DeleteAll(true);
        exit(DefaultAnswer);
    end;

    /// <summary>
    /// DoGenerate.
    /// </summary>
    /// <param name="TablesToClean">VAR Record TablesToClean_ANJ.</param>
    /// <param name="MedicalTests">Code[20].</param>
    /// <param name="InitTableId">Integer.</param>
    /// <param name="EndTableId">Integer.</param>
    /// <param name="IsHandled">Boolean.</param>
    local procedure DoGenerate(var TablesToClean: Record TablesToClean_ANJ; MedicalTests: Code[20]; InitTableId: Integer; EndTableId: Integer; IsHandled: Boolean);
    var
        TableMetadata: Record "Table Metadata";
    begin
        if IsHandled then
            exit;

        if (InitTableId = 0) or (EndTableId = 0) then
            Error(EmptyTableIdErr);

        TableMetadata.SetRange(ID, InitTableId, EndTableId);
        if TableMetadata.FindSet(false) then
            repeat
                Clear(TablesToClean);
                TablesToClean.Validate(MedicalTests, MedicalTests);
                TablesToClean.Validate(TableNo, TableMetadata.ID);
                TablesToClean.Insert(true);
            until TableMetadata.Next() = 0;
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeGenerate(InitTableId: Integer; EndTableId: Integer; var IsHandled: Boolean);
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterGenerate(InitTableId: Integer; EndTableId: Integer);
    begin
    end;

    var
        ConfirmManagement: Codeunit "Confirm Management";
        ConfirmQst: Label 'Previously generated data exists, if you continue, it will be deleted. Do you want to continue?';
        EmptyTableIdErr: Label 'Empty table id fields.';
}