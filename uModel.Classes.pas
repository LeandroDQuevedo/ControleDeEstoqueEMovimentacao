unit uModel.Classes;

interface

uses
  System.SysUtils,
  System.Classes;

type
  TUnidadeMedida = class;
  TMarca = class;
  TCategoria = class;
  TFornecedor = class;

  TTipoMovimento = (tmEntrada, tmSaida);

  TProduto = class
    private
      FID: Integer;
      FNome: String;
      FUnidMed: TUnidadeMedida;
      FPrecoCusto: Currency;
      FPrecoVenda: Currency;
      FQuantidade: double;
      FCategoria: TCategoria;
      FMarca: TMarca;
      FAtivo: Boolean;
      FFornecedor: TFornecedor;
    public
      constructor Create;
      destructor Destroy; override;

      procedure Validar;

      property ID: Integer read FID write FID;
      property Nome: String read FNome write FNome;
      property UnidadeMedida: TUnidadeMedida read FUnidMed write FUnidMed;
      property PrecoCusto: Currency read FPrecoCusto write FPrecoCusto;
      property PrecoVenda: Currency read FPrecoVenda write FPrecoVenda;
      property Quantidade: double read FQuantidade write FQuantidade;
      property Categoria: TCategoria read FCategoria write FCategoria;
      property Marca: TMarca read FMarca write FMarca;
      property Ativo: Boolean read FAtivo write FAtivo;
      property Fornecedor: TFornecedor read FFornecedor write FFornecedor;
  end;

  TUnidadeMedida = class
      private
        FID: Integer;
        FSigla: String;
        FDescricao: String;
      public
        property ID: Integer read FID write FID;
        property Sigla: String read FSigla write FSigla;
        property Descricao: String read FDescricao write FDescricao;
  end;

  TMarca = class
      private
        FID: Integer;
        FNome: String;
      public
        property ID: Integer read FID write FID;
        property Nome: String read FNome write FNome;
  end;

  TCategoria = class
      private
        FID: Integer;
        FNome: String;
      public
        property ID: Integer read FID write FID;
        property Nome: String read FNome write FNome;
  end;

  TFornecedor = class
      private
        FID: Integer;
        FNome: String;
        FLocalizacao: string;
        FCNPJ: string;
      public
        property ID: Integer read FID write FID;
        property Nome: String read FNome write FNome;
        property Localizacao: String read FLocalizacao write FLocalizacao;
        property CNPJ: String read FCNPJ write FCNPJ;
  end;

type
  TMovimentacao = class
    private
      FID: Integer;
      FProduto: TProduto;
      FTipo: TTipoMovimento;
      FQuantidade: Double;
      FValorUnit: Currency;
      FData: TDate;
      FDescricao: String;
    public
      constructor Create;
      destructor Destroy; override;

      property ID: Integer read FID write FID;
      property Produto: TProduto read FProduto write FProduto;
      property Tipo: TTipoMovimento read FTipo write FTipo;
      property Quantidade: Double read FQuantidade write FQuantidade;
      property ValorUnit: Currency read FValorUnit write FValorUnit;
      property Data: TDate read FData write FData;
      property Descricao: String read FDescricao write FDescricao;
  end;


implementation

  constructor TProduto.Create;
    begin
      FUnidMed := TUnidadeMedida.Create;
      FCategoria := TCategoria.Create;
      FMarca := TMarca.Create;
      FFornecedor := TFornecedor.Create;
    end;
  destructor TProduto.Destroy;
    begin
      FUnidMed.Free;
      FCategoria.Free;
      FMarca.Free;
      FFornecedor.Free;
      inherited;
    end;
  procedure TProduto.Validar;
    begin
      if Trim(FNome) = '' then
        begin
          raise Exception.Create('Campo "Produto" precisa ser preenchido');
        end;
      if FPrecoCusto <= 0 then
        begin
          raise Exception.Create('Campo "Preço de Custo" precisa ser preenchido');
        end;
      if FPrecoVenda <= 0 then
        begin
         raise Exception.Create('Campo "Preço de Venda" precisa ser preenchido');
        end;
      if FUnidMed.FID = 0 then
        begin
         raise Exception.Create('Campo "Unidade de Medida" precisa ser preenchido');
        end;
      if FMarca.FID = 0 then
        begin
         raise Exception.Create('Campo "Marca" precisa ser preenchido');
        end;
      if FCategoria.FID = 0 then
        begin
         raise Exception.Create('Campo "Categoria" precisa ser preenchido');
        end;
      if FFornecedor.FID = 0 then
        begin
         raise Exception.Create('Campo "Fornecedor" precisa ser preenchido');
        end;


    end;

  constructor TMovimentacao.Create;
    begin
       FData := Now;
       FQuantidade := 0;
       FValorUnit := 0;
    end;
  destructor TMovimentacao.Destroy;
    begin

    end;

end.
