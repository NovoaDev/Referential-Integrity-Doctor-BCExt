/// <summary>
/// Enum TableRangeAllocator_ANJ (ID 80701) implements Interface TableRangeAllocator_ANJ.
/// </summary>
enum 80701 TableRangeAllocator_ANJ implements TableRangeAllocator_ANJ
{
    Access = Public;
    Extensible = true;

    value(0; PerRange)
    {
        Caption = 'Per Range';
        Implementation = TableRangeAllocator_ANJ = PerRangeImplementation_ANJ;
    }
}