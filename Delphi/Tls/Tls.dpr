program Tls;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  System.Net.HttpClient;

var
  HttpClient: THttpClient;
  HttpResponse: IHttpResponse;
  Result: String;

begin
  HttpClient := THTTPClient.Create;

  try

    HttpResponse := HttpClient.Get('https://tls.testegerencianet.com.br');
    Result := HttpResponse.ContentAsString();
    Writeln(Result);
    Readln;

    { TODO -oUser -cConsole Main : Insert code here }
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
