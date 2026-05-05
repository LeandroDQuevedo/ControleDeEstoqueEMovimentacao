program ProjetoSky;

uses
  Vcl.Forms,
  uFrmPrincipal in 'Views\uFrmPrincipal.pas' {Form1},
  uModel.Classes in 'uModel.Classes.pas',
  uService.Produto in 'Services\uService.Produto.pas',
  uDM in 'uDM.pas' {dmPrincipal: TDataModule},
  uFrmCadastro in 'Views\uFrmCadastro.pas' {Form2},
  uFrmMovimentacao in 'Views\uFrmMovimentacao.pas' {Form3},
  uFrmInformarMovimentacao in 'Views\uFrmInformarMovimentacao.pas' {Form4},
  uService.Estoque in 'Services\uService.Estoque.pas',
  uFrmCadastroInfoAdd in 'Views\uFrmCadastroInfoAdd.pas' {Form5},
  uFrmRelatorios in 'Views\uFrmRelatorios.pas' {Form6};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdmPrincipal, dmPrincipal);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TForm4, Form4);
  Application.CreateForm(TForm5, Form5);
  Application.CreateForm(TForm6, Form6);
  Application.Run;
end.
