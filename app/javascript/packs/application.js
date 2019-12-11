import "bootstrap";
import 'ion-rangeslider/css/ion.rangeSlider.min.css';
import { initSliders } from './sliders';
import { initAutocomplete } from '../plugins/autocomplete';
import { setupPendingBets } from '../plugins/pending-bet-countdown';
import { initSweetalert } from '../plugins/init_sweetalert';

initSliders()
initAutocomplete()
setupPendingBets()
