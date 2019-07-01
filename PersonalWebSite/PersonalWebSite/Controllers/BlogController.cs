﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace PersonalWebSite.Controllers
{
    public class BlogController : Controller
    {
        Models.PersonalWebPageDBEntities db = new Models.PersonalWebPageDBEntities();

        public ActionResult Index()
        {
            return View();
        }
        public ActionResult BlogDetail()
        {
            return View();
        }
        [HttpGet]
        public ActionResult BlogList()
        {
            var model = db.Makale.ToList();
            return View(model);
        }
    }
}