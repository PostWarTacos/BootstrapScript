#-------------------- My Personal Tweaks --------------------#
function Set-PowerShellProfile { # Load PowerShell Profile
    Write-Output "Downloading PowerShell profile from GitHub."
}

# Function to open Mouse Pointer Settings UI and set the color & size
function Set-MousePointer {   
    Write-Host "Starting Set-MousePointer" -ForegroundColor Yellow
    Start-Process "ms-settings:easeofaccess-mousepointer"  # Open Ease of Access Mouse Settings
    Start-Sleep -Seconds 2  # Wait for settings window to open

    # Send keystrokes to navigate the UI (Requires UIAutomation for full automation)
    Add-Type -AssemblyName System.Windows.Forms

    # Move to Color Picker and set custom lime color
    [System.Windows.Forms.SendKeys]::SendWait("{TAB}{TAB}{TAB}{TAB}{HOME}{RIGHT}{RIGHT}{RIGHT}{ENTER}")  # Opens color selection
    Start-Sleep -Seconds 1
    [System.Windows.Forms.SendKeys]::SendWait("{TAB}{HOME}{RIGHT}{ENTER}")  # Selects Lime Green

    # Move to Size slider and adjust
    [System.Windows.Forms.SendKeys]::SendWait("{TAB}{TAB}{HOME}{RIGHT}{RIGHT}{RIGHT}{ENTER}")  # Moves to size and increases
    Start-Sleep -Seconds 1

    # Close the settings window
    Start-Sleep -Seconds 1
    [System.Windows.Forms.SendKeys]::SendWait("%{F4}")  # Alt+F4 to close
}

#-------------------- One Way Changes --------------------#
function Set-ServicesManual { # Set Common Services to Manual
    Write-Host "Starting Set-ServicesManual" -ForegroundColor Yellow
    $services = @("AJRouter", "ALG", "AppIDSvc", "Appinfo", "AppMgmt", `
        "AppReadiness", "AppVClient", "AppXSvc", "AssignedAccessManagerSvc", `
        "AudioEndpointBuilder", "AudioSrv", "autotimesvc", "AxInstSV", `
        "BcastDVRUserService_*", "BDESVC", "BFE", "BITS", "BluetoothUserService_*", `
        "BrokerInfrastructure", "Browser", "BTAGService","BthAvctpSvc", `
        "BthHFSrv", "bthserv", "camsvc", "CaptureService_*", "cbdhsvc_*", `
        "CDPSvc", "CDPUserSvc_*", "CertPropSvc", "ClipSVC", "cloudidsvc", `
        "COMSysApp", "ConsentUxUserSvc_*", "CoreMessagingRegistrar", `
        "CredentialEnrollmentManagerUserSvc_*", "CryptSvc", "CscService", `
        "DcomLaunch", "DcpSvc", "dcsvc", "defragsvc", "DeviceAssociationBrokerSvc_*", `
        "DeviceAssociationService", "DeviceInstall", "DevicePickerUserSvc_*", `
        "DevicesFlowUserSvc_*", "DevQueryBroker", "Dhcp", "diagnosticshub.standardcollector.service", `
        "diagsvc", "DiagTrack", "DialogBlockingService", "DispBrokerDesktopSvc", `
        "DisplayEnhancementService", "DmEnrollmentSvc", "dmwappushservice", "Dnscache", `
        "DoSvc", "dot3svc", "DPS", "DsmSvc", "DsSvc", "DusmSvc", "EapHost", "edgeupdate", `
        "edgeupdatem", "EFS", "embeddedmode", "EntAppSvc", "EventLog", "EventSystem", `
        "Fax", "fdPHost", "FDResPub", "fhsvc", "FontCache", "FrameServer", `
        "FrameServerMonitor", "gpsvc", "GraphicsPerfSvc", "hidserv", "HomeGroupListener", `
        "HomeGroupProvider", "HvHost", "icssvc", "IEEtwCollectorService", "IKEEXT", `
        "InstallService", "InventorySvc", "iphlpsvc", "IpxlatCfgSvc", "KeyIso", `
        "KtmRm", "LanmanServer", "LanmanWorkstation", "lfsvc", "LicenseManager", `
        "lltdsvc", "lmhosts", "LSM", "LxpSvc", "MapsBroker", "McpManagementService", `
        "MessagingService_*", "MicrosoftEdgeElevationService", "MixedRealityOpenXRSvc", `
        "MpsSvc", "MSDTC", "MSiSCSI", "msiserver", "MsKeyboardFilter", "NaturalAuthentication", `
        "NcaSvc", "NcbService", "NcdAutoSetup", "Netlogon", "Netman", "netprofm", "NetSetupSvc", `
        "NetTcpPortSharing", "NgcCtnrSvc", "NgcSvc", "NlaSvc", "NPSMSvc_*", "nsi", "OneSyncSvc_*", `
        "p2pimsvc", "p2psvc", "P9RdrService_*", "PcaSvc", "PeerDistSvc", "PenService_*", `
        "perceptionsimulation", "PerfHost", "PhoneSvc", "PimIndexMaintenanceSvc_*", "pla", `
        "PlugPlay", "PNRPAutoReg", "PNRPsvc", "PolicyAgent", "Power", "PrintNotify", `
        "PrintWorkflowUserSvc_*", "ProfSvc", "PushToInstall", "QWAVE", "RasAuto", `
        "RasMan", "RemoteAccess", "RemoteRegistry", "RetailDemo", "RmSvc", "RpcEptMapper", `
        "RpcLocator", "RpcSs", "SamSs", "SCardSvr", "ScDeviceEnum", "Schedule", `
        "SCPolicySvc", "SDRSVC", "seclogon", "SecurityHealthService", "SEMgrSvc", `
        "SENS", "Sense", "SensorDataService", "SensorService", "SensrSvc", "SessionEnv", `
        "SgrmBroker", "SharedAccess", "SharedRealitySvc", "ShellHWDetection", "shpamsvc", `
        "smphost", "SmsRouter", "SNMPTRAP", "spectrum", "Spooler", "sppsvc", "SSDPSRV", `
        "ssh-agent", "SstpSvc", "StateRepository", "StiSvc", "StorSvc", "svsvc", `
        "swprv", "SysMain", "SystemEventsBroker", "TabletInputService", "TapiSrv", "TermService", `
        "TextInputManagementService", "Themes", "TieringEngineService", "tiledatamodelsvc", `
        "TimeBroker", "TimeBrokerSvc", "TokenBroker", "TrkWks", "TroubleshootingSvc", 
        "TrustedInstaller", "tzautoupdate", "UdkUserSvc_*", "UevAgentService", "uhssvc", `
        "UI0Detect", "UmRdpService", "UnistoreSvc_*", "upnphost", "UserDataSvc_*", `
        "UserManager", "UsoSvc", "VacSvc", "VaultSvc", "vds", "VGAuthService", "vm3dservice", `
        "vmicguestinterface", "vmicheartbeat", "vmickvpexchange", "vmicrdv", `
        "vmicshutdown", "vmictimesync", "vmicvmsession", "vmicvss", "VMTools", `
        "vmvss", "VSS", "W32Time", "WaaSMedicSvc", "WalletService", "WarpJITSvc", `
        "wbengine", "WbioSrvc", "Wcmsvc", "wcncsvc", "WcsPlugInService", "WdiServiceHost", `
        "WdiSystemHost", "WdNisSvc", "WebClient", "webthreatdefsvc", "webthreatdefusersvc_*", `
        "Wecsvc", "WEPHOSTSVC", "wercplsupport", "WerSvc", "WFDSConMgrSvc", "WiaRpc", `
        "WinDefend", "WinHttpAutoProxySvc", "Winmgmt", "WinRM", "wisvc", "WlanSvc", `
        "wlidsvc", "wlpasvc", "WManSvc", "wmiApSrv", "WMPNetworkSvc", "workfolderssvc", `
        "WpcMonSvc", "WPDBusEnum", "WpnService", "WpnUserService_*", "wscsvc", `
        "WSearch", "WSService", "wuauserv", "wudfsvc", "XblAuthManager", "XblGameSave", `
        "XboxGipSvc", "XboxNetApiSvc")
    foreach ( $service in $services ) {
        Set-Service -Name $service -StartupType Manual -ErrorAction SilentlyContinue
    }
}

