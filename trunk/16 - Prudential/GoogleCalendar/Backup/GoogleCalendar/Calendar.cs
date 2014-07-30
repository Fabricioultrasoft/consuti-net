using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using System.Windows.Forms;
using Google.GData.Client;
using Google.GData.Extensions;
using Google.GData.Calendar;
using System.Net;

namespace SampleApp
{
    /// <summary>
    /// Summary description for Calendar.
    /// </summary>
    public class Calendar : System.Windows.Forms.Form
    {
        private CalendarService service = new CalendarService("My Google Calendar Service");
        private System.Windows.Forms.TextBox CalendarURI;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.TextBox UserName;
        private System.Windows.Forms.TextBox Password;
        private System.Windows.Forms.Button Go;
        private System.Windows.Forms.MonthCalendar calendarControl;
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.Container components = null;
        private System.Windows.Forms.ListView DayEvents;
        private System.Windows.Forms.ColumnHeader columnHeader1;
        private System.Windows.Forms.ColumnHeader columnHeader2;
        private System.Windows.Forms.ColumnHeader columnHeader3;
        private System.Windows.Forms.ColumnHeader columnHeader4;
        private Label label4;
        private ComboBox cmbGoogleCalendar;
        private Label label5;
        private Label label6;
        private Button btnRetrieveCalendars;
        private TextBox ProxyAddress;
        private TextBox ProxyPort;
        private Button btnCreateNewEvent;
        private CheckBox chkCreateNewEvent;
        private GroupBox grpNewEvent;
        private DateTimePicker calStartDate;
        private Label label8;
        private TextBox EventName;
        private Label label7;
        private ComboBox cmbStartTime;
        private Label label11;
        private ComboBox GoogleCalendar;
        private TextBox location;
        private Label label10;
        private ComboBox cmbEndTime;
        private DateTimePicker CalEndDate;
        private Label label9;
        private TextBox Description;
        private Label label12;


        private ArrayList entryList;
        private string userName = "";
        private CheckBox chkIsPRoxyRequired;
        private string passWord = "";
        public Calendar()
        {
            //
            // Required for Windows Form Designer support
            //
            InitializeComponent();
            MessageBox.Show("Please perform the following tasks inorder to retrieve information from Google Calendar" + "\n" + "1) Select the date range from the calendar." + "\n" + "1) Enter your Gmail Credentials." + "\n" + "1) Enter Proxy if required.");
            //
            // TODO: Add any constructor code after InitializeComponent call
            //
            this.entryList = new ArrayList();
            grpNewEvent.Enabled=false ;
            chkIsPRoxyRequired.Checked = true;
        }

