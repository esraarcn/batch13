import { api, LightningElement } from 'lwc';

export default class SearchStudentChild extends LightningElement {
  @api columnsList;
  @api studentData;
  @api error;

}