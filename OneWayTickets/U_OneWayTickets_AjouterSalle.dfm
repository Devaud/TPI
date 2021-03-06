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
  object edtNomSalle: TEdit
    Left = 104
    Top = 16
    Width = 225
    Height = 21
    MaxLength = 8
    TabOrder = 0
    Text = '13'
    OnChange = edtNomSalleChange
  end
  object edtPlacesMax: TEdit
    Left = 104
    Top = 48
    Width = 209
    Height = 21
    MaxLength = 20
    TabOrder = 1
    Text = '1'
    OnChange = edtNomSalleChange
    OnKeyPress = edtPlacesMaxKeyPress
  end
  object BtnAnnuler: TButton
    Left = 8
    Top = 80
    Width = 153
    Height = 33
    Caption = 'Annuler'
    TabOrder = 2
    OnClick = BtnAnnulerClick
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
  object UDPlacesMax: TUpDown
    Left = 313
    Top = 48
    Width = 16
    Height = 21
    Associate = edtPlacesMax
    Min = 1
    Max = 500
    Position = 1
    TabOrder = 4
    Wrap = False
  end
end
