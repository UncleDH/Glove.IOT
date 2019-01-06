//------------------------------------------------------------------------------
// <auto-generated>
//    此代码是根据模板生成的。
//
//    手动更改此文件可能会导致应用程序中发生异常行为。
//    如果重新生成代码，则将覆盖对此文件的手动更改。
// </auto-generated>
//------------------------------------------------------------------------------

namespace Glove.IOT.Model
{
    using System;
    using System.Collections.Generic;
    
    [Serializable]
    public partial class DeviceInfo
    {
        public DeviceInfo()
        {
            this.IsDeleted = false;
            this.GroupInfoId = 1;
            this.DeviceParameterInfo = new HashSet<DeviceParameterInfo>();
        }
    
        public int Id { get; set; }
        public string DeviceId { get; set; }
        public bool IsDeleted { get; set; }
        public System.DateTime SubTime { get; set; }
        public int GroupInfoId { get; set; }
    
        public virtual ICollection<DeviceParameterInfo> DeviceParameterInfo { get; set; }
        public virtual GroupInfo GroupInfo { get; set; }
    }
}
