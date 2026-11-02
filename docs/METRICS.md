## HEART Framework link
https://docs.google.com/presentation/d/1aIRUE6p3X9w-oz-sIxOUvxXxDA6SD8Hn0sHVSDabCdk/edit?usp=sharing 

## Metrics

* Metric 1 - Average Daily Queue Check-Ins per Active User: Set up custom events (join_dropin_queue) divided by total daily active users in Google Analytics to measure how actively users utilize core tutoring features.

* Metric 2 - Sign-Up Completion Rate (Adoption, primary): Set up custom events (sign_up_start) when the sign-up screen opens and (sign_up) when an account is created, then divide sign_up by sign_up_start in Google Analytics for each variant to measure how many students who begin sign-up actually finish it.

* Metric 3 - Ease-of-Sign-Up Rating (Happiness): After a user’s first successful sign-in, show a one-time 1 to 5 prompt (“How easy was it to get started?”). Save the answer to the user’s Firestore document as  `auth_ease_rating`, and also log it as the event `auth_ease_rating` with the parameters rating and variant. Average the ratings for each variant. Use a `rating_shown` boolean on the user document so the prompt never appears twice.
