import 'package:doctor_test/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          SvgPicture.asset("assets/icons/splash_bg.svg"),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Column(
                children: [
                  const Spacer(),
                  SvgPicture.asset(
                    """
assets/icons/gerda_logo.svg""",
height: 200,
width: 200,
 fit: BoxFit.scaleDown
                  ),
                  const Spacer(),
                  // As you can see we need more padding on our btn
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                            Navigator.of(context).pushNamedAndRemoveUntil(
                               '/signup-screen/',
                                (route) => false,
                                );
                          },
                      style: TextButton.styleFrom(
                        backgroundColor: const Color(0xFF6CD8D1),
                      ),
                      child: const Text("Sign Up"),
                    ),
                  ),
                  Padding(
                    padding:
                    
                        const EdgeInsets.symmetric(vertical: defaultPadding),
                    child: SizedBox(
                      
                      width: double.infinity,
                      child: ElevatedButton(
                      
                        onPressed: () {
                            Navigator.of(context).pushNamedAndRemoveUntil(
                               '/signin-screen/',
                                (route) => false,
                                );
                          },
                          
                        style: TextButton.styleFrom(
                                  // backgroundColor: Color(0xFF6CD8D1),
                          elevation: 0,
                          backgroundColor: Colors.transparent,
                          shape: const RoundedRectangleBorder(
                            side: BorderSide(color: Color(0xFF6CD8D1),),
                           
  
                          ),
                          
                        ),
                        child: const Text("Sign In"),
                      ),
                    ),
                  ),
                  const SizedBox(height: defaultPadding),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
