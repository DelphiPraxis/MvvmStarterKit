unit Model.Config;

interface

uses
  System.SysUtils,
  System.UITypes,
  System.Generics.Collections,
  Grijjy.Mvvm.Observable,
  Model.View
  ;

type
  TConfig = class(TgoObservable)
    {$REGION 'Internal Declarations'}
  private
    FProjectName: string;
    FPath: string;
    FPathModels: string;
    FPathViewModels: string;
    FPathTemplates: string;
	FModel: string;
    FViews: TMViews;
    {$ENDREGION 'Internal Declarations'}
  public
    constructor Create;
    destructor Destroy; override;

    procedure SetProjectName( aPName: string);
    procedure SetPath( aValue: string);
    procedure SetPathModels( aValue: string);
	  procedure SetPathViewModels( aValue: string);
	  procedure SetPathTemplates( aValue: string);
  	procedure AddView(aViewName, aViewUnitName, aViewModelName : string);
  public
    property ProjectName: string read FProjectName write SetProjectName;
    property Path: string read FPath write SetPath;
    property PathModels: string read FPathModels write SetPathModels;
    property PathViewModels: string read FPathViewModels write SetPathViewModels;
    property PathTemplates: string read FPathTemplates write SetPathTemplates;
	  property Views: TMViews read FViews;
  end;

implementation

constructor TConfig.Create;
begin
  inherited Create;
end;

destructor TConfig.Destroy;
begin
  inherited Destroy;
end;

procedure TConfig.SetProjectName(aPName: string);
begin
  FProjectName := aPName;
  PropertyChanged('ProjectNameChanged');
end;

procedure TConfig.SetPath( aValue: string);
begin
  FPath := aValue;
  PropertyChanged('BasePathChanged');
end;

procedure TConfig.SetPathModels( aValue: string);
begin
  FPathModels := aValue;
  PropertyChanged('ModelpathChanged');
end;

procedure TConfig.SetPathViewModels( aValue: string);
begin
  FPathViewModels := aValue;
  PropertyChanged('ViewModelpathChanged');
end;

procedure TConfig.SetPathTemplates( aValue: string);
begin
  FPathTemplates := aValue;
  PropertyChanged('TemplatepathChanged');
end;

procedure TConfig.AddView(aViewName, aViewUnitName, aViewModelName : string);
var
  tmpView: TMView;
begin
  tmpView := TMView.Create;
  tmpView.ViewName := aViewName;
  tmpView.ViewUnitName := aViewUnitName;
  tmpView.ViewModelName := aViewModelName;
  FViews.Add( tmpView);
end;

end.
