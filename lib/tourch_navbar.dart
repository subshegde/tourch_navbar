import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class TourchNavbarSub extends StatefulWidget {
  final List<IconData> icons;
  final int initialIndex;
  final Function(int) onItemTapped;
  final Color backgroundColor;
  final Color selectedItemColor;
  final Color unselectedItemColor;
  final Color? iconColor;
  final List<Color> tourchColors;

   TourchNavbarSub({
    super.key,
    required this.icons,
    this.initialIndex = 0,
    required this.onItemTapped,
    this.backgroundColor = Colors.black,
    this.selectedItemColor = Colors.pink,
    this.iconColor = const Color.fromARGB(255, 230, 93, 139),
    this.unselectedItemColor = Colors.grey,
    List<Color>? tourchColors,
  }) : tourchColors = tourchColors ?? [
    Colors.pink.withOpacity(0.8),
    Colors.pink.withOpacity(0.5),
    Colors.transparent
  ];

  @override
  TourchNavbarSubState createState() => TourchNavbarSubState();
}


class TourchNavbarSubState extends State<TourchNavbarSub> {
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  @override
  Widget build(BuildContext context) {
    AppSizes().init(context);
    return  Stack(
          children: [
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: bottomNav(),
            ),
          ],
        );
  }

  Widget bottomNav() {
    return Padding(
      padding: EdgeInsets.fromLTRB(AppSizes.blockSizeHorizontal * 4.5, 0,AppSizes.blockSizeHorizontal * 4.5, 0),
      child: Material(
        borderRadius: BorderRadius.circular(30),
        color: Colors.transparent,
        elevation: 6,
        child: Container(
            height: AppSizes.blockSizeHorizontal * 18,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.grey[900],
              borderRadius: BorderRadius.circular(30),
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  bottom: 0,
                  left: AppSizes.blockSizeHorizontal * 3,
                  right: AppSizes.blockSizeHorizontal * 3,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: List.generate(widget.icons.length, (index) {
                      return BottomNavButton(
                        onPressed: (val) {
                          setState(() {
                            _currentIndex = val;
                          });
                          widget.onItemTapped(val);
                        },
                        icon: widget.icons[index],
                        currentIndex: _currentIndex,
                        index: index,
                        iconColor: widget.iconColor,
                      );
                    }),
                  ),
                ),
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.decelerate,
                  top: 0,
                  left: animatedPositionedLeftValue(_currentIndex),
                  child: Column(
                    children: [
                      Container(
                        height: AppSizes.blockSizeHorizontal * 1.0,
                        width: AppSizes.blockSizeHorizontal * 12,
                        decoration: BoxDecoration(
                          color: widget.selectedItemColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      ClipPath(
                        clipper: SubCustomClipper(),
                        child: Container(
                          height: AppSizes.blockSizeHorizontal * 15,
                          width: AppSizes.blockSizeHorizontal * 12,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: widget.tourchColors,
                          )),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }
}


class AppSizes {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static late double blockSizeHorizontal;
  static late double blockSizeVertical;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;
  }
}


double animatedPositionedLeftValue(int currentIndex) {
  switch (currentIndex) {
    case 0:
      return AppSizes.blockSizeHorizontal * 5.5;
    case 1:
      return AppSizes.blockSizeHorizontal * 22.5;
    case 2:
      return AppSizes.blockSizeHorizontal * 39.5;
    case 3:
      return AppSizes.blockSizeHorizontal * 56.5;
    case 4:
      return AppSizes.blockSizeHorizontal * 73.5;
    default:
      return 0;
  }
}

class BottomNavButton extends StatelessWidget {
  final Function(int) onPressed;
  final IconData icon;
  final int index;
  final int currentIndex;
  final Color? iconColor;

  const BottomNavButton({
    super.key,
    required this.icon,
    required this.onPressed,
    required this.index,
    required this.currentIndex,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    AppSizes().init(context);
    return InkWell(
      onTap: () {
        onPressed(index);
      },
      child: Container(
        height: AppSizes.blockSizeHorizontal * 13,
        width: AppSizes.blockSizeHorizontal * 17,
        decoration: const BoxDecoration(
          color: Colors.transparent,
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            (currentIndex == index)
                ? Positioned(
                    left: AppSizes.blockSizeHorizontal * 4,
                    bottom: AppSizes.blockSizeHorizontal * 1.5,
                    child: Icon(
                      icon,
                      color: Colors.black,
                      size: AppSizes.blockSizeHorizontal * 8,
                    ),
                  )
                : Container(),
            AnimatedOpacity(
              opacity: (currentIndex == index) ? 1 : 0.2,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeIn,
              child: Icon(
                icon,
                color: iconColor,
                size: AppSizes.blockSizeHorizontal * 8,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SubCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(AppSizes.blockSizeHorizontal * 3, 0);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width - AppSizes.blockSizeHorizontal * 3, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
