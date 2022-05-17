import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:iconsax/iconsax.dart';
import 'package:project_app/layout/cubit/cubit.dart';
import 'package:project_app/layout/cubit/home.dart';
import 'package:project_app/modules/register/hyat_register_screen.dart';
import 'package:project_app/shared/components/components.dart';
import 'package:project_app/shared/components/components.dart';
import 'package:project_app/shared/network/local/cache_helper.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

class HyahLoginScreen extends StatelessWidget {


  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => HyahLoginCubit(),
      child: BlocConsumer <HyahLoginCubit ,HyahLoginStates>(
        listener: (context , state) {

          if(state is HyahLoginErrorState)
            {
              showToast(
                  message: state.error,
                  state: ToastState.ERROR);
            }

          else{
            if(state is HyahLoginSuccessState)
            {
              navigateAndFinish(
                  context,
                  HomeHyahScreen());
              showToast(
                  message: state.state,

                  state: ToastState.SUCCESS);


            }

          }
          if ( state is HyahLoginSuccessState)
          {
          CacheHelper.saveData(
          key:'uId',
          value: state.Uid,

          ).then((value)async{
          uId =state.Uid;
          navigateAndFinish(context, HomeHyahScreen());
          HyahCubit.get(context).getUserData();
          });
          }

        },
        builder: (context , state) {
          return Scaffold(

            appBar: AppBar(
              centerTitle: true,
              title: Image.asset(
                'assets/images/logo_ligth.png',
                fit: BoxFit.cover,
                height: 220,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(40),
                ),
              ),
              toolbarHeight: 80,
              automaticallyImplyLeading: false,
              backwardsCompatibility: false,
              backgroundColor: HexColor('#0A81AB'),
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: HexColor('#0A81AB'),
                statusBarIconBrightness: Brightness.light,
              ),
              elevation: 5,
            ),
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Form(
                    key: formKey,
                    child: Column(

                      children: [

                        defaultFormField(
                          validate: (String value)
                          {
                            if(value.isEmpty)
                            {
                              return ' الرجاء كتابه البريد الألكتروني';
                            }
                          },
                          controller: emailController,
                          type: TextInputType.emailAddress,
                          label: 'البريد الالكتروني',
                          prefix: Iconsax.card_pos,
                        ),
                        SizedBox(height: 15,),
                        defaultFormField(

                          validate: (String value)
                          {
                            if(value.isEmpty)
                            {
                              return ' الرجاء كتبابه الرقم السري';
                            }
                          },
                          controller: passwordController,
                          type: TextInputType.visiblePassword,
                          suffic: HyahLoginCubit.get(context).suffix,
                          suffixPressed: (){
                            HyahLoginCubit.get(context).changePasswordVisibility();
                          },
                          label: 'الرقم السري',

                          prefix: Iconsax.lock_1,
                          maxLength: 8,

                          isPassword: HyahLoginCubit.get(context).isPassword,

                        ),
                        SizedBox(height: 40,),
                        ConditionalBuilder(
                          condition: state is! HyahLoginLoadingState,
                          builder: (context) => Container(
                            width: 300,
                            child: defaultButton(

                                function: (){
                                  if(formKey.currentState.validate())
                                  {
                                    HyahLoginCubit.get(context).userLogin(
                                        email: emailController.text,
                                        password: passwordController.text);
                                  }
                                },
                                text: 'تسجيل الدخول',
                                isUpperCase: true ,
                                background: HexColor('#0A81AB'),



                            ),
                          ),
                          fallback: (context) => Center(child: CircularProgressIndicator()),
                        ),
                        SizedBox(height: 35,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'ليس لديك حساب ؟',
                              style: TextStyle(color: Colors.grey,fontSize: 14),
                            ),
                            defaultTextButton(
                                function: (){
                                  navigateTo(context, HyahRegisterScreen());
                                },
                              text: 'حساب جديد',
                              style: TextStyle(fontSize: 16,color:  HexColor('#0A81AB'))

                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },

      ),
    );
  }
}
