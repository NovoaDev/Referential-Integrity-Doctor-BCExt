/// <summary>
/// Codeunit InfoTableCleaner_ANJ (ID 80707).
/// </summary>
codeunit 80707 InfoTableCleaner_ANJ
{
    Access = Public;

    /// <summary>
    /// CleanTablesWitoutRelations.
    /// </summary>
    internal procedure CleanTablesWitoutRelations()
    var
        IsHandled: Boolean;
    begin
        Commit(); // Commit the transaction to avoid deadlocks
        OnBeforeCleanTablesWitoutRelations(IsHandled);
        DoCleanTablesWitoutRelations(IsHandled);
        OnAfterCleanTablesWitoutRelations();
    end;

    /// <summary>
    /// DoCleanTablesWitoutRelations.
    /// </summary>
    /// <param name="IsHandled">Boolean.</param>
    local procedure DoCleanTablesWitoutRelations(IsHandled: Boolean);
    var
        TablesToClean: Record TablesToClean_ANJ;
    begin
        if IsHandled then
            exit;

        TablesToClean.SetRange(HasRelationshipLines, false);
        if not TablesToClean.IsEmpty() then
            TablesToClean.DeleteAll(true);
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeCleanTablesWitoutRelations(var IsHandled: Boolean);
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterCleanTablesWitoutRelations();
    begin
    end;
}