﻿using Monitor_byc.Infrastructure.Configuration;
using SqlServerDataAdapter;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Monitor_byc.Service.Alarm
{
    public static class AlarmService
    {
        /// <summary>
        /// 根据组织机构ID获得十天实时报警信息
        /// </summary>
        /// <param name="organizationId">组织机构ID</param>
        /// <returns></returns>
        public static DataTable GetRealtimeAlarmByOrganizationId(string organizationId)
        {
            string connectionstring=ConnectionStringFactory.NXJCConnectionString;
            SqlServerDataFactory _dataFactory = new SqlServerDataFactory(connectionstring);
            string SqlStr = @"SELECT ST.OrganizationID,SE.Name 
                                FROM system_TenDaysRealtimeAlarm AS ST,
                                shift_EnergyConsumptionAlarmLog AS SE
                                WHERE ST.KeyId=SE.EnergyConsumptionAlarmLogID AND
                                ST.AlarmType='EnergyConsumption' AND
                                ST.Eanbled='true' AND
								ST.OrganizationID IN (
								   SELECT SO.OrganizationID FROM system_Organization AS SO
								   WHERE SO.LevelCode LIKE (
								         SELECT LevelCode FROM system_Organization WHERE OrganizationID=@organizationId)+'%'
										 )
                            ";
            SqlParameter parameter = new SqlParameter("OrganizationID", organizationId);
            DataTable resultTable= _dataFactory.Query(SqlStr,parameter);
            return resultTable;
        }
    }
}
