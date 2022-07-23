import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:safariweb/admin/add/add_page_off.dart';
import 'package:safariweb/admin/my_page.dart';
// import 'package:safari/homelayout/homelayout.dart';
import 'package:safariweb/admin/register/bloc/erg_states.dart';
import 'package:safariweb/admin/register/bloc/reg_cubit.dart';
import 'package:safariweb/admin/register/datalayer/reg_model.dart';

import 'package:safariweb/admin/register/presentation/widget/displaypicture.dart';
import 'package:safariweb/admin/register/presentation/widget/loading_state.dart';


class Register extends StatefulWidget {
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final formKey = GlobalKey<FormState>();

  var ImageControler = TextEditingController();

  var namecontroler = TextEditingController();

  var lastcontroller = TextEditingController();

  var rolecontroller = TextEditingController();

  var phonecontroler = TextEditingController();

  var passoredcontroler = TextEditingController();

  var emailcontroler = TextEditingController();

  bool obscureText = true;
  bool isPassword = true;
  bool isPassword2 = true;

  // ignore: non_constant_identifier_names
  late File UserImage;

  final Picker = ImagePicker();

  RegisterModel registerModel = RegisterModel();

  Future getImage(ImageSource src) async {
    final PickedFile = await Picker.pickImage(source: src);
    setState(() {
      if (PickedFile != null) {
        UserImage = File(PickedFile.path);
        this.registerModel.Image = UserImage;
        print("image details" + this.registerModel.Image.toString());
        BlocProvider.of<RegisterCubit>(context).UpdateImage(UserImage);
        print("image loaded");
      } else
        print("Could not get photo");
    });
  }

