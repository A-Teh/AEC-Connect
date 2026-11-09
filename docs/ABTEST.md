### A/B Test Name: Closed Course Queue Call-to-Action vs. Section Closed Indicator

* **User Story Number:** US4 (Golden Path - Core Drop-In Dashboard)
* **Metrics:**
  * **Engagement / Task Success (Golden Path CTR):** Conversion rate of students who view a closed course section and tap to join the waitlist queue (`join_dropin_queue` custom event).
  * **Retention:** 7-day return rate for students who successfully join a queue for a closed section.
  * **Happiness:** Post-session survey satisfaction scores regarding library tutor availability.
* **Hypothesis:**
  * Providing a prominent, reassuring action button (*"Join Waitlist Queue (~15 min)"*) on a closed course card will encourage students to enter the queue rather than abandon the app, whereas displaying a passive static status badge (*"Section Closed / Full"*) creates a perceived dead-end that causes high user bounce rates.
  * **What Problem Are We Trying to Solve? Its Impact?**
    * **Problem:** When peak-hour drop-in sessions for high-demand courses (e.g., CHM 101, MTH 141) reach capacity, students see that the section is "Closed" or "Full" and leave the app without attempting to check in, under the false assumption that no help is available.
    * **Impact:** High bounce rates on full course cards prevent tutors from managing incoming demand effectively and cause students to miss out on drop-in support. Optimizing this entry point increases total daily queue check-ins and validates core app utility during peak hours.
* **Experiment:**
  * **Audience:** Using Firebase Remote Config and A/B Testing, we will target 100% of students viewing a closed course section, split 50/50 between Variation A (Control) and Variation B (Treatment).
  * **Tracking (using Firebase Analytics):**
    * `view_closed_course`: Event fired when a student views a course card that is currently at capacity.
    * `join_dropin_queue`: Custom Firebase Analytics event fired on button click with parameters `course_code` (e.g., `"CHM_101"`), `is_closed_section: true`, and `estimated_wait_time`.
    * Track closed-section conversion rate: `join_dropin_queue (where is_closed_section = true)` / `view_closed_course`.
* **Variations:**
  * **Variation A (Control - Passive Closed Indicator):** A course card showing a red status badge *"Section Closed / At Capacity"* with a grayed-out or secondary button reading *"Queue Full"*.
    * **Mockup:** Card component for CHM 101 showing a red badge "Section Full" with a disabled gray button labeled "Queue Full - Check Back Later".
  * **Variation B (Treatment - Active Waitlist CTA):** A course card showing an orange/amber badge *"Currently Full - Queue Active"* with a prominent Navy Blue action button reading *"Join Waitlist Queue (~15 min wait)"*.
    * **Mockup:** Card component for CHM 101 showing an amber badge "Capacity Reached" with a bold Navy Blue button labeled "Join Waitlist Queue (~15 min wait)" featuring a clock icon.


### A/B Test Name: Combined Sign-Up / Log-In First Screen vs. Separate Sign-Up, and Log-In Screens

* **User Story Number:** US1 (Account Creation)
* **Metrics:**
  * **Adoption:** New users who see the first welcome screen and finish creating an account (`signup_complete`). This is the primary metric.
  * **Retention:** Day-1 and Day-7 return rate for accounts created in each variation.
  * **Happiness:** 1 to 5 ease-of-sign-up rating shown once after the first successful sign-in event.
* **Hypothesis:**
  * Showing Create Account and Log-In together on the first screen when the app opens, with a *"Create Account | Log In"* toggle button above one text form, will let students start typing immediately and finish sign-up and/or log-in faster. A separate welcome screen that sends users to different authentication pages adds extra taps and a decision before the filling out the form, which causes drop-off.
  * **What Problem Are We Trying to Solve? Its Impact?**
    * **Problem: ** Currently, returning students have to find a small *"Log In"* text link at the bottom of the sign-up page, getting to it from the app's opening screen takes extra taps. The most frequent action event in the app (logging in) is the hardest one to find, and new users face an extra option before they see any form. 
    * **Impact: ** Every extra screen before account creation or login is a chance for a student to leave before reaching course search, live availability, and waitlist alerts. Because the app exists to reduce friction around the AEC, friction in the first 30 seconds works against the product's ideals. Improving this entry point increases total accounts created and gives every later feature a larger user base.
