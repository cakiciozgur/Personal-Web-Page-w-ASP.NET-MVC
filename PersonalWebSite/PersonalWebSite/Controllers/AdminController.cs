﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Helpers;
using System.IO;
using PersonalWebSite.Models;


namespace PersonalWebSite.Controllers
{
    [Authorize(Roles = "Admin")]
    public class AdminController : Controller
    {
        Models.PersonalWebPageDBEntities1 db = new Models.PersonalWebPageDBEntities1();
        public ActionResult Index()
        {
            var model = db.Makale.ToList();
            return View(model);
        }


        // FOR User
        public ActionResult Users()
        {
            var model = db.Uye.ToList();
            return View(model);
        }
        public int TotalUsers()
        {
            return db.Uye.Count();
        }
        public ActionResult RemoveUser(int id)
        {
            var RemoveUser = db.Uye.Find(id);
            var RemoveUserDetail = db.UyeDetay.Find(RemoveUser.uyeDetayBilgiID);
            if ((RemoveUser != null) && (RemoveUserDetail != null))
            {
                db.Uye.Remove(RemoveUser);
                db.UyeDetay.Remove(RemoveUserDetail);
                db.SaveChanges();
                return RedirectToAction("Users");
            }
            else
            {
                ViewBag.UserHataMesajı = "Kullanıcı Silinemedi!";
                return RedirectToAction("Users");
            }

        }




        // FOR Works
        public ActionResult Works()
        {
            return View();
        }
        public int TotalWorks()
        {
            return db.Proje.Count();
        }
        public ActionResult WorksList()
        {
            var model = db.Proje.ToList();
            return View(model);
        }
        public ActionResult GetWorkDetailByID(int id)
        {
            var UpdateModel = db.Proje.Find(id);
            return View("Works", UpdateModel);
        }
        public ActionResult UpdateAndAddWorks(Proje proje)
        {
                if (proje.projeID == 0)// YENİ KAYIT EKLENECEĞİNDE ÇALIŞIR
                {
                    db.Proje.Add(proje);
                }
                else // KAYIT GÜNCELLENECEĞİNDE ÇALIŞIR
                {
                    var Eskimodel = db.Proje.Find(proje.projeID);
                    Eskimodel.projeBaslik = proje.projeBaslik;
                    Eskimodel.projeLink = proje.projeLink;
                }
                db.SaveChanges();
                return RedirectToAction("WorksList");
        }
        public ActionResult RemoveProject(int id)
        {
            var RemoveProject = db.Proje.Find(id);
            if (RemoveProject != null)
            {
                db.Proje.Remove(RemoveProject);
                db.SaveChanges();
                return RedirectToAction("WorksList");
            }
            else
            {
                ViewBag.ProjeHataMesajı = "Proje Silinemedi!";
                return RedirectToAction("WorksList");
            }

        }



