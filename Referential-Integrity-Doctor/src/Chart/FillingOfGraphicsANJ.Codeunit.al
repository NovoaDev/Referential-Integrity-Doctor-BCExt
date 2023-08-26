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
    begin
        if IsHandled then
            exit;

        TempBusinessChartBuffer.AddMeasure(GoodLbl, 1, TempBusinessChartBuffer."Data Type"::Decimal, TempBusinessChartBuffer."Chart Type"::Column.AsInteger());
        TempBusinessChartBuffer.AddMeasure(TroubledLbl, 1, TempBusinessChartBuffer."Data Type"::Decimal, TempBusinessChartBuffer."Chart Type"::Column.AsInteger());
        TempBusinessChartBuffer.SetXAxis(RecordsLbl, TempBusinessChartBuffer."Data Type"::String);

        FillBufferValues(MedicalTest, TempBusinessChartBuffer);
    end;

    /// <summary>
    /// FillBufferValues.
    /// </summary>
    /// <param name="MedicalTest">Code[20].</param>
    /// <param name="TempBusinessChartBuffer">Temporary VAR Record "Business Chart Buffer".</param>
    local procedure FillBufferValues(MedicalTest: Code[20]; var TempBusinessChartBuffer: Record "Business Chart Buffer" temporary)
    var
        TablesToClean: Record TablesToClean_ANJ;
        GoodRecords: Integer;
        Iterator: Integer;
        TroubledRecords: Integer;
    begin
        Clear(Iterator);
        TablesToClean.SetLoadFields(TableName, TotalOfRecords);
        TablesToClean.SetAutoCalcFields(TableName);
        TablesToClean.SetRange(MedicalTests, MedicalTest);
        TablesToClean.SetFilter(TotalOfRecords, '<>%1', 0);
        if TablesToClean.FindSet(false) then
            repeat
                TempBusinessChartBuffer.AddColumn(TablesToClean.TableName);
                GoodRecords := TablesToClean.TotalOfRecords;
                TroubledRecords := GetTroubledRecord(TablesToClean.TableNo);
                TempBusinessChartBuffer.SetValueByIndex(0, Iterator, GoodRecords);
                TempBusinessChartBuffer.SetValueByIndex(1, Iterator, TroubledRecords);
                Iterator += 1;
            until TablesToClean.Next() = 0;
    end;

    /// <summary>
    /// GetTroubledRecord.
    /// </summary>
    /// <param name="TableNo">Integer.</param>
    /// <returns>Return value of type Integer.</returns>
    local procedure GetTroubledRecord(TableNo: Integer): Integer
    var
        Diagnostic: Record Diagnostic_ANJ;
    begin
        Diagnostic.SetRange(TableNo, TableNo);
        exit(Diagnostic.Count());
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeFillChart(MedicalTest: Code[20]; var TempBusinessChartBuffer: Record "Business Chart Buffer" temporary; var IsHandled: Boolean);
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterFillChart(MedicalTest: Code[20]; var TempBusinessChartBuffer: Record "Business Chart Buffer" temporary);
    begin
    end;

    var
        GoodLbl: Label 'Good';
        RecordsLbl: Label 'Record';
        TroubledLbl: Label 'Troubled';
}