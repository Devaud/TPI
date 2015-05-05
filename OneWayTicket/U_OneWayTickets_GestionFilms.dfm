object FrmGestionFilms: TFrmGestionFilms
  Left = 324
  Top = 128
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'FrmGestionFilms'
  ClientHeight = 498
  ClientWidth = 437
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
    Width = 417
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
    Width = 417
    Height = 233
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
    TabOrder = 0
  end
  object BtnModifier: TButton
    Left = 8
    Top = 280
    Width = 129
    Height = 33
    Caption = 'Modifier'
    Enabled = False
    TabOrder = 1
  end
  object BtnSupprimer: TButton
    Left = 152
    Top = 280
    Width = 129
    Height = 33
    Caption = 'Supprimer'
    Enabled = False
    TabOrder = 2
  end
  object BtnAjouter: TButton
    Left = 296
    Top = 280
    Width = 129
    Height = 33
    Caption = 'Ajouter'
    Enabled = False
    TabOrder = 3
  end
  object GroupBox1: TGroupBox
    Left = 16
    Top = 320
    Width = 409
    Height = 161
    Caption = ' Modification '
    TabOrder = 4
  end
end
