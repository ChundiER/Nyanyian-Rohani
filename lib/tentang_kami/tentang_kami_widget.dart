import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TentangKamiWidget extends StatefulWidget {
  const TentangKamiWidget({Key? key}) : super(key: key);

  @override
  _TentangKamiWidgetState createState() => _TentangKamiWidgetState();
}

class _TentangKamiWidgetState extends State<TentangKamiWidget> {
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
                padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                      child: Container(
                        width: 350,
                        height: 180,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          image: DecorationImage(
                            fit: BoxFit.none,
                            image: Image.asset(
                              'assets/images/logo2_(1).png',
                            ).image,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                      child: Container(
                        width: 350,
                        height: 180,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                          child: SelectionArea(
                              child: Text(
                            'Mahasiswa Universitas Klabat ‘19 \nFakultas Ilmu Komputer - Informatika\n\nUnenor, Marietta Ardelia Gavrila \nNIM : 105021910017\n\nRuntuwne, Chundi Edward\nNIM : 105021910030',
                            textAlign: TextAlign.center,
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.bold,
                                    ),
                          )),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 0),
                child: FFButtonWidget(
                  onPressed: () async {
                    await launchURL(
                        'https://api.whatsapp.com/send/?phone=6282292796985&text&type=phone_number&app_absent=0');
                  },
                  text: 'Laporkan Bug',
                  icon: Icon(
                    Icons.call,
                    size: 15,
                  ),
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 50,
                    color: Color(0xFF3A3A3A),
                    textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                          fontFamily: 'Poppins',
                          color: Colors.white,
                        ),
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(8),
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
