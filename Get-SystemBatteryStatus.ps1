
    try {
        Add-Type -Assembly System.Windows.Forms
        [System.Windows.Forms.SystemInformation]::PowerStatus
    } catch {
        $PSCmdlet.ThrowTerminatingError($_)
            }