function Disable-CommonAutoruns { # Disable autoruns for common apps
    Write-Host "Starting Disable-Autoruns" -ForegroundColor Yellow
    # List of startup applications to disable
    $appsToDisable = @(
        "OneDrive",
        "Microsoft Teams",
        "Skype",
        "Spotify",
        "Zoom",
        "Adobe Creative Cloud",
        "Dropbox",
        "EpicGamesLauncher",
        "Battle.net",
        "iTunesHelper",
        "Cortana",
        "Java Update Scheduler",
        "HP Smart",
        "Epson Event Manager",
        "Adobe Updater",
        "Apple Software Update",
        "Logitech Updater",
        "MicrosoftEdgeUpdate",
        "Widgets",
        "Teams Machine-Wide Installer",
        "Slack",
        "Webex",
        "Adobe Acrobat Update Service",
        "VLC Update",
        "GoogleChromeUpdate",
        "MozillaMaintenance",
        "BraveBrowserUpdate",
        "QuickTime",
        "ApplePush",
        "Realtek HD Audio Manager",
        "Intel Driver & Support Assistant",
        "Dell SupportAssist",
        "HP Support Assistant",
        "Lenovo Vantage",
        "AnyDesk",
        "TeamViewer"
    )

    # Get all startup applications
    $startupApps = Get-CimInstance Win32_StartupCommand

    # Loop through the list and disable if found
    foreach ( $app in $appsToDisable ) {
        $match = $startupApps | Where-Object { $_.Name -like "*$app*" -or $_.Command -like "*$app*" }

        if ( $match ) {
            Write-Output "Disabling startup for: $( $match.Name )"
            
            # Disable startup item in registry
            $regPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Run"
            if ( Test-Path $regPath ) {
                Remove-ItemProperty -Path $regPath -Name $match.Name -ErrorAction SilentlyContinue
            }
            
            # Disable using Task Manager (if applicable)
            $task = Get-ScheduledTask | Where-Object { $_.TaskName -like "*$app*" }
            if ( $task ) {
                Disable-ScheduledTask -TaskName $task.TaskName
            }
        }
        else {
            Write-Output "$app not found in startup."
        }
    }

    Write-Output "Startup optimization complete."

}

Function Remove-CommonBloatware { # Remove Windows bloatware apps
    Write-Host "Starting Remove-Bloatware" -ForegroundColor Yellow
    # Remove "3D Objects" from This PC
    Remove-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{0DB7E03F-FC29-4DC6-9020-FF41B59E513A}" -Recurse -ErrorAction SilentlyContinue

    $bloatwareApps = @(
        "Microsoft.3DBuilder",
        "Microsoft.BingNews",
        "Microsoft.GetHelp",
        "Microsoft.Getstarted",
        "Microsoft.Microsoft3DViewer",
        "Microsoft.MicrosoftOfficeHub",
        "Microsoft.MicrosoftSolitaireCollection",
        "Microsoft.MicrosoftStickyNotes",
        "Microsoft.MixedReality.Portal",
        "Microsoft.NetworkSpeedTest",
        "Microsoft.Office.OneNote",
        "Microsoft.People",
        "Microsoft.SkypeApp",
        "Microsoft.Wallet",
        "Microsoft.WindowsAlarms",
        "Microsoft.WindowsCamera",
        "microsoft.windowscommunicationsapps",
        "Microsoft.WindowsFeedbackHub",
        "Microsoft.WindowsMaps",
        "Microsoft.WindowsSoundRecorder",
        "Microsoft.YourPhone",
        "Microsoft.ZuneMusic",
        "Microsoft.ZuneVideo"
    )

    ForEach ( $app in $bloatwareApps ) {
        Get-AppxPackage -Name $app -AllUsers | Remove-AppxPackage -ErrorAction SilentlyContinue
        Get-AppxProvisionedPackage -Online | Where-Object DisplayName -Like "$app" | Remove-AppxProvisionedPackage -Online -ErrorAction SilentlyContinue
    }

    Write-Output "Bloatware Removal Complete!"
}

#-------------------- AI Related Changes --------------------#
function Set-Cortana {
    param(
        [Parameter(Mandatory=$true)]
        [ValidateSet("Enable", "Disable")]
        [string]$Action
    )
    $cortanaReg = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search"
    if (-not (Test-Path $cortanaReg)) { New-Item -Path $cortanaReg -Force | Out-Null }
    if ($Action -eq "Disable") {
        Write-Host "Disabling Cortana..." -ForegroundColor Yellow
        # Remove Cortana app
        Get-AppxPackage -Name "Microsoft.549981C3F5F10" -AllUsers | Remove-AppxPackage -ErrorAction SilentlyContinue
        Get-AppxProvisionedPackage -Online | Where-Object DisplayName -Like "Microsoft.549981C3F5F10" | Remove-AppxProvisionedPackage -Online -ErrorAction SilentlyContinue
        # Disable via registry
        Set-ItemProperty -Path $cortanaReg -Name "AllowCortana" -Type DWord -Value 0 -Force
    } elseif ($Action -eq "Enable") {
        Write-Host "Enabling Cortana..." -ForegroundColor Yellow
        # Enable via registry
        Set-ItemProperty -Path $cortanaReg -Name "AllowCortana" -Type DWord -Value 1 -Force
        # Note: To reinstall Cortana, user must manually install from Microsoft Store if removed
    }
}

