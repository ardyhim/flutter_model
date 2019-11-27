import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';

class DetailPage extends StatefulWidget {
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool isSwipe = true;
  int _currentPage = 0;
  PageController _pageController = PageController(initialPage: 0);

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        body: Stack(
          children: <Widget>[
            Positioned(
              top: 0,
              child: Container(
                width: width,
                height: height / 100 * 70,
                child: PageView(
                  controller: _pageController,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.redAccent,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            "https://source.unsplash.com/X2UprmSxIHQ/780x1200/",
                          ),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            "https://source.unsplash.com/0HVwKQv-jmE/780x1200/",
                          ),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.greenAccent,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            "https://source.unsplash.com/nyrSsBzhZ4Y/780x1200/",
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            CustomScrollView(
              slivers: <Widget>[
                SliverAppBar(
                  backgroundColor: Colors.transparent,
                  expandedHeight: height / 100 * 60,
                  flexibleSpace: FlexibleSpaceBar(
                    background: GestureDetector(
                      onPanUpdate: (DragUpdateDetails details) {
                        if (details.delta.dx > 0 && isSwipe) {
                          setState(() {
                            isSwipe = false;
                            _currentPage -= 1;
                            if (_currentPage < 0) _currentPage = 2;
                          });
                          Future.delayed(
                            Duration(milliseconds: 300),
                          ).then((d) {
                            setState(() {
                              isSwipe = true;
                            });
                          });
                          _pageController.animateToPage(
                            _currentPage,
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeInOutCubic,
                          );
                        } else if (details.delta.dx < 0 && isSwipe) {
                          setState(() {
                            isSwipe = false;
                            _currentPage += 1;
                            if (_currentPage > 2) _currentPage = 0;
                          });
                          Future.delayed(
                            Duration(milliseconds: 300),
                          ).then((d) {
                            setState(() {
                              isSwipe = true;
                            });
                          });
                          _pageController.animateToPage(
                            _currentPage,
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeInOutCubic,
                          );
                        }
                      },
                      child: Container(
                        width: width,
                        height: height / 100 * 60,
                        color: Colors.transparent,
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: new DotsIndicator(
                            dotsCount: 3,
                            position: _currentPage.toDouble(),
                            decorator: DotsDecorator(
                              color: Colors.black87,
                              activeColor: Colors.redAccent,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    height: 30,
                    width: width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: Center(
                      child: Container(
                        width: width / 100 * 20,
                        height: 10,
                        decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    color: Colors.white,
                    width: width,
                    height: 70,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 7,
                          child: Text(
                            "Shelly Chambers",
                            maxLines: 2,
                            style: Theme.of(context).textTheme.title.copyWith(
                                  fontSize: 30,
                                ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: IconButton(
                              icon: Icon(Icons.favorite),
                              onPressed: () {},
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    color: Colors.white,
                    width: width,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          flex: 3,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "HEIGHT",
                                style: Theme.of(context).textTheme.caption,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 5),
                                child: Text(
                                  "5.5 (165cm)",
                                  style: Theme.of(context)
                                      .textTheme
                                      .title
                                      .copyWith(
                                        fontSize: 17,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "AGE",
                                style: Theme.of(context).textTheme.caption,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 5),
                                child: Text(
                                  "22",
                                  style: Theme.of(context)
                                      .textTheme
                                      .title
                                      .copyWith(
                                        fontSize: 17,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Text(
                                "EXPERIENCE",
                                style: Theme.of(context).textTheme.caption,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 5),
                                child: Text(
                                  "★ ★ ★ ★ ★",
                                  style: Theme.of(context)
                                      .textTheme
                                      .title
                                      .copyWith(
                                        fontSize: 17,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    color: Colors.white,
                    width: width,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Description",
                          style: Theme.of(context).textTheme.caption,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 5),
                          child: RichText(
                            text: TextSpan(
                              text:
                                  "The Random Name Generator is a simple fiction writing tool to create character names. The generator contains English first and last",
                              style: Theme.of(context).textTheme.body1.copyWith(
                                    fontSize: 17,
                                  ),
                              children: [
                                TextSpan(
                                  text: " Read More",
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle
                                      .copyWith(
                                        color: Colors.redAccent,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    width: width,
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          margin:
                              EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                          child: Text(
                            "GALLERY",
                            style: Theme.of(context).textTheme.caption.copyWith(
                                  fontSize: 17,
                                ),
                          ),
                        ),
                        Container(
                          width: width,
                          height: 180,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 5,
                            itemBuilder: (BuildContext context, int i) {
                              return Container(
                                margin: EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 10,
                                ),
                                width: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                      "https://source.unsplash.com/nyrSsBzhZ4Y/170x380/",
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        Container(
                          margin:
                              EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                          child: SizedBox(
                            width: width,
                            height: 60,
                            child: FlatButton(
                              color: Colors.deepOrangeAccent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Text(
                                "Book Shelley",
                                style:
                                    Theme.of(context).textTheme.button.copyWith(
                                          fontSize: 25,
                                          color: Colors.white,
                                        ),
                              ),
                              onPressed: () {},
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
