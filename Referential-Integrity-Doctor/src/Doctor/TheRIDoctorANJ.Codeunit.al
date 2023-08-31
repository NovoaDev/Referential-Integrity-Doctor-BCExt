/// <summary>
/// Codeunit TheRIDoctor_ANJ (ID 80713).
/// </summary>
codeunit 80713 TheRIDoctor_ANJ
{
    Access = Public;

    /// <summary>
    /// Diagnostic.
    /// </summary>
    /// <param name="MedicalTests">Code[20].</param>
    /// <param name="HideDialog">Boolean.</param>
    internal procedure Diagnostic(MedicalTests: Code[20]; HideDialog: Boolean)
    var
        IsHandled: Boolean;
    begin
        OnBeforeDiagnostic(MedicalTests, IsHandled);
        DoDiagnostic(MedicalTests, IsHandled);
        OnAfterDiagnostic(MedicalTests);
        AcknowledgeDiagnostic(HideDialog)
    end;

    /// <summary>
    /// DoDiagnostic.
    /// </summary>
    /// <param name="MedicalTests">Code[20].</param>
    /// <param name="IsHandled">Boolean.</param>
    local procedure DoDiagnostic(MedicalTests: Code[20]; IsHandled: Boolean);
    var
        TablesToClean: Record TablesToClean_ANJ;
    begin
        if IsHandled then
            exit;

        TablesToClean.Validate(MedicalTests, MedicalTests);
        if TablesToClean.FindSet(false) then
            repeat
                VerifyFieldsToBeAnalyzedOnEachRecord(TablesToClean);
            until TablesToClean.Next() = 0;
    end;

    /// <summary>
    /// VerifyFieldsToBeAnalyzedOnEachRecord.
    /// </summary>
    /// <param name="TablesToClean">VAR Record TablesToClean_ANJ.</param>
    local procedure VerifyFieldsToBeAnalyzedOnEachRecord(var TablesToClean: Record TablesToClean_ANJ)
    var
        FieldsToAnalyze: Record FieldsToAnalyze_ANJ;
        AuxRecordRef: RecordRef;
        FiltersToApply: Dictionary of [Integer, Text[2048]];
    begin
        AuxRecordRef.Open(TablesToClean.TableNo);
        FillDictFromTableFilters.FillDictionary(TablesToClean.MedicalTests, TablesToClean.TableNo, FiltersToApply);
        FilterApplicator.ApplyFilter(FiltersToApply, AuxRecordRef);
        if AuxRecordRef.FindSet(false) then
            repeat
                FieldsToAnalyze.SetRange(MedicalTests, TablesToClean.MedicalTests);
                FieldsToAnalyze.SetRange(TableNo, TablesToClean.TableNo);
                if FieldsToAnalyze.FindSet(false) then
                    repeat

                    until FieldsToAnalyze.Next() = 0;
            until AuxRecordRef.Next() = 0;
        AuxRecordRef.Close();
    end;

    /// <summary>
    /// AcknowledgeDiagnostic.
    /// </summary>
    /// <param name="HideDialog">Boolean.</param>
    local procedure AcknowledgeDiagnostic(HideDialog: Boolean)
    var
        AcknowledgeMsg: Label 'Diagnosis performed correctly.';
    begin
        if not GuiAllowed or HideDialog then
            exit;

        Message(AcknowledgeMsg);
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeDiagnostic(var MedicalTests: Code[20]; var IsHandled: Boolean);
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterDiagnostic(var MedicalTests: Code[20]);
    begin
    end;

    var
        FillDictFromTableFilters: Codeunit FillDictFromTableFilters_ANJ;
        FilterApplicator: Codeunit FilterApplicator_ANJ;
}