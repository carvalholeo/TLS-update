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
    HttpClient.UserAgent := 'User-Agent:Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.96 Safari/537.36';
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
