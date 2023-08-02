import { LightningElement,api} from 'lwc';

export default class P2cDisplayAccountsChild extends LightningElement {

    //Array of Objects
    @api accountsData;
    /**
     * accountsData = [
        * {
        * Name : test1,
        * AccountNumber : 1234
        * },
        * {
        * Name : test2,
        * AccountNumber : 2222
        * }
     * ]
     * 
     */

}