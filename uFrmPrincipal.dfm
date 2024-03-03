object FrmPrincipal: TFrmPrincipal
  Left = 0
  Top = 0
  Caption = 'FrmPrincipal'
  ClientHeight = 475
  ClientWidth = 634
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  DesignSize = (
    634
    475)
  TextHeight = 15
  object Label19: TLabel
    Left = 8
    Top = 451
    Width = 218
    Height = 15
    Caption = 'Doa'#231#227'o por PIX: delmar.apui@gmail.com'
  end
  object Label18: TLabel
    Left = 589
    Top = 190
    Width = 37
    Height = 15
    Caption = 'Limpar'
    OnClick = Label18Click
  end
  object Label17: TLabel
    Left = 8
    Top = 190
    Width = 50
    Height = 15
    Caption = 'Resposta:'
  end
  object Label1: TLabel
    Left = 8
    Top = 60
    Width = 51
    Height = 15
    Caption = 'Pergunta:'
  end
  object Label2: TLabel
    Left = 8
    Top = 8
    Width = 34
    Height = 15
    Caption = 'Token:'
  end
  object mRequest: TMemo
    Left = 8
    Top = 81
    Width = 618
    Height = 103
    TabOrder = 0
  end
  object mResponse: TMemo
    Left = 8
    Top = 211
    Width = 618
    Height = 234
    Cursor = crHandPoint
    TabOrder = 1
  end
  object btnEnviar: TButton
    Left = 551
    Top = 28
    Width = 75
    Height = 25
    Caption = 'Enviar'
    TabOrder = 2
    OnClick = btnEnviarClick
  end
  object edtToken: TEdit
    Left = 8
    Top = 29
    Width = 537
    Height = 25
    TabOrder = 3
  end
  object LinkLabel1: TLinkLabel
    Left = 441
    Top = 451
    Width = 185
    Height = 16
    Cursor = crHandPoint
    Alignment = taRightJustify
    Anchors = [akLeft, akTop, akRight, akBottom]
    Caption = 
      '<a href="https://github.com/delmardelima/">Desenvolvido por: Del' +
      'mar de Lima</a>'
    TabOrder = 4
    ExplicitHeight = 19
  end
end
