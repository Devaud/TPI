object FrmGestionFilms: TFrmGestionFilms
  Left = 328
  Top = 183
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'OneWay Tickets - Gestion des films'
  ClientHeight = 503
  ClientWidth = 465
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
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 449
    Height = 22
    Alignment = taCenter
    AutoSize = False
    Caption = 'Gestion des films'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LbxListeFilms: TListBox
    Left = 8
    Top = 40
    Width = 449
    Height = 233
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ItemHeight = 14
    Items.Strings = (
      
        'The Hobbit                                     169              ' +
        '                      lorem ipsum'
      
        'The Hobbit                                  169                 ' +
        '                lorem ipsum'
      
        'The Hobbit                                  169                 ' +
        '                lorem ipsum'
      
        'The Hobbit                                  169                 ' +
        '                lorem ipsum'
      
        'The Hobbit                                  169                 ' +
        '                lorem ipsum'
      
        'The Hobbit                                  169                 ' +
        '                lorem ipsum'
      
        'The Hobbit                                  169                 ' +
        '                lorem ipsum'
      
        'The Hobbit                                  169                 ' +
        '                lorem ipsum'
      
        'The Hobbit                                  169                 ' +
        '                lorem ipsum')
    ParentFont = False
    TabOrder = 0
  end
  object BtnModifier: TButton
    Left = 8
    Top = 280
    Width = 145
    Height = 33
    Caption = 'Modifier'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = BtnModifierClick
  end
  object BtnSupprimer: TButton
    Left = 160
    Top = 280
    Width = 145
    Height = 33
    Caption = 'Supprimer'
    Enabled = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
  object BtnAjouter: TButton
    Left = 312
    Top = 280
    Width = 145
    Height = 33
    Caption = 'Ajouter'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = BtnAjouterClick
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 328
    Width = 449
    Height = 161
    Caption = ' Modification '
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    object Label2: TLabel
      Left = 8
      Top = 24
      Width = 73
      Height = 15
      Caption = 'Nom du film :'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 6
      Top = 56
      Width = 75
      Height = 15
      Caption = 'Dur�e (min.) :'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 23
      Top = 88
      Width = 58
      Height = 15
      Caption = 'Synopsis :'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtNomFilm: TEdit
      Left = 88
      Top = 20
      Width = 169
      Height = 22
      MaxLength = 20
      TabOrder = 0
      Text = 'The Hobbit'
    end
    object edtDureeFilm: TEdit
      Left = 88
      Top = 52
      Width = 169
      Height = 22
      MaxLength = 3
      TabOrder = 1
      Text = '169'
    end
    object MmoSynopsis: TMemo
      Left = 88
      Top = 88
      Width = 169
      Height = 65
      Lines.Strings = (
        'Lorem ipsum')
      TabOrder = 2
    end
    object BtnValiderModification: TButton
      Left = 264
      Top = 125
      Width = 177
      Height = 28
      Caption = 'Valider les modifications'
      Enabled = False
      TabOrder = 3
    end
    object BtnAnuuler: TButton
      Left = 264
      Top = 88
      Width = 177
      Height = 28
      Caption = 'Annuler les modifications'
      TabOrder = 4
      OnClick = BtnAnuulerClick
    end
  end
end
