import { LightningElement } from 'lwc';

export default class AssignmentRole extends LightningElement {
    username;
    role;

    userHandler(event){
        this.username=event.target.value;
    }

    roleHandler(event){
        this.role=event.detail.value;
    }
    get options() {
        return [
            { label: 'Salesforce Admin', value: 'Salesforce Admin' },
            { label: 'Salesforce Developer', value: ' Salesforce Developer' },
            { label: 'Salesforce Architect', value: 'Salesforce Architect'}
        ];
    }
}