import { LightningElement, api} from 'lwc';

import CONTACT_OBJECT from  '@salesforce/schema/Contact';

export default class P2c_c2pDisplayContactChild extends LightningElement {
    objectName = CONTACT_OBJECT;
    @api recordId;
    displayRecord = true;

    closeHandlerChild(){
        this.displayRecord = false;
        const closeEvent = new CustomEvent('close',{detail : "Modal has been closed successfully"});
        this.dispatchEvent(closeEvent);     
    }
}