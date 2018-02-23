unit ViewModel.Demo;

interface

uses
  System.UITypes,
  System.SysUtils,
  System.Generics.Collections,
  Grijjy.Mvvm.Observable,
  Model.Node;

type
  TViewModelDemo = class(TgoObservable)
  {$REGION 'Internal Declarations'}
  private
    FNodes: TNodes;
    FSelectedNode: TNode;
    FNodeChanged: Boolean;
    FsRich: string;
    function GetNodes: TEnumerable<TNode>;
    procedure SetSelectedNode(const Value: TNode);
    procedure SetText( const Value: string);
  private
    function GetCanDeleteNode: Boolean;
    function GetCanEditNode: Boolean;
    function GetNodeChanged: Boolean;
  {$ENDREGION 'Internal Declarations'}
  public
    constructor Create(const ANodes: TNodes);

    { Actions }
    procedure AddNode;
    procedure DeleteNode;
    procedure EditNode;

    { Bindable properties }
    property Nodes: TEnumerable<TNode> read GetNodes;
    property SelectedNode: TNode read FSelectedNode write SetSelectedNode;
    property CanDeleteNode: Boolean read GetCanDeleteNode;
    property CanEditNode: Boolean read GetCanEditNode;
    property NodeChanged: Boolean read GetNodeChanged;
    property sRich: string read FsRich write SetText;
  end;

implementation

uses
  Grijjy.Mvvm.Types,
  Grijjy.Mvvm.ViewFactory;

{ TViewModelAuswahl }

constructor TViewModelDemo.Create(const ANodes: TNodes);
begin
  Assert(Assigned(ANodes));
  inherited Create;
  FNodes := ANodes;
end;

procedure TViewModelDemo.AddNode;
var
  Node: TNode;
begin
  Node := TNode.Create;
  try
 
  except
    Node.DisposeOf;
    raise;
  end;
end;

procedure TViewModelDemo.DeleteNode;
begin
  Assert(Assigned(FSelectedNode));
  FNodes.Remove(FSelectedNode);
  SetSelectedNode(nil);
end;

procedure TViewModelDemo.EditNode;
var
  Clone: TNode;
begin
  Assert(Assigned(FSelectedNode));
  Clone := TNode.Create;
  try
    Clone.Assign(FSelectedNode);

  except
    Clone.DisposeOf;
    raise;
  end;
end;

function TViewModelDemo.GetNodes: TEnumerable<TNode>;
begin
  Result := FNodes;
end;

function TViewModelDemo.GetCanDeleteNode: Boolean;
begin
  Result := Assigned(FSelectedNode);
end;

function TViewModelDemo.GetCanEditNode: Boolean;
begin
  Result := Assigned(FSelectedNode);
end;

function TViewModelDemo.GetNodeChanged: Boolean;
begin
  Result := FNodeChanged;
end;

procedure TViewModelDemo.SetSelectedNode(const Value: TNode);
begin
  if (Value <> FSelectedNode) then
  begin
    FSelectedNode := Value;
    PropertyChanged('SelectedNode');
    PropertyChanged('CanDeleteNode');
    PropertyChanged('CanEditNode');
    PropertyChanged('NodeChanged');
    FNodeChanged := True;
  end
  else
    FNodeChanged := False;
end;

procedure TViewModelDemo.SetText(const Value: string);
begin
  if (Value <> FsRich) then
  begin
    FsRich := Value;
    PropertyChanged('TextChanged');
  end;
end;

end.
