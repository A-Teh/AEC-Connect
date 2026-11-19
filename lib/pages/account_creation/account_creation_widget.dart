import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/button2_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'account_creation_model.dart';
export 'account_creation_model.dart';

class AccountCreationWidget extends StatefulWidget {
  const AccountCreationWidget({super.key});

  static String routeName = 'AccountCreation';
  static String routePath = '/accountCreation';

  @override
  State<AccountCreationWidget> createState() => _AccountCreationWidgetState();
}

class _AccountCreationWidgetState extends State<AccountCreationWidget> {
  late AccountCreationModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AccountCreationModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.installId = await actions.getInstallationId();
      _model.installationId = _model.installId!;
      safeSetState(() {});
      if (FFAppState().bAuthScreenViewLogged) {
        return;
      }

      FFAppState().bAuthScreenViewLogged = true;
      FFAppState().tsAuthFirstScreen = getCurrentTimestamp;
      FFAppState().sAuthVariantTemp = getRemoteConfigString('signInHeaderText');
      logFirebaseEvent(
        'auth_screen_view',
        parameters: {
          'variant': FFAppState().sAuthVariantTemp,
        },
      );
      logFirebaseEvent(
        'sign_up_start',
        parameters: {
          'variant': FFAppState().sAuthVariantTemp,
        },
      );
      unawaited(
        () async {
          await actions.metricsSetAuthVariant(
            getRemoteConfigString('signInHeaderText'),
          );
        }(),
      );
    });

    _model.emailFieldTextController ??= TextEditingController();
    _model.emailFieldFocusNode ??= FocusNode();

    _model.passwordFieldTextController ??= TextEditingController();
    _model.passwordFieldFocusNode ??= FocusNode();

    _model.confirmPasswordFieldTextController ??= TextEditingController();
    _model.confirmPasswordFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SingleChildScrollView(
          primary: false,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(24.0, 40.0, 24.0, 24.0),
                  child: Container(
                    child: Container(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 80.0,
                            height: 80.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).primary,
                              borderRadius: BorderRadius.circular(20.0),
                              shape: BoxShape.rectangle,
                            ),
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Icon(
                              Icons.school_rounded,
                              size: 48.0,
                            ),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Create Your Account',
                                style: FlutterFlowTheme.of(context)
                                    .headlineMedium
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .headlineMedium
                                            .fontStyle,
                                      ),
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .headlineMedium
                                          .fontStyle,
                                      lineHeight: 1.25,
                                    ),
                              ),
                              Text(
                                'Sign up with your URI email to access AEC tutoring services.',
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                      lineHeight: 1.5,
                                    ),
                              ),
                              Text(
                                'Variant: ${getRemoteConfigString('signInHeaderText')} | Install ID: ${_model.installationId}',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                            ].divide(SizedBox(height: 4.0)),
                          ),
                        ].divide(SizedBox(height: 24.0)),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 24.0),
                  child: Container(
                    child: Form(
                      key: _model.formKey,
                      autovalidateMode: AutovalidateMode.disabled,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 350.0,
                            child: TextFormField(
                              controller: _model.emailFieldTextController,
                              focusNode: _model.emailFieldFocusNode,
                              onChanged: (_) => EasyDebounce.debounce(
                                '_model.emailFieldTextController',
                                Duration(milliseconds: 2000),
                                () async {
                                  if (_model.bSignupStartLogged == false) {
                                    _model.bSignupStartLogged = true;
                                    logFirebaseEvent(
                                      'signup_start',
                                      parameters: {
                                        'variant':
                                            FFAppState().sAuthVariantTemp,
                                      },
                                    );
                                  }
                                },
                              ),
                              autofocus: false,
                              enabled: true,
                              obscureText: false,
                              decoration: InputDecoration(
                                isDense: true,
                                labelText: 'URI Email Address',
                                labelStyle: GoogleFonts.roboto(
                                  color: Color(0xFFFAF6F6),
                                  fontSize: 16.0,
                                ),
                                hintText: 'student@uri.edu',
                                hintStyle: GoogleFonts.roboto(
                                  color: FlutterFlowTheme.of(context).accent3,
                                  fontSize: 14.0,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                filled: true,
                                fillColor: Color(0xFF01172D),
                                prefixIcon: Icon(
                                  Icons.email_outlined,
                                  color: Color(0xFDFFFFFF),
                                ),
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .labelSmall
                                  .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelSmall
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelSmall
                                        .fontStyle,
                                  ),
                              cursorColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              enableInteractiveSelection: true,
                              validator: _model
                                  .emailFieldTextControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                          Container(
                            width: 350.0,
                            child: TextFormField(
                              controller: _model.passwordFieldTextController,
                              focusNode: _model.passwordFieldFocusNode,
                              autofocus: false,
                              enabled: true,
                              obscureText: !_model.passwordFieldVisibility,
                              decoration: InputDecoration(
                                isDense: true,
                                labelText: 'Password',
                                labelStyle: GoogleFonts.roboto(
                                  color: Color(0xFFFAF6F6),
                                  fontSize: 16.0,
                                ),
                                hintText: 'Enter your password',
                                hintStyle: GoogleFonts.roboto(
                                  color: FlutterFlowTheme.of(context).accent3,
                                  fontSize: 14.0,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                filled: true,
                                fillColor: Color(0xFF01172D),
                                prefixIcon: Icon(
                                  Icons.lock_outline_sharp,
                                  color: Color(0xFDFFFFFF),
                                ),
                                suffixIcon: InkWell(
                                  onTap: () async {
                                    safeSetState(() =>
                                        _model.passwordFieldVisibility =
                                            !_model.passwordFieldVisibility);
                                  },
                                  focusNode: _model
                                      .passwordFieldPasswordVisibilityFocusNode
                                    ..skipTraversal = !(false),
                                  child: Icon(
                                    _model.passwordFieldVisibility
                                        ? Icons.visibility_outlined
                                        : Icons.visibility_off_outlined,
                                    size: 22,
                                  ),
                                ),
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .labelSmall
                                  .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelSmall
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelSmall
                                        .fontStyle,
                                  ),
                              cursorColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              enableInteractiveSelection: true,
                              validator: _model
                                  .passwordFieldTextControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                          Container(
                            width: 350.0,
                            child: TextFormField(
                              controller:
                                  _model.confirmPasswordFieldTextController,
                              focusNode: _model.confirmPasswordFieldFocusNode,
                              autofocus: false,
                              enabled: true,
                              obscureText:
                                  !_model.confirmPasswordFieldVisibility,
                              decoration: InputDecoration(
                                isDense: true,
                                labelText: 'Confirm Password',
                                labelStyle: GoogleFonts.roboto(
                                  color: Color(0xFFFAF6F6),
                                  fontSize: 16.0,
                                ),
                                hintText: 'Repeat your password',
                                hintStyle: GoogleFonts.roboto(
                                  color: FlutterFlowTheme.of(context).accent3,
                                  fontSize: 14.0,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                filled: true,
                                fillColor: Color(0xFF01172D),
                                prefixIcon: Icon(
                                  Icons.lock_outline,
                                  color: Color(0xFDFFFFFF),
                                ),
                                suffixIcon: InkWell(
                                  onTap: () async {
                                    safeSetState(() => _model
                                            .confirmPasswordFieldVisibility =
                                        !_model.confirmPasswordFieldVisibility);
                                  },
                                  focusNode: _model
                                      .confirmPasswordFieldPasswordVisibilityFocusNode
                                    ..skipTraversal = !(false),
                                  child: Icon(
                                    _model.confirmPasswordFieldVisibility
                                        ? Icons.visibility_outlined
                                        : Icons.visibility_off_outlined,
                                    size: 22,
                                  ),
                                ),
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .labelSmall
                                  .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelSmall
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelSmall
                                        .fontStyle,
                                  ),
                              cursorColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              enableInteractiveSelection: true,
                              validator: _model
                                  .confirmPasswordFieldTextControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                          Container(
                            height: 8.0,
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              var _shouldSetState = false;
                              _model.bSignUpFormValid = true;
                              if (_model.formKey.currentState == null ||
                                  !_model.formKey.currentState!.validate()) {
                                _model.bSignUpFormValid = false;
                              }
                              _shouldSetState = true;
                              if (_model.bSignUpFormValid == false) {
                                logFirebaseEvent(
                                  'signup_failed',
                                  parameters: {
                                    'variant': FFAppState().sAuthVariantTemp,
                                    'error_code':
                                        functions.metricsSignInValidationError(
                                            _model
                                                .emailFieldTextController.text,
                                            _model.passwordFieldTextController
                                                .text,
                                            _model
                                                .confirmPasswordFieldTextController
                                                .text),
                                  },
                                );
                                if (_shouldSetState) safeSetState(() {});
                                return;
                              }
                              GoRouter.of(context).prepareAuthEvent();
                              if (_model.passwordFieldTextController.text !=
                                  _model.confirmPasswordFieldTextController
                                      .text) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Passwords don\'t match!',
                                    ),
                                  ),
                                );
                                return;
                              }

                              final user =
                                  await authManager.createAccountWithEmail(
                                context,
                                _model.emailFieldTextController.text,
                                _model.passwordFieldTextController.text,
                              );
                              if (user == null) {
                                return;
                              }

                              await UsersRecord.collection
                                  .doc(user.uid)
                                  .update(createUsersRecordData(
                                    email: _model.emailFieldTextController.text,
                                  ));

                              logFirebaseEvent(
                                'signup_complete',
                                parameters: {
                                  'variant': FFAppState().sAuthVariantTemp,
                                  'seconds_since_first_screen': functions
                                      .metricsSecondsSince(
                                          FFAppState().tsAuthFirstScreen,
                                          getCurrentTimestamp)
                                      .toString(),
                                  'method': 'email',
                                },
                              );
                              logFirebaseEvent(
                                'sign_up',
                                parameters: {
                                  'variant': FFAppState().sAuthVariantTemp,
                                },
                              );

                              await currentUserReference!
                                  .update(createUsersRecordData(
                                metricsInformation: createMetricsDataStruct(
                                  sIGNINAuthVariant:
                                      FFAppState().sAuthVariantTemp,
                                  sIGNINRatingShown: false,
                                  clearUnsetFields: false,
                                ),
                              ));

                              context.pushNamedAuth(
                                  ProfileSetupWidget.routeName,
                                  context.mounted);

                              if (_shouldSetState) safeSetState(() {});
                            },
                            child: wrapWithModel(
                              model: _model.buttonModel1,
                              updateCallback: () => safeSetState(() {}),
                              child: Button2Widget(
                                iconPresent: false,
                                iconEndPresent: false,
                                content: 'Create Account\n',
                                variant: 'primary',
                                size: 'large',
                                fullWidth: true,
                                loading: false,
                                disabled: false,
                              ),
                            ),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Divider(
                                      height: 16.0,
                                      thickness: 1.0,
                                      indent: 0.0,
                                      endIndent: 0.0,
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                    ),
                                  ),
                                  Text(
                                    'OR',
                                    style: FlutterFlowTheme.of(context)
                                        .labelSmall
                                        .override(
                                          font: GoogleFonts.inter(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .labelSmall
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelSmall
                                                    .fontStyle,
                                          ),
                                          color: FlutterFlowTheme.of(context)
                                              .onBackground,
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .labelSmall
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelSmall
                                                  .fontStyle,
                                          lineHeight: 1.2,
                                        ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Divider(
                                      height: 16.0,
                                      thickness: 1.0,
                                      indent: 0.0,
                                      endIndent: 0.0,
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                    ),
                                  ),
                                ].divide(SizedBox(width: 8.0)),
                              ),
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  GoRouter.of(context).prepareAuthEvent();
                                  final user = await authManager
                                      .signInWithGoogle(context);
                                  if (user == null) {
                                    return;
                                  }

                                  context.goNamedAuth(
                                      DropInDashboardWidget.routeName,
                                      context.mounted);
                                },
                                child: wrapWithModel(
                                  model: _model.buttonModel2,
                                  updateCallback: () => safeSetState(() {}),
                                  child: Button2Widget(
                                    icon: Icon(
                                      Icons.account_balance_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 24.0,
                                    ),
                                    iconPresent: true,
                                    iconEndPresent: false,
                                    content: 'Sign in with URI SSO',
                                    variant: 'outline',
                                    size: 'medium',
                                    fullWidth: true,
                                    loading: false,
                                    disabled: false,
                                  ),
                                ),
                              ),
                            ].divide(SizedBox(height: 16.0)),
                          ),
                        ].divide(SizedBox(height: 16.0)),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Container(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Already have an account?',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                    lineHeight: 1.5,
                                  ),
                            ),
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed(
                                  UserLoginWidget.routeName,
                                  extra: <String, dynamic>{
                                    '__transition_info__': TransitionInfo(
                                      hasTransition: true,
                                      transitionType: PageTransitionType.fade,
                                      duration: Duration(milliseconds: 0),
                                    ),
                                  },
                                );
                              },
                              child: wrapWithModel(
                                model: _model.buttonModel3,
                                updateCallback: () => safeSetState(() {}),
                                child: Button2Widget(
                                  iconPresent: false,
                                  iconEndPresent: false,
                                  content: 'Log In',
                                  variant: 'ghost',
                                  size: 'small',
                                  fullWidth: false,
                                  loading: false,
                                  disabled: false,
                                ),
                              ),
                            ),
                          ].divide(SizedBox(width: 4.0)),
                        ),
                        Divider(
                          height: 16.0,
                          thickness: 1.0,
                          indent: 60.0,
                          endIndent: 60.0,
                          color: FlutterFlowTheme.of(context).alternate,
                        ),
                        Container(
                          child: Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Container(
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.location_on_outlined,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 16.0,
                                  ),
                                  Text(
                                    'AEC - Library Ground Floor',
                                    style: FlutterFlowTheme.of(context)
                                        .labelSmall
                                        .override(
                                          font: GoogleFonts.inter(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .labelSmall
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelSmall
                                                    .fontStyle,
                                          ),
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .labelSmall
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelSmall
                                                  .fontStyle,
                                          lineHeight: 1.2,
                                        ),
                                  ),
                                ].divide(SizedBox(width: 8.0)),
                              ),
                            ),
                          ),
                        ),
                      ].divide(SizedBox(height: 8.0)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
