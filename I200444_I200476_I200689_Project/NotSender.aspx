<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="NotSender.aspx.cs" Inherits="I200444_I200476_I200689_Project.NotSender" %>
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
    background-size: 100% 210vh;
}

header{
    position: absolute;
    text-align: center;
    width: 75%;
    left: 12%;
    top: 5rem;
}

header h1{
    font-size: 70px;
}

}

    .deadline {
        width: 350px;
        top: 50%;
        Left: 50%;
        transform: translate(-50%, -50%);
        position: absolute;
    }


    .deadlineIn{
        font-size: 16px;
        width: 150px;
        padding: 15px 10px;
        height:40px;
        transition: width 0.6s ease-in-out;
        color:black;

    }
    
    formview .deadlineIn:focus{
        width:650px;
    }

formview p{
    font-size:20px;
    margin-top:20px;
}

.btn {
  display: inline-block;
  padding: 15px 35px;
  font-size: 20px;
  cursor: pointer;
  text-align: center;
  color: black;
  border-radius: 15px;
  box-shadow: 0 9px #999;
  background-color:blanchedalmond;
  margin-top:30px;
}
.btn:hover {background-color: blanchedalmond;
            color:lightslategray;
            transform:translateY(-5px);
}

.btn:active {
    color:black;
  background-color: blanchedalmond;
  box-shadow: 0 5px #666;
  transform: translateY(5px);
}

.reviewsection{
        font-size: 16px;
        width: 150px;
        height: 50px;
        padding: 15px 10px;
        height:80px;
        transition: width 0.4s ease-in-out;
        color:black;
}

.reviewsection:focus{
    width:850px;
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

 <header>
<h1>Send Notification to Supervisor</h1>
</header>
    
    <br /><br /><br /><br /><br />
    <br /><br /><br /><br /><br />

    <formview>

        <p>Reciever Username</p>
        <asp:TextBox ID="TB1" runat="server" CssClass="deadlineIn" placeholder="Reciever"></asp:TextBox>
        
        <br /><br />
        <p>Message</p>
        <asp:TextBox ID="TB2" runat="server" CssClass="reviewsection" placeholder= "Message"></asp:TextBox>
        <br /><br /><br /><br />
        <asp:Button runat="server" CssClass="btn" Text="Send" OnClick="SendNot"/>
        <br /><br /><br /><br />
</formview>

    <br /><br /><br /><br /><br />


</asp:Content>
