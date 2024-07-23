import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:collab_notion_clone/Screens/UserCreationAndSignUp/SignUpScreen.dart';
import 'package:collab_notion_clone/Screens/UserCreationAndSignUp/widgets/CustomTextField.dart';
import 'package:collab_notion_clone/Screens/UserCreationAndSignUp/widgets/buttonWithNameAndImage.dart';
import 'package:collab_notion_clone/Screens/UserCreationAndSignUp/widgets/customButton.dart';
import 'package:collab_notion_clone/auth/authController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  bool emailClick = false;
  bool otpCheck = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocus = FocusNode();

  @override
  void dispose() {
    _emailFocusNode.dispose();
    _passwordFocus.dispose();
    _emailController.dispose();
    _password.dispose();
    super.dispose();
  }

  void signInWithGoogle(ref) {
    // Implement your Google Sign-In logic here
    ref.read(authControllerProvider).signInWithGoogle();
  }

  void oldUserEntry(ref, context) {
    ref.read(authControllerProvider).oldUserEntry(_emailController.text, _password.text, context);
  }

  void _focusOnEmailField() {
    FocusScope.of(context).requestFocus(_emailFocusNode);
  }

  void _focusOnVerificationCodeField() {
    FocusScope.of(context).requestFocus(_passwordFocus);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 60),
              Container(
                color: Colors.black,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: DefaultTextStyle(
                    style: GoogleFonts.openSans(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    child: AnimatedTextKit(
                      repeatForever: true,
                      pause: const Duration(milliseconds: 2000),
                      animatedTexts: [
                        TypewriterAnimatedText('Think it. Make it.'),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "Log in to your collab account",
                textAlign: TextAlign.left,
                style: theme.textTheme.titleMedium!.copyWith(color: const Color(0xff979A9B)),
              ),
              const SizedBox(height: 300),
              Center(
                child: Column(
                  children: [
                    ButtonWithNameAndImage(
                      imageName: "assets/google_icon.png",
                      ontap: () => signInWithGoogle(ref),
                      loginfield: "Continue With Google",
                    ),
                    const SizedBox(height: 10),
                    ButtonWithNameAndImage(
                      imageName: "assets/mail.png",
                      ontap: () {
                        setState(() {
                          emailClick = !emailClick;
                        });
                      },
                      loginfield: "Continue With Email",
                    ),
                    Divider(
                      thickness: 2,
                      color: theme.colorScheme.outline,
                    ),
                  ],
                ),
              ),
              if (emailClick)
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "EMAIL",
                      style: theme.textTheme.titleSmall!.copyWith(color: theme.colorScheme.outline),
                    ),
                    CustomTextField(
                      controller: _emailController,
                      hintText: "Enter your Email",
                      focus: _emailFocusNode,
                      onTap: _focusOnEmailField,
                    ),
                    const SizedBox(height: 20),
                    CustomTextField(
                      controller: _password,
                      hintText: "Enter the Verification Code",
                      focus: _passwordFocus,
                      onTap: _focusOnVerificationCodeField,
                    ),
                    const SizedBox(height: 20),
                    CustomButton(
                      text: "Continue",
                      onTap: () => oldUserEntry(ref, context),
                    ),
                  ],
                ),
              const SizedBox(height: 20),
              CustomButton(
                text: "New User",
                onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SignUpScreen())),
              ),
              const SizedBox(height: 300),
            ],
          ),
        ),
      ),
    );
  }
}
