program MVVMDemo;

uses
  Vcl.Forms,
  View.Demo in 'View\View.Demo.pas' {ViewDemo},
  Model.Node in '..\Shared\Model\Model.Node.pas',
  Model in '..\Shared\Model\Model.pas',
  Template.Node in '..\Shared\Template\Template.Node.pas',
  ViewModel.Demo in '..\Shared\ViewModel\ViewModel.Demo.pas',
  Model.Entry in '..\Shared\Model\Model.Entry.pas',
  Template.Entry in '..\Shared\Template\Template.Entry.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TViewDemo, ViewDemo);
  Application.Run;
end.
