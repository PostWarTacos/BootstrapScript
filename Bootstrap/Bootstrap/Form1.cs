using System.Diagnostics;

namespace Bootstrap
{
    public partial class Form1 : Form
    {
        private readonly Dictionary<string, string> appIdMap = new()
        {
            { "1Password", "AgileBits.1Password" },
            { "7-Zip", "7zip.7zip" },
            { "Adobe Acrobat Reader DC", "Adobe.AcrobatReaderDC" },
            { "Battle.net", "Blizzard.BattleNet" },
            { "Brave", "Brave.Brave" },
            { "Corsair iCue", "Corsair.iCUE.5" },
            { "Discord", "Discord.Discord" },
            { "EA Desktop", "ElectronicArts.EADesktop" },
            { "Epic Games", "EpicGames.EpicGamesLauncher" },
            { "Firefox", "Mozilla.Firefox" },
            { "GIMP", "GIMP.GIMP" },
            { "Git", "Git.Git" },
            { "GitHub Desktop", "GitHub.GitHubDesktop" },
            { "GOG", "GOG.Galaxy" },
            { "Google Chrome", "Google.Chrome" },
            { "Microsoft Edge", "Microsoft.Edge" },
            { "Microsoft Office", "Microsoft.Office" },
            { "Microsoft PowerToys", "Microsoft.PowerToys" },
            { "Microsoft Teams", "Microsoft.Teams" },
            { "Notepad++", "NotepadPlusPlus.NotepadPlusPlus" },
            { "Notion", "Notion.Notion" },
            { "nmap", "Insecure.Nmap" },
            { "OBS Studio", "OBSProject.OBSStudio" },
            { "OhMyPosh", "JanDeDobbeleer.OhMyPosh" },
            { "Origin", "ElectronicArts.Origin" },
            { "Private Internet Access", "PrivateInternetAccess.PrivateInternetAccess" },
            { "PuTTY", "PuTTY.PuTTY" },
            { "Remote Desktop Manager", "Devolutions.RemoteDesktopManager" },
            { "Revo Uninstaller", "RevoUninstaller.RevoUninstaller" },
            { "Steam", "Valve.Steam" },
            { "Steel Series", "SteelSeries.GG" },
            { "Sysinternals", "Microsoft.Sysinternals" },
            { "Thunderbird", "Mozilla.Thunderbird" },
            { "Ubisoft", "ubisoft.connect" },
            { "VLC Media Player", "VideoLAN.VLC" },
            { "VirtualBox", "Oracle.VirtualBox" },
            { "Visual Studio Code", "Microsoft.VisualStudioCode" },
            { "VSCodium", "VSCodium.VSCodium" },
            { "Wireshark", "WiresharkFoundation.Wireshark" },
            { "WinRAR", "WinRAR.WinRAR" },
            { "WinSCP", "WinSCP.WinSCP" },
            { "Windows Terminal", "Microsoft.WindowsTerminal" },
            { "WSL", "Microsoft.WindowsSubsystemForLinux" },
            { "Zoom", "Zoom.Zoom" },
            { "DoD Certs", "DoD Certs" }, // Separate install
            { "NvidiaApp", "NvidiaApp" }, // Separate install
            { "Overwolf", "Overwolf" }, // Separate install
            { "Spotify", "Spotify.Spotify" }, // Install as user, not ADM
            { "WinFetch", "WinFetch" } // Separate install
        };

        // Tab 1 variables
        private string targetTab1 => targCombo1.SelectedItem?.ToString() ?? "No selection";
        private string profileTab1 => profCombo1.SelectedItem?.ToString() ?? "No selection";
        private string scriptPathTab1 => Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "psApps.ps1");

