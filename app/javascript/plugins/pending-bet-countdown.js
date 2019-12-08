const sprintf = require('sprintf-js').sprintf

const renderTime = (bet) => {
  const time = parseInt(bet.dataset.remainingTime, 10);
  const timeString = sprintf("%02d:%02dh", time / 3600, time / 60 % 60)
  // const timeString = `${time / 3600}:${time / 60 % 60}h`
  bet.querySelector('.bet-remaining-time').innerText = timeString;
}

const countDown = (bet) => {
  console.log('counting down: ', bet)
  // 2. get the remaining time
  const time = parseInt(bet.dataset.remainingTime, 10)
  // subtract 60
  bet.dataset.remainingTime = time - 60

  renderTime(bet)

  // 4. when we get to zero, delete it
}

const setupPendingBets = () => {
  // 1. find pending bets
  const bets = document.querySelectorAll('[data-remaining-time]')
  bets.forEach((bet) => {
    renderTime(bet)
    // 3. start counting down
    window.setInterval(() => {
      countDown(bet)
    }, 60000) // every minute (value in milliseconds)
  })
}


export { setupPendingBets }
