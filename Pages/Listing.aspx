<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Listing.aspx.cs" Inherits="BookStore.Pages.Listing"
    MasterPageFile="~/Pages/Store.Master" %>
<%@ Import Namespace="System.Web.Routing" %>

<asp:Content ContentPlaceHolderID="bodyContent" runat="server">
    <div id="content">
        <asp:Repeater ItemType="BookStore.Models.Book"
            SelectMethod="GetBooks" runat="server">
            <ItemTemplate>
                <div class="item">
                    <h3><%# Item.NameBook %></h3>



                <!--<div class="form-group">

        <div class="pull-left" style="margin-right: 10px">
            <img class="img-thumbnail" width="150" height="150"
                 src="@Url.Action("GetImage", "Book",
                new { Model.GameId })" />
        </div>
                        <!--<img src"C:\BookStore\Images\Witcher.jpg" alt="" />
                    <img class="img-thumbnail" src="@Url.Action("GetImage", "Book", new { Model.ImageData })" />
                </div>-->



                    <%# Item.Author %>
                    <h4><%# Item.Price.ToString("c") %></h4>
                    <button name="add" type="submit" value="<%# Item.BookId %>">
                        В корзину
                    </button>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
    <div class="pager">
        <%
            for (int i = 1; i <= MaxPage; i++)
            {
                string category = (string)Page.RouteData.Values["category"]
                    ?? Request.QueryString["category"];
                
                string path = RouteTable.Routes.GetVirtualPath(null, null,
                    new RouteValueDictionary() { {"category", category}, { "page", i } }).VirtualPath;
                Response.Write(
                    String.Format("<a href='{0}' {1}>{2}</a>",
                        path, i == CurrentPage ? "class='selected'" : "", i));
            }
        %>
    </div>
</asp:Content>
