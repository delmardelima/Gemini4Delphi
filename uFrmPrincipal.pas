unit uFrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, IdIOHandler,
  IdIOHandlerSocket, IdIOHandlerStack, IdSSL, IdSSLOpenSSL, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, System.json,
  System.NetEncoding, Vcl.ExtCtrls;

type
  TFrmPrincipal = class(TForm)
    mRequest: TMemo;
    mResponse: TMemo;
    btnEnviar: TButton;
    edtToken: TEdit;
    LinkLabel1: TLinkLabel;
    Label19: TLabel;
    Label18: TLabel;
    Label17: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    procedure btnEnviarClick(Sender: TObject);
    procedure Label18Click(Sender: TObject);
  private
    procedure ConsumeGeminiAPI;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

{$R *.dfm}

procedure TFrmPrincipal.btnEnviarClick(Sender: TObject);
begin
  ConsumeGeminiAPI;
end;

procedure TFrmPrincipal.ConsumeGeminiAPI;
var
  HTTPClient: TIdHTTP;
  SSLHandler: TIdSSLIOHandlerSocketOpenSSL;
  ResquestData: TStringStream;
  ResponseData: String;
  API_URL: String;
  JsonValue: TJSONVALUE;
  JsonArray, PartsArray: TJsonArray;
  JsonObj, PartsObj: TJsonObject;
  JsonText: String;
  i, j: Integer;
begin
  API_URL :=
    'https://generativelanguage.googleapis.com/v1beta/models/gemini-pro:generateContent?key='
    + edtToken.Text;

  SSLHandler := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
  try
    SSLHandler.SSLOptions.Method := sslvTLSv1_2;
    SSLHandler.SSLOptions.Mode := sslmClient;

    HTTPClient := TIdHTTP.Create(nil);
    try
      ResquestData := TStringStream.Create('{"contents": [{"parts":[{"text": "'
        + TNetEncoding.URL.Encode(mRequest.Lines.Text) + '"}]}]}');
      ResponseData := HTTPClient.Post(API_URL, ResquestData);
      if HTTPClient.ResponseCode = 200 then
      begin
        JsonValue := TJsonObject.ParseJSONValue(ResponseData);

        if JsonValue is TJsonObject then
        begin
          JsonArray := (JsonValue as TJsonObject).GetValue<TJsonArray>
            ('candidates');
          for i := 0 to JsonArray.Count - 1 do
          begin
            JsonObj := JsonArray.Items[i].GetValue<TJsonObject>('content');
            PartsArray := JsonObj.GetValue<TJsonArray>('parts');
            for j := 0 to PartsArray.Count - 1 do
            begin
              PartsObj := PartsArray.Items[j] as TJsonObject;
              JsonText := PartsObj.GetValue<string>('text');
              mResponse.Lines.Text := JsonText;
            end;
          end;
        end;
      end;
    finally
      JsonValue.Free;
      ResquestData.Free;
    end;
  finally
    SSLHandler.Free;
    HTTPClient.Free;
  end;
end;

procedure TFrmPrincipal.Label18Click(Sender: TObject);
begin
  mRequest.Lines.Clear;
end;

end.
