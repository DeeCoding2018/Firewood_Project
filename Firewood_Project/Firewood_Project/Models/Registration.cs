using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace Firewood_Project.Models
{
    public class Registration
    {
        [Required]
        public int Account_Number { get; set; }

        [Required][StringLength(20)]
        public string User_Name { get; set; }

        [Required][StringLength(20)]
        public string Password { get; set; }

        [Required][StringLength(20)]
        public string First_Name { get; set; }

        [Required][StringLength(20)]
        public string Last_Name { get; set; }

        [Required][StringLength(30)]
        public string Address { get; set; }

        [Required][StringLength(5)]
        public string Zip_Code { get; set; }

        [Required][StringLength(10)]
        public string Phone_Number { get; set; }

        [Required][StringLength(30)]
        public string Email_Address { get; set; }
    }
}