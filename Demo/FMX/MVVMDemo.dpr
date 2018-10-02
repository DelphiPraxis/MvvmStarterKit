program MVVMDemo;

uses
  System.StartUpCopy,
  FMX.Forms,
  View.Demo in 'View\View.Demo.pas' {ViewDemo},
  ViewModel.Demo in '..\Shared\ViewModel\ViewModel.Demo.pas',
  Model.Entry in '..\Shared\Model\Model.Entry.pas',
  Model.Node in '..\Shared\Model\Model.Node.pas',
  Model in '..\Shared\Model\Model.pas',
  Template.Entry in '..\Shared\Template\Template.Entry.pas',
  Template.Node in '..\Shared\Template\Template.Node.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TViewDemo, ViewDemo);
  Application.Run;
end.
