import 'package:flutter/material.dart';

import 'home_page.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordControllerf = TextEditingController();
  var passwordControllerl = TextEditingController();
  var phoneController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool isPasswordShow = true;
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                  "https://img.freepik.com/free-photo/abstract-blur-defocused-bookshelf-library_1203-9640.jpg?w=1060&t=st=1678207398~exp=1678207998~hmac=49ccfecbbf4dead81603bedf2b216dbaabec7e98c2ee25478551a402cf8e6bd3"),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Sign Up",
                        style: TextStyle(
                            fontSize: 40.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 20,),
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: firstNameController,
                              decoration: InputDecoration(
                                hintText: "First Name",
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                prefixIcon: Icon(
                                  Icons.person,
                                ),
                              ),
                              validator: (fvalue) {
                                if (firstNameController.text.isEmpty)
                                  return "FName must not be empty!";
                              },
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: TextFormField(
                              controller: lastNameController,
                              decoration: InputDecoration(
                                hintText: "Last Name",
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                prefixIcon: Icon(
                                  Icons.person,
                                ),
                              ),
                              validator: (lvalue) {
                                if (lastNameController.text.isEmpty)
                                  return "LName must not be empty!";
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: phoneController,
                        decoration: InputDecoration(
                          hintText: "Phone Number",
                          filled: true,
                          fillColor: Colors.white,
                          prefixIcon: Icon(
                            Icons.phone,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        keyboardType: TextInputType.phone,
                        validator: (phone_value) {
                          if (phoneController.text
                              .trim()
                              .length < 11 )
                            return "Wrong phone number!";
                          if (phoneController.text.isEmpty)
                            return "phone number must not be empty!";
                        },
                      ),
                      SizedBox(height: 20,),
                      TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                          hintText: "Enter Email",
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          prefixIcon: Icon(
                            Icons.email,
                          ),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (emailController.text.isEmpty)
                            return "email must not be empty!";
                          bool foundDomain =
                          emailController.text.contains('.com');
                          bool foundSign = emailController.text.contains('@');
                          if (!foundDomain || !foundSign)
                            return "account does not exist";
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: passwordControllerf,
                        decoration: InputDecoration(
                          hintText: "Enter Password",
                          filled: true,
                          fillColor: Colors.white,
                          prefixIcon: Icon(
                            Icons.lock,
                          ),
                          suffixIcon: IconButton(
                            icon: isPasswordShow
                                ? Icon(Icons.visibility_off)
                                : Icon(Icons.visibility),
                            onPressed: () {
                              setState(() {
                                isPasswordShow = !isPasswordShow;
                              });
                            },
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        obscureText: isPasswordShow,
                        validator: (value) {
                          if (passwordControllerf.text
                              .trim()
                              .length < 6 )
                            return "weak password!";
                          if (passwordControllerf.text.isEmpty)
                            return "password must not be empty!";
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: passwordControllerl,
                        decoration: InputDecoration(
                          hintText: "Confirm Password",
                          filled: true,
                          fillColor: Colors.white,
                          prefixIcon: Icon(
                            Icons.lock,
                          ),
                          suffixIcon: IconButton(
                            icon: isPasswordShow
                                ? Icon(Icons.visibility_off)
                                : Icon(Icons.visibility),
                            onPressed: () {
                              setState(() {
                                isPasswordShow = !isPasswordShow;
                              });
                            },
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        obscureText: isPasswordShow,
                        validator: (value) {
                          if (passwordControllerl.text
                              .trim()
                              .length < 6 )
                            return "weak password!";
                          if (passwordControllerl.text.isEmpty)
                            return "password must not be empty!";
                          if(passwordControllerf.text != passwordControllerl.text)
                            return 'Wrong Password';
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        width: 150,
                        // color: Colors.white.withOpacity(0.9) ,
                        child: MaterialButton(
                          disabledElevation: 5.0,
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              print('valid');
                              Navigator.of(context)
                                  .pushReplacement(MaterialPageRoute(
                                builder: (context) => HomePage(),
                              ));
                            }
                            print(emailController.text);
                            print(passwordControllerf.text);
                          },
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),



      ),
    );
  }
}
