using System;
using System.IO;
using System.Net;

namespace Tls
{
    class Program
    {
        static void Main(string[] args)
        {
            System.Net.ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12;

            using (var response = WebRequest.Create("https://tls.testegerencianet.com.br").GetResponse())
            using (var streamReader = new StreamReader(response.GetResponseStream()))
            {
                Console.WriteLine(streamReader.ReadToEnd());
            }
        }
    }
}
