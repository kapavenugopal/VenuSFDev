import { LightningElement, wire } from 'lwc';
import getExchangeRates from '@salesforce/apex/ExchangeRateServiceCalloutCtrl.getExchangeRates';

export default class ExchangeRateComponent extends LightningElement {
    baseCurrency = '';
    exchangeRates = [];
    isLoading = false;

    currencyOptions = [
        { label: 'USD', value: 'USD' },
        { label: 'EUR', value: 'EUR' },
        { label: 'GBP', value: 'GBP' },
        { label: 'JPY', value: 'JPY' },
    ];

    currencyOptionsWithValues = [
        { label: 'USD', value: 'USD' },
        { label: 'EUR', value: 'EUR' },
        { label: 'GBP', value: 'GBP' },
        { label: 'JPY', value: 'JPY' },
    ];

    handleBaseCurrencyChange(event) {
        this.baseCurrency = event.detail.value;
        this.getExchangeRates();
    }

    getExchangeRates() {
        this.isLoading = true;
        getExchangeRates({ baseCurrency: this.baseCurrency })
            .then(result => {
                console.log(result);
                //this.exchangeRates = result;
                this.exchangeRates = Object.keys(result).map(currency => ({
                    currency,
                    rate: result[currency]
                }));
                console.log(this.exchangeRates);
            })
            .catch(error => {
                // Handle error
            })
            .finally(() => {
                this.isLoading = false;
            });
    }
}