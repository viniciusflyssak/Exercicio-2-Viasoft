unit uFrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,
  uMaquina, uTroco;

type
  TfrmPrincipal = class(TForm)
    pnlFundo: TPanel;
    lblTroco: TLabel;
    edtTroco: TEdit;
    mmoCedulas: TMemo;
    pnlTitulo: TPanel;
    pnlBotoes: TPanel;
    btnFechar: TSpeedButton;
    btnExecutar: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnExecutarClick(Sender: TObject);
    procedure edtTrocoKeyPress(Sender: TObject; var Key: Char);
  private
    cMaquina: TMaquina;
    CedulasTroco : TList;
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.btnExecutarClick(Sender: TObject);
var
  ConfereCaracteres: Double;
  procedure mostrarCedulas;
  var
    i: Integer;
  begin
    for i := 0 to CedulasTroco.Count - 1 do
    begin
      if TTroco(CedulasTroco[i]).Tipo =  ceNota100 then
        mmoCedulas.Lines.Add(IntToStr(TTroco(CedulasTroco[i]).Quantidade) + ' nota(s) de 100 reais')
      else
        if TTroco(CedulasTroco[i]).Tipo =  ceNota50 then
          mmoCedulas.Lines.Add(IntToStr(TTroco(CedulasTroco[i]).Quantidade) + ' nota(s) de 50 reais')
        else
          if TTroco(CedulasTroco[i]).Tipo =  ceNota20 then
            mmoCedulas.Lines.Add(IntToStr(TTroco(CedulasTroco[i]).Quantidade) + ' nota(s) de 20 reais')
          else
            if TTroco(CedulasTroco[i]).Tipo =  ceNota10 then
              mmoCedulas.Lines.Add(IntToStr(TTroco(CedulasTroco[i]).Quantidade) + ' nota(s) de 10 reais')
            else
              if TTroco(CedulasTroco[i]).Tipo =  ceNota5 then
                mmoCedulas.Lines.Add(IntToStr(TTroco(CedulasTroco[i]).Quantidade) + ' nota(s) de 5 reais')
              else
                if TTroco(CedulasTroco[i]).Tipo =  ceNota2 then
                  mmoCedulas.Lines.Add(IntToStr(TTroco(CedulasTroco[i]).Quantidade) + ' nota(s) de 2 reais')
                else
                  if TTroco(CedulasTroco[i]).Tipo =  ceMoeda100 then
                    mmoCedulas.Lines.Add(IntToStr(TTroco(CedulasTroco[i]).Quantidade) + ' moeda(s) de 1 real')
                  else
                    if TTroco(CedulasTroco[i]).Tipo =  ceMoeda50 then
                      mmoCedulas.Lines.Add(IntToStr(TTroco(CedulasTroco[i]).Quantidade) + ' moeda(s) de 50 centavos')
                    else
                      if TTroco(CedulasTroco[i]).Tipo =  ceMoeda25 then
                        mmoCedulas.Lines.Add(IntToStr(TTroco(CedulasTroco[i]).Quantidade) + ' moeda(s) de 25 centavos')
                      else
                        if TTroco(CedulasTroco[i]).Tipo =  ceMoeda10 then
                          mmoCedulas.Lines.Add(IntToStr(TTroco(CedulasTroco[i]).Quantidade) + ' moeda(s) de 10 centavos')
                        else
                          if TTroco(CedulasTroco[i]).Tipo =  ceMoeda5 then
                            mmoCedulas.Lines.Add(IntToStr(TTroco(CedulasTroco[i]).Quantidade) + ' moeda(s) de 5 centavos')
                          else
                            if TTroco(CedulasTroco[i]).Tipo =  ceMoeda1 then
                              mmoCedulas.Lines.Add(IntToStr(TTroco(CedulasTroco[i]).Quantidade) + ' moeda(s) de 1 centavo');
    end;
  end;

begin
  if edtTroco.Text = '' then
    exit
  else
    if not(TryStrToFloat(edtTroco.Text, ConfereCaracteres)) then
    begin
      edtTroco.Text := '';
      edtTroco.Focused;
      raise exception.Create('Valor digitado incorreto!' + #13 + 'Apenas números são aceitos. Para separação de casas decimais, utilize "," ao invés de ".".');
    end;

  mmoCedulas.Clear;
  edtTroco.Text := FormatFloat('#,##0.00', StrToCurr(edtTroco.Text));
  cMaquina.ValorTroco := StrToCurr(FormatFloat('#,##0.00', StrToCurr(edtTroco.Text)));
  CedulasTroco := cMaquina.MontarTroco(cMaquina.ValorTroco);
  mmoCedulas.Lines.Add('O seu troco de ' + formatFloat('#,##0.00', cMaquina.ValorTroco) + ' reais será realizado da seguinte forma:');
  mostrarCedulas;
end;

procedure TfrmPrincipal.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmPrincipal.edtTrocoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    btnExecutarClick(Nil);
end;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  cMaquina.Free;
  CedulasTroco.Free;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  cMaquina := TMaquina.Create;
  CedulasTroco :=TList.Create;
  mmoCedulas.Clear;
end;

end.
