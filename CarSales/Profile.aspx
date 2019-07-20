<!-- Author: Hyun Ju Woo () on July-20-2019 -->
<!-- Author: Min Jung Park (991495289) on July-20-2019 -->

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="CarSales.Profile" %>
<%@ Register TagPrefix="uc" TagName="OrderInfo" Src="OrderInfo.ascx" %>

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
            padding-bottom: 5px;
        }

        .footer {
            position: fixed;
            left: 0;
            bottom: 0;
            width: 100%;
            background-color: darkslategray;
            color: gray;
            font-style: Italic;
            text-align: center;
            padding-top: 10px;
        }

        #grid-container {
            display: grid;
            grid-template-areas: "myProfile orderForm" "orderList orderList";
        }

        #gridItem1 {
            grid-area: myProfile;
        }

        #gridItem2 {
            grid-area: orderForm;
            padding: 10px;
            margin: 10px 0px 30px 10px;
            background-color: aliceblue;
        }

        #gridItem3 {
            grid-area: orderList;
            margin-bottom: 50px;
        }

        .auto-style1 {
            width: 221px;
        }

        .auto-style2 {
            width: 82px;
        }

        .gridItem2 td {
            width: 100%;
        }

        .auto-style3 {
            width: 163px;
        }

        #welcomeMsg {
            text-align: center;
            color: darkslategray;
        }

        #BtnLogOut {
            margin-right: 20px;
        }

        #ddYear {
            height: 27px;
            width: 200px;
        }

        table {
            width: 100%;
        }

        td {
            padding: 2px;
        }

        #BtnOrder {
            width: 200PX;
        }
        #BtnShowOrders {
            width: 100%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="jumbotron" runat="server">
            <h1>Sheridan Auto Trader</h1>
            <h3 id="welcomeMsg">Welcome
                <asp:Label ID="welcomeUserName" runat="server"></asp:Label>!        
        <asp:Button ID="BtnLogOut" runat="server" CssClass="btn btn-light pull-right" Text="LOG OUT" OnClick="BtnLogOut_Click" />
            </h3>
        </div>
        <div class="container">
            <div class="row justify-content-around">

                <div class="col-12" id="grid-container">
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
                                <td>
                                    <asp:TextBox ID="txtBrand" runat="server" Width="200px"></asp:TextBox></td>
                                <td>
                                    <asp:RequiredFieldValidator ID="vldBrand" runat="server"
                                        ErrorMessage="You must enter a brand."
                                        ForeColor="Red"
                                        ControlToValidate="txtBrand"
                                        ValidationGroup="OrderGroup" />
                                </td>
                            </tr>
                            <tr>
                                <th>Model:</th>
                                <td>
                                    <asp:TextBox ID="txtModel" runat="server" Width="200px"></asp:TextBox></td>
                                <td>
                                    <asp:RequiredFieldValidator ID="vldModel" runat="server"
                                        ErrorMessage="You must enter a model."
                                        ForeColor="Red"
                                        ControlToValidate="txtModel"
                                        ValidationGroup="OrderGroup" />
                                </td>
                            </tr>
                            <tr>
                                <th>Year:</th>
                                <td>
                                    <asp:DropDownList ID="ddYear" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <th>Colour:</th>
                                <td>
                                    <asp:TextBox ID="txtColour" runat="server" Width="200px"></asp:TextBox></td>
                                <td>
                                    <asp:RequiredFieldValidator ID="vldColour" runat="server"
                                        ErrorMessage="You must enter a colour."
                                        ForeColor="Red"
                                        ControlToValidate="txtColour"
                                        ValidationGroup="OrderGroup" />
                                </td>
                            </tr>
                            <tr>
                                <th>Price:</th>
                                <td>
                                    <asp:TextBox ID="txtPrice" runat="server" Width="200px" MaxLength="10"></asp:TextBox></td>
                                <td>
                                    <asp:RegularExpressionValidator ID="vldPrice" runat="server"
                                        ControlToValidate="txtPrice"
                                        ErrorMessage="Only positive numeric allowed."
                                        MinimumValue="0"
                                        ForeColor="Red"
                                        ValidationExpression="^[0-9]*$"
                                        ValidationGroup="OrderGroup" />
                                </td>
                            </tr>
                            <tr>
                                <th></th>
                                <td>
                                    <asp:Button ID="BtnOrder" Class="btn btn-info" runat="server" Text="ORDER" OnClick="BtnOrder_Click" ValidationGroup="OrderGroup" />
                                    <td>
                                        <asp:Label ID="lblMessage" runat="server"></asp:Label>
                                    </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
            <div class="row justify-content-around col-12">
                <asp:Button ID="BtnShowOrders" Class="btn btn-info btn-block" runat="server" Text="VIEW ALL ORDER LIST" OnClick="BtnShowOrders_Click"  />
            </div>
            <div class="row" id="gridItem3" runat="server">
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

        <div class="footer">
            <p>Sheridan Car Sales &copy; Copyright 2019. Developed by Hyun-Ju Woo & Minjung Park</p>
        </div>
    </form>
</body>
</html>

