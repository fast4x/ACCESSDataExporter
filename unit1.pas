unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, SdfData, db, sqldb, fpcsvexport, fpdbfexport, odbcconn,
  pqconnection, FileUtil, ZConnection, ZDataset, ZSqlUpdate, ZSqlMetadata,
  Forms, Controls, Graphics, Dialogs, StdCtrls, DBGrids, ComCtrls, ExtCtrls,
  Buttons, DbCtrls, Menus, types, fpDBExport;

type

  { TForm1 }

  TForm1 = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    CheckBox1: TCheckBox;
    CSVExporter1: TCSVExporter;
    Datasource1: TDatasource;
    Datasource2: TDatasource;
    DBComboBox1: TDBComboBox;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    DBNavigator1: TDBNavigator;
    FPDBFExport1: TFPDBFExport;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    ListBox1: TListBox;
    MainMenu1: TMainMenu;
    Memo1: TMemo;
    Memo_sql: TMemo;
    Memo3: TMemo;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    ODBCConnection1: TODBCConnection;
    OpenDialog1: TOpenDialog;
    PageControl1: TPageControl;
    MsgPanel: TPanel;
    ProgressBar1: TProgressBar;
    RadioGroup1: TRadioGroup;
    SaveDialog1: TSaveDialog;
    SdfDataSet1: TSdfDataSet;
    SQLQuery1: TSQLQuery;
    SQLTransaction1: TSQLTransaction;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox2Change(Sender: TObject);
    procedure CSVExporter1ExportRow(Sender: TObject; var AllowExport: Boolean);
    procedure dbsrvAfterInsert(DataSet: TDataSet);
    procedure dbsrvAfterScroll(DataSet: TDataSet);
    procedure dbsrvBeforeInsert(DataSet: TDataSet);
    procedure Edit1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FPDBFExport1ExportRow(Sender: TObject; var AllowExport: Boolean);
    procedure ListBox1Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
    procedure PQConnection1Log(Sender: TSQLConnection; EventType: TDBEventType;
      const Msg: String);
    procedure RadioGroup1ChangeBounds(Sender: TObject);
    procedure SQLQuery1AfterPost(DataSet: TDataSet);
    procedure TabSheet2Show(Sender: TObject);
    procedure TabSheet3Show(Sender: TObject);
    procedure TabSheet4ContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure TabSheet4Show(Sender: TObject);
    procedure ZQuery1AfterPost(DataSet: TDataSet);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;
  imp:word;

