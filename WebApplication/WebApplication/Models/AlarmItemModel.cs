﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace WebApplication.Models
{
    public class AlarmItemModel
    {
        public int Id { get; set; }

        [Required]
        public string Name { get; set; }
        [Required]
        public Status Status { get; set; }
    }
}