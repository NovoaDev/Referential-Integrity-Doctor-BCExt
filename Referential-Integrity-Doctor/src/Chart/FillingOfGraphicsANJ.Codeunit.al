/// <summary>
/// Codeunit FillingOfGraphics_ANJ (ID 80710).
/// </summary>
codeunit 80710 FillingOfGraphics_ANJ
{
    Access = Public;

    /// <summary>
    /// FillChart.
    /// </summary>
    /// <param name="MedicalTest">Code[20].</param>
    /// <param name="TempBusinessChartBuffer">Temporary VAR Record "Business Chart Buffer".</param>
    internal procedure FillChart(MedicalTest: Code[20]; var TempBusinessChartBuffer: Record "Business Chart Buffer" temporary)
    var
        IsHandled: Boolean;
    begin
        OnBeforeFillChart(MedicalTest, TempBusinessChartBuffer, IsHandled);
        DoFillChart(MedicalTest, TempBusinessChartBuffer, IsHandled);
        OnAfterFillChart(MedicalTest, TempBusinessChartBuffer);
    end;

    /// <summary>
    /// DoFillChart.
    /// </summary>
    /// <param name="MedicalTest">Code[20].</param>
    /// <param name="TempBusinessChartBuffer">Temporary VAR Record "Business Chart Buffer".</param>
    /// <param name="IsHandled">Boolean.</param>
    local procedure DoFillChart(MedicalTest: Code[20]; var TempBusinessChartBuffer: Record "Business Chart Buffer" temporary; IsHandled: Boolean);
    var
        TablesToClean: Record TablesToClean_ANJ;
        Iterator: Integer;
    begin
        if IsHandled then
            exit;

        Clear(Iterator);
        TempBusinessChartBuffer.AddMeasure('Records', 1, TempBusinessChartBuffer."Data Type"::Decimal, TempBusinessChartBuffer."Chart Type"::Column.AsInteger());
        TempBusinessChartBuffer.AddMeasure('Troubled', 1, TempBusinessChartBuffer."Data Type"::Decimal, TempBusinessChartBuffer."Chart Type"::Column.AsInteger());
        TempBusinessChartBuffer.SetXAxis('Tables', TempBusinessChartBuffer."Data Type"::String);

        TablesToClean.SetLoadFields(TableName, TotalOfRecords);
        TablesToClean.SetAutoCalcFields(TableName);
        TablesToClean.SetRange(MedicalTests, MedicalTest);
        TablesToClean.SetFilter(TotalOfRecords, '<>%1', 0);
        if TablesToClean.FindSet(false) then
            repeat
                TempBusinessChartBuffer.AddColumn(TablesToClean.TableName);
                TempBusinessChartBuffer.SetValueByIndex(0, Iterator, TablesToClean.TotalOfRecords);
                TempBusinessChartBuffer.SetValueByIndex(1, Iterator, TablesToClean.TotalOfRecords);
                Iterator += 1;
            until TablesToClean.Next() = 0;
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeFillChart(MedicalTest: Code[20]; var TempBusinessChartBuffer: Record "Business Chart Buffer" temporary; var IsHandled: Boolean);
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterFillChart(MedicalTest: Code[20]; var TempBusinessChartBuffer: Record "Business Chart Buffer" temporary);
    begin
    end;
}