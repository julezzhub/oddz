import "bootstrap";
import 'ion-rangeslider/css/ion.rangeSlider.min.css';
// import "circlebars/dist/skins/whitecircle.css";
// import "circlebars/dist/circle.css";
import { initSliders } from './sliders';
import { initAutocomplete } from '../plugins/autocomplete';
import { setupPendingBets } from '../plugins/pending-bet-countdown';

initSliders()
initAutocomplete()
setupPendingBets()





