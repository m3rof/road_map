import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:awesome_icons/awesome_icons.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:road_map/component/constants.dart';
import 'package:road_map/features/authentication/login/presentation/login_manager/login_cubit.dart';

import 'package:road_map/resourses/styles.dart';

import '../features/drawer_pages/newsletter/introduce_newsletter_screen.dart';
import '../features/drawer_pages/posts/posts_screen.dart';
import '../features/drawer_pages/posts/widgets/comments_screen.dart';
import '../resourses/assets_manager.dart';
import '../resourses/color_manager.dart';
import '../resourses/constants.dart';
import '../resourses/value_app.dart';

Widget textFieldSuffix(
    {required TextInputType textInputType,
    required TextEditingController controller,
    required String label,
    required String validator,
    bool obsurce = false,
    bool password = false,
    Widget? icons}) {
  return TextFormField(
    style: StylesManager.styleField,
    cursorColor: ColorManager.primaryColor,
    controller: controller,
    validator: (value) => value!.trim().isEmpty ? validator : null,
    obscureText: obsurce,
    keyboardType: textInputType,
    decoration: InputDecoration(
      suffixIcon: icons,
      labelStyle: StylesManager.hint,
      label: Text(label),
      fillColor: Colors.white,
      filled: true,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(35)),
        borderSide: const BorderSide(color: Colors.transparent, width: 0.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(35)),
        borderSide: const BorderSide(color: Colors.transparent, width: 0.0),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(35)),
        borderSide: const BorderSide(color: Colors.red, width: 1.0),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(35)),
        borderSide: const BorderSide(color: Colors.transparent, width: 1.0),
      ),
    ),
  );
}

Widget textButton(String text, function) {
  return InkWell(
      onTap: function, child: Text(text, style: StylesManager.textMove));
}

Widget textFieldReset(
    {required TextInputType textInputType,
    required TextEditingController controller,
    required String label,
    required String validator,
    bool obsurce = false,
    bool password = false,
    Widget? icons}) {
  return TextFormField(
    style: StylesManager.styleField,
    cursorColor: ColorManager.primaryColor,
    controller: controller,
    validator: (value) => value!.trim().isEmpty ? validator : null,
    obscureText: obsurce,
    keyboardType: textInputType,
    decoration: InputDecoration(
      suffixIcon: icons,
      labelStyle: StylesManager.hint,
      label: Text(label),
      fillColor: Colors.white,
      filled: true,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        borderSide: const BorderSide(color: Colors.grey, width: 1.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        borderSide: const BorderSide(color: Colors.grey, width: 1.0),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(35)),
        borderSide: const BorderSide(color: Colors.red, width: 1.0),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(35)),
        borderSide: const BorderSide(color: Colors.grey, width: 1.0),
      ),
    ),
  );
}

Future resetPassword(context, TextEditingController emailController,
    GlobalKey<FormState> key, LoginCubit cubit) {
  return showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    barrierColor: Colors.black38,
    builder: (context) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 50),
        height: 400,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20), topLeft: Radius.circular(20))),
        child: Form(
          key: key,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Reset Password',
                style: StylesManager.welcomeLR,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'set your email',
                style: StylesManager.resetSubPassword,
              ),
              SizedBox(
                height: 20,
              ),
              textFieldReset(
                  textInputType: TextInputType.emailAddress,
                  controller: emailController,
                  label: 'Enter your email',
                  validator: 'Enter your email'),
              SizedBox(
                height: 50,
              ),
              Center(
                child: ElevatedButton(
                    onPressed: () {
                      cubit.checkValidationReset(
                          context: context,
                          key: key,
                          emailController: emailController);
                    },
                    child: Text(
                      'Next',
                      style: StylesManager.buttonStyle,
                    )),
              ),
            ],
          ),
        ),
      );
    },
  );
}

Widget dividerBlue(
    {required double width,
    double height = 4,
    Color color = ColorManager.primaryColor,
    double thickness = 1}) {
  return SizedBox(
    width: width,
    child: Divider(
      color: color,
      height: height,
      thickness: thickness,
    ),
  );
}

Widget appBarLeading() {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      const SizedBox(width: SizeManager.s8),
      Builder(builder: (context) {
        return IconButton(
          icon: const Icon(Icons.menu_open_outlined),
          onPressed: () => Scaffold.of(context).openDrawer(),
        );
      }),
    ],
  );
}

