param(
    [string]$localPath = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxx.github.io\public\",
    [string]$ftpUri = "xxxxxxxxxxxxxxxxxxxxx/web/",
    [string]$username = "xxxxxxxxxxxxxx",
    [string]$password = "xxxxxxxxx"
)

function UploadDirectory($localFolder, $ftpFolder) {
    # Ensure the FTP path ends with a slash
    if (-not $ftpFolder.EndsWith("/")) {
        $ftpFolder += "/"
    }

    # Create the FTP request to create the directory
    $ftpRequest = [System.Net.FtpWebRequest]::Create($ftpFolder)
    $ftpRequest.Method = [System.Net.WebRequestMethods+Ftp]::MakeDirectory
    $ftpRequest.Credentials = New-Object System.Net.NetworkCredential($username, $password)
    try {
        $ftpResponse = $ftpRequest.GetResponse()
    } catch [System.Net.WebException] {
        # Directory may already exist or some other error - handle as needed
    }

    # Upload each file in the directory
    Get-ChildItem $localFolder -File | ForEach-Object {
        $localFile = $_
        $ftpFilePath = $ftpFolder + $localFile.Name
        $fileContent = [System.IO.File]::ReadAllBytes($localFile.FullName)

        $ftpRequest = [System.Net.FtpWebRequest]::Create($ftpFilePath)
        $ftpRequest.Method = [System.Net.WebRequestMethods+Ftp]::UploadFile
        $ftpRequest.Credentials = New-Object System.Net.NetworkCredential($username, $password)
        $ftpRequest.ContentLength = $fileContent.Length
        $ftpRequest.UseBinary = $true

        $requestStream = $ftpRequest.GetRequestStream()
        $requestStream.Write($fileContent, 0, $fileContent.Length)
        $requestStream.Close()

        $ftpResponse = $ftpRequest.GetResponse()
        Write-Host "Uploaded: $ftpFilePath"
    }

    # Recursively upload subdirectories
    Get-ChildItem $localFolder -Directory | ForEach-Object {
        $subDir = $_
        UploadDirectory $subDir.FullName ($ftpFolder + $subDir.Name)
    }
}

# Start the upload process
UploadDirectory -localFolder $localPath -ftpFolder $ftpUri

Write-Host "Upload complete."
