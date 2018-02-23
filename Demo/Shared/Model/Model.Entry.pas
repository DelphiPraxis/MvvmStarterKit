unit Model.Entry;

interface

uses
  System.SysUtils,
  System.UITypes,
  System.Generics.Collections,
  Grijjy.Mvvm.Observable
  ;

type
 { A model that represents a Treenode }
  TEntry = class(TgoObservable)
  {$REGION 'Internal Declarations'}
  private
    FID: Int64;
    FText: String;
  {$ENDREGION 'Internal Declarations'}
  public
    constructor Create;
    destructor Destroy; override;
    procedure Assign(const ASource: TEntry);

    procedure SetID( Value: Int64);
    procedure SetText( Value: String);
  public
    property ID: Int64 read FID write SetID;
    property Text: String read FText write SetText;
  end;

  TEntries = class(TgoObservableCollection<TEntry>)
  public
    constructor Create;
    procedure Assign(const ASource: TEnumerable<TEntry>);
  end;

implementation

uses
  Grijjy.Mvvm.Types;

{ TNode }

procedure TEntry.Assign(const ASource: TEntry);
begin
  Assert(Assigned(ASource));
  { Important: do not assign to fields. Assign to properties instead, so it
    will fire PropertyChanged notifications. }
   ID := ASource.FID;
   Text := ASource.FText;
end;

constructor TEntry.Create;
begin
  inherited;
end;

destructor TEntry.Destroy;
begin
  inherited;
end;

procedure TEntry.SetID(Value: Int64);
begin
  FID := Value;
  PropertyChanged('IDChanged');
end;

procedure TEntry.SetText(Value: string);
begin
  FText := Value;
  PropertyChanged('TextChanged');
end;

{ TEntries }

procedure TEntries.Assign(const ASource: TEnumerable<TEntry>);
var
  Src, Dst: TEntry;
begin
  Clear;
  for Src in ASource do
  begin
    Dst := TEntry.Create;
    Dst.Assign(Src);
    Add(Dst);
  end;
end;

constructor TEntries.Create;
begin
  inherited Create(True);
end;


end.
