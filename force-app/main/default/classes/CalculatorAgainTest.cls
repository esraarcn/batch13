@isTest // this is for class
public class CalculatorAgainTest {
    //1. public or private
    //2. static is must
    //3. void mandatory
    //4. NO parameters. None.
    //5. @isTest annotation
    @isTest  // this is for method
    private static void testMethod1() {
        //we can call a parameterized method of other class.
        CalculatorAgain c = new CalculatorAgain();
        c.welcomeMessage();
        c.printNewMessage('print this from test class');
    }

    @IsTest
    private static void testAdd1(){
        CalculatorAgain c = new CalculatorAgain();
        Integer sum = c.add(10, 8);
        system.assertEquals(18, sum);
    }
    @IsTest
    private static void testAdd2(){
        CalculatorAgain c = new CalculatorAgain();
        Integer sum = c.add(10, 8, 10);
        system.assertEquals(28, sum);
    }

    @IsTest
    private static void testMethod2(){
        CalculatorAgain c = new CalculatorAgain();
        string rt = c.printAndReturnMessage('test it now');
        System.assertEquals('test it now...Ok cool', rt);
    }
}