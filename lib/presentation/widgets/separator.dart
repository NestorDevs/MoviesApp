part of 'widgets.dart';

class Separator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //1
    return Container(
      height: Sizes.dimen_1.h,
      width: Sizes.dimen_80.w,
      //2
      padding: EdgeInsets.only(
        top: Sizes.dimen_2.h,
        bottom: Sizes.dimen_6.h,
      ),
      //3
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(Sizes.dimen_1.h)),
        gradient: LinearGradient(
          colors: [
            AppColor.violet,
            AppColor.royalBlue,
          ],
        ),
      ),
    );
  }
}
