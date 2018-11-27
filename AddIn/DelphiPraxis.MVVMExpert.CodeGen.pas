unit DelphiPraxis.MVVMExpert.CodeGen;

interface

uses
  System.Generics.Collections,
  Model, Model.Config, Model.View;
type
  TCodeGen = class
  private
    FDict: TDictionary<string, string>;
  public
    constructor Create( aModel: TModel);
    procedure RecreateDict( aViewModel: TMView);
  end;

implementation

constructor TCodeGen.Create( aModel: TModel);
begin
  inherited Create;
  FDict := TDictionary<string,string>.Create;
end;

procedure TCodeGen.RecreateDict( aViewModel: TMView);
var
  Model: TModel;
  cfg: TConfig;
begin
  //ProjectValues
  Model := TModel.Instance;
  cfg := Model.Config;
  FDict.AddOrSetValue( '%%basepath%%', cfg.Path);
  FDict.AddOrSetValue( '%%basepath%%', cfg.Path);

  //ViewValues
  FDict.AddOrSetValue( '%%ViewModelunit%%', aViewModel.ViewUnitName);
  FDict.AddOrSetValue( '%%viewname%%', aViewModel.ViewName);
  FDict.AddOrSetValue( '%%ViewModelunit%%', aViewModel.ViewUnitName);
end;

end.