function Set-Copilot {
    param(
        [Parameter(Mandatory=$true)]
        [ValidateSet("Enable", "Disable")]
        [string]$Action
    )
    Write-Host "$Action Copilot" -ForegroundColor Yellow
    $regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsCopilot"
    if (-not (Test-Path $regPath)) {
        New-Item -Path $regPath -Force | Out-Null
    }
    if ($Action -eq "Disable") {
        # Remove Copilot app for all users
        Write-Host "Searching for the Windows Copilot package..."
        $app = Get-AppxPackage -Name "*Copilot*"
        if ($app) {
            Write-Host "Found Copilot package. Removing it..."
            $app | Remove-AppxPackage -AllUsers
            Write-Host "Copilot package removed successfully."
        } else {
            Write-Host "No installed Copilot package found."
        }
        # Remove provisioned Copilot package
        Write-Host "Checking for provisioned Copilot package..."
        $appProv = Get-AppxProvisionedPackage -Online | Where-Object { $_.DisplayName -like "*Copilot*" }
        if ($appProv) {
            Write-Host "Found a provisioned Copilot package. Removing it from the system image..."
            $appProv | Remove-AppxProvisionedPackage -Online
            Write-Host "Provisioned Copilot package removed successfully."
        } else {
            Write-Host "No provisioned Copilot package found."
        }
        # Disable Copilot via registry
        Set-ItemProperty -Path $regPath -Name "AllowCopilot" -Value 0 -Type DWord -Force
        Write-Host "Windows Copilot has been disabled. A system reboot might be required for all changes to take effect."
    } elseif ($Action -eq "Enable") {
        # Enable Copilot via registry
        Set-ItemProperty -Path $regPath -Name "AllowCopilot" -Value 1 -Type DWord -Force
        Write-Host "Windows Copilot has been enabled. You may need to reinstall the Copilot app from the Microsoft Store if it was previously removed."
    }
}

function Set-Recall {
    param(
        [Parameter(Mandatory=$true)]
        [ValidateSet("Enable", "Disable")]
        [string]$Action
    )
    Write-Host "$Action Recall (WindowsAI)" -ForegroundColor Yellow

    # Registry paths
    $userRegPath = "HKCU:\Software\Policies\Microsoft\Windows\WindowsAI"
    $systemRegPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsAI"

    if ($Action -eq "Disable") {
        # Step 1: Disable Recall via Registry
        if (-not (Test-Path $userRegPath)) { New-Item -Path $userRegPath -Force | Out-Null }
        Set-ItemProperty -Path $userRegPath -Name "DisableAIDataAnalysis" -Value 1 -Force

        if (-not (Test-Path $systemRegPath)) { New-Item -Path $systemRegPath -Force | Out-Null }
        Set-ItemProperty -Path $systemRegPath -Name "DisableAIDataAnalysis" -Value 1 -Force

        Write-Output "Recall has been disabled via registry settings."

        # Step 2: Stop and Disable Recall Services
        $recallServices = @( "RecallSvc", "RecallIndexerSvc" )
        foreach ($service in $recallServices) {
            if (Get-Service -Name $service -ErrorAction SilentlyContinue) {
                Stop-Service -Name $service -Force -ErrorAction SilentlyContinue
                Set-Service -Name $service -StartupType Disabled -ErrorAction SilentlyContinue
                Write-Output "Service '$service' has been stopped and disabled."
            } else {
                Write-Output "Service '$service' not found."
            }
        }

        # Step 3: Use DISM to Remove Recall Feature
        Start-Process -NoNewWindow -Wait -FilePath "cmd.exe" -ArgumentList "/c DISM /Online /Disable-Feature /FeatureName:Recall /Quiet /NoRestart"
    }
    elseif ($Action -eq "Enable") {
        # Step 1: Enable Recall via Registry
        if (-not (Test-Path $userRegPath)) { New-Item -Path $userRegPath -Force | Out-Null }
        Set-ItemProperty -Path $userRegPath -Name "DisableAIDataAnalysis" -Value 0 -Force

        if (-not (Test-Path $systemRegPath)) { New-Item -Path $systemRegPath -Force | Out-Null }
        Set-ItemProperty -Path $systemRegPath -Name "DisableAIDataAnalysis" -Value 0 -Force

        Write-Output "Recall has been enabled via registry settings."

        # Step 2: Set Recall Services to Manual (if present)
        $recallServices = @( "RecallSvc", "RecallIndexerSvc" )
        foreach ($service in $recallServices) {
            if (Get-Service -Name $service -ErrorAction SilentlyContinue) {
                Set-Service -Name $service -StartupType Manual -ErrorAction SilentlyContinue
                Write-Output "Service '$service' set to Manual."
            }
        }

        # Step 3: Use DISM to Enable Recall Feature (if available)
        Start-Process -NoNewWindow -Wait -FilePath "cmd.exe" -ArgumentList "/c DISM /Online /Enable-Feature /FeatureName:Recall /Quiet /NoRestart"
    }
}

#-------------------- Toggle Changes --------------------#

#~~# Favorites

function Set-MilDateTimeFormat{ # Mil Date and Time Format  #~~# Upgrade to comboboxes. One for date, one for time.
    Write-Host "Starting Set-MilDateTimeFormat" -ForegroundColor Yellow
    # Set Short Date Format
    Set-ItemProperty -Path "HKCU:\Control Panel\International" -Name "sShortDate" -Value "dd-MMM-yy"
    
    # Set Short Time Format - 24 clock
    Set-ItemProperty -Path "HKCU:\Control Panel\International" -Name "sShortTime" -Value "HH:mm"
    
    # Set Long Time Format - 24 clock with seconds    
    Set-ItemProperty -Path "HKCU:\Control Panel\International" -Name "sLongTime" -Value "HH:mm:ss"
}

function Set-NumlockBoot {
    param(
        [Parameter(Mandatory=$true)]
        [ValidateSet("Enable", "Disable")]
        [string]$Action
    )
    if ( $Action -eq "Enable" ) {
        Write-Host "Enabling NumLock on Boot" -ForegroundColor Yellow
        Set-ItemProperty -Path 'HKCU:\Control Panel\Keyboard' -Name "InitialKeyboardIndicators" -Value "2"
    } elseif ( $Action -eq "Disable" ) {
        Write-Host "Disabling NumLock on Boot" -ForegroundColor Yellow
        Set-ItemProperty -Path 'HKCU:\Control Panel\Keyboard' -Name "InitialKeyboardIndicators" -Value "0"
    }
}

