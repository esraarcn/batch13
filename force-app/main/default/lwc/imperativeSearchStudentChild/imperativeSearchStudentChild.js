import { LightningElement,api } from 'lwc';

export default class ImperativeSearchStudentChild extends LightningElement {
    @api columnsList;
    @api studentData;
    @api error;
}