unit Template.Entry;

interface

uses
  Grijjy.Mvvm.Types,System.Generics.Collections;

type
  TTemplateEntry = class(TgoDataTemplate)
  public
    class function GetID(const AItem: TObject): Int64;
    class function GetTitle(const AItem: TObject): String; override;
  end;

implementation

uses
  Model.Entry;

{ TTemplateEntry }

class function TTemplateEntry.GetID(const AItem: TObject): Int64;
begin
  Assert(AItem is TEntry);
  Result := TEntry(AItem).ID;
end;

class function TTemplateEntry.GetTitle(const AItem: TObject): String;
begin
  Assert(AItem is TEntry);
  Result := TEntry(AItem).Text;
end;

end.
