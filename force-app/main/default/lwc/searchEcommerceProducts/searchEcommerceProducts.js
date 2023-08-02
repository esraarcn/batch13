import getProducts from '@salesforce/apex/ProductCtrl.getProducts';
//import Consulting_ProjectDocsForwarded__c from '@salesforce/schema/Contact.Consulting_ProjectDocsForwarded__c';
import { LightningElement } from 'lwc';

const COLUMNS = [
    {label: "Title", fieldName: "Title__c", type: "text"},
    {label: "Brand", fieldName: "Brand__c", type: "text"},
    {label: "Category", fieldName: "Category__c", type: "text"},
    {label: "Price", fieldName: "Price__c", type: "number"}
];

export default class SearchEcommerceProducts extends LightningElement {
    amount;
    products;
    error;
    columns = COLUMNS;

    changeHandler(event) {
        this.amount = Number(event.target.value);
        console.log("Amount: " + this.amount);
        getProducts({amount: this.amount})
            .then(result => {
                 result.length === 0 ? this.products = undefined :  this.products = result;
                // if (result.length === 0){
                //     this.products = undefined;
                // }
                // else {
                //     console.log(result);
                //     this.products = result;
                // }
               
            })
            .catch(error => {
                console.error(error);
                this.error = error;
                
            })
    }
}