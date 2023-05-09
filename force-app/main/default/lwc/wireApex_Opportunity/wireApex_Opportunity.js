import { LightningElement, wire } from 'lwc';
import listOpp from '@salesforce/apex/WireApex_Opportunity.listOpp';
const COLUMNS = [
    { label: 'Name', fieldName: 'Name', type: 'text', editable : true },
    { label: 'Expected Revenue', fieldName: 'ExpectedRevenue', type: 'currency' },
    { label: 'Amount', fieldName: 'Amount', type: 'currency' },
    { label: 'Close Date', fieldName: 'CloseDate', type: 'date'},
    { label: 'StageName', fieldName: 'StageName', type: 'text' }
];
export default class WireApex_Opportunity extends LightningElement {
    columns= COLUMNS;
    @wire(listOpp)
    Opportunities;

}
