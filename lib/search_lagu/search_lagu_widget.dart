import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_autocomplete_options_list.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:text_search/text_search.dart';

class SearchLaguWidget extends StatefulWidget {
  const SearchLaguWidget({Key? key}) : super(key: key);

  @override
  _SearchLaguWidgetState createState() => _SearchLaguWidgetState();
}

class _SearchLaguWidgetState extends State<SearchLaguWidget> {
  List<NyanyianSeluruhRecord> simpleSearchResults = [];
  final textFieldKey = GlobalKey();
  TextEditingController? textController;
  String? textFieldSelectedOption;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() => FFAppState().searchActive = false);
    });

    textController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<NyanyianSeluruhRecord>>(
      stream: queryNyanyianSeluruhRecord(
        queryBuilder: (nyanyianSeluruhRecord) =>
            nyanyianSeluruhRecord.orderBy('nomorLagu'),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 40,
              height: 40,
              child: CircularProgressIndicator(
                color: Color(0xFF047DED),
              ),
            ),
          );
        }
        List<NyanyianSeluruhRecord> searchLaguNyanyianSeluruhRecordList =
            snapshot.data!;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: Color(0xFF9CB4CC),
          appBar: AppBar(
            backgroundColor: Color(0xFF9CB4CC),
            automaticallyImplyLeading: false,
            leading: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30,
              borderWidth: 1,
              buttonSize: 54,
              icon: Icon(
                Icons.arrow_back_rounded,
                color: FlutterFlowTheme.of(context).secondaryText,
                size: 24,
              ),
              onPressed: () async {
                context.pop();
              },
            ),
            title: Text(
              'Cari Lagu',
              style: FlutterFlowTheme.of(context).title3,
            ),
            actions: [],
            centerTitle: false,
            elevation: 0,
          ),
          body: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 12),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Autocomplete<String>(
                            initialValue: TextEditingValue(),
                            optionsBuilder: (textEditingValue) {
                              if (textEditingValue.text == '') {
                                return const Iterable<String>.empty();
                              }
                              return searchLaguNyanyianSeluruhRecordList
                                  .map((e) => e.namaLagu!)
                                  .toList()
                                  .toList()
                                  .where((option) {
                                final lowercaseOption = option.toLowerCase();
                                return lowercaseOption.contains(
                                    textEditingValue.text.toLowerCase());
                              });
                            },
                            optionsViewBuilder: (context, onSelected, options) {
                              return AutocompleteOptionsList(
                                textFieldKey: textFieldKey,
                                textController: textController!,
                                options: options.toList(),
                                onSelected: onSelected,
                                textStyle:
                                    FlutterFlowTheme.of(context).bodyText1,
                                textHighlightStyle: TextStyle(),
                                elevation: 4,
                                optionBackgroundColor:
                                    FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                optionHighlightColor:
                                    FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                maxHeight: 200,
                              );
                            },
                            onSelected: (String selection) {
                              setState(
                                  () => textFieldSelectedOption = selection);
                              FocusScope.of(context).unfocus();
                            },
                            fieldViewBuilder: (
                              context,
                              textEditingController,
                              focusNode,
                              onEditingComplete,
                            ) {
                              textController = textEditingController;
                              return TextFormField(
                                key: textFieldKey,
                                controller: textEditingController,
                                focusNode: focusNode,
                                onEditingComplete: onEditingComplete,
                                onChanged: (_) => EasyDebounce.debounce(
                                  'textController',
                                  Duration(milliseconds: 2000),
                                  () async {
                                    setState(() {
                                      simpleSearchResults = TextSearch(
                                        searchLaguNyanyianSeluruhRecordList
                                            .map(
                                              (record) => TextSearchItem(
                                                  record, [
                                                record.namaLagu!,
                                                record.lirikLagu!
                                              ]),
                                            )
                                            .toList(),
                                      )
                                          .search(textController!.text)
                                          .map((r) => r.object)
                                          .toList();
                                    });
                                    setState(
                                        () => FFAppState().searchActive = true);
                                  },
                                ),
                                autofocus: true,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'Cari lagu...',
                                  labelStyle:
                                      FlutterFlowTheme.of(context).bodyText2,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  filled: true,
                                  fillColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                style: FlutterFlowTheme.of(context).bodyText1,
                                maxLines: null,
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                          child: FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 30,
                            borderWidth: 1,
                            buttonSize: 44,
                            icon: Icon(
                              Icons.clear,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 24,
                            ),
                            onPressed: () async {
                              setState(() {
                                textController?.clear();
                              });
                              setState(() => FFAppState().searchActive = false);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(24, 0, 0, 0),
                        child: Text(
                          'List Lagu',
                          style: FlutterFlowTheme.of(context).bodyText2,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(90, 0, 5, 0),
                        child: SelectionArea(
                            child: Text(
                          'Hasil Pencarian ${simpleSearchResults.length.toString()} Lagu',
                          style: FlutterFlowTheme.of(context).bodyText1,
                        )),
                      ),
                    ],
                  ),
                  if (!FFAppState().searchActive)
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                      child: Builder(
                        builder: (context) {
                          final laguNoSearch =
                              searchLaguNyanyianSeluruhRecordList.toList();
                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            primary: false,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: laguNoSearch.length,
                            itemBuilder: (context, laguNoSearchIndex) {
                              final laguNoSearchItem =
                                  laguNoSearch[laguNoSearchIndex];
                              return Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16, 4, 16, 8),
                                child: Container(
                                  width: double.infinity,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 4,
                                        color: Color(0x32000000),
                                        offset: Offset(0, 2),
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8, 0, 8, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(26),
                                          child: Image.asset(
                                            'assets/images/istockphoto-481475560-612x612.jpg',
                                            width: 36,
                                            height: 36,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12, 0, 0, 0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  laguNoSearchItem.namaLagu!
                                                      .maybeHandleOverflow(
                                                    maxChars: 20,
                                                    replacement: '…',
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1,
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Text(
                                                      laguNoSearchItem
                                                          .tipeLagu!,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText2,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        FFButtonWidget(
                                          onPressed: () async {
                                            context.pushNamed(
                                              'testPage',
                                              queryParams: {
                                                'cariLagu': serializeParam(
                                                  laguNoSearchItem,
                                                  ParamType.Document,
                                                ),
                                              }.withoutNulls,
                                              extra: <String, dynamic>{
                                                'cariLagu': laguNoSearchItem,
                                              },
                                            );

                                            final nyanyianSeluruhUpdateData = {
                                              'jumlahClick':
                                                  FieldValue.increment(1),
                                            };
                                            await laguNoSearchItem.reference
                                                .update(
                                                    nyanyianSeluruhUpdateData);
                                          },
                                          text: 'Buka',
                                          options: FFButtonOptions(
                                            width: 70,
                                            height: 36,
                                            color: Color(0xFF87A8D0),
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyText1
                                                    .override(
                                                      fontFamily: 'Outfit',
                                                      color: Colors.white,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    ),
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 1,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  if (FFAppState().searchActive)
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 44),
                      child: Builder(
                        builder: (context) {
                          final laguNoSearch = simpleSearchResults.toList();
                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            primary: false,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: laguNoSearch.length,
                            itemBuilder: (context, laguNoSearchIndex) {
                              final laguNoSearchItem =
                                  laguNoSearch[laguNoSearchIndex];
                              return Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16, 4, 16, 8),
                                child: Container(
                                  width: double.infinity,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 4,
                                        color: Color(0x32000000),
                                        offset: Offset(0, 2),
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8, 0, 8, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(26),
                                          child: Image.asset(
                                            'assets/images/istockphoto-481475560-612x612.jpg',
                                            width: 36,
                                            height: 36,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12, 0, 0, 0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  laguNoSearchItem.namaLagu!
                                                      .maybeHandleOverflow(
                                                    maxChars: 20,
                                                    replacement: '…',
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1,
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Text(
                                                      laguNoSearchItem
                                                          .tipeLagu!,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText2,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        FFButtonWidget(
                                          onPressed: () async {
                                            context.pushNamed(
                                              'testPage',
                                              queryParams: {
                                                'cariLagu': serializeParam(
                                                  laguNoSearchItem,
                                                  ParamType.Document,
                                                ),
                                              }.withoutNulls,
                                              extra: <String, dynamic>{
                                                'cariLagu': laguNoSearchItem,
                                              },
                                            );
                                          },
                                          text: 'Buka',
                                          options: FFButtonOptions(
                                            width: 70,
                                            height: 36,
                                            color: Color(0xFF87A8D0),
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyText1
                                                    .override(
                                                      fontFamily: 'Outfit',
                                                      color: Colors.white,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    ),
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 1,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
