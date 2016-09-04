using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LinqExample
{
    public class Client
    {
        public int Id { get; set; }
        public string ClientName { get; set; }
        public string ClientAddress { get; set; }

        public Client(int id, string clientName, string clientAddress)
        {
            Id = id;
            ClientName = clientName;
            ClientAddress = clientAddress;
        }
    }
}