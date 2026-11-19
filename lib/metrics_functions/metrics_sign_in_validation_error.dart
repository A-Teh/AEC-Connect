

/// Helps measure validation errors for the A/B test across the combined and
/// split sign up/log in screens by defining what type of error occurred when
/// validating.
///
/// ARGUMENTS
/// strEmail - A string that is the user's email input
/// strPassword - A string that is the user's password input
/// strConfirm - A string that is the user's confirm password input
///
/// RETURNS
/// String - the validation error
String? metricsSignInValidationError(
  String strEmail,
  String strPassword,
  String strConfirm,
) {
  if (!strEmail.trim().toLowerCase().endsWith('@uri.edu')) {
    return 'invalid_email_domain';
  }
  if (strPassword.length < 8) {
    return 'password_too_short';
  }
  if (strPassword != strConfirm) {
    return 'password_mismatch';
  }
  return 'Unknown Validation Error';
}