function Set-FileExtensions {
    param(
        [Parameter(Mandatory=$true)]
        [ValidateSet("Enable", "Disable")]
        [string]$Action
    )
    Write-Host "$Action Show File Extensions" -ForegroundColor Yellow
    $value = if ($Action -eq "Enable") { 0 } else { 1 }
    Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "HideFileExt" -Value $value
}

function Set-TaskbarEndTask {
    param(
        [Parameter(Mandatory=$true)]
        [ValidateSet("Enable", "Disable")]
        [string]$Action
    )
    Write-Host "$Action Taskbar End Task menu" -ForegroundColor Yellow
    $path = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\TaskbarDeveloperSettings"
    $name = "TaskbarEndTask"
    $value = if ($Action -eq "Enable") { 1 } else { 0 }

    if (-not (Test-Path $path)) {
        New-Item -Path $path -Force | Out-Null
    }

    if (-not (Get-ItemProperty -Path $path -Name $name -ErrorAction SilentlyContinue)) {
        New-ItemProperty -Path $path -Name $name -PropertyType DWord -Value $value -Force | Out-Null
    } else {
        Set-ItemProperty -Path $path -Name $name -Value $value -Force
    }
}

function Set-StorageSense {
    param(
        [Parameter(Mandatory=$true)]
        [ValidateSet("Enable", "Disable")]
        [string]$Action
    )
    Write-Host "$Action Storage Sense" -ForegroundColor Yellow
    $regPath = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\StorageSense\Parameters\StoragePolicy"
    $value = if ($Action -eq "Enable") { 1 } else { 0 }
    Set-ItemProperty -Path $regPath -Name "01" -Value $value -Type Dword -Force
}

function Set-PreferIPv4 {
    param(
        [Parameter(Mandatory=$true)]
        [ValidateSet("Enable", "Disable")]
        [string]$Action
    )
    Write-Host "$Action Prefer IPv4 over IPv6" -ForegroundColor Yellow
    $regPath = "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip6\Parameters"
    $value = if ($Action -eq "Enable") { 32 } else { 0 }
    Set-ItemProperty -Path $regPath -Name "DisabledComponents" -Value $value -Type DWord
}

function Set-OneDrive {
    param(
        [Parameter(Mandatory=$true)]
        [ValidateSet("Enable", "Disable")]
        [string]$Action
    )
    Write-Host "$Action OneDrive" -ForegroundColor Yellow

    if ($Action -eq "Disable") {
        # Uninstall OneDrive and disable its ability to reinstall
        $OneDrivePath = $env:OneDrive
        Write-Host "Removing OneDrive"
        $regPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Uninstall\OneDriveSetup.exe"
        if (Test-Path $regPath) {
            $OneDriveUninstallString = Get-ItemPropertyValue "$regPath" -Name "UninstallString"
            $OneDriveExe, $OneDriveArgs = $OneDriveUninstallString.Split(" ")
            Start-Process -FilePath $OneDriveExe -ArgumentList "$OneDriveArgs /silent" -NoNewWindow -Wait
        } else {
            Write-Host "Onedrive doesn't seem to be installed anymore" -ForegroundColor Red
            return
        }
        # Check if OneDrive got Uninstalled
        if (-not (Test-Path $regPath)) {
            Write-Host "Copy downloaded Files from the OneDrive Folder to Root UserProfile"
            Start-Process -FilePath powershell -ArgumentList "robocopy '$($OneDrivePath)' '$($env:USERPROFILE.TrimEnd())\' /mov /e /xj" -NoNewWindow -Wait

            Write-Host "Removing OneDrive leftovers"
            Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$env:localappdata\Microsoft\OneDrive"
            Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$env:localappdata\OneDrive"
            Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$env:programdata\Microsoft OneDrive"
            Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$env:systemdrive\OneDriveTemp"
            Remove-Item -Path "HKCU:\Software\Microsoft\OneDrive" -Recurse -Force
            # check if directory is empty before removing:
            If ((Get-ChildItem "$OneDrivePath" -Recurse | Measure-Object).Count -eq 0) {
                Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$OneDrivePath"
            }

            Write-Host "Remove Onedrive from explorer sidebar"
            $clsidPathHKCR = "Registry::HKEY_CLASSES_ROOT\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}"
            $clsidPathWow6432 = "Registry::HKEY_LOCAL_MACHINE\Software\Classes\Wow6432Node\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}"

            if (Test-Path $clsidPathHKCR) {
                Set-ItemProperty -Path $clsidPathHKCR -Name "System.IsPinnedToNameSpaceTree" -Value 0
                Write-Host "Updated System.IsPinnedToNameSpaceTree for HKCR CLSID."
            }
            if (Test-Path $clsidPathWow6432) {
                Set-ItemProperty -Path $clsidPathWow6432 -Name "System.IsPinnedToNameSpaceTree" -Value 0
                Write-Host "Updated System.IsPinnedToNameSpaceTree for Wow6432Node CLSID."
            }

            Write-Host "Removing run hook for new users"
            reg load "hku\Default" "C:\Users\Default\NTUSER.DAT"
            $regPath = "Registry::HKEY_USERS\Default\SOFTWARE\Microsoft\Windows\CurrentVersion\Run"
            Remove-ItemProperty -Path $regPath -Name "OneDriveSetup" -ErrorAction SilentlyContinue
            reg unload "hku\Default"

            Write-Host "Removing startmenu entry"
            Remove-Item -Force -ErrorAction SilentlyContinue "$env:userprofile\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\OneDrive.lnk"

            Write-Host "Removing scheduled task"
            Get-ScheduledTask -TaskPath '\' -TaskName 'OneDrive*' -ea SilentlyContinue | Unregister-ScheduledTask -Confirm:$false

            # Add Shell folders restoring default locations
            Write-Host "Shell Fixing"
            Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" -Name "AppData" -Value "$env:userprofile\AppData\Roaming" -Type ExpandString
            Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" -Name "Cache" -Value "$env:userprofile\AppData\Local\Microsoft\Windows\INetCache" -Type ExpandString
            Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" -Name "Cookies" -Value "$env:userprofile\AppData\Local\Microsoft\Windows\INetCookies" -Type ExpandString
            Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" -Name "Favorites" -Value "$env:userprofile\Favorites" -Type ExpandString
            Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" -Name "History" -Value "$env:userprofile\AppData\Local\Microsoft\Windows\History" -Type ExpandString
            Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" -Name "Local AppData" -Value "$env:userprofile\AppData\Local" -Type ExpandString
            Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" -Name "My Music" -Value "$env:userprofile\Music" -Type ExpandString
            Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" -Name "My Video" -Value "$env:userprofile\Videos" -Type ExpandString
            Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" -Name "NetHood" -Value "$env:userprofile\AppData\Roaming\Microsoft\Windows\Network Shortcuts" -Type ExpandString
            Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" -Name "PrintHood" -Value "$env:userprofile\AppData\Roaming\Microsoft\Windows\Printer Shortcuts" -Type ExpandString
            Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" -Name "Programs" -Value "$env:userprofile\AppData\Roaming\Microsoft\Windows\Start Menu\Programs" -Type ExpandString
            Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" -Name "Recent" -Value "$env:userprofile\AppData\Roaming\Microsoft\Windows\Recent" -Type ExpandString
            Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" -Name "SendTo" -Value "$env:userprofile\AppData\Roaming\Microsoft\Windows\SendTo" -Type ExpandString
            Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" -Name "Start Menu" -Value "$env:userprofile\AppData\Roaming\Microsoft\Windows\Start Menu" -Type ExpandString
            Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" -Name "Startup" -Value "$env:userprofile\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup" -Type ExpandString
            Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" -Name "Templates" -Value "$env:userprofile\AppData\Roaming\Microsoft\Windows\Templates" -Type ExpandString
            Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" -Name "{374DE290-123F-4565-9164-39C4925E467B}" -Value "$env:userprofile\Downloads" -Type ExpandString
            Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" -Name "Desktop" -Value "$env:userprofile\Desktop" -Type ExpandString
            Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" -Name "My Pictures" -Value "$env:userprofile\Pictures" -Type ExpandString
            Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" -Name "Personal" -Value "$env:userprofile\Documents" -Type ExpandString
            Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" -Name "{F42EE2D3-909F-4907-8871-4C22FC0BF756}" -Value "$env:userprofile\Documents" -Type ExpandString
            Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" -Name "{0DDD015D-B06C-45D5-8C4C-F59713854639}" -Value "$env:userprofile\Pictures" -Type ExpandString
            Write-Host "Restarting explorer"
            taskkill.exe /F /IM "explorer.exe"
            Start-Process "explorer.exe"

            Write-Host "Waiting for explorer to complete loading"
            Write-Host "Please Note - The OneDrive folder at $OneDrivePath may still have items in it. You must manually delete it, but all the files should already be copied to the base user folder."
            Write-Host "If there are Files missing afterwards, please Login to Onedrive.com and Download them manually" -ForegroundColor Yellow
            Start-Sleep 5
        } else {
            Write-Host "Something went Wrong during the Uninstallation of OneDrive" -ForegroundColor Red
        }
    }
    elseif ($Action -eq "Enable") {
        # Reinstall OneDrive for current user
        Write-Host "Reinstalling OneDrive for current user..."
        $oneDriveSetup = "$env:SystemRoot\System32\OneDriveSetup.exe"
        if (Test-Path $oneDriveSetup) {
            Start-Process -FilePath $oneDriveSetup -ArgumentList "/install" -NoNewWindow -Wait
            Write-Host "OneDrive installation initiated."
        } else {
            Write-Host "OneDriveSetup.exe not found. Please download the OneDrive installer from Microsoft."
        }
    }
}

