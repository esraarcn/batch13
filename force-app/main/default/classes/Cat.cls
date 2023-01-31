public class Cat {
    public String name;
    public string color;
    //consructor name is same as class name
    //it doesnt return anything.
    //we use consructor if we want to execute
    //some apex code as soon as new instance is created.
    public Cat() {
        System.debug('cat constructor called.');
    }
    //we can have multiple consructors.
    //provide number of params ,or datatype of params are different.
    
    public Cat(string n ,String clr){
        name = n;
        color = clr;
        sleeping();
    }

    public void sleeping(){
        System.debug(name + 'is sleeping. dnd.');
    }
}