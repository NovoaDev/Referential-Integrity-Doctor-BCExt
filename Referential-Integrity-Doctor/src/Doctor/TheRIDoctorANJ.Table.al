/// <summary>
/// Table TheRIDoctor_ANJ (ID 80700).
/// </summary>
table 80700 TheRIDoctor_ANJ
{
    Access = Internal;
    Caption = 'Referential Integrity Doctor';
    DataClassification = CustomerContent;
    DrillDownPageID = TheRIDoctor_ANJ;
    LookupPageID = TheRIDoctor_ANJ;

    fields
    {
        field(1; PrimaryKey; Code[10])
        {
            Caption = 'Primary Key';
            NotBlank = true;
        }
        field(2; MedicalTests; Code[20])
        {
            Caption = 'Medical Tests';
            TableRelation = MedicalTests_ANJ;

            trigger OnValidate()
            begin
                CalcFields(Description);
            end;
        }
        field(3; Description; Text[100])
        {
            CalcFormula = lookup(MedicalTests_ANJ.Description where(No = field(MedicalTests)));
            Caption = 'Description';
            Editable = false;
            FieldClass = FlowField;
        }
        field(4; DiagnosticStatus; Enum DiagnosticStatus_ANJ)
        {
            Caption = 'Diagnostic Status';
            InitValue = "None";

            trigger OnValidate()
            begin
                UpdateFactBox();
            end;
        }
        field(5; FactBoxPicture; Media)
        {
            Caption = 'FactBox Picture';
        }
        field(6; FactBoxText; Text[250])
        {
            Caption = 'FactBox Text';
        }
    }
    keys
    {
        key(PK; PrimaryKey)
        {
            Clustered = true;
        }
    }
    fieldgroups
    {
        fieldgroup(Brick; MedicalTests, Description)
        {
        }
        fieldgroup(DropDown; MedicalTests, Description)
        {
        }
    }

    /// <summary>
    /// GetInstance.
    /// </summary>
    internal procedure GetInstance();
    begin
        if HasBeenRead then
            exit;

        if not Get() then begin
            Init();
            Insert(true);
        end;
        HasBeenRead := true;
    end;

    /// <summary>
    /// UpdateFactBox.
    /// </summary>
    local procedure UpdateFactBox()
    var
        FactBoxImgLoader: Codeunit FactBoxImgLoader_ANJ;
        FactBoxTextLoader: Codeunit FactBoxTextLoader_ANJ;
        UpdateRIDocFactBoxPicture: Codeunit UpdateRIDocFactBox_ANJ;
        FactBoxPictureBase64: Text;
        AuxFactBoxText: Text[250];
    begin
        FactBoxImgLoader.GetValue(DiagnosticStatus, FactBoxPictureBase64);
        FactBoxTextLoader.GetText(DiagnosticStatus, AuxFactBoxText);
        UpdateRIDocFactBoxPicture.Update(Rec, AuxFactBoxText, FactBoxPictureBase64);
    end;

    var

        HasBeenRead: Boolean;
}