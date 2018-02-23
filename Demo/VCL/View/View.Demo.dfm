object ViewDemo: TViewDemo
  Left = 0
  Top = 0
  Caption = 'Demo '
  ClientHeight = 490
  ClientWidth = 501
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object pgc1: TPageControl
    Left = 0
    Top = 0
    Width = 501
    Height = 490
    ActivePage = ts2
    Align = alClient
    TabOrder = 0
    object ts1: TTabSheet
      Caption = 'TreeView'
      object pnl1: TPanel
        Left = 0
        Top = 0
        Width = 493
        Height = 462
        Align = alClient
        TabOrder = 0
        object pnl2: TPanel
          Left = 1
          Top = 1
          Width = 491
          Height = 34
          Align = alTop
          Color = clAppWorkSpace
          ParentBackground = False
          TabOrder = 0
        end
        object pnl3: TPanel
          Left = 1
          Top = 427
          Width = 491
          Height = 34
          Align = alBottom
          Color = clAppWorkSpace
          ParentBackground = False
          TabOrder = 1
          object lblDisplay: TLabel
            Left = 1
            Top = 1
            Width = 489
            Height = 32
            Align = alClient
            Alignment = taCenter
            ExplicitWidth = 3
            ExplicitHeight = 13
          end
        end
        object tvDemo: TTreeView
          Left = 1
          Top = 35
          Width = 491
          Height = 392
          Align = alClient
          Indent = 19
          TabOrder = 2
        end
      end
    end
    object ts2: TTabSheet
      Caption = 'RichEdit'
      ImageIndex = 1
      object pnl4: TPanel
        Left = 0
        Top = 0
        Width = 493
        Height = 34
        Align = alTop
        TabOrder = 0
      end
      object pnl5: TPanel
        Left = 0
        Top = 428
        Width = 493
        Height = 34
        Align = alBottom
        TabOrder = 1
      end
      object redtDemo: TRichEdit
        Left = 0
        Top = 34
        Width = 493
        Height = 394
        Align = alClient
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Lines.Strings = (
          '')
        ParentFont = False
        TabOrder = 2
        Zoom = 100
      end
    end
  end
end
