import { LightningElement } from 'lwc';
import loginTemplate from './loginTemplate.html';
import signupTemplate from './signupTemplate.html';
import renderTemplate from './renderMethodHook.html';

export default class RenderMethodHook extends LightningElement {
    selectedOption;

    render() {
        return this.selectedOption === "Login" ? loginTemplate
            : this.selectedOption === "Signup" ? signupTemplate
            : renderTemplate;
    }

    clickHandler(event) {
        this.selectedOption = event.target.label;
    }
}