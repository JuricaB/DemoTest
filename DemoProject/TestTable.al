table 50100 TestTable
{
    Caption = 'TestTable';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            AutoIncrement = true;
        }
        field(2; Desc; Text[50])
        {
            Caption = 'Desc';
        }
        field(3; "Document No."; Code[20])
        {
            Caption = 'Document No.';
        }
    }
    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
    }

    trigger OnModify()
    begin
        TestField("Document No.", '');
    end;
}
