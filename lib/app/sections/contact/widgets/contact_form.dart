import 'package:emailjs/emailjs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mysite/core/res/responsive.dart';
import 'package:mysite/core/util/validations.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/color/colors.dart';
import '../../../widgets/gradient_text.dart';


class ContactForm extends StatefulWidget {
  const ContactForm ({super.key});

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final GlobalKey<FormState> key = GlobalKey<FormState>();

    final TextEditingController nameCtr = TextEditingController();
    final TextEditingController emailCtr = TextEditingController();
    final TextEditingController messageCtr = TextEditingController();

    return Form(
      key: key,
        child: Container(
      width: Responsive.isDesktop(context) ? size.width*0.6 : size.width*0.8,
      padding: EdgeInsets.symmetric(horizontal: 5.w,vertical: 5.h),
      decoration: BoxDecoration(
          gradient: grayBack,
          borderRadius: BorderRadius.circular(30)
      ),
      child: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(
                labelText: "Your Name",
                prefixIcon: Icon(Icons.person),
            ),
            controller: nameCtr,
            validator: (val)=>KValidations.validateEmptyField(val, "Name"),
          ),
          SizedBox(height: 2.h,),
          TextFormField(
            decoration: const InputDecoration(
                labelText: "Your Email",
                prefixIcon: Icon(Icons.email)
            ),
              validator: KValidations.validateEmail,
            controller: emailCtr,
          ),
          SizedBox(height: 2.h,),
          TextFormField(
            decoration: const InputDecoration(
                prefixIcon: Padding(padding: EdgeInsets.only(bottom: 64), child: Icon(Icons.message_rounded)),
                label: Text("Your Message"),
                hintText: "Your Message",
                alignLabelWithHint: true
            ),
            maxLines: 4,
            textAlignVertical: TextAlignVertical.top,
            validator: (val)=>KValidations.validateEmptyField(val, "Message"),
            controller: messageCtr,
          ),
          SizedBox(height: 2.h,),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 3.h)
                ),
                onPressed: ()async{
                  if(key.currentState!.validate()){
                    try {
                      setState(() {
                        isLoading = true;
                      });

                      final envVariables = dotenv.env;


                      Map<String, dynamic> templateParams = {
                        'name': nameCtr.text,
                        'user_email': emailCtr.text,
                        'message': messageCtr.text
                      };
                      await EmailJS.send(
                        envVariables["MAIL_JS_SERVICE_ID"]!,
                        envVariables["MAIL_JS_TEMPLATE_ID"]!,
                        templateParams,
                        Options(
                          publicKey: envVariables["MAIL_JS_PUBIC"]!,
                          privateKey: envVariables["MAIL_JS_PRIVATE"]!,
                        ),
                      );

                      setState(() {
                        isLoading = false;
                      });

                      nameCtr.clear();
                      emailCtr.clear();
                      messageCtr.clear();

                      Fluttertoast.showToast(msg: "Thank you for your feedback!", webPosition: "center", gravity: ToastGravity.TOP, toastLength: Toast.LENGTH_LONG);
                    } catch (error) {
                      setState(() {
                        isLoading = false;
                      });
                    }
                  }
                }, child: isLoading ? const CircularProgressIndicator() : const GradientText("Submit", gradient: pinkPurpleGradient, style: TextStyle(
                fontSize: 20
            ),)
            ),
          )
        ],
      ),
    ));
  }
}
