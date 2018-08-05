
#############################################################################
#
# -SourceFolder    = The folder with the files you intend to zip
# -DestinationFile = The zip file that you intend to create
# -Compression     = The type of compression you'd like to use:
#                         Optimal (default option)
#                         Fastest
#                         NoCompression
# -IncludeParentDir = Setting this option will include the parent directory
#
#############################################################################

$SourceFolder    = "C:\temp\Zip This Folder"
$DestinationFile = "C:\temp\NewZip.zip"
$Compression     = "Optimal"  # Optimal, Fastest, NoCompression

Zip-Directory -DestinationFileName $DestinationFile `
    -SourceDirectory $SourceFolder `
    -CompressionLevel $Compression ` #Optional parameter
    -IncludeParentDir #Optional parameter

function Zip-Directory {
    Param(
      [Parameter(Mandatory=$True)][string]$DestinationFileName,
      [Parameter(Mandatory=$True)][string]$SourceDirectory,
      [Parameter(Mandatory=$False)][string]$CompressionLevel = "Optimal",
      [Parameter(Mandatory=$False)][switch]$IncludeParentDir
    )
    Add-Type -AssemblyName System.IO.Compression.FileSystem
    $CompressionLevel    = [System.IO.Compression.CompressionLevel]::$CompressionLevel  
    [System.IO.Compression.ZipFile]::CreateFromDirectory($SourceDirectory, $DestinationFileName, $CompressionLevel, $IncludeParentDir)
}

#############################################################################
