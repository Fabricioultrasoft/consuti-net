namespace ProGeS
{
    partial class CADASTRO
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(CADASTRO));
            this.label1 = new System.Windows.Forms.Label();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.btnLimpar = new System.Windows.Forms.Button();
            this.btnSalvar = new System.Windows.Forms.Button();
            this.label7 = new System.Windows.Forms.Label();
            this.txbObs = new System.Windows.Forms.TextBox();
            this.txbSenha2 = new System.Windows.Forms.TextBox();
            this.txbSenhaPrinc = new System.Windows.Forms.TextBox();
            this.label3 = new System.Windows.Forms.Label();
            this.txbOrigem = new System.Windows.Forms.TextBox();
            this.groupBox2 = new System.Windows.Forms.GroupBox();
            this.groupBox4 = new System.Windows.Forms.GroupBox();
            this.rbMaster = new System.Windows.Forms.RadioButton();
            this.rbBasico = new System.Windows.Forms.RadioButton();
            this.rbGeral = new System.Windows.Forms.RadioButton();
            this.groupBox3 = new System.Windows.Forms.GroupBox();
            this.rbBasico2 = new System.Windows.Forms.RadioButton();
            this.rbMaster2 = new System.Windows.Forms.RadioButton();
            this.rbGeral2 = new System.Windows.Forms.RadioButton();
            this.txbRepSenha2 = new System.Windows.Forms.TextBox();
            this.label5 = new System.Windows.Forms.Label();
            this.txbRepSenhaPrinc = new System.Windows.Forms.TextBox();
            this.label6 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.usrCtrlMenuPrinc1 = new ProGeS.UsrCtrlMenuPrinc();
            this.groupBox1.SuspendLayout();
            this.groupBox2.SuspendLayout();
            this.groupBox4.SuspendLayout();
            this.groupBox3.SuspendLayout();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(21, 17);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(96, 13);
            this.label1.TabIndex = 0;
            this.label1.Text = "Origem da Senha:*";
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.btnLimpar);
            this.groupBox1.Controls.Add(this.btnSalvar);
            this.groupBox1.Controls.Add(this.label7);
            this.groupBox1.Controls.Add(this.txbObs);
            this.groupBox1.Controls.Add(this.txbSenha2);
            this.groupBox1.Controls.Add(this.txbSenhaPrinc);
            this.groupBox1.Controls.Add(this.label3);
            this.groupBox1.Controls.Add(this.txbOrigem);
            this.groupBox1.Controls.Add(this.label1);
            this.groupBox1.Controls.Add(this.groupBox2);
            this.groupBox1.Location = new System.Drawing.Point(12, 27);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(312, 431);
            this.groupBox1.TabIndex = 7;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Preencha os Campos Para Cadastrar";
            // 
            // btnLimpar
            // 
            this.btnLimpar.Location = new System.Drawing.Point(180, 402);
            this.btnLimpar.Name = "btnLimpar";
            this.btnLimpar.Size = new System.Drawing.Size(75, 23);
            this.btnLimpar.TabIndex = 14;
            this.btnLimpar.Text = "Limpar Tudo";
            this.btnLimpar.UseVisualStyleBackColor = true;
            this.btnLimpar.Click += new System.EventHandler(this.btnLimpar_Click);
            // 
            // btnSalvar
            // 
            this.btnSalvar.Location = new System.Drawing.Point(55, 402);
            this.btnSalvar.Name = "btnSalvar";
            this.btnSalvar.Size = new System.Drawing.Size(75, 23);
            this.btnSalvar.TabIndex = 13;
            this.btnSalvar.Text = "Salvar";
            this.btnSalvar.UseVisualStyleBackColor = true;
            this.btnSalvar.Click += new System.EventHandler(this.btnSalvar_Click);
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Location = new System.Drawing.Point(22, 55);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(73, 13);
            this.label7.TabIndex = 16;
            this.label7.Text = "Observações:";
            // 
            // txbObs
            // 
            this.txbObs.Location = new System.Drawing.Point(24, 68);
            this.txbObs.MaxLength = 100;
            this.txbObs.Multiline = true;
            this.txbObs.Name = "txbObs";
            this.txbObs.Size = new System.Drawing.Size(267, 47);
            this.txbObs.TabIndex = 2;
            // 
            // txbSenha2
            // 
            this.txbSenha2.Location = new System.Drawing.Point(36, 280);
            this.txbSenha2.MaxLength = 100;
            this.txbSenha2.Name = "txbSenha2";
            this.txbSenha2.Size = new System.Drawing.Size(242, 20);
            this.txbSenha2.TabIndex = 8;
            this.txbSenha2.UseSystemPasswordChar = true;
            // 
            // txbSenhaPrinc
            // 
            this.txbSenhaPrinc.Location = new System.Drawing.Point(36, 153);
            this.txbSenhaPrinc.MaxLength = 100;
            this.txbSenhaPrinc.Name = "txbSenhaPrinc";
            this.txbSenhaPrinc.Size = new System.Drawing.Size(242, 20);
            this.txbSenhaPrinc.TabIndex = 3;
            this.txbSenhaPrinc.UseSystemPasswordChar = true;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(33, 140);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(88, 13);
            this.label3.TabIndex = 4;
            this.label3.Text = "Senha Principal:*";
            // 
            // txbOrigem
            // 
            this.txbOrigem.Location = new System.Drawing.Point(24, 30);
            this.txbOrigem.MaxLength = 100;
            this.txbOrigem.Name = "txbOrigem";
            this.txbOrigem.Size = new System.Drawing.Size(267, 20);
            this.txbOrigem.TabIndex = 1;
            // 
            // groupBox2
            // 
            this.groupBox2.Controls.Add(this.groupBox4);
            this.groupBox2.Controls.Add(this.groupBox3);
            this.groupBox2.Controls.Add(this.txbRepSenha2);
            this.groupBox2.Controls.Add(this.label5);
            this.groupBox2.Controls.Add(this.txbRepSenhaPrinc);
            this.groupBox2.Controls.Add(this.label6);
            this.groupBox2.Controls.Add(this.label4);
            this.groupBox2.Location = new System.Drawing.Point(23, 121);
            this.groupBox2.Name = "groupBox2";
            this.groupBox2.Size = new System.Drawing.Size(268, 275);
            this.groupBox2.TabIndex = 14;
            this.groupBox2.TabStop = false;
            this.groupBox2.Text = "Senhas";
            // 
            // groupBox4
            // 
            this.groupBox4.Controls.Add(this.rbMaster);
            this.groupBox4.Controls.Add(this.rbBasico);
            this.groupBox4.Controls.Add(this.rbGeral);
            this.groupBox4.Location = new System.Drawing.Point(13, 98);
            this.groupBox4.Name = "groupBox4";
            this.groupBox4.Size = new System.Drawing.Size(242, 41);
            this.groupBox4.TabIndex = 21;
            this.groupBox4.TabStop = false;
            this.groupBox4.Text = "Nível de Acesso da Senha*";
            // 
            // rbMaster
            // 
            this.rbMaster.AutoSize = true;
            this.rbMaster.CausesValidation = false;
            this.rbMaster.Location = new System.Drawing.Point(13, 18);
            this.rbMaster.Name = "rbMaster";
            this.rbMaster.Size = new System.Drawing.Size(57, 17);
            this.rbMaster.TabIndex = 5;
            this.rbMaster.TabStop = true;
            this.rbMaster.Text = "Master";
            this.rbMaster.UseVisualStyleBackColor = true;
            // 
            // rbBasico
            // 
            this.rbBasico.AutoSize = true;
            this.rbBasico.Location = new System.Drawing.Point(182, 18);
            this.rbBasico.Name = "rbBasico";
            this.rbBasico.Size = new System.Drawing.Size(57, 17);
            this.rbBasico.TabIndex = 7;
            this.rbBasico.TabStop = true;
            this.rbBasico.Text = "Básico";
            this.rbBasico.UseVisualStyleBackColor = true;
            // 
            // rbGeral
            // 
            this.rbGeral.AutoSize = true;
            this.rbGeral.Location = new System.Drawing.Point(99, 18);
            this.rbGeral.Name = "rbGeral";
            this.rbGeral.Size = new System.Drawing.Size(50, 17);
            this.rbGeral.TabIndex = 6;
            this.rbGeral.TabStop = true;
            this.rbGeral.Text = "Geral";
            this.rbGeral.UseVisualStyleBackColor = true;
            // 
            // groupBox3
            // 
            this.groupBox3.Controls.Add(this.rbBasico2);
            this.groupBox3.Controls.Add(this.rbMaster2);
            this.groupBox3.Controls.Add(this.rbGeral2);
            this.groupBox3.Location = new System.Drawing.Point(13, 227);
            this.groupBox3.Name = "groupBox3";
            this.groupBox3.Size = new System.Drawing.Size(242, 41);
            this.groupBox3.TabIndex = 20;
            this.groupBox3.TabStop = false;
            this.groupBox3.Text = "Nível de Acesso da Senha";
            // 
            // rbBasico2
            // 
            this.rbBasico2.AutoSize = true;
            this.rbBasico2.Location = new System.Drawing.Point(179, 18);
            this.rbBasico2.Name = "rbBasico2";
            this.rbBasico2.Size = new System.Drawing.Size(57, 17);
            this.rbBasico2.TabIndex = 12;
            this.rbBasico2.Text = "Básico";
            this.rbBasico2.UseVisualStyleBackColor = true;
            // 
            // rbMaster2
            // 
            this.rbMaster2.AutoSize = true;
            this.rbMaster2.Location = new System.Drawing.Point(9, 18);
            this.rbMaster2.Name = "rbMaster2";
            this.rbMaster2.Size = new System.Drawing.Size(57, 17);
            this.rbMaster2.TabIndex = 10;
            this.rbMaster2.Text = "Master";
            this.rbMaster2.UseVisualStyleBackColor = true;
            // 
            // rbGeral2
            // 
            this.rbGeral2.AutoSize = true;
            this.rbGeral2.Location = new System.Drawing.Point(96, 18);
            this.rbGeral2.Name = "rbGeral2";
            this.rbGeral2.Size = new System.Drawing.Size(50, 17);
            this.rbGeral2.TabIndex = 11;
            this.rbGeral2.Text = "Geral";
            this.rbGeral2.UseVisualStyleBackColor = true;
            // 
            // txbRepSenha2
            // 
            this.txbRepSenha2.Location = new System.Drawing.Point(13, 200);
            this.txbRepSenha2.MaxLength = 100;
            this.txbRepSenha2.Name = "txbRepSenha2";
            this.txbRepSenha2.Size = new System.Drawing.Size(242, 20);
            this.txbRepSenha2.TabIndex = 9;
            this.txbRepSenha2.UseSystemPasswordChar = true;
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(10, 187);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(90, 13);
            this.label5.TabIndex = 15;
            this.label5.Text = "Repita a Senha2:";
            // 
            // txbRepSenhaPrinc
            // 
            this.txbRepSenhaPrinc.Location = new System.Drawing.Point(13, 72);
            this.txbRepSenhaPrinc.MaxLength = 100;
            this.txbRepSenhaPrinc.Name = "txbRepSenhaPrinc";
            this.txbRepSenhaPrinc.Size = new System.Drawing.Size(242, 20);
            this.txbRepSenhaPrinc.TabIndex = 4;
            this.txbRepSenhaPrinc.UseSystemPasswordChar = true;
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(10, 59);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(88, 13);
            this.label6.TabIndex = 13;
            this.label6.Text = "Repita a Senha:*";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(10, 146);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(47, 13);
            this.label4.TabIndex = 6;
            this.label4.Text = "Senha2:";
            // 
            // usrCtrlMenuPrinc1
            // 
            this.usrCtrlMenuPrinc1.Location = new System.Drawing.Point(0, 0);
            this.usrCtrlMenuPrinc1.Name = "usrCtrlMenuPrinc1";
            this.usrCtrlMenuPrinc1.Size = new System.Drawing.Size(336, 24);
            this.usrCtrlMenuPrinc1.TabIndex = 8;
            // 
            // CADASTRO
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(336, 470);
            this.Controls.Add(this.usrCtrlMenuPrinc1);
            this.Controls.Add(this.groupBox1);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Name = "CADASTRO";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "SiGeS - Cadastro";
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            this.groupBox2.ResumeLayout(false);
            this.groupBox2.PerformLayout();
            this.groupBox4.ResumeLayout(false);
            this.groupBox4.PerformLayout();
            this.groupBox3.ResumeLayout(false);
            this.groupBox3.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.TextBox txbSenhaPrinc;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.TextBox txbOrigem;
        private System.Windows.Forms.TextBox txbSenha2;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.GroupBox groupBox2;
        private System.Windows.Forms.TextBox txbRepSenhaPrinc;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.TextBox txbRepSenha2;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.RadioButton rbBasico2;
        private System.Windows.Forms.RadioButton rbBasico;
        private System.Windows.Forms.RadioButton rbMaster2;
        private System.Windows.Forms.RadioButton rbGeral2;
        private System.Windows.Forms.RadioButton rbGeral;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.TextBox txbObs;
        private System.Windows.Forms.Button btnLimpar;
        private System.Windows.Forms.Button btnSalvar;
        private System.Windows.Forms.GroupBox groupBox3;
        private System.Windows.Forms.GroupBox groupBox4;
        private UsrCtrlMenuPrinc usrCtrlMenuPrinc1;
        private System.Windows.Forms.RadioButton rbMaster;
    }
}