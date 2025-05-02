import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/bloc/login_bloc.dart';


class LoginPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth > 600;
    final isTablet = screenWidth > 400 && screenWidth <= 600;

    return Scaffold(
      appBar: isDesktop ? null : AppBar(title: const Text('Login')),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 800),
          padding: EdgeInsets.symmetric(
            horizontal: isDesktop ? 100 : 16,
            vertical: isDesktop ? 40 : 16,
          ),
          child: BlocConsumer<LoginBloc, LoginState>(
            listener: (context, state) => _handleLoginState(context, state),
            builder: (context, state) {
              return SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (isDesktop) ...[
                      const FlutterLogo(size: 100),
                      const SizedBox(height: 40),
                      const Text(
                        'Welcome Back',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                    _buildEmailField(context, isTablet),
                    SizedBox(height: isDesktop ? 24 : 16),
                    _buildPasswordField(context, isTablet),
                    SizedBox(height: isDesktop ? 32 : 24),
                    _buildLoginButton(context, state, isDesktop),
                    if (!isDesktop) ...[
                      const SizedBox(height: 20),
                      _buildForgotPassword(context),
                    ],
                    if (isDesktop) ...[
                      const SizedBox(height: 40),
                      _buildSocialLogin(context),
                    ],
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  void _handleLoginState(BuildContext context, LoginState state) {
    if (state is AuthSuccess) {
      Navigator.pushReplacementNamed(context, '/home');
    } else if (state is AuthFailure) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(state.error)),
      );
    }
  }

  Widget _buildEmailField(BuildContext context, bool isTablet) {
    return TextField(
      controller: _emailController,
      decoration: InputDecoration(
        labelText: 'Email',
        border: const OutlineInputBorder(),
        prefixIcon: const Icon(Icons.email),
        contentPadding: isTablet
            ? const EdgeInsets.symmetric(vertical: 20, horizontal: 16)
            : null,
      ),
      keyboardType: TextInputType.emailAddress,
    );
  }

  Widget _buildPasswordField(BuildContext context, bool isTablet) {
    return TextField(
      controller: _passwordController,
      decoration: InputDecoration(
        labelText: 'Password',
        border: const OutlineInputBorder(),
        prefixIcon: const Icon(Icons.lock),
        contentPadding: isTablet
            ? const EdgeInsets.symmetric(vertical: 20, horizontal: 16)
            : null,
      ),
      obscureText: true,
    );
  }

  Widget _buildLoginButton(
      BuildContext context, LoginState state, bool isDesktop) {
    return SizedBox(
      width: isDesktop ? 400 : double.infinity,
      height: isDesktop ? 50 : null,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: isDesktop
              ? const EdgeInsets.symmetric(vertical: 16)
              : null,
        ),
        onPressed: state is AuthLoading
            ? null
            : () {
          context.read<LoginBloc>().add(
            LoginEvent(
              email: _emailController.text.trim(),
              password: _passwordController.text.trim(),
            ),
          );
        },
        child: state is AuthLoading
            ? const CircularProgressIndicator()
            : Text(
          'Login',
          style: TextStyle(
            fontSize: isDesktop ? 18 : null,
          ),
        ),
      ),
    );
  }

  Widget _buildForgotPassword(BuildContext context) {
    return TextButton(
      onPressed: () {
        // Add forgot password logic
      },
      child: const Text('Forgot Password?'),
    );
  }

  Widget _buildSocialLogin(BuildContext context) {
    return Column(
      children: [
        const Text('Or login with'),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: const Icon(Icons.g_mobiledata, size: 40),
              onPressed: () {},
            ),
            const SizedBox(width: 20),
            IconButton(
              icon: const Icon(Icons.facebook, size: 40),
              onPressed: () {},
            ),
          ],
        ),
      ],
    );
  }
}