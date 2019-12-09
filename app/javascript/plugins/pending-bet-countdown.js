const sprintf = require('sprintf-js').sprintf

const TIMERS = []

const renderTime = (bet) => {
  const time = parseInt(bet.dataset.remainingTime, 10);
  const timeString = sprintf("%02d:%02d:%02d", time / 3600, time / 60 % 60, time % 60)
  // const timeString = `${time / 3600}:${time / 60 % 60}h`
  bet.querySelector('.bet-remaining-time').innerText = timeString;
}

const stopTimer = (bet) => {
  TIMERS.forEach((obj) => {
    if (obj.bet == bet) {
      window.clearInterval(obj.timer)
    }
  })
}

const countDown = (bet) => {
  console.log('counting down: ', bet)
  // 2. get the remaining time
  const time = parseInt(bet.dataset.remainingTime, 10)
  // subtract 60
  const remainingTime = time - 1
  bet.dataset.remainingTime = remainingTime

  // 4. when we get to zero, delete it
  if (remainingTime <= 0) {
    // stop the timer
    stopTimer(bet)
    bet.remove()
  } else {
    renderTime(bet)
  }
}

const setupPendingBets = () => {
  // 1. find pending bets
  const bets = document.querySelectorAll('[data-remaining-time]')
  bets.forEach((bet) => {
    renderTime(bet)
    // 3. start counting down
    const timer = window.setInterval(() => {
      countDown(bet)
    }, 1000) // every second (value in milliseconds)
    // Add this timer to our list of timers
    TIMERS.push({
      bet,
      timer
    })
  })
}


export { setupPendingBets }
