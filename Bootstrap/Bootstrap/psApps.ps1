<# Matt's Apps to Install at Home
Global Protect
Canon Printer Drivers
KDAN PDF Reader
#>

<# Other Apps to List
ms office 2021      (https://msgang.com/how-to-download-and-install-office-2021-on-windows-10/)
#>

<#
.SYNOPSIS
    Automated application installation and removal for Windows using winget and custom logic.

.DESCRIPTION
    This script provides functions to install and uninstall a curated set of applications for home and work environments.
    It supports both winget-based and manual installations, as well as management of DoD certificates.
    The script is intended to streamline the setup and maintenance of a Windows system with essential tools and utilities.

.NOTES
    Author: Matt
    Requires: Windows PowerShell 5.1 or later, winget, administrative privileges for some operations.
#>

$AppProfiles = @{
    "Home" = @(
        "7-Zip", "Brave", "Epic Games Launcher", "GIMP",
        "Nmap", "Thunderbird", "VirtualBox",
        "Private Internet Access", "Revo Uninstaller",
        "SteelSeries GG", "Steam", "Overwolf", "Nvidia App",
        "Global Protect", "Canon Printer Drivers", "KDAN PDF Reader"
    )
    "Home & Work" = @(
        "1Password", "Corsair iCUE 5", "Git", "Oh My Posh",
        "Windows Terminal", "Notion", "Spotify",
        "Sysinternals", "VSCodium", "WinFetch",
        "Remote Desktop Manager"
    )
    "Other" = @(
        "Ubisoft Connect", "EA Desktop", "Wireshark",
        "Discord", "GOG Galaxy", "Zoom", "Microsoft Teams", "MS Office 2021"
    )
}


# -------------------- Install functions -------------------- #
function Install-Standard { # Universal winget function
    param (
        [string]$id  # Define the app to install
    )
    
    if ($id -eq "Spotify.Spotify") {
        Write-Output "Installing Spotify for the current user (not as admin)..."
        winget install --id=$id --scope=user -e
    } else {
        Write-Output "Downloading and installing $($id.split('.')[1])."
        winget install --id=$id -e
    }

    $found = winget list --id=$id 2>$null | Select-String "$id"
    If ([bool]$found){ # Returns $true if found, $false if not
        Write-Output "$($id.split('.')[1]) installed successfully."
    }
}

function Install-Winfetch { # Download and install WinFetch. Not available in winget
    winget install --id=Microsoft.NuGet -e
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
        Write-Output "If you see a certificate error, please refer to your certificate troubleshooting guide."
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
        Write-Output "If you see a certificate error, please refer to your certificate troubleshooting guide."
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


# -------------------- Uninstall functions -------------------- #
function Uninstall-Standard {
    param (
        [string]$id
    )
    Write-Output "Uninstalling $($id.split('.')[1])..."
    winget uninstall --id=$id -e
    $found = winget list --id=$id 2>$null | Select-String "$id"
    if (-not [bool]$found) {
        Write-Output "$($id.split('.')[1]) uninstalled successfully."
    } else {
        Write-Output "Failed to uninstall $($id.split('.')[1])."
    }
}

function Uninstall-NvidiaApp {
    Write-Output "Attempting to uninstall Nvidia App..."
    Get-AppxPackage -Name NVIDIACorp.NVIDIAControlPanel | Remove-AppxPackage
}

function Uninstall-Overwolf {
    Write-Output "Attempting to uninstall Overwolf..."
    $uninstallKey = "HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall"
    $overwolf = Get-ChildItem $uninstallKey | Where-Object {
        (Get-ItemProperty $_.PSPath).DisplayName -like "*Overwolf*"
    }
    foreach ($item in $overwolf) {
        $uninstallString = (Get-ItemProperty $item.PSPath).UninstallString
        if ($uninstallString) {
            Start-Process -FilePath "cmd.exe" -ArgumentList "/c $uninstallString /silent" -Wait
        }
    }
}

function Uninstall-DoDCerts {
    <#
    .SYNOPSIS
        Removes DoD certificates previously installed by Install-DoDCerts.
    .DESCRIPTION
        Downloads the latest AllCerts.p7b and DoDRoot3-6.p7b files, extracts the certificates,
        and removes matching certificates from the CA and ROOT stores by thumbprint.
    #>

    # URLs for the certificate bundles
    $allCertsUrl = "https://militarycac.com/maccerts/AllCerts.p7b"
    $doDRootUrl = "https://militarycac.com/CACDrivers/DoDRoot3-6.p7b"

    # Temporary file paths
    $tempPath = [System.IO.Path]::GetTempPath()
    $allCertsFile = Join-Path $tempPath "AllCerts.p7b"
    $doDRootFile = Join-Path $tempPath "DoDRoot3-6.p7b"

    # Download the p7b files
    Write-Output "Downloading AllCerts.p7b and DoDRoot3-6.p7b..."
    Invoke-WebRequest -Uri $allCertsUrl -OutFile $allCertsFile -UseBasicParsing
    Invoke-WebRequest -Uri $doDRootUrl -OutFile $doDRootFile -UseBasicParsing

    # Helper: Extract thumbprints from a p7b file
    function Get-ThumbprintsFromP7B {
        param([string]$p7bPath)
        $certs = New-Object System.Security.Cryptography.X509Certificates.X509Certificate2Collection
        $certs.Import($p7bPath)
        return $certs | ForEach-Object { $_.Thumbprint }
    }

    # Get thumbprints from both p7b files
    $thumbprints = @()
    $thumbprints += Get-ThumbprintsFromP7B -p7bPath $allCertsFile
    $thumbprints += Get-ThumbprintsFromP7B -p7bPath $doDRootFile
    $thumbprints = $thumbprints | Sort-Object -Unique

    # Remove from CA and ROOT stores
    foreach ($storeName in @("CA", "ROOT")) {
        $storePath = "Cert:\LocalMachine\$storeName"
        $storeCerts = Get-ChildItem -Path $storePath
        $toRemove = $storeCerts | Where-Object { $thumbprints -contains $_.Thumbprint }
        if ($toRemove.Count -eq 0) {
            Write-Output "No matching certificates found in $storeName."
            continue
        }
        Write-Output "Removing $($toRemove.Count) certificate(s) from $storeName..."
        foreach ($cert in $toRemove) {
            try {
                Remove-Item -Path $cert.PSPath -Force
                Write-Output "Removed: $($cert.Subject)"
            } catch {
                Write-Error "Failed to remove certificate: $($cert.Subject) - $_"
            }
        }
    }

    # Clean up temp files
    Remove-Item -Path $allCertsFile, $doDRootFile -Force

    Write-Host "DoD certificate removal process complete." -ForegroundColor Yellow
}

function Update-AllApps {
    $installedApps = winget list | Select-String '^\S' | ForEach-Object {
        $fields = $_.Line -split '\s{2,}'
        [PSCustomObject]@{
            Name = $fields[0]
            Id   = $fields[1]
            CurrentVersion = if ($fields.Count -ge 3) { $fields[2] } else { "" }
        }
    }

    $results = @()

    foreach ($app in $installedApps) {
        $status = "Unknown"
        $newVersion = ""
        try {
            $upgradeInfo = winget upgrade --id "$($app.Id)" -e 2>&1
            if ($upgradeInfo -match "No applicable update found") {
                $status = "Up-to-date"
                $newVersion = $app.CurrentVersion
            } elseif ($upgradeInfo -match "The following packages have been found") {
                $status = "Upgradable"
                # Try to extract new version from upgradeInfo
                $verMatch = $upgradeInfo | Select-String -Pattern '(\d+\.\d+(\.\d+)*)\s*->\s*(\d+\.\d+(\.\d+)*)'
                if ($verMatch) {
                    $newVersion = $verMatch.Matches[0].Groups[3].Value
                } else {
                    # Fallback: try to extract from table
                    $tableLine = $upgradeInfo | Select-String -Pattern "$($app.Id)"
                    if ($tableLine) {
                        $tableFields = $tableLine.Line -split '\s{2,}'
                        if ($tableFields.Count -ge 4) {
                            $newVersion = $tableFields[3]
                        }
                    }
                }
            } elseif ($upgradeInfo -match "No package found matching input criteria") {
                $status = "Not in WinGet repo"
                $newVersion = ""
            } elseif ($upgradeInfo -match "error" -or $upgradeInfo -match "failed") {
                $status = "Error"
                $newVersion = ""
            }
        } catch {
            $status = "Error"
            $newVersion = ""
        }
        $results += [PSCustomObject]@{
            Name           = $app.Name
            Id             = $app.Id
            CurrentVersion = $app.CurrentVersion
            NewVersion     = $newVersion
            Status         = $status
        }
    }

    # Display results before updating
    Write-Host "`nUpdate Status for Installed Apps:`n" -ForegroundColor Cyan
    $results | Format-Table Name, Id, CurrentVersion, NewVersion, Status -AutoSize

    # Confirm and update only upgradable apps
    $toUpdate = $results | Where-Object { $_.Status -eq "Upgradable" }
    if ($toUpdate.Count -gt 0) {
        Write-Host "`nUpdating $($toUpdate.Count) app(s):" -ForegroundColor Yellow
        foreach ($app in $toUpdate) {
            try {
                $updateResult = winget upgrade --id "$($app.Id)" -e --silent 2>&1
                if ($updateResult -match "Successfully upgraded" -or $updateResult -match "Upgrade succeeded") {
                    Write-Host "$($app.Name) updated successfully." -ForegroundColor Green
                } else {
                    Write-Host "$($app.Name) update failed: $updateResult" -ForegroundColor Red
                }
            } catch {
                Write-Host "$($app.Name) update failed: $_" -ForegroundColor Red
            }
        }
    } else {
        Write-Host "`nNo apps require updating." -ForegroundColor Green
    }
}