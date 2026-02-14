import 'package:movies_clean_arch_mvvm/core/app_imports.dart';

class AppRoot extends StatefulWidget {
  const AppRoot({super.key});

  @override
  State<AppRoot> createState() => _AppRootState();
}

class _AppRootState extends State<AppRoot> {
  int currentIndex = 0;
  List<Widget> screens = [MoviesHomeView(), Scaffold()];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: ColorManager.baseColor),
      home: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          backgroundColor: ColorManager.baseColor.withOpacity(0.5),
          type: BottomNavigationBarType.fixed,
          selectedItemColor: ColorManager.white,
          unselectedItemColor: ColorManager.grey.withOpacity(0.5),
          currentIndex: currentIndex,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.movie), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.tv), label: 'TV Shows'),
          ],
        ),
        body: screens[currentIndex],
      ),
    );
  }
}
