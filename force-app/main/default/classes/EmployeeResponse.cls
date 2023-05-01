public with sharing class EmployeeResponse {
    public integer error;
    public string msg;
    public List<EmployeeWrapper> data;


    public class EmployeeWrapper{
        public Integer id;
        public string username;
        public string name;
        public string email;
        public string gender;
        public string designation;
        public string phone_number;
        public string complete_address;

    }
}