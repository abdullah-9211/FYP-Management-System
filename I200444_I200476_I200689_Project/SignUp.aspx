<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="I200444_I200476_I200689_Project.SignUp1" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
        <title>Sign Up Page</title>
        <link rel="stylesheet" href="login.css" />
        <link rel="icon" type="image/x-icon" href="favicon.ico" />
    </head>
    <body>

        <div class="heading">
            <img src="download.png" class="img_container" />
            <h2>Final Year Project Management System</h2>
            <h2 style="margin-left:45%">Sign-Up</h2>
        </div>

        <img src="user.png" class="user" />
        
        <div class="container">
            <form runat="server">
              <div class="row">
                <div class="col">
                  <asp:TextBox ID="TB1" runat="server" placeholder="First Name"></asp:TextBox>
                  <asp:TextBox ID="TB2" runat="server" placeholder="Last Name"></asp:TextBox>
                  <asp:TextBox ID="TB3" runat="server" placeholder="Username"></asp:TextBox>
                  <asp:TextBox ID="TB4" runat="server" placeholder="Password" TextMode="Password"></asp:TextBox>
                  <asp:Button runat="server" Text="Create Account" OnClick="Create_Press"/>
                </div>
                </div>
                </form>
              </div>
            
          
          <div class="bottom-container">
            <div class="row">
              <div class="col">
                <a href="Login.aspx" style="color:white" class="btn">Already have an account?</a>
              </div>
              <div class="col">
                <a href="#" style="color:white" class="btn">Forgot password?</a>
              </div>
            </div>
          </div>
    </body>
</html>
