<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SuperNots.aspx.cs" Inherits="I200444_I200476_I200689_Project.SuperNots" %>
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
    background-size: 100% 500vh;
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
    font-family:Georgia;
}

.content{
    display: flex;
    min-height: 110vh;
}


.content section{
    margin-top: 8vh;
    margin-left: 20vh;
}


.content-form{
    margin-top: 20px;
}

.form{
    align-items: center;
    min-height: 70vh;
    margin-left:2%;
    margin-top:150px;
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

.MButton{
    width:100px;
    height:40px;
    color:black;
    border-radius:20px;
}

.MButton:hover{
    color:white;
    background-color:#3a3d3b;
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
    margin-top:10px;
    font-size:35px;
    border-width:5px;
}

.grid th{
    padding-bottom:40px;
    color: blanchedalmond;
}

.grid td{
    padding-right:40px;
    padding-bottom:50px;
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
                        <li style ="font-size: 80%"><asp:Button CssClass="topbtn" runat="server" Text="Notifications" OnClick="MovetoNot"/></li>
                        <li style ="font-size: 80%"><a runat="server" href="~/Login">Sign Out</a></li>
                      </ul>
                </div>
            </div>
            </div>
            <br />


    <div class="container">

        <header>
            <asp:Label ID="Heading" CssClass="heading" runat="server">Notifications for </asp:Label>
        </header>
       
      <formview>
        <div class="form">
            <div class="right">

                <div class="contact-form">
                  <asp:GridView runat="server" ID="NotGrid" CssClass="grid"></asp:GridView>
                </div>
                <br /><br />
            </div>
           </div>
          </formview>
        </div>
        <br /><br /><br /><br /><br />   


</asp:Content>