implementation
uses about;
{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
begin
  if opendialog1.Execute then begin

       odbcconnection1.Connected:=false;
       odbcconnection1.Params.Clear;
       odbcconnection1.Params.Add('DBQ='+opendialog1.FileName);
       odbcconnection1.Connected:=true;
       odbcconnection1.GetTableNames(listbox1.Items,false);

//        sdfdataset1.Close;
//        sdfdataset1.FileName:=opendialog1.FileName;
//        sdfdataset1.Open;
        //showmessage(inttostr(sdfdataset1.FieldCount));
        //showmessage(inttostr(sdfdataset1.FieldDefs[0].Size));
        //showmessage(sdfdataset1.Schema.Text);
//        progressbar1.Max:=sqlquery1.RecordCount;
//        progressbar1.Min:=1;
//        progressbar1.Position:=0;
//        if progressbar1.Max = 0 then showmessage('Il file da importare è vuoto.') else begin
            bitbtn3.Enabled:=true;
//        end;
        label12.Caption:=opendialog1.FileName;
  end;
end;

procedure TForm1.BitBtn8Click(Sender: TObject);
begin
  try
//    dbsrvAfterScroll(nil);
//    zconnection1.Connect;
    MessageDlg('Test', 'Connessione riuscita ', mtInformation, [mbOK], 0);
  except
       on E: EDatabaseError do
    begin
      MessageDlg('Error', 'A database error has occurred. Technical error message: ' +
        E.Message, mtError, [mbOK], 0);
//      Edit1.Text := '';
    end;
  end;
end;

procedure TForm1.BitBtn9Click(Sender: TObject);
begin
  bitbtn9.Enabled:=false;
  bitbtn7.Enabled:=true;
  bitbtn6.Enabled:=true;
  bitbtn3.Enabled:=true;
  bitbtn4.Enabled:=true;
  bitbtn5.Enabled:=true;
  listbox1.ItemIndex:=-1;

  tabsheet2.Show;
//  opendialog1.FileName:='';
  savedialog1.FileName:='';
//  sdfdataset1.Close;
//  sdfdataset1.FileName:='';
  label12.Caption:='File';
//  edit1.Caption:='';
//  edit2.Caption:='';
  memo3.Lines.Clear;
end;

procedure TForm1.BitBtn5Click(Sender: TObject);
begin
  bitbtn9.Enabled:=false;
  savedialog1.FileName:=listbox1.Items[listbox1.ItemIndex];
//  if edit1.Caption ='' then begin
//   MessageDlg('Errore', 'Non hai specificato il nome della tabella di destinazione.', mtError, [mbOK], 0);
//   tabsheet3.Show;
//   exit;

//  end;
//  Button2Click(Sender); // crea/aggiorna sql creazione tabella destinazione
  memo3.Lines.Clear;
//  memo3.Lines.Add('Connessione al server '+quotedstr(dbsrv.FieldByName('descr').asstring));
  memo3.Lines.Add('Apertura del database '+quotedstr(opendialog1.filename));
  memo3.Lines.Add('Esporta i records della tabella '+quotedstr( listbox1.Items[listbox1.ItemIndex]));
  memo3.Lines.Add('Copia i records nel file '+quotedstr(savedialog1.FileName));

  tabsheet4.Show;
end;

procedure TForm1.BitBtn6Click(Sender: TObject);
begin
  tabsheet3.show;
end;

procedure TForm1.BitBtn7Click(Sender: TObject);
begin
  if savedialog1.Execute then begin
        //showmessage(inttostr(savedialog1.FilterIndex));
  if savedialog1.FilterIndex=2 then begin
          csvexporter1.FileName:=savedialog1.FileName;
          csvexporter1.Execute;
  end;
  if savedialog1.FilterIndex=1 then begin
          fpdbfexport1.FileName:=savedialog1.FileName;
          fpdbfexport1.Execute;
  end;

//  pagecontrol1.Enabled:=false;
//  Button3Click(Sender);
  Msgpanel.Caption:='Completato';
  pagecontrol1.Enabled:=true;
  bitbtn7.Enabled:=false;
  bitbtn6.Enabled:=false;
  bitbtn3.Enabled:=false;
  bitbtn9.Enabled:=true;
  end;
end;

procedure TForm1.BitBtn3Click(Sender: TObject);
begin
  tabsheet3.Show;
end;

procedure TForm1.BitBtn4Click(Sender: TObject);
begin
  tabsheet2.Show;
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
//  if dbsrv.RecordCount > 0 then tabsheet2.Show else showmessage('Nessuna connessione a database.');
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
begin
  tabsheet1.Show;
end;

procedure TForm1.Button2Click(Sender: TObject);
var a:word;
begin
  (*
  if (zconnection1.Protocol='postgresql') or
    (zconnection1.Protocol='postgresql-7') or
    (zconnection1.Protocol='postgresql-8')
  then begin
   zquery1.SQL.Clear;
   zquery1.SQL.Add('-- POSTGRESQL');
   zquery1.SQL.Add('CREATE TABLE '+edit1.Text+' (');
   zquery1.SQL.Add('idkey serial primary key,');
   for a:=0 to sdfdataset1.FieldDefs.Count-1 do begin
        zquery1.SQL.Add(sdfdataset1.FieldDefs[a].Name+' varchar('+inttostr(sdfdataset1.FieldDefs[a].Size)+'),');
   end;
   zquery1.SQL[zquery1.SQL.Count-1]:=copy(zquery1.SQL[zquery1.SQL.Count-1],0,length(zquery1.SQL[zquery1.SQL.Count-1])-1);
   zquery1.SQL.Add(')');
   end;

    if zconnection1.Protocol='mssql' then begin
   zquery1.SQL.Clear;
   zquery1.SQL.Add('-- MSSQL');
   zquery1.SQL.Add('CREATE TABLE '+edit1.Text+' (');
   zquery1.SQL.Add('idkey int IDENTITY(1,1),');
   for a:=0 to sdfdataset1.FieldDefs.Count-1 do begin
        zquery1.SQL.Add(sdfdataset1.FieldDefs[a].Name+' varchar('+inttostr(sdfdataset1.FieldDefs[a].Size)+'),');
   end;
   zquery1.SQL.Add('PRIMARY KEY (idkey)');
//   zquery1.SQL[zquery1.SQL.Count-1]:=copy(zquery1.SQL[zquery1.SQL.Count-1],0,length(zquery1.SQL[zquery1.SQL.Count-1])-1);
   zquery1.SQL.Add(')');
   end;


  Memo_sql.Lines.Clear;
   Memo_sql.Lines.Add(zquery1.SQL.Text);
  // showmessage(zquery1.SQL.Text)  ;

 //  zquery1.ExecSQL;
   //showmessage('Tabella creata') else showmessage('Errore nella creazione della tabella');
 *)

   sqlquery1.Close;
   sqlquery1.SQL.Clear;
   sqlquery1.SQL.Text:=memo_sql.Lines.Text;
   sqlquery1.Open;



   progressbar1.Max:=sqlquery1.RecordCount;
   progressbar1.Min:=1;
   progressbar1.Position:=0;
   if progressbar1.Max = 0 then showmessage('La tabella da esportare è vuota.');


end;

procedure TForm1.Button3Click(Sender: TObject);
var a: word;
begin

//  if checkbox2.Checked then begin
//  zquery1.ExecSQL;
//  end;
(*
  if checkbox1.Checked then begin
  zquery1.Close;
  zquery1.SQL.Clear;
  zquery1.SQL.Add('delete from '+edit1.text);
  zquery1.ExecSQL;
  end;

  sdfdataset1.First;
  sdfdataset1.DisableControls;

  while not sdfdataset1.EOF do begin
       zquery1.Close;
       zquery1.SQL.Clear;
       zquery1.SQL.Add('insert into '+edit1.text+' ( ');
       for a:=0 to sdfdataset1.Fields.Count-1 do begin
         zquery1.SQL.Add(sdfdataset1.FieldDefs[a].Name+',');
       end;
       zquery1.SQL[zquery1.SQL.Count-1]:=copy(zquery1.SQL[zquery1.SQL.Count-1],0,length(zquery1.SQL[zquery1.SQL.Count-1])-1);
       zquery1.SQL.Add(')');

       zquery1.SQL.Add('values ( ');
              for a:=0 to sdfdataset1.Fields.Count-1 do begin
                zquery1.SQL.Add(quotedstr(StringReplace(sdfdataset1.Fields[a].AsString, '\', '',[rfReplaceAll, rfIgnoreCase]))+',');
              end;
              zquery1.SQL[zquery1.SQL.Count-1]:=copy(zquery1.SQL[zquery1.SQL.Count-1],0,length(zquery1.SQL[zquery1.SQL.Count-1])-1);
              zquery1.SQL.Add(')');
//              showmessage(zquery1.SQL.text);
//              exit;
       memo1.Lines.Add(zquery1.SQL.text);
       zquery1.ExecSQL;
       progressbar1.StepIt;

       msgpanel.Caption:='Importati '+inttostr(progressbar1.Position)+' su '+inttostr(progressbar1.max);

       sdfdataset1.Next;
       application.ProcessMessages

   end;
  sdfdataset1.EnableControls;
  memo3.Lines.Add('Import terminato.');
  MessageDlg('Import', 'Import terminato.', mtInformation, [mbOK], 0);
  *)
//  csvexporter1.FileName:=savedialog1.FileName;
//  csvexporter1.Execute;
//  fpdbfexport1.FileName:=savedialog1.FileName;
//  fpdbfexport1.Execute;

end;

procedure TForm1.Button4Click(Sender: TObject);
begin
(*
  try
    if SQLTransaction1.Active then
    // Only if we are within a started transaction;
    // otherwise you get "Operation cannot be performed on an inactive dataset"
    begin
      SQLQuery1.ApplyUpdates; //Pass user-generated changes back to database...
      SQLTransaction1.Commit; //... and commit them using the transaction.
      //SQLTransaction1.Active now is false
    end;
  except
  on E: EDatabaseError do
    begin
      MessageDlg('Error', 'A database error has occurred. Technical error message: ' +
        E.Message, mtError, [mbOK], 0);
      Edit1.Text := '';
    end;
  end;
*)
end;

procedure TForm1.CheckBox1Click(Sender: TObject);
begin
  if checkbox1.Checked then memo_sql.Enabled:=false else memo_sql.Enabled:=true;
  if checkbox1.Checked then begin
  memo_sql.Lines.Clear;
  memo_sql.lines.Add('select * from ' + listbox1.Items[listbox1.ItemIndex]);
  end;
end;

procedure TForm1.CheckBox2Change(Sender: TObject);
begin
  (*
  if checkbox2.Checked then begin
     Button2Click(Sender);
     Memo_sql.Show;
  end else begin
       Memo_sql.Hide;
  end;
  *)
end;

procedure TForm1.CSVExporter1ExportRow(Sender: TObject; var AllowExport: Boolean
  );
begin
  progressbar1.StepIt;
end;

procedure TForm1.dbsrvAfterInsert(DataSet: TDataSet);
begin
//  dbsrv.FieldByName('port').AsInteger:=0;
//  dbedit1.SetFocus;
end;

procedure TForm1.dbsrvAfterScroll(DataSet: TDataSet);
begin
  (*
  zconnection1.Disconnect;
  zconnection1.HostName:=dbsrv.FieldByName('host').asstring;
  zconnection1.User:=dbsrv.FieldByName('user').asstring;
  zconnection1.Password:=dbsrv.FieldByName('pass').asstring;
  zconnection1.Database:=dbsrv.FieldByName('database').asstring;
  zconnection1.Port:=dbsrv.FieldByName('port').AsInteger;
  zconnection1.Protocol:=dbsrv.FieldByName('dbtype').AsString;
 // if dbsrv.FieldByName('database').asstring='postgres' then zconnection1.Protocol:='postgresql-8';
 *)
end;

procedure TForm1.dbsrvBeforeInsert(DataSet: TDataSet);
begin

end;

procedure TForm1.Edit1Change(Sender: TObject);
begin
  CheckBox2Change(Sender);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  memo_sql.lines.Clear;
  memo_sql.Enabled:=false;
  tabsheet2.Show;
//  dbsrv.Close;
//  dbsrv.FileName:=extractfilepath(application.exename)+'servers.csv';
//  dbsrv.Open;

RadioGroup1ChangeBounds(Sender);

end;

procedure TForm1.FPDBFExport1ExportRow(Sender: TObject; var AllowExport: Boolean
  );
begin

end;

procedure TForm1.ListBox1Click(Sender: TObject);
begin
  if listbox1.ItemIndex > -1 then begin
  memo_sql.Lines.Clear;
  memo_sql.lines.Add('select * from ' + listbox1.Items[listbox1.ItemIndex]);
  checkbox1.Checked:=true;
  end;

end;

procedure TForm1.MenuItem3Click(Sender: TObject);
begin
  form2.showmodal;
end;

procedure TForm1.MenuItem4Click(Sender: TObject);
begin
  application.Terminate;
end;

procedure TForm1.PQConnection1Log(Sender: TSQLConnection;
  EventType: TDBEventType; const Msg: String);
begin
  showmessage(msg);
end;

procedure TForm1.RadioGroup1ChangeBounds(Sender: TObject);
begin
//  SHOWMESSAGE(inttostr(radiogroup1.ItemIndex));
  odbcconnection1.Connected:=false;
  listbox1.Items.Clear;

  if radiogroup1.ItemIndex = 0 then
     odbcconnection1.Driver:='Microsoft Access Driver (*.mdb, *.accdb)';
   if radiogroup1.ItemIndex = 1 then
     odbcconnection1.Driver:='Microsoft Access Driver (*.mdb)';
end;

procedure TForm1.SQLQuery1AfterPost(DataSet: TDataSet);
begin

end;

procedure TForm1.TabSheet2Show(Sender: TObject);
begin
  BitBtn1Click(Sender);
end;

procedure TForm1.TabSheet3Show(Sender: TObject);
begin
  if listbox1.ItemIndex < 0 then begin
  tabsheet2.Show;
  MessageDlg('Errore', 'Non hai specificato nessuna tabella da esportare.', mtError, [mbOK], 0);
  exit;
  end;
(*
  if checkbox1.Checked then begin
  memo_sql.Lines.Clear;
  memo_sql.lines.Add('select * from ' + listbox1.Items[listbox1.ItemIndex]);
  end;
*)
  (*
  else begin
  memo_sql.Lines.Clear;
  sqlquery1.SQL.Text:=memo_sql.Lines.Text
  end;
*)
  Button2Click(Sender);
end;

procedure TForm1.TabSheet4ContextPopup(Sender: TObject; MousePos: TPoint;
  var Handled: Boolean);
begin

end;

procedure TForm1.TabSheet4Show(Sender: TObject);
begin
  //TabSheet3Show(Sender);
  //BitBtn5Click(Sender);
  if listbox1.ItemIndex < 0 then begin
  tabsheet2.Show;
  MessageDlg('Errore', 'Non hai specificato nessuna tabella da esportare.', mtError, [mbOK], 0);
  exit;
  end;
end;

procedure TForm1.ZQuery1AfterPost(DataSet: TDataSet);
begin

end;

end.

