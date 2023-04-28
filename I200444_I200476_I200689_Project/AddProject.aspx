<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddProject.aspx.cs" Inherits="I200444_I200476_I200689_Project.AddProject" %>
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

    body {
        width: 100%;
        height: 300vh;
        background-size: 100% 150vh;
    }

h1{
    text-align:center;
    font-family:'Segoe UI';
    font-size:60px;
}

.form{
    margin-left:50px;
}

.form .sub-form .TBox{
    width: 40rem;
    background-color: transparent;
    border: 0px;
    border: transparent;
    margin: 20px;
    padding: 10px;
    font-size: 22px;
    border-bottom: 2px inset #fff;
}

.form .sub-form .TBox ~ span{
    position: absolute;
    left: 17.5%;
    transition: 0.6s ease-in-out;
    margin-top: 10px;
}

.form .sub-form .TBox:focus ~span{
    transform: translateY(-20px);
    pointer-events: none;
}

.form .sub-form .TBox:focus{
    border:2px outset maroon;
}

.btn{
    margin-left:18px;
    width:140px;
    height:60px;
    border-radius:40px;
    background-color:#7e7bb8;
    border:2px solid #7e7bb8;
}

.btn:hover{
    border:1px solid white;
    background-color:transparent;
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
    <h1>Register Project</h1>
    <br /><br /><br /><br />
    <div class="container">
        <formview runat="server">
            <div class="form">
                <div class="sub-form">
                    <asp:TextBox ID="TB1" runat="server" CssClass="TBox"></asp:TextBox>
                    <span style="font-size:medium">Project Title</span>
                </div>
                <br />
                <div class="sub-form">
                    <asp:TextBox ID="TB2" runat="server" CssClass="TBox"></asp:TextBox>
                    <span style="font-size:medium">Project Supervisor</span>
                </div>
                <br />
                <div class="sub-form">
                    <asp:TextBox ID="TB3" runat="server" CssClass="TBox"></asp:TextBox>
                    <span style="font-size:medium">Project Co-Supervisor</span>
                </div>
                <br />
                <div class="sub-form">
                    <asp:TextBox ID="TB4" runat="server" CssClass="TBox"></asp:TextBox>
                    <span style="font-size:medium">Evaluation Panel ID</span>
                </div>
                <br />
                <asp:Button runat="server" Text="Register" CssClass="btn" OnClick="Register_Project"/>
            </div>
        </formview>

    </div>

</asp:Content>