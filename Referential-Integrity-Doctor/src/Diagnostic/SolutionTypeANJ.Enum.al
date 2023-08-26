/// <summary>
/// Enum SolutionType_ANJ (ID 80704).
/// </summary>
enum 80704 SolutionType_ANJ implements Solution_ANJ
{
    Access = Public;
    Caption = 'Solution';
    DefaultImplementation = Solution_ANJ = DefaultSolutionIMP_ANJ;
    Extensible = true;

    value(0; " ")
    {
        Caption = ' ';
        Implementation = Solution_ANJ = DefaultSolutionIMP_ANJ;
    }
    value(1; DoNothing)
    {
        Caption = 'Do Nothing';
        Implementation = Solution_ANJ = DoNothingSolutionIMP_ANJ;
    }
    value(2; UpdateOrphanedRecords)
    {
        Caption = 'Update Orphaned Records';
        Implementation = Solution_ANJ = UpdateOrphanedSolutionIMP_ANJ;
    }
    value(3; GenerateMissingRecords)
    {
        Caption = 'Generate Missing Records';
        Implementation = Solution_ANJ = GenerateMissingRecordsIMP_ANJ;
    }
}