﻿using Glove.IOT.WebAPI.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Controllers;
using System.Web.Http.Cors;

namespace Glove.IOT.WebAPI.Controllers
{
    //[RequestAuthorize]
    [EnableCors(origins:"*",headers:"*",methods:"*")]
    public class BaseController : ApiController
    {
    }
}
