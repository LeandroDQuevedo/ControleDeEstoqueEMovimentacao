object Form5: TForm5
  Left = 735
  Top = 312
  Caption = 'Form5'
  ClientHeight = 507
  ClientWidth = 815
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesigned
  OnShow = FormShow
  TextHeight = 15
  object pnTipoinfo: TPanel
    Left = 0
    Top = 0
    Width = 815
    Height = 49
    Align = alTop
    TabOrder = 3
    ExplicitWidth = 482
    object cbxTipo: TComboBox
      Left = 16
      Top = 14
      Width = 145
      Height = 23
      TabOrder = 0
      OnChange = FormShow
      Items.Strings = (
        'Unidade de Medida'
        'Categoria'
        'Marca'
        'Fornecedor')
    end
  end
  object pnBtnFinal: TPanel
    Left = 0
    Top = 466
    Width = 815
    Height = 41
    Align = alBottom
    TabOrder = 1
    ExplicitLeft = 272
    ExplicitTop = 200
    ExplicitWidth = 185
    object BtnSalvar: TButton
      Left = 528
      Top = 6
      Width = 89
      Height = 25
      Caption = 'Salvar'
      Default = True
      TabOrder = 0
      OnClick = BtnSalvarClick
    end
    object BtnCancelar: TButton
      Left = 709
      Top = 6
      Width = 89
      Height = 25
      Cancel = True
      Caption = 'Cancelar'
      TabOrder = 1
      OnClick = BtnCancelarClick
    end
    object btnDeletar: TButton
      Left = 16
      Top = 6
      Width = 89
      Height = 25
      Caption = 'Deletar'
      Enabled = False
      TabOrder = 2
      OnClick = btnDeletarClick
    end
  end
  object pnCampos: TPanel
    Left = 504
    Top = 49
    Width = 311
    Height = 417
    Align = alRight
    TabOrder = 0
    object lbCnpj: TLabel
      Left = 157
      Top = 91
      Width = 30
      Height = 15
      Caption = 'CNPJ:'
      Visible = False
    end
    object lbDescricao: TLabel
      Left = 85
      Top = 45
      Width = 54
      Height = 15
      Caption = 'Descri'#231#227'o:'
      Visible = False
    end
    object lbEndereco: TLabel
      Left = 30
      Top = 91
      Width = 52
      Height = 15
      Caption = 'Endere'#231'o:'
      Visible = False
    end
    object lbNome: TLabel
      Left = 85
      Top = 45
      Width = 41
      Height = 15
      Caption = 'Nome:'
    end
    object lbSigla: TLabel
      Left = 85
      Top = 91
      Width = 28
      Height = 15
      Caption = 'Sigla:'
      Visible = False
    end
    object edtDescricao: TEdit
      Left = 85
      Top = 64
      Width = 121
      Height = 23
      TabOrder = 1
      TextHint = 'Descri'#231#227'o...'
      Visible = False
    end
    object edtEndereco: TEdit
      Left = 30
      Top = 112
      Width = 121
      Height = 23
      TabOrder = 3
      TextHint = 'Endere'#231'o...'
      Visible = False
    end
    object edtNome: TEdit
      Left = 85
      Top = 64
      Width = 121
      Height = 23
      TabOrder = 0
      TextHint = 'Nome...'
    end
    object edtSigla: TEdit
      Left = 85
      Top = 112
      Width = 121
      Height = 23
      MaxLength = 4
      TabOrder = 2
      TextHint = 'Sigla...'
      Visible = False
    end
    object mktCnpj: TMaskEdit
      Left = 157
      Top = 112
      Width = 121
      Height = 23
      EditMask = '!99.999.999/9999-99;1;_'
      MaxLength = 18
      TabOrder = 4
      Text = '  .   .   /    -  '
      Visible = False
    end
  end
  object grListaAdd: TDBGrid
    Left = 0
    Top = 49
    Width = 504
    Height = 417
    Align = alClient
    DataSource = dmPrincipal.dsUnidMed
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnCellClick = grListaAddCellClick
    OnKeyUp = grListaAddKeyUp
  end
end
