import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _emailFieldKey = GlobalKey<FormFieldState>();
  final _otpKey = GlobalKey<FormFieldState>();
  bool _isLoading = false;
  int _resendOtpCountdown = 0;
  Timer? _countdownTimer;
  bool _isOtpSent = false;

  @override
  void dispose() {
    _emailController.dispose();
    _otpController.dispose();
    _countdownTimer?.cancel();
    super.dispose();
  }

  void _startResendOtpTimer() {
    _countdownTimer?.cancel(); // Cancel any existing timer
    setState(() {
      _resendOtpCountdown = 30; // Set cooldown period
    });
    _countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_resendOtpCountdown > 0) {
        setState(() {
          _resendOtpCountdown--;
        });
      } else {
        timer.cancel();
      }
    });
  }

  Future<void> _handleSendOtp() async {
    if (_emailFieldKey.currentState!.validate()) {
      setState(() => _isLoading = true);
      try {
        final email = _emailController.text;
        final bool emailExists = await Supabase.instance.client.rpc(
          'check_email_exists',
          params: {'email_to_check': email},
        );

        if (!mounted) return;

        if (emailExists) {
          // If email exists, send OTP to log in
          await Supabase.instance.client.auth.signInWithOtp(email: email);

          if (!mounted) return;

          setState(() => _isOtpSent = true);
          _startResendOtpTimer();
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('OTP sent to your email!')),
          );
        } else {
          // If email does not exist, redirect to signup page
          context.push('/signup?email=$email');
        }
      } catch (error) {
        log("RPC/OTP Error: $error");
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Error: ${error is PostgrestException ? error.message : error.toString()}',
              ),
            ),
          );
        }
      } finally {
        if (mounted) {
          setState(() => _isLoading = false);
        }
      }
    }
  }

  Future<void> _handleLogin() async {
    if (_formKey.currentState!.validate()) {
      setState(() => _isLoading = true);
      try {
        final AuthResponse res = await Supabase.instance.client.auth.verifyOTP(
          type: OtpType.email,
          token: _otpController.text,
          email: _emailController.text,
        );

        if (mounted && res.user != null) {
          // Successful login, GoRouter's redirect logic will handle navigation to /home
          // No explicit navigation needed here if redirects are set up
        } else {
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Login failed. Invalid OTP.')),
            );
          }
        }
      } catch (error) {
        log("Error verifying OTP: $error");
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Error: ${error is AuthException ? error.message : error.toString()}',
              ),
            ),
          );
        }
      } finally {
        if (mounted) {
          setState(() => _isLoading = false);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/unified.png',
                              height: 80,
                            ),
                          ],
                        ),
                        const SizedBox(height: 40),
                        const Text(
                          "Login to\nYour Account",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const Spacer(),
                        ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 400),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                TextFormField(
                                  key: _emailFieldKey,
                                  controller: _emailController,
                                  enabled:
                                      !_isOtpSent, // Disable when OTP is sent
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                    labelText: "E-mail",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                      vertical: 16,
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value == null ||
                                        value.isEmpty ||
                                        !value.contains('@')) {
                                      return 'A valid e-mail is required';
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(height: 16),
                                TextFormField(
                                  key: _otpKey,
                                  controller: _otpController,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    labelText: "OTP",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                      vertical: 16,
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'OTP is required';
                                    }
                                    return null;
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        Row(
                          children: [
                            Expanded(
                              child: SizedBox(
                                height: 54,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFFCDEA66),
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(30),
                                        bottomLeft: Radius.circular(30),
                                      ),
                                    ),
                                  ),
                                  onPressed:
                                      _isLoading ||
                                          (_isOtpSent &&
                                              _resendOtpCountdown > 0)
                                      ? null
                                      : _handleSendOtp,
                                  child: _isLoading && !_isOtpSent
                                      ? const CircularProgressIndicator(
                                          color: Colors.black,
                                        )
                                      : Text(
                                          _isOtpSent
                                              ? (_resendOtpCountdown > 0
                                                    ? 'Resend OTP in $_resendOtpCountdown'
                                                    : 'Resend OTP')
                                              : 'Send OTP',
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: SizedBox(
                                height: 54,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.black,
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(30),
                                        bottomRight: Radius.circular(30),
                                      ),
                                    ),
                                  ),
                                  onPressed:
                                      _isLoading ||
                                          _otpController.text.isEmpty ||
                                          !_isOtpSent
                                      ? null
                                      : _handleLogin,
                                  child: _isLoading && _isOtpSent
                                      ? const CircularProgressIndicator(
                                          color: Colors.white,
                                        )
                                      : const Text(
                                          "Login",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset('assets/images/iedc.png', height: 80),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