Widget itemDrawer(context, icon, title, function) {
  return InkWell(
    onTap: function,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              icon,
              color: ColorManager.primaryColor,
              size: SizeManager.s20,
            ),
            const SizedBox(
              width: SizeManager.s16,
            ),
            Text(
              title,
              style: StylesManager.textMove
                  .copyWith(color: Colors.black)
                  .copyWith(fontWeight: FontWeight.w500),
            ),
            const Spacer(),
            const Icon(
              Icons.navigate_next,
              color: Colors.black,
              size: SizeManager.s24,
            ),
          ],
        ),
        const SizedBox(
          height: SizeManager.s10,
        ),
        dividerBlue(width: widthMedia(context: context, x: SizeManager.s_51)),
        const SizedBox(
          height: 25,
        )
      ],
    ),
  );
}

class DrawerBody extends StatelessWidget {
  const DrawerBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      width: widthMedia(context: context, x: SizeManager.s_7),
      child: Padding(
        padding: const EdgeInsets.only(
            left: SizeManager.s18,
            right: SizeManager.s18,
            top: SizeManager.s20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: SizeManager.s50,
              ),
              itemDrawer(context, FontAwesomeIcons.home, 'home', () {}),
              itemDrawer(context, FontAwesomeIcons.newspaper, 'newsletter', () {
                moveScreen(
                    context: context, screen: IntroduceNewsLetterScreen());
              }),
              itemDrawer(context, Icons.topic_outlined, 'topics', () {
                moveScreen(context: context, screen: PostsScreen());
              }),
              itemDrawer(context, Icons.article_outlined, 'Article', () {
                moveScreen(context: context, screen: PostsScreen());
              }),
            ],
          ),
        ),
      ),
    );
  }
}

Widget listViewBlogsV(
  context,
) {
  return ListView.builder(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    itemCount: 6,
    itemBuilder: (context, index) {
      return itemBlogsV(
          context: context,
          mainText: 'mainText',
          image:
              'https://blogassets.leverageedu.com/blog/wp-content/uploads/2020/01/24145013/article-writing.jpg',
          title: 'title',
          doctorName: 'doctorName',
          articleID: 1);
    },
  );
}

Widget itemBlogsV(
    {context,
    required String image,
    required String mainText,
    required String title,
    required int articleID,
    required String doctorName}) {
  return InkWell(
    onTap: () {},
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: SizeManager.s10),
      margin: const EdgeInsets.all(SizeManager.s14),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(SizeManager.s30)),
          color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: SizeManager.s200,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: CachedNetworkImageProvider(image), fit: BoxFit.fill),
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(SizeManager.s30),
                topLeft: Radius.circular(SizeManager.s30),
              ),
            ),
          ),
          const SizedBox(height: SizeManager.s8),
          Text(
            title,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.orange,
                fontWeight: FontWeight.w600,
                fontSize: SizeManager.s20),
          ),
          const SizedBox(height: SizeManager.s3),
          SizedBox(
            height: 50,
            child: Text(mainText,
                style:
                    StylesManager.textMove.copyWith(fontSize: SizeManager.s14),
                maxLines: 2,
                overflow: TextOverflow.ellipsis),
          ),
          const SizedBox(height: SizeManager.s2),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(doctorName, style: StylesManager.subWelcomeHome),
                  const SizedBox(
                    height: SizeManager.s3,
                  ),
                  Container(
                    width: SizeManager.s120,
                    height: SizeManager.s_7,
                    color: ColorManager.primaryColor,
                  ),
                  const SizedBox(
                    height: SizeManager.s3,
                  ),
                  SizedBox(
                    width: 200,
                    child: Text(
                      'The head of psychology department - alex university',
                      style: StylesManager.hint.copyWith(
                        fontSize: 12,
                      ),
                      maxLines: 2,
                    ),
                  ),
                  const SizedBox(
                    height: SizeManager.s10,
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    ),
  );
}

Widget profileImage(
    {image,
    required double height,
    required double width,
    required double radius}) {
  return Container(
    height: height,
    width: width,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(radius)),
        border: Border.all(color: ColorManager.primaryColor, width: 1),
        image: DecorationImage(
            image: image == null ? AssetImage(AssetsManager.me) : image,
            fit: BoxFit.cover)),
  );
}

