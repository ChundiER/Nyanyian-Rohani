import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class LaguFavoritWidget extends StatefulWidget {
  const LaguFavoritWidget({Key? key}) : super(key: key);

  @override
  _LaguFavoritWidgetState createState() => _LaguFavoritWidgetState();
}

class _LaguFavoritWidgetState extends State<LaguFavoritWidget> {
  Completer<List<NyanyianSeluruhRecord>>? _firestoreRequestCompleter2;
  Completer<List<SimpananNyanyianRecord>>? _firestoreRequestCompleter1;
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
                    length: 2,
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
                              text: 'Lagu Favorit',
                            ),
                            Tab(
                              text: 'Lagu Terbanyak DIkunjungi',
                            ),
                          ],
                        ),
                        Expanded(
                          child: TabBarView(
                            children: [
                              FutureBuilder<List<SimpananNyanyianRecord>>(
                                future:
                                    (_firestoreRequestCompleter1 ??= Completer<
                                            List<SimpananNyanyianRecord>>()
                                          ..complete(
                                              querySimpananNyanyianRecordOnce(
                                            parent: currentUserReference,
                                            queryBuilder:
                                                (simpananNyanyianRecord) =>
                                                    simpananNyanyianRecord
                                                        .where('favorite',
                                                            isEqualTo: true),
                                          )))
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
                                  List<SimpananNyanyianRecord>
                                      listViewSimpananNyanyianRecordList =
                                      snapshot.data!;
                                  return RefreshIndicator(
                                    onRefresh: () async {
                                      setState(() =>
                                          _firestoreRequestCompleter1 = null);
                                      await waitForFirestoreRequestCompleter1();
                                    },
                                    child: ListView.builder(
                                      padding: EdgeInsets.zero,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount:
                                          listViewSimpananNyanyianRecordList
                                              .length,
                                      itemBuilder: (context, listViewIndex) {
                                        final listViewSimpananNyanyianRecord =
                                            listViewSimpananNyanyianRecordList[
                                                listViewIndex];
                                        return Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  5, 5, 5, 0),
                                          child: InkWell(
                                            onTap: () async {
                                              context.pushNamed(
                                                'IsiSimpanan',
                                                queryParams: {
                                                  'simpanLagu': serializeParam(
                                                    listViewSimpananNyanyianRecord,
                                                    ParamType.Document,
                                                  ),
                                                }.withoutNulls,
                                                extra: <String, dynamic>{
                                                  'simpanLagu':
                                                      listViewSimpananNyanyianRecord,
                                                },
                                              );
                                            },
                                            child: Container(
                                              width: 350,
                                              height: 45,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                15, 0, 0, 0),
                                                    child: Text(
                                                      listViewSimpananNyanyianRecord
                                                          .namaLagu!,
                                                      textAlign:
                                                          TextAlign.start,
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
                              FutureBuilder<List<NyanyianSeluruhRecord>>(
                                future: (_firestoreRequestCompleter2 ??=
                                        Completer<List<NyanyianSeluruhRecord>>()
                                          ..complete(
                                              queryNyanyianSeluruhRecordOnce(
                                            queryBuilder:
                                                (nyanyianSeluruhRecord) =>
                                                    nyanyianSeluruhRecord
                                                        .where('jumlahClick',
                                                            isGreaterThan: 5)
                                                        .orderBy('jumlahClick'),
                                          )))
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
                                  List<NyanyianSeluruhRecord>
                                      listViewNyanyianSeluruhRecordList =
                                      snapshot.data!;
                                  return RefreshIndicator(
                                    onRefresh: () async {
                                      setState(() =>
                                          _firestoreRequestCompleter2 = null);
                                      await waitForFirestoreRequestCompleter2();
                                    },
                                    child: ListView.builder(
                                      padding: EdgeInsets.zero,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount:
                                          listViewNyanyianSeluruhRecordList
                                              .length,
                                      itemBuilder: (context, listViewIndex) {
                                        final listViewNyanyianSeluruhRecord =
                                            listViewNyanyianSeluruhRecordList[
                                                listViewIndex];
                                        return Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  5, 5, 5, 0),
                                          child: Container(
                                            width: 350,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(15, 0, 0, 0),
                                                  child: Text(
                                                    listViewNyanyianSeluruhRecord
                                                        .namaLagu!,
                                                    textAlign: TextAlign.start,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Inter',
                                                        ),
                                                  ),
                                                ),
                                              ],
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

  Future waitForFirestoreRequestCompleter1({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = _firestoreRequestCompleter1?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  Future waitForFirestoreRequestCompleter2({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = _firestoreRequestCompleter2?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
