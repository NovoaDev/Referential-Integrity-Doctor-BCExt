/// <summary>
/// Codeunit ForeignKeysImp_ANJ (ID 80701) implements Interface RelationshipsType_ANJ.
/// </summary>
codeunit 80701 ForeignKeysImp_ANJ implements RelationshipsType_ANJ
{
    Access = Internal;

    /// <summary>
    /// CheckRulesBeforeInsertFieldLine.
    /// </summary>
    /// <param name="TableNo">Integer.</param>
    /// <param name="FieldNo">Integer.</param>
    /// <param name="RelationTableNo">Integer.</param>
    /// <param name="RelationFieldNo">Integer.</param>
    /// <returns>Return value of type Boolean.</returns>
    procedure CheckRulesBeforeInsertFieldLine(TableNo: Integer; FieldNo: Integer; RelationTableNo: Integer; RelationFieldNo: Integer): Boolean;
    begin
        exit(ReviewerFieldIsPartOfPK.Check(RelationTableNo, RelationFieldNo));
    end;

    var
        ReviewerFieldIsPartOfPK: Codeunit ReviewerFieldIsPartOfPK_ANJ;
}