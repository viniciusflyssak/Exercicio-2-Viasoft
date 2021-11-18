program QS7;

uses
  System.SysUtils,
  classes,
  uMaquina in 'CLASS\uMaquina.pas',
  uTroco in 'CLASS\uTroco.pas',
  uIMaquina in 'INTERFACE\uIMaquina.pas',
  uFrmPrincipal in 'uFrmPrincipal.pas';

{$R *.RES}

var
  frmPrincipal: TFrmPrincipal;

begin
  frmPrincipal := TfrmPrincipal.Create(nil);
  frmPrincipal.ShowModal;
end.