  @override
  void initState() {
    //BlocProvider.of<RegisterCubit>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: formKey,
              child: Center(
                child: SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.all(25),
                    decoration: BoxDecoration(
                      /// اللون للخلفية الببضاء مع شفافية 10%
                      color: Colors.white.withOpacity(0.10),

                      /// تدوير الحواف
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                    ),
                    child: BlocConsumer<RegisterCubit, RegisterState>(
                        listener: ((context, state) {

                      if (state is SuccessState)
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AddPageOffice()),
                            (route) => false);

                      if (state is ErrorState)
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(state.message)));
                    }),
                     builder: (context, state) {
                      if (state is LoadingState)
                        return LoadingWidget();
                      else
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Register", //S.of(context).pageRegister,
                              style: TextStyle(
                                fontSize: 45,
                                fontWeight: FontWeight.w300,
                                color: Colors.grey[500],
                              ), //Theme.of(context).textTheme.headline1,
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            InkWell(
                              child: Stack(
                                children: [
                                  ClipOval(
                                      child: Container(
                                    width: 100,
                                    height: 100,
                                    child: BlocBuilder<RegisterCubit,
                                            RegisterState>(
                                        builder: (context, state) {
                                      if (state is ImageLoaded)
                                        return Image.file(
                                          state.ProfileImage,
                                          fit: BoxFit.fill,
                                        );
                                      else
                                        return Image.asset(
                                            "images/Default Picture .jpg",
                                            fit: BoxFit.fill);
                                    }),
                                  )),
                                  Positioned(
                                      bottom: 0,
                                      right: 0,
                                      child: SizedBox(
                                        height: 30,
                                        width: 30,
                                        child: FloatingActionButton(
                                          onPressed: () {},
                                          child: Icon(Icons.add,
                                              color: Colors.white),
                                          backgroundColor: Colors.orangeAccent,
                                        ),
                                      ))
                                ],
                              ),
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return new AlertDialog(
                                        title: Text("Choose Picture From"),
                                        content: Container(
                                            height: 150,
                                            color: Colors.white,
                                            child: Column(
                                              children: [
                                                Container(
                                                  color: Colors.orange,
                                                  child: ListTile(
                                                    leading: Icon(Icons.image),
                                                    title: Text('Gallery'),
                                                    onTap: () {
                                                      getImage(
                                                          ImageSource.gallery);
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 30,
                                                ),
                                                Container(
                                                  color: Colors.orange,
                                                  child: ListTile(
                                                    leading:
                                                        Icon(Icons.add_a_photo),
                                                    title: Text('Camera'),
                                                    onTap: () {
                                                      getImage(
                                                          ImageSource.camera);
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                  ),
                                                ),
                                              ],
                                            )),
                                      );
                                    });
                              },
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            TextFormField(
                              controller: namecontroler,
                              keyboardType: TextInputType.name,
                              onFieldSubmitted: (String value) {
                                print(value);
                              },
                              onChanged: (String value) {
                                print(value);
                              },
                              decoration: InputDecoration(
                                focusColor: Colors.purple,
                                labelText:
                                    "first name", //S.of(context).pageName,
                                prefixIcon: Icon(
                                  Icons.person,
                                  color: Color(0xffef9b0f),
                                ),
                                border: _outlineBorder(),

                                /// دالة الborder يلي بتخلي مدور بس استدعيا
                                /// في حال بدي الborder بغير لون بس  جواتا borderColor
                                /// الError لونو أحمر مثلا
                                enabledBorder: _outlineBorder(),
                                focusedBorder: _outlineBorder(
                                    // borderColor: AppColors.darkBlue,
                                    ),
                                disabledBorder: _outlineBorder(),
                              ),

                              /// تحت مشان ايمت نطلع الرسالة الحمرا
                              /// وشو الرسالة لبدنا نطلعا
                              validator: (value) {
                                /// اذا فاضية بترجع رسالة عبي الداتا
                                if ((value ?? '').isEmpty)
                                  return "name must not be empty"; //S.of(context).pageFillValue;
                                return null;
                              },
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              controller: lastcontroller,
                              // obscureText: lastcontroller,
                              keyboardType: TextInputType.visiblePassword,
                              decoration: InputDecoration(
                                labelText:
                                    "last name", //S.of(context).pageConfirmpass,
                                prefixIcon: Icon(
                                  Icons.person,
                                  color: Color(0xffef9b0f),
                                ),
                              
                                border: _outlineBorder(),

                                /// دالة الborder يلي بتخلي مدور بس استدعيا
                                /// في حال بدك الborder بغير لون بس  جواتا borderColor
                                /// الError لونو أحمر مثلا
                                enabledBorder: _outlineBorder(),
                                focusedBorder: _outlineBorder(
                                    // borderColor: AppColors.darkBlue,
                                    ),
                                disabledBorder: _outlineBorder(),
                              ),
                              validator: (value) {
                                /// اذا فاضية بترجع رسالة عبي الداتا
                                if ((value ?? '').isEmpty)
                                  return "last name must not be empty"; //S.of(context).pageFillValue;
                              },
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              keyboardType: TextInputType.name,
                              controller: rolecontroller,
                              decoration: InputDecoration(
                                labelText:
                                    "role", //S.of(context).pageYourPhone,
                                prefixIcon: Icon(
                                  Icons.add_moderator_rounded,
                                  color: Color(0xffef9b0f),
                                ),
                                border: _outlineBorder(),
                                enabledBorder: _outlineBorder(),
                                focusedBorder: _outlineBorder(
                                    // borderColor: AppColors.darkBlue,
                                    ),
                                disabledBorder: _outlineBorder(),
                              ),
                              validator: (value) {
                                /// اذا فاضية بترجع رسالة عبي الداتا
                                if ((value ?? '').isEmpty)
                                  return "role must not be empty"; //S.of(context).pageFillValue;
                                return null;
                              },
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              keyboardType: TextInputType.phone,
                              controller: phonecontroler,
                              decoration: InputDecoration(
                                labelText:
                                    "phone", //S.of(context).pageYourPhone,
                                prefixIcon: Icon(
                                  Icons.phone,
                                  color: Color(0xffef9b0f),
                                ),
                                border: _outlineBorder(),
                                enabledBorder: _outlineBorder(),
                                focusedBorder: _outlineBorder(
                                    // borderColor: AppColors.darkBlue,
                                    ),
                                disabledBorder: _outlineBorder(),
                              ),
                              validator: (value) {
                                /// اذا فاضية بترجع رسالة عبي الداتا
                                if ((value ?? '').isEmpty)
                                  return "phone must not be empty"; //S.of(context).pageFillValue;
                                return null;
                              },
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              controller: emailcontroler,
                              decoration: InputDecoration(
                                labelText:
                                    "email", //S.of(context).pageEnterEmail,
                                prefixIcon: Icon(
                                  Icons.email,
                                  color: Color(0xffef9b0f),
                                ),
                                border: _outlineBorder(),
                                enabledBorder: _outlineBorder(),
                                focusedBorder: _outlineBorder(
                                    // borderColor: AppColors.darkBlue,
                                    ),
                                disabledBorder: _outlineBorder(),
                              ),
                              validator: (value) {
                                /// اذا فاضية بترجع رسالة عبي الداتا
                                if ((value ?? '').isEmpty)
                                  return "email must not be empty"; //S.of(context).pageFillValue;
                                return null;
                              },
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              controller: passoredcontroler,
                              obscureText: isPassword,
                              keyboardType: TextInputType.visiblePassword,
                              decoration: InputDecoration(
                                labelText:
                                    "password", //S.of(context).pageEnterPassword,
                                prefixIcon: Icon(
                                  Icons.lock,
                                  color: Color(0xffef9b0f),
                                ),
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      isPassword = !isPassword;
                                    });
                                  },
                                  icon: Icon(isPassword
                                      ? Icons.visibility_off
                                      : Icons.visibility),
                                  color: Color(0xffef9b0f),
                                ),
                                border: _outlineBorder(),

                                /// دالة الborder يلي بتخلي مدور بس استدعيا
                                /// في حال بدك الborder بغير لون بس  جواتا borderColor
                                /// الError لونو أحمر مثلا
                                enabledBorder: _outlineBorder(),
                                focusedBorder: _outlineBorder(
                                    // borderColor: AppColors.darkBlue,
                                    ),
                                disabledBorder: _outlineBorder(),
                              ),
                              validator: (value) {
                                /// اذا فاضية بترجع رسالة عبي الداتا
                                if ((value ?? '').isEmpty)
                                  return "password must not be empty"; //S.of(context).pageFillValue;
                                return null;
                              },
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Container(
                              margin:
                                  EdgeInsets.only(left: 20, right: 20, top: 10),
                              padding: EdgeInsets.only(left: 20, right: 20),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    colors: [
                                      (new Color(0xffef9b0f)),
                                      new Color(0xffffba00)
                                    ],
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight),
                                borderRadius: BorderRadius.circular(50),
                                boxShadow: [
                                  BoxShadow(
                                      offset: Offset(0, 10),
                                      blurRadius: 50,
                                      color: Color(0xffEEEEEE)),
                                ],
                              ),
                              child: MaterialButton(
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    print("Button Clicked");
                                    this.registerModel.Name =
                                        namecontroler.text;
                                    this.registerModel.last =
                                        lastcontroller.text;
                                    this.registerModel.Role =
                                        rolecontroller.text;
                                    this.registerModel.Phone =
                                        phonecontroler.text;
                                    this.registerModel.Email =
                                        emailcontroler.text;
                                    this.registerModel.Password =
                                        phonecontroler.text;
                                    BlocProvider.of<RegisterCubit>(context)
                                        .SendRequest(registerModel);
                                  }
                                },
                                child: Text(
                                  "register", //S.of(context).pageRegister,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        );
                    }),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// هاد التابع يلي بخلي الحواف مدورة
  _outlineBorder({Color? borderColor}) {
    if (borderColor == null)
      return OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
      );
    else
      return OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
        borderSide: BorderSide(color: borderColor),
      );
  }
}

//يرعبهم كونك مختلف كونك لا تشبه تكرارهم

