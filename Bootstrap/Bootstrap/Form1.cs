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

        private void button1_Click(object sender, EventArgs e)
        {
            string combo1value = comboBox1.SelectedItem?.ToString() ?? "No selection";
            string combo2value = comboBox2.SelectedItem?.ToString() ?? "No selection";
            List<string> checkedBoxes = new List<string>();
            if (checkBox1.Checked)
                checkedBoxes.Add(checkBox1.Text);
            if (checkBox2.Checked)
                checkedBoxes.Add(checkBox2.Text);
            if (checkBox3.Checked)
                checkedBoxes.Add(checkBox3.Text);
            if (checkBox4.Checked)
                checkedBoxes.Add(checkBox4.Text);
            if (checkBox5.Checked)
                checkedBoxes.Add(checkBox5.Text);
            if (checkBox6.Checked)
                checkedBoxes.Add(checkBox6.Text);
            if (checkBox7.Checked)
                checkedBoxes.Add(checkBox7.Text);
            if (checkBox8.Checked)
                checkedBoxes.Add(checkBox8.Text);
            if (checkBox9.Checked)
                checkedBoxes.Add(checkBox9.Text);
            if (checkBox10.Checked)
                checkedBoxes.Add(checkBox10.Text);
            string message = $"Combo 1: {combo1value} \n" +
                             $"Combo 2: {combo2value} \n" +
                             $"Checked Boxes: {string.Join(", ", checkedBoxes)}";
            MessageBox.Show(message, "Selected Values", MessageBoxButtons.OK, MessageBoxIcon.Information);
        }
        private void button3_Click(object sender, EventArgs e)
        {

        }

    }
}
