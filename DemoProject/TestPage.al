page 50100 "Demo list"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = TestTable;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = All;
                }
                field(Desc; Rec.Desc)
                {
                    ApplicationArea = All;
                }

                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = All;
                }

            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(SetDocNo)
            {
                Caption = 'Set Doc No.';
                ApplicationArea = All;

                trigger OnAction()
                begin
                    Rec."Document No." := 'Test';
                    Rec.Modify(false);
                    CurrPage.Update(false);
                end;
            }
            action(ClearDocNo)
            {
                Caption = 'Clear Doc No.';
                ApplicationArea = All;

                trigger OnAction()
                begin
                    Rec."Document No." := '';
                    Rec.Modify(false);
                    CurrPage.Update(false);
                end;
            }
        }
    }
}