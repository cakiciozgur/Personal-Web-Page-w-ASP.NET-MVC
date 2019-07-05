﻿using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Helpers;
using System.Web.Mvc;
using System.Web.Security;
using PersonalWebSite.Models;

namespace PersonalWebSite.Controllers
{
    public class UserController : Controller
    {
        Models.PersonalWebPageDBEntities db = new Models.PersonalWebPageDBEntities();
        [HttpGet]
        public ActionResult UserList()
        {
            var model = db.Uye.ToList();
            return View(model);
        }

        public ActionResult Register()
        {
            return View(new Models.Uye());
        }

        [HttpGet]
        public ActionResult Registration()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Registration(FormCollection f)
        {
            Uye u = new Uye();
            UyeDetay ud = new UyeDetay();

            u.adSoyad = f["adSoyad"].Trim();
            u.uyeDetayBilgiID = ud.uyeDetayBilgiID;
            u.rolID = 2;
            db.Uye.Add(u);

            ud.kullaniciAdi = f["kullaniciAdi"].Trim();
            ud.eMail = f["eMail"].Trim();
            ud.sifre = f["sifre"].Trim();
            db.UyeDetay.Add(ud);

            db.SaveChanges();
            return RedirectToAction("Login", "Security");
        }
        public ActionResult UserProfile(int id)
        {
            var user = db.Uye.Find(id);
            return View("UserProfile", user);
        }
        public ActionResult UpdateUser(Uye uye)
        {
            var UpdateModel = db.Uye.Find(uye.uyeID);

            UpdateModel.adSoyad = uye.adSoyad;
            UpdateModel.uyeDetayBilgiID = uye.uyeDetayBilgiID;
            UpdateModel.UyeDetay.kullaniciAdi = uye.UyeDetay.kullaniciAdi;
            UpdateModel.UyeDetay.eMail = uye.UyeDetay.eMail;
            UpdateModel.UyeDetay.sifre = uye.UyeDetay.sifre;

            db.SaveChanges();
            return View("UserProfile",UpdateModel);
        }
        
        public ActionResult RemoveUser(int id)
        {
            var RemoveUser = db.Uye.Find(id);
            var RemoveUserDetail = db.UyeDetay.Find(RemoveUser.uyeDetayBilgiID);
            foreach (var yorum in RemoveUser.Yorum.ToList())
            {
                db.Yorum.Remove(yorum);

            }
            db.Uye.Remove(RemoveUser);
            db.UyeDetay.Remove(RemoveUserDetail);
            db.SaveChanges();
            return RedirectToAction("UserList");
        }


    }
}