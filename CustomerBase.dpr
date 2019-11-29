program CustomerBase;

uses
  Vcl.Forms,
  uHomeForm in 'uHomeForm.pas' {FormHome},
  uClientViewForm in 'uClientViewForm.pas' {FormClientView},
  uDataForm in 'uDataForm.pas' {dmMainMod: TDataModule},
  uClientEditForm in 'uClientEditForm.pas' {FormClientEdit},
  uEmailForm in 'uEmailForm.pas' {FormEmail};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormHome, FormHome);
  Application.CreateForm(TdmMainMod, dmMainMod);
  Application.CreateForm(TFormEmail, FormEmail);
  Application.Run;
end.