* **Experiment:**
  * **Audience:** Using Firebase Remote Config and A/B Testing, we will target 100% of current users, split 50/50 between Variation A (Control) and Variation B (Treatment). A Remote Config parameter decides which first screen shows(`separate` or `combined`). The AEC audience is small (URI STEM and business undergraduates), so using every new user at an even split reaches a usable sample sooner.
  * **Tracking (using Firebase Analytics):** Every event carries the parameter (`separate` or `combined`).
    * `auth_screen_view`: Event fired when the first auth screen appears (activation event).
    * `signup_start`: Event fired on the first keystroke in the sign-up email field.
    * `signup_complete`: Custom Firebase Analytics event fired when Create Account succeeds, with parameters `variant` and `seconds_since_first_screen`.
    * `signup_failed`: Event fired when Firebase returns an error, with parameter `error_code`.
    * `login_complete`: Event fired when log-in succeeds, with parameter `seconds_since_first_screen`.
    * Track sign-up conversion rate: `signup_complete` / `auth_screen_view`. Success rule: Variation B wins if its conversion rate is at least 10% higher (relative) than the control with no drop in Day-1 retention and no increase in the validation-error rate.
* **Variations:**
  * **Variation A (Control - Separate Screens):** The app opens to a Welcome screen with two buttons, *"Create Account"* (and its functions) and *"Log In"*(and its functions). Each button opens its own page with its own form.
    * **Mockup:** Welcome screen with the AEC logo. Create Account opens a page with URI Email, Password, and Confirm Password fields. Log In opens a second page with URI Email and Password fields.
  * **Variation B (Treatment - Combined First Screen):** The app opens straight to one screen with a segmented toggle, *"Create Account | Log In"*, above a single shared form. Tapping the toggle changes the fields and the button label in place with no page navigation. Create Account is the default tab for new installs.
    * **Mockup:** One screen with the AEC logo, a two-option toggle, URI Email and Password fields, a Confirm Password field that appears only on the Create Account tab, an inline error line, a primary button that reads "Create Account" or "Log In", an "OR" divider, and a "Sign in with URI SSO" button. A new user starts typing with 0 extra taps, and a returning user needs 1 tap on the toggle.
  * **Held constant in both variations:** Field labels, validation rules (`@uri.edu` email, 8-character password, matching passwords), error text, colors, and the SSO button, so screen structure is the only variable.

  * **Implementation Status (updated Nov 9):**
    * **Remote Config parameter:** `authScreen` (String), default `separate`, variant value `combined`. Created and published in Firebase, and added in FlutterFlow (branch US 1) with the same default.
    * **Events done (FlutterFlow, US 1):** `auth_screen_view` with `variant` (fires when the AccountCreation page loads) and `signup_complete` with `variant` (fires after Create Account succeeds).
    * **Events not done yet:** `signup_start`, `signup_failed`, `login_complete` with `variant`, and the `seconds_since_first_screen` parameter.
    * **Variation B (combined screen):** not built yet. No page switches on `authScreen` yet.
    * **Firebase experiments:** two drafts saved, one targeting the Android app and one the Web app, each with `authScreen` `separate` (baseline) vs `combined`, 100% exposure, primary goal `signup_complete`. Not started.
    * **Still to do before the run:** publish Remote Config, finish Variation B, build the web app and the Android APK, start both experiments, then capture screenshots of both variants on web and on the Android device.



### A/B Test Name: "Find a Tutor with Related Experience" Button vs. Auto-Shown Related Tutor Suggestions

* **User Story Number:** US5 (Additional Feature - AI Tutor Matching)
* **Metrics:**
  * **Task Success (primary):** Share of students who land on a course page with no tutor on shift for that course and then join a queue for a tutor with related experience (`join_dropin_queue` where `is_adjacent_match = true`).
  * **Retention:** 7-day return rate for students who reached a course page with no tutor on shift for that course, compared with the overall 7-day return rate.
  * **Happiness:** 1 to 5 rating of "The related-experience tutor was able to help with my course", shown once after a session with a tutor matched this way. This is also a guardrail: a related-experience tutor isn't a direct match, so higher conversion doesn't count as a win if students feel worse served.
