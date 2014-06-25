cd windows_drivers
inf2cat /v /driver:.\ /os:XP_X86,XP_X64,Vista_X86,Vista_X64,7_X86,7_X64,8_X86,8_X64,6_3_X86,6_3_X64
signtool sign /v /d "Robox Drivers" /t http://timestamp.verisign.com/scripts/timestamp.dll roboxx86.cat roboxx64.cat