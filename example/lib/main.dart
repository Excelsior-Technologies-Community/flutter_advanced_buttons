import 'package:flutter/material.dart';
import 'package:flutter_advanced_buttons/flutter_advanced_buttons.dart';

void main() {
  runApp(const AdvancedButtonsExampleApp());
}

class AdvancedButtonsExampleApp extends StatelessWidget {
  const AdvancedButtonsExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Advanced Button Pack',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.indigo,
        scaffoldBackgroundColor: const Color(0xFFF7F8FC),
      ),
      home: const AdvancedButtonsHomePage(),
    );
  }
}

class AdvancedButtonsHomePage extends StatefulWidget {
  const AdvancedButtonsHomePage({super.key});

  @override
  State<AdvancedButtonsHomePage> createState() =>
      AdvancedButtonsHomePageState();
}

class AdvancedButtonsHomePageState extends State<AdvancedButtonsHomePage> {
  bool toggleValue = false;
  bool loadingValue = false;

  Future<void> handleLoadingButton() async {
    if (loadingValue) {
      return;
    }

    setState(() {
      loadingValue = true;
    });

    await Future.delayed(const Duration(seconds: 2));

    if (!mounted) {
      return;
    }

    setState(() {
      loadingValue = false;
    });

    showDemoMessage('Action completed successfully');
  }

  void handleRippleButton() {
    showDemoMessage('Ripple button pressed');
  }

  void handleGradientButton() {
    showDemoMessage('Gradient button pressed');
  }

  void showDemoMessage(String message) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(message),
          behavior: SnackBarBehavior.floating,
          duration: const Duration(seconds: 2),
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Advanced Button Pack',
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
        centerTitle: false,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const SizedBox(height: 28),
              buildSection(
                title: 'Gradient Button',
                description:
                    'Custom gradient, icon, border and shadow support.',
                child: AdvancedGradientButton(
                  text: 'Get Started',
                  icon: Icons.arrow_forward_rounded,
                  colors: const [Colors.indigo, Colors.deepPurple],
                  width: double.infinity,
                  height: 52,
                  borderRadius: 14,
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 10,
                      offset: Offset(0, 4),
                      color: Color(0x22000000),
                    ),
                  ],
                  onPressed: handleGradientButton,
                ),
              ),
              const SizedBox(height: 20),
              buildSection(
                title: 'Loading Button',
                description:
                    'Automatically disables interaction while loading.',
                child: AdvancedLoadingButton(
                  text: 'Submit',
                  icon: Icons.check_rounded,
                  isLoading: loadingValue,
                  width: double.infinity,
                  height: 52,
                  borderRadius: 14,
                  backgroundColor: Colors.indigo,
                  onPressed: handleLoadingButton,
                ),
              ),
              const SizedBox(height: 20),
              buildSection(
                title: 'Toggle Button',
                description:
                    'Controlled toggle state with animated transitions.',
                child: Center(
                  child: AdvancedToggleButton(
                    value: toggleValue,
                    activeText: 'Enabled',
                    inactiveText: 'Disabled',
                    activeIcon: Icons.check_rounded,
                    inactiveIcon: Icons.close_rounded,
                    activeColor: Colors.green,
                    inactiveColor: Colors.grey,
                    height: 50,
                    borderRadius: 25,
                    onChanged: (value) {
                      setState(() {
                        toggleValue = value;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20),
              buildSection(
                title: 'Ripple Button',
                description:
                    'Material ripple feedback with icon and border support.',
                child: AdvancedRippleButton(
                  text: 'Tap Me',
                  icon: Icons.touch_app_rounded,
                  width: double.infinity,
                  height: 52,
                  borderRadius: 14,
                  backgroundColor: Colors.deepPurple,
                  rippleColor: Colors.white,
                  elevation: 2,
                  onPressed: handleRippleButton,
                ),
              ),
              const SizedBox(height: 28),

            ],
          ),
        ),
      ),
    );
  }

  Widget buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Advanced Button Pack',
          style: Theme.of(
            context,
          ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w800),
        ),
        const SizedBox(height: 8),
        Text(
          'A collection of customizable Flutter buttons '
          'for modern application interfaces.',
          style: Theme.of(
            context,
          ).textTheme.bodyMedium?.copyWith(color: Colors.black54, height: 1.5),
        ),
      ],
    );
  }

  Widget buildSection({
    required String title,
    required String description,
    required Widget child,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFFE5E7EB)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 5),
          Text(
            description,
            style: const TextStyle(
              fontSize: 13,
              color: Colors.black54,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 18),
          child,
        ],
      ),
    );
  }

}
