import "bootstrap";
import 'ion-rangeslider/css/ion.rangeSlider.min.css';
import { initSliders } from './sliders';
import { initAutocomplete } from '../plugins/autocomplete';
import { setupPendingBets } from '../plugins/pending-bet-countdown';
import AutoNumeric from 'autonumeric';

const metric_count = new AutoNumeric(document.getElementById('bet_metric_count'), {
    decimalCharacter : ',',
    digitGroupSeparator : '.',
    allowDecimalPadding: false,
    outputFormat: "number"
});
initSliders()
initAutocomplete()
setupPendingBets()

document.getElementById('bet_metric_count').addEventListener('change', (event) => {
  document.getElementById('hidden_metric_count').value = metric_count.getNumericString()
  if (document.getElementById('hidden_metric_count').value <= parseInt(document.querySelector('.selected div p:nth-child(2)').innerText, 10)) {
    document.getElementById('recipe1forward').classList.add('d-none');
    document.getElementById('metric-error').innerText = "Must be higher than current count";
  } else {
    document.getElementById('recipe1forward').classList.remove('d-none');
    document.getElementById('metric-error').innerText = "";
  }
})