function Set-UIResponseTweaks {
    param(
        [Parameter(Mandatory=$true)]
        [ValidateSet("Enable", "Disable")]
        [string]$Action
    )
    Write-Host "$Action UI Response Tweaks" -ForegroundColor Yellow

    # Default values for Windows
    $defaultTweaks = @{
        "HKCU:\Control Panel\Mouse"   = @{"MouseHoverTime" = 400}
        "HKCU:\Control Panel\Desktop" = @{"MenuShowDelay" = 400}
    }
    # Tweaked values for fast response
    $fastTweaks = @{
        "HKCU:\Control Panel\Mouse"   = @{"MouseHoverTime" = 10}
        "HKCU:\Control Panel\Desktop" = @{"MenuShowDelay" = 10}
    }

    $tweaks = if ($Action -eq "Enable") { $fastTweaks } else { $defaultTweaks }

    foreach ($key in $tweaks.Keys) {
        if (-not (Test-Path $key)) {
            New-Item -Path $key -Force | Out-Null
        }
        foreach ($value in $tweaks[$key].Keys) {
            Set-ItemProperty -Path $key -Name $value -Value $tweaks[$key][$value]
        }
    }
    if ($Action -eq "Enable") {
        Write-Output "Mouse responsiveness tweaked! You fast af boiii!"
    } else {
        Write-Output "Mouse responsiveness set to Windows default."
    }
}

