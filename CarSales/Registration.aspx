<!-- Author: Min Jung Park (991495289) on July-20-2019 -->

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="CarSales.Registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Registration Page</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <script>
        function SetTxtcPhoneNumber() {
            var phoneNum = document.getElementById("txtcPhoneNumber").value;
            if (phoneNum.length == 10)
                txtcPhoneNumber.value = "(" + phoneNum.substr(0, 3) + ") " + phoneNum.substr(3, 3) + "-" + phoneNum.substr(6);
        }
        function SetTxtcPostalCode() {
            var postalCode = document.getElementById("txtcPostalCode").value;
           if (postalCode.charAt(3) != " ")
                postalCode = postalCode.substr(0, 3) + " " + postalCode.substr(3);
            txtcPostalCode.value = postalCode.toUpperCase();
        }
    </script>

    <style>
        .jumbotron {
            background-color: darkcyan;
            color: white;
            margin: 0px;
            padding-bottom: 5px;
            padding-left: 20px;
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

        table {
            width: 100%;
        }

        td {
            padding: 2px;
        }

        #welcomeMsg {
            text-align: center;
            color: darkslategray;
        }

        #BtnRegister {
            width: 200px;
        }
    </style>
</head>
<body>
    <form id="form3" runat="server">
        <div class="jumbotron">
            <h1>Sheridan Auto Trader</h1>
            <h3 id="welcomeMsg">Welcome to the "Sheridan Car Sales"! </h3>
        </div>
        <div class="container">
            <div class="row col-12">
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
                                ControlToValidate="txtcName"
                                ValidationGroup="RegistraterGroup" />
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
                                ControlToValidate="txtcAddress"
                                ValidationGroup="RegistraterGroup" />
                        </td>
                    </tr>
                    <tr>
                        <th>Postal Code:</th>
                        <td>
                            <asp:TextBox ID="txtcPostalCode" runat="server" Width="200px" onblur="SetTxtcPostalCode()"></asp:TextBox></td>
                        <td>
                             <asp:RequiredFieldValidator ID="cPostalCode_0" runat="server"
                                ErrorMessage="You must enter your postal code"
                                ControlToValidate="txtcPostalCode"
                                 ForeColor="Red"
                                ValidationGroup="RegistraterGroup" />
                            <asp:RegularExpressionValidator ID="cPostalCode" runat="server"
                                ControlToValidate="txtcPostalCode"
                                ErrorMessage="You must enter valid postal code format"
                                ForeColor="Red"                                
                                ValidationGroup="RegistraterGroup" />
                        </td>
                    </tr>
                    <tr>
                        <th>Phone Number:</th>
                        <td>
                            <asp:TextBox ID="txtcPhoneNumber" runat="server" Width="200px"
                                onblur="SetTxtcPhoneNumber()"></asp:TextBox></td>
                        <td>
                            <asp:RequiredFieldValidator ID="cPhoneNumber_0" runat="server"
                                ErrorMessage="You must enter your phone number"
                                ControlToValidate="txtcPhoneNumber"
                                ForeColor="Red"
                                ValidationGroup="RegistraterGroup" />
                            <asp:RegularExpressionValidator ID="cPhoneNumber" runat="server"
                                ControlToValidate="txtcPhoneNumber"
                                ErrorMessage="You must enter the number only."
                                ForeColor="Red"
                                ValidationExpression="^\d+?$" />
                        </td>
                    </tr>
                    <tr>
                        <th>Email:</th>
                        <td>
                            <asp:TextBox ID="txtcEmail" runat="server" Width="200px"></asp:TextBox></td>
                        <td>
                            <asp:RequiredFieldValidator ID="cEmail_0" runat="server"
                                ErrorMessage="You must enter your email"
                                ControlToValidate="txtcEmail"
                                ForeColor="Red"
                                ValidationGroup="RegistraterGroup" />
                            <asp:RegularExpressionValidator ID="cEmail" runat="server"
                                ControlToValidate="txtcEmail"
                                ErrorMessage="You must enter valid email format"
                                ForeColor="Red"
                                ValidationExpression="^[\w\.-]+@[\w-]+\.[\w\.-]+$"
                                ValidationGroup="RegistraterGroup" />
                        </td>
                    </tr>
                    <tr>
                        <th>Email (Confirm):</th>
                        <td>
                            <asp:TextBox ID="txtcEmail2" runat="server" Width="200px"></asp:TextBox></td>
                        <td>
                            <asp:RequiredFieldValidator ID="cEmail2_0" runat="server"
                                ErrorMessage="You must enter your email again"
                                ControlToValidate="txtcEmail2"
                                ForeColor="Red"
                                ValidationGroup="RegistraterGroup" />
                            <asp:CompareValidator ID="cEmail2" runat="server"
                                ControlToValidate="txtcEmail2"
                                ControlToCompare="txtcEmail"
                                ErrorMessage="It must match with your email"
                                ForeColor="Red"
                                ValidationGroup="RegistraterGroup" />
                        </td>
                    </tr>
                    <tr>
                        <th>Password:</th>
                        <td>
                            <asp:TextBox ID="txtcPassword" runat="server" Width="200px" type="password"></asp:TextBox></td>
                        <td>
                            <asp:RequiredFieldValidator ID="cPassword_0" runat="server"
                                ErrorMessage="You must enter your password"
                                ControlToValidate="txtcPassword"
                                ForeColor="Red"
                                ValidationGroup="RegistraterGroup" />
                            <asp:RegularExpressionValidator ID="cPassword" runat="server"
                                ControlToValidate="txtcPassword"
                                ErrorMessage="Password must be between 4 and 8 digits long and include at least one numeric digit"
                                ValidationExpression="^(?=.*\d).{4,8}$"
                                ForeColor="Red"
                                ValidationGroup="RegistraterGroup" />
                        </td>
                    </tr>
                    <tr>
                        <th>Password (Confirm):</th>
                        <td>
                            <asp:TextBox ID="txtcPassword2" runat="server" Width="200px" type="password"></asp:TextBox></td>
                        <td>
                            <asp:RequiredFieldValidator ID="cPassword2_0" runat="server"
                                ErrorMessage="You must enter your password again"
                                ControlToValidate="txtcPassword2"
                                ForeColor="Red"
                                ValidationGroup="RegistraterGroup" />
                            <asp:CompareValidator ID="cPassword2" runat="server"
                                ControlToValidate="txtcPassword2"
                                ControlToCompare="txtcPassword"
                                ErrorMessage="It must match with your password"
                                ForeColor="Red"
                                ValidationGroup="RegistraterGroup" />
                        </td>
                    </tr>
                    <tr>
                        <th></th>
                        <td>
                            <asp:Button ID="BtnRegister" CssClass="btn btn-info" runat="server" Text="Register" OnClick="BtnRegister_Click" ValidationGroup="RegistraterGroup" /></td>
                        <td>
                            <asp:Label ID="registerMsg" runat="server"></asp:Label>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <div class="footer">
            <p>Sheridan Car Sales &copy; Copyright 2019. Developed by Hyun-Ju Woo & Minjung Park</p>
        </div>
    </form>
</body>
</html>
