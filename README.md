## Oddz - Prediction Markets for Social Media Metrics

Oddz is a dynamic prediction market platform designed to let users engage in betting on various social media metrics. The platform allows users to predict outcomes such as video views, tweet retweets, Instagram likes, and chart rankings, and place wagers against these predictions.

### Key Features

- **Customizable Challenges**: Users can create bets on anticipated metrics for content across major social media platforms like YouTube, Twitter, Instagram, and Spotify.
- **Real-time Tracking**: Bets are tracked in real-time with updated metrics directly fetched from social media APIs.
- **Automated Settlements**: Bets are automatically settled by the system using the latest data fetched from APIs, ensuring fairness and timeliness in payouts.
- **User Profiles**: Users can create and manage profiles, view their betting history, and track their winnings.
- **Leaderboards**: Display top predictors based on their success rate and total earnings.

### Technical Overview

#### Architecture

Oddz is built on Ruby on Rails and utilizes a microservices architecture for scalability and robustness. The core components include:

- **Web Application**: A Rails server that serves as the backend, handling API requests, user data management, bet logic, and integrating with external social media APIs.
- **Database**: PostgreSQL for robust data management and query capabilities.
- **Background Jobs**: Sidekiq with Redis is used to handle asynchronous tasks such as fetching social media metrics and settling bets.
- **Frontend**: The user interface is built using HTML, CSS, and JavaScript, enhanced with frameworks/libraries like React.js for a responsive and interactive experience.

#### Background Jobs

Background jobs are critical for Oddz, allowing for automated, timely operations:

- **Metric Fetcher**: Regularly scheduled jobs that interact with APIs such as YouTube, Twitter, Instagram, and Spotify to retrieve the latest metrics associated with ongoing bets.
- **Bet Resolver**: Tasks that execute after the close of betting windows to finalize and resolve bets based on the fetched metrics.
