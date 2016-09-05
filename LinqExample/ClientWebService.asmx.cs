using System.Data.SqlClient;
using System.Web.Services;
using System.Data;
using System.Configuration;

namespace LinqExample
{
    /// <summary>
    /// Summary description for ClientWebService
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class ClientWebService : WebService
    {
        [WebMethod]
        public int GetClientList()
        {
            int res = 0;

            using (var con = new SqlConnection(ConfigurationManager.ConnectionStrings["UsersListConnectionString"].ConnectionString))
            {
                using (var cmd = new SqlCommand("Select * FROM Users", con))
                {
                    if (con.State != ConnectionState.Open)
                    {
                        con.Open();
                    }
                    SqlDataReader reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        res = int.Parse(reader[0].ToString());
                    }
                    reader.Close();
                }
            }
            return res;
        }

        [WebMethod]
        public int InsertTestingData()
        {
            int res = 0;

            using (var con = new SqlConnection(ConfigurationManager.ConnectionStrings["UsersListConnectionString"].ConnectionString))
            {
                using (var cmd = new SqlCommand("InsertTestingData", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    if (con.State != ConnectionState.Open)
                    {
                        con.Open();
                    }

                    res = cmd.ExecuteNonQuery();
                }
            }
            return res;
        }

        [WebMethod]
        public DataSet GetClientById(int clientId)
        {
            DataSet ds = new DataSet();

            using (
                SqlConnection con =
                    new SqlConnection(
                        ConfigurationManager.ConnectionStrings["UsersListConnectionString"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("GetClientById", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("ClientId", SqlDbType.Int).Value = clientId;
                    if (con.State != ConnectionState.Open)
                    {
                        con.Open();
                    }
                    SqlDataAdapter adp = new SqlDataAdapter {SelectCommand = cmd};
                    adp.Fill(ds);
                    if (con.State == ConnectionState.Open)
                    {
                        con.Close();
                    }
                }
            }
            return ds;
        }

        [WebMethod]
        public int GetClientIdByNameAndAddress(string clientName, string clientAddress)
        {
            int res = 0;

            using ( var con = new SqlConnection(ConfigurationManager.ConnectionStrings["UsersListConnectionString"].ConnectionString))
            {
                using (var cmd = new SqlCommand("Select UserId FROM Users WHERE UserName = '" + clientName + "' AND UserEmail = '" + clientAddress + "'", con))
                {
                    if (con.State != ConnectionState.Open)
                    {
                        con.Open();
                    }
                    SqlDataReader reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        res = int.Parse(reader[0].ToString());
                    }
                    reader.Close();
                }
            }
            return res;
        }

        [WebMethod]
        public int InsertClient(string clientName, string clientAddress)
        {
            int res;
            using (var con =
                    new SqlConnection(
                        ConfigurationManager.ConnectionStrings["UsersListConnectionString"].ConnectionString))
            {
                using (var cmd = new SqlCommand("InsertClient", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("ClientName", SqlDbType.VarChar).Value = clientName;
                    cmd.Parameters.Add("ClientAddress", SqlDbType.VarChar).Value = clientAddress;

                    if (con.State != ConnectionState.Open)
                    {
                        con.Open();
                    }

                    res = cmd.ExecuteNonQuery();
                }
            }
            return res;
        }

        [WebMethod]
        public int InsertOrder(int clientId, string orderDate, int amount)
        {
            int res;
            using (
                var con =
                    new SqlConnection(
                        ConfigurationManager.ConnectionStrings["UsersListConnectionString"].ConnectionString))
            {
                using (var cmd = new SqlCommand("InsertOrder", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("ClientId", SqlDbType.Int).Value = clientId;
                    cmd.Parameters.Add("Date", SqlDbType.Date).Value = orderDate;
                    cmd.Parameters.Add("Amount", SqlDbType.Int).Value = amount;

                    if (con.State != ConnectionState.Open)
                    {
                        con.Open();
                    }
                    if (con.State == ConnectionState.Open)
                    {
                        con.Close();
                    }
                    res = cmd.ExecuteNonQuery();
                }
            }
            return res;
        }
    }
}
