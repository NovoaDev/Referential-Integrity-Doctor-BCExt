/// <summary>
/// Codeunit ConstantFieldTypeIMP_ANJ (ID 80727) implements Interface FilterType_ANJ.
/// </summary>
codeunit 80727 ConstantFieldTypeIMP_ANJ implements FilterType_ANJ
{
    Access = Internal;

    /// <summary>
    /// OnAssistEditField.
    /// </summary>
    /// <param name="TableId">Integer.</param>
    /// <param name="FieldFormat">Enum FieldFormat_ANJ.</param>
    /// <returns>Return value of type Integer.</returns>
    internal procedure OnAssistEditField(TableId: Integer; FieldFormat: Enum FieldFormat_ANJ): Integer;
    begin
        exit(0);
    end;

    /// <summary>
    /// SetFilterValue.
    /// </summary>
    /// <param name="TableRelations">VAR Record TableRelations_ANJ.</param>
    /// <param name="FilterValue">Text.</param>
    internal procedure SetFilterValue(var TableRelations: Record TableRelations_ANJ; FilterValue: Text[2048])
    begin
        TableRelations.Validate(FilterValue, FilterValue);
    end;

    /// <summary>
    /// GetFilterValue.
    /// </summary>
    /// <param name="TableRelations">VAR Record TableRelations_ANJ.</param>
    /// <param name="FilterValue">VAR Text[2048].</param>
    internal procedure GetFilterValue(var TableRelations: Record TableRelations_ANJ; var FilterValue: Text[2048])
    begin
        FilterValue := TableRelations.FilterValue;
    end;
}