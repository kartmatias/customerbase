unit uClientViewForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Printers;

type
  TFormClientView = class(TForm)
    PnlTopMenu: TPanel;
    BtnCadastro: TButton;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    dtsCliente: TDataSource;
    DBGridCliente: TDBGrid;
    Button4: TButton;
    procedure FormShow(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BtnCadastroClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
    procedure CreateGridColumns;
  public
    { Public declarations }
  end;

var
  FormClientView: TFormClientView;

implementation

{$R *.dfm}

uses uDataForm, uClientEditForm;

procedure TFormClientView.BtnCadastroClick(Sender: TObject);
begin
  Application.CreateForm(TFormClientEdit, FormClientEdit);
  FormClientEdit.FStatus := 'I';
  FormClientEdit.ShowModal;
end;

procedure TFormClientView.Button1Click(Sender: TObject);
begin
  Application.CreateForm(TFormClientEdit, FormClientEdit);
  FormClientEdit.FStatus := 'A';
  FormClientEdit.ShowModal;
end;

procedure TFormClientView.Button2Click(Sender: TObject);
begin
  Application.CreateForm(TFormClientEdit, FormClientEdit);
  FormClientEdit.FStatus := 'X';
  FormClientEdit.ShowModal;
end;

procedure TFormClientView.Button3Click(Sender: TObject);
begin
  Printer.BeginDoc;
  with Printer do
  try
    DBGridCliente.PaintTo(Canvas, 0, 0);
  finally
    Printer.EndDoc;
  end;
end;

procedure TFormClientView.Button4Click(Sender: TObject);
begin
  Close;
end;

procedure TFormClientView.CreateGridColumns;
begin

  with DBGridCliente.Columns.Add do
    begin
       FieldName := 'ID';
       Width := 60;
       Title.Caption := 'Id';
       Title.Alignment := taCenter;
    end;

  with DBGridCliente.Columns.Add do
    begin
       FieldName := 'Nome';
       Width := 300;
       Title.Caption := 'Nome';
    end;

  with DBGridCliente.Columns.Add do
    begin
       FieldName := 'Identidade';
       Width := 160;
       Title.Caption := 'Identidade';
    end;
  with DBGridCliente.Columns.Add do
    begin
       FieldName := 'Cpf';
       Width := 160;
       Title.Caption := 'Cpf';
    end;
  with DBGridCliente.Columns.Add do
    begin
       FieldName := 'Telefone';
       Width := 160;
       Title.Caption := 'Telefone';
    end;
  with DBGridCliente.Columns.Add do
    begin
       FieldName := 'Email';
       Width := 200;
       Title.Caption := 'Email';
    end;
  with DBGridCliente.Columns.Add do
    begin
       FieldName := 'Cep';
       Width := 160;
       Title.Caption := 'Cep';
    end;

end;

procedure TFormClientView.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFormClientView.FormCreate(Sender: TObject);
begin
  CreateGridColumns;
end;

procedure TFormClientView.FormShow(Sender: TObject);
begin
  dmMainMod.TbCliente.Open;
end;

end.
