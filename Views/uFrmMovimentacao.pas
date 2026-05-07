unit uFrmMovimentacao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, FireDAC.Comp.Client, uFrmInformarMovimentacao, Vcl.ExtCtrls, uDM, uService.Produto,
  uService.Estoque, uModel.Classes, Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TFrmMovimentacao = class(TForm)
    pnBotoes: TPanel;
    btnMovimentacao: TButton;
    grListMov: TDBGrid;
    btnDeletarMov: TButton;
    btnRelatorio: TButton;
    procedure btnMovimentacaoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnDeletarMovClick(Sender: TObject);
    procedure btnRelatorioClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMovimentacao: TFrmMovimentacao;

implementation

uses  uFrmRelatorios;

{$R *.dfm}

procedure TFrmMovimentacao.btnDeletarMovClick(Sender: TObject);
var
  FProduto : TProduto;
  novaQuantidade : double;
  ServiceProd : TProdutoService;
  ServiceEst : TEstoqueService;
begin
  ServiceProd := TProdutoService.Create;
  ServiceEst := TEstoqueService.Create;
  if not ServiceEst.VerificaUltimoDeletar(dmPrincipal.qrListaMov.FieldByName('ID_PRODUTO').AsInteger, Trunc(dmPrincipal.qrListaMov.FieldByName('DATA').AsDateTime), dmPrincipal.ConexaoBanco) then
    begin
      ShowMessage('Só é possível excluir a última movimentação do produto!');
      exit;
    end;
  try
    FProduto := ServiceProd.RetornarProduto(dmPrincipal.qrListaMov.FieldByName('ID_PRODUTO').AsInteger);

    if dmPrincipal.qrListaMov.FieldByName('TIPO').AsString = 'Entrada' then
      FProduto.Quantidade := FProduto.Quantidade - dmPrincipal.qrListaMov.FieldByName('QUANTIDADE').AsFloat
    else
      FProduto.Quantidade := FProduto.Quantidade + dmPrincipal.qrListaMov.FieldByName('QUANTIDADE').AsFloat;

    ServiceProd.Atualizar(FProduto,dmPrincipal.ConexaoBanco);

    ServiceEst.Deletar(dmPrincipal.qrListaMov.FieldByName('ID').AsInteger,dmPrincipal.ConexaoBanco);
    dmPrincipal.qrListaMov.Close;
    dmPrincipal.qrListaMov.Open;
  finally
    ServiceProd.Free;
    ServiceEst.Free;
    FProduto.Free;
  end;
end;

procedure TFrmMovimentacao.btnMovimentacaoClick(Sender: TObject);
var
  formInforMovimentacao: TFrmInformarMovimentacao;
begin
  formInforMovimentacao := TFrmInformarMovimentacao.Create(nil);
  formInforMovimentacao.ShowModal;
end;

procedure TFrmMovimentacao.btnRelatorioClick(Sender: TObject);
var
  FrmRelatorio: TFrmRelatorios;
begin
  FrmRelatorio := TFrmRelatorios.Create(nil);
  FrmRelatorio.cbxRelatorios.ItemIndex := 0;
  FrmRelatorio.cbxRelatoriosChange(nil);
  FrmRelatorio.ShowModal;

end;

procedure TFrmMovimentacao.FormCreate(Sender: TObject);
begin
  grListMov.DataSource.DataSet.Open;
end;

end.
