unit Model.View;

interface

uses
  System.SysUtils,
  System.UITypes,
  System.Generics.Collections,
  Grijjy.Mvvm.Observable
  ;

type
  TMViews = class; //forward declaraion
  
  TMView = class(TgoObservable)
    {$REGION 'Internal Declarations'}
  private
    FViewName: string;
    FViewUnitName: string;
    FViewModelName: string;
    {$ENDREGION 'Internal Declarations'}
  public
    constructor Create;
    destructor Destroy; override;
     procedure Assign(const ASource: TMView);
	 
    procedure SetViewName( aViewName: string);
    procedure SetViewUnitName( aUnitName: string);
    procedure SetViewModelName( aViewModelName: string);
  public
    property ViewName: string read FViewName write SetViewName;
    property ViewUnitName: string read FViewUnitName write SetViewUnitName;
    property ViewModelName: string read FViewModelName write SetViewModelName;
  end;

  TMViews = class(TgoObservableCollection<TMView>)
  public
    constructor Create;
    destructor Destroy; overload;
    procedure Assign(const ASource: TEnumerable<TMView>);
  end;  
  
implementation

{ TMView }

constructor TMView.Create;
begin
  inherited Create;
end;

destructor TMView.Destroy;
begin
  inherited Destroy;
end;

procedure TMView.Assign(const ASource: TMView);
begin
  Assert(Assigned(ASource));
  { Important: do not assign to fields. Assign to properties instead, so it
    will fire PropertyChanged notifications. }
  ViewName := ASource.ViewName;
end;

procedure TMView.SetViewUnitName( aUnitName: string);
begin
  FViewUnitName := aUnitName;
  PropertyChanged('ViewUnitNameChanged');
end;

procedure TMView.SetViewName( aViewName: string);
begin
  FViewName := aViewName;
  PropertyChanged('ViewNameChanged');
end;

procedure TMView.SetViewModelName( aViewModelName: string);
begin
  FViewModelName := aViewModelName;
  PropertyChanged('ViewModelNameChanged');
end;

{ TMViews }

constructor TMViews.Create;
begin
  inherited Create(True);
end;

destructor TMViews.Destroy;
begin
  inherited;
end;

procedure TMViews.Assign(const ASource: TEnumerable<TMView>);
var
  SrcView, DstView: TMView;
begin
  Clear;
  for SrcView in ASource do
  begin
    DstView := TMView.Create;
    DstView.Assign(SrcView);
    Add(DstView);
  end;
end;

end.
