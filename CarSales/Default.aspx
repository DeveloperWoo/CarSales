<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CarSales.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login Page</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <style>
        .jumbotron {
            background-color: darkcyan;
            color: white;
        }

        .footer {
            position: fixed;
            left: 0;
            bottom: 0;
            width: 100%;
            background-color: darkslategray;
            color: white;
            text-align: center;
        }
    </style>
</head>
<body>
<div class="jumbotron">
    <h1>Sheridan Auto Trader</h1>      
</div>

<div class="container">
    <form class="form-horizontal" runat="server">
        <div class="form-group">
            <label class="control-label col-sm-2" for="userName">User Name:</label>
            <div class="col-sm-10">
                <asp:TextBox ID="txtUserName" runat="server" class="form-control" placeholder="Enter your user name"></asp:TextBox>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-2" for="pwd">Password:</label>
            <div class="col-sm-10">          
                <asp:TextBox ID="txtPassword" runat="server" class="form-control" placeholder="Enter password"></asp:TextBox>
            </div>
        </div>
        <div class="form-group">        
            <div class="col-sm-offset-2 col-sm-10">
                <asp:Button ID="BtnLogin" class="btn btn-default" runat="server" OnClick="BtnLogin_Click" Text="Log in" />
            &nbsp;
                <asp:Label ID="txtLoginMsg" runat="server" ForeColor="Blue"></asp:Label>
            </div>
        </div>
        <br /><br/>
        <div class="form-group">        
            <label class="col-sm-offset-2 col-sm-10" for="BtnRegister">New customer?                
                &nbsp;<asp:Button ID="Button1" class="btn btn-info" runat="server" OnClick="BtnRegister_Click" Text="Register" />
            </label>
        </div>
    </form>
</div>

<div class="footer">
    <p>Woo, Hyun-Ju</p>
</div>

</body>
</html>