        // Tab 2 variables
        private string targetTab2 => targCombo2.SelectedItem?.ToString() ?? "No selection";
        private string profileTab2 => profCombo2.SelectedItem?.ToString() ?? "No selection";
        private string scriptPathTab2 => Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "psTweaks_Settings.ps1");

        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }

        // Buttons in tab 1
        private void install_Click(object sender, EventArgs e)
        {
            string target = targetTab1;
            string profile = profileTab1;
            string scriptPath = scriptPathTab1;

            // Loop through all CheckBox controls in tabPage1
            foreach (var control in tabPage1.Controls)
            {
                if (control is CheckBox cb && cb.Checked)
                {
                    string appName = cb.Text;

                    // Handle special-case installs
                    if (appName == "DoD Certs")
                    {
                        RunPowerShell($"-NoProfile -ExecutionPolicy Bypass -Command \". '{scriptPath}'; Install-DoDCerts\"");
                    }
                    else if (appName == "NvidiaApp")
                    {
                        RunPowerShell($"-NoProfile -ExecutionPolicy Bypass -Command \". '{scriptPath}'; Install-NvidiaApp\"");
                    }
                    else if (appName == "Overwolf")
                    {
                        RunPowerShell($"-NoProfile -ExecutionPolicy Bypass -Command \". '{scriptPath}'; Install-Overwolf\"");
                    }
                    else if (appName == "WinFetch")
                    {
                        RunPowerShell($"-NoProfile -ExecutionPolicy Bypass -Command \". '{scriptPath}'; Install-Winfetch\"");
                    }
                    // Standard install
                    else if (appIdMap.TryGetValue(appName, out var appId))
                    {
                        RunPowerShell($"-NoProfile -ExecutionPolicy Bypass -Command \". '{scriptPath}'; Install-Standard -id '{appId}'\"");
                    }
                }
            }
        }

        private void uninstall_Click(object sender, EventArgs e)
        {
            string target = targetTab1;
            string profile = profileTab1;
            string scriptPath = scriptPathTab1;

            // Loop through all CheckBox controls in tabPage1
            foreach (var control in tabPage1.Controls)
            {
                if (control is CheckBox cb && cb.Checked)
                {
                    string appName = cb.Text;

                    if (appName == "NvidiaApp")
                    {
                        RunPowerShell($"-NoProfile -ExecutionPolicy Bypass -Command \". '{scriptPath}'; Uninstall-NvidiaApp\"");
                    }
                    else if (appName == "Overwolf")
                    {
                        RunPowerShell($"-NoProfile -ExecutionPolicy Bypass -Command \". '{scriptPath}'; Uninstall-Overwolf\"");
                    }
                    // Standard uninstall
                    else if (appIdMap.TryGetValue(appName, out var appId))
                    {
                        RunPowerShell($"-NoProfile -ExecutionPolicy Bypass -Command \". '{scriptPath}'; Uninstall-Standard -id '{appId}'\"");
                    }
                }
            }
        }

        private void updateAllButton_Click(object sender, EventArgs e)
        {
            string scriptPath = scriptPathTab1;
            RunPowerShell($"-NoProfile -ExecutionPolicy Bypass -Command \". '{scriptPath}'; Update-AllApps\"");
        }

        // Button in tab 2
        private void applyButton_Click(object sender, EventArgs e)
        {
            string target = targetTab2;
            string profile = profileTab2;
            string scriptPath = scriptPathTab2;

            // ... logic for tab 2 ...
        }

        private void RunPowerShell(string arguments)
        {
            ProcessStartInfo psi = new ProcessStartInfo()
            {
                FileName = "powershell.exe",
                Arguments = arguments,
                UseShellExecute = false,
                RedirectStandardOutput = true,
                RedirectStandardError = true,
                CreateNoWindow = true
            };

            using (Process proc = new Process())
            {
                proc.StartInfo = psi;
                proc.Start();
                string output = proc.StandardOutput.ReadToEnd();
                string error = proc.StandardError.ReadToEnd();
                proc.WaitForExit();

                if (!string.IsNullOrEmpty(error))
                {
                    MessageBox.Show(error, "PowerShell Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
                else
                {
                    MessageBox.Show(output, "PowerShell Output", MessageBoxButtons.OK, MessageBoxIcon.Information);
                }
            }
        }
    }
}