        // FOR Blog
        public ActionResult AddBlog()
        {
            List<SelectListItem> kategoriler = (from i in db.Kategori.ToList()
                                                select new SelectListItem
                                                {
                                                    Text = i.kategori1,
                                                    Value = i.kategoriID.ToString()
                                                }).ToList();
            ViewBag.ktgr = kategoriler;
            return View();
        }
        public int TotalBlogs()
        {
            return db.Makale.Count();
        }
        public ActionResult BlogsList()
        {
            var model = db.Makale.ToList();
            return View(model);
        }
        public ActionResult GetBlogDetailByID(int id)
        {
            var UpdateModel = db.Makale.Find(id);
            List<SelectListItem> kategoriler = (from i in db.Kategori.ToList()
                                                select new SelectListItem
                                                {
                                                    Text = i.kategori1,
                                                    Value = i.kategoriID.ToString()
                                                }).ToList();
            ViewBag.ktgr = kategoriler;
            return View("AddBlog", UpdateModel);

        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult UpdateAndAddBlog(Makale makale)
        {
            var ktgr = db.Kategori.Where(m => m.kategoriID == makale.Kategori.kategoriID).FirstOrDefault();
            if (makale.makaleID == 0)// YENİ KAYIT EKLENECEĞİNDE ÇALIŞIR
            {
                makale.Kategori = ktgr;
                makale.MakaleDetay.yayınlanmaTarihi = DateTime.Now;
                makale.MakaleDetay.goruntulenmeSayisi = 0;
                makale.MakaleDetay.fotograf = "blogger.jpg";
                db.Makale.Add(makale);
                TempData["makaleEklemeMesaji"] = "Blog Added With Successful";
            }
            else// GÜNCELLEME İŞLEMİ YAPILACAĞINDA ÇALIŞIR
            {
                var Eskimodel = db.Makale.Find(makale.makaleID);
                Eskimodel.MakaleDetay.baslik = makale.MakaleDetay.baslik;
                Eskimodel.MakaleDetay.icerik = makale.MakaleDetay.icerik;
                Eskimodel.MakaleDetay.yayınlanmaTarihi = makale.MakaleDetay.yayınlanmaTarihi;
                Eskimodel.MakaleDetay.goruntulenmeSayisi = makale.MakaleDetay.goruntulenmeSayisi;
                Eskimodel.kategoriID = ktgr.kategoriID;
                TempData["makaleGuncellemeMesaji"] = "Blog Updated With Successful";
            }
            db.SaveChanges();
            return RedirectToAction("BlogsList");
        }
        public ActionResult RemoveBlog(int id)
        {
            var RemoveBlog = db.Makale.Find(id);
            var RemoveBlogDetail = db.MakaleDetay.Find(RemoveBlog.makaleDetayID);
            if (RemoveBlog != null && RemoveBlogDetail!=null)
            {
                foreach (var yorum in RemoveBlog.Yorum.ToList())
                {
                    db.Yorum.Remove(yorum);
                }
                db.Makale.Remove(RemoveBlog);
                db.MakaleDetay.Remove(RemoveBlogDetail);
                db.SaveChanges();
                return RedirectToAction("BlogsList");
            }
            else
            {
                ViewBag.blogHataMesajı = "Makale Silinemedi!";
                return RedirectToAction("BlogsList");
            }
        }





         // FOR Comment
        public ActionResult CommentsList()
        {
            var model = db.Yorum.ToList();
            return View(model);
        }
        public int TotalComments()
        {
            return db.Yorum.Count();
        }
        public ActionResult RemoveComment(int id)
        {
            var RemoveComment = db.Yorum.Find(id);
            if (RemoveComment != null)
            {
                db.Yorum.Remove(RemoveComment);
                db.SaveChanges();
                return RedirectToAction("CommentsList");
            }
            else
            {
                ViewBag.commentHataMesajı = "Yorum Silinemedi!";
                return RedirectToAction("CommentsList");
            }
        }


        //For Kategori
        public ActionResult Categories()
        {
            return View();
        }
        public int TotalCategories()
        {
            return db.Kategori.Count();
        }
        public ActionResult CategoryList()
        {
            var model = db.Kategori.ToList();
            return View(model);
        }
        public ActionResult GetCategoryDetailByID(int id)
        {
            var UpdateModel = db.Kategori.Find(id);
            return View("Categories", UpdateModel);
        }
        public ActionResult UpdateAndAddCategory(Kategori kategori)
        {
            if (kategori.kategoriID == 0)// YENİ KAYIT EKLENECEĞİNDE ÇALIŞIR
            {
                db.Kategori.Add(kategori);
            }
            else  // KAYIT GÜNCELLENECEĞİNDE ÇALIŞIR
            {
                var Eskimodel = db.Kategori.Find(kategori.kategoriID);
                Eskimodel.kategori1 = kategori.kategori1;
            }
            db.SaveChanges();
            return RedirectToAction("CategoryList");
        }
        public ActionResult RemoveCategory(int id)
        {
            var RemoveCategory = db.Kategori.Find(id);
            if (RemoveCategory != null)
            {
                if(RemoveCategory.Makale.Count==0)
                {
                    db.Kategori.Remove(RemoveCategory);
                    db.SaveChanges();
                    ViewBag.KategoriHataMesajı = RemoveCategory.kategori1 +" Adlı Kategori Başarıyla Silindi";
                    return RedirectToAction("CategoryList");
                }
                else
                {
                    ViewBag.KategoriHataMesajı = "Kategoriye Ait Makale Bulunduğu için Bu Kategori Silinemedi!";
                    return RedirectToAction("CategoryList");
                }

            }
            else
            {
                ViewBag.KategoriHataMesajı = "Kategori Silinemedi!";
                return RedirectToAction("CategoryList");
            }

        }

    }
}