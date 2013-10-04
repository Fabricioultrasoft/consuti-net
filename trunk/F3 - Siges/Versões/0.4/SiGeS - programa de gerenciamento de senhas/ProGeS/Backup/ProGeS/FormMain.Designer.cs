namespace ProGeS
{
    partial class MAIN
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(MAIN));
            this.grbConteudo = new System.Windows.Forms.GroupBox();
            this.pbFind = new System.Windows.Forms.PictureBox();
            this.llPesquisar = new System.Windows.Forms.LinkLabel();
            this.pbAdd = new System.Windows.Forms.PictureBox();
            this.llAdd = new System.Windows.Forms.LinkLabel();
            this.label2 = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.usrCtrlMenuPrinc1 = new ProGeS.UsrCtrlMenuPrinc();
            this.grbConteudo.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pbFind)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.pbAdd)).BeginInit();
            this.SuspendLayout();
            // 
            // grbConteudo
            // 
            this.grbConteudo.Controls.Add(this.pbFind);
            this.grbConteudo.Controls.Add(this.llPesquisar);
            this.grbConteudo.Controls.Add(this.pbAdd);
            this.grbConteudo.Controls.Add(this.llAdd);
            this.grbConteudo.Controls.Add(this.label2);
            this.grbConteudo.Controls.Add(this.label1);
            this.grbConteudo.Location = new System.Drawing.Point(10, 23);
            this.grbConteudo.Name = "grbConteudo";
            this.grbConteudo.Size = new System.Drawing.Size(314, 155);
            this.grbConteudo.TabIndex = 4;
            this.grbConteudo.TabStop = false;
            // 
            // pbFind
            // 
            this.pbFind.Cursor = System.Windows.Forms.Cursors.Hand;
            this.pbFind.Image = global::ProGeS.Properties.Resources.find_64x64;
            this.pbFind.Location = new System.Drawing.Point(182, 57);
            this.pbFind.Name = "pbFind";
            this.pbFind.Size = new System.Drawing.Size(64, 64);
            this.pbFind.SizeMode = System.Windows.Forms.PictureBoxSizeMode.AutoSize;
            this.pbFind.TabIndex = 5;
            this.pbFind.TabStop = false;
            this.pbFind.Click += new System.EventHandler(this.pbFind_Click);
            // 
            // llPesquisar
            // 
            this.llPesquisar.AutoSize = true;
            this.llPesquisar.Location = new System.Drawing.Point(188, 126);
            this.llPesquisar.Name = "llPesquisar";
            this.llPesquisar.Size = new System.Drawing.Size(53, 13);
            this.llPesquisar.TabIndex = 4;
            this.llPesquisar.TabStop = true;
            this.llPesquisar.Text = "Pesquisar";
            this.llPesquisar.LinkClicked += new System.Windows.Forms.LinkLabelLinkClickedEventHandler(this.llPesquisar_LinkClicked);
            // 
            // pbAdd
            // 
            this.pbAdd.Cursor = System.Windows.Forms.Cursors.Hand;
            this.pbAdd.Image = global::ProGeS.Properties.Resources.add_64x64;
            this.pbAdd.Location = new System.Drawing.Point(66, 57);
            this.pbAdd.Name = "pbAdd";
            this.pbAdd.Size = new System.Drawing.Size(64, 64);
            this.pbAdd.SizeMode = System.Windows.Forms.PictureBoxSizeMode.AutoSize;
            this.pbAdd.TabIndex = 3;
            this.pbAdd.TabStop = false;
            this.pbAdd.Click += new System.EventHandler(this.pbAdd_Click);
            // 
            // llAdd
            // 
            this.llAdd.AutoSize = true;
            this.llAdd.Location = new System.Drawing.Point(73, 126);
            this.llAdd.Name = "llAdd";
            this.llAdd.Size = new System.Drawing.Size(51, 13);
            this.llAdd.TabIndex = 2;
            this.llAdd.TabStop = true;
            this.llAdd.Text = "Adicionar";
            this.llAdd.LinkClicked += new System.Windows.Forms.LinkLabelLinkClickedEventHandler(this.llAdd_LinkClicked);
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(43, 37);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(227, 13);
            this.label2.TabIndex = 1;
            this.label2.Text = "Sistema de Gerenciamento de Senhas [SiGeS]";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(116, 15);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(85, 13);
            this.label1.TabIndex = 0;
            this.label1.Text = "Seja Bem Vindo!";
            // 
            // usrCtrlMenuPrinc1
            // 
            this.usrCtrlMenuPrinc1.Location = new System.Drawing.Point(0, 0);
            this.usrCtrlMenuPrinc1.Name = "usrCtrlMenuPrinc1";
            this.usrCtrlMenuPrinc1.Size = new System.Drawing.Size(336, 24);
            this.usrCtrlMenuPrinc1.TabIndex = 6;
            // 
            // MAIN
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(336, 190);
            this.ControlBox = false;
            this.Controls.Add(this.usrCtrlMenuPrinc1);
            this.Controls.Add(this.grbConteudo);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Name = "MAIN";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "SiGeS - Menu Principal";
            this.grbConteudo.ResumeLayout(false);
            this.grbConteudo.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pbFind)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.pbAdd)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.GroupBox grbConteudo;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.PictureBox pbFind;
        private System.Windows.Forms.LinkLabel llPesquisar;
        private System.Windows.Forms.PictureBox pbAdd;
        private System.Windows.Forms.LinkLabel llAdd;
        private UsrCtrlMenuPrinc usrCtrlMenuPrinc1;
    }
}