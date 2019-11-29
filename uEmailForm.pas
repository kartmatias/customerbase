unit uEmailForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  FireDAC.Stan.Intf, TypInfo,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdMessageClient, IdSMTP, IdMessage,
  IdAttachment, IdMessageParts, IdEMailAddress, IdAttachmentFile,
  IdIOHandler, IdIOHandlerSocket, IdIOHandlerStack, IdSSL, IdSSLOpenSSL,
  IdExplicitTLSClientServerBase, IdSMTPBase;

type

  TConfigEmail = record
    Host : String;
    Port : Integer;
    FromAddress : String;
    Password : String;
    UserName : String;
    Autentica: Boolean;
    ModoSeguro: Boolean;
    VersaoSSL: String; //sslvSSLv2, sslvSSLv23, sslvSSLv3, sslvTLSv1,sslvTLSv1_1,sslvTLSv1_2
    ModoSSL: String; //sslmUnassigned, sslmClient, sslmServer, sslmBoth;
  end;


  TFormEmail = class(TForm)
    PnlTopMenu: TPanel;
    Label1: TLabel;
    IdSMTP1: TIdSMTP;
  private
    { Private declarations }
    FConfigEmail : TConfigEmail;
    procedure EnviaEmailcomAnexo;
  public
    { Public declarations }
  end;

var
  FormEmail: TFormEmail;
  Procedure  EnviarEmail;

implementation

{$R *.dfm}

uses uDataForm;

{ TForm1 }

procedure EnviarEmail;
begin
  Application.CreateForm(TFormEmail, FormEmail);
  FormEmail.Show;
  try
    FormEmail.EnviaEmailcomAnexo;
  finally
    FormEmail.Hide;
    FormEmail.Close;
  end;
end;

procedure TFormEmail.EnviaEmailcomAnexo;
var
  WFileName : String;
  IdSMTP : TIdSMTP;
  IdMessage : TIdMessage;
  IdSSLIOHandlerSocketOpenSSL1 : TIdSSLIOHandlerSocketOpenSSL;
  EmailCliente,
  EmailCopia,
  AssuntoEmail,
  TextoMsg : String;
begin

  try


    FConfigEmail.Host          := 'smtp.gmail.com';
    FConfigEmail.Port          := 587;

    FConfigEmail.FromAddress   := 'contadogmail@gmail.com';
    FConfigEmail.UserName      := 'contadogmail@gmail.com';
    FConfigEmail.Password      := 'INFORME_A_SENHA';

    FConfigEmail.Autentica  := True;
    FConfigEmail.ModoSeguro := True;
    FConfigEmail.VersaoSSL  := 'sslvTLSv1';
    FConfigEmail.ModoSSL    := 'sslmUnassigned';


    EmailCliente := dmMainMod.TbCliente.FieldByName('Email').AsString;
    AssuntoEmail := 'Cadastro de Cliente: '+dmMainMod.TbCliente.FieldByName('Id').AsString;
    TextoMsg     := 'Segue dados XML';


    if not dmMainMod.TbCliente.Eof then
      begin

        WFileName := 'cadastro_cliente_'+dmMainMod.TbCliente.FieldByName('Id').AsString+'.xml';
        dmMainMod.TbCliente.SaveToFile(WFileName,sfXML);


        IdSMTP := TIdSMTP.Create (Nil);
        IdMessage := TIdMessage.Create (Nil);
        IdSSLIOHandlerSocketOpenSSL1 := TIdSSLIOHandlerSocketOpenSSL.Create;
        try
          { Informações básicas para uma conexão }
          IdSMTP.Host := FConfigEmail.Host;
          IdSMTP.Port := FConfigEmail.Port;

          { Nome e endereço de quem está enviando }
          IdMessage.From.Address := FConfigEmail.FromAddress;
          IdMessage.From.Name := FConfigEmail.UserName;

          { Destinatários }
          IdMessage.Recipients.EMailAddresses := EmailCliente;

          { Destinatários em cópia }
          IdMessage.CCList.EMailAddresses := EmailCopia;

          { Destinatários em cópia oculta }
          IdMessage.BccList.EMailAddresses := '';

          { Endereço para resposta, isto é, se um destinatário der um "reply", a resposta será enviada para este endereço }
          IdMessage.ReplyTo.EMailAddresses := FConfigEmail.FromAddress;

          { Assunto da mensagem }
          IdMessage.Subject := AssuntoEmail;

          { Corpo da mensagem, isto é, o texto dela }
          IdMessage.Body.Text := TextoMsg;

          if WFileName <> '' then
            TIdAttachmentFile.Create(IdMessage.MessageParts, TFileName(WFileName));

          IdSMTP.Username  := FConfigEmail.UserName;
          IdSMTP.Password  := FConfigEmail.Password;

          if (FConfigEmail.Autentica) then
            IdSMTP.AuthType := satDefault
          else
            IdSMTP.AuthType := satNone;

          if (FConfigEmail.ModoSeguro) then
            begin
              if FConfigEmail.VersaoSSL <> '' then
                IdSSLIOHandlerSocketOpenSSL1.SSLOptions.Method :=  TIdSSLVersion(GetEnumValue(TypeInfo(TIdSSLVersion), FConfigEmail.VersaoSSL ))
              else
                IdSSLIOHandlerSocketOpenSSL1.SSLOptions.Method := sslvSSLv23;

              if FConfigEmail.ModoSSL <> '' then
                IdSSLIOHandlerSocketOpenSSL1.SSLOptions.Mode := TIdSSLMode(GetEnumValue(TypeInfo(TIdSSLMode), FConfigEmail.ModoSSL ))
              else
                IdSSLIOHandlerSocketOpenSSL1.SSLOptions.Mode := sslmClient;

              IdSMTP.IOHandler := IdSSLIOHandlerSocketOpenSSL1;
              IdSMTP.UseTLS    := utUseExplicitTLS;//utUseImplicitTLS; //utUseRequireTLS;
              IdSMTP.AuthType  := satDefault;
            end
          else
            IdSMTP.UseTLS := utNoTLSSupport;

          { Tenta conectar no Host, aguardando no máximo um minuto }

          IdSMTP.ConnectTimeout := 6000;
          IdSMTP.Connect;
          IdSMTP.Authenticate;

          { Envia o e-mail }
          IdSMTP.Send (IdMessage);

          { Desconecta }
          IdSMTP.Disconnect ();


        finally
          if IdSMTP.Connected then
            IdSMTP.Disconnect();
          FreeAndNil(IdMessage);
          FreeAndNil(IdSSLIOHandlerSocketOpenSSL1);
          FreeAndNil(IdSMTP);
        end;
      end;
  finally

  end;
end;


end.
