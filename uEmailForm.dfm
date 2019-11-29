object FormEmail: TFormEmail
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'FormEmail'
  ClientHeight = 100
  ClientWidth = 638
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object PnlTopMenu: TPanel
    Left = 0
    Top = 0
    Width = 638
    Height = 102
    Align = alTop
    BevelOuter = bvLowered
    Color = clGrayText
    ParentBackground = False
    TabOrder = 0
    object Label1: TLabel
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 630
      Height = 94
      Align = alClient
      Alignment = taCenter
      Caption = 'Enviando email...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -47
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitWidth = 405
      ExplicitHeight = 57
    end
  end
  object IdSMTP1: TIdSMTP
    SASLMechanisms = <>
    Left = 48
    Top = 32
  end
end
