import 'package:flutter/material.dart';
import 'package:food_app/Controlers/Category.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryList extends StatelessWidget {
  final CategoryControler c = Get.put(CategoryControler());

  Future<void> aa() async {
    print(c.getCategory().length);
    if (c.getCategory().length > 0) {
    } else {
      await c.fetchAndSetCategory();
    }

    print(c.getCategory().length);
  }

  @override
  Widget build(BuildContext context) {
    // c.fetchAndSetCategory();
    aa();
    // print(c.getCategory().length);

    return Container(
      height: 200,
      margin: EdgeInsets.all(10),
      child: Obx(
        () => c.getCategory().length > 0
            ? ListView(
                scrollDirection: Axis.horizontal,
                children: c.getCategory().map((e) {
                  return Container(
                    height: 120,
                    child: Card(
                      color: Colors.white,
                      elevation: 15,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      child: Container(
                        height: 110,
                        width: 140,
                        // decoration: BoxDecoration(
                        //   borderRadius: BorderRadius.circular(25),
                        // ),
                        child: Column(
                          children: [
                            Container(
                              height: 110,
                              padding: EdgeInsets.all(5),
                              margin: EdgeInsets.only(bottom: 14),
                              child: ClipRRect(
                                child: Image.network(
                                  e.imageUrl,
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            Text(
                              e.name,
                              style: GoogleFonts.anton(
                                  //   fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  letterSpacing: 2),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            e.type.toString() == '1'
                                ? Text(
                                    e.type + ' kind',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10,
                                    ),
                                  )
                                : Text(
                                    e.type + ' kinds',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10,
                                    ),
                                  )
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
              )
            : Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.orangeAccent,
                ),
              ),
      ),
    );
  }
}
