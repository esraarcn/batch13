import { LightningElement } from 'lwc';

export default class QuerySelectorDemo extends LightningElement {

    firstName;
    lastName;

    clickHandler(){
        //dynamically change the styling
        const elem = this.template.querySelector('h1');
        elem.style.color = "Green";
        elem.setAttribute("class","slds-align_absolute-center");

        //multiple elements
        const elemts = this.template.querySelectorAll('.demoName');
        elemts.forEach(item => {
            if(item.name === 'FirstName'){
                this.firstName = item.value;
            }
            if(item.name === 'LastName'){
                this.lastName = item.value;
            }
        })
        

        //dynamically adding HTML Tags
        const elemDom = this.template.querySelector('.demoDiv');
        elemDom.innerHTML = '<p>This is the paragraph from JS</p>';

        
    }



}