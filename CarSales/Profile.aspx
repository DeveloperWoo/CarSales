<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="CarSales.Profile" %>
<%@ Register tagPrefix="uc" tagName="OrderInfo" src="OrderInfo.ascx" %>

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
            margin: 0px;
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

        #grid-container {
            display: grid;
            grid-template-areas: "myProfile orderForm"
                                 "orderList orderList";
        }
        #gridItem1 {
            grid-area: myProfile;
        }
        #gridItem2 {
            grid-area: orderForm;
            padding: 10px;
            margin: 10px;
            background-color: aliceblue;
        }
        #gridItem3 {
            grid-area: orderList;
        }
        .auto-style1 {
            width: 221px;
        }
        .auto-style2 {
            width: 82px;
        }
        .auto-style3 {
            width: 163px;
        }
    </style>
</head>
<body>
<form id="form1" runat="server">
<div class="jumbotron">
    <h1>Sheridan Auto Trader</h1>
    <h2>
        Welcome <asp:Label ID="welcomeUserName" runat="server"></asp:Label>!
    </h2>
</div>
<div class="col-sm-2"></div>
<div class="col-sm-8" id="grid-container">

    <div id="gridItem1">
        <h2>My Profile</h2>
        <table class="table table-bordered">
            <tr>
                <th class="auto-style1">Name</th>
                <td>
                    <asp:Label ID="valName" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <th class="auto-style1">Address</th>
                <td>
                    <asp:Label ID="valAddress" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <th class="auto-style1">Postal Code</th>
                <td>
                    <asp:Label ID="valPostalCode" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <th class="auto-style1">Phone Number</th>
                <td>
                    <asp:Label ID="valPhoneNumber" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <th class="auto-style1">Email</th>
                <td>
                    <asp:Label ID="valEmail" runat="server"></asp:Label>
                </td>
            </tr>
        </table>
    </div>
    <div id="gridItem2">
        <h2>Sheridan Car Sales</h2>
        <table>
            <tr>
                <th>Brand:</th>
                <td><asp:TextBox ID="txtBrand" runat="server" Width="200px"></asp:TextBox></td>
                <td>                    
                    <asp:RequiredFieldValidator ID="vldBrand" runat="server"
                                                ErrorMessage="You must enter a brand."
                                                ForeColor="Red"
                                                ControlToValidate="txtBrand" />
                </td>
            </tr>
            <tr>
                <th>Model:</th>
                <td><asp:TextBox ID="txtModel" runat="server" Width="200px"></asp:TextBox></td>
                <td>
                    <asp:RequiredFieldValidator ID="vldModel" runat="server"
                                                ErrorMessage="You must enter a model."
                                                ForeColor="Red"
                                                ControlToValidate="txtModel" />
                </td>
            </tr>
            <tr>
                <th>Year:</th>
                <td>
                    <asp:DropDownList ID="ddYear" runat="server">
                        <asp:ListItem Value="2000"></asp:ListItem>
                        <asp:ListItem Value="2001"></asp:ListItem>
                        <asp:ListItem Value="2002"></asp:ListItem>
                        <asp:ListItem Value="2003"></asp:ListItem>
                        <asp:ListItem Value="2004"></asp:ListItem>
                        <asp:ListItem Value="2005"></asp:ListItem>
                        <asp:ListItem Value="2006"></asp:ListItem>
                        <asp:ListItem Value="2007"></asp:ListItem>
                        <asp:ListItem Value="2008"></asp:ListItem>
                        <asp:ListItem Value="2009"></asp:ListItem>
                        <asp:ListItem Value="2010"></asp:ListItem>
                        <asp:ListItem Value="2011"></asp:ListItem>
                        <asp:ListItem Value="2012"></asp:ListItem>
                        <asp:ListItem Value="2013"></asp:ListItem>
                        <asp:ListItem Value="2014"></asp:ListItem>
                        <asp:ListItem Value="2015"></asp:ListItem>
                        <asp:ListItem Value="2016"></asp:ListItem>
                        <asp:ListItem Value="2017"></asp:ListItem>
                        <asp:ListItem Value="2018"></asp:ListItem>
                        <asp:ListItem Value="2019"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <th>Colour:</th>
                <td><asp:TextBox ID="txtColour" runat="server" Width="200px"></asp:TextBox></td>
                <td>
                    <asp:RequiredFieldValidator ID="vldColour" runat="server"
                                                ErrorMessage="You must enter a colour."
                                                ForeColor="Red"
                                                ControlToValidate="txtColour" />
                </td>
            </tr>
            <tr>
                <th>Price:</th>
                <td><asp:TextBox ID="txtPrice" runat="server" Width="200px"></asp:TextBox></td>
                <td>
                    <asp:RegularExpressionValidator ID="vldPrice" runat="server"
                                                    ControlToValidate="txtPrice"
                                                    ErrorMessage="Only positive numeric allowed." 
                                                    MinimumValue="0"
                                                    ForeColor="Red"
                                                    ValidationExpression="^[0-9]*$" 
                                                    ValidationGroup="NumericValidate"/>
                </td>
            </tr>
            <tr>
                <th></th>
                <td><asp:Button ID="BtnOrder" CssClass="btn btn-info" runat="server" Text="Order" OnClick="BtnOrder_Click"/>
                <td>
                    <asp:Label ID="lblMessage" runat="server"></asp:Label>
                </td>
            </tr>
        </table>
    </div>
    <div id="gridItem3">
        <h2>My Order List</h2>
        <table class="table table-striped">
            <tr>
                <th class="auto-style2">Order ID</th>
                <th class="auto-style3">Customer Name</th>
                <th>Brand</th>
                <th>Model</th>
                <th>Year</th>
                <th>Colour</th>
                <th>Price</th>
            </tr>
            <asp:Repeater ID="RepeaterOrders" runat="server" OnItemDataBound="Repeater_Orders">
                <ItemTemplate>
                    <uc:OrderInfo runat="server" ID="OrderRow" />
                </ItemTemplate>
            </asp:Repeater>
        </table>
    </div>
</div>
<div class="col-sm-2"></div>

<div class="footer">
    <p>Woo, Hyun-Juun-Ju</p>
</div>
</form>
</body>
</html>

