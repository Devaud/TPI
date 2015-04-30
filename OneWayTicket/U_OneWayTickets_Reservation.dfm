object FrmReservation: TFrmReservation
  Left = 910
  Top = 151
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'OneWay Tickets - Réservation'
  ClientHeight = 325
  ClientWidth = 534
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
  object GroupBox1: TGroupBox
    Left = 16
    Top = 16
    Width = 249
    Height = 185
    Caption = ' Information sur le film '
    TabOrder = 0
    object Label1: TLabel
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
    object Label2: TLabel
      Left = 32
      Top = 56
      Width = 40
      Height = 15
      Caption = 'Durée :'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
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
  object GroupBox2: TGroupBox
    Left = 280
    Top = 16
    Width = 241
    Height = 185
    Caption = ' Billets '
    TabOrder = 1
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
    object Label5: TLabel
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
    object Label6: TLabel
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
      Height = 17
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
    object Label7: TLabel
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
    object Label8: TLabel
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
  end
  object EdtNbBilletsEnfants: TEdit
    Left = 368
    Top = 40
    Width = 25
    Height = 22
    MaxLength = 2
    ReadOnly = True
    TabOrder = 2
    Text = '0'
  end
  object UDNBilletsEnfants: TUpDown
    Left = 393
    Top = 40
    Width = 16
    Height = 22
    Associate = EdtNbBilletsEnfants
    Min = 0
    Position = 0
    TabOrder = 3
    Wrap = False
  end
  object EdtNbBilletsAdultes: TEdit
    Left = 368
    Top = 78
    Width = 25
    Height = 22
    MaxLength = 2
    ReadOnly = True
    TabOrder = 4
    Text = '1'
  end
  object UDNBilletsAdultes: TUpDown
    Left = 393
    Top = 78
    Width = 16
    Height = 22
    Associate = EdtNbBilletsAdultes
    Min = 0
    Position = 1
    TabOrder = 5
    Wrap = False
  end
  object EdtNbBilletsEAA: TEdit
    Left = 368
    Top = 133
    Width = 25
    Height = 22
    MaxLength = 2
    ReadOnly = True
    TabOrder = 6
    Text = '0'
  end
  object UDNBilletsEAA: TUpDown
    Left = 393
    Top = 133
    Width = 16
    Height = 22
    Associate = EdtNbBilletsEAA
    Min = 0
    Position = 0
    TabOrder = 7
    Wrap = False
  end
  object GroupBox3: TGroupBox
    Left = 16
    Top = 216
    Width = 249
    Height = 97
    Caption = ' Information sur la séance '
    TabOrder = 8
    object Label9: TLabel
      Left = 70
      Top = 48
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
    object Label10: TLabel
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
    object Label11: TLabel
      Left = 15
      Top = 72
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
      Top = 48
      Width = 79
      Height = 14
      AutoSize = False
      Caption = '14:30 à 17:30'
    end
    object lblPlacesRestantes: TLabel
      Left = 128
      Top = 72
      Width = 79
      Height = 14
      AutoSize = False
      Caption = '150'
    end
  end
  object BtnAnnuler: TButton
    Left = 280
    Top = 224
    Width = 241
    Height = 41
    Caption = 'Annuler'
    TabOrder = 9
  end
  object BtnValiderReservation: TButton
    Left = 280
    Top = 272
    Width = 241
    Height = 41
    Caption = 'Valider la réservation'
    TabOrder = 10
  end
end
