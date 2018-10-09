unit DelphiPraxis.MVVMExpert.Expert.Registration;

{ .$R 'SplashScreenIcon.RES' }

interface

// Note: "Register" method name is case senstive.
procedure Register;

implementation

uses
  ToolsApi,
  DesignIntf,
  System.SysUtils,
  Winapi.Windows,
  DelphiPraxis.MVVMExpert.Expert.ProjectWizardEx;

procedure Register;
begin
  ForceDemandLoadState(dlDisable);
  TDPMVVMCNewProjectWizard.RegisterDPMVVMProjectWizard(sDelphiPersonality);
  //TDMVCNewUnitWizard.RegisterDMVCNewUnitWizard(sDelphiPersonality);
end;

// procedure RegisterSplashScreen;
// var
// LBmp: Vcl.Graphics.TBitmap;
// begin
// LBmp := Vcl.Graphics.TBitmap.Create;
// LBmp.LoadFromResourceName(HInstance, 'SPLASH');
// SplashScreenServices.AddPluginBitmap(resPackageName, LBmp.Handle, False, resLicense, '');
// LBmp.Free;
// end;
//
// procedure RegisterAboutBox;
// var
// LProductImage: HBITMAP;
// begin
// Supports(BorlandIDEServices, IOTAAboutBoxServices, AboutBoxServices);
// LProductImage := LoadBitmap(FindResourceHInstance(HInstance), 'SPLASH');
// AboutBoxIndex := AboutBoxServices.AddPluginInfo(resPackageName, resAboutDescription, LProductImage, False, resLicense);
// end;
//
// procedure UnregisterAboutBox;
// begin
// if (AboutBoxIndex = 0) and Assigned(AboutBoxServices) then
// begin
// AboutBoxServices.RemovePluginInfo(AboutBoxIndex);
// AboutBoxIndex := 0;
// AboutBoxServices := nil;
// end;
// end;

initialization

finalization

end.
