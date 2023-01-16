codeunit 50900 testDemo
{
    Subtype = Test;
    TestPermissions = Disabled;
    [Test]
    procedure T1_JustNext()
    var
        Demolist: testPage "Demo list";
        TestTable: Record TestTable;
    begin
        // [FEATURE]
        // [GIVEN] Staging page opens in Edit mode
        testTable.DeleteAll();
        TestTable.Init;
        TestTable."Entry No." := 1;
        TestTable."Desc" := 'test';
        TestTable."Document No." := 'test';
        TestTable.Insert();
        DemoList.OpenEdit();
        DemoList.First();

        // [WHEN] User edits line which has Document fields populated
        Demolist.Desc.SetValue('DESC 2');

        // [THEN] Error is raised

        asserterror DemoList.Next();

        Assert.ExpectedError('Document No. must be equal to ''''  in TestTable: Entry No.=1. Current value is ''TEST''');
    end;

    [Test]
    procedure T2_NextAndError()
    var
        Demolist: testPage "Demo list";
        TestTable: Record TestTable;
    begin
        // [FEATURE]
        // [GIVEN] Staging page opens in Edit mode
        testTable.DeleteAll();
        TestTable.Init;
        TestTable."Entry No." := 1;
        TestTable."Desc" := 'test';
        TestTable."Document No." := 'test';
        TestTable.Insert();
        DemoList.OpenEdit();
        DemoList.First();

        // [WHEN] User edits line which has Document fields populated
        Demolist.Desc.SetValue('DESC 2');

        // [THEN] Error is raised

        asserterror
        begin
            DemoList.Next();
            error('');
        end;
        Assert.ExpectedError('Document No. must be equal to ''''  in TestTable: Entry No.=1. Current value is ''TEST''');
    end;

    [Test]
    procedure T3_TableModify()
    var
        // Demolist: testPage "Demo list";
        TestTable: Record TestTable;
    begin
        // [FEATURE]
        // [GIVEN] Staging page opens in Edit mode
        testTable.DeleteAll();
        TestTable.Init;
        TestTable."Entry No." := 1;
        TestTable."Desc" := 'test';
        TestTable."Document No." := 'test';
        TestTable.Insert();

        // [WHEN] User edits line which has Document fields populated
        TestTable."Desc" := 'test 2';

        // [THEN] Error is raised
        asserterror TestTable.Modify(true);

        Assert.ExpectedError('Document No. must be equal to ''''  in TestTable: Entry No.=1. Current value is ''TEST''');
    end;

    var
        Assert: Codeunit Assert;
}