public class RankHandler {
    public string rankPrize(integer rank){
        String prize = '';
        if (rank == 1) {
            prize = 'gold';   
        } else if (rank == 2) {
            prize = 'silver ';  
        } else if (rank == 3) {
            prize = 'bronz';  
        } else if (rank <= 10) {
             prize = 'top 10 congrats';
        } else {
             prize = 'thank you';
        } 

    return prize;
    }

    public String rankPrizeSwitch(Integer rank) {
    string prize = '';
        switch on rank {
            when 1 {
                prize = 'gold';
            }
            when 2 {
               prize = 'silver'; 
            }
            when  3 {
                prize = 'bronz';
            }
            when 4,5,6,7,8,9,10 {
                prize = 'top 10';
            }
            when else {
                if (rank <= 0) {
                    prize ='come on';
                }else {
                    prize = 'good job buddy';
                }
            }
        }

        return prize;
    }
    
 }
