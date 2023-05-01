public class primitiveDataTypeDemo2 {
    public void printNewDate() {
        System.debug('print new dates here.');

    //new date instance              year month day
        Date newDate = Date.newInstance(1995, 02, 15);
        System.debug('new date is ==> ' + newDate);

        Date newDate2 = Date.newInstance(2022, 9, 5);
        System.debug('new date2 is ==> '+ newDate2);

        Date todayDate = Date.today();
        system.debug('today date is ' + todayDate);


    }
    public void printNewTime(){
        //   hour min sec millisec
        Time myTime = Time.newInstance(18, 15, 18, 50);
        System.debug('my time is '+ myTime);

        Time meTime = Time.newInstance(9, 80, 30, 30);
        System.debug('me time is ' + meTime);
    }
    public void printNewDateTime(){
        Date newDate = date.today();
        Time newTime = time.newInstance(8, 38, 0, 0);
        //1.new datetime using date time
        DateTime dt1 = datetime.newInstance(newDate, newTime);
        System.debug('dt1 is ==> ' + dt1);

        //2.new datetime using year month day
        Datetime dt2 = datetime.newInstance(2020, 7, 7);
        System.debug('dt2 is==> ' + dt2);

        //3. new datetime year month day hour min sec
        Datetime dt3 = datetime.newInstanceGmt(2023, 1, 12, 5, 15, 10);
        System.debug(' dt3 is ==>' + dt3);

        //4. milliseconds from 1 jan  1970 000000 gmt
        long longTime1 = 0;
        Datetime dt4_1 = Datetime.newInstance(longTime1);
        System.debug('dt4_1 '+ dt4_1);

          long longTime2 = 15533554563588L;
        Datetime dt4_2 = Datetime.newInstance(longTime2);
        System.debug('dt4_2 '+ dt4_2);
        // 6. current time
        datetime dt6 = datetime.now();
        System.debug('dt6 is ' + dt6);

         // newInstanceGmt
         Datetime dt5 = datetime.newInstanceGmt(2021, 4, 9, 15, 15, 15);
         System.debug('dt5 '+ dt5);

}

    public void printSubscriptionEndDate(){
        date subStartDate = date.today();
        //get end date if substruction is done for 1000
         date subEndDate = subStartDate.addDays(1000);
         System.debug('subs end date is ' + subEndDate );



    }   
}

/*
public class DatetimeMethodsDemo {
    public void calculateAgeInMonths(){
        date birthDate = date.newInstance(1990, 10, 9);
        date todayDate = date.today();

        integer ageInMonths = birthDate.monthsBetween(todayDate);
        system.debug('Vitap age in months => ' + ageInMonths);

        integer ageInDays = birthDate.daysBetween(todayDate);
        system.debug('Vitap age in days => ' + ageInDays);
    }

    public void birthDatetimeInMS(){
        Datetime birthDT = datetime.newInstance(1990, 10, 9, 7, 30, 00);
        long millisecBirthDT = birthDT.getTime();
        system.debug('birth datetime in milliseconds is ' + millisecBirthDT);
    }

    public void printSubscriptionEndDate(){
        date subStartDate = date.today();
        //get endDate if subscription is done for 1000 days
        date subEndDate = subStartDate.addDays(1000);
        system.debug('subs end date is ' + subEndDate);

        integer endYear = subEndDate.year();
        integer endMonth = subEndDate.month();
        system.debug('end year is ' + endYear);
        system.debug('end month is ' + endMonth);
    }

    public void printOfferEndDateTime(){
        datetime offerStart = Datetime.now();

        datetime offerEnd = offerStart.addHours(51);
        system.debug('offer end datetime is ' + offerEnd);

        date offerEndDATE = offerEnd.date();
        system.debug('date of offer end ' + offerEndDATE);
    }
}
*/