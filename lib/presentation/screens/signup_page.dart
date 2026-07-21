import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:k_urja/presentation/widgets/custom_textfield.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
// 1. IMPORT LOCALIZATION
import '../../l10n/app_localizations.dart';
// 2. CHECK THIS IMPORT: Ensure it points to your actual folder (widget vs widgets)
// If your folder is named 'widget', change 'widgets' to 'widget' below.

class SignupPage extends StatefulWidget {
  final String? initialEmail;

  const SignupPage({super.key, this.initialEmail});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  // Controllers
  final _nameController = TextEditingController();
  final _mobileController = TextEditingController();
  final _emailController = TextEditingController();
  final _ktuController = TextEditingController();
  final _passwordController = TextEditingController();
  final _collegeController = TextEditingController();
  final _nssController = TextEditingController();
  final _yearController = TextEditingController();
  final _otpController = TextEditingController(); // New OTP controller

  final _formKey = GlobalKey<FormState>();

  bool _isOtpSent = false;
  bool _isLoading = false;
  int _resendOtpCountdown = 0;
  Timer? _countdownTimer;

  @override
  void initState() {
    super.initState();
    if (widget.initialEmail != null) {
      _emailController.text = widget.initialEmail!;
    }
    // Listen to OTP controller to enable/disable signup button
    _otpController.addListener(() {
      setState(() {}); // Rebuilds to update button state
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _mobileController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _collegeController.dispose();
    _ktuController.dispose();
    _nssController.dispose();
    _yearController.dispose();
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

  Future<void> _handleSendOtp({bool isResend = false}) async {
    if (_emailController.text.isEmpty || !_emailController.text.contains('@')) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a valid email address.')),
      );
      return;
    }
    setState(() => _isLoading = true);
    try {
      await Supabase.instance.client.auth.signInWithOtp(
        email: _emailController.text,
        shouldCreateUser: !isResend, // Don't create a new user on resend
      );
      setState(() => _isOtpSent = true);
      _startResendOtpTimer(); // Start the timer
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('OTP sent to your email!')),
        );
      }
    } catch (error) {
      log("Error sending OTP: $error");
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Error: ${error.toString()}')));
      }
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _handleSignup() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    setState(() => _isLoading = true);
    try {
      // 1. Verify the OTP
      final authResponse = await Supabase.instance.client.auth.verifyOTP(
        type: OtpType.signup,
        token: _otpController.text,
        email: _emailController.text,
      );

      if (authResponse.user == null) {
        throw 'OTP verification failed. Please try again.';
      }

      // 2. Insert data into the profiles table
      await Supabase.instance.client.from('profiles').insert({
        'id': authResponse.user!.id,
        'full_name': _nameController.text,
        'mobile_number': _mobileController.text,
        'college_name': _collegeController.text,
        'nss_unit_no': _nssController.text,
        'year': int.tryParse(_yearController.text),
        'email': _emailController.text,
        'ktu_regno': _ktuController.text,
      });

      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Signup successful!')));
        // GoRouter redirect logic will handle navigation to /home
        context.go('/home');
      }
    } catch (error) {
      log("Signup Error: $error");
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Signup failed: ${error is AuthException ? error.message : error.toString()}',
            ),
          ),
        );
      }
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    // Signup button is enabled only if an OTP has been sent and entered, and not loading.
    final isSignupButtonEnabled =
        _isOtpSent && _otpController.text.isNotEmpty && !_isLoading;

    // 3. INITIALIZE LOCALIZATION SHORTCUT
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          l10n.signupTitle,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SafeArea(
        child: Center(
          // 1. Center the content
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: ConstrainedBox(
              // 2. Limit width to 400px so it looks good on Web
              constraints: const BoxConstraints(maxWidth: 400),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    // --- Input Fields ---
                    CustomTextField(
                      label: l10n.labelFullName, // "Full name"
                      controller: _nameController,
                      validator: (val) => val!.isEmpty ? 'Required' : null,
                    ),
                    CustomTextField(
                      label: l10n.labelMobileNumber, // "Mobile number"
                      controller: _mobileController,
                      keyboardType: TextInputType.phone,
                      validator: (val) => val!.isEmpty ? 'Required' : null,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: CustomTextField(
                            label: "E-mail",
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                            enabled: !_isOtpSent, // Disable after sending OTP
                            validator: (val) =>
                                (val == null || !val.contains('@'))
                                ? 'Enter a valid email'
                                : null,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: ElevatedButton(
                            onPressed: _isOtpSent || _isLoading
                                ? null
                                : () => _handleSendOtp(),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFCDEA66),
                            ),
                            child: _isLoading && !_isOtpSent
                                ? const SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                      color: Colors.black,
                                    ),
                                  )
                                : const Text("Get OTP"),
                          ),
                        ),
                      ],
                    ),
                    if (_isOtpSent)
                      Column(
                        children: [
                          CustomTextField(
                            label: "OTP",
                            controller: _otpController,
                            keyboardType: TextInputType.number,
                            validator: (val) =>
                                val!.isEmpty ? 'Required' : null,
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: _resendOtpCountdown > 0 || _isLoading
                                  ? null
                                  : () => _handleSendOtp(isResend: true),
                              child: Text(
                                _resendOtpCountdown > 0
                                    ? 'Resend OTP in $_resendOtpCountdown'
                                    : 'Resend OTP',
                              ),
                            ),
                          ),
                        ],
                      ),
                    CustomTextField(
                      label: l10n.labelCollegeName, // "College name"
                      controller: _collegeController,
                      validator: (val) => val!.isEmpty ? 'Required' : null,
                    ),
                    CustomTextField(
                      label: l10n.labelKTUNumber,
                      controller: _ktuController,
                    ),
                    CustomTextField(
                      label: l10n.labelNSSUnit, // "NSS Unit No."
                      controller: _nssController,
                      validator: (val) => val!.isEmpty ? 'Required' : null,
                    ),
                    CustomTextField(
                      label: l10n.labelYear, // "Year"
                      controller: _yearController,
                      keyboardType: TextInputType.number,
                      validator: (val) => val!.isEmpty ? 'Required' : null,
                    ),
                    const SizedBox(height: 32),
                    SizedBox(
                      width: double.infinity,
                      height: 54,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: isSignupButtonEnabled
                              ? Colors.black
                              : const Color(0xFFCDEA66),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          disabledBackgroundColor: Colors.grey.shade400,
                        ),
                        onPressed: isSignupButtonEnabled ? _handleSignup : null,
                        child: _isLoading
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : Text(
                                "Signup",
                                style: TextStyle(
                                  color: isSignupButtonEnabled
                                      ? Colors.white
                                      : Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
