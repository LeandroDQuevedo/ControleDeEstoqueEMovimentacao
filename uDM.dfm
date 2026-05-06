object dmPrincipal: TdmPrincipal
  Height = 480
  Width = 640
  object ConexaoBanco: TFDConnection
    Params.Strings = (
      'DriverID=FB'
      'User_Name=sysdba'
      'Password=masterkey')
    BeforeConnect = ConexaoBancoBeforeConnect
    Left = 80
    Top = 48
  end
  object qrCategoria: TFDQuery
    Connection = ConexaoBanco
    SQL.Strings = (
      'select * from Categoria')
    Left = 24
    Top = 424
  end
  object qrMarca: TFDQuery
    Connection = ConexaoBanco
    SQL.Strings = (
      'select * from Marca'
      '')
    Left = 88
    Top = 424
  end
  object qrFornecedor: TFDQuery
    Connection = ConexaoBanco
    SQL.Strings = (
      'select * from Fornecedor')
    Left = 160
    Top = 424
  end
  object qrUnidMed: TFDQuery
    Connection = ConexaoBanco
    SQL.Strings = (
      'select * from Unidade_Medida')
    Left = 240
    Top = 424
  end
  object dsCategoria: TDataSource
    DataSet = qrCategoria
    Left = 24
    Top = 368
  end
  object dsMarca: TDataSource
    DataSet = qrMarca
    Left = 88
    Top = 368
  end
  object dsFornecedor: TDataSource
    DataSet = qrFornecedor
    Left = 160
    Top = 368
  end
  object dsUnidMed: TDataSource
    DataSet = qrUnidMed
    Left = 240
    Top = 368
  end
  object qrListaProd: TFDQuery
    Connection = ConexaoBanco
    SQL.Strings = (
      'SELECT'
      '  p.NOME AS Produto,'
      '  cat.NOME AS Categoria, '
      '  p.QUANTIDADE AS Qtd, '
      '  un.SIGLA AS Unid,'
      '  un.DESCRICAO as UnidDescr, '
      '  p.PRECO_CUSTO AS Custo, '
      '  p.PRECO_VENDA AS Venda, '
      '  ma.NOME AS Marca,'
      '  f.NOME AS Fornecedor,'
      '  f.ENDERECO as FornecedorEndereco,'
      '  (p.QUANTIDADE * p.PRECO_VENDA) as Valor_em_Estoque,'
      '  p.ID AS ProdutoID,'
      '  p.ID_MARCA as MarcaID,'
      '  p.id_forn as FornecedorID,'
      '  p.id_cat as CategoriaID,'
      '  p.id_unidade as UnidMedID'
      '  '
      'FROM Produtos p'
      'LEFT JOIN UNIDADE_MEDIDA un ON p.id_unidade = un.id'
      'LEFT JOIN MARCA ma ON p.id_marca = ma.id'
      'LEFT JOIN FORNECEDOR f ON p.id_forn = f.id'
      'left JOIN categoria cat on p.id_cat = cat.id')
    Left = 312
    Top = 424
    object qrListaProdPRODUTO: TStringField
      FieldName = 'PRODUTO'
      Origin = 'NOME'
      Required = True
      Size = 100
    end
    object qrListaProdCATEGORIA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CATEGORIA'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object qrListaProdQTD: TFMTBCDField
      FieldName = 'QTD'
      Origin = 'QUANTIDADE'
      Precision = 18
      Size = 3
    end
    object qrListaProdUNID: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'UNID'
      Origin = 'SIGLA'
      ProviderFlags = []
      ReadOnly = True
      Size = 4
    end
    object qrListaProdUNIDDESCR: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'UNIDDESCR'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      ReadOnly = True
      Visible = False
      Size = 50
    end
    object qrListaProdCUSTO: TFMTBCDField
      FieldName = 'CUSTO'
      Origin = 'PRECO_CUSTO'
      currency = True
      Precision = 18
      Size = 2
    end
    object qrListaProdVENDA: TFMTBCDField
      FieldName = 'VENDA'
      Origin = 'PRECO_VENDA'
      currency = True
      Precision = 18
      Size = 2
    end
    object qrListaProdMARCA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'MARCA'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object qrListaProdFORNECEDOR: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'FORNECEDOR'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object qrListaProdFORNECEDORENDERECO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'FORNECEDORENDERECO'
      Origin = 'ENDERECO'
      ProviderFlags = []
      ReadOnly = True
      Visible = False
      Size = 200
    end
    object qrListaProdVALOR_EM_ESTOQUE: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'VALOR_EM_ESTOQUE'
      Origin = 'VALOR_EM_ESTOQUE'
      ProviderFlags = []
      ReadOnly = True
      currency = True
      Precision = 18
      Size = 5
    end
    object qrListaProdPRODUTOID: TIntegerField
      FieldName = 'PRODUTOID'
      Origin = 'ID'
      Required = True
      Visible = False
    end
    object qrListaProdMARCAID: TIntegerField
      FieldName = 'MARCAID'
      Origin = 'ID_MARCA'
      Visible = False
    end
    object qrListaProdFORNECEDORID: TIntegerField
      FieldName = 'FORNECEDORID'
      Origin = 'ID_FORN'
      Visible = False
    end
    object qrListaProdCATEGORIAID: TIntegerField
      FieldName = 'CATEGORIAID'
      Origin = 'ID_CAT'
      Visible = False
    end
    object qrListaProdUNIDMEDID: TIntegerField
      FieldName = 'UNIDMEDID'
      Origin = 'ID_UNIDADE'
      Visible = False
    end
  end
  object dsListaProd: TDataSource
    DataSet = qrListaProd
    Left = 312
    Top = 368
  end
  object qrListaSoProduto: TFDQuery
    Connection = ConexaoBanco
    SQL.Strings = (
      'SELECT NOME AS Produto'
      'FROM Produtos '
      '')
    Left = 400
    Top = 424
  end
  object dsListaSoProduto: TDataSource
    DataSet = qrListaSoProduto
    Left = 400
    Top = 368
  end
  object qrListaMov: TFDQuery
    Connection = ConexaoBanco
    SQL.Strings = (
      'SELECT '
      'm.ID,'
      'm.ID_PRODUTO,'
      'CASE '
      '         WHEN m.TIPO = '#39'E'#39' THEN '#39'Entrada'#39
      '         WHEN m.TIPO = '#39'S'#39' THEN '#39'Sa'#237'da'#39
      '         ELSE '#39'ERRO!'#39
      '       END AS TIPO,'
      'm.QUANTIDADE,'
      'm.VALOR_UNIT as Valor,'
      'm.DATA,'
      'm.DESCRICAO,'
      'p.Nome as Produto,'
      '(m.VALOR_UNIT * m.QUANTIDADE) as Total FROM MOVIMENTACAO m'
      'LEFT JOIN PRODUTOS p on p.ID = m.ID_PRODUTO'
      'ORDER BY m.DATA DESC')
    Left = 496
    Top = 424
    object qrListaMovPRODUTO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'PRODUTO'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object qrListaMovDATA: TDateField
      FieldName = 'DATA'
      Origin = '"DATA"'
    end
    object qrListaMovTIPO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'TIPO'
      Origin = 'TIPO'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 7
    end
    object qrListaMovVALOR: TFMTBCDField
      FieldName = 'VALOR'
      Origin = 'VALOR_UNIT'
      currency = True
      Precision = 18
      Size = 2
    end
    object qrListaMovQUANTIDADE: TFMTBCDField
      FieldName = 'QUANTIDADE'
      Origin = 'QUANTIDADE'
      Precision = 18
      Size = 3
    end
    object qrListaMovTOTAL: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'TOTAL'
      Origin = 'TOTAL'
      ProviderFlags = []
      ReadOnly = True
      currency = True
      Precision = 18
      Size = 5
    end
    object qrListaMovDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 100
    end
    object qrListaMovID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
    end
    object qrListaMovID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
      Origin = 'ID_PRODUTO'
      Visible = False
    end
  end
  object dsListaMov: TDataSource
    DataSet = qrListaMov
    Left = 496
    Top = 368
  end
  object qrRetonaProdMontar: TFDQuery
    Connection = ConexaoBanco
    SQL.Strings = (
      'SELECT'
      'p.ID as IDProduto,'
      'p.NOME as NomeProduto,'
      'p.ID_UNIDADE as IDUnidProduto,'
      'p.PRECO_CUSTO as PrecoCustoProduto,'
      'p.PRECO_VENDA as PrecoVendaProduto,'
      'p.QUANTIDADE as QuantidadeProduto,'
      'p.ID_CAT as IDCatProduto,'
      'p.ID_MARCA as IDMarcaProduto,'
      'p.ATIVO as AtivoProduto,'
      'p.ID_FORN as IDFornProduto,'
      'cat.ID as IDCategoria,'
      'cat.NOME as NomeCategoria,'
      'ma.ID as IDMarca,'
      'ma.NOME as NomeMarca,'
      'un.ID as IDUnidMed,'
      'un.SIGLA as SiglaUnidMed,'
      'un.DESCRICAO as DescricaoUnidMed,'
      'f.ID as IDFornecedor,'
      'f.NOME as NomeFornecedor,'
      'f.Endereco as EnderecoFornecedor,'
      'f.CNPJ as CNPJFornecedor  '
      'FROM Produtos p'
      'LEFT JOIN UNIDADE_MEDIDA un ON p.id_unidade = un.id'
      'LEFT JOIN MARCA ma ON p.id_marca = ma.id'
      'LEFT JOIN FORNECEDOR f ON p.id_forn = f.id'
      'left JOIN categoria cat on p.id_cat = cat.id'
      'WHERE p.ID = :pID')
    Left = 48
    Top = 304
    ParamData = <
      item
        Name = 'PID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object RelatorioEstoque: TfrxReport
    Tag = 21650
    Version = '2026.2.0'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection, pbWatermarks]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 37871.995957488400000000
    ReportOptions.Description.Strings = (
      'This report shows how to use multiple groups.')
    ReportOptions.LastChange = 46146.051172025500000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnReportPrint = 'frxReportAbstractOnReportPrint'
    Left = 416
    Top = 56
    Datasets = <
      item
        DataSet = frxDBDataset1
        DataSetName = 'DBProduto'
      end>
    Variables = <>
    Style = <>
    Watermarks = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 5.000000000000000000
      RightMargin = 5.000000000000000000
      TopMargin = 5.000000000000000000
      BottomMargin = 5.000000000000000000
      Columns = 1
      ColumnWidth = 210.000000000000000000
      ColumnPositions.Strings = (
        '0')
      Frame.Typ = []
      MirrorMode = []
      PrintOnPreviousPage = True
      object Band1: TfrxPageFooter
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 325.039580000000000000
        Width = 755.906000000000000000
      end
      object Band2: TfrxReportTitle
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 49.133890000000000000
        Top = 18.897650000000000000
        Width = 755.906000000000000000
        object Memo30: TfrxMemoView
          AllowVectorExport = True
          Width = 755.906000000000000000
          Height = 45.354360000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -33
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          Frame.Color = clSilver
          Frame.Typ = [ftLeft, ftTop]
          Fill.BackColor = clMaroon
          GapX = 6.000000000000000000
          Memo.UTF8W = (
            'Relat'#243'rio de Estoque')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object Band3: TfrxPageHeader
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 90.708720000000000000
        Width = 755.906000000000000000
        PrintOnFirstPage = False
        object Memo16: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 3.779529999999990000
          Width = 710.551640000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop]
          Frame.Width = 2.000000000000000000
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 90.708720000000000000
        Top = 173.858380000000000000
        Width = 755.906000000000000000
        DataSet = frxDBDataset1
        DataSetName = 'DBProduto'
        RowCount = 0
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Top = 22.677172980000000000
          Width = 755.906005860000000000
          Height = 60.472473140000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
        end
        object MemoDBProdutoPRODUTO: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Width = 755.906000000000000000
          Height = 22.677180000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataSet = frxDBDataset1
          DataSetName = 'DBProduto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = 13421772
          Memo.UTF8W = (
            '       [DBProduto."PRODUTO"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object MemoDBProdutoCATEGORIA: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 30.236240000000000000
          Width = 234.330860000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataSet = frxDBDataset1
          DataSetName = 'DBProduto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Fill.BackColor = clWhite
          Memo.UTF8W = (
            'Categoria: [DBProduto."CATEGORIA"]')
          ParentFont = False
        end
        object MemoDBProdutoMARCA: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 56.692950000000000000
          Width = 196.535560000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataSet = frxDBDataset1
          DataSetName = 'DBProduto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Fill.BackColor = clWhite
          Memo.UTF8W = (
            'Marca: [DBProduto."MARCA"]')
          ParentFont = False
        end
        object MemoDBProdutoFORNECEDORENDERECO: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 204.094620000000000000
          Top = 56.692950000000000000
          Width = 517.795610000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataSet = frxDBDataset1
          DataSetName = 'DBProduto'
          Frame.Typ = []
          Memo.UTF8W = (
            'Endere'#231'o: [DBProduto."FORNECEDORENDERECO"]')
        end
        object MemoDBProdutoFORNECEDOR: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 204.094620000000000000
          Top = 30.236240000000000000
          Width = 325.039580000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataSet = frxDBDataset1
          DataSetName = 'DBProduto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Fill.BackColor = clWhite
          Memo.UTF8W = (
            'Fornecedor: [DBProduto."FORNECEDOR"]')
          ParentFont = False
        end
        object MemoDBProdutoCUSTO: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 510.236550000000000000
          Top = 30.236240000000000000
          Width = 241.889920000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataSet = frxDBDataset1
          DataSetName = 'DBProduto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            
              'Custo: [DBProduto."CUSTO"] X [DBProduto."QTD"] = [<DBProduto."CU' +
              'STO">*<DBProduto."QTD">]')
          ParentFont = False
          Formats = <
            item
              FormatStr = '%2.2m'
              Kind = fkNumeric
            end
            item
            end
            item
              FormatStr = '%2.2m'
              Kind = fkNumeric
            end>
        end
        object MemoDBProdutoVENDA: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 510.236550000000000000
          Top = 56.692950000000000000
          Width = 241.889920000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataSet = frxDBDataset1
          DataSetName = 'DBProduto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            
              'Venda: [DBProduto."VENDA"] X [DBProduto."QTD"] = [DBProduto."VAL' +
              'OR_EM_ESTOQUE"]')
          ParentFont = False
          Formats = <
            item
              FormatStr = '%2.2m'
              Kind = fkNumeric
            end
            item
            end
            item
              FormatStr = '%2.2m'
              Kind = fkNumeric
            end>
        end
        object MemoDBProdutoQTD: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 510.236550000000000000
          Width = 192.756030000000000000
          Height = 22.677180000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataSet = frxDBDataset1
          DataSetName = 'DBProduto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop, ftBottom]
          Fill.BackColor = 13421772
          Memo.UTF8W = (
            '[DBProduto."QTD"] [DBProduto."UNID"] ([DBProduto."UNIDDESCR"])')
          ParentFont = False
          VAlign = vaCenter
          Formats = <
            item
            end
            item
            end>
        end
      end
    end
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'DBProduto'
    CloseDataSource = False
    DataSet = qrRelatorioEstoque
    BCDToCurrency = False
    DataSetOptions = []
    Left = 520
    Top = 56
  end
  object RelatorioMovimentacao: TfrxReport
    Tag = 21650
    Version = '2026.2.0'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection, pbWatermarks]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 37871.995957488400000000
    ReportOptions.Description.Strings = (
      'This report shows how to use multiple groups.')
    ReportOptions.LastChange = 46147.006576307870000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnReportPrint = 'frxReportAbstractOnReportPrint'
    Left = 416
    Top = 120
    Datasets = <
      item
        DataSet = frxDBDataset2
        DataSetName = 'frxDBDataset2'
      end>
    Variables = <
      item
        Name = ' Variables'
        Value = Null
      end
      item
        Name = 'DataInicio'
        Value = Null
      end
      item
        Name = 'DataFinal'
        Value = Null
      end>
    Style = <>
    Watermarks = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 5.000000000000000000
      RightMargin = 5.000000000000000000
      TopMargin = 5.000000000000000000
      BottomMargin = 5.000000000000000000
      Columns = 1
      ColumnWidth = 210.000000000000000000
      ColumnPositions.Strings = (
        '0')
      Frame.Typ = []
      MirrorMode = []
      PrintOnPreviousPage = True
      object Band1: TfrxPageFooter
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 529.134200000000000000
        Width = 755.906000000000000000
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 3.779530000000020000
          Width = 710.551640000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop]
          Frame.Width = 2.000000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '[Page#]')
          ParentFont = False
        end
      end
      object Band2: TfrxReportTitle
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 86.929190000000000000
        Top = 18.897650000000000000
        Width = 755.906000000000000000
        object Memo30: TfrxMemoView
          AllowVectorExport = True
          Width = 755.906000000000000000
          Height = 49.133890000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -33
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          Frame.Color = clSilver
          Frame.Typ = [ftLeft, ftRight, ftTop]
          Fill.BackColor = clMaroon
          GapX = 6.000000000000000000
          Memo.UTF8W = (
            'Relat'#243'rio de Movimenta'#231#227'o')
          ParentFont = False
          VAlign = vaCenter
          Formats = <
            item
            end
            item
            end>
        end
        object Memo34: TfrxMemoView
          AllowVectorExport = True
          Top = 49.133890000000000000
          Width = 755.906000000000000000
          Height = 37.795300000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          Frame.Color = clSilver
          Frame.Typ = [ftLeft, ftRight]
          Fill.BackColor = clMaroon
          GapX = 6.000000000000000000
          Memo.UTF8W = (
            '[DataInicio] - [DataFinal]')
          ParentFont = False
        end
      end
      object Band3: TfrxPageHeader
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 128.504020000000000000
        Width = 755.906000000000000000
        PrintOnFirstPage = False
        object Memo16: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 3.779529999999990000
          Width = 710.551640000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop]
          Frame.Width = 2.000000000000000000
          ParentFont = False
        end
      end
      object Band5: TfrxGroupHeader
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 41.574830000000000000
        Top = 211.653680000000000000
        Width = 755.906000000000000000
        KeepWithData = False
        Condition = 'frxDBDataset2."DATA"'
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Top = 18.897650000000000000
          Width = 52.913420000000000000
          Height = 22.677180000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Color = clSilver
          Frame.Typ = [ftLeft]
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = -0.000002440000000000
          Width = 755.905541100000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Color = clSilver
          Frame.Typ = [ftRight]
          Fill.BackColor = clSilver
          Memo.UTF8W = (
            'Data [frxDBDataset2."DATA"]')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          AllowVectorExport = True
          Left = 154.771800000000000000
          Top = 18.897650000000000000
          Width = 230.551330000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Color = clSilver
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Descri'#231#227'o')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo12: TfrxMemoView
          AllowVectorExport = True
          Left = 457.323130000000000000
          Top = 18.897650000000000000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Color = clSilver
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Pre'#231'o')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo13: TfrxMemoView
          AllowVectorExport = True
          Left = 540.472790000000000000
          Top = 18.897650000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Color = clSilver
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Quantidade')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo14: TfrxMemoView
          AllowVectorExport = True
          Left = 600.945270000000000000
          Top = 18.897650000000000000
          Width = 90.708720000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Color = clSilver
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Total')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo31: TfrxMemoView
          AllowVectorExport = True
          Left = 684.094930000000000000
          Top = 18.897650000000000000
          Width = 71.811070000000000000
          Height = 22.677180000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Color = clSilver
          Frame.Typ = [ftRight]
          ParentFont = False
        end
        object Memo29: TfrxMemoView
          AllowVectorExport = True
          Left = 385.512060000000000000
          Top = 18.897650000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Color = clSilver
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Tipo')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo18: TfrxMemoView
          AllowVectorExport = True
          Left = 56.692950000000000000
          Top = 18.897650000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Color = clSilver
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Produto')
          ParentFont = False
          VAlign = vaBottom
        end
      end
      object Band6: TfrxMasterData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 34.015770000000000000
        Top = 275.905690000000000000
        Width = 755.906000000000000000
        BandColumns.Count = 1
        BandColumns.Gap = 20.000000000000000000
        BandColumns.Width = 200.000000000000000000
        Columns = 1
        ColumnWidth = 200.000000000000000000
        ColumnGap = 20.000000000000000000
        DataSet = frxDBDataset2
        DataSetName = 'frxDBDataset2'
        RowCount = 0
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Width = 52.913420000000000000
          Height = 34.015770000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Color = clSilver
          Frame.Typ = [ftLeft]
          ParentFont = False
        end
        object Memo24: TfrxMemoView
          AllowVectorExport = True
          Left = 154.771800000000000000
          Width = 230.551330000000000000
          Height = 26.456710000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataSetName = 'Sales'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Color = clSilver
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset2."DESCRICAO"]')
          ParentFont = False
          WordBreak = True
        end
        object Memo25: TfrxMemoView
          AllowVectorExport = True
          Left = 457.323130000000000000
          Width = 83.149660000000000000
          Height = 26.456710000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataSetName = 'Sales'
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Color = clSilver
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset2."VALOR"]')
          ParentFont = False
        end
        object Memo26: TfrxMemoView
          AllowVectorExport = True
          Left = 540.472790000000000000
          Width = 60.472480000000000000
          Height = 26.456710000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataSetName = 'Sales'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Color = clSilver
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset2."QUANTIDADE"]')
          ParentFont = False
        end
        object Memo27: TfrxMemoView
          AllowVectorExport = True
          Left = 600.945270000000000000
          Width = 90.708720000000000000
          Height = 26.456710000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Color = clSilver
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            
              '[IIF(<frxDBDataset2."TIPO"> = '#39'Entrada'#39', -<frxDBDataset2."TOTAL"' +
              '>, <frxDBDataset2."TOTAL">)]')
          ParentFont = False
        end
        object Memo32: TfrxMemoView
          AllowVectorExport = True
          Left = 684.094930000000000000
          Width = 71.811070000000000000
          Height = 34.015770000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Color = clSilver
          Frame.Typ = [ftRight]
          HAlign = haCenter
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          AllowVectorExport = True
          Left = 385.512060000000000000
          Width = 71.811070000000000000
          Height = 26.456710000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataSetName = 'Sales'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Color = clSilver
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset2."TIPO"]')
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          AllowVectorExport = True
          Left = 56.692950000000000000
          Width = 98.267780000000000000
          Height = 26.456710000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DataField = 'PRODUTO'
          DataSet = frxDBDataset2
          DataSetName = 'frxDBDataset2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Color = clSilver
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset2."PRODUTO"]')
          ParentFont = False
          WordBreak = True
        end
      end
      object Band8: TfrxGroupFooter
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 332.598640000000000000
        Width = 755.906000000000000000
        KeepWithData = False
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Width = 52.913420000000000000
          Height = 22.677180000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Color = clSilver
          Frame.Typ = [ftLeft]
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          AllowVectorExport = True
          Left = 56.692950000000000000
          Width = 585.827150000000000000
          Height = 22.677180000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Color = clSilver
          Frame.Typ = [ftTop]
          HAlign = haRight
          Memo.UTF8W = (
            
              'Total por data: [Sum(IIF(<frxDBDataset2."TIPO"> = '#39'Entrada'#39',-<fr' +
              'xDBDataset2."TOTAL">,<frxDBDataset2."TOTAL">))]')
          ParentFont = False
        end
        object Memo33: TfrxMemoView
          AllowVectorExport = True
          Left = 684.094930000000000000
          Width = 71.811070000000000000
          Height = 22.677180000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Color = clSilver
          Frame.Typ = [ftRight]
          ParentFont = False
        end
      end
      object ReportSummary1: TfrxReportSummary
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 90.708720000000000000
        Top = 415.748300000000000000
        Width = 755.906000000000000000
        object Memo28: TfrxMemoView
          AllowVectorExport = True
          Width = 755.906000000000000000
          Height = 86.929190000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          Frame.Color = clSilver
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          Fill.BackColor = clMaroon
          Memo.UTF8W = (
            
              '  Total de Entrada: [Sum(IIF(<frxDBDataset2."TIPO"> = '#39'Entrada'#39',' +
              '<frxDBDataset2."TOTAL">,0))]'
            
              '  Total de Sa'#237'da: [Sum(IIF(<frxDBDataset2."TIPO"> = '#39'Sa'#237'da'#39',<frx' +
              'DBDataset2."TOTAL">,0))]'
            ''
            
              '  Total do per'#237'odo selecionado: [Sum(IIF(<frxDBDataset2."TIPO"> ' +
              '= '#39'Entrada'#39',-<frxDBDataset2."TOTAL">,<frxDBDataset2."TOTAL">))]')
          ParentFont = False
          VAlign = vaCenter
          Formats = <
            item
              FormatStr = '%2.2m'
              Kind = fkNumeric
            end
            item
              FormatStr = '%2.2m'
              Kind = fkNumeric
            end
            item
              FormatStr = '%2.2m'
              Kind = fkNumeric
            end>
        end
      end
    end
  end
  object qrRelatorioMov: TFDQuery
    Connection = ConexaoBanco
    SQL.Strings = (
      'SELECT '
      'm.ID,'
      'm.ID_PRODUTO,'
      'CASE '
      '         WHEN m.TIPO = '#39'E'#39' THEN '#39'Entrada'#39
      '         WHEN m.TIPO = '#39'S'#39' THEN '#39'Sa'#237'da'#39
      '         ELSE '#39'ERRO!'#39
      '       END AS TIPO,'
      'm.QUANTIDADE,'
      'm.VALOR_UNIT as Valor,'
      'm.DATA,'
      'm.DESCRICAO,'
      'p.Nome as Produto,'
      '(m.VALOR_UNIT * m.QUANTIDADE) as Total FROM MOVIMENTACAO m'
      'LEFT JOIN PRODUTOS p on p.ID = m.ID_PRODUTO'
      'WHERE m.DATA BETWEEN :DATA_INI AND :DATA_FIM'
      'ORDER BY m.DATA'
      '')
    Left = 160
    Top = 304
    ParamData = <
      item
        Name = 'DATA_INI'
        DataType = ftDate
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'DATA_FIM'
        DataType = ftDate
        ParamType = ptInput
      end>
    object StringField1: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'PRODUTO'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object DateField1: TDateField
      FieldName = 'DATA'
      Origin = '"DATA"'
    end
    object StringField2: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'TIPO'
      Origin = 'TIPO'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 7
    end
    object FMTBCDField1: TFMTBCDField
      FieldName = 'VALOR'
      Origin = 'VALOR_UNIT'
      currency = True
      Precision = 18
      Size = 2
    end
    object FMTBCDField2: TFMTBCDField
      FieldName = 'QUANTIDADE'
      Origin = 'QUANTIDADE'
      Precision = 18
      Size = 3
    end
    object FMTBCDField3: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'TOTAL'
      Origin = 'TOTAL'
      ProviderFlags = []
      ReadOnly = True
      currency = True
      Precision = 18
      Size = 5
    end
    object StringField3: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 100
    end
    object IntegerField1: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
    end
    object IntegerField2: TIntegerField
      FieldName = 'ID_PRODUTO'
      Origin = 'ID_PRODUTO'
      Visible = False
    end
  end
  object frxDBDataset2: TfrxDBDataset
    UserName = 'frxDBDataset2'
    CloseDataSource = False
    DataSet = qrRelatorioMov
    BCDToCurrency = False
    DataSetOptions = []
    Left = 520
    Top = 120
  end
  object qrRelatorioEstoque: TFDQuery
    Connection = ConexaoBanco
    SQL.Strings = (
      'SELECT'
      '  p.NOME AS Produto,'
      '  cat.NOME AS Categoria, '
      '  p.QUANTIDADE AS Qtd, '
      '  un.SIGLA AS Unid,'
      '  un.DESCRICAO as UnidDescr, '
      '  p.PRECO_CUSTO AS Custo, '
      '  p.PRECO_VENDA AS Venda, '
      '  ma.NOME AS Marca,'
      '  f.NOME AS Fornecedor,'
      '  f.ENDERECO as FornecedorEndereco,'
      '  (p.QUANTIDADE * p.PRECO_VENDA) as Valor_em_Estoque,'
      '  p.ID AS ProdutoID,'
      '  p.ID_MARCA as MarcaID,'
      '  p.id_forn as FornecedorID,'
      '  p.id_cat as CategoriaID,'
      '  p.id_unidade as UnidMedID'
      '  '
      'FROM Produtos p'
      'LEFT JOIN UNIDADE_MEDIDA un ON p.id_unidade = un.id'
      'LEFT JOIN MARCA ma ON p.id_marca = ma.id'
      'LEFT JOIN FORNECEDOR f ON p.id_forn = f.id'
      'left JOIN categoria cat on p.id_cat = cat.id'
      'WHERE p.QUANTIDADE > 0 AND p.ATIVO = '#39'A'#39
      'ORDER BY p.NOME;')
    Left = 264
    Top = 304
    object StringField4: TStringField
      FieldName = 'PRODUTO'
      Origin = 'NOME'
      Required = True
      Size = 100
    end
    object StringField5: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CATEGORIA'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object FMTBCDField4: TFMTBCDField
      FieldName = 'QTD'
      Origin = 'QUANTIDADE'
      Precision = 18
      Size = 3
    end
    object StringField6: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'UNID'
      Origin = 'SIGLA'
      ProviderFlags = []
      ReadOnly = True
      Size = 4
    end
    object StringField7: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'UNIDDESCR'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      ReadOnly = True
      Visible = False
      Size = 50
    end
    object FMTBCDField5: TFMTBCDField
      FieldName = 'CUSTO'
      Origin = 'PRECO_CUSTO'
      currency = True
      Precision = 18
      Size = 2
    end
    object FMTBCDField6: TFMTBCDField
      FieldName = 'VENDA'
      Origin = 'PRECO_VENDA'
      currency = True
      Precision = 18
      Size = 2
    end
    object StringField8: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'MARCA'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object StringField9: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'FORNECEDOR'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object StringField10: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'FORNECEDORENDERECO'
      Origin = 'ENDERECO'
      ProviderFlags = []
      ReadOnly = True
      Visible = False
      Size = 200
    end
    object FMTBCDField7: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'VALOR_EM_ESTOQUE'
      Origin = 'VALOR_EM_ESTOQUE'
      ProviderFlags = []
      ReadOnly = True
      currency = True
      Precision = 18
      Size = 5
    end
    object IntegerField3: TIntegerField
      FieldName = 'PRODUTOID'
      Origin = 'ID'
      Required = True
      Visible = False
    end
    object IntegerField4: TIntegerField
      FieldName = 'MARCAID'
      Origin = 'ID_MARCA'
      Visible = False
    end
    object IntegerField5: TIntegerField
      FieldName = 'FORNECEDORID'
      Origin = 'ID_FORN'
      Visible = False
    end
    object IntegerField6: TIntegerField
      FieldName = 'CATEGORIAID'
      Origin = 'ID_CAT'
      Visible = False
    end
    object IntegerField7: TIntegerField
      FieldName = 'UNIDMEDID'
      Origin = 'ID_UNIDADE'
      Visible = False
    end
  end
end
