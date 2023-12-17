import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';


import '../utils/constants/colors_constants.dart';
import '../utils/constants/strings_constants.dart';
import '../widgets/customButton.dart';
import '../widgets/customTextField.dart';
import '../widgets/grey_txt.dart';
import '../widgets/red_txt.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  late GlobalKey<FormState> formKey;

  TextEditingController? EmailController ;
  TextEditingController? PasswordController;

  @override
  void initState() {
    // TODO: implement initState
    formKey=GlobalKey<FormState>();
    EmailController = TextEditingController();
    PasswordController = TextEditingController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Center(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(15),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(15)),

                  ),
                  child: Column(
                    children: [
                      CustomTextField(
                          Controller: EmailController,
                          isPassword: false,
                          hint:StringsConstants.userNameOrEmail,
                          myPrefixIcon: Icon(Icons.person_outlined,color:ColorsConstants.iconColor,size: 25,),
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
                        Controller:PasswordController ,
                        isPassword: true,
                        hint:StringsConstants.password,
                        myPrefixIcon: Icon(Icons.lock_outline_rounded,color:ColorsConstants.iconColor,size: 25,),
                        type: TextInputType.text,
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
                    ],
                  ),
                ),
                const SizedBox(height: 10),

                CustomButton(
                    text:StringsConstants.login,
                    onBtnPressed: (){
                      if(!(formKey.currentState?.validate()??false) ) return;
                      print("email is ${EmailController?.text}");
                    }),
                const SizedBox(height: 40),
                Row(

                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                     Center(
                       child: GreyTxt(label: StringsConstants.notHaveAccount,
                       ),
                     ),
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
