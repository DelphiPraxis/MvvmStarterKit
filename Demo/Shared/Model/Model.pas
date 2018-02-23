unit Model;

interface

uses
  System.Generics.Collections,

  Model.Node;

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
    FNodes: TNodes;
  private
    constructor CreateSingleton(const ADummy: Integer = 0);

    procedure MakeNodes;
  public
    class constructor Create;
    class destructor Destroy;
  {$ENDREGION 'Internal Declarations'}
  public
    constructor Create;
    destructor Destroy; override;

    class property Instance: TModel read GetInstance;
    
    { Bindable properties }
    property Nodes: TNodes read FNodes;
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
 
  FNodes := TNodes.Create;

  MakeNodes;
end;

destructor TModel.Destroy;
begin
  //FNodes.Free;
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

procedure TModel.MakeNodes;
var
  Node, Parent: Model.Node.TNode;
  i,j: Integer;

  function CreateNode( aParent: TNode; aID: Int64; aBez: string): TNode;
  var
    Node_: TNode;
  begin
      Node_ := Model.Node.TNode.Create;
      Node_.ID := aID;
      Node_.Bez := aBez;
      Node_.Parent := aParent;
      if Assigned(aParent) then
        aParent.Children.Add( Node_);
      Result := Node_;
  end;

begin
      Parent := CreateNode( nil, 0, ''); //Root
      Nodes.Add( Parent);
      for i  := 1 to 5 do
      begin
        Node := CreateNode( Parent, i, Format( '%d', [i]));
       for j := 1 to i+1 do
        begin
          CreateNode( Node, j,  Format( '%d.%d', [i, j]));
        end;
      end;
end;

end.
