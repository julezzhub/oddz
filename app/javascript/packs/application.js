import "bootstrap";
import 'ion-rangeslider/css/ion.rangeSlider.min.css';
// import "circlebars/dist/skins/whitecircle.css";
// import "circlebars/dist/circle.css";
import { initSliders } from './sliders';
import { initAutocomplete } from '../plugins/autocomplete';
import { setupPendingBets } from '../plugins/pending-bet-countdown';
import AutoNumeric from 'autonumeric';

if (document.getElementById('metric-count-message')) {
  const metric_count = new AutoNumeric(document.getElementById('bet_metric_count'), {
      decimalCharacter : ',',
      digitGroupSeparator : '.',
      allowDecimalPadding: false,
      outputFormat: "number"
  });

  document.getElementById('bet_metric_count').addEventListener('keyup', (event) => {
    document.getElementById('hidden_metric_count').value = metric_count.getNumericString()
    if (document.getElementById('hidden_metric_count').value <= parseInt(document.querySelector('.selected div p:nth-child(2)').innerText.replace(/\,/g,''), 10)) {
      document.getElementById('recipe1forward').classList.add('d-none');
      document.getElementById('metric-error').innerText = "Must be higher than current count";
    } else {
      document.getElementById('recipe1forward').classList.remove('d-none');
      document.getElementById('metric-error').innerText = "";
    }
  })

  document.getElementById('current-stats-box').addEventListener('click', (event) => {
    if (document.getElementById('hidden_metric_count').value <= parseInt(document.querySelector('.selected div p:nth-child(2)').innerText.replace(/\,/g,''), 10)
     || (document.getElementById('hidden_metric_count').value === '{:value=>""}')) {
      document.getElementById('recipe1forward').classList.add('d-none');
      document.getElementById('metric-error').innerText = "Must be higher than current count";
    } else {
      document.getElementById('recipe1forward').classList.remove('d-none');
      document.getElementById('metric-error').innerText = "";
    }
  })
}

initSliders()
initAutocomplete()
setupPendingBets()


