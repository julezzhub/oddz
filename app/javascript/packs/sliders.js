import rangeSlider from 'ion-rangeslider';

const initSliders = () => {
  // height
  $(".js-range-slider1").ionRangeSlider({
      type: 'single',
      min: 1,
      max: 50,
      from: 1,
      skin: "sharp"
  });
};

export { initSliders };
