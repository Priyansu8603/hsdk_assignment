import 'package:flutter/material.dart';

import '../../../../Utils/utils.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {

  //valueNotifier
  final _formKey = GlobalKey<FormState>();
  String _errorMessage = '';
  final ValueNotifier<bool> _isPasswordVisible = ValueNotifier<bool>(true);
  final TextEditingController emailIdController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();


  @override
  void dispose() {
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    emailIdController.dispose();
    passwordController.dispose();
    _isPasswordVisible.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    // Fetch screen size
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Determine if it's a small or large screen
    final isSmallScreen = screenWidth<400 && screenHeight<750;


    return Scaffold(
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(height: 100),
              Image.asset('Core/Assets/Images/logo.jpg',
                height: 140,
                width: 150,
                fit: BoxFit.fill,
              ),
              SizedBox(height: 25),
              Container(
                width: double.infinity,
                padding: EdgeInsets.only(left: 20),
                child: Text("Sign In ",
                    style: TextStyle(fontSize:isSmallScreen?15:30, fontFamily: 'Poppins',fontWeight: FontWeight.w500)),
              ),
              SizedBox(height: 20),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                child: TextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  focusNode: emailFocusNode,
                  cursorColor: Color(0XFF6E8BF3),
                  controller: emailIdController,
                  maxLines: 1,
                  style: TextStyle(
                      fontSize: isSmallScreen?15:20, fontFamily: 'Poppins', color: Colors.black),
                  decoration: InputDecoration(
                    hintText: "Email ID",
                    prefixIcon: Image.asset('Core/Assets/Images/email.png',width:10,height:10,color: Colors.black),
                    hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: isSmallScreen?15:18,
                        fontFamily: 'Poppins'),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0XFF6E8BF3),
                        // Border color when TextField is focused
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8), // Rounded corners
                    ),
                  ),
                ),
              ),
              SizedBox(height: 25),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                child: ValueListenableBuilder<bool>(
                    valueListenable: _isPasswordVisible,
                    builder: (context, value, child) {
                      return TextFormField(
                        keyboardType: TextInputType.visiblePassword,
                        focusNode: passwordFocusNode,
                        cursorColor: Color(0XFF6E8BF3),
                        obscureText: _isPasswordVisible.value,
                        controller: passwordController,
                        maxLines: 1,
                        style: TextStyle(
                            fontSize: isSmallScreen?15:20,
                            fontFamily: 'Poppins',
                            color: Colors.black),
                        decoration: InputDecoration(
                          hintText: "Password",
                          prefixIcon: Image.asset('Core/Assets/Images/lock.png',width:10,height:10,color: Colors.black87,),
                          suffixIcon: InkWell(
                            onTap: () {
                              _isPasswordVisible.value =
                              !_isPasswordVisible.value;
                            },
                            child: Icon(_isPasswordVisible.value
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined),
                          ),
                          hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: isSmallScreen?15:18,
                              fontFamily: 'Poppins'),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0XFF6E8BF3),
                              // Border color when TextField is focused
                              width: 2.0,
                            ),
                            borderRadius:
                            BorderRadius.circular(8), // Rounded corners
                          ),
                        ),
                      );
                    }),
              ),
              SizedBox(height: 15),
              Container(alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Text('Forgot Password?',style: TextStyle(fontFamily:'Poppins',fontSize: 15,color: Color(0XFF6E8BF3)),),
                  )),
              SizedBox(
                height: 65,
              ),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      elevation: 8,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)),
                      backgroundColor: Color(0XFF6E8BF3),
                      padding: EdgeInsets.all(12)),
                  onPressed: () {
                    debugPrint("Login pressed");
                  },
                  child: Center(
                    child: Text(
                      "Sign In",
                      style: TextStyle(
                        color: Colors.white, // Text color
                        fontSize: isSmallScreen?15:20, // Font size]
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Poppins', // Custom font
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 100,
                    child: Divider(
                      color: Colors.grey,
                      thickness: 1.5,
                      endIndent: 10,
                    ),
                  ),
                  Text(
                    'OR',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: isSmallScreen ? 15 : 18, // Slightly larger for readability
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    width: 100,
                    child: Divider(
                      color: Colors.grey,
                      thickness: 1.5,
                      indent: 10, // Space between line and "OR"
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: TextButton(
                    style: TextButton.styleFrom(
                        padding: EdgeInsets.all(12),
                        backgroundColor: Colors.white,
                        side: BorderSide(color: Colors.grey, width: 1),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25))),
                    onPressed: () {
                      debugPrint("SignUP Pressed");
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'Core/Assets/Images/google.png', // Path to your Google icon
                          height: 24, // Adjust icon size
                          width: 24,
                        ),
                        SizedBox(width: 15), // Space between icon and text
                        Text(
                          'Continue with Google',
                          style: TextStyle(
                            fontSize: isSmallScreen ? 15 : 20,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
              )
              ),
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('New to Adhicine?',style: TextStyle(fontSize: 18,fontFamily: 'Poppins',color: Colors.black87),),
                  SizedBox(width:5),
                  Text('Sign Up',style: TextStyle(fontSize: 18,fontFamily: 'Poppins',color: Color(0XFF6E8BF3)),),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
