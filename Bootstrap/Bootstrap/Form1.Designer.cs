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
            tabControl1 = new TabControl();
            tabPage1 = new TabPage();
            flowLayoutPanel1 = new FlowLayoutPanel();
            checkBox1 = new CheckBox();
            checkBox2 = new CheckBox();
            checkBox3 = new CheckBox();
            label1 = new Label();
            label2 = new Label();
            label3 = new Label();
            targCombo1 = new ComboBox();
            profCombo1 = new ComboBox();
            instButton = new Button();
            uninstButton = new Button();
            updateAllButton = new Button();
            tabPage2 = new TabPage();
            targCombo2 = new ComboBox();
            profCombo2 = new ComboBox();
            applyButton = new Button();
            checkBox11 = new CheckBox();
            checkBox12 = new CheckBox();
            checkBox13 = new CheckBox();
            checkBox14 = new CheckBox();
            checkBox15 = new CheckBox();
            checkBox16 = new CheckBox();
            checkBox17 = new CheckBox();
            checkBox18 = new CheckBox();
            checkBox19 = new CheckBox();
            checkBox20 = new CheckBox();
            button1 = new Button();
            button2 = new Button();
            tabControl1.SuspendLayout();
            tabPage1.SuspendLayout();
            flowLayoutPanel1.SuspendLayout();
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
            tabControl1.Size = new Size(776, 426);
            tabControl1.TabIndex = 2;
            // 
            // tabPage1
            // 
            tabPage1.BackColor = Color.DarkGray;
            tabPage1.BackgroundImageLayout = ImageLayout.None;
            tabPage1.Controls.Add(button2);
            tabPage1.Controls.Add(flowLayoutPanel1);
            tabPage1.Controls.Add(targCombo1);
            tabPage1.Controls.Add(profCombo1);
            tabPage1.Controls.Add(instButton);
            tabPage1.Controls.Add(uninstButton);
            tabPage1.Controls.Add(updateAllButton);
            tabPage1.Location = new Point(4, 24);
            tabPage1.Name = "tabPage1";
            tabPage1.Padding = new Padding(3);
            tabPage1.Size = new Size(768, 398);
            tabPage1.TabIndex = 0;
            tabPage1.Text = "Install/Uninstall";
            // 
            // flowLayoutPanel1
            // 
            flowLayoutPanel1.AutoScroll = true;
            flowLayoutPanel1.Controls.Add(checkBox1);
            flowLayoutPanel1.Controls.Add(checkBox2);
            flowLayoutPanel1.Controls.Add(checkBox3);
            flowLayoutPanel1.Controls.Add(label1);
            flowLayoutPanel1.Controls.Add(label2);
            flowLayoutPanel1.Controls.Add(label3);
            flowLayoutPanel1.Controls.Add(button1);
            flowLayoutPanel1.FlowDirection = FlowDirection.TopDown;
            flowLayoutPanel1.Location = new Point(33, 94);
            flowLayoutPanel1.Name = "flowLayoutPanel1";
            flowLayoutPanel1.Size = new Size(701, 282);
            flowLayoutPanel1.TabIndex = 17;
            flowLayoutPanel1.WrapContents = false;
            // 
            // checkBox1
            // 
            checkBox1.AutoSize = true;
            checkBox1.Location = new Point(3, 3);
            checkBox1.Name = "checkBox1";
            checkBox1.Size = new Size(88, 19);
            checkBox1.TabIndex = 0;
            checkBox1.Text = "checkBox1";
            checkBox1.UseVisualStyleBackColor = true;
            // 
            // checkBox2
            // 
            checkBox2.AutoSize = true;
            checkBox2.Location = new Point(3, 28);
            checkBox2.Name = "checkBox2";
            checkBox2.Size = new Size(88, 19);
            checkBox2.TabIndex = 1;
            checkBox2.Text = "checkBox2";
            checkBox2.UseVisualStyleBackColor = true;
            // 
            // checkBox3
            // 
            checkBox3.AutoSize = true;
            checkBox3.Location = new Point(3, 53);
            checkBox3.Name = "checkBox3";
            checkBox3.Size = new Size(88, 19);
            checkBox3.TabIndex = 2;
            checkBox3.Text = "checkBox3";
            checkBox3.UseVisualStyleBackColor = true;
            // 
            // label1
            // 
            label1.AutoSize = true;
            label1.Location = new Point(3, 75);
            label1.Name = "label1";
            label1.Size = new Size(40, 15);
            label1.TabIndex = 3;
            label1.Text = "label1";
            // 
            // label2
            // 
            label2.AutoSize = true;
            label2.Location = new Point(3, 90);
            label2.Name = "label2";
            label2.Size = new Size(40, 15);
            label2.TabIndex = 4;
            label2.Text = "label2";
            // 
            // label3
            // 
            label3.AutoSize = true;
            label3.Location = new Point(3, 105);
            label3.Name = "label3";
            label3.Size = new Size(40, 15);
            label3.TabIndex = 5;
            label3.Text = "label3";
            // 
            // targCombo1
            // 
            targCombo1.FormattingEnabled = true;
            targCombo1.Items.AddRange(new object[] { "Matt's Desktop", "Ashley's Desktop" });
            targCombo1.Location = new Point(6, 25);
            targCombo1.Name = "targCombo1";
            targCombo1.Size = new Size(121, 23);
            targCombo1.TabIndex = 0;
            targCombo1.Text = "Target PC";
            // 
            // profCombo1
            // 
            profCombo1.FormattingEnabled = true;
            profCombo1.Items.AddRange(new object[] { "Home", "Work", "Mobile" });
            profCombo1.Location = new Point(133, 25);
            profCombo1.Name = "profCombo1";
            profCombo1.Size = new Size(121, 23);
            profCombo1.TabIndex = 16;
            profCombo1.Text = "Profile";
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
            // tabPage2
            // 
            tabPage2.BackColor = Color.DarkGray;
            tabPage2.Controls.Add(targCombo2);
            tabPage2.Controls.Add(profCombo2);
            tabPage2.Controls.Add(applyButton);
            tabPage2.Controls.Add(checkBox11);
            tabPage2.Controls.Add(checkBox12);
            tabPage2.Controls.Add(checkBox13);
            tabPage2.Controls.Add(checkBox14);
            tabPage2.Controls.Add(checkBox15);
            tabPage2.Controls.Add(checkBox16);
            tabPage2.Controls.Add(checkBox17);
            tabPage2.Controls.Add(checkBox18);
            tabPage2.Controls.Add(checkBox19);
            tabPage2.Controls.Add(checkBox20);
            tabPage2.Location = new Point(4, 24);
            tabPage2.Name = "tabPage2";
            tabPage2.Padding = new Padding(3);
            tabPage2.Size = new Size(768, 398);
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
            // checkBox11
            // 
            checkBox11.AutoSize = true;
            checkBox11.Location = new Point(126, 175);
            checkBox11.Name = "checkBox11";
            checkBox11.Size = new Size(95, 19);
            checkBox11.TabIndex = 31;
            checkBox11.Text = "checkBox11";
            checkBox11.UseVisualStyleBackColor = true;
            // 
            // checkBox12
            // 
            checkBox12.AutoSize = true;
            checkBox12.Location = new Point(126, 150);
            checkBox12.Name = "checkBox12";
            checkBox12.Size = new Size(95, 19);
            checkBox12.TabIndex = 30;
            checkBox12.Text = "checkBox12";
            checkBox12.UseVisualStyleBackColor = true;
            // 
            // checkBox13
            // 
            checkBox13.AutoSize = true;
            checkBox13.Location = new Point(126, 125);
            checkBox13.Name = "checkBox13";
            checkBox13.Size = new Size(95, 19);
            checkBox13.TabIndex = 29;
            checkBox13.Text = "checkBox13";
            checkBox13.UseVisualStyleBackColor = true;
            // 
            // checkBox14
            // 
            checkBox14.AutoSize = true;
            checkBox14.Location = new Point(126, 100);
            checkBox14.Name = "checkBox14";
            checkBox14.Size = new Size(95, 19);
            checkBox14.TabIndex = 28;
            checkBox14.Text = "checkBox14";
            checkBox14.UseVisualStyleBackColor = true;
            // 
            // checkBox15
            // 
            checkBox15.AutoSize = true;
            checkBox15.Location = new Point(126, 75);
            checkBox15.Name = "checkBox15";
            checkBox15.Size = new Size(95, 19);
            checkBox15.TabIndex = 27;
            checkBox15.Text = "checkBox15";
            checkBox15.UseVisualStyleBackColor = true;
            // 
            // checkBox16
            // 
            checkBox16.AutoSize = true;
            checkBox16.Location = new Point(32, 175);
            checkBox16.Name = "checkBox16";
            checkBox16.Size = new Size(95, 19);
            checkBox16.TabIndex = 26;
            checkBox16.Text = "checkBox16";
            checkBox16.UseVisualStyleBackColor = true;
            // 
            // checkBox17
            // 
            checkBox17.AutoSize = true;
            checkBox17.Location = new Point(32, 150);
            checkBox17.Name = "checkBox17";
            checkBox17.Size = new Size(95, 19);
            checkBox17.TabIndex = 25;
            checkBox17.Text = "checkBox17";
            checkBox17.UseVisualStyleBackColor = true;
            // 
            // checkBox18
            // 
            checkBox18.AutoSize = true;
            checkBox18.Location = new Point(32, 125);
            checkBox18.Name = "checkBox18";
            checkBox18.Size = new Size(95, 19);
            checkBox18.TabIndex = 24;
            checkBox18.Text = "checkBox18";
            checkBox18.UseVisualStyleBackColor = true;
            // 
            // checkBox19
            // 
            checkBox19.AutoSize = true;
            checkBox19.Location = new Point(32, 100);
            checkBox19.Name = "checkBox19";
            checkBox19.Size = new Size(95, 19);
            checkBox19.TabIndex = 23;
            checkBox19.Text = "checkBox19";
            checkBox19.UseVisualStyleBackColor = true;
            // 
            // checkBox20
            // 
            checkBox20.AutoSize = true;
            checkBox20.Location = new Point(32, 75);
            checkBox20.Name = "checkBox20";
            checkBox20.Size = new Size(95, 19);
            checkBox20.TabIndex = 22;
            checkBox20.Text = "checkBox20";
            checkBox20.UseVisualStyleBackColor = true;
            // 
            // button1
            // 
            button1.Location = new Point(3, 123);
            button1.Name = "button1";
            button1.Size = new Size(75, 23);
            button1.TabIndex = 6;
            button1.Text = "button1";
            button1.UseVisualStyleBackColor = true;
            // 
            // button2
            // 
            button2.Location = new Point(33, 68);
            button2.Name = "button2";
            button2.Size = new Size(75, 23);
            button2.TabIndex = 18;
            button2.Text = "button2";
            button2.UseVisualStyleBackColor = true;
            button2.Click += button2_Click;
            // 
            // Form1
            // 
            AutoScaleDimensions = new SizeF(7F, 15F);
            AutoScaleMode = AutoScaleMode.Font;
            BackColor = Color.LightSlateGray;
            ClientSize = new Size(800, 450);
            Controls.Add(tabControl1);
            Name = "Form1";
            Text = "Form1";
            Load += Form1_Load;
            tabControl1.ResumeLayout(false);
            tabPage1.ResumeLayout(false);
            flowLayoutPanel1.ResumeLayout(false);
            flowLayoutPanel1.PerformLayout();
            tabPage2.ResumeLayout(false);
            tabPage2.PerformLayout();
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
        private ComboBox targCombo1;
        private ComboBox profCombo1;
        private ComboBox targCombo2;
        private ComboBox profCombo2;
        private CheckBox checkBox11;
        private CheckBox checkBox12;
        private CheckBox checkBox13;
        private CheckBox checkBox14;
        private CheckBox checkBox15;
        private CheckBox checkBox16;
        private CheckBox checkBox17;
        private CheckBox checkBox18;
        private CheckBox checkBox19;
        private CheckBox checkBox20;
        private FlowLayoutPanel flowLayoutPanel1;
        private CheckBox checkBox1;
        private CheckBox checkBox2;
        private CheckBox checkBox3;
        private Label label1;
        private Label label2;
        private Label label3;
        private Button button2;
        private Button button1;
    }
}
