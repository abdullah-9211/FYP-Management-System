<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Evaluation.aspx.cs" Inherits="I200444_I200476_I200689_Project.Evaluation" %>
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
    top: 5rem;
}

header h1{
    font-size: 70px;
}

.evaluation textarea{
    width: 30rem;
    border: 0px;
    background-color: transparent;
    margin: 30px;
    font-size: 17px;
    border-bottom: 2px solid white;
}


.evaluation textarea ~ span
{
    position: absolute;
    left: 200px;
    margin-top: 20px;
    transition: 0.9s ease-in-out;
}

input[type=radio]{
    width:20px;
    height:20px;
}

.submission{
  display: inline-block;
  padding: 15px 35px;
  font-size: 20px;
  cursor: pointer;
  text-align: center;
  color: black;
  border-radius: 15px;
  box-shadow: 0 9px #999;
  background-color:#f7e099;
}

.submission:hover {background-color: #f7e099}

.submission:active {
  background-color: #f7e099;
  box-shadow: 0 5px #666;
  transform: translateY(4px);
}

.QHead{
    font-size:18px;
    font-family:'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

.htext{
    font-size:25px;
    font-family:sans-serif;
}

.name{
        font-size: 16px;
        width: 150px;
        padding: 15px 10px;
        height:40px;
        transition: width 0.6s ease-in-out;
        color:black;
        margin-top:10px;
}

.name:focus{
      width:350px;
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
                        <li style ="font-size: 80%"><a runat="server" href="~/About">About</a></li>
                        <li style ="font-size: 80%"><a runat="server" href="~/Contact">Contact</a></li>
                        <li style ="font-size: 80%"><asp:Button CssClass="topbtn" runat="server" Text="Evaluation" OnClick="MovetoEval"/></li>
                        <li style ="font-size: 80%"><a runat="server" href="~/Login">Sign Out</a></li>
                      </ul>
                </div>
            </div>
            </div>

            <header>
                <h1>Evaluation Form</h1>
                <p style =" font-size:large;">Please fill in the Evaluations</p>
            </header>

        <br /><br /><br /><br /><br /><br />

        <div class =" evaluation">
            <div class="htext">Project Title</div>
            <asp:TextBox ID="TB1" runat="server" placeholder="Title" CssClass="name" ></asp:TextBox>
            <br /><br />
            <div class="htext">Evaluation</div>
            <asp:TextBox ID="TB2" runat="server" placeholder="Evaluation" CssClass="name" style="height:70px;"></asp:TextBox>
            <br /><br />
            <div class="htext">Suggestions for the Project</div>
            <asp:TextBox ID="TB3" runat="server" placeholder="Suggestions" CssClass="name" style="height:70px;"></asp:TextBox>
            <br /><br /><br />

        </div>
        
    <br />
    <asp:Button runat="server" CssClass="submission" Text="Submit" OnClick="Evaluate"/>
    <br /><br />
</asp:Content>
