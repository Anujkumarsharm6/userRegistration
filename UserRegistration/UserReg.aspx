<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserReg.aspx.cs" Inherits="UserRegistration.UserReg" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:HiddenField ID="hfuserid" runat="server" />
            <table>
                <tr>
                    <td>
                        <asp:Label ID="lblfirstName" runat="server" Text="First Name:" Font-Bold="true"></asp:Label>
                    </td>
                    <td colspan="2">
                        <asp:TextBox ID="txtfirstName" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lbllastname" runat="server" Text="Last Name:" Font-Bold="true"></asp:Label>
                    </td>
                    <td colspan="2">
                        <asp:TextBox ID="txtlastname" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblcontact" runat="server" Font-Bold="true" Text="Contact:"></asp:Label>
                    </td>
                    <td colspan="2">
                        <asp:TextBox ID="txtcontact" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblGender" runat="server" Text="Gender:" Font-Bold="true"></asp:Label>
                    </td>
                    <td colspan="2">
                        <asp:DropDownList ID="ddlgender" runat="server">
                            <asp:ListItem>Male</asp:ListItem>
                            <asp:ListItem>Female</asp:ListItem>
                            <asp:ListItem>Others</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lbladdress" runat="server" Font-Bold="true" Text="Address:"></asp:Label>
                    </td>
                    <td colspan="2">
                        <asp:TextBox ID="txtaddress" runat="server" TextMode="MultiLine"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="3">
                        <hr />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblusername" runat="server" Text="User Name:" Font-Bold="true"></asp:Label>
                    </td>
                    <td colspan="2">
                        <asp:TextBox ID="txtusername" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfdusername" runat="server" ErrorMessage="*" ControlToValidate="txtusername" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblpassword" runat="server" Text="Password:" Font-Bold="true"></asp:Label>
                    </td>
                    <td colspan="2">
                        <asp:TextBox ID="txtpassword" runat="server" TextMode="Password"></asp:TextBox>
                        
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblconfirmpassword" runat="server" Font-Bold="true" Text="Confirm Password:"></asp:Label>
                    </td>
                    <td colspan="2">
                        <asp:TextBox ID="txtconfirmpassord" runat="server"></asp:TextBox>
                        
                        
                    </td>
                </tr>
                <tr>
                    <td>

                    </td>
                    <td>
                        <asp:Button ID="btnsubmit" runat="server" Text="Submit" OnClick="btnsubmit_Click" />
                    </td>
                </tr>
                <tr>
                    <td>

                    </td>
                    <td colspan="2">
                        <asp:Label ID="lblsuccessmessage" runat="server" ForeColor="Green"></asp:Label>
                    </td>
                </tr>
                 <tr>
                    <td>

                    </td>
                    <td colspan="2">
                        <asp:Label ID="lblerrormessage" runat="server" ForeColor="Red"></asp:Label>
                    </td>
                </tr>

            </table>
        </div>
    </form>
</body>
</html>