        /// <summary>
        /// The main entry point for the application.
        /// </summary>
        [STAThread]
        static void Main() 
        {
            Application.Run(new Calendar());
        }

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        protected override void Dispose( bool disposing )
        {
            if (disposing)
            {
                if (components != null)
                {
                    components.Dispose();
                }
            }
            base.Dispose( disposing );
        }

#region Windows Form Designer generated code
        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.calendarControl = new System.Windows.Forms.MonthCalendar();
            this.CalendarURI = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.UserName = new System.Windows.Forms.TextBox();
            this.Password = new System.Windows.Forms.TextBox();
            this.Go = new System.Windows.Forms.Button();
            this.DayEvents = new System.Windows.Forms.ListView();
            this.columnHeader1 = new System.Windows.Forms.ColumnHeader();
            this.columnHeader2 = new System.Windows.Forms.ColumnHeader();
            this.columnHeader3 = new System.Windows.Forms.ColumnHeader();
            this.columnHeader4 = new System.Windows.Forms.ColumnHeader();
            this.cmbGoogleCalendar = new System.Windows.Forms.ComboBox();
            this.label4 = new System.Windows.Forms.Label();
            this.ProxyAddress = new System.Windows.Forms.TextBox();
            this.label5 = new System.Windows.Forms.Label();
            this.ProxyPort = new System.Windows.Forms.TextBox();
            this.label6 = new System.Windows.Forms.Label();
            this.btnRetrieveCalendars = new System.Windows.Forms.Button();
            this.btnCreateNewEvent = new System.Windows.Forms.Button();
            this.chkCreateNewEvent = new System.Windows.Forms.CheckBox();
            this.grpNewEvent = new System.Windows.Forms.GroupBox();
            this.Description = new System.Windows.Forms.TextBox();
            this.label12 = new System.Windows.Forms.Label();
            this.label11 = new System.Windows.Forms.Label();
            this.GoogleCalendar = new System.Windows.Forms.ComboBox();
            this.location = new System.Windows.Forms.TextBox();
            this.label10 = new System.Windows.Forms.Label();
            this.cmbEndTime = new System.Windows.Forms.ComboBox();
            this.CalEndDate = new System.Windows.Forms.DateTimePicker();
            this.label9 = new System.Windows.Forms.Label();
            this.cmbStartTime = new System.Windows.Forms.ComboBox();
            this.calStartDate = new System.Windows.Forms.DateTimePicker();
            this.label8 = new System.Windows.Forms.Label();
            this.EventName = new System.Windows.Forms.TextBox();
            this.label7 = new System.Windows.Forms.Label();
            this.chkIsPRoxyRequired = new System.Windows.Forms.CheckBox();
            this.grpNewEvent.SuspendLayout();
            this.SuspendLayout();
            // 
            // calendarControl
            // 
            this.calendarControl.Location = new System.Drawing.Point(0, 8);
            this.calendarControl.Name = "calendarControl";
            this.calendarControl.ShowTodayCircle = false;
            this.calendarControl.TabIndex = 0;
            this.calendarControl.DateSelected += new System.Windows.Forms.DateRangeEventHandler(this.calendarControl_DateSelected);
            // 
            // CalendarURI
            // 
            this.CalendarURI.Enabled = false;
            this.CalendarURI.Location = new System.Drawing.Point(298, 32);
            this.CalendarURI.Name = "CalendarURI";
            this.CalendarURI.Size = new System.Drawing.Size(491, 20);
            this.CalendarURI.TabIndex = 1;
            this.CalendarURI.Text = "http://www.google.com/calendar/feeds/default/private/full";
            // 
            // label1
            // 
            this.label1.Location = new System.Drawing.Point(200, 32);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(64, 16);
            this.label1.TabIndex = 2;
            this.label1.Text = "URL:";
            // 
            // label2
            // 
            this.label2.Location = new System.Drawing.Point(200, 68);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(64, 24);
            this.label2.TabIndex = 3;
            this.label2.Text = "User:";
            // 
            // label3
            // 
            this.label3.Location = new System.Drawing.Point(200, 112);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(64, 16);
            this.label3.TabIndex = 4;
            this.label3.Text = "Password";
            // 
            // UserName
            // 
            this.UserName.Location = new System.Drawing.Point(298, 68);
            this.UserName.Name = "UserName";
            this.UserName.Size = new System.Drawing.Size(296, 20);
            this.UserName.TabIndex = 5;
            this.UserName.Text = "";
            // 
            // Password
            // 
            this.Password.Location = new System.Drawing.Point(298, 104);
            this.Password.Name = "Password";
            this.Password.PasswordChar = '*';
            this.Password.Size = new System.Drawing.Size(296, 20);
            this.Password.TabIndex = 6;
            this.Password.Text = "";
            // 
            // Go
            // 
            this.Go.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.Go.Location = new System.Drawing.Point(442, 353);
            this.Go.Name = "Go";
            this.Go.Size = new System.Drawing.Size(96, 24);
            this.Go.TabIndex = 7;
            this.Go.Text = "&Retieve Events";
            this.Go.Click += new System.EventHandler(this.Go_Click);
            // 
            // DayEvents
            // 
            this.DayEvents.Columns.AddRange(new System.Windows.Forms.ColumnHeader[] {
            this.columnHeader1,
            this.columnHeader2,
            this.columnHeader3,
            this.columnHeader4});
            this.DayEvents.FullRowSelect = true;
            this.DayEvents.GridLines = true;
            this.DayEvents.HeaderStyle = System.Windows.Forms.ColumnHeaderStyle.Nonclickable;
            this.DayEvents.LabelWrap = false;
            this.DayEvents.Location = new System.Drawing.Point(12, 289);
            this.DayEvents.Name = "DayEvents";
            this.DayEvents.Size = new System.Drawing.Size(424, 88);
            this.DayEvents.TabIndex = 8;
            this.DayEvents.UseCompatibleStateImageBehavior = false;
            this.DayEvents.View = System.Windows.Forms.View.Details;
            // 
            // columnHeader1
            // 
            this.columnHeader1.Text = "Event";
            this.columnHeader1.Width = 184;
            // 
            // columnHeader2
            // 
            this.columnHeader2.Text = "Author";
            this.columnHeader2.Width = 100;
            // 
            // columnHeader3
            // 
            this.columnHeader3.Text = "Start";
            // 
            // columnHeader4
            // 
            this.columnHeader4.Text = "End";
            // 
            // cmbGoogleCalendar
            // 
            this.cmbGoogleCalendar.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbGoogleCalendar.FormattingEnabled = true;
            this.cmbGoogleCalendar.Location = new System.Drawing.Point(298, 238);
            this.cmbGoogleCalendar.Name = "cmbGoogleCalendar";
            this.cmbGoogleCalendar.Size = new System.Drawing.Size(300, 21);
            this.cmbGoogleCalendar.TabIndex = 9;
            // 
            // label4
            // 
            this.label4.Location = new System.Drawing.Point(200, 241);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(95, 19);
            this.label4.TabIndex = 10;
            this.label4.Text = "Google Calendar";
            // 
            // ProxyAddress
            // 
            this.ProxyAddress.Location = new System.Drawing.Point(298, 166);
            this.ProxyAddress.Name = "ProxyAddress";
            this.ProxyAddress.Size = new System.Drawing.Size(296, 20);
            this.ProxyAddress.TabIndex = 12;
            this.ProxyAddress.Text = "";
            // 
            // label5
            // 
            this.label5.Location = new System.Drawing.Point(200, 166);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(95, 24);
            this.label5.TabIndex = 11;
            this.label5.Text = "Proxy IpAddress:";
            // 
            // ProxyPort
            // 
            this.ProxyPort.Location = new System.Drawing.Point(296, 203);
            this.ProxyPort.Name = "ProxyPort";
            this.ProxyPort.Size = new System.Drawing.Size(296, 20);
            this.ProxyPort.TabIndex = 14;
            this.ProxyPort.Text = "";
            // 
            // label6
            // 
            this.label6.Location = new System.Drawing.Point(198, 203);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(95, 24);
            this.label6.TabIndex = 13;
            this.label6.Text = "Proxy Port:";
            // 
            // btnRetrieveCalendars
            // 
            this.btnRetrieveCalendars.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnRetrieveCalendars.Location = new System.Drawing.Point(604, 237);
            this.btnRetrieveCalendars.Name = "btnRetrieveCalendars";
            this.btnRetrieveCalendars.Size = new System.Drawing.Size(146, 24);
            this.btnRetrieveCalendars.TabIndex = 15;
            this.btnRetrieveCalendars.Text = "&Retrieve Calendars";
            this.btnRetrieveCalendars.Click += new System.EventHandler(this.btnRetrieveCalendars_Click);
            // 
            // btnCreateNewEvent
            // 
            this.btnCreateNewEvent.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnCreateNewEvent.Location = new System.Drawing.Point(6, 180);
            this.btnCreateNewEvent.Name = "btnCreateNewEvent";
            this.btnCreateNewEvent.Size = new System.Drawing.Size(146, 24);
            this.btnCreateNewEvent.TabIndex = 16;
            this.btnCreateNewEvent.Text = "&Create New Event";
            this.btnCreateNewEvent.Click += new System.EventHandler(this.btnCreateNewEvent_Click);
            // 
            // chkCreateNewEvent
            // 
            this.chkCreateNewEvent.AutoSize = true;
            this.chkCreateNewEvent.Location = new System.Drawing.Point(12, 383);
            this.chkCreateNewEvent.Name = "chkCreateNewEvent";
            this.chkCreateNewEvent.Size = new System.Drawing.Size(113, 17);
            this.chkCreateNewEvent.TabIndex = 17;
            this.chkCreateNewEvent.Text = "Create New Event";
            this.chkCreateNewEvent.UseVisualStyleBackColor = true;
            this.chkCreateNewEvent.CheckedChanged += new System.EventHandler(this.chkCreateNewEvent_CheckedChanged);
            // 
            // grpNewEvent
            // 
            this.grpNewEvent.Controls.Add(this.Description);
            this.grpNewEvent.Controls.Add(this.label12);
            this.grpNewEvent.Controls.Add(this.label11);
            this.grpNewEvent.Controls.Add(this.GoogleCalendar);
            this.grpNewEvent.Controls.Add(this.location);
            this.grpNewEvent.Controls.Add(this.label10);
            this.grpNewEvent.Controls.Add(this.cmbEndTime);
            this.grpNewEvent.Controls.Add(this.CalEndDate);
            this.grpNewEvent.Controls.Add(this.label9);
            this.grpNewEvent.Controls.Add(this.cmbStartTime);
            this.grpNewEvent.Controls.Add(this.calStartDate);
            this.grpNewEvent.Controls.Add(this.label8);
            this.grpNewEvent.Controls.Add(this.EventName);
            this.grpNewEvent.Controls.Add(this.label7);
            this.grpNewEvent.Controls.Add(this.btnCreateNewEvent);
            this.grpNewEvent.Location = new System.Drawing.Point(12, 406);
            this.grpNewEvent.Name = "grpNewEvent";
            this.grpNewEvent.Size = new System.Drawing.Size(833, 207);
            this.grpNewEvent.TabIndex = 18;
            this.grpNewEvent.TabStop = false;
            this.grpNewEvent.Text = "Create New Event";
            // 
            // Description
            // 
            this.Description.Location = new System.Drawing.Point(106, 130);
            this.Description.Multiline = true;
            this.Description.Name = "Description";
            this.Description.Size = new System.Drawing.Size(687, 44);
            this.Description.TabIndex = 30;
            // 
            // label12
            // 
            this.label12.Location = new System.Drawing.Point(8, 130);
            this.label12.Name = "label12";
            this.label12.Size = new System.Drawing.Size(95, 24);
            this.label12.TabIndex = 29;
            this.label12.Text = "Description:";
            // 
            // label11
            // 
            this.label11.Location = new System.Drawing.Point(8, 95);
            this.label11.Name = "label11";
            this.label11.Size = new System.Drawing.Size(95, 19);
            this.label11.TabIndex = 28;
            this.label11.Text = "Calendar";
            this.label11.Click += new System.EventHandler(this.label11_Click);
            // 
            // GoogleCalendar
            // 
            this.GoogleCalendar.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.GoogleCalendar.FormattingEnabled = true;
            this.GoogleCalendar.Location = new System.Drawing.Point(106, 92);
            this.GoogleCalendar.Name = "GoogleCalendar";
            this.GoogleCalendar.Size = new System.Drawing.Size(300, 21);
            this.GoogleCalendar.TabIndex = 27;
            this.GoogleCalendar.SelectedIndexChanged += new System.EventHandler(this.comboBox1_SelectedIndexChanged);
            // 
            // location
            // 
            this.location.Location = new System.Drawing.Point(104, 67);
            this.location.Name = "location";
            this.location.Size = new System.Drawing.Size(296, 20);
            this.location.TabIndex = 26;
            // 
            // label10
            // 
            this.label10.Location = new System.Drawing.Point(6, 67);
            this.label10.Name = "label10";
            this.label10.Size = new System.Drawing.Size(95, 24);
            this.label10.TabIndex = 25;
            this.label10.Text = "Where:";
            // 
            // cmbEndTime
            // 
            this.cmbEndTime.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbEndTime.FormattingEnabled = true;
            this.cmbEndTime.Items.AddRange(new object[] {
            "00:00",
            "00:30",
            "01:00",
            "01:30",
            "02:00",
            "02:30",
            "03:00",
            "03:30",
            "04:00",
            "04:30",
            "05:00",
            "05:30",
            "06:00",
            "06:30",
            "07:00",
            "07:30",
            "08:00",
            "08:30",
            "09:00",
            "09:30",
            "10:00",
            "10:30",
            "11:00",
            "11:30",
            "12:00",
            "12:30",
            "13:00",
            "13:30",
            "14:00",
            "14:30",
            "15:00",
            "15:30",
            "16:00",
            "16:30",
            "17:00",
            "17:30",
            "18:00",
            "18:30",
            "19:00",
            "19:30",
            "20:00",
            "20:30",
            "21:00",
            "21:30",
            "22:00",
            "22:30",
            "23:00",
            "23:30"});
            this.cmbEndTime.Location = new System.Drawing.Point(636, 41);
            this.cmbEndTime.Name = "cmbEndTime";
            this.cmbEndTime.Size = new System.Drawing.Size(74, 21);
            this.cmbEndTime.TabIndex = 24;
            // 
            // CalEndDate
            // 
            this.CalEndDate.Location = new System.Drawing.Point(430, 41);
            this.CalEndDate.Name = "CalEndDate";
            this.CalEndDate.Size = new System.Drawing.Size(200, 20);
            this.CalEndDate.TabIndex = 23;
            // 
            // label9
            // 
            this.label9.Location = new System.Drawing.Point(402, 45);
            this.label9.Name = "label9";
            this.label9.Size = new System.Drawing.Size(41, 24);
            this.label9.TabIndex = 22;
            this.label9.Text = "to";
            // 
            // cmbStartTime
            // 
            this.cmbStartTime.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbStartTime.FormattingEnabled = true;
            this.cmbStartTime.Items.AddRange(new object[] {
            "00:00",
            "00:30",
            "01:00",
            "01:30",
            "02:00",
            "02:30",
            "03:00",
            "03:30",
            "04:00",
            "04:30",
            "05:00",
            "05:30",
            "06:00",
            "06:30",
            "07:00",
            "07:30",
            "08:00",
            "08:30",
            "09:00",
            "09:30",
            "10:00",
            "10:30",
            "11:00",
            "11:30",
            "12:00",
            "12:30",
            "13:00",
            "13:30",
            "14:00",
            "14:30",
            "15:00",
            "15:30",
            "16:00",
            "16:30",
            "17:00",
            "17:30",
            "18:00",
            "18:30",
            "19:00",
            "19:30",
            "20:00",
            "20:30",
            "21:00",
            "21:30",
            "22:00",
            "22:30",
            "23:00",
            "23:30"});
            this.cmbStartTime.Location = new System.Drawing.Point(313, 42);
            this.cmbStartTime.Name = "cmbStartTime";
            this.cmbStartTime.Size = new System.Drawing.Size(74, 21);
            this.cmbStartTime.TabIndex = 21;
            // 
            // calStartDate
            // 
            this.calStartDate.Location = new System.Drawing.Point(106, 42);
            this.calStartDate.Name = "calStartDate";
            this.calStartDate.Size = new System.Drawing.Size(200, 20);
            this.calStartDate.TabIndex = 20;
            // 
            // label8
            // 
            this.label8.Location = new System.Drawing.Point(6, 46);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(41, 24);
            this.label8.TabIndex = 19;
            this.label8.Text = "When:";
            // 
            // EventName
            // 
            this.EventName.Location = new System.Drawing.Point(104, 13);
            this.EventName.Name = "EventName";
            this.EventName.Size = new System.Drawing.Size(296, 20);
            this.EventName.TabIndex = 18;
            // 
            // label7
            // 
            this.label7.Location = new System.Drawing.Point(6, 13);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(95, 24);
            this.label7.TabIndex = 17;
            this.label7.Text = "Event Name:";
            // 
            // chkIsPRoxyRequired
            // 
            this.chkIsPRoxyRequired.AutoSize = true;
            this.chkIsPRoxyRequired.Location = new System.Drawing.Point(296, 137);
            this.chkIsPRoxyRequired.Name = "chkIsPRoxyRequired";
            this.chkIsPRoxyRequired.Size = new System.Drawing.Size(71, 17);
            this.chkIsPRoxyRequired.TabIndex = 19;
            this.chkIsPRoxyRequired.Text = "Set Proxy";
            this.chkIsPRoxyRequired.UseVisualStyleBackColor = true;
            this.chkIsPRoxyRequired.CheckedChanged += new System.EventHandler(this.chkIsPRoxyRequired_CheckedChanged);
            // 
            // Calendar
            // 
            this.AutoScaleBaseSize = new System.Drawing.Size(5, 13);
            this.ClientSize = new System.Drawing.Size(969, 670);
            this.Controls.Add(this.chkIsPRoxyRequired);
            this.Controls.Add(this.grpNewEvent);
            this.Controls.Add(this.chkCreateNewEvent);
            this.Controls.Add(this.btnRetrieveCalendars);
            this.Controls.Add(this.ProxyPort);
            this.Controls.Add(this.label6);
            this.Controls.Add(this.ProxyAddress);
            this.Controls.Add(this.label5);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.cmbGoogleCalendar);
            this.Controls.Add(this.DayEvents);
            this.Controls.Add(this.Go);
            this.Controls.Add(this.Password);
            this.Controls.Add(this.UserName);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.CalendarURI);
            this.Controls.Add(this.calendarControl);
            this.Cursor = System.Windows.Forms.Cursors.Arrow;
            this.Name = "Calendar";
            this.Text = "Google Calendar Demo Application";
            this.grpNewEvent.ResumeLayout(false);
            this.grpNewEvent.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }
