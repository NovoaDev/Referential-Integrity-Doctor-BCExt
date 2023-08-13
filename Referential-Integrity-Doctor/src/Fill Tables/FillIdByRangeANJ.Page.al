/// <summary>
/// Page FillIdByRange_ANJ (ID 80705).
/// </summary>
page 80705 FillIdByRange_ANJ
{
    ApplicationArea = All;
    Caption = 'Add Table Id By Range';
    PageType = ConfirmationDialog;
    UsageCategory = None;

    layout
    {
        area(Content)
        {
            group(FieldsGroup)
            {
                Caption = 'Fields';

                field(InitTableId; InitTableId)
                {
                    AssistEdit = true;
                    Caption = 'Init Table Id';
                    ToolTip = 'Specifies the value of the Init Table Id field.';

                    trigger OnValidate()
                    begin
                        Validate(InitTableId, InitTableId);
                    end;

                    trigger OnAssistEdit()
                    begin
                        OnAssistEditField(InitTableId);
                    end;
                }
                field(EndTableId; EndTableId)
                {
                    AssistEdit = true;
                    Caption = 'End Table Id';
                    ToolTip = 'Specifies the value of the End Table Id field.';

                    trigger OnValidate()
                    begin
                        Validate(EndTableId, EndTableId);
                    end;

                    trigger OnAssistEdit()
                    begin
                        OnAssistEditField(EndTableId);
                    end;
                }
                field(RemoveFromListTablesWithoutFieldsWithRelations; RemoveFromListTablesWithoutFieldsWithRelations)
                {
                    Caption = 'Remove From List Tables Without Fields With Relations';
                    ToolTip = 'Specifies the value of the Remove From List Tables Without Fields With Relations field.';
                }
            }
        }
    }

    trigger OnQueryClosepage(CloseAction: Action): Boolean
    begin
        if CloseAction <> Action::Yes then
            exit;

        if (InitTableId = 0) or (EndTableId = 0) then
            Error(EmptyTableIdErr);

        if InitTableId > EndTableId then
            Error(EndTableIdErr);
    end;

    /// <summary>
    /// OnAssistEditField.
    /// </summary>
    /// <returns>Return value of type Integer.</returns>
    internal procedure OnAssistEditField(var Variable: Integer)
    var
        TableMetadata: Record "Table Metadata";
        TableId: Integer;
    begin
        TableMetadata.SetLoadFields(ID, Name);
        if Action::LookupOK = Page.RunModal(Page::ShowTableList_ANJ, TableMetadata) then begin
            TableId := TableMetadata.ID;
            Validate(Variable, TableId);
        end;
    end;

    /// <summary>
    /// Validate.
    /// </summary>
    /// <param name="Variable">VAR Integer.</param>
    /// <param name="TableId">Integer.</param>
    local procedure Validate(var Variable: Integer; TableId: Integer)
    var
        TableMetadata: Record "Table Metadata";
    begin
        if TableId = 0 then
            exit;

        TableMetadata.SetRange(ID, TableId);
        if TableMetadata.IsEmpty() then
            Error(TableIdErr);

        Variable := TableId;
    end;

    /// <summary>
    /// GetParameters.
    /// </summary>
    /// <param name="AuxInitTableId">VAR Integer.</param>
    /// <param name="AuxEndTableId">VAR Integer.</param>
    /// <param name="AuxRemoveFromListTablesWithoutFieldsWithRelations">VAR Boolean.</param>
    procedure GetParameters(var AuxInitTableId: Integer; var AuxEndTableId: Integer; var AuxRemoveFromListTablesWithoutFieldsWithRelations: Boolean)
    begin
        AuxInitTableId := InitTableId;
        AuxEndTableId := EndTableId;
        AuxRemoveFromListTablesWithoutFieldsWithRelations := RemoveFromListTablesWithoutFieldsWithRelations;
    end;

    var
        RemoveFromListTablesWithoutFieldsWithRelations: Boolean;
        EndTableId: Integer;
        InitTableId: Integer;
        EmptyTableIdErr: Label 'Empty table id fields.';
        EndTableIdErr: Label 'The End Table Id field cannot be less than the Init Table Id field.';
        TableIdErr: Label 'Table Id is not valid.';
}