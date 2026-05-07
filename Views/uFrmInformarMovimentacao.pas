unit uFrmInformarMovimentacao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.CheckLst, FireDAC.Comp.Client, uModel.Classes, uDM, uService.Estoque,
  System.Generics.Collections, Vcl.ComCtrls, Vcl.DBCtrls, Vcl.WinXCalendars, uService.Produto,
  Vcl.Mask;

type
  TFrmInformarMovimentacao = class(TForm)
    pnCampos: TPanel;
    pnListaMov: TPanel;
    btnAdicionarMov: TButton;
    btnSalvar: TButton;
    bntCancelar: TButton;
    ckbEntrada: TCheckBox;
    ckbSaida: TCheckBox;
    edtQntd: TEdit;
    LsvMovimentacoes: TListView;
    cbxProduto: TComboBox;
    edtDescricao: TEdit;
    edtData: TMaskEdit;
    procedure btnAdicionarMovClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cbxProdutoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbxProdutoDropDown(Sender: TObject);
    procedure ckbSaidaClick(Sender: TObject);
    procedure ckbEntradaClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure bntCancelarClick(Sender: TObject);
  private
    { Private declarations }
    qrDigitoProduto: TFDQuery;
    ListaMovimentacoes: TObjectList<TMovimentacao>;
    procedure AtualizarListaVisual;
  public
    { Public declarations }
  end;

var
  FrmInformarMovimentacao: TFrmInformarMovimentacao;

implementation

{$R *.dfm}

procedure TFrmInformarMovimentacao.bntCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmInformarMovimentacao.btnAdicionarMovClick(Sender: TObject);
var
  FMovimentacao : TMovimentacao;
  cxMarcado : TTipoMovimento;
  FProduto : TProduto;
  retornoProd : TFDQuery;
  IDSelecionado : Integer;
  Service : TProdutoService;
