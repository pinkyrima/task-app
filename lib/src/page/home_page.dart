import 'package:flutter/material.dart';
import 'package:task_app/src/style/k_color.dart';
import 'package:task_app/src/style/k_textStyle.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _controller = PageController(
    initialPage: 0,
  );
  int _currentPage = 0;

  onChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  final List<String> imageList = [
    'assets/images/detailsBg.png',
    'assets/images/detailsBg.png',
    'assets/images/detailsBg.png',
  ];

  _makingPhoneCall() async {
    var url = Uri.parse("tel:9776765434");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _sendingMails() async {
    var url = Uri.parse("mailto:feedback@geeksforgeeks.org");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            height: 462,
            color: Colors.transparent,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                SizedBox(
                  height: 412,
                  child: PageView.builder(
                    controller: _controller,
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    physics: const BouncingScrollPhysics(),
                    onPageChanged: onChanged,
                    itemBuilder: (context, int index) {
                      return Image.asset(
                        'assets/images/detailsBg.png',
                        fit: BoxFit.fill,
                        height: 350,
                      );
                    },
                  ),
                ),
                Positioned(
                  bottom: 100,
                  right: 30,
                  left: 30,
                  child: Container(
                    height: 120,
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: KColor.white.withOpacity(0.4)),
                    child: Column(
                      children: [
                        const Spacer(),
                        Text(
                          'Mahmud',
                          style: KTextStyle.headline8,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          '015552568963',
                          style: KTextStyle.headline8,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          'mahmud@ab.com',
                          style: KTextStyle.headline8,
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 430,
                  left: 185,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List<Widget>.generate(3, (int index) {
                      return Container(
                        height: 5.0,
                        width: _currentPage == index ? 15.5 : 5.0,
                        margin: const EdgeInsets.only(right: 3.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: _currentPage == index
                                ? KColor.secondary
                                : KColor.grey),
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),
          buildListTile(
            'Delivery boy :',
            'Fahim Ahmed',
            Icons.phone,
            _makingPhoneCall,
          ),
          const SizedBox(height: 5),
          buildListTile(
            'Email Address :',
            'mahmud@ab.com',
            Icons.email,
            _sendingMails,
          ),
          const SizedBox(height: 5),
          buildListTile('NID:', '12345678', Icons.person, () {}),
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: SizedBox(
              height: 48,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      foregroundColor: KColor.primary,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                  onPressed: () {},
                  child: Text(
                    'Go to Order',
                    style: KTextStyle.headline8.copyWith(color: KColor.white),
                  )),
            ),
          )
        ],
      ),
    );
  }

  ListTile buildListTile(
      String leadText, String title, IconData icon, VoidCallback onPressed) {
    return ListTile(
      leading: Text(
        leadText,
      ),
      title: Text(
        title,
        style: KTextStyle.subTitle1.copyWith(
          color: KColor.secondary,
        ),
        textAlign: TextAlign.center,
      ),
      trailing: IconButton(
          icon: Container(
              height: 30,
              width: 30,
              decoration: const BoxDecoration(
                  color: KColor.primary, shape: BoxShape.circle),
              child: Icon(
                icon,
                color: KColor.white,
                size: 20,
              )),
          onPressed: onPressed),
    );
  }
}
