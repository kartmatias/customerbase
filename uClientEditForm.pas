unit uClientEditForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Mask,
  Vcl.DBCtrls, Data.DB, IPPeerClient, Data.Bind.Components,
  Data.Bind.ObjectScope, REST.Client, System.JSON;

type
  TFormClientEdit = class(TForm)
    PnlTopMenu: TPanel;
    btnFechar: TButton;
    DBText1: TDBText;
    DBEdit1: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    Label8: TLabel;
    DBEdit7: TDBEdit;
    Label9: TLabel;
    DBEdit8: TDBEdit;
    Label10: TLabel;
    DBEdit9: TDBEdit;
    Label11: TLabel;
    DBEdit10: TDBEdit;
    Label12: TLabel;
    DBEdit11: TDBEdit;
    Label13: TLabel;
    DBEdit12: TDBEdit;
    Label14: TLabel;
    DBEdit13: TDBEdit;
    Label15: TLabel;
    DBEdit14: TDBEdit;
    BtnSalvar: TButton;
    RESTClientVia: TRESTClient;
    RESTRequestCEP: TRESTRequest;
    RESTResponseCEP: TRESTResponse;
    procedure btnFecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure DBEdit8Exit(Sender: TObject);
    procedure DBEdit5Exit(Sender: TObject);
    procedure DBEdit12Exit(Sender: TObject);
  private
    { Private declarations }
    Procedure BuscaCep(pCepCode: String);
    function EmailValido(const Value: string): Boolean;
  public
    { Public declarations }
    FStatus : String;
  end;

var
  FormClientEdit: TFormClientEdit;

implementation

{$R *.dfm}

uses uDataForm, uClientViewForm, uEmailForm;

procedure TFormClientEdit.BtnSalvarClick(Sender: TObject);
begin
  if FStatus = 'X' then
    dmMainMod.TbCliente.Delete
  else if dmMainMod.TbCliente.State in [dsEdit, dsInsert] then
    dmMainMod.TbCliente.Post;
  BtnSalvar.Enabled := False;

  if FStatus = 'I' then
    begin
      EnviarEmail;
    end;
end;

procedure TFormClientEdit.BuscaCep(pCepCode: String);
 const
  //https://viacep.com.br/ws/01001000/json/
  cepurlbas = 'https://viacep.com.br';
  cepurlres = 'ws';
  cepfmt = 'json';
 var
  jsonRet : TJSONValue;
  s : string;
begin
  RESTClientVia.Accept  := 'application/json, text/plain; q=0.9, text/html;q=0.8,';
  RESTClientVia.AcceptCharset := 'UTF-8, *;q=0.8';
  RESTClientVia.BaseURL := cepurlbas;
  RESTRequestCEP.Resource := cepurlres+'/'+pCepCode+'/'+cepfmt+'/';
  //RESTRequestCEP.Params[0].Value := pCepCode;
  //RESTRequestCEP.Params[1].Value := cepfmt;
  RESTRequestCEP.Execute;
  jsonRet := RESTResponseCEP.JSONValue;

  if not( jsonRet.TryGetValue( 'logradouro', s )) then
    ShowMessage( 'Logradouro/CEP não localizado: ('+s+')' )
  else if dmMainMod.TbCliente.State in [dsEdit, dsInsert] then
    begin
       try
         dmMainMod.TbCliente.FieldByName('Logradouro').AsString := jsonRet.GetValue<String>('logradouro');
         dmMainMod.TbCliente.FieldByName('Complemento').AsString := jsonRet.GetValue<String>('complemento');
         dmMainMod.TbCliente.FieldByName('Bairro').AsString := jsonRet.GetValue<String>('bairro');
         dmMainMod.TbCliente.FieldByName('Cidade').AsString := jsonRet.GetValue<String>('localidade');
         dmMainMod.TbCliente.FieldByName('Estado').AsString := jsonRet.GetValue<String>('uf');
         dmMainMod.TbCliente.FieldByName('Pais').AsString := 'Brasil';
         dmMainMod.TbCliente.FieldByName('Endereco').AsString := dmMainMod.TbCliente.FieldByName('Logradouro').AsString + ', '+
                                                                 dmMainMod.TbCliente.FieldByName('Numero').AsString + ', '+
                                                                 dmMainMod.TbCliente.FieldByName('Bairro').AsString + ' '+
                                                                 dmMainMod.TbCliente.FieldByName('Cidade').AsString + ' - '+
                                                                 dmMainMod.TbCliente.FieldByName('Estado').AsString;
       except
         dmMainMod.TbCliente.FieldByName('Logradouro').AsString := '';
         dmMainMod.TbCliente.FieldByName('Complemento').AsString :=  '';
         dmMainMod.TbCliente.FieldByName('Bairro').AsString :=  '';
         dmMainMod.TbCliente.FieldByName('Cidade').AsString :=  '';
         dmMainMod.TbCliente.FieldByName('Estado').AsString :=  '';
         dmMainMod.TbCliente.FieldByName('Pais').AsString :=  '';
       end;
    end;

