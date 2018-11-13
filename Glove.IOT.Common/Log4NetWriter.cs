﻿using log4net;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Glove.IOT.Common
{
    public class Log4NetWriter : ILogWriter
    {
        public void WriteLogInfo(string txt)
        {
            ILog logWrite = log4net.LogManager.GetLogger("Demo");
            logWrite.Error(txt);
        }
    }
}