#endregion

        private void textBox1_TextChanged(object sender, System.EventArgs e)
        {

        }

        private void Go_Click(object sender, System.EventArgs e)
        {
            try
            {
                if (ValidateInput() == true)
                {

                    RefreshFeed();
                }
                
            }
            catch (Exception EX)
            {
                MessageBox.Show(EX.Message.ToString());
            }
        }


        private void RefreshFeed() 
        {
            
            if (cmbGoogleCalendar.SelectedIndex >= 0)
            {
                this.CalendarURI.Text = "http://www.google.com/calendar/feeds/" + ((CalendarEntry)(cmbGoogleCalendar.SelectedItem)).SelfUri.ToString().Substring(((CalendarEntry)(cmbGoogleCalendar.SelectedItem)).SelfUri.ToString().LastIndexOf("/") + 1) + "/private/full"; 
            }
            string calendarURI = this.CalendarURI.Text;
            userName =    this.UserName.Text;
           passWord =    this.Password.Text;

            this.entryList = new ArrayList(50); 
            ArrayList dates = new ArrayList(50); 
            EventQuery query = new EventQuery();
            
            GDataGAuthRequestFactory requestFactory = (GDataGAuthRequestFactory)service.RequestFactory;
            IWebProxy iProxy = WebRequest.GetSystemWebProxy();
            WebProxy myProxy = new WebProxy();
            // potentially, setup credentials on the proxy here
            myProxy.Credentials = CredentialCache.DefaultCredentials;
            myProxy.UseDefaultCredentials = false;
            if (ProxyAddress.Text.Trim() != "" && ProxyPort.Text.Trim() != "")
            {
                myProxy.Address = new Uri("http://" + ProxyAddress.Text.Trim() + ":" + ProxyPort.Text.Trim());
            }
            
            if (userName != null && userName.Length > 0)
            {
                service.setUserCredentials(userName, passWord);
            }

            // only get event's for today - 1 month until today + 1 year

            query.Uri = new Uri(calendarURI);
            requestFactory.CreateRequest(GDataRequestType.Query, query.Uri);//  = myProxy;
            if (calendarControl.SelectionRange != null)
            {
                query.StartTime = calendarControl.SelectionRange.Start.AddDays(-1) ;
                query.EndTime = calendarControl.SelectionRange.End.AddDays(1) ;
            }
            else
            {
                query.StartTime = DateTime.Now.AddDays(-12);
                query.EndTime = DateTime.Now.AddMonths(0);
            }

           
            EventFeed calFeed = service.Query(query) as EventFeed;
   

            // now populate the calendar
            if (calFeed != null && calFeed.Entries.Count == 0)
            {
                MessageBox.Show("No Event found");

            }
            else
            {
                while (calFeed != null && calFeed.Entries.Count > 0)
                {
                    // look for the one with dinner time...
                    foreach (EventEntry entry in calFeed.Entries)
                    {
                        this.entryList.Add(entry);
                        if (entry.Times.Count > 0)
                        {
                            foreach (When w in entry.Times)
                            {
                                dates.Add(w.StartTime);
                            }
                        }
                    }
                    // just query the same query again.
                    if (calFeed.NextChunk != null)
                    {
                        query.Uri = new Uri(calFeed.NextChunk);
                        calFeed = service.Query(query) as EventFeed;
                    }
                    else
                        calFeed = null;

                }
                    DateTime[] aDates = new DateTime[dates.Count];
               
                    int i = 0;
                    foreach (DateTime d in dates)
                    {
                        aDates[i++] = d;
                    }


                    this.calendarControl.BoldedDates = aDates;
                    // this.calendarControl.SelectionRange = new SelectionRange(DateTime.Now, DateTime.Now);
                    if (aDates.Length >0)
                    {
                        MessageBox.Show("Please select the Dates marked bold in the calendar to see events");
                    }
                    else
                    {
                        MessageBox.Show("No Event found against selected dates rage and calendar");
                    }
                
            }
        }


        private void calendarControl_DateSelected(object sender, System.Windows.Forms.DateRangeEventArgs e)
        {

            this.DayEvents.Items.Clear();

            ArrayList results = new ArrayList(5); 
            foreach (EventEntry entry in this.entryList) 
            {
                // let's find the entries for that date

                if (entry.Times.Count > 0)
                {
                    foreach (When w in entry.Times) 
                    {
                        if (e.Start.Date == w.StartTime.Date ||
                            e.Start.Date == w.EndTime.Date)
                        {
                            results.Add(entry); 
                            break;
                        }
                    }
                }
            }

            foreach (EventEntry entry in results) 
            {
                ListViewItem item = new ListViewItem(entry.Title.Text); 
                item.SubItems.Add(entry.Authors[0].Name); 
                if (entry.Times.Count > 0)
                {
                    item.SubItems.Add(entry.Times[0].StartTime.TimeOfDay.ToString()); 
                    item.SubItems.Add(entry.Times[0].EndTime.TimeOfDay.ToString()); 
                }

                this.DayEvents.Items.Add(item);
            }
        }
        private CalendarFeed  RetrievingOwnGoogleCalendars()
        {
            // Create a CalenderService and authenticate
            CalendarService myService = new CalendarService("exampleCo-exampleApp-1");
            myService.setUserCredentials(UserName.Text , Password.Text );

            CalendarQuery query = new CalendarQuery();
            query.Uri = new Uri("http://www.google.com/calendar/feeds/default/owncalendars/full");
            CalendarFeed resultFeed = myService.Query(query);
            return resultFeed; 
        }

        private void btnRetrieveCalendars_Click(object sender, EventArgs e)
        {
            try
            {
                if (ValidateInput() == true)
                {
                    cmbGoogleCalendar.Items.Clear();
                    CalendarFeed cal_Feed = RetrievingOwnGoogleCalendars();
                    foreach (CalendarEntry centry in cal_Feed.Entries)
                    {
                        cmbGoogleCalendar.Items.Add(centry);
                    }


                    cmbGoogleCalendar.DisplayMember = "Title";
                    cmbGoogleCalendar.ValueMember = "Title";
                    if (cmbGoogleCalendar.Items.Count > 0)
                    {
                        cmbGoogleCalendar.SelectedIndex = 0;
                    }
                }
            }
            catch (Exception Ex)
            {
                MessageBox.Show(Ex.Message.ToString());
            }
        }

        private void btnCreateNewEvent_Click(object sender, EventArgs e)
        {
            if (ValidateInput() == true)
            {
                try
                {
                    EventEntry entry = new EventEntry();

                    // Set the title and content of the entry.
                    entry.Title.Text = EventName.Text;
                    entry.Content.Content = Description.Text;
                    // Set a location for the event.
                    Where eventLocation = new Where();
                    eventLocation.ValueString = location.Text;
                    entry.Locations.Add(eventLocation);
                    DateTime dtstartdatetime = calStartDate.Value;
                    DateTime dtenddatetime = CalEndDate.Value;
                    string[] str = new string[1];
                    str[0] = ":";
                    double dblHour = Convert.ToDouble(cmbStartTime.SelectedItem.ToString().Split(str, StringSplitOptions.RemoveEmptyEntries)[0]);
                    double dblMinutes = Convert.ToDouble(cmbStartTime.SelectedItem.ToString().Split(str, StringSplitOptions.RemoveEmptyEntries)[1]);
                    dtstartdatetime.AddHours(dblHour);
                    dtstartdatetime.AddMinutes(dblMinutes);
                    dblHour = Convert.ToDouble(cmbEndTime.SelectedItem.ToString().Split(str, StringSplitOptions.RemoveEmptyEntries)[0]);
                    dblMinutes = Convert.ToDouble(cmbEndTime.SelectedItem.ToString().Split(str, StringSplitOptions.RemoveEmptyEntries)[1]);
                    dtenddatetime.AddHours(dblHour);
                    dtenddatetime.AddMinutes(dblMinutes);
                    When eventTime = new When(dtstartdatetime, dtenddatetime);
                    entry.Times.Add(eventTime);
                    userName = UserName.Text;
                    passWord = Password.Text;
                    if (userName != null && userName.Length > 0)
                    {
                        service.setUserCredentials(userName, passWord);
                    }
                    Uri postUri;
                    postUri = new Uri("http://www.google.com/calendar/feeds/default/private/full");
                    if (GoogleCalendar.SelectedIndex >= 0)
                    {
                        postUri = new Uri("http://www.google.com/calendar/feeds/" + ((CalendarEntry)(GoogleCalendar.SelectedItem)).SelfUri.ToString().Substring(((CalendarEntry)(GoogleCalendar.SelectedItem)).SelfUri.ToString().LastIndexOf("/") + 1) + "/private/full"   );
                    }
                    GDataGAuthRequestFactory requestFactory = (GDataGAuthRequestFactory)service.RequestFactory;
                    IWebProxy iProxy = WebRequest.GetSystemWebProxy();
                    WebProxy myProxy = new WebProxy();
                    // potentially, setup credentials on the proxy here
                    myProxy.Credentials = CredentialCache.DefaultCredentials;
                    myProxy.UseDefaultCredentials = false;
                    if (ProxyAddress.Text.Trim() != "" && ProxyPort.Text.Trim() != "")
                    {
                        myProxy.Address = new Uri("http://" + ProxyAddress.Text.Trim() + ":" + ProxyPort.Text.Trim());
                    }
                    requestFactory.CreateRequest(GDataRequestType.Insert, postUri);//  = myProxy;
                    // Send the request and receive the response:
                  
                    AtomEntry insertedEntry = service.Insert(postUri, entry);
                    
                    MessageBox.Show("Event Successfully Added");
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message.ToString());
                }
            }
        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void label11_Click(object sender, EventArgs e)
        {

        }

        private void chkCreateNewEvent_CheckedChanged(object sender, EventArgs e)
        {
            if (chkCreateNewEvent.Checked == true)
            {
                if (ValidateInput() == true)
                {
                    try
                    {
                        GoogleCalendar.Items.Clear();
                        chkCreateNewEvent.Enabled = false;
                        grpNewEvent.Enabled = false;
                        CalendarFeed cal_Feed = RetrievingOwnGoogleCalendars();
                        foreach (CalendarEntry centry in cal_Feed.Entries)
                        {
                            GoogleCalendar.Items.Add(centry);
                        }


                        GoogleCalendar.DisplayMember = "Title";
                        GoogleCalendar.ValueMember = "Title";
                        if (GoogleCalendar.Items.Count > 0)
                        {
                            GoogleCalendar.SelectedIndex = 0;
                        }

                    }

                    catch (Exception Ex)
                    {
                        MessageBox.Show(Ex.Message.ToString());
                    }
                    cmbStartTime.SelectedIndex = 0;
                    cmbEndTime.SelectedIndex = 0;
                    chkCreateNewEvent.Enabled = true;
                    grpNewEvent.Enabled = true;
                }
                else
                {
                    chkCreateNewEvent.Checked = false;
                }
            }
            else
            {
                grpNewEvent.Enabled = false; 
            }
        }

        private void chkIsPRoxyRequired_CheckedChanged(object sender, EventArgs e)
        {
            if (chkIsPRoxyRequired.Checked == true)
            {
                ProxyAddress.Enabled = true;
                ProxyPort.Enabled = true;
            }
            else
            {
                ProxyAddress.Enabled = false;
                ProxyPort.Enabled = false;
            }
        }
        private Boolean ValidateInput()
        {
            if (UserName.Text.Trim() == "" || Password.Text.Trim() == "")
            {
                MessageBox.Show("Please Enter your Gmail account information");

                return false;
            }
            else if(chkIsPRoxyRequired.Checked ==true )
            {
                if (ProxyAddress.Text.Trim() == "" || ProxyPort.Text.Trim() == "")
                {
                    MessageBox.Show("Please Enter Proxy Information");

                    return false;
                }
            }

            return true;
        }
        

    }
}