function Set-Telemetry {
    param(
        [Parameter(Mandatory=$true)]
        [ValidateSet("Enable", "Disable")]
        [string]$Action
    )
    Write-Host "$Action Telemetry" -ForegroundColor Yellow

    # Fix "Managed by your organization" in Edge
    If (Test-Path "HKLM:\SOFTWARE\Policies\Microsoft\Edge") {
        Remove-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Edge" -Recurse -ErrorAction SilentlyContinue
    }

    # Windows telemetry logs
    $autoLoggerDir = "$env:PROGRAMDATA\Microsoft\Diagnosis\ETLLogs\AutoLogger"
    $diagTrackFile = "$autoLoggerDir\AutoLogger-Diagtrack-Listener.etl"

    if ($Action -eq "Disable") {
        if (Test-Path $diagTrackFile) {
            Remove-Item $diagTrackFile -ErrorAction SilentlyContinue
        }
        icacls $autoLoggerDir /deny SYSTEM:`(OI`)`(CI`)F | Out-Null

        # Defender Auto Sample Submission
        Set-MpPreference -SubmitSamplesConsent 2 -ErrorAction SilentlyContinue | Out-Null

        # Disable telemetry services
        Get-Service -Name "DiagTrack", "dmwappushservice" | Stop-Service -Force -ErrorAction SilentlyContinue
        Get-Service -Name "DiagTrack", "dmwappushservice" | Set-Service -StartupType Disabled -ErrorAction SilentlyContinue

        # Block telemetry via registry
        $telemetryKeys = @(
            "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection",
            "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection"
        )
        foreach ($key in $telemetryKeys) {
            If (-not (Test-Path $key)) { New-Item -Path $key -Force | Out-Null }
            Set-ItemProperty -Path $key -Name "AllowTelemetry" -Type DWord -Value 0 -Force
        }

        # Block Microsoft telemetry servers via hosts file
        $telemetryHosts = @(
            "vortex.data.microsoft.com",
            "settings-win.data.microsoft.com",
            "watson.telemetry.microsoft.com",
            "telemetry.microsoft.com",
            "oca.telemetry.microsoft.com"
        )
        $hostsFile = "$env:SystemRoot\System32\drivers\etc\hosts"
        $plannedAdditions = [System.Collections.ArrayList]::new()
        foreach ($telemetryHost in $telemetryHosts) {
            if (-not (Select-String -Path $hostsFile -Pattern "\s+$telemetryHost$" -Quiet)) {
                $plannedAdditions.Add("`n0.0.0.0 $telemetryHost") | Out-Null
            }
        }
        Add-Content -Path $hostsFile -Value $plannedAdditions

        # Disable Cortana and search telemetry
        $cortanaKeys = @(
            "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search",
            "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Search"
        )
        foreach ($key in $cortanaKeys) {
            If (-not (Test-Path $key)) { New-Item -Path $key -Force | Out-Null }
            Set-ItemProperty -Path $key -Name "AllowCortana" -Type DWord -Value 0 -Force
        }

        # Disable Background Apps
        Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications" -Name "GlobalUserDisabled" -Type DWord -Value 1 -Force

        # Disable Windows Customer Experience Improvement Program (CEIP)
        $ceipKeys = @(
            "HKLM:\SOFTWARE\Policies\Microsoft\SQMClient\Windows",
            "HKLM:\SOFTWARE\Microsoft\SQMClient\Windows"
        )
        foreach ($key in $ceipKeys) {
            If (-not (Test-Path $key)) { New-Item -Path $key -Force | Out-Null }
            Set-ItemProperty -Path $key -Name "CEIPEnable" -Type DWord -Value 0 -Force
        }

        # Disable PowerShell 7 telemetry
        [Environment]::SetEnvironmentVariable('POWERSHELL_TELEMETRY_OPTOUT', '1', 'Machine')
    }
    elseif ($Action -eq "Enable") {
        # Remove deny permissions on telemetry logs
        icacls $autoLoggerDir /remove:d SYSTEM | Out-Null

        # Defender Auto Sample Submission (default: 1 = always ask)
        Set-MpPreference -SubmitSamplesConsent 1 -ErrorAction SilentlyContinue | Out-Null

        # Enable telemetry services
        Get-Service -Name "DiagTrack", "dmwappushservice" | Set-Service -StartupType Manual -ErrorAction SilentlyContinue
        Get-Service -Name "DiagTrack", "dmwappushservice" | Start-Service -ErrorAction SilentlyContinue

        # Allow telemetry via registry (default: 1 = basic)
        $telemetryKeys = @(
            "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection",
            "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection"
        )
        foreach ($key in $telemetryKeys) {
            If (-not (Test-Path $key)) { New-Item -Path $key -Force | Out-Null }
            Set-ItemProperty -Path $key -Name "AllowTelemetry" -Type DWord -Value 1 -Force
        }

        # Remove telemetry hosts from hosts file (optional, not implemented here)

        # Enable Cortana and search telemetry
        $cortanaKeys = @(
            "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search",
            "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Search"
        )
        foreach ($key in $cortanaKeys) {
            If (-not (Test-Path $key)) { New-Item -Path $key -Force | Out-Null }
            Set-ItemProperty -Path $key -Name "AllowCortana" -Type DWord -Value 1 -Force
        }

        # Enable Background Apps
        Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications" -Name "GlobalUserDisabled" -Type DWord -Value 0 -Force

        # Enable Windows Customer Experience Improvement Program (CEIP)
        $ceipKeys = @(
            "HKLM:\SOFTWARE\Policies\Microsoft\SQMClient\Windows",
            "HKLM:\SOFTWARE\Microsoft\SQMClient\Windows"
        )
        foreach ($key in $ceipKeys) {
            If (-not (Test-Path $key)) { New-Item -Path $key -Force | Out-Null }
            Set-ItemProperty -Path $key -Name "CEIPEnable" -Type DWord -Value 1 -Force
        }

        # Enable PowerShell 7 telemetry
        [Environment]::SetEnvironmentVariable('POWERSHELL_TELEMETRY_OPTOUT', '0', 'Machine')
    }
}

function Optimize-SvcHost {
    param(
        [Parameter(Mandatory=$true)]
        [ValidateSet("Enable", "Disable")]
        [string]$Action
    )
    Write-Host "$Action Optimize SvcHost (group svchost.exe processes for better performance)" -ForegroundColor Yellow
    if ($Action -eq "Enable") {
        $ram = ( Get-CimInstance -ClassName Win32_PhysicalMemory | Measure-Object -Property Capacity -Sum ).Sum / 1kb
        Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control" -Name "SvcHostSplitThresholdInKB" -Type DWord -Value $ram -Force
    } elseif ($Action -eq "Disable") {
        # Set to default Windows value (38,000 KB)
        Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control" -Name "SvcHostSplitThresholdInKB" -Type DWord -Value 38000 -Force
    }
}

function Set-NewsAndWidgets {
    param(
        [Parameter(Mandatory=$true)]
        [ValidateSet("Enable", "Disable")]
        [string]$Action
    )
    Write-Host "$Action News and Interests / Widgets" -ForegroundColor Yellow

    # Windows 10: News and Interests
    $regPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Feeds"
    if (-not (Test-Path $regPath)) { New-Item -Path $regPath -Force | Out-Null }
    $feedsValue = if ($Action -eq "Enable") { 0 } else { 2 }
    Set-ItemProperty -Path $regPath -Name "ShellFeedsTaskbarViewMode" -Type DWord -Value $feedsValue -Force

    # Windows 11: Widgets
    $widgetsPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Widgets"
    if (-not (Test-Path $widgetsPath)) { New-Item -Path $widgetsPath -Force | Out-Null }
    $widgetsValue = if ($Action -eq "Enable") { 1 } else { 0 }
    Set-ItemProperty -Path $widgetsPath -Name "AllowWidgets" -Type DWord -Value $widgetsValue -Force
}

function Set-MeetNow {
    param(
        [Parameter(Mandatory=$true)]
        [ValidateSet("Enable", "Disable")]
        [string]$Action
    )
    Write-Host "$Action Meet Now from Taskbar" -ForegroundColor Yellow
    $meetNowReg = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer"
    if (-not (Test-Path $meetNowReg)) { New-Item -Path $meetNowReg -Force | Out-Null }
    if ($Action -eq "Disable") {
        Set-ItemProperty -Path $meetNowReg -Name "HideSCAMeetNow" -Type DWord -Value 1 -Force
        # Try to kill Meet Now process if running
        Stop-Process -Name "MeetNow" -ErrorAction SilentlyContinue
    } elseif ($Action -eq "Enable") {
        Set-ItemProperty -Path $meetNowReg -Name "HideSCAMeetNow" -Type DWord -Value 0 -Force
    }
}

function Set-DarkMode { # Set Dark Mode
    param(
        [Parameter(Mandatory=$false)]
        [ValidateSet("App","System","Both")]
        [string]$Mode = "Both"
    )
    Write-Host "Setting Dark Mode ($Mode)" -ForegroundColor Yellow
    $regPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize"
    if ( -not ( Test-Path $regPath )) { New-Item -Path $regPath -Force | Out-Null }
    if ( $Mode -eq "App" -or $Mode -eq "Both" ) {
        Set-ItemProperty -Path $regPath -Name "AppsUseLightTheme" -Type DWord -Value 0 -Force
    }
    if ( $Mode -eq "System" -or $Mode -eq "Both" ) {
        Set-ItemProperty -Path $regPath -Name "SystemUsesLightTheme" -Type DWord -Value 0 -Force
    }
}

