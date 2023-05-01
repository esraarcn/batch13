public class Newcar {
    Integer currentSpeed = 0;
    String carName = '';
    string carType = '';
 public void startCar( string carName, string carType) {
    String carName1 = carName + carType;
    System.debug(carName1);
    }

    public void Accelerate (integer x){
        integer lastSpeed = currentSpeed + x;
        System.debug(lastSpeed);
    }
    public void brake(integer y) {
        integer newSpeed = currentSpeed- y;
        System.debug(newSpeed);
    }
    public void stopCar () {
        currentSpeed = 0;
        System.debug(currentSpeed);
    }
    public void checkSpeed(){

        if (currentSpeed > 0 && currentSpeed <= 30){
            system.debug('City Mode');
        }else if (currentSpeed > 31 && currentSpeed <= 60){
            system.debug('Economy Mode');
        }else {
            system.debug('Sports Mode');
        }
    }

    }