unit Model.Defaults;

interface

uses
  System.SysUtils,
  System.UITypes,
  System.Generics.Collections,
  Grijjy.Mvvm.Observable
  ;

type
  
  TDefConfig = class(TgoObservable)
    {$REGION 'Internal Declarations'}
  private
    FPathModels: string;
    FPathViewModels: string;
    FPathTemplates: string;
    {$ENDREGION 'Internal Declarations'}
  public
    constructor Create;
    destructor Destroy; override;
    procedure Assign(const ASource: TDefConfig);
	 
    procedure SetPathModels( aValue: string);
	  procedure SetPathViewModels( aValue: string);
	  procedure SetPathTemplates( aValue: string);
  public
    property PathModels: string read FPathModels write SetPathModels;
    property PathViewModels: string read FPathViewModels write SetPathViewModels;
    property PathTemplates: string read FPathTemplates write SetPathTemplates;
 end;

implementation

{ TDefConfig }

constructor TDefConfig.Create;
begin
  inherited Create;
end;

destructor TDefConfig.Destroy;
begin
  inherited Destroy;
end;

procedure TDefConfig.Assign(const ASource: TDefConfig);
begin
  Assert(Assigned(ASource));
  { Important: do not assign to fields. Assign to properties instead, so it
    will fire PropertyChanged notifications. }
  PathModels := ASource.PathModels;
  PathViewModels := ASource.PathViewModels;
  PathTemplates := ASource.PathTemplates;
end;

procedure TDefConfig.SetPathModels( aValue: string);
begin
  FPathModels := aValue;
  PropertyChanged('DefModelpathChanged');
end;

procedure TDefConfig.SetPathViewModels( aValue: string);
begin
  FPathViewModels := aValue;
  PropertyChanged('DefViewModelpathChanged');
end;

procedure TDefConfig.SetPathTemplates( aValue: string);
begin
  FPathTemplates := aValue;
  PropertyChanged('DefTemplatepathChanged');
end;

end.
