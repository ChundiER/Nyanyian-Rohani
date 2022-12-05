import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  Completer<List<KidungJemaatRecord>>? _firestoreRequestCompleter1;
  Completer<List<KidungJemaatRecord>>? _firestoreRequestCompleter2;
  Completer<List<MazmurRecord>>? _firestoreRequestCompleter3;
  Completer<List<NyanyianRohaniRecord>>? _firestoreRequestCompleter4;
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
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 12, 10, 20),
                child: FFButtonWidget(
                  onPressed: () async {
                    context.pushNamed(
                      'searchLagu',
                      extra: <String, dynamic>{
                        kTransitionInfoKey: TransitionInfo(
                          hasTransition: true,
                          transitionType: PageTransitionType.fade,
                          duration: Duration(milliseconds: 0),
                        ),
                      },
                    );
                  },
                  text: 'Cari Lagu',
                  icon: Icon(
                    Icons.search,
                    size: 15,
                  ),
                  options: FFButtonOptions(
                    width: 354,
                    height: 59,
                    color: Colors.white,
                    textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                          fontFamily: 'Poppins',
                          color: FlutterFlowTheme.of(context).primaryText,
                        ),
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              Expanded(
                child: DefaultTabController(
                  length: 3,
                  initialIndex: 0,
                  child: Column(
                    children: [
                      TabBar(
                        isScrollable: true,
                        labelColor: Colors.black,
                        unselectedLabelColor: Colors.white,
                        labelPadding:
                            EdgeInsetsDirectional.fromSTEB(5, 0, 5, 0),
                        labelStyle:
                            FlutterFlowTheme.of(context).bodyText1.override(
                                  fontFamily: 'Poppins',
                                  letterSpacing: 1,
                                ),
                        indicatorColor: Colors.black,
                        indicatorWeight: 3,
                        tabs: [
                          Tab(
                            text: 'Mazmur',
                          ),
                          Tab(
                            text: 'Nyanyian Rohani',
                          ),
                          Tab(
                            text: 'Kidung Jemaat',
                          ),
                        ],
                      ),
                      Expanded(
                        child: TabBarView(
                          children: [
                            SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  FutureBuilder<List<MazmurRecord>>(
                                    future: (_firestoreRequestCompleter3 ??=
                                            Completer<List<MazmurRecord>>()
                                              ..complete(queryMazmurRecordOnce(
                                                queryBuilder: (mazmurRecord) =>
                                                    mazmurRecord
                                                        .orderBy('nomorMazmur'),
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
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                              size: 40,
                                            ),
                                          ),
                                        );
                                      }
                                      List<MazmurRecord>
                                          listViewMazmurRecordList =
                                          snapshot.data!;
                                      return RefreshIndicator(
                                        onRefresh: () async {
                                          setState(() =>
                                              _firestoreRequestCompleter3 =
                                                  null);
                                          await waitForFirestoreRequestCompleter3();
                                        },
                                        child: ListView.builder(
                                          padding: EdgeInsets.zero,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount:
                                              listViewMazmurRecordList.length,
                                          itemBuilder:
                                              (context, listViewIndex) {
                                            final listViewMazmurRecord =
                                                listViewMazmurRecordList[
                                                    listViewIndex];
                                            return Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(5, 5, 5, 0),
                                              child: InkWell(
                                                onTap: () async {
                                                  context.pushNamed(
                                                    'isiMazmur',
                                                    queryParams: {
                                                      'mazmur': serializeParam(
                                                        listViewMazmurRecord,
                                                        ParamType.Document,
                                                      ),
                                                    }.withoutNulls,
                                                    extra: <String, dynamic>{
                                                      'mazmur':
                                                          listViewMazmurRecord,
                                                    },
                                                  );
                                                },
                                                child: Container(
                                                  width: 350,
                                                  height: 45,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(15, 0,
                                                                    0, 0),
                                                        child: Text(
                                                          listViewMazmurRecord
                                                              .namaMazmur!,
                                                          textAlign:
                                                              TextAlign.start,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
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
                            SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  FutureBuilder<List<NyanyianRohaniRecord>>(
                                    future: (_firestoreRequestCompleter4 ??=
                                            Completer<
                                                List<NyanyianRohaniRecord>>()
                                              ..complete(
                                                  queryNyanyianRohaniRecordOnce(
                                                queryBuilder:
                                                    (nyanyianRohaniRecord) =>
                                                        nyanyianRohaniRecord
                                                            .orderBy(
                                                                'nomorNyanyian'),
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
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                              size: 40,
                                            ),
                                          ),
                                        );
                                      }
                                      List<NyanyianRohaniRecord>
                                          listViewNyanyianRohaniRecordList =
                                          snapshot.data!;
                                      return RefreshIndicator(
                                        onRefresh: () async {
                                          setState(() =>
                                              _firestoreRequestCompleter4 =
                                                  null);
                                          await waitForFirestoreRequestCompleter4();
                                        },
                                        child: ListView.builder(
                                          padding: EdgeInsets.zero,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount:
                                              listViewNyanyianRohaniRecordList
                                                  .length,
                                          itemBuilder:
                                              (context, listViewIndex) {
                                            final listViewNyanyianRohaniRecord =
                                                listViewNyanyianRohaniRecordList[
                                                    listViewIndex];
                                            return Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(5, 5, 5, 0),
                                              child: InkWell(
                                                onTap: () async {
                                                  context.pushNamed(
                                                    'isiNyanyianRohani',
                                                    queryParams: {
                                                      'nyanyianRohani':
                                                          serializeParam(
                                                        listViewNyanyianRohaniRecord,
                                                        ParamType.Document,
                                                      ),
                                                    }.withoutNulls,
                                                    extra: <String, dynamic>{
                                                      'nyanyianRohani':
                                                          listViewNyanyianRohaniRecord,
                                                    },
                                                  );
                                                },
                                                child: Container(
                                                  width: 350,
                                                  height: 45,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(15, 0,
                                                                    0, 0),
                                                        child: Text(
                                                          listViewNyanyianRohaniRecord
                                                              .namaNyanyian!,
                                                          textAlign:
                                                              TextAlign.start,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
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
                            SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  FutureBuilder<List<KidungJemaatRecord>>(
                                    future: (_firestoreRequestCompleter2 ??=
                                            Completer<
                                                List<KidungJemaatRecord>>()
                                              ..complete(
                                                  queryKidungJemaatRecordOnce(
                                                queryBuilder:
                                                    (kidungJemaatRecord) =>
                                                        kidungJemaatRecord.orderBy(
                                                            'nomorKidungJemaat'),
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
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                              size: 40,
                                            ),
                                          ),
                                        );
                                      }
                                      List<KidungJemaatRecord>
                                          listViewKidungJemaatRecordList =
                                          snapshot.data!;
                                      return RefreshIndicator(
                                        onRefresh: () async {
                                          setState(() =>
                                              _firestoreRequestCompleter2 =
                                                  null);
                                          await waitForFirestoreRequestCompleter2();
                                        },
                                        child: ListView.builder(
                                          padding: EdgeInsets.zero,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount:
                                              listViewKidungJemaatRecordList
                                                  .length,
                                          itemBuilder:
                                              (context, listViewIndex) {
                                            final listViewKidungJemaatRecord =
                                                listViewKidungJemaatRecordList[
                                                    listViewIndex];
                                            return Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(5, 5, 5, 0),
                                              child: InkWell(
                                                onTap: () async {
                                                  context.pushNamed(
                                                    'isiKidungJemaat',
                                                    queryParams: {
                                                      'kidungJemaat':
                                                          serializeParam(
                                                        listViewKidungJemaatRecord,
                                                        ParamType.Document,
                                                      ),
                                                    }.withoutNulls,
                                                    extra: <String, dynamic>{
                                                      'kidungJemaat':
                                                          listViewKidungJemaatRecord,
                                                    },
                                                  );
                                                },
                                                child: Container(
                                                  width: 350,
                                                  height: 45,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(15, 0,
                                                                    0, 0),
                                                        child: Text(
                                                          listViewKidungJemaatRecord
                                                              .namaKidungJemaat!,
                                                          textAlign:
                                                              TextAlign.start,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
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
                                  FutureBuilder<List<KidungJemaatRecord>>(
                                    future: (_firestoreRequestCompleter1 ??=
                                            Completer<
                                                List<KidungJemaatRecord>>()
                                              ..complete(
                                                  queryKidungJemaatRecordOnce(
                                                queryBuilder:
                                                    (kidungJemaatRecord) =>
                                                        kidungJemaatRecord.orderBy(
                                                            'nomorKidungJemaat'),
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
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                              size: 40,
                                            ),
                                          ),
                                        );
                                      }
                                      List<KidungJemaatRecord>
                                          listViewKidungJemaatRecordList =
                                          snapshot.data!;
                                      return RefreshIndicator(
                                        onRefresh: () async {
                                          setState(() =>
                                              _firestoreRequestCompleter1 =
                                                  null);
                                          await waitForFirestoreRequestCompleter1();
                                        },
                                        child: ListView.builder(
                                          padding: EdgeInsets.zero,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount:
                                              listViewKidungJemaatRecordList
                                                  .length,
                                          itemBuilder:
                                              (context, listViewIndex) {
                                            final listViewKidungJemaatRecord =
                                                listViewKidungJemaatRecordList[
                                                    listViewIndex];
                                            return Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(5, 5, 5, 0),
                                              child: InkWell(
                                                onTap: () async {
                                                  context.pushNamed(
                                                    'isiKidungJemaat',
                                                    queryParams: {
                                                      'kidungJemaat':
                                                          serializeParam(
                                                        listViewKidungJemaatRecord,
                                                        ParamType.Document,
                                                      ),
                                                    }.withoutNulls,
                                                    extra: <String, dynamic>{
                                                      'kidungJemaat':
                                                          listViewKidungJemaatRecord,
                                                    },
                                                  );
                                                },
                                                child: Container(
                                                  width: 350,
                                                  height: 45,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(15, 0,
                                                                    0, 0),
                                                        child: Text(
                                                          listViewKidungJemaatRecord
                                                              .namaKidungJemaat!,
                                                          textAlign:
                                                              TextAlign.start,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
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
                    ],
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

  Future waitForFirestoreRequestCompleter3({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = _firestoreRequestCompleter3?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  Future waitForFirestoreRequestCompleter4({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = _firestoreRequestCompleter4?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
