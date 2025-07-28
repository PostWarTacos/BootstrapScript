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
            targCombo1 = new ComboBox();
            profCombo1 = new ComboBox();
            instButton = new Button();
            uninstButton = new Button();
            updateAllButton = new Button();
            checkBox1 = new CheckBox();
            checkBox2 = new CheckBox();
            checkBox3 = new CheckBox();
            checkBox4 = new CheckBox();
            checkBox5 = new CheckBox();
            checkBox6 = new CheckBox();
            checkBox7 = new CheckBox();
            checkBox8 = new CheckBox();
            checkBox9 = new CheckBox();
            checkBox10 = new CheckBox();
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
            tabControl1.SuspendLayout();
            tabPage1.SuspendLayout();
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
            tabPage1.Controls.Add(targCombo1);
            tabPage1.Controls.Add(profCombo1);
            tabPage1.Controls.Add(instButton);
            tabPage1.Controls.Add(uninstButton);
            tabPage1.Controls.Add(updateAllButton);
            tabPage1.Controls.Add(checkBox1);
            tabPage1.Controls.Add(checkBox2);
            tabPage1.Controls.Add(checkBox3);
            tabPage1.Controls.Add(checkBox4);
            tabPage1.Controls.Add(checkBox5);
            tabPage1.Controls.Add(checkBox6);
            tabPage1.Controls.Add(checkBox7);
            tabPage1.Controls.Add(checkBox8);
            tabPage1.Controls.Add(checkBox9);
            tabPage1.Controls.Add(checkBox10);
            tabPage1.Location = new Point(4, 24);
            tabPage1.Name = "tabPage1";
            tabPage1.Padding = new Padding(3);
            tabPage1.Size = new Size(768, 398);
            tabPage1.TabIndex = 0;
            tabPage1.Text = "Install/Uninstall";
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
            // checkBox1
            // 
            checkBox1.AutoSize = true;
            checkBox1.Location = new Point(39, 76);
            checkBox1.Name = "checkBox1";
            checkBox1.Size = new Size(88, 19);
            checkBox1.TabIndex = 2;
            checkBox1.Text = "checkBox1";
            checkBox1.UseVisualStyleBackColor = true;
            // 
            // checkBox2
            // 
            checkBox2.AutoSize = true;
            checkBox2.Location = new Point(39, 101);
            checkBox2.Name = "checkBox2";
            checkBox2.Size = new Size(88, 19);
            checkBox2.TabIndex = 3;
            checkBox2.Text = "checkBox2";
            checkBox2.UseVisualStyleBackColor = true;
            // 
            // checkBox3
            // 
            checkBox3.AutoSize = true;
            checkBox3.Location = new Point(39, 126);
            checkBox3.Name = "checkBox3";
            checkBox3.Size = new Size(88, 19);
            checkBox3.TabIndex = 4;
            checkBox3.Text = "checkBox3";
            checkBox3.UseVisualStyleBackColor = true;
            // 
            // checkBox4
            // 
            checkBox4.AutoSize = true;
            checkBox4.Location = new Point(39, 151);
            checkBox4.Name = "checkBox4";
            checkBox4.Size = new Size(88, 19);
            checkBox4.TabIndex = 5;
            checkBox4.Text = "checkBox4";
            checkBox4.UseVisualStyleBackColor = true;
            // 
            // checkBox5
            // 
            checkBox5.AutoSize = true;
            checkBox5.Location = new Point(39, 176);
            checkBox5.Name = "checkBox5";
            checkBox5.Size = new Size(88, 19);
            checkBox5.TabIndex = 6;
            checkBox5.Text = "checkBox5";
            checkBox5.UseVisualStyleBackColor = true;
            // 
            // checkBox6
            // 
            checkBox6.AutoSize = true;
            checkBox6.Location = new Point(133, 76);
            checkBox6.Name = "checkBox6";
            checkBox6.Size = new Size(88, 19);
            checkBox6.TabIndex = 7;
            checkBox6.Text = "checkBox6";
            checkBox6.UseVisualStyleBackColor = true;
            // 
            // checkBox7
            // 
            checkBox7.AutoSize = true;
            checkBox7.Location = new Point(133, 101);
            checkBox7.Name = "checkBox7";
            checkBox7.Size = new Size(88, 19);
            checkBox7.TabIndex = 8;
            checkBox7.Text = "checkBox7";
            checkBox7.UseVisualStyleBackColor = true;
            // 
            // checkBox8
            // 
            checkBox8.AutoSize = true;
            checkBox8.Location = new Point(133, 126);
            checkBox8.Name = "checkBox8";
            checkBox8.Size = new Size(88, 19);
            checkBox8.TabIndex = 9;
            checkBox8.Text = "checkBox8";
            checkBox8.UseVisualStyleBackColor = true;
            // 
            // checkBox9
            // 
            checkBox9.AutoSize = true;
            checkBox9.Location = new Point(133, 151);
            checkBox9.Name = "checkBox9";
            checkBox9.Size = new Size(88, 19);
            checkBox9.TabIndex = 10;
            checkBox9.Text = "checkBox9";
            checkBox9.UseVisualStyleBackColor = true;
            // 
            // checkBox10
            // 
            checkBox10.AutoSize = true;
            checkBox10.Location = new Point(133, 176);
            checkBox10.Name = "checkBox10";
            checkBox10.Size = new Size(95, 19);
            checkBox10.TabIndex = 11;
            checkBox10.Text = "checkBox10";
            checkBox10.UseVisualStyleBackColor = true;
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
            tabPage1.PerformLayout();
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
        private CheckBox checkBox1;
        private CheckBox checkBox2;
        private CheckBox checkBox3;
        private CheckBox checkBox4;
        private CheckBox checkBox5;
        private CheckBox checkBox6;
        private CheckBox checkBox7;
        private CheckBox checkBox8;
        private CheckBox checkBox9;
        private CheckBox checkBox10;
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
    }
}
