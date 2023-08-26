/// <summary>
/// Codeunit SolveTheProblems_ANJ (ID 80702).
/// </summary>
codeunit 80702 SolveTheProblems_ANJ
{
    Access = Public;

    /// <summary>
    /// Solve.
    /// </summary>
    /// <param name="HideDialog">Boolean.</param>
    internal procedure Solve(HideDialog: Boolean)
    var
        IsHandled: Boolean;
        ProblemsFixed: Integer;
    begin
        CheckDiagnosticLines();

        if not ConfirmSolve(HideDialog) then
            exit;

        OnBeforeSolve(IsHandled);
        DoSolve(ProblemsFixed, IsHandled);
        OnAfterSolve(ProblemsFixed);
        AcknowledgeSolve(ProblemsFixed, HideDialog)
    end;

    /// <summary>
    /// CheckDiagnosticLines.
    /// </summary>
    local procedure CheckDiagnosticLines()
    var
        Diagnostic: Record Diagnostic_ANJ;
    begin
        Diagnostic.SetRange(DiagnosticStatus, Diagnostic.DiagnosticStatus::Warning);
        Diagnostic.SetFilter(SolutionType, '<>%1', Diagnostic.SolutionType::" ");
        if Diagnostic.IsEmpty() then
            Error(DiagnosticLinesErr);
    end;

    /// <summary>
    /// DoSolve.
    /// </summary>
    /// <param name="IsHandled">Boolean.</param>
    local procedure DoSolve(var ProblemsFixed: Integer; IsHandled: Boolean);
    var
        Diagnostic: Record Diagnostic_ANJ;
    begin
        if IsHandled then
            exit;

        Diagnostic.SetRange(DiagnosticStatus, Diagnostic.DiagnosticStatus::Warning);
        Diagnostic.SetFilter(SolutionType, '<>%1', Diagnostic.SolutionType::" ");
        if Diagnostic.FindSet(true) then
            repeat
                if Diagnostic.SolveTheProblems() then
                    ProblemsFixed += 1;
            until Diagnostic.Next() = 0;
    end;

    /// <summary>
    /// ConfirmSolve.
    /// </summary>
    /// <param name="HideDialog">Boolean.</param>
    /// <returns>Return value of type Boolean.</returns>
    local procedure ConfirmSolve(HideDialog: Boolean): Boolean
    var
        DefaultAnswer: Boolean;
    begin
        DefaultAnswer := true;

        if HideDialog then
            exit(DefaultAnswer);

        exit(ConfirmManagement.GetResponseOrDefault(ConfirmQst, DefaultAnswer));
    end;

    /// <summary>
    /// AcknowledgeSolve.
    /// </summary>
    /// <param name="ProblemsFixed">Integer.</param>
    /// <param name="HideDialog">Boolean.</param>
    local procedure AcknowledgeSolve(ProblemsFixed: Integer; HideDialog: Boolean)
    begin
        if not GuiAllowed or HideDialog then
            exit;

        Message(AcknowledgeMsg, ProblemsFixed);
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeSolve(var IsHandled: Boolean);
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterSolve(var ProblemsFixed: Integer);
    begin
    end;

    var
        ConfirmManagement: Codeunit "Confirm Management";
        AcknowledgeMsg: Label '%1 problems have been solved successfully.';
        ConfirmQst: Label 'It is very important that you are sure of what you are doing, a wrong decision can create inconsistencies in the database. Do you want to continue?';
        DiagnosticLinesErr: Label 'No diagnostic lines have been found with warning status and with any pending solution to be executed.';
}