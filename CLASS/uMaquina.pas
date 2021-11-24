unit uMaquina;

interface

uses
  uIMaquina, Classes, uTroco;

type

  TMaquina = class(TInterfacedObject, IMaquina)
  private
    FValorTroco: Double;
    function GetValorTroco: Double;
    procedure SetValorTroco(Value: Double);
  public
    function MontarTroco(Troco: Double): TList;
  published
    constructor Create;
    property ValorTroco: Double read GetValorTroco write SetValorTroco;
  end;

implementation

uses math, System.SysUtils;

constructor TMaquina.Create;
begin
  FValorTroco := 0;
end;

function TMaquina.GetValorTroco: Double;
begin
  Result := FValorTroco;
end;

procedure TMaquina.SetValorTroco(Value: Double);
begin
  FValorTroco := Value;
end;

function TMaquina.MontarTroco(Troco: Double): TList;
const
  arrayValorNota: array [1..12] of integer = (10000, 5000, 2000, 1000, 500, 200, 100, 50, 25, 10, 5, 1);
var
  i, trocoInteger: Integer;
begin
  i := 0;
  Result:= TList.Create;
  trocoInteger := Round(Troco * 100);
  while (trocoInteger > 0) do
  begin
    if ((trocoInteger div arrayValorNota[i]) > 0) then
    begin
      Result.Add(TTroco.Create(arrayValorNota[i],(trocoInteger div arrayValorNota[i])));
      trocoInteger := trocoInteger mod arrayValorNota[i];
    end;
    i := i + 1;
  end;
end;

end.

