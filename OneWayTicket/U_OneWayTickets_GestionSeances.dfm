object FrmGestionSeances: TFrmGestionSeances
  Left = 828
  Top = 191
  Width = 629
  Height = 553
  Caption = 'OneWay Tickets - Gestion des s�ances'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 593
    Height = 22
    Alignment = taCenter
    AutoSize = False
    Caption = 'Gestion des s�ances'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LbxListeSeances: TListBox
    Left = 8
    Top = 40
    Width = 593
    Height = 233
    ItemHeight = 13
    Items.Strings = (
      
        'The Hobbit                                   13                 ' +
        '                  lundi, mardi, mercredi                        ' +
        '           11:00, 14:30,  20:00    '
      
        'The Hobbit                                   13                 ' +
        '                  lundi, mardi, mercredi                        ' +
        '           11:00, 14:30,  20:0'
      
        'The Hobbit                                   13                 ' +
        '                  lundi, mardi, mercredi                        ' +
        '           11:00, 14:30,  20:0'
      
        'The Hobbit                                   13                 ' +
        '                  lundi, mardi, mercredi                        ' +
        '           11:00, 14:30,  20:0'
      
        'The Hobbit                                   13                 ' +
        '                  lundi, mardi, mercredi                        ' +
        '           11:00, 14:30,  20:0')
    TabOrder = 0
  end
  object BtnModifier: TButton
    Left = 8
    Top = 280
    Width = 193
    Height = 33
    Caption = 'Modifier'
    TabOrder = 1
  end
  object BtnSupprimer: TButton
    Left = 208
    Top = 280
    Width = 193
    Height = 33
    Caption = 'Supprimer'
    Enabled = False
    TabOrder = 2
  end
  object BtnAjouter: TButton
    Left = 408
    Top = 280
    Width = 193
    Height = 33
    Caption = 'Ajouter'
    TabOrder = 3
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 328
    Width = 593
    Height = 161
    Caption = ' Modification '
    TabOrder = 4
    object Label2: TLabel
      Left = 16
      Top = 24
      Width = 29
      Height = 15
      Caption = 'Film :'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 11
      Top = 56
      Width = 34
      Height = 15
      Caption = 'Salle :'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object BtnValiderModification: TButton
      Left = 440
      Top = 125
      Width = 145
      Height = 28
      Caption = 'Valider les modifications'
      Enabled = False
      TabOrder = 0
    end
    object BtnAnuuler: TButton
      Left = 440
      Top = 88
      Width = 145
      Height = 28
      Caption = 'Annuler les modifications'
      TabOrder = 1
    end
    object CbxFilm: TComboBox
      Left = 56
      Top = 24
      Width = 145
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 2
      Items.Strings = (
        'The Hobbit')
    end
    object CbxSalle: TComboBox
      Left = 56
      Top = 56
      Width = 145
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 3
      Items.Strings = (
        '13')
    end
  end
end
