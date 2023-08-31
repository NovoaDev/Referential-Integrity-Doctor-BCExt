/// <summary>
/// Interface FilterType_ANJ
/// </summary>
interface FilterType_ANJ
{
    Access = Public;

    /// <summary>
    /// OnAssistEditField.
    /// </summary>
    /// <param name="TableId">Integer.</param>
    /// <param name="FieldFormat">Enum FieldFormat_ANJ.</param>
    /// <returns>Return value of type Integer.</returns>
    procedure OnAssistEditField(TableId: Integer; FieldFormat: Enum FieldFormat_ANJ): Integer

    /// <summary>
    /// SetFilterValue.
    /// </summary>
    /// <param name="TableRelations">VAR Record TableRelations_ANJ.</param>
    /// <param name="FilterValue">Text.</param>
    procedure SetFilterValue(var TableRelations: Record TableRelations_ANJ; FilterValue: Text[2048])

    /// <summary>
    /// GetFilterValue.
    /// </summary>
    /// <param name="TableRelations">VAR Record TableRelations_ANJ.</param>
    /// <param name="FilterValue">VAR Text[2048].</param>
    procedure GetFilterValue(var TableRelations: Record TableRelations_ANJ; var FilterValue: Text[2048])
}