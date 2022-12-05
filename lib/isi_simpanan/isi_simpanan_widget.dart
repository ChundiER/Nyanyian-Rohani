import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_toggle_icon.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IsiSimpananWidget extends StatefulWidget {
  const IsiSimpananWidget({
    Key? key,
    this.simpanLagu,
  }) : super(key: key);

  final SimpananNyanyianRecord? simpanLagu;

  @override
  _IsiSimpananWidgetState createState() => _IsiSimpananWidgetState();
}

class _IsiSimpananWidgetState extends State<IsiSimpananWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                StreamBuilder<List<SimpananNyanyianRecord>>(
                  stream: querySimpananNyanyianRecord(
                    parent: currentUserReference,
                    singleRecord: true,
                  ),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 50,
                          height: 50,
                          child: CircularProgressIndicator(
                            color: FlutterFlowTheme.of(context).primaryColor,
                          ),
                        ),
                      );
                    }
                    List<SimpananNyanyianRecord>
                        columnSimpananNyanyianRecordList = snapshot.data!;
                    // Return an empty Container when the document does not exist.
                    if (snapshot.data!.isEmpty) {
                      return Container();
                    }
                    final columnSimpananNyanyianRecord =
                        columnSimpananNyanyianRecordList.isNotEmpty
                            ? columnSimpananNyanyianRecordList.first
                            : null;
                    return Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(12, 40, 12, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 4, 0, 4),
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
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 4, 0, 0),
                                  child: Text(
                                    columnSimpananNyanyianRecord!.namaLagu!,
                                    style: FlutterFlowTheme.of(context).title2,
                                  ),
                                ),
                              ),
                              ToggleIcon(
                                onPressed: () async {
                                  final simpananNyanyianUpdateData = {
                                    'favorite': !columnSimpananNyanyianRecord!
                                        .favorite!,
                                  };
                                  await columnSimpananNyanyianRecord!.reference
                                      .update(simpananNyanyianUpdateData);
                                },
                                value: columnSimpananNyanyianRecord!.favorite!,
                                onIcon: Icon(
                                  Icons.save_alt_sharp,
                                  color: Colors.black,
                                  size: 25,
                                ),
                                offIcon: Icon(
                                  Icons.save_alt,
                                  color: Colors.white,
                                  size: 25,
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
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 4, 0, 4),
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
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 4, 0, 4),
                                  child: SelectionArea(
                                      child: Text(
                                    columnSimpananNyanyianRecord!.lirikLagu!,
                                    textAlign: TextAlign.start,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: Colors.black,
                                        ),
                                  )),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 40),
                          child: FFButtonWidget(
                            onPressed: () async {
                              await widget.simpanLagu!.reference.delete();

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
                            text: 'Hapus Lagu',
                            options: FFButtonOptions(
                              width: 270,
                              height: 50,
                              color: Color(0xFF556FB5),
                              textStyle: FlutterFlowTheme.of(context)
                                  .subtitle2
                                  .override(
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
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
