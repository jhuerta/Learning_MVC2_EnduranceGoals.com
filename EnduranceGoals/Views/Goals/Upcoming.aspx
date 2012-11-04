﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<EnduranceGoals.Models.Goal>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Upcoming
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<fieldset>
        <legend>Upcoming Goals</legend>
        <ul>
            <% foreach (var goal in Model) { %>
            <li>
                <span class="display-label"><%= Html.Encode(String.Format("{0:D}: ", goal.Date)) %></span>
                <span class="display-field">
                    <%= String.Format("{0} ({1})", goal.Name, goal.Sport) %>
                    <%= Html.ActionLink(" more", "Details", new { id=goal.Id})%>
                     | 
                    <%= Html.ActionLink("edit", "edit", new { id=goal.Id})%>
                   <% if(goal.Participants.Count == 0) {%>   | 
                    <%= Html.ActionLink("delete", "delete", new { id=goal.Id})%>
                    <% } %>
                </span></li>
            <% } %>
            </ul>
            
            <b><%= Html.ActionLink("Add Goal", "create", "Goals")%></b>
                </fieldset>
</asp:Content>