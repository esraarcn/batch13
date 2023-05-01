public with sharing class EmployeeHandler {
    public static void afterInsert(List<Employee__c> newEmployees) {
        for(Employee__c emp : newEmployees) {
            WeeklyAssignmentCallouts.postEmployeeInfo(emp.Id);
        }
    }
}