begin



  if cbxProduto.ItemIndex = -1 then
  begin
    ShowMessage('Por favor, selecione um produto primeiro.');
    Exit;
  end;

  if trim(edtQntd.Text) = '0' then
  begin
    ShowMessage('A quantidade informada deve ser maior que 0.');
    Exit;
  end;

  IDSelecionado := 0;
  IDSelecionado := NativeInt(cbxProduto.Items.Objects[cbxProduto.ItemIndex]);

  Fproduto := Service.RetornarProduto(IDSelecionado);

  if ckbEntrada.Checked then
    begin
      cxMarcado := tmEntrada;
    end
  else
    begin
      cxMarcado := tmSaida;
    end;


  FMovimentacao := TMovimentacao.Create;
  FMovimentacao.Tipo := cxMarcado;
  FMovimentacao.Quantidade := StrToFloat(edtQntd.Text);
  FMovimentacao.Descricao := edtDescricao.Text;
  FMovimentacao.Produto := FProduto;
  FMovimentacao.ValorUnit := FProduto.PrecoVenda;
  FMovimentacao.Data := StrToDate(edtData.Text);

  if (edtData.Text = '0') or (trim(edtData.Text) = '') then
    begin
      ShowMessage('Insira uma quantidade válida!');
      exit;
    end;

  if ckbSaida.Checked and (FMovimentacao.Quantidade > FProduto.Quantidade) then
    begin
      ShowMessage('Quantidade de baixa de produtos é maior que a quantiadde existente no estoque atualmente!'+ #13#10 + 'Atual: ' + FloatToStr(FProduto.Quantidade) + ' - Informada: ' + FloatToStr(FMovimentacao.Quantidade));
      exit;
    end;


  ListaMovimentacoes.Add(FMovimentacao);

  AtualizarListaVisual;

  edtQntd.Text := '';
  edtData.Text := '';
  edtDescricao.Text := '';
  cbxProduto.Text := '';

end;

procedure TFrmInformarMovimentacao.btnSalvarClick(Sender: TObject);
var
  Service : TEstoqueService;
begin
  Service := TEstoqueService.Create;
  try
    if Service.Salvar(ListaMovimentacoes,dmPrincipal.ConexaoBanco) then
    begin
      ShowMessage(IntToStr(ListaMovimentacoes.Count) + ' movimentações adicionadas com sucesso!');
      dmPrincipal.qrListaMov.Close;
      dmPrincipal.qrListaMov.Open;
      Close;

    end
    else
    begin
      ShowMessage('Falha ao salvar!!')
    end;
  finally
    Service.Free;
  end;
end;

procedure TFrmInformarMovimentacao.AtualizarListaVisual;
var
  Movimento: TMovimentacao;
  Linha: TListItem;
begin
  LsvMovimentacoes.Items.Clear;
  for movimento in ListaMovimentacoes do
  begin
    Linha := LsvMovimentacoes.Items.Add;
    Linha.Caption := Movimento.Produto.Nome;
    Linha.SubItems.Add(DateToStr(Movimento.Data));
    Linha.SubItems.Add(FloatToStr(Movimento.Quantidade));
    if Movimento.Tipo = tmEntrada then
      Linha.SubItems.Add('Entrada')
    else
      Linha.SubItems.Add('Saída');
  end;

end;

procedure TFrmInformarMovimentacao.cbxProdutoDropDown(Sender: TObject);
begin
  qrDigitoProduto := TFDQuery.Create(nil);
  qrDigitoProduto.Connection := dmPrincipal.ConexaoBanco;
  qrDigitoProduto.SQL.Text :='''
          Select NOME as Produto, ID from Produtos WHERE NOME LIKE :pProduto
          ''';
  qrDigitoProduto.ParamByName('pProduto').AsString := '%' + cbxProduto.Text + '%';
  qrDigitoProduto.Open;
  cbxProduto.Items.Clear;
  qrDigitoProduto.First;

  while not qrDigitoProduto.Eof do
  begin
    cbxProduto.Items.AddObject(qrDigitoProduto.FieldByName('Produto').AsString, TObject((qrDigitoProduto.FieldByName('ID').AsInteger)));
    qrDigitoProduto.Next;
  end;

  qrDigitoProduto.Free;
end;

procedure TFrmInformarMovimentacao.cbxProdutoKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  qrDigitoProduto: TFDQuery;
begin
  qrDigitoProduto := TFDQuery.Create(nil);
  qrDigitoProduto.Connection := dmPrincipal.ConexaoBanco;
  qrDigitoProduto.SQL.Text :='''
          Select NOME as Produto, ID from Produtos WHERE NOME LIKE :pProduto
          ''';
  qrDigitoProduto.ParamByName('pProduto').AsString := '%' + cbxProduto.Text + '%';
  qrDigitoProduto.Open;
  cbxProduto.Items.Clear;
  qrDigitoProduto.First;

  while not qrDigitoProduto.Eof do
  begin
    cbxProduto.Items.AddObject(qrDigitoProduto.FieldByName('Produto').AsString, TObject((qrDigitoProduto.FieldByName('ID').AsInteger)));
    qrDigitoProduto.Next;
  end;

  qrDigitoProduto.Free;
  cbxProduto.DroppedDown := True;
  cbxProduto.SelStart := Length(cbxProduto.Text);

end;

procedure TFrmInformarMovimentacao.ckbEntradaClick(Sender: TObject);
begin
  if ckbEntrada.Checked then
    ckbSaida.Checked := False
  else
    ckbSaida.Checked := True;
end;

procedure TFrmInformarMovimentacao.ckbSaidaClick(Sender: TObject);
begin
  if ckbSaida.Checked then
    ckbEntrada.Checked := False
  else
    ckbEntrada.Checked := True;
end;

procedure TFrmInformarMovimentacao.FormCreate(Sender: TObject);
begin
  dmPrincipal.qrListaSoProduto.Open;
  ListaMovimentacoes := TObjectList<TMovimentacao>.Create;
end;


procedure TFrmInformarMovimentacao.FormDestroy(Sender: TObject);
begin
  ListaMovimentacoes.Free;
end;


end.
