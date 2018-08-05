
$CtrList = @(
        "\System\Processor Queue Length",
        "\Memory\Pages/sec",
        "\Memory\Available MBytes",
        "\Processor(*)\% Processor Time",
        "\Network Interface(*)\Bytes Received/sec",
        "\Network Interface(*)\Bytes Sent/sec",
        "\LogicalDisk(C:)\% Free Space",
        "\LogicalDisk(*)\Avg. Disk Queue Length"
        )
    Get-Counter -Counter $CtrList -SampleInterval 5 -MaxSamples 5 | Export-Counter -Path C:\PerfExample.blg -FileFormat BLG -Force
