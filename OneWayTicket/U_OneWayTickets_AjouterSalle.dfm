object FrmAjouterSalle: TFrmAjouterSalle
  Left = 218
  Top = 401
  BorderStyle = bsDialog
  Caption = 'OneWay Tickets - Ajouter une salle'
  ClientHeight = 122
  ClientWidth = 339
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 16
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
  object Label2: TLabel
    Left = 24
    Top = 48
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
  object edtNomFilm: TEdit
    Left = 104
    Top = 16
    Width = 225
    Height = 22
    MaxLength = 20
    TabOrder = 0
    Text = '13'
  end
  object edtDureeFilm: TEdit
    Left = 104
    Top = 48
    Width = 225
    Height = 22
    MaxLength = 20
    TabOrder = 1
    Text = '250'
  end
  object BtnAnnuler: TButton
    Left = 8
    Top = 80
    Width = 153
    Height = 33
    Caption = 'Annuler'
    ModalResult = 2
    TabOrder = 2
  end
  object BtnAjouter: TButton
    Left = 176
    Top = 80
    Width = 153
    Height = 33
    Caption = 'Ajouter'
    Enabled = False
    ModalResult = 1
    TabOrder = 3
  end
end