Widget qADesign(
    String quetion, String answer, String answerBy, String job, context) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 8),
    margin: const EdgeInsets.all(SizeManager.s8),
    decoration: BoxDecoration(
        border: Border.all(
            color: ColorManager.primaryColor, width: SizeManager.s_7),
        borderRadius: const BorderRadius.all(Radius.circular(SizeManager.s10))),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            GestureDetector(
                onTap: () {
                  showImage(context, AssetsManager.me);
                },
                child: profileImage(
                    image: CachedNetworkImageProvider(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTVR9V1Ix26V2s_WWWryH3FU5Qkl2yR4PL3BcUybf2cUw&s'),
                    height: SizeManager.s65,
                    width: SizeManager.s65,
                    radius: SizeManager.s35)),
            const SizedBox(
              width: SizeManager.s12,
            ),
            Column(
              children: [
                SizedBox(
                    width: SizeManager.s150,
                    child: Text(
                      'ahmed',
                      style: StylesManager.hint
                          .copyWith(color: ColorManager.headBlack),
                      overflow: TextOverflow.ellipsis,
                    )),
                const SizedBox(
                  height: SizeManager.s4,
                ),
              ],
            )
          ],
        ),
        const SizedBox(
          height: SizeManager.s6,
        ),
        quetsionDesigen(quetion),
        const SizedBox(
          height: SizeManager.s10,
        ),
        asnwerDesigen(answer),
        const SizedBox(
          height: SizeManager.s4,
        ),
        ElevatedButton(
          onPressed: () {
            moveScreen(context: context, screen: CommentsScreen());
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('comments',
                  style: StylesManager.buttonStyle,
                  textAlign: TextAlign.center),
            ],
          ),
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.zero,
          ),
        )
      ],
    ),
  );
}

Widget listViewQAV(String quetion, String answer, String answerBy, String job) {
  return ListView.builder(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    itemCount: 10,
    itemBuilder: (context, index) {
      return qADesign(quetion, answer, answerBy, job, context);
    },
  );
}

Widget quetsionDesigen(String content) {
  return Container(
    padding: const EdgeInsets.all(SizeManager.s8),
    decoration: const BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(SizeManager.s16)),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(content,
            style: TextStyle(
              color: ColorManager.primaryColor,
              fontWeight: FontWeight.w600,
              fontSize: SizeManager.s20,
            )),
      ],
    ),
  );
}

Widget asnwerDesigen(String content) {
  return Container(
    padding: const EdgeInsets.all(SizeManager.s8),
    decoration: const BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(SizeManager.s16)),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(content,
            style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.black,
                fontSize: SizeManager.s20)),
      ],
    ),
  );
}

AwesomeDialog showDialogAwsome(
    context, desc, DialogType dialogType, functionOk) {
  return AwesomeDialog(
    context: context,
    animType: AnimType.scale,
    dialogType: dialogType,
    body: Center(
      child: Text(
        desc,
        style: TextStyle(
          color: ColorManager.primaryColor,
          fontWeight: FontWeight.w600,
          fontSize: SizeManager.s20,
        ).copyWith(fontStyle: FontStyle.italic, fontSize: SizeManager.s16),
      ),
    ),
    title: 'This is Ignored',
    desc: 'This is also Ignored',
    btnOkOnPress: functionOk,
  )..show();
}

AwesomeDialog askDialogAwsome(
    context, desc, DialogType dialogType, functionOk) {
  return AwesomeDialog(
      context: context,
      animType: AnimType.scale,
      dialogType: dialogType,
      body: Center(
        child: Text(
          desc,
          style: TextStyle(
            color: ColorManager.primaryColor,
            fontWeight: FontWeight.w600,
            fontSize: SizeManager.s20,
          ).copyWith(fontStyle: FontStyle.italic, fontSize: SizeManager.s16),
        ),
      ),
      btnOkOnPress: functionOk,
      btnCancel: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.all(Radius.circular(22))),
          child: Text('cancel',
              style: TextStyle(color: Colors.white, fontSize: SizeManager.s16),
              textAlign: TextAlign.center),
        ),
      ))
    ..show();
}

Widget popMenu(List<PopupMenuEntry> list, widget) {
  return PopupMenuButton(
    color: Colors.white,
    itemBuilder: (context) => list,
    icon: widget,
  );
}