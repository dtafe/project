﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using StockExchanges.Service;

namespace StockExchanges.Web.Controllers
{
    [Route("api/[controller]")]
    public class CategoryController : Controller
    {
        private readonly ICategoryService _categoryService;
        public CategoryController(ICategoryService categoryService)
        {
            _categoryService = categoryService;
        }
        [HttpGet("[action]")]
        public IActionResult GetAllCategories()
        {
            var categories = _categoryService.GetAll();
            return View();
        }
        [HttpGet("[action]")]
        public JsonResult GetFeatures()
        {
            var features = _categoryService.GetAll()
                        .Take(4)
                        .Select(c => new FeatureModel
                        {
                            Id = c.Id,
                            Category = c.Name,
                            Content = c.Posts != null ? c.Posts.OrderByDescending(x => x.CreatedDate).FirstOrDefault().Content : "",
                        });
            return Json(features);
        }
    }
}