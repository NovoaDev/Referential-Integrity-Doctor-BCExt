/// <summary>
/// Codeunit FieldFieldTypeIMP_ANJ (ID 80726) implements Interface FilterType_ANJ.
/// </summary>
codeunit 80726 FieldFieldTypeIMP_ANJ implements FilterType_ANJ
{
    Access = Internal;

    /// <summary>
    /// OnAssistEditField.
    /// </summary>
    /// <param name="TableId">Integer.</param>
    /// <param name="FieldFormat">Enum FieldFormat_ANJ.</param>
    /// <returns>Return value of type Integer.</returns>
    internal procedure OnAssistEditField(TableId: Integer; FieldFormat: Enum FieldFormat_ANJ): Integer;
    var
        AuxField: Record Field;
    begin
        AuxField.SetLoadFields("No.");
        AuxField.SetRange(TableNo, TableId);
        AuxField.SetRange(Type, FieldFormat.AsInteger());
        AuxField.SetFilter("No.", '<=%1', AuxField.FieldNo(SystemId));
        if Action::LookupOK = Page.RunModal(Page::ShowFields_ANJ, AuxField) then
            exit(AuxField."No.");
    end;

    /// <summary>
    /// SetFilterValue.
    /// </summary>
    /// <param name="TableRelations">VAR Record TableRelations_ANJ.</param>
    /// <param name="FilterValue">Text.</param>
    internal procedure SetFilterValue(var TableRelations: Record TableRelations_ANJ; FilterValue: Text[2048])
    var
        FieldNo: Integer;
    begin
        Evaluate(FieldNo, FilterValue);
        TableRelations.Validate(SourceFieldNo, FieldNo);
    end;

    /// <summary>
    /// GetFilterValue.
    /// </summary>
    /// <param name="TableRelations">VAR Record TableRelations_ANJ.</param>
    /// <param name="FilterValue">VAR Text[2048].</param>
    internal procedure GetFilterValue(var TableRelations: Record TableRelations_ANJ; var FilterValue: Text[2048])
    begin
        FilterValue := Format(TableRelations.RelationFieldNo);
    end;
}