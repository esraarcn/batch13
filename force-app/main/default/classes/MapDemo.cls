public class MapDemo {
    public static string retrieveMonth(integer m){
        String month = '';
        map<integer, String> mapMonth = new map<integer, String>();
        mapMonth.put(1, 'january');
        mapMonth.put(2, 'february');
        mapMonth.put(3, 'march');
        mapMonth.put(4, 'april');
        mapMonth.put(5, 'may');
        mapMonth.put(6, 'june');
        mapMonth.put(7, 'july');
        mapMonth.put(8, 'agust');
        mapMonth.put(9, 'september');
        mapMonth.put(10, 'octobar');
        mapMonth.put(11, 'november');
        mapMonth.put(12, 'december');

        if(mapMonth.containsKey(m)){
            month = mapMonth.get(m);
        }else{
            month = 'no such month exist. please behave!';
        }
        
        return month;



    }
}