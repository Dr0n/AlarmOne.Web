using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web;
using System.Web.Http;
using WebApplication.Models;

namespace WebApplication.Controllers
{
    public class ErrorController : ApiController
    {
        private EFContainer db = new EFContainer();

        // GET api/Error
        public IEnumerable<ErrorModel> GetErrorModels()
        {
            return db.ErrorModels.AsEnumerable();
        }

        // GET api/Error/5
        public ErrorModel GetErrorModel(int id)
        {
            ErrorModel errormodel = db.ErrorModels.Find(id);
            if (errormodel == null)
            {
                throw new HttpResponseException(Request.CreateResponse(HttpStatusCode.NotFound));
            }

            return errormodel;
        }

        // POST api/Error
        public HttpResponseMessage AddError(ErrorModel errormodel)
        {
            errormodel.AlarmItemId
            var errorEntity = db.Errors.FirstOrDefault(error => error.AlarmItem_Id == errormodel.AlarmItemId && error.Status != (int)Status.Complete);
            if (errorEntity == null)
            {
                this.db.Errors.Add();
            }
        }



        // POST api/Error
        public HttpResponseMessage PostErrorModel(ErrorModel errormodel)
        {
            if (ModelState.IsValid)
            {
                //TODO
                db.ErrorModels.Add(errormodel);
                db.SaveChanges();

                HttpResponseMessage response = Request.CreateResponse(HttpStatusCode.Created, errormodel);
                response.Headers.Location = new Uri(Url.Link("DefaultApi", new { id = errormodel.Id }));
                return response;
            }
            else
            {
                return Request.CreateErrorResponse(HttpStatusCode.BadRequest, ModelState);
            }
        }

        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }
    }
}