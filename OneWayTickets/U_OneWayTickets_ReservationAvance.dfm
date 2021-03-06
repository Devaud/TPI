object FrmReservationAvance: TFrmReservationAvance
  Left = 209
  Top = 128
  BorderStyle = bsSingle
  Caption = 'OneWay Tickets - R�servation en avance'
  ClientHeight = 471
  ClientWidth = 533
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
    Width = 84
    Height = 15
    Caption = 'Choisir un film:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label13: TLabel
    Left = 84
    Top = 24
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
  object Label14: TLabel
    Left = 128
    Top = 24
    Width = 79
    Height = 14
    AutoSize = False
    Caption = '13'
  end
  object CbxFilm: TComboBox
    Left = 8
    Top = 24
    Width = 505
    Height = 22
    Style = csDropDownList
    BiDiMode = bdRightToLeftNoAlign
    ItemHeight = 14
    ParentBiDiMode = False
    TabOrder = 0
    Items.Strings = (
      'The Hobbit')
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 56
    Width = 249
    Height = 185
    Caption = ' Information sur le film '
    TabOrder = 1
    object Label5: TLabel
      Left = 42
      Top = 24
      Width = 32
      Height = 15
      Caption = 'Titre :'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 32
      Top = 56
      Width = 40
      Height = 15
      Caption = 'Dur�e :'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 15
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
    object lblNomFilm: TLabel
      Left = 82
      Top = 24
      Width = 135
      Height = 14
      AutoSize = False
      Caption = 'The Hobbit'
    end
    object lblDuree: TLabel
      Left = 82
      Top = 56
      Width = 79
      Height = 14
      AutoSize = False
      Caption = '02:49:00'
    end
    object mmoSynopsis: TMemo
      Left = 16
      Top = 104
      Width = 225
      Height = 73
      BorderStyle = bsNone
      Color = clBtnFace
      Lines.Strings = (
        'Lorem ipsum dolor sit amet, consectetur '
        'adipiscing elit. Morbi vel nisl elit. Pellentesque '
        'a neque pulvinar, blandit nisi quis, vulputate '
        'neque. Proin vel mauris ac odio finibus '
        'ullamcorper quis vel diam. Mauris imperdiet, '
        'sem vitae blandit lobortis, est ipsum '
        'elementum magna, ')
      ReadOnly = True
      TabOrder = 0
    end
  end
  object GroupBox1: TGroupBox
    Left = 272
    Top = 56
    Width = 241
    Height = 185
    Caption = ' Billets '
    TabOrder = 2
    object Label4: TLabel
      Left = 26
      Top = 26
      Width = 57
      Height = 15
      Caption = 'Enfant(s) :'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 26
      Top = 64
      Width = 57
      Height = 15
      Caption = 'Adulte(s) :'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 26
      Top = 96
      Width = 128
      Height = 15
      Caption = 'Etudiant(s) / A.V.S / A.I :'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblPrixEnfants: TLabel
      Left = 136
      Top = 25
      Width = 66
      Height = 15
      Caption = 'x 10.00 CHF'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblPrixAdultes: TLabel
      Left = 136
      Top = 64
      Width = 66
      Height = 15
      Caption = 'x 24.00 CHF'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblPrixEAA: TLabel
      Left = 136
      Top = 120
      Width = 66
      Height = 15
      Caption = 'x 10.00 CHF'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label8: TLabel
      Left = 136
      Top = 149
      Width = 66
      Height = 15
      AutoSize = False
      Caption = '88.00 CHF'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label9: TLabel
      Left = 96
      Top = 149
      Width = 33
      Height = 15
      Caption = 'Total :'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object EdtNbBilletsEnfants: TEdit
      Left = 88
      Top = 24
      Width = 25
      Height = 22
      MaxLength = 2
      ReadOnly = True
      TabOrder = 0
      Text = '0'
    end
    object UDNBilletsEnfants: TUpDown
      Left = 113
      Top = 24
      Width = 16
      Height = 22
      Associate = EdtNbBilletsEnfants
      Min = 0
      Position = 0
      TabOrder = 1
      Wrap = False
    end
    object EdtNbBilletsAdultes: TEdit
      Left = 88
      Top = 62
      Width = 25
      Height = 22
      MaxLength = 2
      ReadOnly = True
      TabOrder = 2
      Text = '1'
    end
    object UDNBilletsAdultes: TUpDown
      Left = 113
      Top = 62
      Width = 16
      Height = 22
      Associate = EdtNbBilletsAdultes
      Min = 0
      Position = 1
      TabOrder = 3
      Wrap = False
    end
    object EdtNbBilletsEAA: TEdit
      Left = 88
      Top = 117
      Width = 25
      Height = 22
      MaxLength = 2
      ReadOnly = True
      TabOrder = 4
      Text = '0'
    end
    object UDNBilletsEAA: TUpDown
      Left = 113
      Top = 117
      Width = 16
      Height = 22
      Associate = EdtNbBilletsEAA
      Min = 0
      Position = 0
      TabOrder = 5
      Wrap = False
    end
  end
  object GroupBox3: TGroupBox
    Left = 272
    Top = 248
    Width = 249
    Height = 161
    Caption = ' Information sur la s�ance '
    TabOrder = 3
    object Label10: TLabel
      Left = 70
      Top = 96
      Width = 48
      Height = 15
      Caption = 'Horaire :'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label11: TLabel
      Left = 84
      Top = 24
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
    object Label12: TLabel
      Left = 15
      Top = 130
      Width = 103
      Height = 15
      Caption = 'Places restantes :'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblSalle: TLabel
      Left = 128
      Top = 24
      Width = 79
      Height = 14
      AutoSize = False
      Caption = '13'
    end
    object lblHoraire: TLabel
      Left = 128
      Top = 96
      Width = 79
      Height = 14
      AutoSize = False
      Caption = '14:30 � 17:30'
    end
    object lblPlacesRestantes: TLabel
      Left = 128
      Top = 130
      Width = 79
      Height = 14
      AutoSize = False
      Caption = '150'
    end
    object Label15: TLabel
      Left = 86
      Top = 60
      Width = 32
      Height = 15
      Caption = 'Date :'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label16: TLabel
      Left = 128
      Top = 60
      Width = 79
      Height = 14
      AutoSize = False
      Caption = '26.04.2015'
    end
  end
  object LbxSeance: TListBox
    Left = 8
    Top = 256
    Width = 249
    Height = 153
    ItemHeight = 14
    TabOrder = 4
  end
  object BtnValider: TButton
    Left = 8
    Top = 416
    Width = 249
    Height = 41
    Caption = 'Valider la r�servation'
    TabOrder = 5
  end
  object BtnAnnuler: TButton
    Left = 272
    Top = 416
    Width = 249
    Height = 41
    Caption = 'Annuler la r�servation'
    TabOrder = 6
  end
end
