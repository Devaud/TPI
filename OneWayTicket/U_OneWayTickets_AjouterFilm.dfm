object FrmAjouterFilm: TFrmAjouterFilm
  Left = 216
  Top = 126
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsDialog
  Caption = 'OneWay Tickets - Ajouter un film'
  ClientHeight = 227
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
    Caption = 'Durée (min.) :'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 23
    Top = 80
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
    Left = 96
    Top = 16
    Width = 225
    Height = 22
    MaxLength = 20
    TabOrder = 0
    Text = 'The Hobbit'
  end
  object edtDureeFilm: TEdit
    Left = 96
    Top = 48
    Width = 225
    Height = 22
    MaxLength = 20
    TabOrder = 1
    Text = '169'
  end
  object MmoSynopsis: TMemo
    Left = 96
    Top = 80
    Width = 225
    Height = 89
    Lines.Strings = (
      'MmoSynopsis')
    TabOrder = 2
  end
  object BtnAnnuler: TButton
    Left = 8
    Top = 184
    Width = 153
    Height = 33
    Caption = 'Annuler'
    ModalResult = 2
    TabOrder = 3
  end
  object BtnAjouter: TButton
    Left = 168
    Top = 184
    Width = 153
    Height = 33
    Caption = 'Ajouter'
    Enabled = False
    ModalResult = 1
    TabOrder = 4
  end
end
