namespace ProGeS
{
    partial class CADLOGIN
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(CADLOGIN));
            this.grbLogin = new System.Windows.Forms.GroupBox();
            this.button1 = new System.Windows.Forms.Button();
            this.button2 = new System.Windows.Forms.Button();
            this.label2 = new System.Windows.Forms.Label();
            this.txbDicaSenhaCad = new System.Windows.Forms.TextBox();
            this.txbSenhaCad = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.lblDigite = new System.Windows.Forms.Label();
            this.Entrar = new System.Windows.Forms.Button();
            this.txbUsuarioCad = new System.Windows.Forms.TextBox();
            this.txbRepSenhaCad = new System.Windows.Forms.TextBox();
            this.lblSenha = new System.Windows.Forms.Label();
            this.lblUsuario = new System.Windows.Forms.Label();
            this.grbLogin.SuspendLayout();
            this.SuspendLayout();
            // 
            // grbLogin
            // 
            this.grbLogin.Controls.Add(this.button1);
            this.grbLogin.Controls.Add(this.button2);
            this.grbLogin.Controls.Add(this.label2);
            this.grbLogin.Controls.Add(this.txbDicaSenhaCad);
            this.grbLogin.Controls.Add(this.txbSenhaCad);
            this.grbLogin.Controls.Add(this.label1);
            this.grbLogin.Controls.Add(this.lblDigite);
            this.grbLogin.Controls.Add(this.Entrar);
            this.grbLogin.Controls.Add(this.txbUsuarioCad);
            this.grbLogin.Controls.Add(this.txbRepSenhaCad);
            this.grbLogin.Controls.Add(this.lblSenha);
            this.grbLogin.Controls.Add(this.lblUsuario);
            this.grbLogin.Location = new System.Drawing.Point(12, 3);
            this.grbLogin.Name = "grbLogin";
            this.grbLogin.Size = new System.Drawing.Size(283, 251);
            this.grbLogin.TabIndex = 3;
            this.grbLogin.TabStop = false;
            this.grbLogin.Text = "Cadastro de Login";
            // 
            // button1
            // 
            this.button1.Location = new System.Drawing.Point(15, 219);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(75, 23);
            this.button1.TabIndex = 6;
            this.button1.Text = "Sair";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.button1_Click);
            // 
            // button2
            // 
            this.button2.Location = new System.Drawing.Point(103, 219);
            this.button2.Name = "button2";
            this.button2.Size = new System.Drawing.Size(75, 23);
            this.button2.TabIndex = 7;
            this.button2.Text = "Limpar";
            this.button2.UseVisualStyleBackColor = true;
            this.button2.Click += new System.EventHandler(this.button2_Click);
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Image = global::ProGeS.Properties.Resources.key;
            this.label2.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.label2.Location = new System.Drawing.Point(60, 166);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(99, 13);
            this.label2.TabIndex = 11;
            this.label2.Text = "      Dica de Senha:";
            // 
            // txbDicaSenhaCad
            // 
            this.txbDicaSenhaCad.Location = new System.Drawing.Point(58, 183);
            this.txbDicaSenhaCad.Name = "txbDicaSenhaCad";
            this.txbDicaSenhaCad.Size = new System.Drawing.Size(160, 20);
            this.txbDicaSenhaCad.TabIndex = 5;
            // 
            // txbSenhaCad
            // 
            this.txbSenhaCad.Location = new System.Drawing.Point(58, 97);
            this.txbSenhaCad.Name = "txbSenhaCad";
            this.txbSenhaCad.Size = new System.Drawing.Size(160, 20);
            this.txbSenhaCad.TabIndex = 3;
            this.txbSenhaCad.UseSystemPasswordChar = true;
            this.txbSenhaCad.TextChanged += new System.EventHandler(this.txbSenhaCad_TextChanged);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Image = global::ProGeS.Properties.Resources.key;
            this.label1.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.label1.Location = new System.Drawing.Point(57, 80);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(59, 13);
            this.label1.TabIndex = 4;
            this.label1.Text = "      Senha:";
            // 
            // lblDigite
            // 
            this.lblDigite.AutoSize = true;
            this.lblDigite.Location = new System.Drawing.Point(48, 16);
            this.lblDigite.Name = "lblDigite";
            this.lblDigite.Size = new System.Drawing.Size(175, 13);
            this.lblDigite.TabIndex = 3;
            this.lblDigite.Text = "Preencha os campos para cadastro";
            // 
            // Entrar
            // 
            this.Entrar.Location = new System.Drawing.Point(193, 219);
            this.Entrar.Name = "Entrar";
            this.Entrar.Size = new System.Drawing.Size(75, 23);
            this.Entrar.TabIndex = 8;
            this.Entrar.Text = "Cadastrar";
            this.Entrar.UseVisualStyleBackColor = true;
            this.Entrar.Click += new System.EventHandler(this.Entrar_Click);
            // 
            // txbUsuarioCad
            // 
            this.txbUsuarioCad.Location = new System.Drawing.Point(58, 53);
            this.txbUsuarioCad.Name = "txbUsuarioCad";
            this.txbUsuarioCad.Size = new System.Drawing.Size(160, 20);
            this.txbUsuarioCad.TabIndex = 2;
            // 
            // txbRepSenhaCad
            // 
            this.txbRepSenhaCad.Location = new System.Drawing.Point(58, 140);
            this.txbRepSenhaCad.Name = "txbRepSenhaCad";
            this.txbRepSenhaCad.Size = new System.Drawing.Size(160, 20);
            this.txbRepSenhaCad.TabIndex = 4;
            this.txbRepSenhaCad.UseSystemPasswordChar = true;
            this.txbRepSenhaCad.TextChanged += new System.EventHandler(this.txbSenha_TextChanged);
            // 
            // lblSenha
            // 
            this.lblSenha.AutoSize = true;
            this.lblSenha.Image = global::ProGeS.Properties.Resources.key;
            this.lblSenha.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.lblSenha.Location = new System.Drawing.Point(57, 123);
            this.lblSenha.Name = "lblSenha";
            this.lblSenha.Size = new System.Drawing.Size(102, 13);
            this.lblSenha.TabIndex = 0;
            this.lblSenha.Text = "      Repita a Senha:";
            // 
            // lblUsuario
            // 
            this.lblUsuario.AutoSize = true;
            this.lblUsuario.Image = global::ProGeS.Properties.Resources.user;
            this.lblUsuario.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.lblUsuario.Location = new System.Drawing.Point(55, 35);
            this.lblUsuario.Name = "lblUsuario";
            this.lblUsuario.Size = new System.Drawing.Size(64, 13);
            this.lblUsuario.TabIndex = 0;
            this.lblUsuario.Text = "      Usuário:";
            // 
            // CADLOGIN
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(307, 266);
            this.ControlBox = false;
            this.Controls.Add(this.grbLogin);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Name = "CADLOGIN";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "SiGeS - Cadastro Login";
            this.grbLogin.ResumeLayout(false);
            this.grbLogin.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.GroupBox grbLogin;
        private System.Windows.Forms.Label lblDigite;
        private System.Windows.Forms.Button Entrar;
        private System.Windows.Forms.TextBox txbUsuarioCad;
        private System.Windows.Forms.TextBox txbRepSenhaCad;
        private System.Windows.Forms.Label lblSenha;
        private System.Windows.Forms.Label lblUsuario;
        private System.Windows.Forms.TextBox txbSenhaCad;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.TextBox txbDicaSenhaCad;
        private System.Windows.Forms.Button button2;
        private System.Windows.Forms.Button button1;
    }
}