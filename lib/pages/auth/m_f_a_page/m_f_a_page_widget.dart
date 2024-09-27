import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'm_f_a_page_model.dart';
export 'm_f_a_page_model.dart';

class MFAPageWidget extends StatefulWidget {
  const MFAPageWidget({
    super.key,
    this.email,
  });

  final String? email;

  @override
  State<MFAPageWidget> createState() => _MFAPageWidgetState();
}

class _MFAPageWidgetState extends State<MFAPageWidget> {
  late MFAPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MFAPageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          actions: const [],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(40.0, 0.0, 40.0, 20.0),
                    child: Text(
                      'Authorization needed to proceed past this point',
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodyMediumFamily,
                            fontSize: 18.0,
                            letterSpacing: 0.0,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).bodyMediumFamily),
                          ),
                    ),
                  ),
                  PinCodeTextField(
                    autoDisposeControllers: false,
                    appContext: context,
                    length: 6,
                    textStyle: FlutterFlowTheme.of(context).bodyLarge.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).bodyLargeFamily,
                          letterSpacing: 0.0,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).bodyLargeFamily),
                        ),
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    enableActiveFill: false,
                    autoFocus: true,
                    enablePinAutofill: true,
                    errorTextSpace: 16.0,
                    showCursor: true,
                    cursorColor: FlutterFlowTheme.of(context).primary,
                    obscureText: false,
                    hintCharacter: '-',
                    keyboardType: TextInputType.number,
                    pinTheme: PinTheme(
                      fieldHeight: 44.0,
                      fieldWidth: 44.0,
                      borderWidth: 2.0,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(12.0),
                        bottomRight: Radius.circular(12.0),
                        topLeft: Radius.circular(12.0),
                        topRight: Radius.circular(12.0),
                      ),
                      shape: PinCodeFieldShape.box,
                      activeColor: FlutterFlowTheme.of(context).accent3,
                      inactiveColor: FlutterFlowTheme.of(context).accent4,
                      selectedColor: FlutterFlowTheme.of(context).accent3,
                    ),
                    controller: _model.pinCodeController,
                    onChanged: (_) {},
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator:
                        _model.pinCodeControllerValidator.asValidator(context),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(30.0, 0.0, 30.0, 0.0),
                    child: Text(
                      'Didnt receive OTP? ',
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodyMediumFamily,
                            color: FlutterFlowTheme.of(context).primaryText,
                            letterSpacing: 0.0,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).bodyMediumFamily),
                          ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(30.0, 0.0, 30.0, 0.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        _model.resendOTPAPIResult = await ResendOTPCall.call(
                          email: widget.email,
                        );

                        if ((_model.resendOTPAPIResult?.succeeded ?? true)) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'OTP send on mail!',
                                style: TextStyle(
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                ),
                              ),
                              duration: const Duration(milliseconds: 4000),
                              backgroundColor:
                                  FlutterFlowTheme.of(context).secondary,
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                (_model.resendOTPAPIResult?.jsonBody ?? '')
                                    .toString(),
                                style: TextStyle(
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                ),
                              ),
                              duration: const Duration(milliseconds: 4000),
                              backgroundColor:
                                  FlutterFlowTheme.of(context).secondary,
                            ),
                          );
                        }

                        safeSetState(() {});
                      },
                      child: Text(
                        'Resend OTP',
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyMediumFamily,
                              color: FlutterFlowTheme.of(context).info,
                              letterSpacing: 0.0,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .bodyMediumFamily),
                            ),
                      ),
                    ),
                  ),
                ],
              ),
              FFButtonWidget(
                onPressed: (_model.pinCodeController!.text != '')
                    ? null
                    : () async {
                        _model.verifyOTPAPIResult = await VerifyOTPCall.call(
                          email: widget.email,
                          otp: _model.pinCodeController!.text,
                        );

                        if ((_model.verifyOTPAPIResult?.succeeded ?? true)) {
                          if (VerifyOTPCall.profile(
                                (_model.verifyOTPAPIResult?.jsonBody ?? ''),
                              ) ==
                              false) {
                            context.goNamedAuth(
                              'CreateProfilePage',
                              context.mounted,
                              queryParameters: {
                                'accessToken': serializeParam(
                                  VerifyOTPCall.accessToken(
                                    (_model.verifyOTPAPIResult?.jsonBody ?? ''),
                                  ),
                                  ParamType.String,
                                ),
                                'refreshToken': serializeParam(
                                  VerifyOTPCall.refreshToken(
                                    (_model.verifyOTPAPIResult?.jsonBody ?? ''),
                                  ),
                                  ParamType.String,
                                ),
                              }.withoutNulls,
                            );
                          } else {
                            FFAppState().accessToken =
                                VerifyOTPCall.accessToken(
                              (_model.verifyOTPAPIResult?.jsonBody ?? ''),
                            )!;
                            FFAppState().refreshToken =
                                VerifyOTPCall.refreshToken(
                              (_model.verifyOTPAPIResult?.jsonBody ?? ''),
                            )!;
                            safeSetState(() {});
                            GoRouter.of(context).prepareAuthEvent();
                            await authManager.signIn(
                              authenticationToken: VerifyOTPCall.accessToken(
                                (_model.verifyOTPAPIResult?.jsonBody ?? ''),
                              ),
                              refreshToken: VerifyOTPCall.refreshToken(
                                (_model.verifyOTPAPIResult?.jsonBody ?? ''),
                              ),
                            );
                          }
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Verification Failed',
                                style: TextStyle(
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                ),
                              ),
                              duration: const Duration(milliseconds: 4000),
                              backgroundColor: const Color(0x5DEA0707),
                            ),
                          );
                        }

                        safeSetState(() {});
                      },
                text: 'Submit',
                options: FFButtonOptions(
                  width: MediaQuery.sizeOf(context).width * 0.6,
                  height: 50.0,
                  padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                  iconPadding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: const Color(0x92666666),
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).titleSmallFamily,
                        color: Colors.white,
                        letterSpacing: 0.0,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).titleSmallFamily),
                      ),
                  elevation: 0.0,
                  borderSide: const BorderSide(
                    color: Colors.transparent,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(25.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
