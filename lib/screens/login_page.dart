import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../helper/functionMethodClass.dart';

class LoginPage_Screen extends StatefulWidget {
  const LoginPage_Screen({super.key});

  @override
  State<LoginPage_Screen> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage_Screen> {
  late Color myColor;
  late Size mediaSize;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool rememberUser = false;
  bool _obscurePassword = true;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    myColor = const Color.fromARGB(255, 223, 223, 223);
    mediaSize = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        color: myColor,
        image: DecorationImage(
          image: const AssetImage("assets/images/bglogin.jpg"),
          fit: BoxFit.cover,
          colorFilter:
              ColorFilter.mode(myColor.withOpacity(0.2), BlendMode.dstATop),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(children: [
          Positioned(bottom: 0, child: _buildBottom()),
        ]),
      ),
    );
  }


  Widget _buildBottom() {
    return SizedBox(
      width: mediaSize.width,
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          border: Border(
            top: BorderSide(
              color: Color.fromARGB(255, 0, 0, 0),
              width: 2,
            ),
          ),
        ),
        child: Card(
          color: Color.fromARGB(255, 255, 255, 255),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          elevation: 0,
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Form(
              key: _formKey,
              child: _buildForm(),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Welcome to NoteFlow!",
          style: TextStyle(
              color: Color.fromARGB(255, 32, 32, 32),
              fontSize: 24,
              fontWeight: FontWeight.w500),
        ),
        _buildGreyText("Please fill up the necessary credentials."),
        const SizedBox(height: 60),
        _buildGreyText("Email address"),
        _buildInputField(emailController),
        const SizedBox(height: 40),
        _buildGreyText("Password"),
        _buildInputField(passwordController, isPassword: true),
        const SizedBox(height: 20),
        _buildRememberForgot(),
        const SizedBox(height: 20),
        _buildLoginButton(),
        const SizedBox(height: 20),
        _buildOtherLogin(),
      ],
    );
  }

  Widget _buildGreyText(String text) {
    return Text(
      text,
      style: const TextStyle(color: Colors.grey),
    );
  }

  Widget _buildInputField(TextEditingController controller,
      {bool isPassword = false}) {
    return TextFormField(
      cursorColor: const Color.fromARGB(255, 0, 0, 0),
      controller: controller,
      style: const TextStyle(
        color: Color.fromARGB(255, 32, 32, 32),
        fontSize: 16,
      ),
      decoration: InputDecoration(
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(255, 0, 0, 0)),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(255, 70, 70, 70)),
        ),
        border: const UnderlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(255, 0, 0, 0)),
        ),
        suffixIcon: isPassword
            ? GestureDetector(
                onTap: () {
                  setState(() {
                    _obscurePassword = !_obscurePassword;
                  });
                },
                child: Icon(
                  _obscurePassword ? Iconsax.eye : Iconsax.eye_slash,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              )
            : const Icon(
                Iconsax.sms,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
      ),
      obscureText: isPassword && _obscurePassword,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter ${isPassword ? 'password' : 'email address'}';
        }
        return null;
      },
    );
  }

  Widget _buildRememberForgot() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Theme(
              data: ThemeData(
                unselectedWidgetColor: const Color.fromARGB(255, 0, 0, 0),
              ),
              child: Checkbox(
                value: rememberUser,
                onChanged: (value) {
                  setState(() {
                    rememberUser = value ?? false;
                  });
                },
                checkColor: Color.fromARGB(255, 255, 255, 255),
                activeColor: const Color.fromARGB(255, 0, 0, 0),
              ),
            ),
            _buildGreyText("Remember me"),
          ],
        ),
        TextButton(
          onPressed: () {},
          child: _buildGreyText("I forgot my password"),
        )
      ],
    );
  }

  Widget _buildLoginButton() {
    return ElevatedButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          String email = emailController.text;
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TabNavigation(email: email),
            ),
          );
        }
      },
      style: ElevatedButton.styleFrom(
        foregroundColor: const Color.fromARGB(255, 0, 0, 0),
        backgroundColor: const Color.fromARGB(255, 223, 223, 223),
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: const Text('Sign in'),
    );
  }

  Widget _buildOtherLogin() {
    return Center(
      child: Column(
        children: [
          _buildGreyText("or login with"),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Tab(icon: Image.asset("assets/images/facebook.png"), height: 35,),
              Tab(icon: Image.asset("assets/images/twitterx.png"), height: 35),
              Tab(icon: Image.asset("assets/images/github.png"), height: 35),
            ],
          )
        ],
      ),
    );
  }
}
