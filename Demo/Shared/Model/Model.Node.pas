unit Model.Node;

interface

uses
  System.SysUtils,
  System.UITypes,
  System.Generics.Collections,
  Grijjy.Mvvm.Observable
  ;

type
  TNodes = class; //forward declaration
 { A model that represents a Treenode }
  TNode = class(TgoObservable)
  {$REGION 'Internal Declarations'}
  private
    FID: Int64;
    FBez: String;
    FParent: TNode;
    fChildren: TNodes;
  {$ENDREGION 'Internal Declarations'}
  public
    constructor Create;
    destructor Destroy; override;
    procedure Assign(const ASource: TNode);

    procedure SetBez( ABez: string);
    procedure SetParent( AParent: TNode);
    function GetChildren: TNodes;
    procedure SetChildren( const ANodes: TNodes);
    { Bindable properties }
    property ID: Int64 read FID write FID;
    property Bez: String read FBez write FBez;
    property Parent: TNode read FParent write SetParent;
    property Children: TNodes read GetChildren write SetChildren;

  end;

  TNodes = class(TgoObservableCollection<TNode>)
  public
    constructor Create;
    destructor Destroy; overload;
    procedure Assign(const ASource: TEnumerable<TNode>);
  end;

implementation

uses
  Grijjy.Mvvm.Types;

{ TNode }

procedure TNode.Assign(const ASource: TNode);
begin
  Assert(Assigned(ASource));
  { Important: do not assign to fields. Assign to properties instead, so it
    will fire PropertyChanged notifications. }
   Bez := ASource.FBez;
   Parent := ASource.Parent;
   Children.Assign(ASource.FChildren);
end;

constructor TNode.Create;
begin
  inherited;
  FChildren := TNodes.Create;
end;

destructor TNode.Destroy;
begin
  Children.Free;
  inherited;
end;

procedure TNode.SetBez(ABez: string);
begin
  FBez := ABez;
  PropertyChanged('Bez');
end;

procedure TNode.SetParent(AParent: TNode);
begin
  FParent := AParent;
  PropertyChanged('Parent');
end;

function TNode.GetChildren: TNodes;
begin
  Result := FChildren;
end;


procedure TNode.SetChildren( const ANodes: TNodes);
begin
  if Assigned(ANodes) then
  begin
    FChildren.Assign(ANodes);
    PropertyChanged('ChildCount');
  end;
end;


{ TNodes }

procedure TNodes.Assign(const ASource: TEnumerable<TNode>);
var
  SrcNode, DstNode: TNode;
begin
  Clear;
  for SrcNode in ASource do
  begin
    DstNode := TNode.Create;
    DstNode.Assign(SrcNode);
    Add(DstNode);
  end;
end;

constructor TNodes.Create;
begin
  inherited Create(True);
end;

destructor TNodes.Destroy;
begin

end;
end.
