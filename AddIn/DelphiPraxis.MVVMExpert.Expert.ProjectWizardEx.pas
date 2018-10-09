{ *************************************************************************** }
{ }
{ Delphi MVC Framework }
{ }
{ Copyright (c) 2010-2017 Daniele Teti and the DMVCFramework Team }
{ }
{ https://github.com/danieleteti/delphimvcframework }
{ }
{ *************************************************************************** }
unit DelphiPraxis.MVVMExpert.Expert.ProjectWizardEx;

interface

uses
  ToolsApi,
  VCL.Graphics,
  PlatformAPI;

type
  TDPMVVMCNewProjectWizard = class
  private
    class function GetUnitName(aFilename: string): string;
  public
    class procedure RegisterDPMVVMProjectWizard(const APersonality: string);
  end;

implementation

uses
  DccStrs,
  System.IOUtils,
  VCL.Controls,
  VCL.Forms,
  WinApi.Windows,
  System.SysUtils,
  DelphiPraxis.MVVMExpert.View,
  {DMVC.Expert.Forms.NewProjectWizard,
  DMVC.Expert.CodeGen.NewDMVCProject,
  DMVC.Expert.CodeGen.NewControllerUnit,
  DMVC.Expert.CodeGen.NewWebModuleUnit,}
  ExpertsRepository;

resourcestring
  sNewDMVCProjectCaption = 'DelphiPraxis.MVVMExpert Project';
  sNewDMVCProjectHint = 'Create New MVVM Project';

  { TDUnitXNewProjectWizard }

class function TDPMVVMCNewProjectWizard.GetUnitName(aFilename: string): string;
begin
  Result := TPath.GetFileNameWithoutExtension(aFilename);
end;

class procedure TDPMVVMCNewProjectWizard.RegisterDPMVVMProjectWizard(const APersonality: string);
begin
  RegisterPackageWizard(TExpertsRepositoryProjectWizardWithProc.Create(APersonality, sNewDMVCProjectHint, sNewDMVCProjectCaption,
    'DelphiPraxis.MVVMExpert..Wizard.NewProjectWizard', // do not localize
    'DelphiPraxis MVVM Expert', 'https://github.com/DelphiPraxis/MvvmStarterKit', // do not localize
    procedure
    var
      WizardForm: TMainView;
      ModuleServices: IOTAModuleServices;
      Project: IOTAProject;
      Config: IOTABuildConfiguration;
      ControllerUnit: IOTAModule;
      WebModuleUnit: IOTAModule;
      ControllerCreator: IOTACreator;
      WebModuleCreator: IOTAModuleCreator;
      lProjectSourceCreator: IOTACreator;
    begin
      WizardForm := TMainView.Create(Application);
      try
        if WizardForm.ShowModal = mrOk then
        begin
{          if not WizardForm.AddToProjectGroup then
          begin
            (BorlandIDEServices as IOTAModuleServices).CloseAll;
          end;
          ModuleServices := (BorlandIDEServices as IOTAModuleServices);

          // Create Project Source
          lProjectSourceCreator := TDMVCProjectFile.Create(APersonality);
          TDMVCProjectFile(lProjectSourceCreator).DefaultPort := WizardForm.ServerPort;
          ModuleServices.CreateModule(lProjectSourceCreator);
          Project := GetActiveProject;

          Config := (Project.ProjectOptions as IOTAProjectOptionsConfigurations).BaseConfiguration;
          Config.SetValue(sUnitSearchPath, '$(DMVC)');
          Config.SetValue(sFramework, 'VCL');

          // Create Controller Unit
          if WizardForm.CreateControllerUnit then
          begin
            ControllerCreator := TNewControllerUnitEx.Create(WizardForm.CreateIndexMethod, WizardForm.CreateCRUDMethods,
              WizardForm.CreateActionFiltersMethods, WizardForm.ControllerClassName, APersonality);
            ControllerUnit := ModuleServices.CreateModule(ControllerCreator);
            if Project <> nil then
            begin
              Project.AddFile(ControllerUnit.FileName, True);
            end;
          end;

          // Create Webmodule Unit
          WebModuleCreator := TNewWebModuleUnitEx.Create(WizardForm.WebModuleClassName, WizardForm.ControllerClassName,
            GetUnitName(ControllerUnit.FileName), WizardForm.Middlewares, APersonality);
          WebModuleUnit := ModuleServices.CreateModule(WebModuleCreator);
          if Project <> nil then
          begin
            Project.AddFile(WebModuleUnit.FileName, True);
          end;   }
        end;
      finally
        WizardForm.Free;
      end;
    end,
    function: Cardinal
    begin
      Result := LoadIcon(HInstance, 'DMVCNewProjectIcon');
    end, TArray<string>.Create(cWin32Platform, cWin64Platform), nil));
end;

end.
