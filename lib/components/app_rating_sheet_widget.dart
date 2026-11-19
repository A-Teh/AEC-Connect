import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/ff_builtin_enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_rating_sheet_model.dart';
export 'app_rating_sheet_model.dart';

class AppRatingSheetWidget extends StatefulWidget {
  const AppRatingSheetWidget({super.key});

  @override
  State<AppRatingSheetWidget> createState() => _AppRatingSheetWidgetState();
}

class _AppRatingSheetWidgetState extends State<AppRatingSheetWidget> {
  late AppRatingSheetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AppRatingSheetModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: (FFMainAxisAlignment.center).flutterValue,
        children: [
          Text(
            'How are you liking the app so far?',
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  font: GoogleFonts.inter(
                    fontWeight:
                        FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                  ),
                  letterSpacing: 0.0,
                  fontWeight:
                      FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                ),
          ),
          RatingBar.builder(
            onRatingUpdate: (newValue) =>
                safeSetState(() => _model.ratingBarValue = newValue),
            itemBuilder: (context, index) => Icon(
              Icons.star_rounded,
              color: FlutterFlowTheme.of(context).primary,
            ),
            direction: Axis.horizontal,
            initialRating: _model.ratingBarValue ??= 3.0,
            unratedColor: FlutterFlowTheme.of(context).accent1,
            itemCount: 5,
            itemSize: 24.0,
            glowColor: FlutterFlowTheme.of(context).primary,
          ),
          FFButtonWidget(
            onPressed: () async {
              await currentUserReference!.update(createUsersRecordData(
                metricsInformation: createMetricsDataStruct(
                  appRatingLatest: _model.ratingBarValue?.round(),
                  fieldValues: {
                    'app_rating_history': functions.metricsAppendRating(
                        currentUserDocument
                            ?.metricsInformation.appRatingHistory
                            .toList(),
                        _model.ratingBarValue),
                  },
                  clearUnsetFields: false,
                ),
              ));
              logFirebaseEvent(
                'app_rating',
                parameters: {
                  'rating': _model.ratingBarValue,
                  'times_authenticated': currentUserDocument
                      ?.metricsInformation.timesAuthenticated,
                },
              );
              Navigator.pop(context);
            },
            text: 'Submit\n',
            options: FFButtonOptions(
              height: 40.0,
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
              iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
              color: FlutterFlowTheme.of(context).primary,
              textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                    font: GoogleFonts.inter(
                      fontWeight:
                          FlutterFlowTheme.of(context).titleSmall.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).titleSmall.fontStyle,
                    ),
                    color: Colors.white,
                    letterSpacing: 0.0,
                    fontWeight:
                        FlutterFlowTheme.of(context).titleSmall.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).titleSmall.fontStyle,
                  ),
              elevation: 0.0,
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ],
      ),
    );
  }
}
