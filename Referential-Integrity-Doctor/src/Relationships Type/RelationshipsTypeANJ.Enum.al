/// <summary>
/// Enum RelationshipsType_ANJ (ID 80700) implements Interface RelationshipsType_ANJ;.
/// </summary>
enum 80700 RelationshipsType_ANJ implements RelationshipsType_ANJ
{
    Access = Internal;
    Caption = 'Relationships Type';
    Extensible = true;

    value(0; ForeignKeys)
    {
        Caption = 'Foreign Keys';
        Implementation = RelationshipsType_ANJ = ForeignKeysImp_ANJ;
    }
}