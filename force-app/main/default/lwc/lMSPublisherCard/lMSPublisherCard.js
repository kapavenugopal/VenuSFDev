import { LightningElement ,wire} from 'lwc';
import { publish, MessageContext } from 'lightning/messageService';
import LMSTest from '@salesforce/messageChannel/LMSTesting__LMSTest__c';

export default class LMSPublisherCard extends LightningElement {
    @wire(MessageContext) messageContext;

    handlePublish(event){
        const message = {
            messageToSend: 'Event Fired by LMS Outside Package'
        };
        publish(this.messageContext, LMSTest, message);
    }

}