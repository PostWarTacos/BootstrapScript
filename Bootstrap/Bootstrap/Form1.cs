using System.Diagnostics;
using System.Reflection;

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
        private string scriptPathTab1 => Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "psapps.ps1");

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
            // Show all embedded resource names for debugging
            var names = Assembly.GetExecutingAssembly().GetManifestResourceNames();
            MessageBox.Show(string.Join("\n", names));

            string scriptPath = scriptPathTab1;
            // The resource name is usually "<DefaultNamespace>.<filename>"
            ExtractEmbeddedScript("Bootstrap.psApps.ps1", scriptPath);
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
                        RunPowerShell($"-NoExit -ExecutionPolicy Bypass -Command \". '{scriptPath}'; Install-DoDCerts; pause\"");
                    }
                    else if (appName == "NvidiaApp")
                    {
                        RunPowerShell($"-NoExit -ExecutionPolicy Bypass -Command \". '{scriptPath}'; Install-NvidiaApp; pause\"");
                    }
                    else if (appName == "Overwolf")
                    {
                        RunPowerShell($"-NoExit -ExecutionPolicy Bypass -Command \". '{scriptPath}'; Install-Overwolf; pause\"");
                    }
                    else if (appName == "WinFetch")
                    {
                        RunPowerShell($"-NoExit -ExecutionPolicy Bypass -Command \". '{scriptPath}'; Install-Winfetch; pause\"");
                    }
                    // Standard install
                    else if (appIdMap.TryGetValue(appName, out var appId))
                    {
                        RunPowerShell($"-NoExit -ExecutionPolicy Bypass -Command \". '{scriptPath}'; Install-Standard -id '{appId}'; pause\"");
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
                        RunPowerShell($"-NoExit -ExecutionPolicy Bypass -Command \". '{scriptPath}'; Uninstall-NvidiaApp; pause\"");
                    }
                    else if (appName == "Overwolf")
                    {
                        RunPowerShell($"-NoExit -ExecutionPolicy Bypass -Command \". '{scriptPath}'; Uninstall-Overwolf; pause\"");
                    }
                    // Standard uninstall
                    else if (appIdMap.TryGetValue(appName, out var appId))
                    {
                        RunPowerShell($"-NoExit -ExecutionPolicy Bypass -Command \". '{scriptPath}'; Uninstall-Standard -id '{appId}'; pause\"");
                    }
                }
            }
        }

        private void updateAllButton_Click(object sender, EventArgs e)
        {
            string scriptPath = scriptPathTab1;

            if (!File.Exists(scriptPath))
            {
                MessageBox.Show($"Script not found: {scriptPath}", "File Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }
            RunPowerShell($"-NoExit -ExecutionPolicy Bypass -Command \". '{scriptPath}'; Update-AllApps; pause\"");
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
                UseShellExecute = true, // Must be true to open a new window
                CreateNoWindow = false  // Show the window
            };

            Process.Start(psi);
        }

        private void ExtractEmbeddedScript(string resourceName, string outputPath)
        {
            var assembly = Assembly.GetExecutingAssembly();
            using var stream = assembly.GetManifestResourceStream(resourceName);
            if (stream == null)
                throw new FileNotFoundException("Resource not found: " + resourceName);

            using var fileStream = new FileStream(outputPath, FileMode.Create, FileAccess.Write);
            stream.CopyTo(fileStream);
        }

        private void button2_Click(object sender, EventArgs e)
        {
            flowLayoutPanel1.Visible = !
            flowLayoutPanel1.Visible;
        }
    }
}
