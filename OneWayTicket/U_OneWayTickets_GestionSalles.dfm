object FrmGestionSalles: TFrmGestionSalles
  Left = 683
  Top = 203
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'OneWay Tickets - Gestion des salles'
  ClientHeight = 455
  ClientWidth = 324
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Arial'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 14
  object Label2: TLabel
    Left = 8
    Top = 8
    Width = 305
    Height = 22
    Alignment = taCenter
    AutoSize = False
    Caption = 'Gestion des salles'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LbxListeSalles: TListBox
    Left = 8
    Top = 40
    Width = 305
    Height = 233
    ItemHeight = 14
    Items.Strings = (
      
        '13                                                              ' +
        '                         250'
      
        '13                                                              ' +
        '                         250'
      
        '13                                                              ' +
        '                         250'
      
        '13                                                              ' +
        '                         250'
      
        '13                                                              ' +
        '                         250'
      
        '13                                                              ' +
        '                         250'
      ''
      '')
    TabOrder = 0
  end
  object BtnModifier: TButton
    Left = 8
    Top = 280
    Width = 97
    Height = 33
    Caption = 'Modifier'
    TabOrder = 1
    OnClick = BtnModifierClick
  end
  object BtnSupprimer: TButton
    Left = 112
    Top = 280
    Width = 97
    Height = 33
    Caption = 'Supprimer'
    Enabled = False
    TabOrder = 2
  end
  object BtnAjouter: TButton
    Left = 216
    Top = 280
    Width = 97
    Height = 33
    Caption = 'Ajouter'
    TabOrder = 3
    OnClick = BtnAjouterClick
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 328
    Width = 305
    Height = 121
    Caption = ' Modification '
    TabOrder = 4
    object Label1: TLabel
      Left = 8
      Top = 24
      Width = 92
      Height = 15
      Caption = 'Nom de la salle :'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 24
      Top = 56
      Width = 76
      Height = 15
      Caption = 'Places max. :'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtNomSalle: TEdit
      Left = 112
      Top = 20
      Width = 185
      Height = 22
      MaxLength = 20
      TabOrder = 0
      Text = '13'
    end
    object edtPlacesMax: TEdit
      Left = 112
      Top = 52
      Width = 185
      Height = 22
      MaxLength = 3
      TabOrder = 1
      Text = '250'
    end
    object BtnValiderModification: TButton
      Left = 8
      Top = 77
      Width = 137
      Height = 28
      Caption = 'Valider les modifications'
      Enabled = False
      TabOrder = 2
    end
    object BtnAnuuler: TButton
      Left = 160
      Top = 77
      Width = 137
      Height = 28
      Caption = 'Annuler les modifications'
      TabOrder = 3
      OnClick = BtnAnuulerClick
    end
  end
end
