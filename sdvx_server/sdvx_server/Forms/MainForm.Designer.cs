
namespace sdvx_server.Forms
{
    partial class MainForm
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
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
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(MainForm));
            this.tableLayoutPanel1 = new System.Windows.Forms.TableLayoutPanel();
            this.startBtn = new MaterialSkin.Controls.MaterialFlatButton();
            this.lblPort = new MaterialSkin.Controls.MaterialLabel();
            this.txtPort = new MaterialSkin.Controls.MaterialSingleLineTextField();
            this.txtMessages = new System.Windows.Forms.RichTextBox();
            this.tableLayoutPanel1.SuspendLayout();
            this.SuspendLayout();
            // 
            // tableLayoutPanel1
            // 
            this.tableLayoutPanel1.ColumnCount = 3;
            this.tableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 19.97423F));
            this.tableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 80.02577F));
            this.tableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Absolute, 400F));
            this.tableLayoutPanel1.Controls.Add(this.startBtn, 0, 2);
            this.tableLayoutPanel1.Controls.Add(this.lblPort, 0, 0);
            this.tableLayoutPanel1.Controls.Add(this.txtPort, 1, 0);
            this.tableLayoutPanel1.Controls.Add(this.txtMessages, 1, 1);
            this.tableLayoutPanel1.Location = new System.Drawing.Point(12, 76);
            this.tableLayoutPanel1.Name = "tableLayoutPanel1";
            this.tableLayoutPanel1.RowCount = 3;
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 33F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 89.77901F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 10.22099F));
            this.tableLayoutPanel1.Size = new System.Drawing.Size(776, 362);
            this.tableLayoutPanel1.TabIndex = 0;
            // 
            // startBtn
            // 
            this.startBtn.AutoSize = true;
            this.startBtn.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.tableLayoutPanel1.SetColumnSpan(this.startBtn, 3);
            this.startBtn.Depth = 0;
            this.startBtn.Dock = System.Windows.Forms.DockStyle.Fill;
            this.startBtn.Location = new System.Drawing.Point(4, 334);
            this.startBtn.Margin = new System.Windows.Forms.Padding(4, 6, 4, 6);
            this.startBtn.MouseState = MaterialSkin.MouseState.HOVER;
            this.startBtn.Name = "startBtn";
            this.startBtn.Primary = false;
            this.startBtn.Size = new System.Drawing.Size(768, 22);
            this.startBtn.TabIndex = 0;
            this.startBtn.Text = "Start server";
            this.startBtn.UseVisualStyleBackColor = true;
            this.startBtn.Click += new System.EventHandler(this.startBtn_Click);
            // 
            // lblPort
            // 
            this.lblPort.AutoSize = true;
            this.lblPort.Depth = 0;
            this.lblPort.Dock = System.Windows.Forms.DockStyle.Fill;
            this.lblPort.Font = new System.Drawing.Font("Roboto", 11F);
            this.lblPort.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(222)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.lblPort.Location = new System.Drawing.Point(3, 0);
            this.lblPort.MouseState = MaterialSkin.MouseState.HOVER;
            this.lblPort.Name = "lblPort";
            this.lblPort.Size = new System.Drawing.Size(69, 33);
            this.lblPort.TabIndex = 1;
            this.lblPort.Text = "Port :";
            this.lblPort.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // txtPort
            // 
            this.txtPort.Depth = 0;
            this.txtPort.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtPort.Hint = "";
            this.txtPort.Location = new System.Drawing.Point(78, 3);
            this.txtPort.MouseState = MaterialSkin.MouseState.HOVER;
            this.txtPort.Name = "txtPort";
            this.txtPort.PasswordChar = '\0';
            this.txtPort.SelectedText = "";
            this.txtPort.SelectionLength = 0;
            this.txtPort.SelectionStart = 0;
            this.txtPort.Size = new System.Drawing.Size(294, 23);
            this.txtPort.TabIndex = 2;
            this.txtPort.Text = "32000";
            this.txtPort.UseSystemPasswordChar = false;
            // 
            // txtMessages
            // 
            this.tableLayoutPanel1.SetColumnSpan(this.txtMessages, 2);
            this.txtMessages.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtMessages.Location = new System.Drawing.Point(78, 36);
            this.txtMessages.Name = "txtMessages";
            this.txtMessages.Size = new System.Drawing.Size(695, 289);
            this.txtMessages.TabIndex = 3;
            this.txtMessages.Text = "";
            // 
            // MainForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.tableLayoutPanel1);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Name = "MainForm";
            this.Text = "SDroidVX Controller Server";
            this.Shown += new System.EventHandler(this.MainForm_Shown);
            this.tableLayoutPanel1.ResumeLayout(false);
            this.tableLayoutPanel1.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.TableLayoutPanel tableLayoutPanel1;
        private MaterialSkin.Controls.MaterialFlatButton startBtn;
        private MaterialSkin.Controls.MaterialLabel lblPort;
        private MaterialSkin.Controls.MaterialSingleLineTextField txtPort;
        private System.Windows.Forms.RichTextBox txtMessages;
    }
}