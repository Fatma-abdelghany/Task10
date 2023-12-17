import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';


import '../utils/constants/strings_constants.dart';
import '../widgets/customTextField.dart';

import '../widgets/customButton.dart';
import '../widgets/grey_txt.dart';
import '../widgets/red_txt.dart';



class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late GlobalKey<FormState> formKey;

  TextEditingController? EmailController ;
  TextEditingController? PasswordController;
  TextEditingController? NameController;

  @override
  void initState() {
    // TODO: implement initState
    formKey=GlobalKey<FormState>();
    EmailController = TextEditingController();
    PasswordController = TextEditingController();
    NameController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Center(
          child: Form(
            child: Column(
              children: [
                Container(
            padding: EdgeInsets.all(15),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              )),

                  child: Column(
                    children: [
                      CustomTextField(
                        Controller: EmailController,
                        isPassword: false,
                        hint:StringsConstants.userNameOrEmail,
                        myPrefixIcon: Icon(Icons.email_outlined),
                        type: TextInputType.emailAddress,
                        validatorFun: (value){
                          if(value==null||value==""){
                            return StringsConstants.emailRequired;
                          }
                          if (!EmailValidator.validate(value)) {
                            return StringsConstants.validEmail;
                          }
                          return null;
                        },

                      ),
                      Divider(
                          color: Color(0x9bd7d3d3)
                      ),
                      CustomTextField(
                        Controller: NameController,
                        isPassword: false,
                        hint:StringsConstants.userName,
                        myPrefixIcon: Icon(Icons.person_outlined),
                        type: TextInputType.text,
                        validatorFun:(value){
                          if(value==null||value==""){
                            return StringsConstants.userNameRequired;
                          }

                          return null;
                        },

                      ),


                    ],
                  ),
                ),
                SizedBox(height: 20,),

                Container(
                  padding: EdgeInsets.all(15),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                      ))
                  ,

                  child: CustomTextField(
                    Controller:PasswordController ,
                    isPassword: true,
                    hint:StringsConstants.password,
                    myPrefixIcon: Icon(Icons.lock_outline_rounded),
                    type: TextInputType.emailAddress,
                    validatorFun:(value){
                      if(value==null||value==""){
                        return StringsConstants.passwordRequired;
                      }
                      if (value.length<8) {
                        return StringsConstants.validPassword;
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 10,),

                const SizedBox(height: 10),

                CustomButton(text:StringsConstants.signUP, onBtnPressed: (){
                  if(!(formKey.currentState?.validate()??false) ) return;
                }),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GreyTxt(label: StringsConstants.notHaveAccount,),
                    TextButton(
                      child:  RedTxt(label: StringsConstants.createAccount),
                      onPressed: () {
                        //signup screen
                      },
                    )
                  ],
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
