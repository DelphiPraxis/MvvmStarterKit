unit DelphiPraxis.MVVMExpert.Splash.Registration;

interface

uses
  Winapi.Windows;

var
  bmSplashScreen: HBITMAP;
  // iAboutPluginIndex: Integer = 0;

implementation

uses
  ToolsAPI, SysUtils, Vcl.Dialogs;

resourcestring
  resPackageName = 'DelphiPraxis MVVM Expert v.0.0.1';
  resLicense = 'Apache License, Version 2.0';
  resAboutCopyright = 'Copyright DelphiPraxis';
  resAboutTitle = 'DelphiPraxis.MVVM_Expert';
  resAboutDescription = 'https://github.com/DelphiPraxis/MvvmStarterKit';

initialization

bmSplashScreen := LoadBitmap(hInstance, 'SplashScreen');
(SplashScreenServices as IOTASplashScreenServices).AddPluginBitmap(
  resPackageName,
  bmSplashScreen,
  False,
  resLicense);

finalization


// Remove Aboutbox Plugin Interface
// if iAboutPluginIndex > 0 then
// (BorlandIDEServices as IOTAAboutBoxServices).RemovePluginInfo(iAboutPluginIndex);

end.
