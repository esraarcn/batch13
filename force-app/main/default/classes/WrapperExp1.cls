public with sharing class WrapperExp1 {
    public DataWrapper data;
    public SupportWrapper support;
    

    public class DataWrapper{
    public integer id;
    public string email;
    public string first_name;
    public string last_name;
    public string avatar;


    }

    public class SupportWrapper{
    public string url;
    public string text;
    }


}