function Set-ClipboardHistory {
    param(
        [Parameter(Mandatory=$true)]
        [ValidateSet("Enable", "Disable")]
        [string]$Action
    )
    Write-Host "$Action Clipboard History" -ForegroundColor Yellow
    $regPath = "HKCU:\Software\Microsoft\Clipboard"
    if (-not (Test-Path $regPath)) { New-Item -Path $regPath -Force | Out-Null }
    $value = if ($Action -eq "Enable") { 1 } else { 0 }
    Set-ItemProperty -Path $regPath -Name "EnableClipboardHistory" -Type DWord -Value $value -Force
    if ($Action -eq "Enable") {
        Write-Host "Press Win+V to use Clipboard History."
    }
}

#~~# All Others

function Set-TeredoState {
    param(
        [Parameter(Mandatory=$true)]
        [ValidateSet("Enable", "Disable")]
        [string]$Action
    )
    if ($Action -eq "Enable") {
        Write-Host "Enabling Teredo Tunneling protocol" -ForegroundColor Yellow
        netsh interface teredo set state enabled
    } elseif ($Action -eq "Disable") {
        Write-Host "Disabling Teredo Tunneling protocol" -ForegroundColor Yellow
        netsh interface teredo set state disabled
    }
}

function Set-Hibernation {
    param(
        [Parameter(Mandatory=$true)]
        [ValidateSet("Enable", "Disable")]
        [string]$Action
    )
    Write-Host "$Action Hibernation" -ForegroundColor Yellow
    if ($Action -eq "Enable") {
        powercfg.exe /hibernate on
    } elseif ($Action -eq "Disable") {
        powercfg.exe /hibernate off
    }
}

function Set-DebloatEdge {
    param(
        [Parameter(Mandatory=$true)]
        [ValidateSet("Enable", "Disable")]
        [string]$Action
    )
    Write-Host "$Action Debloat Edge" -ForegroundColor Yellow

    $regChangesEnable = @(
        @{Path="HKLM:\SOFTWARE\Policies\Microsoft\EdgeUpdate"; Name="CreateDesktopShortcutDefault"; Type="DWord"; Value=0}
        @{Path="HKLM:\SOFTWARE\Policies\Microsoft\Edge"; Name="EdgeEnhanceImagesEnabled"; Type="DWord"; Value=0}
        @{Path="HKLM:\SOFTWARE\Policies\Microsoft\Edge"; Name="PersonalizationReportingEnabled"; Type="DWord"; Value=0}
        @{Path="HKLM:\SOFTWARE\Policies\Microsoft\Edge"; Name="ShowRecommendationsEnabled"; Type="DWord"; Value=0}
        @{Path="HKLM:\SOFTWARE\Policies\Microsoft\Edge"; Name="HideFirstRunExperience"; Type="DWord"; Value=1}
        @{Path="HKLM:\SOFTWARE\Policies\Microsoft\Edge"; Name="UserFeedbackAllowed"; Type="DWord"; Value=0}
        @{Path="HKLM:\SOFTWARE\Policies\Microsoft\Edge"; Name="ConfigureDoNotTrack"; Type="DWord"; Value=1}
        @{Path="HKLM:\SOFTWARE\Policies\Microsoft\Edge"; Name="AlternateErrorPagesEnabled"; Type="DWord"; Value=0}
        @{Path="HKLM:\SOFTWARE\Policies\Microsoft\Edge"; Name="EdgeCollectionsEnabled"; Type="DWord"; Value=0}
        @{Path="HKLM:\SOFTWARE\Policies\Microsoft\Edge"; Name="EdgeFollowEnabled"; Type="DWord"; Value=0}
        @{Path="HKLM:\SOFTWARE\Policies\Microsoft\Edge"; Name="EdgeShoppingAssistantEnabled"; Type="DWord"; Value=0}
        @{Path="HKLM:\SOFTWARE\Policies\Microsoft\Edge"; Name="MicrosoftEdgeInsiderPromotionEnabled"; Type="DWord"; Value=0}
        @{Path="HKLM:\SOFTWARE\Policies\Microsoft\Edge"; Name="ShowMicrosoftRewards"; Type="DWord"; Value=0}
        @{Path="HKLM:\SOFTWARE\Policies\Microsoft\Edge"; Name="WebWidgetAllowed"; Type="DWord"; Value=0}
        @{Path="HKLM:\SOFTWARE\Policies\Microsoft\Edge"; Name="DiagnosticData"; Type="DWord"; Value=0}
        @{Path="HKLM:\SOFTWARE\Policies\Microsoft\Edge"; Name="EdgeAssetDeliveryServiceEnabled"; Type="DWord"; Value=0}
        @{Path="HKLM:\SOFTWARE\Policies\Microsoft\Edge"; Name="CryptoWalletEnabled"; Type="DWord"; Value=0}
        @{Path="HKLM:\SOFTWARE\Policies\Microsoft\Edge"; Name="WalletDonationEnabled"; Type="DWord"; Value=0}
    )

    $regChangesDisable = @(
        @{Path="HKLM:\SOFTWARE\Policies\Microsoft\EdgeUpdate"; Name="CreateDesktopShortcutDefault"; Type="DWord"; Value=1}
        @{Path="HKLM:\SOFTWARE\Policies\Microsoft\Edge"; Name="EdgeEnhanceImagesEnabled"; Type="DWord"; Value=1}
        @{Path="HKLM:\SOFTWARE\Policies\Microsoft\Edge"; Name="PersonalizationReportingEnabled"; Type="DWord"; Value=1}
        @{Path="HKLM:\SOFTWARE\Policies\Microsoft\Edge"; Name="ShowRecommendationsEnabled"; Type="DWord"; Value=1}
        @{Path="HKLM:\SOFTWARE\Policies\Microsoft\Edge"; Name="HideFirstRunExperience"; Type="DWord"; Value=0}
        @{Path="HKLM:\SOFTWARE\Policies\Microsoft\Edge"; Name="UserFeedbackAllowed"; Type="DWord"; Value=1}
        @{Path="HKLM:\SOFTWARE\Policies\Microsoft\Edge"; Name="ConfigureDoNotTrack"; Type="DWord"; Value=0}
        @{Path="HKLM:\SOFTWARE\Policies\Microsoft\Edge"; Name="AlternateErrorPagesEnabled"; Type="DWord"; Value=1}
        @{Path="HKLM:\SOFTWARE\Policies\Microsoft\Edge"; Name="EdgeCollectionsEnabled"; Type="DWord"; Value=1}
        @{Path="HKLM:\SOFTWARE\Policies\Microsoft\Edge"; Name="EdgeFollowEnabled"; Type="DWord"; Value=1}
        @{Path="HKLM:\SOFTWARE\Policies\Microsoft\Edge"; Name="EdgeShoppingAssistantEnabled"; Type="DWord"; Value=1}
        @{Path="HKLM:\SOFTWARE\Policies\Microsoft\Edge"; Name="MicrosoftEdgeInsiderPromotionEnabled"; Type="DWord"; Value=1}
        @{Path="HKLM:\SOFTWARE\Policies\Microsoft\Edge"; Name="ShowMicrosoftRewards"; Type="DWord"; Value=1}
        @{Path="HKLM:\SOFTWARE\Policies\Microsoft\Edge"; Name="WebWidgetAllowed"; Type="DWord"; Value=1}
        @{Path="HKLM:\SOFTWARE\Policies\Microsoft\Edge"; Name="DiagnosticData"; Type="DWord"; Value=1}
        @{Path="HKLM:\SOFTWARE\Policies\Microsoft\Edge"; Name="EdgeAssetDeliveryServiceEnabled"; Type="DWord"; Value=1}
        @{Path="HKLM:\SOFTWARE\Policies\Microsoft\Edge"; Name="CryptoWalletEnabled"; Type="DWord"; Value=1}
        @{Path="HKLM:\SOFTWARE\Policies\Microsoft\Edge"; Name="WalletDonationEnabled"; Type="DWord"; Value=1}
    )

    $regChanges = if ($Action -eq "Enable") { $regChangesEnable } else { $regChangesDisable }

    foreach ($change in $regChanges) {
        if (-not (Test-Path $change.Path)) {
            New-Item -Path $change.Path -Force | Out-Null
        }
        Set-ItemProperty -Path $change.Path -Name $change.Name -Type $change.Type -Value $change.Value
    }
}

