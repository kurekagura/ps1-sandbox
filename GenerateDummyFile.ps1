<#
.SYNOPSIS
Creates a dummy file with random data.

.DESCRIPTION
This script creates a dummy file with random data of a specified size in bytes.

.PARAMETER FilePath
Specifies the path where the dummy file will be created. If a relative path is provided, it will be converted to an absolute path based on the current directory.

.PARAMETER FileSizeInBytes
Specifies the size of the dummy file in bytes.

.NOTES
File generation is performed using the System.Security.Cryptography.RandomNumberGenerator class.

.EXAMPLE
.\GenerateDummyFile.ps1 -FilePath ".\2MB.bin" -FileSizeInBytes (2 * 1024 * 1024)
.\GenerateDummyFile.ps1 -FilePath ".\4MB.bin" -FileSizeInBytes (4 * 1024 * 1024)
.\GenerateDummyFile.ps1 -FilePath ".\8MB.bin" -FileSizeInBytes (8 * 1024 * 1024)
.\GenerateDummyFile.ps1 -FilePath ".\16MB.bin" -FileSizeInBytes (16 * 1024 * 1024)
.\GenerateDummyFile.ps1 -FilePath ".\32MB.bin" -FileSizeInBytes (32 * 1024 * 1024)
.\GenerateDummyFile.ps1 -FilePath ".\64MB.bin" -FileSizeInBytes (64 * 1024 * 1024)
.\GenerateDummyFile.ps1 -FilePath ".\128MB.bin" -FileSizeInBytes (128 * 1024 * 1024)
.\GenerateDummyFile.ps1 -FilePath ".\256MB.bin" -FileSizeInBytes (256 * 1024 * 1024)
#>
param (
    [string]$FilePath,
    [int]$FileSizeInBytes
)

# Convert relative path to absolute path
$absoluteFilePath = Join-Path -Path $PWD.Path -ChildPath $FilePath

# Generate random data of specified size in bytes
$randomData = New-Object byte[] $FileSizeInBytes
$randomGenerator = [System.Security.Cryptography.RandomNumberGenerator]::Create()
$randomGenerator.GetBytes($randomData)

# Write data to file
[System.IO.File]::WriteAllBytes($absoluteFilePath, $randomData)

Write-Host "Dummy file created: $absoluteFilePath"

