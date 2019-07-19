<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="CarSales.Registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Registration Page</title>
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
            margin: 10px;
            background-color: aliceblue;
        }

        #gridItem3 {
            grid-area: orderList;
            margin-bottom: 20px;
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

        #welcomeMsg {
            text-align: center;
            color: darkslategray;
        }
    </style>
</head>
<body>
    <form id="form3" runat="server">
        <div class="jumbotron">
            <h1>Sheridan Auto Trader</h1>
        </div>
        <div class="col-sm-2"></div>
        <div class="col-sm-8" id="grid-container">
            <div id="gridItem1">
                <h2>New Registration</h2>
                <table>
                    <tr>
                        <th>Customer Name:</th>
                        <td>
                            <asp:TextBox ID="txtcName" runat="server" Width="200px"></asp:TextBox></td>
                        <td>
                            <asp:RequiredFieldValidator ID="cName" runat="server"
                                ErrorMessage="You must enter your name."
                                ForeColor="Red"
                                ControlToValidate="txtcName" />
                        </td>
                    </tr>
                    <tr>
                        <th>Address:</th>
                        <td>
                            <asp:TextBox ID="txtcAddress" runat="server" Width="200px"></asp:TextBox></td>
                        <td>
                            <asp:RequiredFieldValidator ID="cAddress" runat="server"
                                ErrorMessage="You must enter your address."
                                ForeColor="Red"
                                ControlToValidate="txtcAddress" />
                        </td>
                    </tr>
                    <tr>
                        <th>Postal Code:</th>
                        <td>
                            <asp:TextBox ID="txtcPostalCode" runat="server" Width="200px"></asp:TextBox></td>
                        <td>
                            <asp:RegularExpressionValidator ID="cPostalCode" runat="server"
                                ControlToValidate="txtcPostalCode"
                                ErrorMessage="You must enter valid postal code format"
                                ForeColor="Red"
                                ValidationExpression="^[ABCEGHJKLMNPRSTVXY]{1}\d{1}[A-Z]{1} *\d{1}[A-Z]{1}\d{1}$"
                                ValidationGroup="PostalCodeValidator" />
                        </td>
                    </tr>
                    <tr>
                        <th>Phone Number:</th>
                        <td>
                            <asp:TextBox ID="txtcPhoneNumber" runat="server" Width="200px"></asp:TextBox></td>
                        <td>
                            <asp:RequiredFieldValidator ID="cPhoneNumber" runat="server"
                                                        ErrorMessage="You must enter your phone number."
                                                        ForeColor="Red"
                                                        ControlToValidate="txtcPhoneNumber" />
                        </td>
                    </tr>
                    <tr>
                        <th>Email:</th>
                        <td>
                            <asp:TextBox ID="txtcEmail" runat="server" Width="200px"></asp:TextBox></td>
                        <td>
                            <asp:RegularExpressionValidator ID="cEmail" runat="server"
                                                            ControlToValidate="txtcEmail"
                                                            ErrorMessage="You must enter valid postal code format"
                                                            ForeColor="Red"
                                                            ValidationExpression="^[\w\.-]+@[\w-]+\.[\w\.-]+$"
                                                            ValidationGroup="EmailValodator" />
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </form>
</body>
</html>
