part of '../main_section.dart';


class _NavbarDesktop extends StatefulWidget {
  const _NavbarDesktop({Key? key}) : super(key: key);

  @override
  State<_NavbarDesktop> createState() => _NavbarDesktopState();
}

class _NavbarDesktopState extends State<_NavbarDesktop> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // theme
    var theme = Theme.of(context);
    return BlocBuilder<ThemeCubit, ThemeState>(builder: (context, state) {
      return AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        titleTextStyle: const TextStyle(
          fontSize: 16,
          fontFamily: "Poppins"
        ),
        title: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: size.width / 8, vertical: 10),
            color: theme.navBarColor,
            child: Row(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //const NavBarLogo(),
                //Space.xm!,
                //const Spacer(),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: NavBarUtils.names.asMap().entries.map(
                          (e) => NavBarActionButton(
                        label: e.value,
                        index: e.key,
                      ),
                    ).toList(),
                  ),
                ),
                // Space.x!,
                /*
                InkWell(
                    onTap: () {
                      context.read<ThemeCubit>().updateTheme(!state.isDarkThemeOn);
                    },
                    child: Image.network(
                      state.isDarkThemeOn ? IconUrls.darkIcon : IconUrls.lightIcon,
                      height: 30,
                      width: 30,
                      color: state.isDarkThemeOn ? Colors.black : Colors.white,
                    )),
                 */
                // Space.x!,
              ],
            ),
          ),
        ),
      );
    });
  }
}

class _NavBarTablet extends StatelessWidget {
  const _NavBarTablet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final drawerProvider = Provider.of<DrawerProvider>(context);
    var theme = Theme.of(context);
    return Container(
      color: theme.navBarColor,
      padding: EdgeInsets.symmetric(
          horizontal: Responsive.isTablet(context) ? 10.w : 10, vertical: 10),
      child: Row(
        children: [
          IconButton(
            highlightColor: Colors.white54,
            onPressed: () {
              drawerProvider.key.currentState!.openDrawer();
            },
            icon: const Icon(Icons.menu),
          ),
          // Space.x1!,
        ],
      ),
    );
  }
}
