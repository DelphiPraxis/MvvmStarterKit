unit View.Demo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.StdCtrls
  ,Grijjy.Mvvm.Controls.Vcl // MUST be listed AFTER all other FMX.* units!
  ,Grijjy.Mvvm.Views.Vcl
  ,ViewModel.Demo
  ;

type
  TViewDemo = class(TgoFormView<TViewModelDemo>)
    pgc1: TPageControl;
    ts1: TTabSheet;
    pnl1: TPanel;
    pnl2: TPanel;
    pnl3: TPanel;
    tvDemo: TTreeView;
    lblDisplay: TLabel;
    ts2: TTabSheet;
    pnl4: TPanel;
    pnl5: TPanel;
    redtDemo: TRichEdit;
    ts3: TTabSheet;
    pnl6: TPanel;
    pnl7: TPanel;
    cbDemo: TComboBox;
    lbl1: TLabel;
    lblCombo: TLabel;
  private
    { Private-Deklarationen }

  protected
    { TgoFormView }
    procedure SetupView; override;
  public
    { Public-Deklarationen }
    constructor Create(AOwner: TComponent); override;
  end;

var
  ViewDemo: TViewDemo;

implementation

{$R *.dfm}

Uses
  Grijjy.Mvvm.DataBinding,
  Grijjy.Mvvm.ValueConverters,
  Model.Node,
  Model.Entry,
  Model,
  Template.Node, Template.Entry
  ;

constructor TViewDemo.Create(AOwner: TComponent);
begin
  inherited;
  //ReportMemoryLeaksOnShutdown := True;
  InitView(TViewModelDemo.Create(TModel.Instance), True)
end;

procedure TViewDemo.SetupView;
begin

  inherited;

  ViewModel.sRich :=
           '{\rtf1\ansi\ansicpg1252\deff0\nouicompat\deflang1031{\fonttbl{\f0\fnil\fcharset0 Calibri;}{\f1\fnil\fcharset0 Arial;}}'+
           '{\colortbl ;\red0\green176\blue80;}'+
           '{\*\generator Riched20 10.0.14393}\viewkind4\uc1'+
           '\pard\sa200\sl276\slmult1\b\f0\fs22\lang7 This\b0  \i is\i0  \ul a\ulnone  \cf1 very \cf0\fs32 rich\fs22  \f1\fs24 text to show\f0\fs22\par'+
           'all \strike possible features\strike0\par'+
           '}';

  { Bind properties }

  //TreeView
  Binder.Bind(ViewModel, 'SelectedNode', tvDemo, 'SelectedNode');
  Binder.Bind(ViewModel, 'SelectedNode.Bez', lblDisplay, 'Caption', TgoBindDirection.OneWay);

  //RichEdit
  Binder.Bind(ViewModel, 'sRich', redtDemo, 'Text');

  //ComboBox
  Binder.Bind(ViewModel, 'SelectedEntry', cbDemo, 'SelectedItem');
  Binder.Bind(ViewModel, 'SelectedEntry.Text', lblCombo, 'Caption', TgoBindDirection.OneWay);

  { Bind collections }

  //TreeView
  Binder.BindCollection<TNode>(ViewModel.Nodes, tvDemo, TTemplateNode);

  //ComboBox
  Binder.BindCollection<TEntry>(ViewModel.Entries, cbDemo, TTemplateEntry);

  { Bind actions }
end;

end.
