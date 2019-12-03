import rangeSlider from 'ion-rangeslider';

const initSliders = () => {
  // height
  $(".js-range-slider1").ionRangeSlider({
      type: 'single',
      min: 1,
      max: 250,
      from: 1,
  });
};

export { initSliders };
