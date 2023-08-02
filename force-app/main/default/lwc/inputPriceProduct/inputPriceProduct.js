import { LightningElement, wire } from 'lwc';

import getProductCost from '@salesforce/apex/inputPriceClass.getProductCost';

//Add columns for datatable
const COLUMNS = [
    { label: 'Title', fieldName: 'Title__c', type: 'text' },
    { label: 'Price', fieldName: 'Price__c', type:'text' },
    { label: 'Category', fieldName: 'Category__c', type: 'text'},
    { label: 'Brand', fieldName: 'Brand__c', type: 'text'}
];
export default class InputPriceProduct extends LightningElement {

    products;
    error;
    searchPrice;
    columns = COLUMNS;
    changeHandler(event){
        this.searchPrice = event.target.value;
    }

    @wire(getProductCost, {a: '$searchPrice'})
    getPriceHandler({data,error}){
        if(data){
            this.products = data;
        }

        if(error){
            this.error = error;
        }
    }
}