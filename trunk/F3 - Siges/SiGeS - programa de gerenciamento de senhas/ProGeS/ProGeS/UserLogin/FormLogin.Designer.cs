namespace ProGeS
{
    partial class LOGIN
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(LOGIN));
            this.btnEntrar = new System.Windows.Forms.Button();
            this.grbLogin = new System.Windows.Forms.GroupBox();
            this.btnSair = new System.Windows.Forms.Button();
            this.lblDigite = new System.Windows.Forms.Label();
            this.llbCadastrar = new System.Windows.Forms.LinkLabel();
            this.llbLembrarSenha = new System.Windows.Forms.LinkLabel();
            this.txbUsuario = new System.Windows.Forms.TextBox();
            this.txbSenha = new System.Windows.Forms.TextBox();
            this.lblSenha = new System.Windows.Forms.Label();
            this.lblUsuario = new System.Windows.Forms.Label();
            this.colorDialog1 = new System.Windows.Forms.ColorDialog();
            this.grbLogin.SuspendLayout();
            this.SuspendLayout();
            // 
            // btnEntrar
            // 
            this.btnEntrar.Location = new System.Drawing.Point(57, 128);
            this.btnEntrar.Name = "btnEntrar";
            this.btnEntrar.Size = new System.Drawing.Size(75, 23);
            this.btnEntrar.TabIndex = 4;
            this.btnEntrar.Text = "Entrar";
            this.btnEntrar.UseVisualStyleBackColor = true;
            this.btnEntrar.Click += new System.EventHandler(this.Entrar_Click);
            // 
            // grbLogin
            // 
            this.grbLogin.Controls.Add(this.btnSair);
            this.grbLogin.Controls.Add(this.lblDigite);
            this.grbLogin.Controls.Add(this.llbCadastrar);
            this.grbLogin.Controls.Add(this.llbLembrarSenha);
            this.grbLogin.Controls.Add(this.btnEntrar);
            this.grbLogin.Controls.Add(this.txbUsuario);
            this.grbLogin.Controls.Add(this.txbSenha);
            this.grbLogin.Controls.Add(this.lblSenha);
            this.grbLogin.Controls.Add(this.lblUsuario);
            this.grbLogin.Location = new System.Drawing.Point(12, 2);
            this.grbLogin.Name = "grbLogin";
            this.grbLogin.Size = new System.Drawing.Size(283, 180);
            this.grbLogin.TabIndex = 2;
            this.grbLogin.TabStop = false;
            this.grbLogin.Text = "Login";
            this.grbLogin.Enter += new System.EventHandler(this.grbLogin_Enter);
            // 
            // btnSair
            // 
            this.btnSair.Location = new System.Drawing.Point(139, 128);
            this.btnSair.Name = "btnSair";
            this.btnSair.Size = new System.Drawing.Size(75, 23);
            this.btnSair.TabIndex = 5;
            this.btnSair.Text = "Sair";
            this.btnSair.UseVisualStyleBackColor = true;
            this.btnSair.Click += new System.EventHandler(this.btnSair_Click);
            // 
            // lblDigite
            // 
            this.lblDigite.AutoSize = true;
            this.lblDigite.Location = new System.Drawing.Point(25, 16);
            this.lblDigite.Name = "lblDigite";
            this.lblDigite.Size = new System.Drawing.Size(238, 13);
            this.lblDigite.TabIndex = 3;
            this.lblDigite.Text = "Digite seu usuário e senha para acessar o SiGeS";
            // 
            // llbCadastrar
            // 
            this.llbCadastrar.AutoSize = true;
            this.llbCadastrar.Location = new System.Drawing.Point(6, 164);
            this.llbCadastrar.Name = "llbCadastrar";
            this.llbCadastrar.Size = new System.Drawing.Size(52, 13);
            this.llbCadastrar.TabIndex = 6;
            this.llbCadastrar.TabStop = true;
            this.llbCadastrar.Text = "Cadastrar";
            this.llbCadastrar.LinkClicked += new System.Windows.Forms.LinkLabelLinkClickedEventHandler(this.llbCadastrar_LinkClicked);
            // 
            // llbLembrarSenha
            // 
            this.llbLembrarSenha.AutoSize = true;
            this.llbLembrarSenha.Location = new System.Drawing.Point(198, 164);
            this.llbLembrarSenha.Name = "llbLembrarSenha";
            this.llbLembrarSenha.Size = new System.Drawing.Size(79, 13);
            this.llbLembrarSenha.TabIndex = 7;
            this.llbLembrarSenha.TabStop = true;
            this.llbLembrarSenha.Text = "Lembrar Senha";
            this.llbLembrarSenha.LinkClicked += new System.Windows.Forms.LinkLabelLinkClickedEventHandler(this.llbLembrarSenha_LinkClicked);
            // 
            // txbUsuario
            // 
            this.txbUsuario.Location = new System.Drawing.Point(55, 57);
            this.txbUsuario.Name = "txbUsuario";
            this.txbUsuario.Size = new System.Drawing.Size(160, 20);
            this.txbUsuario.TabIndex = 2;
            // 
            // txbSenha
            // 
            this.txbSenha.Location = new System.Drawing.Point(55, 102);
            this.txbSenha.Name = "txbSenha";
            this.txbSenha.Size = new System.Drawing.Size(160, 20);
            this.txbSenha.TabIndex = 3;
            this.txbSenha.UseSystemPasswordChar = true;
            // 
            // lblSenha
            // 
            this.lblSenha.AutoSize = true;
            this.lblSenha.Image = global::ProGeS.Properties.Resources.key;
            this.lblSenha.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.lblSenha.Location = new System.Drawing.Point(54, 86);
            this.lblSenha.Name = "lblSenha";
            this.lblSenha.Size = new System.Drawing.Size(59, 13);
            this.lblSenha.TabIndex = 0;
            this.lblSenha.Text = "      Senha:";
            this.lblSenha.Click += new System.EventHandler(this.label2_Click);
            // 
            // lblUsuario
            // 
            this.lblUsuario.AutoSize = true;
            this.lblUsuario.Image = global::ProGeS.Properties.Resources.user;
            this.lblUsuario.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.lblUsuario.Location = new System.Drawing.Point(52, 41);
            this.lblUsuario.Name = "lblUsuario";
            this.lblUsuario.Size = new System.Drawing.Size(64, 13);
            this.lblUsuario.TabIndex = 0;
            this.lblUsuario.Text = "      Usuário:";
            // 
            // LOGIN
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(307, 194);
            this.ControlBox = false;
            this.Controls.Add(this.grbLogin);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Name = "LOGIN";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "SiGeS - Login";
            this.Load += new System.EventHandler(this.Form1_Load);
            this.grbLogin.ResumeLayout(false);
            this.grbLogin.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Button btnEntrar;
        private System.Windows.Forms.GroupBox grbLogin;
        private System.Windows.Forms.Label lblUsuario;
        private System.Windows.Forms.Label lblSenha;
        private System.Windows.Forms.LinkLabel llbCadastrar;
        private System.Windows.Forms.LinkLabel llbLembrarSenha;
        private System.Windows.Forms.TextBox txbUsuario;
        private System.Windows.Forms.TextBox txbSenha;
        private System.Windows.Forms.Label lblDigite;
        private System.Windows.Forms.Button btnSair;
        private System.Windows.Forms.ColorDialog colorDialog1;
    }
}

