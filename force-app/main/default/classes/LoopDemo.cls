public class LoopDemo {
   public void print_int_while (){
    Integer count = 1;
    while (count<=25) {
        System.debug(count);
        count++;
    }
   }
   public void print_N_numbers(Integer n){
    for (Integer i = 0; i < n; i++) {
        System.debug(i);
    }
   }
   public void print_N_Odd_numbers(Integer startInt, Integer endInt){
    //startınt => 4
    //endınt => 94
   
   for (Integer i = startInt; i <= endInt; i++) {
    Integer remainderI = math.mod(i, 2);
    if (remainderI == 1) {
        System.debug(i);
    }
   }
   }
}