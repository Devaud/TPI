object FrmAjouterFilm: TFrmAjouterFilm
  Left = 223
  Top = 155
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsDialog
  Caption = 'OneWay Tickets - Ajouter un film'
  ClientHeight = 250
  ClientWidth = 332
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
    Top = 16
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
  object Label2: TLabel
    Left = 6
    Top = 48
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
  object Label3: TLabel
    Left = 23
    Top = 112
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
  object Label4: TLabel
    Left = 19
    Top = 80
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
    Left = 96
    Top = 16
    Width = 225
    Height = 22
    MaxLength = 20
    TabOrder = 0
    Text = 'The Hobbit'
    OnChange = edtDureeFilmChange
  end
  object edtDureeFilm: TEdit
    Left = 96
    Top = 48
    Width = 209
    Height = 22
    MaxLength = 20
    TabOrder = 1
    Text = '0'
    OnChange = edtDureeFilmChange
    OnKeyPress = edtDureeFilmKeyPress
  end
  object MmoSynopsis: TMemo
    Left = 96
    Top = 112
    Width = 225
    Height = 89
    Lines.Strings = (
      'MmoSynopsis')
    MaxLength = 150
    TabOrder = 2
    OnChange = MmoSynopsisChange
  end
  object BtnAnnuler: TButton
    Left = 8
    Top = 208
    Width = 153
    Height = 33
    Caption = 'Annuler'
    TabOrder = 3
    OnClick = BtnAnnulerClick
  end
  object BtnAjouter: TButton
    Left = 168
    Top = 208
    Width = 153
    Height = 33
    Caption = 'Ajouter'
    Enabled = False
    ModalResult = 1
    TabOrder = 4
  end
  object edtPrixFilm: TEdit
    Left = 96
    Top = 80
    Width = 209
    Height = 22
    MaxLength = 20
    TabOrder = 5
    Text = '0'
    OnChange = edtDureeFilmChange
    OnKeyPress = edtDureeFilmKeyPress
  end
  object UDDuree: TUpDown
    Left = 305
    Top = 48
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
    Left = 305
    Top = 80
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
