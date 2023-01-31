public class ListDemo {
    public static String candidatesList(integer i) {
        //list
        //datatypes
        List<String> ListCandidates = new List<String>();
        //we can add only string to above list.}
        //not:we cannot add integer boolean date or an
        listCandidates.add('marc');
        listCandidates.add('elon');
        listCandidates.add('bill');
        listCandidates.add('marc');
        System.debug('candidates list is ' + ListCandidates);

        string candidate = '';
        if (i>=0 && i < listCandidates.size()) {
            candidate = listCandidates[i];
        } else {
            candidate = 'No such candidate found. Try again.';
        }
        return candidate;

    }


    public static void randomIntegerList() {
        List<integer> listInteger = new List<integer>();
        listInteger.add(10);//index=0
        listInteger.add(15);
        listInteger.add(21);
        listInteger.add(15);
        listInteger.add(15);//index=4
        System.debug('list of random integers is ' + listInteger);

       //get the value at index 3
        integer index3value = listInteger.get(3);
        //OR
        integer index3value2 = listInteger[3];

        system.debug('value at index 3 ' + index3value);
        system.debug('value at index 3, again ' + index3value2);
 
    }
    
    public static void allCats() {
        List<cat> cats = new List<cat>();

        cat c2 = new Cat('fluffykins','white');
        cat c1 = new Cat('tekir','black');
        cat sfcat = new Cat();

        cats.add(c1);
        cats.add(c2);
        cats.add(sfcat);

        system.debug('all cats ' + cats);

        if (!cats.isEmpty()) {
            System.debug(cats[0]);
        }

    

        

        //how to add elements of cat class?
        //we can add instance of cat class in list<cat>
        
    }

    public static void iteralListInteger() {
        List<integer> listInteger = new List<integer>();
        listInteger.add(10);//0
        listInteger.add(15);
        listInteger.add(21);
        listInteger.add(15);
        listInteger.add(15);//4

        for (integer eachInteger : listInteger) {
            System.debug(eachInteger);
        
        }
        
    }
       public static integer add(list<integer> listInt) {
        //a temporary variable to store sum of each integer in the list
        integer sum = 0;

        for (integer eachInt : listInt) {
            sum += eachInt;
        }
        return sum;

    }

}