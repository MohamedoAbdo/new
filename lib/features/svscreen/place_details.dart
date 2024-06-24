import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tourism_app/Helper/api.dart';
import 'package:tourism_app/Helper/app_helper.dart';
import 'package:tourism_app/features/controllers/place_details_controller.dart';
import 'package:tourism_app/features/home/presentation/home_view.dart';
import 'package:tourism_app/features/svscreen/PharaonicVillage.dart';
import 'package:tourism_app/models/home_places_model.dart';

class PlaceDetailsScreen extends StatefulWidget {
  const PlaceDetailsScreen({super.key, required this.id});
  final int id;
  @override
  State<PlaceDetailsScreen> createState() => _PlaceDetailsScreenState();
}

class _PlaceDetailsScreenState extends State<PlaceDetailsScreen> {
  late Future<Place> place;
  late Future<PlacesModel> popularPlace;
  final PlaceDetailsController placeDetailsController =
      PlaceDetailsController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    place = placeDetailsController.getPlace(widget.id);
    popularPlace = placeDetailsController.getPopularPlaces();
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double fontSize32 = (screenWidth <= 600) ? 32 : 42;
    double fontSize24 = (screenWidth <= 600) ? 24 : 32;
    double fontSize16 = (screenWidth <= 600) ? 16 : 24;
    return Scaffold(
      body: Container(
        // decoration: const BoxDecoration(color: Colors.black),
        key: _formKey,
        child: FutureBuilder(
            future: place,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (snapshot.hasError) {
                return const Center(
                  child: Text("Error"),
                );
              }

              if (snapshot.hasData) {
                final data = snapshot.data as Place;
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        child: Column(
                          children: [
                            Stack(children: [
                              Container(
                                child: Image.network(
                                  "$base/images/${data.image}",
                                  fit: BoxFit.cover,
                                  width: MediaQuery.of(context).size.width,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: MediaQuery.of(context).size.height *
                                        0.05),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Row(
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            "     ",
                                          )
                                        ],
                                      ),
                                      Icon(
                                        Icons.arrow_back_ios,
                                        color: Color(0xFF6C3428),
                                        size: 30,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ])
                          ],
                        ),
                      ),
                      //

                      Baseline(
                        baselineType: TextBaseline.alphabetic,
                        baseline: -5,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        .03,
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        .05,
                                    width:
                                        MediaQuery.of(context).size.width * 1.0,
                                    child: Text(
                                      '   ${data.name}    ',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: const Color(0xFF6C3428),
                                        fontSize: fontSize24,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        .005,
                                  ),
                                  Container(
                                    height:
                                        MediaQuery.of(context).size.height * .4,
                                    width:
                                        MediaQuery.of(context).size.width * 1.0,
                                    color: Colors.white,
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 16,
                                            right: 16,
                                            left: 16,
                                            bottom: 16),
                                        child: Text(
                                          '${data.description}',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            color: const Color(0xFFBE8C63),
                                            fontSize: fontSize16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        .02,
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        .045,
                                    width:
                                        MediaQuery.of(context).size.width * 1.0,
                                    child: Text(
                                      '   popular places:     ',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: const Color(0xFF6C3428),
                                        fontSize: fontSize24,
                                        fontWeight: FontWeight.w500,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                .0015,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .032),
                                  FutureBuilder(
                                    future: popularPlace,
                                    builder: (context, snapshot) {
                                      if (snapshot.connectionState ==
                                          ConnectionState.waiting) {
                                        return const SizedBox();
                                      }

                                      if (snapshot.hasError) {
                                        return const Center(
                                          child: Text("Error"),
                                        );
                                      }

                                      if (snapshot.hasData) {
                                        var data = snapshot.data!.data!;
                                        data.shuffle();
                                        if (data.length > 4) {
                                          data = data.sublist(0, 4);
                                        }

                                        return SizedBox(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child: GridView.count(
                                              shrinkWrap: true,
                                              physics:
                                                  const NeverScrollableScrollPhysics(),
                                              crossAxisCount: 2,
                                              mainAxisSpacing: 20,
                                              crossAxisSpacing: 15,
                                              childAspectRatio: 0.82,
                                              children: List.generate(
                                                  data.length,
                                                  (index) => InkWell(
                                                        onTap: () {
                                                          Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        PlaceDetailsScreen(
                                                                          id: data[index]
                                                                              .id!,
                                                                        )),
                                                          );
                                                        },
                                                        child: SizedBox(
                                                          child: Column(
                                                            children: [
                                                              Image.network(
                                                                '$base/images/${data[index].image}',
                                                                height: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .height *
                                                                    .25,
                                                                width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width *
                                                                    .45,
                                                                fit: BoxFit
                                                                    .cover,
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      ))),
                                        );
                                      } else {
                                        return const Text('No data');
                                      }
                                    },
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }
              return const SizedBox();
            }),
      ),
    );
  }
}
