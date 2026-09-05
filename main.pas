program main;
{$mode objfpc}{$H+}
uses
  SysUtils, fphttpserver;

type
  TMyServer = class(TFPCustomHttpServer)
  public
    procedure HandleRequest(var ARequest: TFPHTTPConnectionRequest;
                            var AResponse: TFPHTTPConnectionResponse); override;
  end;

procedure TMyServer.HandleRequest(var ARequest: TFPHTTPConnectionRequest;
                                  var AResponse: TFPHTTPConnectionResponse);
begin
  AResponse.Code := 200;
  AResponse.ContentType := 'text/plain';
  AResponse.Content := 'Pipeline funcionou! API Delphi/Pascal no ar com sucesso.';
end;

var
  Server: TMyServer;
begin
  Server := TMyServer.Create(nil);
  try
    Server.Port := 8080;
    WriteLn('Servidor Delphi/Pascal rodando na porta 8080...');
    Server.Active := True;
  finally
    Server.Free;
  end;
end.