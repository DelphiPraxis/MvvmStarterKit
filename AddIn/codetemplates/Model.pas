unit Model;

interface

uses
  System.Generics.Collections,

  {%%modelunits%%}

type
  { The "master" model that manages other models.
    This is a singleton, which you access through the Instance property. }
  TModel = class
  {$REGION 'Internal Declarations'}
  private class var
    FInstance: TModel;
    FDestroyed: Boolean;
  private
    class function GetInstance: TModel; inline; static;

  private
    constructor CreateSingleton(const ADummy: Integer = 0);
  public
    class constructor Create;
    class destructor Destroy;
  {$ENDREGION 'Internal Declarations'}
  private
    {%%modelclasses%%}
    {%%modelmakers%%}
  public
    constructor Create;
    destructor Destroy; override;

    class property Instance: TModel read GetInstance;
    
    { Bindable properties }
    {%%classproperties%%}
  end;

implementation

uses
  System.Classes,
  System.SysUtils,
  System.TimeSpan,
  System.Generics.Defaults
  ;

{ TModel }

class constructor TModel.Create;
begin
  FInstance := nil;
  FDestroyed := False;
end;

constructor TModel.Create;
begin
  Assert(False, 'Do not create a TModel manually. Use TModel.Instance instead.');
end;

constructor TModel.CreateSingleton(const ADummy: Integer = 0);
{ The ADummy parameter is to avoid the compiler warning:
    Duplicate constructor 'TModel.Create' with identical parameters will be inacessible from C++ }
begin
  inherited Create;
 
  {%%modelcreation%%}

  {%%callmodelmakers%%}
end;

destructor TModel.Destroy;
begin
   
  {%%modeldestroy%%}
  inherited;
end;

class destructor TModel.Destroy;
begin
  FDestroyed := True;
  FreeAndNil(FInstance);
end;

class function TModel.GetInstance: TModel;
begin
  if (FInstance = nil) then
  begin
    Assert(not FDestroyed, 'Should not access model after it has been destroyed');
    FInstance := TModel.CreateSingleton;
  end;
  Result := FInstance;
end;

{%%modelmakersimpl%%}

end.
