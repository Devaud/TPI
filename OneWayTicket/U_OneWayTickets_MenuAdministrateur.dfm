object FrmMenuAdministrateur: TFrmMenuAdministrateur
  Left = 351
  Top = 149
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'OneWayTickets - Menu Administrateur'
  ClientHeight = 157
  ClientWidth = 551
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Arial'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 14
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 289
    Height = 137
    Caption = ' Statistique de vente '
    TabOrder = 0
    object Label1: TLabel
      Left = 116
      Top = 16
      Width = 99
      Height = 15
      Caption = 'Billet total vendu :'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 8
      Top = 40
      Width = 207
      Height = 15
      Caption = 'Billet vendu durant le mois courrant :'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 98
      Top = 64
      Width = 117
      Height = 15
      Caption = 'Billet enfants vendu :'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 99
      Top = 88
      Width = 116
      Height = 15
      Caption = 'Billet adultes vendu :'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 27
      Top = 112
      Width = 188
      Height = 15
      Caption = 'Billet etudiants / A.V.S / A.I vendu :'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblBilletTotalVendu: TLabel
      Left = 224
      Top = 16
      Width = 57
      Height = 14
      AutoSize = False
      Caption = '10000'
    end
    object BilletVenduMoisCourrant: TLabel
      Left = 224
      Top = 40
      Width = 57
      Height = 14
      AutoSize = False
      Caption = '50'
    end
    object BilletEnfantsVendu: TLabel
      Left = 224
      Top = 64
      Width = 57
      Height = 14
      AutoSize = False
      Caption = '15'
    end
    object BilletAdultesVendu: TLabel
      Left = 224
      Top = 88
      Width = 57
      Height = 14
      AutoSize = False
      Caption = '10'
    end
    object BilletEtudiantsVendu: TLabel
      Left = 224
      Top = 112
      Width = 57
      Height = 14
      AutoSize = False
      Caption = '25'
    end
  end
  object GroupBox2: TGroupBox
    Left = 312
    Top = 8
    Width = 225
    Height = 49
    Caption = ' Film '
    TabOrder = 1
    object Label6: TLabel
      Left = 8
      Top = 20
      Width = 85
      Height = 15
      Caption = 'Film le plus vu :'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblFilmPlusVu: TLabel
      Left = 104
      Top = 20
      Width = 51
      Height = 14
      Caption = 'The Hobbit'
    end
  end
  object BtnDeconnexion: TButton
    Left = 312
    Top = 112
    Width = 225
    Height = 33
    Caption = 'D�connexion'
    TabOrder = 2
  end
  object MainMenu1: TMainMenu
    Left = 312
    Top = 64
    object Fichier1: TMenuItem
      Caption = '&Fichier'
      object Dconnexion1: TMenuItem
        Bitmap.Data = {
          360C0000424D360C000000000000360000002800000020000000200000000100
          180000000000000C000000000000000000000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFF9F9FCF9F9FCF9F9FCF9F9FCF9F9FCF9F9FCF9F9FCF9F9
          FCF9F9FCF9F9FCF9F9FCF9F9FCF9F9FCF9F9FCF9F9FCF9F9FCF9F9FCF9F9FCF9
          F9FCF9F9FCF9F9FCF8F8FCFCFCFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFDEDEF17676CB8888D78686D78686D68686D68686D68686D68686
          D58686D58686D58686D58686D48686D48686D48686D48686D48686D48686D486
          86D48686D58787D67D7DD19C9CD7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFCBCBE94A4AC12424CA0E0EC30F0FC30F0FC20F0FC10F0FC00F0F
          BF0F0FBE0F0FBD0E0EBC0E0EBB0F0FBA0F0FBA0F0FB90F0FB80F0FB70F0FB60F
          0FB60F0FB70F0FB84040C37575C8FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFCBCBE94D4DC41717CC0000C50000C40000C30000C20000C10000
          C00000BE0202BF0C0CC00F0FC00606BD0000BA0000B90000B80000B70000B600
          00B50000B40000B33A3AC17979C9FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFCBCBE94D4DC51818D10000CB0000CA0000C90000C80000C71717
          CB6262DBA5A5E9C4C4F1CACAF2B7B7ED8282DF3535CC0202BF0000BD0000BC00
          00BB0000BA0000B93B3BC47878C9FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFCBCBE94C4CC71818D60000D00000CF0000CE0000CD4949DBC8C8
          F3FDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE9E9FA8585E21111C60000C100
          00C10000C00000BF3B3BC87878CAFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFCBCBE95151C91C1CDC0000D60000D50000D45656E1E9E9FBFFFF
          FFFEFEFFDADAF9B1B1F1A8A8EFC6C6F4F3F3FDFFFFFFFFFFFFA1A1EA0F0FCA00
          00C60000C50000C43B3BCB7878CAFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFCBCBE95D5DCC4040E60F0FDD0000DA2F2FE0DEDEFAFFFFFFEEEE
          FC7D7DEA1F1FDA0505D40202D30F0FD44A4ADFC7C7F5FFFFFFFEFEFF7C7CE500
          00CC0000CA0000CA3B3BCF7878CAFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFCBCBE95E5ECE5050EC3737E72424E49C9CF2FFFFFFF6F6FE6868
          EB0000DB0000D90000D90000D80000D70000D52626DCCBCBF7FFFFFFE2E2FA2B
          2BD80000CF0000CF3B3BD27878CBFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFCBCBE95F5FCF5252F03D3DEC5757EEE5E5FCFFFFFFB0B0F60808
          E20000E00000DF0000DE0000DD0000DC0000DB0000DA5656E6F8F8FEFFFFFF70
          70E80000D50000D53B3BD67878CBFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFCBCBE96060D05454F43E3EF07474F4F9F9FFFFFFFF8383F42020
          EA0F0FE70C0CE64F4FEC6464ED2F2FE70000E10000E01818E2D5D5FAFFFFFFA2
          A2F20202DB0000DA3B3BD97878CBFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFCBCBE96060D15656F74040F48484F8FEFEFFFAFAFF7676F53F3F
          F13C3CF04949F0E0E0FCFFFFFF9191F40606E70404E60C0CE5BFBFF8FFFFFFB6
          B6F60606E10000E03B3BDD7878CCFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFCBCBE96161D25858FB4242F97F7FFAFCFCFFFDFDFF8484F94040
          F54242F45858F5E6E6FEFFFFFFA9A9F93737F03232EF3C3CEFD4D4FBFFFFFFBB
          BBF82929EA2323E95050E27A7ACCFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFCBCBE96262D45B5BFF4646FD6A6AFDF0F0FFFFFFFFB2B2FD4646
          F94343F85959F9E6E6FEFFFFFFACACFB4242F53F3FF46E6EF6F3F3FEFFFFFFA4
          A4F83E3EF03F3FF06363E77C7CCDFDFDFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFCBCBE96262D45E5EFF4A4AFF5252FFCCCCFFFFFFFFEEEEFF7575
          FD4343FD5B5BFCE6E6FFFFFFFFADADFD4242F94C4CF8BEBEFCFFFFFFF6F6FF73
          73F83F3FF44141F46464EA7C7CCDFDFDFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFCBCBE96363D46060FF4D4DFF4B4BFF8686FFF8F8FFFFFFFFDFDF
          FF7676FF5D5DFFE7E7FFFFFFFFAEAEFE5050FDB0B0FDFCFCFFFFFFFFBFBFFD4A
          4AF94343F84343F86565ED7C7CCDFDFDFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFCBCBE96464D46262FF5050FF5050FF5353FFAEAEFFFEFEFFFFFF
          FFC7C7FF6363FFE7E7FFFFFFFFADADFF7070FFF5F5FFFFFFFFDEDEFF6666FE45
          45FD4646FD4545FD6767EF7C7CCDFDFDFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFCBCBE96464D46464FF5252FF5353FF5151FF5A5AFFACACFFF8F8
          FFCECEFF6666FFE7E7FFFFFFFFAEAEFF7474FFF5F5FFD4D4FF7070FF4949FF4A
          4AFF4949FF4949FF6969F27C7CCEFDFDFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFCBCBE96565D46767FF5555FF5555FF5454FF5353FF5656FF8585
          FF9C9CFF6868FFEAEAFFFFFFFFB2B2FF6868FF9898FF5F5FFF4B4BFF4C4CFF4C
          4CFF4B4BFF4B4BFF6A6AF27C7CCEFDFDFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFCBCBE96666D46969FF5757FF5757FF5757FF5656FF5555FF5353
          FF5454FF5E5EFFB3B3FFCACAFF8D8DFF5050FF4F4FFF4F4FFF5050FF4F4FFF4E
          4EFF4E4EFF4E4EFF6C6CF27D7DCEFDFDFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFCBCBE96767D46B6BFF5959FF5959FF5959FF5858FF5858FF5757
          FF5757FF5656FF5757FF5757FF5555FF5454FF5353FF5353FF5252FF5151FF51
          51FF5050FF5050FF6E6EF27D7DCEFDFDFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFCBCBE96868D46D6DFF5B5BFF5C5CFF5B5BFF5A5AFF5A5AFF5959
          FF5959FF5858FF5757FF5757FF5656FF5656FF5555FF5555FF5454FF5353FF53
          53FF5252FF5252FF7070F37D7DCEFDFDFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFCECEEA6161CD8484F47C7CF47C7CF47B7BF47B7BF47B7BF47A7A
          F47A7AF47A7AF47979F47979F47878F47878F47777F47777F47777F47777F476
          76F47676F47777F57575E67D7DCDFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFF4F4FAC5C5E9CECEEDCFCFEDCFCFEDCFCFEDCFCFEDCFCFEDCFCF
          EDCFCFEDCFCFEDCFCFEDCFCFEDCFCFEDCFCFEDCFCFEDCFCFEDCFCFEDCFCFEDCF
          CFEDCFCFEDCFCFEDC7C7EAD8D8EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
        Caption = '&D�connexion'
        ShortCut = 16452
      end
    end
    object Gestion1: TMenuItem
      Caption = '&Gestion'
      object Films1: TMenuItem
        Caption = '&Films'
        ShortCut = 16454
      end
      object Salles1: TMenuItem
        Caption = '&Salles'
        ShortCut = 16467
      end
      object Sance1: TMenuItem
        Caption = 'S�anc&es'
        ShortCut = 16453
      end
    end
  end
end