end;

procedure TFormClientEdit.btnFecharClick(Sender: TObject);
begin
  if dmMainMod.TbCliente.State in [dsEdit, dsInsert] then
    dmMainMod.TbCliente.Cancel;
  Close;
end;

procedure TFormClientEdit.DBEdit12Exit(Sender: TObject);
begin
  if btnSalvar.Enabled then
    btnSalvar.SetFocus
  else
    btnFechar.SetFocus;
end;

procedure TFormClientEdit.DBEdit5Exit(Sender: TObject);
begin
  if not EmailValido(dmMainMod.TbCliente.FieldByName('Email').AsString) then
    begin
      raise Exception.Create('Informe um email válido');
    end;
end;

procedure TFormClientEdit.DBEdit8Exit(Sender: TObject);
begin
  if dmMainMod.TbCliente.FieldByName('Cep').AsString<>'' then
    begin
      BuscaCep(dmMainMod.TbCliente.FieldByName('Cep').AsString);
    end;
end;

procedure TFormClientEdit.FormShow(Sender: TObject);
begin
  if FStatus = 'I' then
    begin
      BtnSalvar.Caption := 'Incluir';
      BtnSalvar.Enabled := True;
      dmMainMod.TbCliente.Append;
    end
  else if FStatus = 'A' then
    begin
      BtnSalvar.Caption := 'Alterar';
      BtnSalvar.Enabled := True;
      dmMainMod.TbCliente.Edit;
    end
  else if FStatus = 'X' then
    begin
      BtnSalvar.Caption := 'Excluir';
      BtnSalvar.Enabled := True;
      //dmMainMod.TbCliente.Edit;
    end;
  DBEdit1.SetFocus;
end;

Function TFormClientEdit.EmailValido(const Value: string): Boolean;
  function CheckAllowed(const s: string): Boolean;
  var
    i: Integer;
  begin
    Result := False;
    for i := 1 to Length(s) do
      if not(s[i] in ['a' .. 'z', 'A' .. 'Z', '0' .. '9', '_', '-', '.']) then
        Exit;
    Result := true;
  end;
var
  i: Integer;
  NamePart, ServerPart: string;
begin
  Result := False;
  i := Pos('@', Value);
  if i = 0 then
    Exit;
  NamePart := Copy(Value, 1, i - 1);
  ServerPart := Copy(Value, i + 1, Length(Value));
  if (Length(NamePart) = 0) or ((Length(ServerPart) < 5)) then
    Exit;
  i := Pos('.', ServerPart);
  if (i = 0) or (i > (Length(ServerPart) - 2)) then
    Exit;
  Result := CheckAllowed(NamePart) and CheckAllowed(ServerPart);
end;

end.
