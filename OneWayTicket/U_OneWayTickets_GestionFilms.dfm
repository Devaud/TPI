object FrmGestionFilms: TFrmGestionFilms
  Left = 932
  Top = 177
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'OneWay Tickets - Gestion des films'
  ClientHeight = 554
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
  object Label6: TLabel
    Left = 8
    Top = 30
    Width = 26
    Height = 15
    Caption = 'Nom'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label7: TLabel
    Left = 144
    Top = 30
    Width = 34
    Height = 15
    Caption = 'Durée'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label8: TLabel
    Left = 280
    Top = 30
    Width = 52
    Height = 15
    Caption = 'Synopsis'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label9: TLabel
    Left = 432
    Top = 30
    Width = 23
    Height = 15
    Caption = 'Prix'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LbxListeFilms: TListBox
    Left = 8
    Top = 48
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
    Top = 288
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
    Top = 288
    Width = 145
    Height = 33
    Caption = 'Supprimer'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = BtnSupprimerClick
  end
  object BtnAjouter: TButton
    Left = 312
    Top = 288
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
    Top = 336
    Width = 449
    Height = 209
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
      Caption = 'Durée (min.) :'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 23
      Top = 120
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
    object Label5: TLabel
      Left = 19
      Top = 88
      Width = 62
      Height = 15
      Caption = 'Prix (CHF) :'
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
      Width = 217
      Height = 22
      MaxLength = 20
      TabOrder = 0
      Text = 'The Hobbit'
      OnChange = edtDureeFilmChange
    end
    object edtDureeFilm: TEdit
      Left = 88
      Top = 52
      Width = 201
      Height = 22
      MaxLength = 3
      TabOrder = 1
      Text = '0'
      OnChange = edtDureeFilmChange
      OnKeyPress = edtDureeFilmKeyPress
    end
    object MmoSynopsis: TMemo
      Left = 88
      Top = 120
      Width = 217
      Height = 81
      Lines.Strings = (
        'Lorem ipsum')
      MaxLength = 150
      TabOrder = 2
      OnChange = MmoSynopsisChange
    end
    object BtnValiderModification: TButton
      Left = 312
      Top = 160
      Width = 129
      Height = 41
      Caption = 'Valider les modifications'
      Enabled = False
      TabOrder = 3
      OnClick = BtnValiderModificationClick
    end
    object BtnAnuuler: TButton
      Left = 312
      Top = 120
      Width = 129
      Height = 41
      Caption = 'Annuler les modifications'
      TabOrder = 4
      OnClick = BtnAnuulerClick
    end
    object edtPrixFilm: TEdit
      Left = 88
      Top = 84
      Width = 201
      Height = 22
      MaxLength = 3
      TabOrder = 5
      Text = '0'
      OnChange = edtDureeFilmChange
      OnKeyPress = edtDureeFilmKeyPress
    end
    object UDDuree: TUpDown
      Left = 289
      Top = 52
      Width = 16
      Height = 22
      Associate = edtDureeFilm
      Min = 0
      Max = 400
      Position = 0
      TabOrder = 6
      Wrap = False
    end
    object UDPrix: TUpDown
      Left = 289
      Top = 84
      Width = 16
      Height = 22
      Associate = edtPrixFilm
      Min = 0
      Max = 20
      Position = 0
      TabOrder = 7
      Wrap = False
    end
  end
end
