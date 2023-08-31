/// <summary>
/// Enum FilterType_ANJ (ID 80705) implements Interface FilterType_ANJ.
/// </summary>
enum 80705 FilterType_ANJ implements FilterType_ANJ
{
    Access = Internal;
    Extensible = false;

    value(0; "Field")
    {
        Caption = 'Field';
        Implementation = FilterType_ANJ = FieldFieldTypeIMP_ANJ;
    }
    value(1; Constant)
    {
        Caption = 'Constant';
        Implementation = FilterType_ANJ = ConstantFieldTypeIMP_ANJ;
    }
}