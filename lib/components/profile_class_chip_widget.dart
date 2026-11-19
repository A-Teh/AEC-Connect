import '/flutter_flow/ff_builtin_enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'profile_class_chip_model.dart';
export 'profile_class_chip_model.dart';

class ProfileClassChipWidget extends StatefulWidget {
  const ProfileClassChipWidget({
    super.key,
    this.classCode,
  });

  final String? classCode;

  @override
  State<ProfileClassChipWidget> createState() => _ProfileClassChipWidgetState();
}

class _ProfileClassChipWidgetState extends State<ProfileClassChipWidget> {
  late ProfileClassChipModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfileClassChipModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 34.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primary,
        borderRadius: BorderRadius.circular(8.0),
        shape: BoxShape.rectangle,
        border: Border.all(
          color: FlutterFlowTheme.of(context).alternate,
          width: 1.0,
        ),
      ),
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Align(
        alignment: AlignmentDirectional(0.0, 0.0),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: (FFMainAxisAlignment.spaceBetween).flutterValue,
            crossAxisAlignment: (FFCrossAxisAlignment.center).flutterValue,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Icon(
                Icons.school_rounded,
                color: FlutterFlowTheme.of(context).onPrimary,
                size: 18.0,
              ),
              Text(
                valueOrDefault<String>(
                  widget.classCode,
                  'CSC 101',
                ),
                style: FlutterFlowTheme.of(context).labelMedium.override(
                      font: GoogleFonts.inter(
                        fontWeight:
                            FlutterFlowTheme.of(context).labelMedium.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).labelMedium.fontStyle,
                      ),
                      color: FlutterFlowTheme.of(context).onPrimary,
                      fontSize: 14.0,
                      letterSpacing: 0.0,
                      fontWeight:
                          FlutterFlowTheme.of(context).labelMedium.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).labelMedium.fontStyle,
                      lineHeight: 1.3,
                    ),
              ),
              Align(
                alignment: AlignmentDirectional(1.0, 0.0),
                child: Icon(
                  Icons.remove,
                  color: FlutterFlowTheme.of(context).onPrimary,
                  size: 18.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
