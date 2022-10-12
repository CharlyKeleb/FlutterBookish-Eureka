import 'package:flutter/material.dart';
import 'package:flutter_web_projects/Theme/theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width > 1200 ? 320.0 : 40.0,
        ),
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Short Stories',
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.w900,
              ),
            ),
            const Text(
              'Explore Short Stories Category',
              style: TextStyle(),
            ),
            Flexible(
              child: GridView.builder(
                itemCount: 30,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1.8 / 2.3,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.width > 1200
                            ? 36.h
                            : 35.0.h,
                        width: MediaQuery.of(context).size.width > 1200
                            ? 19.0.w
                            : 22.0.w,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          elevation: 5,
                          child: const ClipRRect(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      const Text(
                        'The Blazing World',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                      ),
                      Text(
                        'Margaret Cavendish',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Constants.blueAccent,
                          fontSize: 14.0,
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width > 1200
                            ? 19.0.w
                            : 22.0.w,
                        child: const Text(
                          'A few resources to get you started if this is your first Flutter project. For help getting started with Flutter development, view the online documentation',
                          maxLines: 5,
                          style: TextStyle(
                            overflow: TextOverflow.ellipsis,
                            fontSize: 12.0,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
