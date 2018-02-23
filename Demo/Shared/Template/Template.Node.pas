unit Template.Node;

interface

uses
  Grijjy.Mvvm.Types,System.Generics.Collections;

type
  TTemplateNode = class(TgoDataTemplate)
  public
    class function GetTitle(const AItem: TObject): String; override;
    class function GetParent(const AItem: TObject): TObject; override;
    class function GetChildren( const AItem: TObject): Tlist<TObject>; override;
  end;

implementation

uses
  Model.Node;

{ TTemplateNode }

class function TTemplateNode.GetTitle(const AItem: TObject): String;
begin
  Assert(AItem is TNode);
  Result := TNode(AItem).Bez;
end;

class function TTemplateNode.GetParent(const AItem: TObject): TObject;
begin
  Assert(AItem is TNode);
  Result := TNode(AItem).Parent;
end;

class function TTemplateNode.GetChildren( const AItem: TObject): TList<TObject>;
var
  node: TNode;
begin
  Assert(AItem is TNode);
  Result := TList<TObject>.Create;
  for node in TNode(AItem).Children do
  begin
    Result.Add( TObject( Node));
  end;
end;

end.
