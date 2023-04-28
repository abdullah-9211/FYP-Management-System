<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="I200444_I200476_I200689_Project.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
        <title>login page</title>
        <link rel="stylesheet" href="login.css" />
    </head>
    <body>
        <div class="heading">
            <img src="download.png" class="img_container" />
            <h2>Final Year Project Management System</h2>
            <h2 style="margin-left:45%">Login</h2>
        </div>

        <img src="user.png" class="user" />
        
        <div class="container">
            <form runat="server">
              <div class="row">
                <div class="col">
                  <asp:TextBox runat="server" ID="TB1" placeholder="Username" />
                  <asp:TextBox runat="server" ID="TB2" placeholder="Password" TextMode="Password" />
                  <asp:Button runat="server" Text="Login" OnClick="Login_Press"/>
                </div>
                
              </div>
            </form>
          </div>
          
          <div class="bottom-container">
            <div class="row">
              <div class="col" style="text-align:center; color:white;margin-top:20px;font-size:18px">
                  Please contact committee if account lost
              </div>
              <div class="col">
                <a href="#" style="color:white" class="btn">Forgot password?</a>
              </div>
            </div>
          </div>

    </body>
</html>