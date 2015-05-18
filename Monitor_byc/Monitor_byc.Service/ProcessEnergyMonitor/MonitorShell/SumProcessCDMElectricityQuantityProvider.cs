using SqlServerDataAdapter;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Monitor_byc.Service.ProcessEnergyMonitor.MonitorShell
{
    public class SumProcessCDMElectricityQuantityProvider : IDataItemProvider
    {private ISqlServerDataFactory _nxjcFactory;

    public SumProcessCDMElectricityQuantityProvider(string nxjcconnString)
        {
            _nxjcFactory = new SqlServerDataFactory(nxjcconnString);
        }

        public IEnumerable<DataItem> GetDataItem(string organizationId, params string[] variableIds)
        {
            IList<DataItem> results = new List<DataItem>();
            string queryString = @"SELECT D.OrganizationID,C.VariableId,C.CumulantClass,C.CumulantLastClass,C.CumulantDay,SUM(C.CumulantDay+D.TotalPeakValleyFlat) AS CumulantMonth
                                    FROM RealtimeIncrementCumulant AS C,
                                    (select A.OrganizationID,B.VariableId,SUM(B.TotalPeakValleyFlat) as TotalPeakValleyFlat
                                    from tz_Balance as A,balance_Energy as B
                                    where A.BalanceId=B.KeyId
                                    AND A.TimeStamp>=CONVERT(varchar(8),GETDATE(),20)+'01'
                                    group by A.OrganizationID,B.VariableId) AS D
                                    WHERE C.VariableId=D.VariableId 
                                    AND (C.VariableId='cement_CementOutput' OR C.VariableId='clinker_ClinkerOutput' OR C.VariableId='cementmill_ElectricityQuantity'
                                    OR C.VariableId='clinker_ElectricityQuantity' OR C.VariableId='clinker_PulverizedCoalInput')
                                    GROUP BY D.OrganizationID,C.VariableId,C.CumulantClass,C.CumulantLastClass,C.CumulantDay";
            DataTable dt = _nxjcFactory.Query(queryString);

            foreach (DataRow dr in dt.Rows)
            {
                DataItem itemClass = new DataItem
                {
                    ID = dr["OrganizationID"].ToString().Trim() + ">" + dr["VariableId"].ToString().Trim() + ">SumProcessClass",
                    Value = dr["CumulantClass"].ToString().Trim()
                };
                DataItem itemDay = new DataItem
                {
                    ID = dr["OrganizationID"].ToString().Trim() + ">" + dr["VariableId"].ToString().Trim() + ">SumProcessDay",
                    Value = dr["CumulantDay"].ToString().Trim()
                };
                DataItem itemMonth = new DataItem
                {
                    ID = dr["OrganizationID"].ToString().Trim() + ">" + dr["VariableId"].ToString().Trim() + ">SumProcessMonth",
                    Value = dr["CumulantMonth"].ToString().Trim()
                };
                results.Add(itemClass);
                results.Add(itemDay);
                results.Add(itemMonth);
            }

            return results;
        }
    }
}
