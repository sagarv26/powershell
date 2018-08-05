
param($Sku = 
    (Get-CimInstance Win32_OperatingSystem).OperatingSystemSku)

Set-StrictMode -Version 3

switch ($Sku)
{
    0   { "An unknown product"; break; }
    1   { "Ultimate"; break; }
    2   { "Home Basic"; break; }
    3   { "Home Premium"; break; }
    4   { "Enterprise"; break; }
    5   { "Home Basic N"; break; }
    6   { "Business"; break; }
    7   { "Server Standard"; break; }
    8   { "Server Datacenter (full installation)"; break; }
    9   { "Windows Small Business Server"; break; }
    10  { "Server Enterprise (full installation)"; break; }
    11  { "Starter"; break; }
    12  { "Server Datacenter (core installation)"; break; }
    13  { "Server Standard (core installation)"; break; }
    14  { "Server Enterprise (core installation)"; break; }
    15  { "Server Enterprise for Itanium-based Systems"; break; }
    16  { "Business N"; break; }
    17  { "Web Server (full installation)"; break; }
    18  { "HPC Edition"; break; }
    19  { "Windows Storage Server 2008 R2 Essentials"; break; }
    20  { "Storage Server Express"; break; }
    21  { "Storage Server Standard"; break; }
    22  { "Storage Server Workgroup"; break; }
    23  { "Storage Server Enterprise"; break; }
    24  { "Windows Server 2008 for Windows Essential Server Solutions"; break; }
    25  { "Small Business Server Premium"; break; }
    26  { "Home Premium N"; break; }
    27  { "Enterprise N"; break; }
    28  { "Ultimate N"; break; }
    29  { "Web Server (core installation)"; break; }
    30  { "Windows Essential Business Server Management Server"; break; }
    31  { "Windows Essential Business Server Security Server"; break; }
    32  { "Windows Essential Business Server Messaging Server"; break; }
    33  { "Server Foundation"; break; }
    34  { "Windows Home Server 2011"; break; }
    35  { "Windows Server 2008 without Hyper-V for Windows Essential Server
           Solutions"; break; }
    36  { "Server Standard without Hyper-V"; break; }
    37  { "Server Datacenter without Hyper-V (full installation)"; break; }
    38  { "Server Enterprise without Hyper-V (full installation)"; break; }
    39  { "Server Datacenter without Hyper-V (core installation)"; break; }
    40  { "Server Standard without Hyper-V (core installation)"; break; }
    41  { "Server Enterprise without Hyper-V (core installation)"; break; }
    42  { "Microsoft Hyper-V Server"; break; }
    43  { "Storage Server Express (core installation)"; break; }
    44  { "Storage Server Standard (core installation)"; break; }
    45  { "Storage Server Workgroup (core installation)"; break; }
    46  { "Storage Server Enterprise (core installation)"; break; }
    46  { "Storage Server Enterprise (core installation)"; break; }
    47  { "Starter N"; break; }
    48  { "Professional"; break; }
    49  { "Professional N"; break; }
    50  { "Windows Small Business Server 2011 Essentials"; break; }
    51  { "Server For SB Solutions"; break; }
    52  { "Server Solutions Premium"; break; }
    53  { "Server Solutions Premium (core installation)"; break; }
    54  { "Server For SB Solutions EM"; break; }
    55  { "Server For SB Solutions EM"; break; }
    56  { "Windows MultiPoint Server"; break; }
    59  { "Windows Essential Server Solution Management"; break; }
    60  { "Windows Essential Server Solution Additional"; break; }
    61  { "Windows Essential Server Solution Management SVC"; break; }
    62  { "Windows Essential Server Solution Additional SVC"; break; }
    63  { "Small Business Server Premium (core installation)"; break; }
    64  { "Server Hyper Core V"; break; }
    72  { "Server Enterprise (evaluation installation)"; break; }
    76  { "Windows MultiPoint Server Standard (full installation)"; break; }
    77  { "Windows MultiPoint Server Premium (full installation)"; break; }
    79  { "Server Standard (evaluation installation)"; break; }
    80  { "Server Datacenter (evaluation installation)"; break; }
    84  { "Enterprise N (evaluation installation)"; break; }
    95  { "Storage Server Workgroup (evaluation installation)"; break; }
    96  { "Storage Server Standard (evaluation installation)"; break; }
    98  { "Windows 8 N"; break; }
    99  { "Windows 8 China"; break; }
    100 { "Windows 8 Single Language"; break; }
    101 { "Windows 8"; break; }
    103 { "Professional with Media Center"; break; }

    default {"UNKNOWN: " + $SKU }
}
