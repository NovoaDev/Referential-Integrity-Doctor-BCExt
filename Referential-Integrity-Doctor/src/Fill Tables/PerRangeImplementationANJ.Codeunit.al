/// <summary>
/// Codeunit PerRangeImplementation_ANJ (ID 80705) implements Interface TableRangeAllocator_ANJ.
/// </summary>
codeunit 80705 PerRangeImplementation_ANJ implements TableRangeAllocator_ANJ
{
    Access = Public;

    /// <summary>
    /// DoGetInfoToGenerateData.
    /// </summary>
    /// <param name="InitTableId">VAR Integer.</param>
    /// <param name="EndTableId">VAR Integer.</param>
    /// <param name="RemoveFromListTablesWithoutFieldsWithRelations">VAR Boolean.</param>
    internal procedure GetInfoToGenerateData(var InitTableId: Integer; var EndTableId: Integer; var RemoveFromListTablesWithoutFieldsWithRelations: Boolean)
    var
        IsHandled: Boolean;
    begin
        OnBeforeGetInfoToGenerateData(InitTableId, EndTableId, RemoveFromListTablesWithoutFieldsWithRelations, IsHandled);
        DoGetInfoToGenerateData(InitTableId, EndTableId, RemoveFromListTablesWithoutFieldsWithRelations, IsHandled);
        OnAfterGetInfoToGenerateData(InitTableId, EndTableId, RemoveFromListTablesWithoutFieldsWithRelations);
    end;

    /// <summary>
    /// DoGetInfoToGenerateData.
    /// </summary>
    /// <param name="InitTableId">VAR Integer.</param>
    /// <param name="EndTableId">VAR Integer.</param>
    /// <param name="RemoveFromListTablesWithoutFieldsWithRelations">VAR Boolean.</param>
    /// <param name="IsHandled">Boolean.</param>
    local procedure DoGetInfoToGenerateData(var InitTableId: Integer; var EndTableId: Integer; var RemoveFromListTablesWithoutFieldsWithRelations: Boolean; IsHandled: Boolean);
    var
        FillIdByRange: Page FillIdByRange_ANJ;
    begin
        if IsHandled then
            exit;

        if FillIdByRange.RunModal() <> Action::Yes then
            exit;

        FillIdByRange.GetParameters(InitTableId, EndTableId, RemoveFromListTablesWithoutFieldsWithRelations);
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeGetInfoToGenerateData(var InitTableId: Integer; var EndTableId: Integer; var RemoveFromListTablesWithoutFieldsWithRelations: Boolean; var IsHandled: Boolean);
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterGetInfoToGenerateData(InitTableId: Integer; EndTableId: Integer; RemoveFromListTablesWithoutFieldsWithRelations: Boolean);
    begin
    end;
}