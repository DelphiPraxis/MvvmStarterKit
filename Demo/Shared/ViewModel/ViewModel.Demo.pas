unit ViewModel.Demo;

interface

uses
  System.UITypes,
  System.SysUtils,
  System.Generics.Collections,
  Grijjy.Mvvm.Observable,
  Model.Node,
  Model.Entry,
  Model;

type
  TViewModelDemo = class(TgoObservable)
  {$REGION 'Internal Declarations'}
  private
    //TreeView
    FNodes: TNodes;
    FSelectedNode: TNode;
    FNodeChanged: Boolean;

    //RichEdit
    FsRich: string;

    //ComboBox
    FEntries: TEntries;
    FSelectedEntry: TEntry;

    //TreeView
    function GetNodes: TEnumerable<TNode>;
    procedure SetSelectedNode(const Value: TNode);

    //RichEdit
    procedure SetText( const Value: string);

    //ComboBox
    function GetEntries: TEnumerable<TEntry>;
    procedure SetSelectedEntry(const Value: TEntry);

  private
    function GetCanDeleteNode: Boolean;
    function GetCanEditNode: Boolean;
    function GetNodeChanged: Boolean;
  {$ENDREGION 'Internal Declarations'}
  public
    constructor Create(const Model: TModel);

    { Actions }
    procedure AddNode;
    procedure DeleteNode;
    procedure EditNode;

    { Bindable properties }

    //TreeView
    property Nodes: TEnumerable<TNode> read GetNodes;
    property SelectedNode: TNode read FSelectedNode write SetSelectedNode;
    property CanDeleteNode: Boolean read GetCanDeleteNode;
    property CanEditNode: Boolean read GetCanEditNode;
    property NodeChanged: Boolean read GetNodeChanged;

    //RichEdit
    property sRich: string read FsRich write SetText;

    //ComboBox
    property Entries: TEnumerable<TEntry> read GetEntries;
    property SelectedEntry: TEntry read FSelectedEntry write SetSelectedEntry;
  end;

implementation

uses
  Grijjy.Mvvm.Types,
  Grijjy.Mvvm.ViewFactory;

{ TViewModelAuswahl }

constructor TViewModelDemo.Create(const Model: TModel);
begin
  Assert(Assigned( Model));
  inherited Create;
  FNodes := Model.Nodes;
  FEntries := Model.Entries;
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

function TViewModelDemo.GetEntries: TEnumerable<TEntry>;
begin
  Result := FEntries;
end;

procedure TViewModelDemo.SetSelectedEntry(const Value: TEntry);
begin
  if (Value <> FSelectedEntry) then
  begin
    FSelectedEntry := Value;
    PropertyChanged('SelectedEntry');
  end;
end;

end.