function Set-DetailedBSoD {
    param(
        [Parameter(Mandatory=$true)]
        [ValidateSet("Enable", "Disable")]
        [string]$Action
    )
    Write-Host "$Action Detailed BSoD" -ForegroundColor Yellow
    $regPath = "HKLM:\SYSTEM\CurrentControlSet\Control\CrashControl"
    $value = if ($Action -eq "Enable") { 1 } else { 0 }
    Set-ItemProperty -Path $regPath -Name "DisplayParameters" -Value $value -Force
}

function Set-MSLockscreenContent {
    param(
        [Parameter(Mandatory=$true)]
        [ValidateSet("Enable", "Disable")]
        [string]$Action
    )
    Write-Host "$Action MS Lockscreen Content (ads, tips, etc)" -ForegroundColor Yellow
    $regPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager"
    $value = if ($Action -eq "Enable") { 1 } else { 0 }
    Set-ItemProperty -Path $regPath -Name "SubscribedContent-338387Enabled" -Value $value -Force
}

function Set-LegacyBootMenu {
    param(
        [Parameter(Mandatory=$true)]
        [ValidateSet("Enable", "Disable")]
        [string]$Action
    )
    Write-Host "$Action Legacy Boot Menu (F8 at boot)" -ForegroundColor Yellow
    if ($Action -eq "Enable") {
        bcdedit /set {current} bootmenupolicy Legacy | Out-Null
    } elseif ($Action -eq "Disable") {
        bcdedit /set {current} bootmenupolicy Standard | Out-Null
    }
}

function Set-CameraMicAccess {
    param(
        [Parameter(Mandatory=$true)]
        [ValidateSet("Enable", "Disable")]
        [string]$Action
    )
    $value = if ( $Action -eq "Enable" ) { 1 } else { 0 }
    # Camera
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\webcam" -Name "Value" -Value $value -Force
    # Microphone
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\microphone" -Name "Value" -Value $value -Force
}

function Set-AppLocationAccess {
    param(
        [Parameter(Mandatory=$true)]
        [ValidateSet("Enable", "Disable")]
        [string]$Action
    )
    $value = if ( $Action -eq "Enable" ) { 1 } else { 0 }
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location" -Name "Value" -Value $value -Force
}

function Set-FeedbackFrequency {
    param(
        [Parameter(Mandatory=$true)]
        [ValidateSet("Enable", "Disable")]
        [string]$Action
    )
    if ($Action -eq "Disable") {
        # Set feedback frequency to "Never"
        Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Siuf\Rules" -Name "NumberOfSIUFInPeriod" -Value 0 -Force
        Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Siuf\Rules" -Name "PeriodInNanoSeconds" -Value 0 -Force
    } elseif ($Action -eq "Enable") {
        # Set feedback frequency to "Automatically" (default Windows value)
        Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Siuf\Rules" -Name "NumberOfSIUFInPeriod" -Value 1 -Force
        Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Siuf\Rules" -Name "PeriodInNanoSeconds" -Value 864000000000 -Force
    }
}

function Set-PasswordRevealButton {
    param(
        [Parameter(Mandatory=$true)]
        [ValidateSet("Enable", "Disable")]
        [string]$Action
    )
    $value = if ( $Action -eq "Enable" ) { 0 } else { 1 }
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\CredUI" -Name "DisablePasswordReveal" -Value $value -Type DWord -Force
}

function Set-ControlledFolderAccess {
    param(
        [Parameter(Mandatory=$true)]
        [ValidateSet("Enable", "Disable")]
        [string]$Action
    )
    if ($Action -eq "Enable") {
        Write-Host "Enabling Controlled Folder Access (Defender ransomware protection)" -ForegroundColor Yellow
        Set-MpPreference -EnableControlledFolderAccess Enabled
    } elseif ($Action -eq "Disable") {
        Write-Host "Disabling Controlled Folder Access (Defender ransomware protection)" -ForegroundColor Yellow
        Set-MpPreference -EnableControlledFolderAccess Disabled
    }
}


<# NOT WORKING IN WIN11
function Disable-ConsumerFeatures { # Disable Consumer Features
    Write-Output "Disabling consumer features..."
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\CloudContent" -Name "DisableWindowsConsumerFeatures" -Value 1 -Force
}
#>

<# NOT WORKING IN WIN11
function Disable-StartMenuRecommendations { # Disable Start Menu Recommendations
    # Check if the OS is Windows 11
    Write-Output "Disabling Start Menu Recommendations."
    Write-Output "Verfying Windows 11."
    $windowsBuild = [System.Environment]::OSVersion.Version.Build
    if ($windowsBuild -ge 22000) {
        New-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "Start_Recommended" -PropertyType DWord -Value 0 -Force
        Write-Output "Start Menu Recommendations disabled."
    } else {
        Write-Output "Skipping Start Menu Recommendations setting (only applies to Windows 11)." -ForegroundColor Yellow
    }
}
#>
