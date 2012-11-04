﻿using System;

namespace EnduranceGoals.Models.ViewModels
{
    public partial class GoalViewModel
    {

        public int Id { get; set; }
        public string Description { get; set; }
        public string Name { get; set; }
        public string Web { get; set; }
        public DateTime CreatedOn { get; set; }
        public Sport Sport{ get; set; }
        public DateTime Date { get; set; }
    }
}