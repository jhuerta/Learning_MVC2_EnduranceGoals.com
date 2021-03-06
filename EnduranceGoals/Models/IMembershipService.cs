﻿using System.Web.Security;

namespace EnduranceGoals.Models
{
    public interface IMembershipService
    {
        int MinPasswordLength { get; }

        bool ValidateUser(string userName, string password);
        MembershipCreateStatus CreateUser(string userName, string password, string email, string name, string lastname);
        bool ChangePassword(string userName, string oldPassword, string newPassword);
    }
}