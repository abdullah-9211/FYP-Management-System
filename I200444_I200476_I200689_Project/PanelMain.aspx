<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="PanelMain.aspx.cs" Inherits="I200444_I200476_I200689_Project.PanelMain" %>

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
    background-size: 100% 400vh;
}

header{
    position: absolute;
    text-align: center;
    width: 75%;
    left: 12%;
    top: 7rem;
}

header .heading{
    font-size: 70px;
}

.content{
    display: flex;
    min-height: 90vh;
}


.content section{
    margin-top: 5vh;
    margin-left: 2vh;
}


.content-form{
    margin-top: 5rem;
}

.lab{
    font-size:40px;
    font-family:'Segoe UI';
    margin-left:33%;
}

.lab2{
    font-size:40px;
    font-family:'Segoe UI';
}

.form{
    margin-left: 10%;
    justify-content: center;
    align-items: center;
    min-height: 50vh;
}

input[type=button]{
    width:100px;
    height:40px;
    color:black;
    border-radius:20px;
}

input[type=button]:hover{
    color:white;
    background-color:#3a3d3b;
    transition-duration:0.5s;
}

.YButton{
    margin-bottom:10px;
    background-color:#3a3d3b;
    border-radius:20px;
    width:100px;
    height:40px;
}

.YButton:hover{
    color:black;
    background-color:white;
    transition-duration:0.5s;
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
    font-size:35px;
    margin-left:35%;
    border-width:5px;
}

.grid td{
    padding-bottom:30px;
    font-family: 'Times New Roman';
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
                        <li style ="font-size: 80%"><asp:Button CssClass="topbtn" runat="server" Text="Evaluation" OnClick="MovetoEval"/></li>
                        <li style ="font-size: 80%"><a runat="server" href="~/Login">Sign Out</a></li>
                      </ul>
                </div>
            </div>
            </div>


    <br /><br /><br /><br /><br />   <br /><br /><br /><br /><br />   <br /><br /><br /><br /><br />


    <div class="container">

        <header>
            <asp:Label ID="Heading" CssClass="heading" runat="server">Welcome</asp:Label>
            <p style =" font-size:x-large;">Details Presented Are:</p>
        </header>
       
      <formview>
        <div class="form">
            <div class="right">
              <div class="contact-form">
                  <asp:Label runat="server" CssClass="lab" ID="PanelID">Panel ID: </asp:Label>
              </div>
                <br /><br /><hr /><br /><br />
              <div class="contact-form">
                  <asp:Label runat="server" CssClass="lab2">Fellow Panel Members: </asp:Label>
                  <br /><br />
                  <asp:GridView runat="server" ID="MemberGrid" CssClass="grid" ShowHeader="False"></asp:GridView>
              </div>
                <br /><br /><hr /><br /><br />
                <div class="contact-form">
                  <asp:Label runat="server" CssClass="lab2">Projects under Panel: </asp:Label>
                  <br /><br />
                  <asp:GridView runat="server" ID="ProjectGrid" CssClass="grid" ShowHeader="False"></asp:GridView>
              </div>
                <br /><br /><hr /><br /><br />
                <div class="contact-form">
                  <asp:Label runat="server" CssClass="lab2">Evaluations Done: </asp:Label>
                  <br /><br />
                  <asp:GridView runat="server" ID="DoneEval" CssClass="grid" ShowHeader="False"></asp:GridView>
              </div>
                <br /><br /><hr /><br /><br />
                <div class="contact-form">
                  <asp:Label runat="server" CssClass="lab2">Pending Evaluations: </asp:Label>
                  <br /><br />
                  <asp:GridView runat="server" ID="NoEval" CssClass="grid" ShowHeader="False"></asp:GridView>
              </div>
              </div>
            </div>
            </formview>

          </div>



</asp:Content>
