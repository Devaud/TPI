object FrmMenuAdministrateur: TFrmMenuAdministrateur
  Left = 239
  Top = 151
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
        Bitmap.Data = {
          360C0000424D360C000000000000360000002800000020000000200000000100
          180000000000000C000000000000000000000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFAFAEEEEEFE1E1
          E1DADADAD6D6D6D5D5D3D5D5D4D8D8D7DEDEDDE8E8E8F4F4F4FDFDFDFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0F0F1D7D7D6C3C4BEAEB0A6ADAE
          A3C8C9C1CACBC2C7C8BCC7C8BDC8C9BFCACBC1CBCCC1CECEC8D2D2D1E2E2E2F9
          F9F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFF4F4F4CCCCCBB1B2AAB0B2A2ABAE9C9B9E8C9295
          859193838B8D7D888A7A898A7A8C8E7E9496869FA190B0B2A2B3B4A89A9C91BB
          BBB6E1E1E1FCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFE3E3E3A7A8A49091869B9E8C929484817E72726B5E6660
          4F5F60425F643C555C3862643E5F5E44675A4A6D5E54756C648483769194839A
          9D8C9EA095C6C6C4F5F5F5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFEFEFED9D9D9959690888A7C8B8D7E726D64634C4F6C4E4F735C4F847C
          689A9B7FA1A4869CA0869FA1869D9C869A907D8F7A7080626761474C6857537F
          7D7092948496978AB7B7B3F2F2F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFDFDFDE8F908A86887A7F7E715D4B475E4145846E6F9B92898684768C8E
          7D9395848F91808B8C7C8B8C7C8B8D7C8D8E7E939484ACAB9EA39A936F5B575C
          4743675E578B8D7E8E9082B4B4B0F6F6F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          F0F0F09C9C98828477726F64513D3B73615C908B818D8E818384767F80718385
          7575766A52524B44453F52534C7475698485757E806F7E806F8284738183728B
          897A71655E5C554E8587788E8F82C8C8C5FEFEFEFFFFFFFFFFFFFFFFFFFFFFFF
          C2C2C08384786F6D624E403E7C756F8A8B818283788081758182758687786162
          592B2B2A2322232222232222232929285B5B5386877782847382847382847383
          85748B8C7B79786B5E5D54898A7B9A9B90E8E8E7FFFFFFFFFFFFFFFFFFF1F1F1
          98999078796C4F4B467D7B7286877D83837A83847A8384798587797A7A6F2929
          281E1E1E2020202020202020201F1F1F25252473746887897785867585877688
          89788789788788777374657375678F9181BFC0B9FEFEFEFFFFFFFFFFFFD6D6D3
          888A7D66665D7E7E7488897D898A7D898A7E86877C86877C8A8B7E5F60581818
          181A1A1A1B1B1B1C1C1C1C1C1C1A1A1A17171754554D8C8D7C888979898A7A6C
          6D626F70658A8B7B8889797F80718A8B7DA0A195F1F1F0FFFFFFFFFFFFBABAB3
          8688798384788B8C7F8A8B7D6E6F656E6E658A8B7E8A8B7E8D8E8162625A1717
          1817171716161616161616161616161615151555564E8F90808E8F805F60571C
          1C1C1C1C1C68695F8E8F808B8C7E949588999B8CD8D8D3FFFFFFF8F8F7A7A89D
          8E8F828E8F8390928368685F1B1B1A1C1C1C6061599192838F91827F80721D1D
          1C0B0B0B0E0E0E1010100F0F0F0C0C0C13131271726691928391928455554E13
          13131A1A1A66675E9193848E8F82909184999A8CC1C2BAFFFFFFEEEFED9E9F93
          9192869091869394876E6F6521212018181864645C9495879293839395846565
          5B1E1E1C0C0C0C0A0A0A0B0B0B1919185859519192849293859293868C8D8164
          655D6E6F66919383939485929386919287939487B4B5AAFBFBFBE9E9E69C9D92
          94948A94958A9495899596898283798182789596899596889697879697869798
          8785867965665E5A5A5468696087887C999A8B95968995968A95968A95968B99
          9A8E999B8C96988896978895968A95968B949589ABABA1F4F4F3E7E7E49FA096
          97988E999A8F9A9B8F999A8E9D9E929D9E9298998D98998B999A8A999A89999A
          899C9D8CA5A696AAAC9CA8A9989E9F8F999A8C98998E98988F98988F98988F99
          9A8F9B9C8F9B9C8E9B9C8F9B9B9198999098988F9E9F94E0E0DCD8D9D49D9E94
          999A9077786F52534D4848435C5C5585857B9C9D919C9D8F9C9D8D9C9D8D9C9E
          8D9D9E8E9D9E90999A8C999A8D9D9E919B9C919B9B939B9B939B9B949C9C958B
          8C8362635C4A4B454F504A70716A96978F9C9C949B9C92C9C9C2CACBC59B9C91
          5959531818170E0E0E0B0B0B0D0D0D1E1E1C6A6B629FA0939FA0919FA091A0A1
          9298998D63635D3B3B373F3E3A6C6C669A9B939E9E979E9E979E9F997B7B7723
          23210C0C0C0B0B0B0B0B0B1212114A4B4697988F9E9F95B9BAB2C5C6BF919286
          2222200D0D0D0E0E0E0C0C0C0D0D0D07070718191788897EA3A497A2A396A1A2
          966C6A63433E37554E465851484D4740797772A1A29BA2A29B9696902C2C2A02
          02020B0B0B0D0D0D0C0C0C0D0D0D14141478796FA3A498B3B4ABC6C6C0A4A59B
          31312E0D0D0D0D0D0D0B0B0B0C0C0C09090905050564655EA6A79CA4A59A9E9F
          95767067978A7CB8A897B0A2918D81747A756DA1A29AA6A79F81827A0E0E0E04
          04040B0B0B0C0C0C0C0C0C0C0C0C1616157A7B6FA6A79AB5B6ACCECEC9B6B7AF
          5A5B590C0C0C0D0D0D0B0B0B0C0C0C0A0A0A03030465655EAAAB9FA8A99CA4A5
          9AA19D95B9B1A7BBB2A8B0A8A0A7A0999C9992A5A69DA9AAA086877D10100F04
          04040B0B0B0B0B0B0C0C0C0B0B0B20201E898B7DA8A99BBDBEB4DEDEDBADAEA4
          7879750F0F0F0C0C0C0C0C0C0B0B0B0808091B1B198C8D83ADAE9FACAD9DABAC
          9EACACA3C7C6C2D7D5D2D6D4D2C3C2BEAAABA2AAABA0ABADA0A2A397393A3405
          05050909090909090A0A0B0908093E3F3AA1A294ABAC9ECCCDC5F1F1EFB4B5AA
          97988C4748421E1E1C141514151514333330808178AEAFA2AFB0A1AFB0A0AFB0
          A1ADAEA2AEAFA5B7B8B1B7B7B0AEAFA4AEAFA2AEB0A2AFB0A2B0B1A3999A8D55
          554F2B2C2920201E2D2E2B55554F96978BB0B1A2AFB0A3E2E2DEFEFEFEC8C9C1
          AFB0A2AEAF9FA3A4979D9D939F9F96AEAFA4B4B5A9B1B2A5B2B3A4B2B3A4B1B2
          A5B1B2A7B2B3AAB2B3AAB2B3A9B3B4A8B2B3A5B2B3A4B2B3A4B2B3A4B3B4A6B5
          B6A9B5B6A9B3B3A7B8B9ACB9BAACB4B5A7B1B2A4BBBCB2F7F7F6FFFFFFE8E8E5
          B2B3A6B5B6A7B7B8A9B9BAACB8B9ADB2B4A8B1B2A7B5B6A9B4B5A7B4B5A7B5B6
          A9ADAEA4898A836C6C676B6C6588897EADAEA0B6B7A7B5B6A6B5B6A7B5B6A9B3
          B4A8B5B6A9B8B9AAB6B7A7B5B6A7B4B6A9B0B1A6D8D8D3FFFFFFFFFFFFFDFDFD
          CBCCC4B3B4A6B7B8AAB8B9AAA2A3975555504E4E4995968AB8B9AAB8B9AAA8A9
          9C50504B11111005050505050410100F4B4C45A6A798B9BAAAB9BAAA9D9E9255
          554F5B5C54A6A798B9BAAAB7B8ABB4B5ABBEBFB6F7F7F6FFFFFFFFFFFFFFFFFF
          F4F4F2BDBEB3B7B8A9BCBDAF797A710A0A0A03030453534CB9BAAABABBAB6465
          5B0707070606060707070707070606060606065B5C53B9BAABBBBCAE62635B04
          0404222221939489BBBCAEB9BAAEB6B7ADE7E8E5FFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFEBEBE8BBBBB0BABBAFA0A19748484332322F7D7E73BDBEAEB5B6A63A3A
          3505050608080807070708080808080806060632322EB1B2A5BEBFB28485793E
          3F3B979791B8B9ABBBBCAEB6B7ACDDDEDAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFEAEBE8BDBEB4B9BAAEB7B8ACB2B3A7BCBDB0BFC0B2BABBAC4647
          410505050707070707070707070707070303043A3B37B5B6ACBEBFB4BCBDAEB1
          B2A3BCBDADBCBDADB9BAADDDDEDAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFF2F2F0C8C9C0B8B9ADBEBFB4C0C1B7BFC0B6C0C1B78889
          812929272221222020202222222C2C2C3A3A3882827AC0C1B6C0C1B5C1C2B5C1
          C2B4BABCACC0C1B5E8E8E5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFCFCFBDFDFDBC0C0B9B8B9B1BDBDB6C0C1BABEBE
          B8A6A6A0B8B9B5D4D4D2DADAD9DADAD7C0C1B8C0C1B3C3C4B6C0C1B3BBBCAFBC
          BDB2D5D6D0F7F7F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8F8E1E1DEC9C9C4BCBDB7BABA
          B5BCBCB7C2C2BDD3D3CED6D7D0CACBC1BFC0B3BDBEAFBDBEB1C5C6BCDADAD5F3
          F4F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEF3F3F2E4E4
          E2D6D7D3CDCEC9C8C9C3C8C8C2CCCCC5D4D5CEE0E1DCEFEFEDFCFCFBFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
        Caption = '&Films'
        ShortCut = 16454
        OnClick = Films1Click
      end
      object Salles1: TMenuItem
        Caption = '&Salles'
        ShortCut = 16467
      end
      object Sance1: TMenuItem
        Bitmap.Data = {
          360C0000424D360C000000000000360000002800000020000000200000000100
          180000000000000C000000000000000000000000000000000000FFFFFFFFFFFF
          FBFBFBE7E7E7E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1
          E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1
          E1E1E1E1E1E1E1E1E1E1E1E1E1E1EBEBEBFEFEFEFFFFFFFFFFFFFFFFFFFFFFFF
          E7E7E69A999692908E93928F92918F92918F92918F92918F91918F91918F9191
          8F92918F91908E91908E91908E91908E91908E91908E908F8D908F8D908F8D90
          8F8D908F8E91908E91908E908E8CA8A7A6F6F6F6FFFFFFFFFFFFFFFFFFFFFFFF
          E6E6E69896927971646F614B75664E7A6A4F806E518673528A76548B77548C78
          558E7A56927E5997855D9D8C61A19164A49568A89A6DACA076B1A77EB4AB82B4
          AA80B2A578AD9D6EA69465968D78A5A4A2F6F6F6FFFFFFFFFFFFFFFFFFFFFFFF
          E8E8E89B9A9659472E482B00583704664108744C0B82560F8B5E128F62149265
          15976B19A07520AC842BB99436C3A141CBAC4CD3B85CDCC66EE5D37EEBD984EB
          D87DE7CE6DDFC05AD3B047A69565A9A8A7F7F7F7FFFFFFFFFFFFFFFFFFFFFFFF
          E9E9E89F9E9A5A4931482B005937056A43097B4F0C8C5B109765129E6B15A371
          18A9791CB18323BB9230C6A240D1B152D9BF64E0CA74E7D482ECDB8AEFDE8BEF
          DC85EBD679E8CE6CE1C35EB0A072ADACAAF7F7F7FFFFFFFFFFFFFFFFFFFFFFFF
          EAEAE9A4A29F6B5D49563B155C39096B4106814F09965E0CA66B0FB17612B880
          16BF8B1BC59624CEA332D6B246DFC15EE6CF74EAD883EDDC8AEEDD8BEDDB87EB
          D881E9D47AE7CF72E3C767B3A579B0B0AEF8F8F8FFFFFFFFFFFFFFFFFFFFFFFF
          EBEBEAA9A7A47466546B533373542B794E1988510A9F5E06B46F08C38111CE93
          1ED49F26D9AA2FDEB53DE4C14FEACD62EFD875EFDB80EBD782E7D27EE3CC76DF
          C670DCC26BDABE64D6B85BB1A277B5B4B3F8F8F8FFFFFFFFFFFFFFFFFFFFFFFF
          ECECEBAEADA97A6B557258347E5F378C66369C6A2CAD6C17BF770DE1B671F1D7
          A8F2D9A8F3DBAAF4DDADF5DFB1F1D98EF2D665ECD270ECD69ADCBF70D1B057C9
          A752C3A24DC09E48BA9740A7966FBAB9B8F8F8F8FFFFFFFFFFFFFFFFFFFFFFFF
          EDEDECB3B2AE87755A8366398B6B3C97713DA97A3EBD863CCD933DF1D9B2FCEE
          D7FCECD4FCECD4FBECD4FCEDD6F6E2ABEFD05BF2DDA2F7E6C8D2AB58BE9134B0
          8531A57C2D9F772A9770239B8966BFBEBDF9F9F9FFFFFFFFFFFFFFFFFFFFFFFF
          EEEEEEB9B8B49985639C7E46A3834BAB874DB78D4EC6974FD6A65AF3E0C0FCF1
          DEFCF0DCFCF0DCFCF0DCFCF1DFF6E2ABF2DA90FCF0DEF8EAD1CD9E42B27B189E
          6B178C5E15805713764F0E8F7E60C4C4C2F9F9F9FFFFFFFFFFFFFFFFFFFFFFFF
          EFEFEFBEBDBAAD9970BA9C5AC0A261C4A664CBAA67D5B069DFBA72F5E7CDFDF5
          E9FDF5E7FDF5E7FDF5E7FDF5EAF5E3AFF2DB96FEF6ECF9EEDACD9936AF700695
          5C087D4C086B42075F3A0488785FC9C9C7F9F9F9FFFFFFFFFFFFFFFFFFFFFFFF
          F0F0F0C4C2BFBEAB7ED3B870D8BF78DBC37CDFC67FE4CA81E8CE89F8EEDBFEFA
          F4FEF9F2FEF9F2FEF9F2FEFBF6F6E5B7E8BD3EF4E1B5FAF2E5C99534AB6A018F
          5604764604623A04533101857761CECECCFAFAFAFFFFFFFFFFFFFFFFFFFFFFFF
          F1F1F1C9C8C4C7B586E0C77CE5CF86E8D48BEAD78FEDDA92EEDC96F6EED5FCFA
          F4FCF9F2FCF8F1FCF8F0FCF8F1EEDCADDFB238D8AB3CE4CEA2BE8D35A0640389
          53057244046039044F2F00867864D3D2D0FAFAFAFFFFFFFFFFFFFFFFFFFFFFFF
          F2F2F2CECCC9C6B384DCC277E4CD83E9D58CECDB93EFDF99EFE09AEBDC9DE7D8
          A0E3D297E0CA8CDCC380D9BC75D3B059CFA748C89E41BF9542AB7C28935F0B80
          4F076D43065E39054F2F00897B67D7D6D5FAFAFAFFFFFFFFFFFFFFFFFFFFFFFF
          F3F3F3D2D1CEBCA77ACBAC65D7BB73E1C981E8D58EECDB97EBDA98E4D28EDBC7
          7FD4BC71CFB364CBAC5BC7A452C29D4CBC9748B69046AF8943A6803E966F307E
          57196943095C39055030018C7E69DBDAD9FBFBFBFFFFFFFFFFFFFFFFFFFFFFFF
          F4F4F4D6D4D1AB956FB1904FC2A35FD1B570DEC783E4D190E2D190DAC784CFB8
          71C6AB61C0A457BD9E52B8984EB2914AAC8A47A78545A280439C7B4194753E8A
          6C39795B2A6445145132038F816BDFDEDDFBFBFBFFFFFFFFFFFFFFFFFFFFFFFF
          F6F6F6D9D8D599856794733EA98A4EBDA061CFB674D8C481D8C582D0BC77C6AE
          66BDA257B6994EB2944AAB8D47A585449F80429D7E429B7C429678408F723D85
          6A397D6437765C33674D23998C78E3E3E1FCFCFCFFFFFFFFFFFFFFFFFFFFFFFF
          E2E1E0C9C4BD94836C886E4A77603A7A653D897549AB9766BFAC76BBA770A892
          5C846F3C7F69368069379C824EA086539C8252836B3F6E582F6C572F745D368C
          744C87704B806A485D4A2E756D61AAAAA9EAEAEAFFFFFFFFFFFFFFFFFFFFFFFF
          8887859B9284EBDDC6EEDFC79D94852C2A271E1D1B555048D5C7B1F2E3CADDCF
          B9615C53201E1C24221F7E7669E8D9C1F2E2C9C0B4A13F3C371E1C1B302D29A8
          9D8CEFE0C8ECDDC6978E802A2928232424ACACACFFFFFFFFFFFFFFFFFFFEFEFE
          7A7A7A383735979187EBE2D3FDF3E4ABA69D4A48463E3D3A7A756EE8DFD0FFF8
          E8E6DED175726D3F3D3B4543409F998FF8EEDFFFF7E7CAC3B85A57543D3C3A55
          524EC4BCB0FFF6E6FBF2E2A5A098474543B2B1B0FFFFFFFFFFFFFFFFFFFEFEFE
          80807F3937353D3C3A6C6A66C5C1BAECE8E0AEAAA45E5A5557534E85817AE3DE
          D6F5F0E8E3DED785817B5A56515D5954A6A19AEFEAE2F4EFE7C9C5BE6A666155
          514C64605BC0BBB4EEEAE2EBE7DFA5A19BBFBEBCFFFFFFFFFFFFFFFFFFFEFEFE
          84838252504E444341403E3C535250989796AEACAB9C9A989A98969D9C99B3B1
          AEBEBCB9C1BFBCB7B5B2A6A4A1A4A29FA6A3A1B8B6B3B8B7B4B6B4B2A09F9D92
          918F8E8C8B949391A2A1A0A09F9E9E9E9DDDDDDCFFFFFFFFFFFFFFFFFFFEFEFE
          898786504D4A4A4745575450A09D97EAE8E4FAF9F7FCFCFCFFFFFFFFFFFFFFFF
          FFFEFEFEFDFDFDFEFEFEFFFFFFFFFFFFFFFFFFFDFDFDFDFDFDFDFDFDFEFEFEFF
          FFFFFFFFFFFEFEFEFDFDFDFDFDFDFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFEFEFE
          8C8A884D4A467B7770D0C8BBFAF0DFF4EBDBB8B2A87574738E8E8EB4B4B4E6E6
          E4FAF9F8FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFC
          9F9D9AADA8A0F3ECE1FFFAECEBE3D698928A42413F2929293130307D7973E1D9
          CAF5ECDDF0E9DDC4C1BDB9B9B9D8D8D9EEEEEEFCFCFCFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFE
          D3D2D1BBB9B4CCC8C2C2BEB77A767054514C534F4B706C67BDB8AFF9F0E3FFF8
          E8EEE5D69892893E3D3B2B2B2C4040409A9790EDE6DAF3EEE5F3F0EBE5E4E4F1
          F1F1FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FCFCFCEDEDEDDCDCDCC3C3C3A5A4A48D8C8B868482C0BCB7E7E2D9F2ECE2CFC9
          BF7C77714F4C484947435F5D59AFAAA1F3EADAFFF5E3EDE3D297918847474651
          52527F7F7ED8D5CFF5F2ECF9F7F4FCFCFBFEFEFEFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFCFCF1F1F1E1E1E1D3D3D2C9C8C7A2A1
          9F817F7D716E6B8A8781DCD7CDFEF7EBFCF4E8D3CCC07F7A734845423D3B3959
          5753B4ADA2F4EAD8FBF0DEE0D7C89C9994E8E8E8FFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFB
          FBF2F2F2E2E2E1D6D6D5D0CFCDCDCBC8BDBAB67977735D5956605C579F9A92EB
          E4D8FFFAECFCF3E5CCC4B86E6A645F5E5CEFEFEFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFEFEFEF8F8F9EDEDEDDCDCDCC3C3C3B0AFAEC2BFBCCC
          C8C3D3CFC7A09B945E5A55504C478C8A87FDFDFDFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7E9
          E9EAD7D7D7B7B7B6979695848281C8C7C6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFAFAFAFFFFFFFFFFFFFFFFFFFFFFFF}
        Caption = 'S�anc&es'
        ShortCut = 16453
      end
    end
  end
end
