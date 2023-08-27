/// <summary>
/// Codeunit UpdateRIDocFactBox_ANJ (ID 80720).
/// </summary>
codeunit 80720 UpdateRIDocFactBox_ANJ
{
    Access = Public;

    /// <summary>
    /// Update.
    /// </summary>
    /// <param name="TheRIDoctor">VAR Record TheRIDoctor_ANJ.</param>
    /// <param name="FactBoxText">Text.</param>
    /// <param name="Base64Text">Text.</param>
    internal procedure Update(var TheRIDoctor: Record TheRIDoctor_ANJ; FactBoxText: Text[250]; Base64Text: Text)
    var
        IsHandled: Boolean;
    begin
        OnBeforeUpdate(TheRIDoctor, FactBoxText, Base64Text, IsHandled);
        DoUpdate(TheRIDoctor, FactBoxText, Base64Text, IsHandled);
        OnAfterUpdate(TheRIDoctor, FactBoxText, Base64Text);
    end;

    /// <summary>
    /// DoUpdate.
    /// </summary>
    /// <param name="TheRIDoctor">VAR Record TheRIDoctor_ANJ.</param>
    /// <param name="FactBoxText">Text[250].</param>
    /// <param name="Base64Text">Text.</param>
    /// <param name="IsHandled">Boolean.</param>
    local procedure DoUpdate(var TheRIDoctor: Record TheRIDoctor_ANJ; FactBoxText: Text[250]; Base64Text: Text; IsHandled: Boolean);
    var
        Base64Convertert: Codeunit "Base64 Convert";
        TempBlob: Codeunit "Temp Blob";
        AuxInStream: InStream;
        AuxOutStream: OutStream;
    begin
        if IsHandled then
            exit;

        Clear(TheRIDoctor.FactBoxPicture);
        TempBlob.CreateOutStream(AuxOutStream);
        Base64Convertert.FromBase64(Base64Text, AuxOutStream);
        TempBlob.CreateInStream(AuxInStream);

        TheRIDoctor.FactBoxPicture.ImportStream(AuxInStream, '');
        TheRIDoctor.Validate(FactBoxText, FactBoxText);
        TheRIDoctor.Modify(true);
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeUpdate(var TheRIDoctor: Record TheRIDoctor_ANJ; var FactBoxText: Text[250]; var Base64Text: Text; var IsHandled: Boolean);
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterUpdate(var TheRIDoctor: Record TheRIDoctor_ANJ; FactBoxText: Text[250]; Base64Text: Text);
    begin
    end;
}