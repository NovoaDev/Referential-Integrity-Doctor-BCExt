/// <summary>
/// Interface TableRangeAllocator_ANJ
/// </summary>
interface TableRangeAllocator_ANJ
{
    Access = Public;

    /// <summary>
    /// GetInfoToGenerateData.
    /// </summary>
    /// <param name="InitTableId">Integer.</param>
    /// <param name="EndTableId">Integer.</param>
    /// <param name="RemoveFromListTablesWithoutFieldsWithRelations">Boolean.</param>
    procedure GetInfoToGenerateData(var InitTableId: Integer; var EndTableId: Integer; var RemoveFromListTablesWithoutFieldsWithRelations: Boolean)
}