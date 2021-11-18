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
var
  trocoInteger: Integer;
begin
  Result:= TList.Create;
  trocoInteger := Round(Troco * 100);
  while trocoInteger > 0 do
  begin
    if ((trocoInteger div Trunc(CValorCedula[ceNota100] * 100)) > 0) then
    begin
      Result.Add(TTroco.Create(ceNota100,(trocoInteger div Trunc(CValorCedula[ceNota100] * 100))));
      trocoInteger := trocoInteger mod Trunc(CValorCedula[ceNota100] * 100);
    end
    else
      if ((trocoInteger div Trunc(CValorCedula[ceNota50] * 100)) > 0) then
      begin
        Result.Add(TTroco.Create(ceNota50,(trocoInteger div Trunc(CValorCedula[ceNota50] * 100))));
        trocoInteger := trocoInteger mod Trunc(CValorCedula[ceNota50] * 100);
      end
      else
        if ((trocoInteger div Trunc(CValorCedula[ceNota20] * 100)) > 0) then
        begin
          Result.Add(TTroco.Create(ceNota20,(trocoInteger div Trunc(CValorCedula[ceNota20] * 100))));
          trocoInteger := trocoInteger mod Trunc(CValorCedula[ceNota20] * 100);
        end
        else
          if ((trocoInteger div Trunc(CValorCedula[ceNota10] * 100)) > 0) then
          begin
            Result.Add(TTroco.Create(ceNota10,(trocoInteger div Trunc(CValorCedula[ceNota10] * 100))));
            trocoInteger := trocoInteger mod Trunc(CValorCedula[ceNota10] * 100);
          end
          else
            if ((trocoInteger div Trunc(CValorCedula[ceNota5] * 100)) > 0) then
            begin
              Result.Add(TTroco.Create(ceNota5,(trocoInteger div Trunc(CValorCedula[ceNota5] * 100))));
              trocoInteger := trocoInteger mod Trunc(CValorCedula[ceNota5] * 100);
            end
            else
              if ((trocoInteger div Trunc(CValorCedula[ceNota2] * 100)) > 0) then
              begin
                Result.Add(TTroco.Create(ceNota2,(trocoInteger div Trunc(CValorCedula[ceNota2] * 100))));
                trocoInteger := trocoInteger mod Trunc(CValorCedula[ceNota2] * 100);
              end
              else
                if ((trocoInteger div Trunc(CValorCedula[ceMoeda100] * 100)) > 0) then
                begin
                  Result.Add(TTroco.Create(ceMoeda100,(trocoInteger div Trunc(CValorCedula[ceMoeda100] * 100))));
                  trocoInteger := trocoInteger mod Trunc(CValorCedula[ceMoeda100] * 100);
                end
                else
                  if ((trocoInteger div Trunc(CValorCedula[ceMoeda50] * 100)) > 0) then
                  begin
                   Result.Add(TTroco.Create(ceMoeda50,(trocoInteger div Trunc(CValorCedula[ceMoeda50] * 100))));
                   trocoInteger := trocoInteger mod Trunc(CValorCedula[ceMoeda50] * 100);
                  end
                  else
                    if ((trocoInteger div Trunc(CValorCedula[ceMoeda25] * 100)) > 0) then
                    begin
                      Result.Add(TTroco.Create(ceMoeda25,(trocoInteger div Trunc(CValorCedula[ceMoeda25] * 100))));
                      trocoInteger := trocoInteger mod Trunc(CValorCedula[ceMoeda25] * 100);
                    end
                    else
                      if ((trocoInteger div Trunc(CValorCedula[ceMoeda10] * 100)) > 0) then
                      begin
                        Result.Add(TTroco.Create(ceMoeda10,(trocoInteger div Trunc(CValorCedula[ceMoeda10] * 100))));
                        trocoInteger := trocoInteger mod Trunc(CValorCedula[ceMoeda10] * 100);
                      end
                      else
                        if ((trocoInteger div Trunc(CValorCedula[ceMoeda5] * 100)) > 0) then
                        begin
                          Result.Add(TTroco.Create(ceMoeda5,(trocoInteger div Trunc(CValorCedula[ceMoeda5] * 100))));
                          trocoInteger := trocoInteger mod Trunc(CValorCedula[ceMoeda5] * 100);
                        end
                        else
                          if ((trocoInteger div Trunc(CValorCedula[ceMoeda1] * 100)) > 0) then
                          begin
                            Result.Add(TTroco.Create(ceMoeda1,(trocoInteger div Trunc(CValorCedula[ceMoeda1] * 100))));
                            trocoInteger := trocoInteger mod Trunc(CValorCedula[ceMoeda1] * 100);
                          end;
  end;
end;

end.

