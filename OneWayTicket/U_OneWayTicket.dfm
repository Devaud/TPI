object FrmOneWayTickets: TFrmOneWayTickets
  Left = 2050
  Top = 145
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'OneWay Tickets'
  ClientHeight = 389
  ClientWidth = 620
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Arial'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 14
  object lblHeureCourante: TLabel
    Left = 297
    Top = 304
    Width = 42
    Height = 14
    Caption = '10:00:00'
  end
  object Label2: TLabel
    Left = 272
    Top = 288
    Width = 92
    Height = 13
    Caption = 'Heure actuelle :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object BtnSeancePrecedente: TButton
    Left = 16
    Top = 280
    Width = 177
    Height = 41
    Caption = 'Afficher les s�ances pr�c�dentes'
    TabOrder = 0
  end
  object BtnSeanceSuivante: TButton
    Left = 432
    Top = 280
    Width = 177
    Height = 41
    Caption = 'Afficher les s�ances suivantes'
    TabOrder = 1
  end
  object BtnReserverAvance: TButton
    Left = 16
    Top = 336
    Width = 593
    Height = 41
    Caption = 'R�server une s�ance en avance'
    TabOrder = 2
  end
  object MainMenu1: TMainMenu
    Left = 40
    Top = 8
    object Fichier1: TMenuItem
      Caption = 'Fichier'
      object Quitter1: TMenuItem
        Bitmap.Data = {
          360C0000424D360C000000000000360000002800000020000000200000000100
          180000000000000C000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000090F14365A78426F934B7CA469A6DA0000000000005C5C5C
          5C5C5C5C5C5C5C5C5C5C5C5C5C5C5C5D5C5A5D5B595C5A5A5A5A5A5A5A5B5A5A
          5B5A5A5B5A5A5B5A5A5B5A5A5B5A5A5B5A5A5B5A5A5B5A5A5B5A5A5A5C595757
          6570536E834E7B9F4C7FAA4C7FA94B7EA85081A867A4D8000000000000000000
          000000000000000000000000000000000000386CA1706B666D6B696D6B6A6D6B
          6A6D6B6A6D6B6A6D6B6A6D6B6A6D6B6A6D6B6A6D6B6A6D6B6A6D6A686F68644A
          86B54C83AE4D82AC4D81AA4D81AA4C80A95786AC66A3D6000000000000000000
          0000000000000000000000000000000000003C6B9C6D67616A67656967666967
          666967666967666967666967666967666967666967666967666A67656C645F4B
          85B44E83AE4E82AC4E82AC4E82AC4C80AB5B8BB164A1D3000000000000000000
          0000000000000000000000000000000000003D6B9C6B66606866646766656766
          6567666567666567666567666567666567666567666567666567666469635D4B
          86B64E83AF4E83AE4E83AE4E83AE4C81AD628FB3629FD2000000000000000000
          0000000000000000000000000000000000003F6C9D6A635E6764626664636664
          6366646366646366646366646366646366646366646366646366646269615B4D
          87B74F84B04F84AF4F84AF4F84AF4D82AD6694B8619DCF000000000000000000
          000000000000000000000000000000000000416D9F68605C6462606462616462
          6164626164626164626164626164626164626164626164626164615F665E594E
          8AB95087B25086B15086B15086B14D84AF6C99BA609CCE000000000000000000
          000000000000000000000000000000000000446DA4665F5B62615F6261606261
          6062616062616062616062616062616062616062616062616062605F645D574F
          8BBC5188B55187B35187B35187B34E85B1729CBF5E9ACC000000000000000000
          000000000000000000000000007B41009246476CA7655D59615F5D615F5E615F
          5E615F5E615F5E615F5E615F5E615F5E615F5E615F5E615F5E615E5C635B5550
          8CBD5289B65288B45288B45288B44F86B378A1C35C98CA000000000000000000
          00000000000000000000773F00C885008F45486CA8645A57615C5B605D5C5F5D
          5C5F5D5C5F5D5C5F5D5C5F5D5C5F5D5C5F5D5C5F5D5C5F5D5C5F5C5A60585352
          8EBF538AB85389B65389B65389B64D82AD7CA5C65B96C8000000000000000000
          00000000000000763E00C08000E5A5008A434E6AAA69535765555A62575B5F5A
          5B5D5B5B5D5B5B5D5B5B5D5B5B5D5B5B5D5B5B5D5B5B5D5B5B5D5A595E565153
          90C1548CB9548BB7548BB7548BB7497BA282AACA5A95C5000000000000000000
          00000000773E00BC8100DBA000DCA1008440008A42008D440090471A7D506057
          595C5A595B5A595B5A595B5A595B5A595B5A595B5A595B5A595B59575C554F54
          91C3558DBB558CB9568BB8578AB745709687ADCD5892C4000000000000000000
          00773E00BA8000D6A000D39C00D39C00D89F00DAA100DAA135EABD0091476152
          575A575759585759585759585759585759585759585759585759575559524C56
          93C4568EBC568DBA588BB73AA8DF23B8F78EB1CF5791C1000000000000007C42
          00B88100D29F00CE9B00CD9A00CD9A00CF9B00CF9B00CF9A51E6C3008E44604F
          555A555658565658565658565658565658565658565658565658555458504B57
          95C75790BE588FBB5A8CB827B8F55482AE92B4D25590BE000000000000008A48
          2CDCB707CDA100C99900C99A00C99900C99900C89800C8976BE7CD008D435E4E
          53585454565554565554565554565554565554565554565554565452564F4958
          96C95891C05990BD5C8DBA27BAF74F7BA497B8D7558EBD000000000000008A49
          00B38162E0C700C69A00C59900C49800C39800C39800C39786EAD8008E435B4B
          52565253545353545353545353545353545353545353545353545251534D4859
          97CA5992C15A91BE5C8EBC27B9F74A72999DBDD9538CBB000000000000000000
          00854500AF7F60DCC600C09793E6D74DE7D14FE9D34CEAD49AF2E6009146594A
          5055505153515153515153515153515153515153515153515153504F524A455B
          99CD5A93C35A92C15C90BF3BA9E121B7F6A0BFD9528ABA000000000000000000
          00000000844300AB7F5AD9C481E3D600833900893E008D4200914615794C564B
          4E524E4F514F4F514F4F514F4F514F4F514F4F514F4F514F4F514E4D5048435C
          9BCE5B95C45B94C25C94C15C92BF588FBEA5C3DD5089B7000000000000000000
          00000000000000844300AA7F79E3D7008B3F5172B157434755474C544A4E514D
          4E4F4E4E4F4E4E4F4E4E4F4E4E4F4E4E4F4E4E4F4E4E4F4E4E4F4D4C4E46415C
          9DD15B96C65B95C45B95C45A94C35691C2A9C6E14F87B6000000000000000000
          00000000000000000000854400AC85008F434E78B25046454E4A4A4E4B4C4D4C
          4C4D4C4C4D4C4C4D4C4C4D4C4C4D4C4C4D4C4C4D4C4C4D4C4C4D4B4A4B443F5E
          9ED35C97C85C96C65C96C65B95C65693C4ADCAE34D85B3000000000000000000
          000000000000000000000000008B480091464D7AB24E45424C49484C4A4A4C4A
          4A4C4A4A4C4A4A4C4A4A4C4A4A4C4A4A4C4A4A4C4A4A4C4A4A4C49484A423D5F
          9FD45D98C95D97C75D97C75C96C75793C5B2CFE64C84B1000000000000000000
          0000000000000000000000000000000000004D7CB24B44414A48474A49494A49
          494A49494A49494A49494A49494A49494A49494A49494A49494A484748413C60
          A1D75E9BCB5E99C95E99C95D98C95895C7B6D2E84A82B0000000000000000000
          0000000000000000000000000000000000004B7FB048423E4846454847474847
          47484747484747484747484747484747484747484747484747484545463E3961
          A3D85F9CCC5F9ACA5F9ACA5E99CA5996C8BBD5EB4981AD000000000000000000
          0000000000000000000000000000000000004A7FAF463F3B4644434645454645
          45464545464545464545464545464545464545464545464545464343433C3762
          A4DA609CCE609BCC609BCC5F9ACC5997CAC0D9ED477EAB000000000000000000
          0000000000000000000000000000000000004980AD453E394542414543424543
          4245434245434245434245434245434245434245434245434244414040393460
          A2DB5E9BD05F9BCE619CCE5F9BCE5A98CCC5DCF0467DAA000000000000000000
          0000000000000000000000000000000000004980AC413730423B36423C37423C
          37423C37423C37423C37423C37423C37423C37423C37423C37413A353B322ABC
          DCF77AAED95B9ACD5F9CCE5F9CCE5A9ACDC9DFF2457CA7000000000000000000
          000000000000000000000000000000000000487CA54A82AE4B83B04B83B14B83
          B14B83B14B83B14B83B14B83B14B83B14B83B14B83B14B83B14A82AF447CA980
          A9CBB9D3EAA7C9E56CA4D35B9ACF5999CFCDE2F3437AA6000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000B9D1E6C2DBEE9AC2E25A9AD0CFE3F54177A3000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000A3B9CBBFD6EBBDD6EDD3E7F74076A2000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000B4C9DDCEE3F63E759F000000}
        Caption = 'Quitter'
        ShortCut = 16465
        OnClick = Quitter1Click
      end
    end
    object Administration1: TMenuItem
      Caption = 'Administration'
      object Connexion1: TMenuItem
        Bitmap.Data = {
          360C0000424D360C000000000000360000002800000020000000200000000100
          180000000000000C000000000000000000000000000000000000000000000000
          0000000502010000000000000000006B2F130603010000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000000B0502000000
          0000000000000D05011709031307020702000000000000000000000000000000
          0000000025100702010000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          220E054A23106C361D7D4024783E226A351C5A2C164A23113A1A0C2B13071D0C
          040F050103000000000000000000000000000000000000000010070301000000
          0000000000000000000000000000000000000000000000000000652C12301408
          65321A8E4E2FAD613DB2633EAA5F3CA75D39A75D39A55B379E57349450308648
          29773E2366341C562A1545210F35180A2610061809030B030000000000000000
          0000000000000000000000692E12030101000000000000000000FFB25A5F2C14
          894C2E9F5B3BB36642C29780BBA599AD9081A47E6BA2725AA26A4EA66647AA65
          43AE6642B06640AE633FA85F3B9F5936925030834629733C2162311A51271440
          1E0E301509220E05140702060100000000000000000000FFFF990000006D351A
          925335A15C3BB87351DED9D4E8F2F3E6EFEFE3EAEADEE3E1D8D8D5CFC9C3C7BA
          B0C0AA9CBB9B88B98E76B88467BA7E5DBC7955BD7650BD724CB96E48B36843A9
          613D9C58368E4E2E7E43266C381F5127132510060000000000000000006E361B
          955637A35E3DBB7857E0DEDAE6EFEFE6EEEEE6EEEEE6EFEFE7EFF0E7F0F1E8F1
          F1E7F0F1E6EEEFE4EBEAE1E4E2DDDBD6DAD1C8D7C5B7D5B9A6D4AD95D4A285D3
          9977D3916BD08961CC8158C3774FAE6641783E22341608873B180000006F371C
          985939A6613FBC7958E0DEDAE6EFEFE6EEEEE6EEEEE6EEEEE6EEEEE6EEEEE6EE
          EEE6EEEEE6EEEEE6EEEEE6EFEFE7EFF0E7F0F0E7F0F1E7F0F0E6EEEEE6EBEAE5
          E7E3E5E1DAE6D9CDE7C9B4E7A881D3885EAE664169331900000000000070381C
          9C5C3CA96441BD7A59E1DEDAE6EFEFE6EEEEE6EEEEE6EEEEE6EEEEE6EEEEE6EE
          EEE6EEEEE6EEEEE6EEEEE6EEEEE6EEEEE6EEEEE6EEEEE6EEEEE6EEEEE6EEEEE6
          EEEFE6EFEFE6EFF0E6F0F0E9D6C7E6A075C0754E7C402200000000000071381D
          9F5F3FAC6743BE7B5AE1DEDAE6EFEFE6EEEEE6EEEEE6EEEEE6EEEEE6EEEEE6EE
          EEE6EEEEE6EEEEE6EEEEE6EEEEE6EEEEE6EEEEE6EEEEE6EEEEE6EEEEE6EEEEE6
          EEEEE6EEEEE6EEEEE6EFEFE7E6E2E6A983C57A527F422500000000000072391E
          A36342B06A46BF7D5BE1DFDAE6EFEFDDE5E5E3EBEBE8F0F0EAF2F2EAF2F2E9F1
          F1E8F0F0E7EFEFE6EEEEE6EEEEE6EEEEE6EEEEE6EEEEE6EEEEE6EEEEE6EEEEE6
          EEEEE6EEEEE6EEEEE6EEEFE6E7E3E3A883C67C53804325000000000000733A1F
          A86745B36D49C07E5CE0DED9979C9D6B6D6D777A7A818585909595A3A9A9B6BD
          BDC8D0D0D6DEDEE0E8E8E6EEEEE9F1F1EAF2F2E9F1F1E8F0F0E7EFEFE6EEEEE6
          EEEEE6EEEEE6EEEEE6EEEFE5E7E3DFA480C77D54814426000000000000743B20
          AC6B48B7704BC2805FCBC8C47E8080D8D8D88C8C8CA7A7A7B5B5B59FA0A08B8B
          8B7D7E7E7577777678787E81818B8F8F9EA3A3B0B7B7C3CACAD2D9D9DDE5E5E4
          ECECE8F0F0EAF2F2E8F0F0E5E6E2DBA17EC97F56824527000000000000763D21
          B06E4BBA744EC48260C4C1BD929494FEFEFE8C8C8CDCDCDCFFFFFFFFFFFFFFFF
          FFFCFCFCF3F3F3E6E5E5D5D5D5BFBFBFAAAAAA9596968586867B7C7C797B7B7D
          8080888C8C9A9F9FCDD5D5E6E7E3D69D7BC98057834628000000000000773E21
          B5734EBE7751C58361C5C2BE919393FFFFFF979797E3E3E3FFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8F8EDEDEDDE
          DEDECACACAAFAFAF848788D9DAD7D29A78CA8158844729000000000000783F22
          BA7752C27A54C68462C6C3BE919393FFFFFF979797E2E2E2FFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF969898C3C3C0CE9776CB835985482A0000000000007A4023
          BF7B55C67E56C78563C7C4BF909292FEFEFE8E8E8EDFDFDFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF999A9AC0C1BEC89373CC845A86492A0000000000007B4124
          C37F58CA8159C78563D7D4D07B7F7FAFAFAF7C7C7CBABABAEFEFEFF6F6F6FCFC
          FCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF999B9BBFC0BDC38F70CD855B874A2B0000000000007C4225
          C8835CCD855CC78563E3E1DDBBC2C26D70706366666062626465656E6F6F7A7A
          7A8B8B8B9C9C9CB0B0B0C2C2C2D2D2D2E1E0E0ECECECF5F5F5FBFBFBFFFFFFFF
          FFFFFFFFFFFEFEFE939494BEBFBCBE8B6DCD865C874B2C0000000000007D4326
          CC875FD1885FC88663E2E0DBE8F1F1E4ECECDDE5E5D4DBDBC8CFCFBAC1C1ABB1
          B19AA0A08A8F8F7C80806F7272696B6B6466666869696E6E6E7A7A7A89898999
          9999ADADADADADAD6F7071C7C8C5B88669CE875D884C2D0000000000007E4427
          D18B62D48B61C88764E2E0DBE6EFEFE6EEEEE6EEEEE7EFEFE8F0F0E9F1F1E9F1
          F1EAF2F2EAF2F2E8F0F0E5EDEDE0E8E8D8E0E0CED6D6C1C8C8B3BABAA3A8A892
          97978489897579799FA5A5DEE0DDB18064CE885E894D2E0000000000007F4527
          D58E65D88E63C98865E2E0DBE6EFEFE6EEEEE6EEEEE6EEEEE6EEEEE6EEEEE6EE
          EEE6EEEEE6EEEEE6EEEEE6EEEEE6EEEEE7EFEFE7EFEFE8F0F0E9F1F1EAF2F2EA
          F2F2E9F1F1E7EFEFE8F1F1DFE1DFAC7C61CF895F8A4E2E000000000000804628
          D99268DB9166C98763E2E0DAE7F0F0E7EFEFE7EFEFE7EFEFE6EEEEE6EEEEE6EE
          EEE6EEEEE6EEEEE6EEEEE6EEEEE6EEEEE6EEEEE6EEEEE6EEEEE6EEEEE6EEEEE6
          EEEEE6EEEEE6EEEEE6EFEFDEE1DEA8785ECF89608A4F2F000000000000814729
          DC956ADE9469C77E58D0BCAFD1DADBD6DEDFDAE2E3DDE6E6E0E8E9E2EBEBE4EC
          ECE5EDEDE5EDEDE6EEEEE6EEEEE6EEEEE6EEEEE6EEEEE7EFEFE7EFEFE7EFEFE7
          EFEFE7EFEFE7EFEFE7EFF0DEE0DEA3755BCF8A608B4F3000000000000082482A
          E0986DE0966BC77A52C58563BCA293BBB1A9BFB9B2C3C2BDC8CAC8CED2D0D2D8
          D7D5DCDCD8E0E0D9E2E2DAE3E3DAE3E4DBE4E5DBE4E4DCE4E5DCE4E4DBE3E4DB
          E3E3DBE2E2DCE4E4DFE7E7D8DBD89E7057D18B618B503000000000000084492A
          E39B6FE3986DC77B53C97D54CB8058CC855FCE8A64CF8F6BD19674D39D7CD5A4
          86D7AB90D8B299D9B9A4D9BEACD7C3B3D5C7BAD2C8BEC8C2BBC2C1BCBEBEBBB2
          B4B2A1A5A49399988B908F82817C97684CDC96698B4F30000000FFFFFF834829
          E39C70E79D71C77C54C97D55CB8057CE8259D0855BD2875DD5895ED78C60D98E
          62DB9064DE9366E09669E2986CE49B6FE69F73DA966DA76544A76749AD7355AA
          74589D6B539D7059816B78685676A77674DD986F8C50300000008B4B2A733A1D
          CD885FF5AB7CD68A60CA7E55CB8057CD8259CF845BD2875DD48A5FD78C62D98F
          64DB9266DD9468E0976AE2996CE49B6EE79E71D68E63AC613CC77A52B26943A4
          5A37BB6E47B16742634B914448CF514BB9C487728E512F000000602910531E06
          8F5130CD885FE1996DDA9166D98F65D88F64D88E64D88F64D98F64D98F65DA90
          66DB9267DD9468DF966AE1986CE39B6EE69E71D99166AD633FCD835ABB744EA8
          5F3CCE835AC37B55644F9A5059EA5858D3B37969824624FFC689692F13642B11
          571F06763A1D894C2C9153329959379D5D3B9F5F3DA56441A96844AA6945AE6C
          47B26F4AB3704BB5724DB87550BB7752BD7953BE7B54B06D49AD6946B4704BB1
          6D48AE6945B46F4A8F637769549C68508F864E3D682E0F6A311559260F692E13
          652C11824526FFFFC40000000F0000350100491200531C035B220961270D662C
          116B31156E331772361A763A1D783C1F793D207C402380432681442683462885
          482A86482A884A2C894B2B834628783D21662C11834322000000000000000000
          5D2910682E12672D12672D12672D12672D12672D12672D12672D12672D12692E
          136C3116703519783C1F8548299D5D3CFFFFCC0000003602004F1700571F065D
          240A60270D63290F62290E5A21070000006B3116090000592710}
        Caption = 'Connexion...'
        ShortCut = 16466
      end
    end
    object N1: TMenuItem
      Caption = '?'
      object Aproposde1: TMenuItem
        Caption = 'A propos de...'
      end
    end
  end
  object Timer1: TTimer
    Interval = 500
    OnTimer = Timer1Timer
    Left = 8
    Top = 8
  end
end
