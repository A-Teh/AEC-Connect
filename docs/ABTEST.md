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
