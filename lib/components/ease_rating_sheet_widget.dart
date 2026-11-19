import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/ff_builtin_enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'ease_rating_sheet_model.dart';
export 'ease_rating_sheet_model.dart';

class EaseRatingSheetWidget extends StatefulWidget {
  const EaseRatingSheetWidget({super.key});

  @override
  State<EaseRatingSheetWidget> createState() => _EaseRatingSheetWidgetState();
}

class _EaseRatingSheetWidgetState extends State<EaseRatingSheetWidget> {
  late EaseRatingSheetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EaseRatingSheetModel());

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
            'How easy was it to get started?\n',
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
                  sIGNINAuthEaseRating: _model.ratingBarValue?.round(),
                  clearUnsetFields: false,
                ),
              ));
              logFirebaseEvent(
                'auth_ease_rating',
                parameters: {
                  'rating': _model.ratingBarValue,
                  'variant': currentUserDocument
                      ?.metricsInformation.sIGNINAuthVariant,
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
