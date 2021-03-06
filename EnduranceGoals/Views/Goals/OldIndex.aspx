﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Smart.Master" Inherits="ViewPage<EnduranceGoals.Models.PaginatedList<EnduranceGoals.Models.ViewModels.GoalViewModel>>" %>

<%@ Import Namespace="EnduranceGoals.Models.ViewModels" %>
<asp:Content ID="Content4" ContentPlaceHolderID="JSHeader" runat="server">

    <script src="<%= Url.Content("~/Scripts/MicrosoftAjax.js") %>" type="text/javascript"></script>

    <script src="<%= Url.Content("~/Scripts/MicrosoftMvcAjax.js") %>" type="text/javascript"></script>

    <script type="text/javascript" src="<%= Url.Content("~/Content/js/Goals.js")%>"></script>
    <script type="text/javascript" src="<%= Url.Content("~/Content/js/jquery.tmpl.min.js")%>"></script>

</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="Map" runat="server">
    <%
        Html.RenderPartial("Map", Model);%>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Upcoming
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PartialTitle" runat="server">
    Upcoming Goals!
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <fieldset>
        <ul>
            <% foreach (var goal in Model)
               { %>
            <li><span class="display-label">
                <%= Html.Encode(String.Format("{0:D}: ", goal.Date)) %></span> <span>
                    <%= String.Format("{0} ({1})", goal.Name, goal.SportName) %>
                    <%= Html.ActionLink("details", "Details", new { id = goal.Id }, new { Class = "btn btn-micro btn-custom-info" })%>
                    <% if (goal.UserLoggedIn)
                       {%>
                    <%Html.RenderAction("SubscriptionStatus", "Membership", new { goalId = goal.Id }); %>
                    <% }%>
                </span>
                <% if (goal.UserCanModifyEvent)
                   {%>
                |
                <%= Html.ActionLink("edit", "edit", new { id = goal.Id }, new { Class = "btn btn-micro btn-custom-wantin" })%>
                <% if (goal.CanBeDeleted)
                   {%>
                |
                
                    <%= Html.ActionLink("delete", "delete", new { id = goal.Id }, new { Class = "btn btn-micro btn-danger" })%>
                <% } %>
                <% }%>
            </li>
            <% } %>
        </ul>
        <div id="pagination">
            <% if (Model.HasPreviousPage)
               {%>
            <% if (Model.PageIndex == 1)
               {%>
            <%= Html.RouteLink("previous", "Default")%>
            <% }%>
            <% else
                {%>
            <%= Html.RouteLink("previous", "GoalsPaginated", new { page = (Model.PageIndex - 1)}) %>
            <% }%>
            <% }%>
            <% if (Model.HasNextPage)
               {%>
            <%= Html.RouteLink("next", "GoalsPaginated", new { page = (Model.PageIndex + 1) })%>
            <% }%>
        </div>
    </fieldset>
</asp:Content>
