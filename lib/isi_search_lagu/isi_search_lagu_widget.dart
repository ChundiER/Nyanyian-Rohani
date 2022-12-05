import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IsiSearchLaguWidget extends StatefulWidget {
  const IsiSearchLaguWidget({
    Key? key,
    this.cariLagu,
  }) : super(key: key);

  final NyanyianSeluruhRecord? cariLagu;

  @override
  _IsiSearchLaguWidgetState createState() => _IsiSearchLaguWidgetState();
}

class _IsiSearchLaguWidgetState extends State<IsiSearchLaguWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFF9CB4CC),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(12, 40, 12, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 4),
                            child: Text(
                              'Aplikasi GKI V.1.0.1',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText2
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: Color(0xFF556FB5),
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(12, 0, 12, 4),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                              child: Text(
                                widget.cariLagu!.namaLagu!,
                                style: FlutterFlowTheme.of(context)
                                    .title2
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 4),
                            child: Text(
                              'Lirik Nyanyian',
                              style: FlutterFlowTheme.of(context).bodyText2,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(12, 0, 12, 4),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 4, 0, 4),
                              child: Text(
                                widget.cariLagu!.lirikLagu!,
                                textAlign: TextAlign.start,
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: Colors.black,
                                    ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 40),
                      child: FFButtonWidget(
                        onPressed: () async {
                          final simpananNyanyianCreateData =
                              createSimpananNyanyianRecordData(
                            namaLagu: widget.cariLagu!.namaLagu,
                            lirikLagu: widget.cariLagu!.lirikLagu,
                            nomorLagu: widget.cariLagu!.nomorLagu,
                            favorite: true,
                          );
                          await SimpananNyanyianRecord.createDoc(
                                  currentUserReference!)
                              .set(simpananNyanyianCreateData);

                          context.pushNamed(
                            'laguFavorit',
                            extra: <String, dynamic>{
                              kTransitionInfoKey: TransitionInfo(
                                hasTransition: true,
                                transitionType: PageTransitionType.fade,
                                duration: Duration(milliseconds: 0),
                              ),
                            },
                          );
                        },
                        text: 'Simpan Lagu',
                        options: FFButtonOptions(
                          width: 270,
                          height: 50,
                          color: Color(0xFF556FB5),
                          textStyle:
                              FlutterFlowTheme.of(context).subtitle2.override(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                  ),
                          elevation: 2,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
