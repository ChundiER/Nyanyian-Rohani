import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class MusicLaguWidget extends StatefulWidget {
  const MusicLaguWidget({Key? key}) : super(key: key);

  @override
  _MusicLaguWidgetState createState() => _MusicLaguWidgetState();
}

class _MusicLaguWidgetState extends State<MusicLaguWidget> {
  Completer<List<MidiNyanyianRohaniRecord>>? _firestoreRequestCompleter;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFF87A8D0),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: double.infinity,
                height: 83,
                decoration: BoxDecoration(
                  color: Color(0xFF556FB5),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                    topLeft: Radius.circular(0),
                    topRight: Radius.circular(0),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Image.asset(
                        'assets/images/logo_gki-removebg-preview_1.png',
                        width: 50,
                        height: 51,
                        fit: BoxFit.cover,
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                        child: Text(
                          'GEREJA KRISTEN DI TANAH PAPUA',
                          style:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w800,
                                  ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(5, 15, 5, 0),
                  child: DefaultTabController(
                    length: 1,
                    initialIndex: 0,
                    child: Column(
                      children: [
                        TabBar(
                          isScrollable: true,
                          labelColor: Colors.black,
                          unselectedLabelColor: Colors.white,
                          labelPadding:
                              EdgeInsetsDirectional.fromSTEB(5, 0, 5, 0),
                          labelStyle: FlutterFlowTheme.of(context).bodyText1,
                          indicatorColor: Colors.black,
                          indicatorWeight: 2,
                          tabs: [
                            Tab(
                              text: 'Audio Music',
                            ),
                          ],
                        ),
                        Expanded(
                          child: TabBarView(
                            children: [
                              FutureBuilder<List<MidiNyanyianRohaniRecord>>(
                                future: (_firestoreRequestCompleter ??= Completer<
                                        List<MidiNyanyianRohaniRecord>>()
                                      ..complete(
                                          queryMidiNyanyianRohaniRecordOnce()))
                                    .future,
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 40,
                                        height: 40,
                                        child: SpinKitSquareCircle(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryColor,
                                          size: 40,
                                        ),
                                      ),
                                    );
                                  }
                                  List<MidiNyanyianRohaniRecord>
                                      listViewMidiNyanyianRohaniRecordList =
                                      snapshot.data!;
                                  return RefreshIndicator(
                                    onRefresh: () async {
                                      setState(() =>
                                          _firestoreRequestCompleter = null);
                                      await waitForFirestoreRequestCompleter();
                                    },
                                    child: ListView.builder(
                                      padding: EdgeInsets.zero,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount:
                                          listViewMidiNyanyianRohaniRecordList
                                              .length,
                                      itemBuilder: (context, listViewIndex) {
                                        final listViewMidiNyanyianRohaniRecord =
                                            listViewMidiNyanyianRohaniRecordList[
                                                listViewIndex];
                                        return Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  5, 5, 5, 0),
                                          child: InkWell(
                                            onTap: () async {
                                              context.pushNamed(
                                                'IsiMusicAudio',
                                                queryParams: {
                                                  'musicLagu': serializeParam(
                                                    listViewMidiNyanyianRohaniRecord,
                                                    ParamType.Document,
                                                  ),
                                                }.withoutNulls,
                                                extra: <String, dynamic>{
                                                  'musicLagu':
                                                      listViewMidiNyanyianRohaniRecord,
                                                },
                                              );
                                            },
                                            child: Container(
                                              width: 350,
                                              height: 100,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  15, 10, 0, 0),
                                                      child: Text(
                                                        listViewMidiNyanyianRohaniRecord
                                                            .namaLagu!
                                                            .maybeHandleOverflow(
                                                          maxChars: 30,
                                                          replacement: '…',
                                                        ),
                                                        textAlign:
                                                            TextAlign.start,
                                                        maxLines: 1,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w800,
                                                                ),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                15, 5, 0, 15),
                                                    child: Text(
                                                      listViewMidiNyanyianRohaniRecord
                                                          .lirikLagu!
                                                          .maybeHandleOverflow(
                                                        maxChars: 50,
                                                        replacement: '…',
                                                      ),
                                                      textAlign:
                                                          TextAlign.start,
                                                      maxLines: 2,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyText1
                                                          .override(
                                                            fontFamily: 'Inter',
                                                          ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
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

  Future waitForFirestoreRequestCompleter({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = _firestoreRequestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
