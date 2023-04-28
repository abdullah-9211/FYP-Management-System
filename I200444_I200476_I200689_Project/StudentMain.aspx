<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="StudentMain.aspx.cs" Inherits="I200444_I200476_I200689_Project.StudentMain" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

        <style>

*{

    padding: 0;
    margin: 0;
    color: #fff;
    box-sizing: border-box;
    font-family: Verdana, sans-serif;
    border: none;
}

body{
    width: 100%;
    height: 300vh;
    background-size: 100% 300vh;
}

header{
    position: absolute;
    text-align: center;
    width: 75%;
    left: 12%;
    top: 6rem;
}

header .heading{
    font-size: 70px;
}

.content{
    min-height: 70vh;
}


.content section{
    margin-top: 8vh;
    margin-left: 20vh;
}


.content-form{
    margin-top: 8rem;
}

.form{
    margin-left: 5%;
    min-height: 50vh;
}

.container textarea{
    width: 30rem;
    border: 0px;
    background-color: transparent;
    margin: 20px;
    font-size: 17px;
    border-bottom: 2px solid white;
}

.container textarea ~ span
{
    position: absolute;
    left: 200px;
    margin-top: 20px;
    transition: 0.9s ease-in-out;
}


.container textarea:focus ~span{
    transform: translateY(-20px);
    pointer-events: none;
}

.topbtn{
    background-color: black;
    color: gray;
    margin-top:17px;
    margin-left:20px;
    margin-right:10px;
    font-size:12px;
    border: none;
}

.topbtn:hover{
    color:white;
}

.topbtn:active{
    border:black;
}

.mainbtn{
    font-size: 150%;
    color:gray;
    background-color:black;
    border:none;
    margin-top:10px;
    margin-right:20px;
}

.mainbtn:hover{
    color:white;
}

.mainbtn:active{
    border:black;
}

.grid{
    margin-top:10px;
    font-size:35px;
    margin-left:5%;
    border-width:5px;
}

.grid th{
    padding-bottom:20px;
    color: blanchedalmond;
    padding-top:10px;
}

.grid td{
    padding-right:40px;
    padding-bottom:30px;
    font-family: 'Times New Roman';
}

.label{
    font-size:30px;
    font-family:'Segoe UI';
    margin-left:25%;
}

    </style>

        <div class="navbar navbar-inverse navbar-fixed-top">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <asp:Button runat="server" CssClass="mainbtn" Text="FYP Management System" OnClick="MovetoHome"/>
                    <img src="bimage1.png" width= "50"/>
                </div>
                <div class="navbar-collapse collapse">
                    <ul class="nav navbar-nav">
                        <li style ="font-size: 80%"><asp:Button CssClass="topbtn" runat="server" Text="Home" OnClick="MovetoHome"/></li>
                        <li style ="font-size: 80%"><a runat="server" href="~/About">About</a></li>
                        <li style ="font-size: 80%"><a runat="server" href="~/Contact">Contact</a></li>
                        <li style ="font-size: 80%"><a runat="server" href="~/Login">Sign Out</a></li>
                      </ul>
                </div>
            </div>
            </div>

    <br /><br />   <br /><br /><br /><br /><br />   <br /><br /><br /><br /><br />

    

    <div class="container">

        <header>
            <asp:Label ID="Heading" CssClass="heading" runat="server">Welcome</asp:Label>
            <p style =" font-size:x-large;">FYP Details Presented Are:</p>
        </header>
       
      <formview>
        <div class="form">
            <div class="right">

              <div class="contact-form">
                  <span style =" font-size:xx-large;padding-bottom:10px;">Project Details:</span>
                  <asp:GridView runat="server" ID="ProjectGrid" CssClass="grid"></asp:GridView>
              </div>
                <br/><br /><hr /><br />
                <div class="contact-form">
                  <span style =" font-size:xx-large;">Project Group Members:</span>
                  <asp:GridView runat="server" ID="GroupMembers" CssClass="grid" ShowHeader="False"></asp:GridView>
              </div>
                <br/><br /><hr /><br />
                

              <div class="contact-form">
                  <asp:Label runat="server" ID="Supername" CssClass="label">Supervisor Name: </asp:Label>
              </div>
                <br /><br /><br />
              <div class="contact-form">
                  <asp:Label runat="server" ID="CoSupername" CssClass="label">Co-Supervisor Name: </asp:Label>
              </div>
                <br /><br /><br />
              <div class="contact-form">
                  <asp:Label runat="server" ID="Panel" CssClass="label">Panel ID Assigned: </asp:Label>
              </div>
               <br /><br /><hr /><br />
              <div class="contact-form">
                  <span style =" font-size:xx-large;padding-bottom:10px;">Reviews by Panel Members:</span>
                  <asp:GridView runat="server" ID="ReviewGrid" CssClass="grid"></asp:GridView>
              </div>
                <br /><br /><br />
              </div>
            </div>
             </formview>
          </div>




</asp:Content>
