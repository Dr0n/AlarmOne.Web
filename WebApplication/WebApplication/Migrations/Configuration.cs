using System.Collections.Generic;
using System.Data.Entity.Migrations;

namespace WebApplication.Migrations
{
    internal sealed class Configuration : DbMigrationsConfiguration<EFContainer>
    {
        #region Constructors and Destructors

        public Configuration()
        {
            AutomaticMigrationsEnabled = false;
        }

        #endregion

        #region Methods

        protected override void Seed(EFContainer context)
        {
            context.AlarmItems.AddOrUpdate(
                x => x.Id,
                new AlarmItem() { Id = 1, Name = "TestAppOne", Status = Status.Complete },
                new AlarmItem() { Id = 2, Name = "TestProcessOne", Status = Status.Complete });

            context.Users.AddOrUpdate(
                x => x.Id,
                new User()
                {
                    Id = 1,
                    Name = "Maxim P",
                    AlarmItems = new List<AlarmItem>()
                                 {
                                     new AlarmItem() { Id = 1 },
                                     new AlarmItem() { Id = 2 }
                                 }
                },
                new User()
                {
                    Id = 2,
                    Name = "Andrew P",
                    AlarmItems = new List<AlarmItem>()
                                 {
                                     new AlarmItem() { Id = 1 },
                                     new AlarmItem() { Id = 2 }
                                 }
                });
            //  This method will be called after migrating to the latest version.

            //  You can use the DbSet<T>.AddOrUpdate() helper extension method 
            //  to avoid creating duplicate seed data. E.g.
            //
            //    context.People.AddOrUpdate(
            //      p => p.FullName,
            //      new Person { FullName = "Andrew Peters" },
            //      new Person { FullName = "Brice Lambson" },
            //      new Person { FullName = "Rowan Miller" }
            //    );
            //
        }

        #endregion
    }
}