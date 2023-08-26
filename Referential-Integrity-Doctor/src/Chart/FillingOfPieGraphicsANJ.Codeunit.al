/// <summary>
/// Codeunit FillingOfPieGraphics_ANJ (ID 80711).
/// </summary>
codeunit 80711 FillingOfPieGraphics_ANJ
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

        TempBusinessChartBuffer.AddMeasure(StatusLbl, 1, TempBusinessChartBuffer."Data Type"::Decimal, TempBusinessChartBuffer."Chart Type"::Pie.AsInteger());
        TempBusinessChartBuffer.SetXAxis(RecordLbl, TempBusinessChartBuffer."Data Type"::String);

        FillBufferValues(MedicalTest, TempBusinessChartBuffer);
    end;

    /// <summary>
    /// FillBufferValues.
    /// </summary>
    /// <param name="MedicalTest">Code[20].</param>
    /// <param name="TempBusinessChartBuffer">Temporary VAR Record "Business Chart Buffer".</param>
    local procedure FillBufferValues(MedicalTest: Code[20]; var TempBusinessChartBuffer: Record "Business Chart Buffer" temporary)
    var
        Diagnostic: Record Diagnostic_ANJ;
        TablesToClean: Record TablesToClean_ANJ;
        TotalInDiagnostic: Integer;
    begin
        TablesToClean.SetRange(MedicalTests, MedicalTest);
        TablesToClean.CalcSums(TotalOfRecords);
        TotalInDiagnostic := Diagnostic.Count();
        TempBusinessChartBuffer.AddColumn(GoodLbl);
        TempBusinessChartBuffer.SetValueByIndex(0, 0, TablesToClean.TotalOfRecords);
        TempBusinessChartBuffer.AddColumn(TroubledLbl);
        TempBusinessChartBuffer.SetValueByIndex(0, 1, TotalInDiagnostic);
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
        RecordLbl: Label 'Record';
        StatusLbl: Label 'Status';
        TroubledLbl: Label 'Troubled';
}