object FormClientEdit: TFormClientEdit
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Edi'#231#227'o Cliente'
  ClientHeight = 724
  ClientWidth = 649
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 19
  object DBText1: TDBText
    Left = 17
    Top = 131
    Width = 65
    Height = 17
    DataField = 'ID'
    DataSource = FormClientView.dtsCliente
  end
  object Label1: TLabel
    Left = 17
    Top = 108
    Width = 17
    Height = 19
    Caption = 'ID'
  end
  object Label2: TLabel
    Left = 17
    Top = 158
    Width = 42
    Height = 19
    Caption = 'Nome'
  end
  object Label3: TLabel
    Left = 17
    Top = 221
    Width = 75
    Height = 19
    Caption = 'Identidade'
  end
  object Label4: TLabel
    Left = 330
    Top = 221
    Width = 27
    Height = 19
    Caption = 'CPF'
  end
  object Label5: TLabel
    Left = 17
    Top = 281
    Width = 61
    Height = 19
    Caption = 'Telefone'
  end
  object Label6: TLabel
    Left = 330
    Top = 281
    Width = 39
    Height = 19
    Caption = 'Email'
  end
  object Label7: TLabel
    Left = 17
    Top = 400
    Width = 65
    Height = 19
    Caption = 'Endere'#231'o'
  end
  object Label8: TLabel
    Left = 17
    Top = 461
    Width = 82
    Height = 19
    Caption = 'Logradouro'
  end
  object Label9: TLabel
    Left = 17
    Top = 343
    Width = 28
    Height = 19
    Caption = 'CEP'
  end
  object Label10: TLabel
    Left = 17
    Top = 580
    Width = 42
    Height = 19
    Caption = 'Bairro'
  end
  object Label11: TLabel
    Left = 17
    Top = 644
    Width = 47
    Height = 19
    Caption = 'Estado'
  end
  object Label12: TLabel
    Left = 330
    Top = 580
    Width = 48
    Height = 19
    Caption = 'Cidade'
  end
  object Label13: TLabel
    Left = 330
    Top = 644
    Width = 28
    Height = 19
    Caption = 'Pa'#237's'
  end
  object Label14: TLabel
    Left = 449
    Top = 461
    Width = 57
    Height = 19
    Caption = 'N'#250'mero'
  end
  object Label15: TLabel
    Left = 17
    Top = 519
    Width = 99
    Height = 19
    Caption = 'Complemento'
  end
  object PnlTopMenu: TPanel
    Left = 0
    Top = 0
    Width = 649
    Height = 102
    Align = alTop
    BevelOuter = bvLowered
    Color = clGrayText
    ParentBackground = False
    TabOrder = 0
    ExplicitLeft = -325
    ExplicitWidth = 964
    DesignSize = (
      649
      102)
    object Button4: TButton
      Left = 482
      Top = 5
      Width = 160
      Height = 90
      Anchors = [akTop, akRight]
      Caption = 'Fechar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      WordWrap = True
      OnClick = Button4Click
      ExplicitLeft = 797
    end
    object BtnSalvar: TButton
      Left = 8
      Top = 6
      Width = 160
      Height = 90
      Caption = 'Salvar'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      WordWrap = True
      OnClick = BtnSalvarClick
    end
  end
  object DBEdit1: TDBEdit
    Left = 17
    Top = 183
    Width = 593
    Height = 27
    DataField = 'Nome'
    DataSource = FormClientView.dtsCliente
    TabOrder = 1
  end
  object DBEdit2: TDBEdit
    Left = 17
    Top = 246
    Width = 288
    Height = 27
    DataField = 'Identidade'
    DataSource = FormClientView.dtsCliente
    TabOrder = 2
  end
  object DBEdit3: TDBEdit
    Left = 330
    Top = 246
    Width = 280
    Height = 27
    DataField = 'Cpf'
    DataSource = FormClientView.dtsCliente
    TabOrder = 3
  end
  object DBEdit4: TDBEdit
    Left = 17
    Top = 306
    Width = 288
    Height = 27
    DataField = 'Telefone'
    DataSource = FormClientView.dtsCliente
    TabOrder = 4
  end
  object DBEdit5: TDBEdit
    Left = 330
    Top = 306
    Width = 280
    Height = 27
    CharCase = ecLowerCase
    DataField = 'Email'
    DataSource = FormClientView.dtsCliente
    TabOrder = 5
    OnExit = DBEdit5Exit
  end
  object DBEdit6: TDBEdit
    Left = 17
    Top = 425
    Width = 593
    Height = 27
    DataField = 'Endereco'
    DataSource = FormClientView.dtsCliente
    TabOrder = 7
  end
  object DBEdit7: TDBEdit
    Left = 17
    Top = 486
    Width = 416
    Height = 27
    DataField = 'Logradouro'
    DataSource = FormClientView.dtsCliente
    TabOrder = 8
  end
  object DBEdit8: TDBEdit
    Left = 17
    Top = 367
    Width = 288
    Height = 27
    DataField = 'Cep'
    DataSource = FormClientView.dtsCliente
    TabOrder = 6
    OnExit = DBEdit8Exit
  end
  object DBEdit9: TDBEdit
    Left = 17
    Top = 605
    Width = 288
    Height = 27
    DataField = 'Bairro'
    DataSource = FormClientView.dtsCliente
    TabOrder = 11
  end
  object DBEdit10: TDBEdit
    Left = 17
    Top = 669
    Width = 288
    Height = 27
    DataField = 'Estado'
    DataSource = FormClientView.dtsCliente
    TabOrder = 13
  end
  object DBEdit11: TDBEdit
    Left = 330
    Top = 605
    Width = 280
    Height = 27
    DataField = 'Cidade'
    DataSource = FormClientView.dtsCliente
    TabOrder = 12
  end
  object DBEdit12: TDBEdit
    Left = 330
    Top = 669
    Width = 280
    Height = 27
    DataField = 'Pais'
    DataSource = FormClientView.dtsCliente
    TabOrder = 14
  end
  object DBEdit13: TDBEdit
    Left = 449
    Top = 486
    Width = 161
    Height = 27
    DataField = 'Numero'
    DataSource = FormClientView.dtsCliente
    TabOrder = 9
  end
  object DBEdit14: TDBEdit
    Left = 17
    Top = 544
    Width = 593
    Height = 27
    DataField = 'Complemento'
    DataSource = FormClientView.dtsCliente
    TabOrder = 10
  end
  object RESTClientVia: TRESTClient
    Accept = 'application/json, text/plain; q=0.9, text/html;q=0.8,'
    AcceptCharset = 'UTF-8, *;q=0.8'
    BaseURL = 'https://viacep.com.br'
    Params = <>
    HandleRedirects = True
    RaiseExceptionOn500 = False
    Left = 368
    Top = 120
  end
  object RESTRequestCEP: TRESTRequest
    Client = RESTClientVia
    Params = <>
    Response = RESTResponseCEP
    SynchronizedEvents = False
    Left = 456
    Top = 120
  end
  object RESTResponseCEP: TRESTResponse
    ContentType = 'text/html'
    Left = 560
    Top = 120
  end
end
