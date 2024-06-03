import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:road_map/resourses/constants.dart';
import 'package:road_map/resourses/value_app.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(42),
            topRight: Radius.circular(42),
          ),
        ),
        builder: (_) => const OnboardContent(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      body: Image.asset(
        "assets/bg.png",
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }
}




class OnboardContent extends StatefulWidget {
  const OnboardContent({super.key});

  @override
  State<OnboardContent> createState() => _OnboardContentState();
}

class _OnboardContentState extends State<OnboardContent> {
  late PageController _pageController;
  late TextEditingController email;
  late GlobalKey<FormState> key;
  // double _progress;
  @override
  void initState() {
    _pageController = PageController()
      ..addListener(() {
        setState(() {});
      });
    email=TextEditingController();
    key=GlobalKey();
    super.initState();
  }
  @override
  void dispose() {
    _pageController.dispose();
    email.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double progress =
    _pageController.hasClients ? (_pageController.page ?? 0) : 0;

    return SizedBox(
      height: 400 + progress * 160,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Column(
            children: [
              const SizedBox(height: 16),
              Expanded(
                child: PageView(
                  controller: _pageController,
                  children:  [
                    SignUpForm(email,key),
                    LandingContent()

                  ],
                ),
              ),
            ],
          ),
          Positioned(
            height: 56,
            bottom: 48 + progress * 180,
            right: 16,
            child: GestureDetector(
              onTap: () {
                if (key.currentState!.validate()) {
                  if (_pageController.page == 0) {
                    _pageController.animateToPage(1,
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.ease);
                  }
                }
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                  gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    stops: [0.4, 0.8],
                    colors: [
                      Color.fromARGB(255, 239, 104, 80),
                      Color.fromARGB(255, 139, 33, 146)
                    ],
                  ),
                ),
                child: DefaultTextStyle(
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 92 + progress * 32,
                        child: Stack(
                          fit: StackFit.passthrough,
                          children: [
                            FadeTransition(
                              opacity: AlwaysStoppedAnimation(1 - progress),
                              child: const Text("Get Started"),
                            ),
                            FadeTransition(
                              opacity: AlwaysStoppedAnimation(progress),
                              child: const Text(
                                "Create account",
                                maxLines: 1,
                                overflow: TextOverflow.fade,
                                softWrap: false,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Icon(
                        Icons.chevron_right,
                        size: 24,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}


class SignUpForm extends StatelessWidget {
late TextEditingController email;
late GlobalKey key;
SignUpForm(this.email,this.key);

@override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Enter your account",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 26,
              ),
            ),
            const SizedBox(height: 16),
            Form(
              key: key,
              child: Column(
                children: [
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    controller: email,
                    validator: (value) => 'enter your email',
                    decoration: InputDecoration(
                      hintText: "Email address",
                      hintStyle: const TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Colors.grey,
                      ),
                      suffixIcon: Icon(
                        Icons.mail,
                        color: Colors.grey.shade400,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // const SizedBox(height: 16),
            const SizedBox(height: 200),
          ],
        ),
      ),
    );
  }
}

class LandingContent extends StatelessWidget {
  const LandingContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Find local \ncommunity events",
            style: Theme.of(context)
                .textTheme
                .headlineLarge!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            "Get involved with what's happening near you.",
            style: TextStyle(fontSize: 24, color: Colors.blueGrey.shade300),
          ),
        ],
      ),
    );
  }
}
