using System;

namespace WebApplication.Models
{
    public class ErrorModel
    {
        #region Public Properties

        public int AlarmItemId { get; set; }

        public DateTime? Created { get; set; }

        public string Description { get; set; }

        public int Id { get; set; }

        public Status Status { get; set; }

        public DateTime Updated { get; set; }

        public int? ResponsibleUserId { get; set; }

        #endregion
    }
}