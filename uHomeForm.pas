unit uHomeForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  dxGDIPlusClasses;

type
  TFormHome = class(TForm)
    PnlTopMenu: TPanel;
    ImgLogo: TImage;
    BtnCadastro: TButton;
    Button4: TButton;
    procedure BtnCadastroClick(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormHome: TFormHome;

implementation

{$R *.dfm}

uses uClientViewForm;

procedure TFormHome.BtnCadastroClick(Sender: TObject);
begin
  Application.CreateForm(TFormClientView, FormClientView);
  FormClientView.ShowModal;
end;

procedure TFormHome.Button4Click(Sender: TObject);
begin
 Close;
end;

procedure TFormHome.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if MessageDlg('Deseja sair da aplicação?',mtConfirmation,[mbYes, mbNo],0) = mrYes then
    CanClose := True
  else
    CanClose := False;
end;

end.
