unit View;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs

  ,Grijjy.Mvvm.Controls.Vcl // MUST be listed AFTER all other VCL.* units!
  ,Grijjy.Mvvm.Views.Vcl
  ,{%%ViewModelunit%%};

type
  T{%%viewname%%} = class(TgoFormView<{%%viewmodelclass%%>})
  protected
    { TgoFormView }
    procedure SetupView; override;
  public
    { Public-Deklarationen }
    constructor Create(AOwner: TComponent); override;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

Uses
  Grijjy.Mvvm.DataBinding,
  Grijjy.Mvvm.ValueConverters,
  {%%modelunits%%}, Model,
  {%%templateunits%%};

constructor T{%%viewname%%}.Create(AOwner: TComponent);
begin
  inherited;
  ReportMemoryLeaksOnShutdown := True;
  InitView({%%viewmodelclass%%.Create(TModel.Instance), True)
end;

end.
