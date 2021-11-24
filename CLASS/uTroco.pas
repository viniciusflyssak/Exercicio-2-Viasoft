unit uTroco;

interface

type

  TCedula = (ceNota100, ceNota50, ceNota20, ceNota10, ceNota5, ceNota2,
    ceMoeda100, ceMoeda50, ceMoeda25, ceMoeda10, ceMoeda5, ceMoeda1);

  TTroco = class
  private
    FTipo: TCedula;
    FQuantidade: Integer;
  public
    constructor Create(ValorCedula: Integer; Quantidade: Integer); reintroduce;
    function GetTipo: TCedula;
    function GetQuantidade: Integer;
    procedure SetQuantidade(Quantidade: Integer);
    procedure SetTipo(Value: TCedula);
  published
    property Tipo: TCedula read GetTipo write SetTipo;
    property Quantidade: Integer read GetQuantidade write SetQuantidade;
  end;

const
  CValorCedula: array [TCedula] of Double = (100, 50, 20, 10, 5, 2, 1, 0.5, 0.25, 0.1, 0.05, 0.01);

implementation

constructor TTroco.Create(ValorCedula: Integer; Quantidade: Integer);
begin
  inherited Create;
  case ValorCedula of
    10000: FTipo := ceNota100;
    5000: FTipo := ceNota50;
    2000: FTipo := ceNota20;
    1000: FTipo := ceNota10;
    500: FTipo := ceNota5;
    200: FTipo := ceNota2;
    100: FTipo := ceMoeda100;
    50: FTipo := ceMoeda50;
    25: FTipo := ceMoeda25;
    10: FTipo := ceMoeda10;
    5: FTipo := ceMoeda5;
    1: FTipo := ceMoeda1;
  end;
  FQuantidade := Quantidade;
end;

function TTroco.GetTipo: TCedula;
begin
  Result := FTipo;
end;

function TTroco.GetQuantidade: Integer;
begin
  Result := FQuantidade;
end;

procedure TTroco.SetQuantidade(Quantidade: Integer);
begin
  FQuantidade := Quantidade;
end;
procedure TTroco.SetTipo(Value: TCedula);
begin
  FTipo := Value;
end;

end.

