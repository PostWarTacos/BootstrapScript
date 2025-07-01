namespace Bootstrap
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }

        private void install_Click(object sender, EventArgs e)
        {
            string target = targCombo1.SelectedItem?.ToString() ?? "No selection";
            string profile = profCombo1.SelectedItem?.ToString() ?? "No selection";
            List<string> installList = new List<string>();
            if (checkBox1.Checked)
                installList.Add(checkBox1.Text);
            if (checkBox2.Checked)
                installList.Add(checkBox2.Text);
            if (checkBox3.Checked)
                installList.Add(checkBox3.Text);
            if (checkBox4.Checked)
                installList.Add(checkBox4.Text);
            if (checkBox5.Checked)
                installList.Add(checkBox5.Text);
            if (checkBox6.Checked)
                installList.Add(checkBox6.Text);
            if (checkBox7.Checked)
                installList.Add(checkBox7.Text);
            if (checkBox8.Checked)
                installList.Add(checkBox8.Text);
            if (checkBox9.Checked)
                installList.Add(checkBox9.Text);
            if (checkBox10.Checked)
                installList.Add(checkBox10.Text);
            string message = $"Combo 1: {target} \n" +
                             $"Combo 2: {profile} \n" +
                             $"Checked Boxes: {string.Join(", ", installList)}";
            MessageBox.Show(message, "Selected Values", MessageBoxButtons.OK, MessageBoxIcon.Information);
        }
        private void button3_Click(object sender, EventArgs e)
        {

        }

    }
}
