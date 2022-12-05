import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_swipeable_stack.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swipeable_card_stack/swipeable_card_stack.dart';

class TestPageCopyWidget extends StatefulWidget {
  const TestPageCopyWidget({
    Key? key,
    this.cariLagu,
  }) : super(key: key);

  final NyanyianSeluruhRecord? cariLagu;

  @override
  _TestPageCopyWidgetState createState() => _TestPageCopyWidgetState();
}

class _TestPageCopyWidgetState extends State<TestPageCopyWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  late SwipeableCardSectionController swipeableStackController;

  @override
  void initState() {
    super.initState();
    swipeableStackController = SwipeableCardSectionController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFAAAEB4),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: StreamBuilder<List<NyanyianSeluruhRecord>>(
            stream: queryNyanyianSeluruhRecord(
              queryBuilder: (nyanyianSeluruhRecord) =>
                  nyanyianSeluruhRecord.orderBy('nomorLagu'),
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
              List<NyanyianSeluruhRecord>
                  swipeableStackNyanyianSeluruhRecordList = snapshot.data!;
              return FlutterFlowSwipeableStack(
                topCardHeightFraction: 0.8,
                middleCardHeightFraction: 0.68,
                botttomCardHeightFraction: 0.75,
                topCardWidthFraction: 0.9,
                middleCardWidthFraction: 0.85,
                botttomCardWidthFraction: 0.8,
                onSwipeFn: (index) {},
                onLeftSwipe: (index) async {
                  context.pop();
                },
                onRightSwipe: (index) {},
                onUpSwipe: (index) {},
                onDownSwipe: (index) {},
                itemBuilder: (context, swipeableStackIndex) {
                  final swipeableStackNyanyianSeluruhRecord =
                      swipeableStackNyanyianSeluruhRecordList[
                          swipeableStackIndex];
                  return Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: SingleChildScrollView(
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
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12, 40, 12, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 4, 0, 4),
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
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12, 0, 12, 4),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 4, 0, 0),
                                            child: Text(
                                              swipeableStackNyanyianSeluruhRecord
                                                  .namaLagu!,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .title2
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                      ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12, 10, 12, 10),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        InkWell(
                                          onTap: () async {
                                            swipeableStackController
                                                .triggerSwipeLeft();
                                          },
                                          child: Icon(
                                            Icons.chevron_left,
                                            color: Colors.black,
                                            size: 24,
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () async {
                                            swipeableStackController
                                                .triggerSwipeRight();
                                          },
                                          child: Icon(
                                            Icons.chevron_right,
                                            color: Colors.black,
                                            size: 24,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12, 4, 12, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 4, 0, 4),
                                          child: Text(
                                            'Lirik Nyanyian',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText2,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12, 0, 12, 4),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 4, 0, 4),
                                            child: Text(
                                              swipeableStackNyanyianSeluruhRecord
                                                  .lirikLagu!,
                                              textAlign: TextAlign.start,
                                              style:
                                                  FlutterFlowTheme.of(context)
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
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 20, 0, 40),
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
                                              transitionType:
                                                  PageTransitionType.fade,
                                              duration:
                                                  Duration(milliseconds: 0),
                                            ),
                                          },
                                        );
                                      },
                                      text: 'Simpan Lagu',
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
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
                itemCount: swipeableStackNyanyianSeluruhRecordList.length,
                controller: swipeableStackController,
                enableSwipeUp: false,
                enableSwipeDown: false,
              );
            },
          ),
        ),
      ),
    );
  }
}
