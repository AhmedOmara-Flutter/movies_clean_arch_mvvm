import '../../../../core/app_imports.dart';

class CustomHorizontalText extends StatelessWidget {
  const CustomHorizontalText({super.key, required this.text});
 final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal:FontSizeManager.s10),
      child: Text(
        text,style: TextStyle(color: Colors.white,fontSize: FontSizeManager.s18,fontWeight: FontWeight.bold),
      ),
    );
  }
}
