object FrmAjouterSeance: TFrmAjouterSeance
  Left = 387
  Top = 155
  BorderStyle = bsDialog
  Caption = 'OneWay Tickets - Ajouter une s�ance'
  ClientHeight = 260
  ClientWidth = 429
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
    Left = 13
    Top = 18
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
  object Label2: TLabel
    Left = 8
    Top = 50
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
  object CbxFilms: TComboBox
    Left = 48
    Top = 14
    Width = 153
    Height = 22
    Style = csDropDownList
    ItemHeight = 14
    TabOrder = 0
    Items.Strings = (
      'The Hobbit')
  end
  object CbxSalles: TComboBox
    Left = 48
    Top = 46
    Width = 153
    Height = 22
    Style = csDropDownList
    ItemHeight = 14
    TabOrder = 1
    Items.Strings = (
      '13'
      '')
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 80
    Width = 193
    Height = 121
    Caption = ' Jour de diffusion '
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    object CbxLundi: TCheckBox
      Left = 16
      Top = 24
      Width = 73
      Height = 17
      Caption = 'Lundi'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object CbxSamedi: TCheckBox
      Left = 112
      Top = 48
      Width = 73
      Height = 17
      Caption = 'Samedi'
      TabOrder = 1
    end
    object CbxVendredi: TCheckBox
      Left = 112
      Top = 24
      Width = 73
      Height = 17
      Caption = 'Vendredi'
      TabOrder = 2
    end
    object CbxDimanche: TCheckBox
      Left = 112
      Top = 72
      Width = 73
      Height = 17
      Caption = 'Dimanche'
      TabOrder = 3
    end
    object CbxMardi: TCheckBox
      Left = 16
      Top = 48
      Width = 73
      Height = 17
      Caption = 'Mardi'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
    end
    object CbxMercredi: TCheckBox
      Left = 16
      Top = 72
      Width = 73
      Height = 17
      Caption = 'Mercredi'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
    end
    object CbxJeudi: TCheckBox
      Left = 16
      Top = 96
      Width = 73
      Height = 17
      Caption = 'Jeudi'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
    end
  end
  object GroupBox3: TGroupBox
    Left = 208
    Top = 8
    Width = 209
    Height = 193
    Caption = ' Horaires '
    TabOrder = 3
    object Label4: TLabel
      Left = 8
      Top = 24
      Width = 50
      Height = 15
      Caption = 'Heure 1 :'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 8
      Top = 70
      Width = 50
      Height = 15
      Caption = 'Heure 2 :'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 8
      Top = 114
      Width = 50
      Height = 15
      Caption = 'Heure 3 :'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 8
      Top = 160
      Width = 50
      Height = 15
      Caption = 'Heure 4 :'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtHeure1: TEdit
      Left = 64
      Top = 20
      Width = 121
      Height = 22
      MaxLength = 10
      TabOrder = 0
      Text = '12:00'
    end
    object edtHeure2: TEdit
      Left = 64
      Top = 66
      Width = 121
      Height = 22
      MaxLength = 10
      TabOrder = 1
      Text = '12:00'
    end
    object edtHeure3: TEdit
      Left = 64
      Top = 110
      Width = 121
      Height = 22
      MaxLength = 10
      TabOrder = 2
      Text = '12:00'
    end
    object edtHeure4: TEdit
      Left = 64
      Top = 156
      Width = 121
      Height = 22
      MaxLength = 10
      TabOrder = 3
      Text = '12:00'
    end
  end
  object BtnAnnuler: TButton
    Left = 8
    Top = 208
    Width = 193
    Height = 41
    Caption = 'Annuler'
    ModalResult = 2
    TabOrder = 4
  end
  object BtnValider: TButton
    Left = 208
    Top = 208
    Width = 209
    Height = 41
    Caption = 'Valider'
    Enabled = False
    ModalResult = 1
    TabOrder = 5
  end
end
