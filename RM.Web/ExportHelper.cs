using Aspose.Cells;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Web;

namespace RM.Web
{
    public static class ExportHelper
    {


        [MethodImpl(MethodImplOptions.Synchronized)]
        public static bool OfflineDraw(System.Web.UI.Page page, DataTable _dt)
        {
            bool result = false;

            DateTime exportDate = System.DateTime.Now;

            Aspose.Cells.Workbook newbook = new Workbook();
            Worksheet sheet = newbook.GetSheet(true, 0);

            //写入标题
            sheet.Cells[0, 0].PutValue("订单号");
            sheet.Cells[0, 1].PutValue("订单时间");
            sheet.Cells[0, 2].PutValue("活动名称");
            sheet.Cells[0, 3].PutValue("商家名称");
            sheet.Cells[0, 4].PutValue("产品名称");
            sheet.Cells[0, 5].PutValue("收货人");
            sheet.Cells[0, 6].PutValue("收货人电话");
            sheet.Cells[0, 7].PutValue("收货地址");
            sheet.Cells[0, 8].PutValue("会员账号");
            sheet.Cells[0, 9].PutValue("备注");
            sheet.Cells[0, 10].PutValue("物流公司");
            sheet.Cells[0, 11].PutValue("物流编号");

            Style style = sheet.Cells[0, 0].GetStyle();
            style.Number = 49;//设置成文本格式
            //sheet.Cells[0,0,10000,0].SetStyle(style);



            ////设置样式，不是格式
            //Aspose.Cells.Style s = newbook.Styles[newbook.Styles.Add()];

            //s.Font.Color = Color.Red;
            //s.ForegroundColor = Color.Yellow;//Color.Yellow;  
            //s.Pattern = Aspose.Cells.BackgroundType.Solid;

            Aspose.Cells.Range r = sheet.Cells.CreateRange(0, 0, 10000, 1);//设置订单号的单元格格式
            r.SetStyle(style);

            r = sheet.Cells.CreateRange(0, 11, 10000, 1);//设置物流编号的单元格格式
            r.SetStyle(style);




            //写入数据
            //for (int i = 0; i < data.Count; i++)
            //{

            //    sheet.Cells[1 + i, 0].PutValue(data[i].OrderNo);
            //    sheet.Cells[1 + i, 1].PutValue(data[i].CreateTime.ToString("yyyy-MM-dd HH:mm:ss"));
            //    sheet.Cells[1 + i, 2].PutValue(data[i].ActiveTitle);
            //    sheet.Cells[1 + i, 3].PutValue(data[i].StoreName);
            //    sheet.Cells[1 + i, 4].PutValue(data[i].ProductName);

            //    string[] arr = data[i].shippingAddress.ToString().Split('|');
            //    if (arr.Length == 3)
            //    {
            //        sheet.Cells[1 + i, 5].PutValue(arr[0]);
            //        sheet.Cells[1 + i, 6].PutValue(arr[1]);
            //        sheet.Cells[1 + i, 7].PutValue(arr[2]);
            //    }
            //    sheet.Cells[1 + i, 8].PutValue(data[i].LoginName);

            //    if (data[i].LogisticsDesc != null)
            //    {
            //        string[] arr2 = data[i].LogisticsDesc.Split('|');
            //        if (arr2.Length == 4)
            //        {
            //            sheet.Cells[1 + i, 10].PutValue(arr2[3]);
            //            sheet.Cells[1 + i, 11].PutValue(arr2[0]);
            //        }
            //    }






            //}

            sheet.AutoFitColumns();
            try
            {
                //page.Server.UrlEncode(
                newbook.Save(page.Response, "订单导出_" + exportDate.ToString("yyyyMMdd_HHmmss") + ".xls", ContentDisposition.Attachment, new XlsSaveOptions(SaveFormat.Auto));
                result = true;
            }
            catch { }
            if (result)
            {
                //return instance.Update<DATFactoryInvoice>(data); //更新导出状态

            }
            return result;
        }

        /// <summary>
        /// 获取Sheet
        /// </summary>
        /// <param name="book">Workbook</param>
        /// <param name="createMode">是否创建Sheet</param>
        /// <param name="index">索引值</param>
        /// <param name="templateIndex">模版Sheet索引</param>
        /// <returns>返回Sheet</returns>
        public static Worksheet GetSheet(this Workbook book, bool createMode = false, int index = 0, int templateIndex = -1)
        {
            if (!createMode)
            {
                if (index < book.Worksheets.Count)
                    return book.Worksheets[index];
                else
                    return null;
            }
            else
            {
                while (index >= book.Worksheets.Count)
                {
                    if (templateIndex >= 0)
                        book.Worksheets.AddCopy(templateIndex);
                    else
                        book.Worksheets.Add();
                }
                return book.Worksheets[index];
            }
        }


    }
}