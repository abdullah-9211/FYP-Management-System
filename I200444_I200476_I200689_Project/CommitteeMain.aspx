<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CommitteeMain.aspx.cs" Inherits="I200444_I200476_I200689_Project.WebForm2" %>
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

.main_heading{
    text-align:center;
    font-family:sans-serif;
}

body{
    width: 100%;
    height: 300vh;
    background-size: 100% 110vh;
}

header{
    position: absolute;
    text-align: center;
    width: 75%;
    left: 12%;
    top: 2rem;
}

header h1{
    font-size: 70px;
}

.content{
    display: flex;
    min-height: 110vh;
}


.content section{
    margin-top: 8vh;
    margin-left: 20vh;
}

.btn-group{
    margin-left:40px;
}

.btn-group .inbtn{
  background-color: beige;
  border: 1px solid crimson;
  font-size: x-large;
  color: black;
  padding: 10px 24px;
  cursor: pointer;
  float: left;
  height:150px;
  margin-right:30px;
  margin-left:30px;
  width:30.3%;
}

.btn-group .inbtn:not(:last-child) {
  border-right: none;
}

.btn-group:after {
  content: "";
  clear: both;
  display: table;
}

.btn-group .inbtn:hover{
    background-color: crimson;
    color: white;
    transition-duration: 0.8s;
    transform:translateY(-30px);
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
                        <li style ="font-size: 80%"><asp:Button CssClass="topbtn" runat="server" Text="Deadlines" OnClick="MovetoDeadline"/></li>
                        <li style ="font-size: 80%"><asp:Button CssClass="topbtn" runat="server" Text="Register Project" OnClick="MovetoProject"/></li>
                        <li style ="font-size: 80%"><asp:Button CssClass="topbtn" runat="server" Text="Send Notification" OnClick="MovetoNot"/></li>
                        <li style ="font-size: 80%"><a runat="server" href="~/Login">Sign Out</a></li>
                        <li style ="font-size: 80%"><asp:Button CssClass="topbtn" runat="server" Text="Add Account" OnClick="MovetoSignup"/></li>
                    </ul>
                </div>
            </div>
            </div>
    <h1 class="main_heading" style="font-size:70px">Register Users</h1>
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    
    
    <div class="btn-group" style="width:100%;">
        <asp:Button runat="server" CssClass="inbtn" Text="Students" OnClick="MovetoStudents"/>
        <asp:Button runat="server" CssClass="inbtn" Text="Panel Member" OnClick="MovetoPanel"/>
        <asp:Button runat="server" CssClass="inbtn" Text="Supervisor" OnClick="MovetoSuper"/>
    </div>

    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    



</asp:Content>
