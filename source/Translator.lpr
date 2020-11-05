program Translator;
{**
 * Mini Translator
 *
 * @license    GPL 2 (http://www.gnu.org/licenses/gpl.html)
 * @author    Zaher Dirkey <zaher at parmaja dot com>
 *}

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  SysUtils, Classes, Controls, Forms, AboutForms, OptionForms, LogForms,
  Setups, Main, trsProjects, NewProjectForms;

function CheckSetup: Boolean;
begin
  Result := True;
  if trsEngine.WorkPath = '' then
  begin
    Result := ShowSetup;
  end;
end;

{$R *.res}

begin
  Application.Scaled :=True;
  Application.Title :='Mini Translator';
  Application.Initialize;
  trsEngine.Init;
  if CheckSetup then
  begin
    Application.CreateForm(TMainForm, MainForm);
    Application.Run;
  end;
end.
