unit uDM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  FireDAC.Comp.Client, Data.DB, FireDAC.Phys.FB, FireDAC.Phys.FBDef,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, frCoreClasses, frxClass, frxDBSet, frxSmartMemo;

type
  TdmPrincipal = class(TDataModule)
    FDConnection1: TFDConnection;
    qrCategoria: TFDQuery;
    qrMarca: TFDQuery;
    qrFornecedor: TFDQuery;
    qrUnidMed: TFDQuery;
    dsCategoria: TDataSource;
    dsMarca: TDataSource;
    dsFornecedor: TDataSource;
    dsUnidMed: TDataSource;
    qrListaProd: TFDQuery;
    dsListaProd: TDataSource;
    qrListaProdCUSTO: TFMTBCDField;
    qrListaProdPRODUTO: TStringField;
    qrListaProdQTD: TFMTBCDField;
    qrListaProdUNID: TStringField;
    qrListaProdVENDA: TFMTBCDField;
    qrListaProdMARCA: TStringField;
    qrListaProdFORNECEDOR: TStringField;
    qrListaProdCATEGORIA: TStringField;
    qrListaProdPRODUTOID: TIntegerField;
    qrListaProdMARCAID: TIntegerField;
    qrListaProdFORNECEDORID: TIntegerField;
    qrListaProdCATEGORIAID: TIntegerField;
    qrListaProdUNIDMEDID: TIntegerField;
    qrListaSoProduto: TFDQuery;
    dsListaSoProduto: TDataSource;
    qrListaMov: TFDQuery;
    dsListaMov: TDataSource;
    qrListaMovQUANTIDADE: TFMTBCDField;
    qrListaMovVALOR: TFMTBCDField;
    qrListaMovDATA: TDateField;
    qrListaMovDESCRICAO: TStringField;
    qrListaMovPRODUTO: TStringField;
    qrListaMovTOTAL: TFMTBCDField;
    qrListaMovTIPO: TStringField;
    qrRetonaProdMontar: TFDQuery;
    qrListaMovID: TIntegerField;
    qrListaMovID_PRODUTO: TIntegerField;
    qrListaProdVALOR_EM_ESTOQUE: TFMTBCDField;
    RelatorioEstoque: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    qrListaProdFORNECEDORENDERECO: TStringField;
    qrListaProdUNIDDESCR: TStringField;
    RelatorioMovimentacao: TfrxReport;
    qrRelatorioMov: TFDQuery;
    StringField1: TStringField;
    DateField1: TDateField;
    StringField2: TStringField;
    FMTBCDField1: TFMTBCDField;
    FMTBCDField2: TFMTBCDField;
    FMTBCDField3: TFMTBCDField;
    StringField3: TStringField;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    frxDBDataset2: TfrxDBDataset;
    qrRelatorioEstoque: TFDQuery;
    StringField4: TStringField;
    StringField5: TStringField;
    FMTBCDField4: TFMTBCDField;
    StringField6: TStringField;
    StringField7: TStringField;
    FMTBCDField5: TFMTBCDField;
    FMTBCDField6: TFMTBCDField;
    StringField8: TStringField;
    StringField9: TStringField;
    StringField10: TStringField;
    FMTBCDField7: TFMTBCDField;
    IntegerField3: TIntegerField;
    IntegerField4: TIntegerField;
    IntegerField5: TIntegerField;
    IntegerField6: TIntegerField;
    IntegerField7: TIntegerField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmPrincipal: TdmPrincipal;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}


end.
