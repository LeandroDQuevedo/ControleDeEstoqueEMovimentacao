object Form3: TForm3
  Left = 409
  Top = 187
  Caption = 'Form3'
  ClientHeight = 545
  ClientWidth = 1094
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesigned
  OnCreate = FormCreate
  TextHeight = 15
  object pnBotoes: TPanel
    Left = 909
    Top = 0
    Width = 185
    Height = 545
    Align = alRight
    TabOrder = 0
    object btnMovimentacao: TButton
      Left = 8
      Top = 40
      Width = 169
      Height = 57
      Caption = 'Informar Movimentacao'
      TabOrder = 0
      OnClick = btnMovimentacaoClick
    end
    object btnDeletarMov: TButton
      Left = 24
      Top = 120
      Width = 137
      Height = 33
      Caption = 'Deletar'
      TabOrder = 1
      OnClick = btnDeletarMovClick
    end
    object btnRelatorio: TButton
      Left = 24
      Top = 167
      Width = 137
      Height = 33
      Caption = 'Relat'#243'rio'
      TabOrder = 2
    end
  end
  object grListMov: TDBGrid
    Left = 0
    Top = 0
    Width = 909
    Height = 545
    Align = alClient
    DataSource = dmPrincipal.dsListaMov
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'PRODUTO'
        Width = 195
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALOR'
        Width = 95
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QUANTIDADE'
        Width = 88
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TOTAL'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRICAO'
        Visible = True
      end>
  end
end
