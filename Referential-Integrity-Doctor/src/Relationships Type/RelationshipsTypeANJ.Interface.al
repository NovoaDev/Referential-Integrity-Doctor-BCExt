/// <summary>
/// Interface RelationshipsType_ANJ._ANJ
/// </summary>
interface RelationshipsType_ANJ
{
    Access = Public;

    /// <summary>
    /// CheckRulesBeforeInsertFieldLine.
    /// </summary>
    /// <param name="TableNo">Integer.</param>
    /// <param name="FieldNo">Integer.</param>
    /// <param name="RelationTableNo">Integer.</param>
    /// <param name="RelationFieldNo">Integer.</param>
    /// <returns>Return value of type Boolean.</returns>
    procedure CheckRulesBeforeInsertFieldLine(TableNo: Integer; FieldNo: Integer; RelationTableNo: Integer; RelationFieldNo: Integer): Boolean;
}