unit View.Demo;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.TabControl, FMX.Layouts, FMX.TreeView,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.ListBox
  ,Grijjy.Mvvm.Controls.Fmx // MUST be listed AFTER all other FMX.* units!
  ,Grijjy.Mvvm.Views.Fmx
  ,ViewModel.Demo;

type
  TViewDemo = class(TgoFormView<TViewModelDemo>)
    Panel: TTabControl;
    TabItem1: TTabItem;
    TabItem2: TTabItem;
    TabItem3: TTabItem;
    Panel1: TPanel;
    Panel2: TPanel;
    tvDemo: TTreeView;
    Panel3: TPanel;
    lblDisplay: TLabel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    cbDemo: TComboBox;
    Label1: TLabel;
    lblCombo: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure tvDemoChange(Sender: TObject);
  private
    { Private-Deklarationen }
  protected
      { TgoFormView }
    procedure SetupView; override;
  public
    { Public-Deklarationen }
  end;

var
  ViewDemo: TViewDemo;

implementation

{$R *.fmx}

uses
  Grijjy.Mvvm.DataBinding,
  Grijjy.Mvvm.ValueConverters,
  Model.Node,
  Model.Entry,
  Model,
  Template.Node, Template.Entry
  ;

procedure TViewDemo.FormCreate(Sender: TObject);
begin
  inherited;
  ReportMemoryLeaksOnShutdown := True;
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
  Binder.Bind(ViewModel, 'SelectedNode.Bez', lblDisplay, 'Text', TgoBindDirection.OneWay);

  //RichEdit
//  Binder.Bind(ViewModel, 'sRich', redtDemo, 'Text');

  //ComboBox
  Binder.Bind(ViewModel, 'SelectedEntry', cbDemo, 'SelectedItem');
  Binder.Bind(ViewModel, 'SelectedEntry.Text', lblCombo, 'Text', TgoBindDirection.OneWay);

  { Bind collections }

  //TreeView
  Binder.BindCollection<TNode>(ViewModel.Nodes, tvDemo, TTemplateNode);

  //ComboBox
  Binder.BindCollection<TEntry>(ViewModel.Entries, cbDemo, TTemplateEntry);

  { Bind actions }
end;

procedure TViewDemo.tvDemoChange(Sender: TObject);
begin
  Caption := 'TreeView Changed';
end;

end.