* **Hypothesis:**
  * Showing the top related-experience tutors directly under the *"No tutor is currently on shift for this course"* message will lead more students to join a queue than asking them to tap *"Find a Tutor with Related Experience"* first. A student who has just read that no one covers their course is close to leaving, and one extra tap before they see that help is available is a likely point of drop-off.
  * **What Problem Are We Trying to Solve? Its Impact?**
    * **Problem:** When no tutor on shift has a student's course (e.g., MTH 362) listed, the student assumes no help is available and leaves the AEC, or asks reception to guess who might know the material. 55% of surveyed students have already made a trip to the AEC and found the subject they needed closed.
    * **Impact:** Tutors whose experience is in related courses (e.g., MTH 244) are often on shift and free. Showing them to students increases the number of courses the AEC can actually cover without hiring more tutors, and it turns a "subject closed" dead end into a completed session.
* **Experiment:**
  * **Audience:** Using Firebase Remote Config and A/B Testing, we will target 100% of logged-in students who load a course page where no tutor on shift has a direct match for that course, split 50/50 between Variation A (Control) and Variation B (Treatment). The Remote Config parameter `related_tutor_mode` (`on_tap` or `auto_show`) decides the behavior. Course pages that have a tutor on shift for that course are excluded.
  * **Tracking (using Firebase Analytics):** Every event carries the parameters `related_tutor_mode` (`on_tap` or `auto_show`) and `course_code`.
    * `no_direct_tutor_view`: Event fired when the *"No tutor is currently on shift for this course"* message is displayed (activation event).
    * `related_tutors_requested`: Event fired when the AI matching service is called (Variation A: on button tap; Variation B: on page load).
    * `related_tutors_shown`: Event fired when suggestions are displayed, with parameters `suggestion_count` and `latency_ms`.
    * `related_tutor_selected`: Event fired when a student taps a suggested tutor, with parameters `tutor_id`, `related_course` (e.g., `"MTH_244"`), and `list_position`.
    * `join_dropin_queue`: The existing Golden Path event, with the added parameters `tutor_id` and `is_adjacent_match` (true/false).
    * `related_match_none`: Event fired when the *"No tutors with related experience are on shift right now"* message is displayed.
    * `notify_me_tapped`: Event fired when a student taps *"Notify Me When Available"*.
    * `ai_match_unavailable`: Event fired when the matching service times out after 3 seconds and the *"temporarily unavailable"* notice is displayed.
    * Track related-tutor conversion rate: `join_dropin_queue (where is_adjacent_match = true)` / `no_direct_tutor_view`. Success rule: Variation B wins if its conversion rate is at least 15% higher (relative) than the control, the 95th percentile of `latency_ms` stays within the story's 3-second limit, and the average "able to help" rating does not drop.
* **Variations:**
  * **Variation A (Control - On-Tap Button):** Follows the US5 acceptance criteria as written. The course page shows the *"No tutor is currently on shift for this course"* message, with a prominent *"Find a Tutor with Related Experience"* button below it. Suggestions load only after the student taps the button.
    * **Mockup:** MTH 362 course page with a gray info banner, *"No tutor is currently on shift for this course"*, and a full-width Navy Blue button below it, *"Find a Tutor with Related Experience"*. Tapping the button shows a loading spinner, then a list of tutors.
  * **Variation B (Treatment - Auto-Shown Suggestions):** The same message, with the top 2 related-experience tutors loaded automatically underneath it, plus a *"See all related tutors"* link.
    * **Mockup:** MTH 362 course page with the same gray banner, then the heading *"These tutors on shift have related experience"*, followed by two tutor cards. One reads *"Priya S. · Related Experience: MTH 244 · 1 hr 20 min left on shift"* and has a *"Join Queue"* button. Below the cards is a *"See all related tutors"* text link.
  * **Held constant in both variations:** The AI matching service and how it ranks tutors, the information on each tutor card (name, related course, remaining shift time), the 3-second timeout, the wording for no matches and for the service being unavailable, the *"Notify Me When Available"* option, colors, and queue logic. The only variable is whether suggestions need a tap.
