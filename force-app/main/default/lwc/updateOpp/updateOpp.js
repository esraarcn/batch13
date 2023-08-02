import { LightningElement } from 'lwc';

import {ShowToastEvent} from 'lightning/platformShowToastEvent';
import OPPORTUNITY_OBJ from '@salesforce/schema/Opportunity';
import NAME_FIELD from '@salesforce/schema/Opportunity.Name';
import TYPE_FIELD from '@salesforce/schema/Opportunity.Type';
import STAGENAME_FIELD from '@salesforce/schema/Opportunity.StageName';
import AMOUNT_FIELD from '@salesforce/schema/Opportunity.Amount';
import CLOSEDATE_FIELD from '@salesforce/schema/Opportunity.CloseDate';

export default class UpdateOpp extends LightningElement {
    objName = OPPORTUNITY_OBJ;
    fields = {
       Name : NAME_FIELD,
       Type : TYPE_FIELD,
       StageName: STAGENAME_FIELD,
       Amount : AMOUNT_FIELD,
       CloseDate : CLOSEDATE_FIELD
    };
    recordId = "0068d00000BzqZZAAZ";

    successHandler(){
        const event = new ShowToastEvent(
            {
                title:"Success",
                message:"Record updated successfully",
                variant:"Success"
            }
        );
        this.dispatchEvent(event);
    }

errorHandler(){
    const event= new ShowToastEvent({
        title:"Error",
        message: "Fix the error",variant:"Error"
    });
    this.dispatchEvent(event);

}
}