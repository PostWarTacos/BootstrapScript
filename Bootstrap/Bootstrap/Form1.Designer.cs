namespace Bootstrap
{
    partial class Form1
    {
        /// <summary>
        ///  Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        ///  Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        ///  Required method for Designer support - do not modify
        ///  the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(Form1));
            tabControl1 = new TabControl();
            tabPage1 = new TabPage();
            comboTarg = new ComboBox();
            comboProf = new ComboBox();
            instButton = new Button();
            uninstButton = new Button();
            updateAllButton = new Button();
            mainFlowPanel = new FlowLayoutPanel();
            panelUtility = new Panel();
            buttonUtility = new Button();
            button1 = new Button();
            labelUtility = new Label();
            flowLayoutUtility = new FlowLayoutPanel();
            checkBox7 = new CheckBox();
            checkBox8 = new CheckBox();
            checkBox9 = new CheckBox();
            panelDevelop = new Panel();
            buttonDevelop = new Button();
            button2 = new Button();
            labelDevelop = new Label();
            flowLayoutDevelop = new FlowLayoutPanel();
            checkBox10 = new CheckBox();
            checkBox11 = new CheckBox();
            checkBox12 = new CheckBox();
            panelEmail = new Panel();
            buttonEmail = new Button();
            labelEmail = new Label();
            flowLayoutEmail = new FlowLayoutPanel();
            checkBox4 = new CheckBox();
            checkBox5 = new CheckBox();
            checkBox6 = new CheckBox();
            panelBrowsers = new Panel();
            labelBrowsers = new Label();
            buttonBrowsers = new Button();
            flowLayoutBrowsers = new FlowLayoutPanel();
            checkBox1 = new CheckBox();
            checkBox2 = new CheckBox();
            checkBox3 = new CheckBox();
            tabPage2 = new TabPage();
            targCombo2 = new ComboBox();
            profCombo2 = new ComboBox();
            applyButton = new Button();
            tabControl1.SuspendLayout();
            tabPage1.SuspendLayout();
            mainFlowPanel.SuspendLayout();
            panelUtility.SuspendLayout();
            flowLayoutUtility.SuspendLayout();
            panelDevelop.SuspendLayout();
            flowLayoutDevelop.SuspendLayout();
            panelEmail.SuspendLayout();
            flowLayoutEmail.SuspendLayout();
            panelBrowsers.SuspendLayout();
            flowLayoutBrowsers.SuspendLayout();
            tabPage2.SuspendLayout();
            SuspendLayout();
            // 
            // tabControl1
            // 
            tabControl1.Controls.Add(tabPage1);
            tabControl1.Controls.Add(tabPage2);
            tabControl1.Font = new Font("Segoe UI", 9F, FontStyle.Bold);
            tabControl1.Location = new Point(12, 12);
            tabControl1.Name = "tabControl1";
            tabControl1.SelectedIndex = 0;
            tabControl1.Size = new Size(1218, 601);
            tabControl1.TabIndex = 2;
            // 
            // tabPage1
            // 
            tabPage1.BackColor = Color.DarkGray;
            tabPage1.BackgroundImageLayout = ImageLayout.None;
            tabPage1.Controls.Add(comboTarg);
            tabPage1.Controls.Add(comboProf);
            tabPage1.Controls.Add(instButton);
            tabPage1.Controls.Add(uninstButton);
            tabPage1.Controls.Add(updateAllButton);
            tabPage1.Controls.Add(mainFlowPanel);
            tabPage1.Location = new Point(4, 24);
            tabPage1.Name = "tabPage1";
            tabPage1.Padding = new Padding(5, 3, 5, 3);
            tabPage1.Size = new Size(1210, 573);
            tabPage1.TabIndex = 0;
            tabPage1.Text = "Install/Uninstall";
            // 
            // comboTarg
            // 
            comboTarg.FormattingEnabled = true;
            comboTarg.Items.AddRange(new object[] { "Matt's Desktop", "Ashley's Desktop" });
            comboTarg.Location = new Point(6, 25);
            comboTarg.Name = "comboTarg";
            comboTarg.Size = new Size(121, 23);
            comboTarg.TabIndex = 0;
            comboTarg.Text = "Target PC";
            // 
            // comboProf
            // 
            comboProf.FormattingEnabled = true;
            comboProf.Items.AddRange(new object[] { "Home", "Work", "Mobile" });
            comboProf.Location = new Point(133, 26);
            comboProf.Name = "comboProf";
            comboProf.Size = new Size(121, 23);
            comboProf.TabIndex = 16;
            comboProf.Text = "Profile";
            // 
            // instButton
            // 
            instButton.Location = new Point(265, 25);
            instButton.Name = "instButton";
            instButton.Size = new Size(81, 23);
            instButton.TabIndex = 14;
            instButton.Text = "INSTALL";
            instButton.UseVisualStyleBackColor = true;
            instButton.Click += install_Click;
            // 
            // uninstButton
            // 
            uninstButton.Location = new Point(352, 25);
            uninstButton.Name = "uninstButton";
            uninstButton.Size = new Size(81, 23);
            uninstButton.TabIndex = 13;
            uninstButton.Text = "UNINSTALL";
            uninstButton.UseVisualStyleBackColor = true;
            // 
            // updateAllButton
            // 
            updateAllButton.Location = new Point(439, 25);
            updateAllButton.Name = "updateAllButton";
            updateAllButton.Size = new Size(98, 23);
            updateAllButton.TabIndex = 15;
            updateAllButton.Text = "UPDATE ALL";
            updateAllButton.UseVisualStyleBackColor = true;
            updateAllButton.Click += updateAllButton_Click;
            // 
            // mainFlowPanel
            // 
            mainFlowPanel.AutoScroll = true;
            mainFlowPanel.Controls.Add(panelUtility);
            mainFlowPanel.Controls.Add(flowLayoutUtility);
            mainFlowPanel.Controls.Add(panelDevelop);
            mainFlowPanel.Controls.Add(flowLayoutDevelop);
            mainFlowPanel.Controls.Add(panelEmail);
            mainFlowPanel.Controls.Add(flowLayoutEmail);
            mainFlowPanel.Controls.Add(panelBrowsers);
            mainFlowPanel.Controls.Add(flowLayoutBrowsers);
            mainFlowPanel.FlowDirection = FlowDirection.TopDown;
            mainFlowPanel.Location = new Point(8, 65);
            mainFlowPanel.Name = "mainFlowPanel";
            mainFlowPanel.Size = new Size(1194, 491);
            mainFlowPanel.TabIndex = 21;
            mainFlowPanel.WrapContents = false;
            // 
            // panelUtility
            // 
            panelUtility.BackColor = Color.LightSteelBlue;
            panelUtility.BorderStyle = BorderStyle.FixedSingle;
            panelUtility.Controls.Add(buttonUtility);
            panelUtility.Controls.Add(button1);
            panelUtility.Controls.Add(labelUtility);
            panelUtility.Location = new Point(3, 3);
            panelUtility.Margin = new Padding(3, 3, 3, 1);
            panelUtility.Name = "panelUtility";
            panelUtility.Size = new Size(1158, 23);
            panelUtility.TabIndex = 22;
            // 
            // buttonUtility
            // 
            buttonUtility.Anchor = AnchorStyles.None;
            buttonUtility.BackgroundImage = (Image)resources.GetObject("buttonUtility.BackgroundImage");
            buttonUtility.BackgroundImageLayout = ImageLayout.Stretch;
            buttonUtility.FlatAppearance.BorderSize = 0;
            buttonUtility.FlatStyle = FlatStyle.Flat;
            buttonUtility.Location = new Point(2, 2);
            buttonUtility.Margin = new Padding(2);
            buttonUtility.Name = "buttonUtility";
            buttonUtility.Size = new Size(31, 15);
            buttonUtility.TabIndex = 23;
            buttonUtility.UseVisualStyleBackColor = true;
            // 
            // button1
            // 
            button1.Anchor = AnchorStyles.None;
            button1.BackgroundImage = (Image)resources.GetObject("button1.BackgroundImage");
            button1.BackgroundImageLayout = ImageLayout.Stretch;
            button1.FlatAppearance.BorderSize = 0;
            button1.FlatStyle = FlatStyle.Flat;
            button1.Location = new Point(480, -38);
            button1.Margin = new Padding(2);
            button1.Name = "button1";
            button1.Size = new Size(31, 15);
            button1.TabIndex = 21;
            button1.UseVisualStyleBackColor = true;
            // 
            // labelUtility
            // 
            labelUtility.AutoSize = true;
            labelUtility.Location = new Point(38, 2);
            labelUtility.Name = "labelUtility";
            labelUtility.Size = new Size(41, 15);
            labelUtility.TabIndex = 1;
            labelUtility.Text = "Utility";
            // 
            // flowLayoutUtility
            // 
            flowLayoutUtility.AutoScroll = true;
            flowLayoutUtility.BackColor = Color.LightGray;
            flowLayoutUtility.BorderStyle = BorderStyle.FixedSingle;
            flowLayoutUtility.Controls.Add(checkBox7);
            flowLayoutUtility.Controls.Add(checkBox8);
            flowLayoutUtility.Controls.Add(checkBox9);
            flowLayoutUtility.FlowDirection = FlowDirection.TopDown;
            flowLayoutUtility.Location = new Point(10, 28);
            flowLayoutUtility.Margin = new Padding(10, 1, 10, 5);
            flowLayoutUtility.Name = "flowLayoutUtility";
            flowLayoutUtility.Padding = new Padding(5, 3, 5, 3);
            flowLayoutUtility.Size = new Size(1151, 106);
            flowLayoutUtility.TabIndex = 23;
            flowLayoutUtility.WrapContents = false;
            // 
            // checkBox7
            // 
            checkBox7.AutoSize = true;
            checkBox7.Location = new Point(8, 6);
            checkBox7.Name = "checkBox7";
            checkBox7.Size = new Size(88, 19);
            checkBox7.TabIndex = 0;
            checkBox7.Text = "checkBox4";
            checkBox7.UseVisualStyleBackColor = true;
            // 
            // checkBox8
            // 
            checkBox8.AutoSize = true;
            checkBox8.Location = new Point(8, 31);
            checkBox8.Name = "checkBox8";
            checkBox8.Size = new Size(88, 19);
            checkBox8.TabIndex = 1;
            checkBox8.Text = "checkBox5";
            checkBox8.UseVisualStyleBackColor = true;
            // 
            // checkBox9
            // 
            checkBox9.AutoSize = true;
            checkBox9.Location = new Point(8, 56);
            checkBox9.Name = "checkBox9";
            checkBox9.Size = new Size(88, 19);
            checkBox9.TabIndex = 2;
            checkBox9.Text = "checkBox6";
            checkBox9.UseVisualStyleBackColor = true;
            // 
            // panelDevelop
            // 
            panelDevelop.BackColor = Color.LightSteelBlue;
            panelDevelop.BorderStyle = BorderStyle.FixedSingle;
            panelDevelop.Controls.Add(buttonDevelop);
            panelDevelop.Controls.Add(button2);
            panelDevelop.Controls.Add(labelDevelop);
            panelDevelop.Location = new Point(3, 142);
            panelDevelop.Margin = new Padding(3, 3, 3, 1);
            panelDevelop.Name = "panelDevelop";
            panelDevelop.Size = new Size(1158, 23);
            panelDevelop.TabIndex = 24;
            // 
            // buttonDevelop
            // 
            buttonDevelop.Anchor = AnchorStyles.None;
            buttonDevelop.BackgroundImage = (Image)resources.GetObject("buttonDevelop.BackgroundImage");
            buttonDevelop.BackgroundImageLayout = ImageLayout.Stretch;
            buttonDevelop.FlatAppearance.BorderSize = 0;
            buttonDevelop.FlatStyle = FlatStyle.Flat;
            buttonDevelop.Location = new Point(2, 2);
            buttonDevelop.Margin = new Padding(2);
            buttonDevelop.Name = "buttonDevelop";
            buttonDevelop.Size = new Size(31, 15);
            buttonDevelop.TabIndex = 22;
            buttonDevelop.UseVisualStyleBackColor = true;
            // 
            // button2
            // 
            button2.Anchor = AnchorStyles.None;
            button2.BackgroundImage = (Image)resources.GetObject("button2.BackgroundImage");
            button2.BackgroundImageLayout = ImageLayout.Stretch;
            button2.FlatAppearance.BorderSize = 0;
            button2.FlatStyle = FlatStyle.Flat;
            button2.Location = new Point(965, -78);
            button2.Margin = new Padding(2);
            button2.Name = "button2";
            button2.Size = new Size(31, 15);
            button2.TabIndex = 21;
            button2.UseVisualStyleBackColor = true;
            // 
            // labelDevelop
            // 
            labelDevelop.AutoSize = true;
            labelDevelop.Location = new Point(38, 2);
            labelDevelop.Name = "labelDevelop";
            labelDevelop.Size = new Size(84, 15);
            labelDevelop.TabIndex = 1;
            labelDevelop.Text = "Development";
            // 
            // flowLayoutDevelop
            // 
            flowLayoutDevelop.AutoScroll = true;
            flowLayoutDevelop.BackColor = Color.LightGray;
            flowLayoutDevelop.BorderStyle = BorderStyle.FixedSingle;
            flowLayoutDevelop.Controls.Add(checkBox10);
            flowLayoutDevelop.Controls.Add(checkBox11);
            flowLayoutDevelop.Controls.Add(checkBox12);
            flowLayoutDevelop.FlowDirection = FlowDirection.TopDown;
            flowLayoutDevelop.Location = new Point(10, 167);
            flowLayoutDevelop.Margin = new Padding(10, 1, 10, 5);
            flowLayoutDevelop.Name = "flowLayoutDevelop";
            flowLayoutDevelop.Padding = new Padding(5, 3, 5, 3);
            flowLayoutDevelop.Size = new Size(1151, 106);
            flowLayoutDevelop.TabIndex = 25;
            flowLayoutDevelop.WrapContents = false;
            // 
            // checkBox10
            // 
            checkBox10.AutoSize = true;
            checkBox10.Location = new Point(8, 6);
            checkBox10.Name = "checkBox10";
            checkBox10.Size = new Size(88, 19);
            checkBox10.TabIndex = 0;
            checkBox10.Text = "checkBox4";
            checkBox10.UseVisualStyleBackColor = true;
            // 
            // checkBox11
            // 
            checkBox11.AutoSize = true;
            checkBox11.Location = new Point(8, 31);
            checkBox11.Name = "checkBox11";
            checkBox11.Size = new Size(88, 19);
            checkBox11.TabIndex = 1;
            checkBox11.Text = "checkBox5";
            checkBox11.UseVisualStyleBackColor = true;
            // 
            // checkBox12
            // 
            checkBox12.AutoSize = true;
            checkBox12.Location = new Point(8, 56);
            checkBox12.Name = "checkBox12";
            checkBox12.Size = new Size(88, 19);
            checkBox12.TabIndex = 2;
            checkBox12.Text = "checkBox6";
            checkBox12.UseVisualStyleBackColor = true;
            // 
            // panelEmail
            // 
            panelEmail.BackColor = Color.LightSteelBlue;
            panelEmail.BorderStyle = BorderStyle.FixedSingle;
            panelEmail.Controls.Add(buttonEmail);
            panelEmail.Controls.Add(labelEmail);
            panelEmail.Location = new Point(3, 281);
            panelEmail.Margin = new Padding(3, 3, 3, 1);
            panelEmail.Name = "panelEmail";
            panelEmail.Size = new Size(1158, 23);
            panelEmail.TabIndex = 19;
            // 
            // buttonEmail
            // 
            buttonEmail.Anchor = AnchorStyles.None;
            buttonEmail.BackgroundImage = (Image)resources.GetObject("buttonEmail.BackgroundImage");
            buttonEmail.BackgroundImageLayout = ImageLayout.Stretch;
            buttonEmail.FlatAppearance.BorderSize = 0;
            buttonEmail.FlatStyle = FlatStyle.Flat;
            buttonEmail.Location = new Point(2, 2);
            buttonEmail.Margin = new Padding(2);
            buttonEmail.Name = "buttonEmail";
            buttonEmail.Size = new Size(31, 15);
            buttonEmail.TabIndex = 21;
            buttonEmail.UseVisualStyleBackColor = true;
            buttonEmail.Click += button200_Click;
            // 
            // labelEmail
            // 
            labelEmail.AutoSize = true;
            labelEmail.Location = new Point(38, 2);
            labelEmail.Name = "labelEmail";
            labelEmail.Size = new Size(76, 15);
            labelEmail.TabIndex = 1;
            labelEmail.Text = "Email Clients";
            // 
            // flowLayoutEmail
            // 
            flowLayoutEmail.AutoScroll = true;
            flowLayoutEmail.BackColor = Color.LightGray;
            flowLayoutEmail.BorderStyle = BorderStyle.FixedSingle;
            flowLayoutEmail.Controls.Add(checkBox4);
            flowLayoutEmail.Controls.Add(checkBox5);
            flowLayoutEmail.Controls.Add(checkBox6);
            flowLayoutEmail.FlowDirection = FlowDirection.TopDown;
            flowLayoutEmail.Location = new Point(10, 306);
            flowLayoutEmail.Margin = new Padding(10, 1, 10, 5);
            flowLayoutEmail.Name = "flowLayoutEmail";
            flowLayoutEmail.Padding = new Padding(5, 3, 5, 3);
            flowLayoutEmail.Size = new Size(1151, 106);
            flowLayoutEmail.TabIndex = 20;
            flowLayoutEmail.WrapContents = false;
            // 
            // checkBox4
            // 
            checkBox4.AutoSize = true;
            checkBox4.Location = new Point(8, 6);
            checkBox4.Name = "checkBox4";
            checkBox4.Size = new Size(88, 19);
            checkBox4.TabIndex = 0;
            checkBox4.Text = "checkBox4";
            checkBox4.UseVisualStyleBackColor = true;
            // 
            // checkBox5
            // 
            checkBox5.AutoSize = true;
            checkBox5.Location = new Point(8, 31);
            checkBox5.Name = "checkBox5";
            checkBox5.Size = new Size(88, 19);
            checkBox5.TabIndex = 1;
            checkBox5.Text = "checkBox5";
            checkBox5.UseVisualStyleBackColor = true;
            // 
            // checkBox6
            // 
            checkBox6.AutoSize = true;
            checkBox6.Location = new Point(8, 56);
            checkBox6.Name = "checkBox6";
            checkBox6.Size = new Size(88, 19);
            checkBox6.TabIndex = 2;
            checkBox6.Text = "checkBox6";
            checkBox6.UseVisualStyleBackColor = true;
            // 
            // panelBrowsers
            // 
            panelBrowsers.BackColor = Color.LightSteelBlue;
            panelBrowsers.BorderStyle = BorderStyle.FixedSingle;
            panelBrowsers.Controls.Add(labelBrowsers);
            panelBrowsers.Controls.Add(buttonBrowsers);
            panelBrowsers.Location = new Point(3, 420);
            panelBrowsers.Margin = new Padding(3, 3, 3, 1);
            panelBrowsers.Name = "panelBrowsers";
            panelBrowsers.Size = new Size(1158, 23);
            panelBrowsers.TabIndex = 3;
            // 
            // labelBrowsers
            // 
            labelBrowsers.AutoSize = true;
            labelBrowsers.Location = new Point(38, 2);
            labelBrowsers.Name = "labelBrowsers";
            labelBrowsers.Size = new Size(59, 15);
            labelBrowsers.TabIndex = 22;
            labelBrowsers.Text = "Browsers";
            // 
            // buttonBrowsers
            // 
            buttonBrowsers.Anchor = AnchorStyles.None;
            buttonBrowsers.BackgroundImage = (Image)resources.GetObject("buttonBrowsers.BackgroundImage");
            buttonBrowsers.BackgroundImageLayout = ImageLayout.Stretch;
            buttonBrowsers.FlatAppearance.BorderSize = 0;
            buttonBrowsers.FlatStyle = FlatStyle.Flat;
            buttonBrowsers.Location = new Point(2, 2);
            buttonBrowsers.Margin = new Padding(2);
            buttonBrowsers.Name = "buttonBrowsers";
            buttonBrowsers.Size = new Size(31, 15);
            buttonBrowsers.TabIndex = 18;
            buttonBrowsers.UseVisualStyleBackColor = true;
            buttonBrowsers.Click += button2_Click;
            // 
            // flowLayoutBrowsers
            // 
            flowLayoutBrowsers.AutoScroll = true;
            flowLayoutBrowsers.BackColor = Color.LightGray;
            flowLayoutBrowsers.BorderStyle = BorderStyle.FixedSingle;
            flowLayoutBrowsers.Controls.Add(checkBox1);
            flowLayoutBrowsers.Controls.Add(checkBox2);
            flowLayoutBrowsers.Controls.Add(checkBox3);
            flowLayoutBrowsers.FlowDirection = FlowDirection.TopDown;
            flowLayoutBrowsers.Location = new Point(10, 445);
            flowLayoutBrowsers.Margin = new Padding(10, 1, 10, 5);
            flowLayoutBrowsers.Name = "flowLayoutBrowsers";
            flowLayoutBrowsers.Padding = new Padding(5, 3, 5, 3);
            flowLayoutBrowsers.Size = new Size(1151, 106);
            flowLayoutBrowsers.TabIndex = 17;
            flowLayoutBrowsers.WrapContents = false;
            // 
            // checkBox1
            // 
            checkBox1.AutoSize = true;
            checkBox1.Location = new Point(8, 6);
            checkBox1.Name = "checkBox1";
            checkBox1.Size = new Size(88, 19);
            checkBox1.TabIndex = 0;
            checkBox1.Text = "checkBox1";
            checkBox1.UseVisualStyleBackColor = true;
            // 
            // checkBox2
            // 
            checkBox2.AutoSize = true;
            checkBox2.Location = new Point(8, 31);
            checkBox2.Name = "checkBox2";
            checkBox2.Size = new Size(88, 19);
            checkBox2.TabIndex = 1;
            checkBox2.Text = "checkBox2";
            checkBox2.UseVisualStyleBackColor = true;
            // 
            // checkBox3
            // 
            checkBox3.AutoSize = true;
            checkBox3.Location = new Point(8, 56);
            checkBox3.Name = "checkBox3";
            checkBox3.Size = new Size(88, 19);
            checkBox3.TabIndex = 2;
            checkBox3.Text = "checkBox3";
            checkBox3.UseVisualStyleBackColor = true;
            // 
            // tabPage2
            // 
            tabPage2.BackColor = Color.DarkGray;
            tabPage2.Controls.Add(targCombo2);
            tabPage2.Controls.Add(profCombo2);
            tabPage2.Controls.Add(applyButton);
            tabPage2.Location = new Point(4, 24);
            tabPage2.Name = "tabPage2";
            tabPage2.Padding = new Padding(3);
            tabPage2.Size = new Size(1210, 573);
            tabPage2.TabIndex = 1;
            tabPage2.Text = "Tweaks & Settings";
            // 
            // targCombo2
            // 
            targCombo2.FormattingEnabled = true;
            targCombo2.Location = new Point(133, 25);
            targCombo2.Name = "targCombo2";
            targCombo2.Size = new Size(121, 23);
            targCombo2.TabIndex = 20;
            targCombo2.Text = "Profile";
            // 
            // profCombo2
            // 
            profCombo2.FormattingEnabled = true;
            profCombo2.Location = new Point(6, 25);
            profCombo2.Name = "profCombo2";
            profCombo2.Size = new Size(121, 23);
            profCombo2.TabIndex = 18;
            profCombo2.Text = "Target PC";
            // 
            // applyButton
            // 
            applyButton.Location = new Point(260, 25);
            applyButton.Name = "applyButton";
            applyButton.Size = new Size(81, 23);
            applyButton.TabIndex = 32;
            applyButton.Text = "APPLY";
            applyButton.UseVisualStyleBackColor = true;
            // 
            // Form1
            // 
            AutoScaleDimensions = new SizeF(7F, 15F);
            AutoScaleMode = AutoScaleMode.Font;
            AutoScroll = true;
            AutoSize = true;
            BackColor = Color.LightSlateGray;
            ClientSize = new Size(1242, 625);
            Controls.Add(tabControl1);
            Name = "Form1";
            Text = "Form1";
            Load += Form1_Load;
            tabControl1.ResumeLayout(false);
            tabPage1.ResumeLayout(false);
            mainFlowPanel.ResumeLayout(false);
            panelUtility.ResumeLayout(false);
            panelUtility.PerformLayout();
            flowLayoutUtility.ResumeLayout(false);
            flowLayoutUtility.PerformLayout();
            panelDevelop.ResumeLayout(false);
            panelDevelop.PerformLayout();
            flowLayoutDevelop.ResumeLayout(false);
            flowLayoutDevelop.PerformLayout();
            panelEmail.ResumeLayout(false);
            panelEmail.PerformLayout();
            flowLayoutEmail.ResumeLayout(false);
            flowLayoutEmail.PerformLayout();
            panelBrowsers.ResumeLayout(false);
            panelBrowsers.PerformLayout();
            flowLayoutBrowsers.ResumeLayout(false);
            flowLayoutBrowsers.PerformLayout();
            tabPage2.ResumeLayout(false);
            ResumeLayout(false);
        }

        #endregion
        private TabControl tabControl1;
        private TabPage tabPage1;
        private TabPage tabPage2;
        private Button instButton;
        private Button uninstButton;
        private Button updateAllButton;
        private Button applyButton;
        private ComboBox comboTarg;
        private ComboBox comboProf;
        private ComboBox targCombo2;
        private ComboBox profCombo2;
        private FlowLayoutPanel flowLayoutBrowsers;
        private CheckBox checkBox1;
        private CheckBox checkBox2;
        private CheckBox checkBox3;
        private Button buttonBrowsers;
        private Panel panelBrowsers;
        private Button buttonEmail;
        private FlowLayoutPanel flowLayoutEmail;
        private CheckBox checkBox4;
        private CheckBox checkBox5;
        private CheckBox checkBox6;
        private Panel panelEmail;
        private Label labelUtility;
        //private Label label1;
        private FlowLayoutPanel mainFlowPanel;
        private Label labelEmail;
        private Label labelBrowsers;
        private Panel panelDevelop;
        private Button button2;
        private Label labelDevelop;
        private FlowLayoutPanel flowLayoutDevelop;
        private CheckBox checkBox10;
        private CheckBox checkBox11;
        private CheckBox checkBox12;
        private FlowLayoutPanel flowLayoutUtility;
        private CheckBox checkBox7;
        private CheckBox checkBox8;
        private CheckBox checkBox9;
        private Panel panelUtility;
        private Button button1;
        private Button buttonUtility;
        private Button buttonDevelop;
    }
}
