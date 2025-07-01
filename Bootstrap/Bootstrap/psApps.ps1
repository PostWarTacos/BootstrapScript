<# Matt's Apps to Install at Home
7zip.7zip
Brave.Brave
EpicGames.EpicGamesLauncher
GIMP.GIMP
Insecure.Nmap
Mozilla.Thunderbird
Oracle.VirtualBox
PrivateInternetAccess.PrivateInternetAccess
RevoUninstaller.RevoUninstaller
SteelSeries.GG
Valve.Steam
Overwolf    (separate install)
CurseForge    (separate install)
AlecaFrame    (separate install)
NvidiaApp    (separate install)
Global Protect
Canon Printer Drivers   (gonna be super complex)
KDAN PDF Reader
#>

<# Matt's Apps to Install at Home & Work
AgileBits.1Password
Corsair.iCUE.5
Git.Git
JanDeDobbeleer.OhMyPosh
Microsoft.WindowsTerminal
Notion.Notion
Spotify.Spotify         (NEEDS TO RUNAS USER NOT ADM)
Microsoft.Sysinternals
VSCodium.VSCodium
WinFetch    (separate install)
Manually install DoD Certs        (https://militarycac.com/windows8.htm#Windows_RT)
RuckZuck    (separate install)
Devolutions.RemoteDesktopManager    (work only)
#>

<# Other Apps to List
Ubisoft.Connect
ElectronicArts.EADesktop
WiresharkFoundation.Wireshark
Discord.Discord
GOG.Galaxy
Zoom.Zoom
Microsoft.Teams
ms office 2021      (https://msgang.com/how-to-download-and-install-office-2021-on-windows-10/)
#>

function Install { # Universal winget function
    param (
        [string]$id  # Define the app to install
    )
    
    Write-Output "Downloading and installing $($id.split('.')[1])."
    winget install --id=$id  -e

    $found = winget list --id=$id 2>$null | Select-String "$id"
    If ([bool]$found){ # Returns $true if found, $false if not
        Write-Output "$($id.split('.')[1]) installed successfully."
    }
}

function Install-Winfetch { # Download and install WinFetch. Not available in winget
    winget install --id=Microsoft.NuGet  -e
    Install-Script winfetch -Force
}

function Install-DoDCerts { # Download and install DoD Certs.
    # === NOTE1 ===
    # If you encounter the error "There is a problem with this website's security certificate."
    # you have two options:
    # 1. Manually resolve the certificate issue per your guide.
    # 2. Bypass certificate validation for downloads (uncomment the following line).
    #
    # WARNING: Bypassing certificate validation reduces security.
    # [System.Net.ServicePointManager]::ServerCertificateValidationCallback = { $true }

    # Define URLs for the certificate files using your provided links.
    $allCertsUrl = "https://militarycac.com/maccerts/AllCerts.p7b"
    $doDRootUrl = "https://militarycac.com/CACDrivers/DoDRoot3-6.p7b"

    # Define the Desktop path and target file names.
    $allCertsFile = "{0}\AllCerts.p7b" -f [System.Environment]::GetFolderPath("Desktop")
    $doDRootFile = "{0}\DoDRoot3-6.p7b" -f [System.Environment]::GetFolderPath("Desktop")

    # Download AllCerts.p7b.
    Write-Output "Downloading AllCerts.p7b..."
    try {
        Invoke-WebRequest -Uri $allCertsUrl -OutFile $allCertsFile -UseBasicParsing
        Write-Output "Downloaded AllCerts.p7b to $allCertsFile"
    }
    catch {
        Write-Error "Failed to download AllCerts.p7b: $_"
        Write-Output "If you see a certificate error, please refer to your certificate troubleshooting guide (NOTE1)."
        exit
    }

    # Install AllCerts.p7b into the Intermediate Certification Authorities store (store name: CA).
    Write-Output "Installing AllCerts.p7b into Intermediate Certification Authorities..."
    try {
        certutil -addstore "CA" $allCertsFile
        Write-Output "Successfully installed AllCerts.p7b"
    }
    catch {
        Write-Error "Failed to install AllCerts.p7b: $_"
    }

    # Clean up downloaded AllCerts.p7b file
    Write-Output "Cleaning up downloaded AllCerts.p7b file..."
    try {
        Remove-Item -Path $allCertsFile -Force
        Write-Output "Downloaded AllCerts.p7b file deleted."
    }
    catch {
        Write-Error "Failed to delete AllCerts.p7b file: $_"
    }

    # Download DoDRoot3-6.p7b.
    Write-Output "Downloading DoDRoot3-6.p7b..."
    try {
        Invoke-WebRequest -Uri $doDRootUrl -OutFile $doDRootFile -UseBasicParsing
        Write-Output "Downloaded DoDRoot3-6.p7b to $doDRootFile"
    }
    catch {
        Write-Error "Failed to download DoDRoot3-6.p7b: $_"
        Write-Output "If you see a certificate error, please refer to your certificate troubleshooting guide (NOTE1)."
        exit
    }

    # Install DoDRoot3-6.p7b into the Trusted Root Certification Authorities store (store name: ROOT).
    Write-Output "Installing DoDRoot3-6.p7b into Trusted Root Certification Authorities..."
    try {
        certutil -addstore "ROOT" $doDRootFile -f
        Write-Output "Successfully installed DoDRoot3-6.p7b"
    }
    catch {
        Write-Error "Failed to install DoDRoot3-6.p7b: $_"
    }

    # Clean up downloaded DoDRoot3-6.p7b file
    Write-Output "Cleaning up downloaded DoDRoot3-6.p7b file..."
    try {
        Remove-Item -Path $doDRootFile -Force
        Write-Output "Downloaded DoDRoot3-6.p7b file deleted."
    }
    catch {
        Write-Error "Failed to delete DoDRoot3-6.p7b file: $_"
    }

    # === NOTE2 ===
    # Since the Cross Cert Removal Tool is only written for regular Windows,
    # if you need to clear the certificates later, please follow your manual clearance guide.
    # For example, to remove a certificate manually, you could use:
    #   Remove-Item -Path Cert:\LocalMachine\ROOT\<CertificateThumbprint>
    # Make sure to verify certificate details before removal.

    Write-Host "Certificate installation complete." -ForegroundColor Yellow
    Write-Host "Reminder: If you need to clear installed certificates manually, follow your manual clearance guide (NOTE2)." -ForegroundColor Yellow

}

function Install-NvidiaApp { # Download and install Nvidia App. Not available in winget.    #~~# WORKS IN WIN11 #~~#
    Write-Output "Downloading and installing Nvidia App."
    $downloadURL = "https://www.nvidia.com/en-us/software/nvidia-app/"
    $downloadPage = Invoke-WebRequest -Uri $downloadURL -UseBasicParsing
    $installerURL = $downloadPage.Links | Where-Object { $_.href -match "Nvidia_App_v\d+(\.\d+)*.exe" } | Select-Object -First 1 -ExpandProperty href
    
    if ($installerURL) { # Only download and install if valid URL found
        $installerPath = "$env:TEMP\NvidiaApp.exe"
        Invoke-WebRequest -Uri $installerURL -OutFile $installerPath
        If (Test-Path $installerPath){ # Verify downloaded
            Start-Process -FilePath $installerPath -ArgumentList "/s" -Wait
        }
    }

    $nvidiaApp = Get-AppxPackage -Name NVIDIACorp.NVIDIAControlPanel
    If($nvidiaApp){ # Verify installed
        Write-Output "Nvidia App installed successfully."
    } else {
        Write-Output "Failed to retrieve the latest Nvidia App installer."
    }    
}

function Install-Overwolf { # Download and install Overwolf. Not available in winget
    Write-Output "Downloading and installing Overwolf."
    $downloadURL = "https://download.overwolf.com/install/Download?utm_source=web_app_store"
    $installerPath = "$env:TEMP\OverwolfInstaller.exe"
    Invoke-WebRequest -Uri $downloadURL -OutFile $installerPath
    
    If (Test-Path $installerPath){ # Verify downloaded
        Start-Process -FilePath $installerPath -ArgumentList "/silent" -Wait
    }

    $overwolf = reg query "HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall" /s | findstr /I "Overwolf"
    If($overwolf){ # Verify installed
        Write-Output "Overwolf installed successfully."
    } else {
        Write-Output "Failed to retrieve the latest Overwolf installer."
    } 
}