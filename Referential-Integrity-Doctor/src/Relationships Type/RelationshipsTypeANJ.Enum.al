/// <summary>
/// Enum "RelationshipsType_ANJ" (ID 80700) implements Interface RelationshipsType_ANJ;.
/// </summary>
enum 80700 RelationshipsType_ANJ implements RelationshipsType_ANJ
{
    Access = Internal;
    Caption = 'Relationships Type';
    Extensible = true;

    value(0; OnlyForeignKeys)
    {
        // Relations 1:1, 1:N, Complete relation and validate relation true.
        Caption = 'Only Foreign Keys';
        Implementation = RelationshipsType_ANJ = OnlyForeignKeysImp_ANJ;
    }
}