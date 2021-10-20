import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_app_marcus_ng/models/activity_model.dart';
import 'package:travel_app_marcus_ng/models/destination_model.dart';

class DestinationScreen extends StatefulWidget {
  final Destination destination;

  const DestinationScreen({
    required this.destination,
  });

  @override
  State<DestinationScreen> createState() => _DestinationScreenState();
}

class _DestinationScreenState extends State<DestinationScreen> {
  Text _buildRatingStars(int rating) {
    String stars = '';
    for (int i = 0; i < rating; i++) {
      stars += '⭐ ';
    }
    return Text(stars);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0.0, 2.0),
                        blurRadius: 6.0,
                      ),
                    ],
                  ),
                  child: Hero(
                    tag: widget.destination.imageUrl,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      ),
                      child: Image(
                        image: AssetImage(widget.destination.imageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10.0,
                    vertical: 30.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(
                          Icons.arrow_back,
                          size: 30.0,
                          color: Colors.black,
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () => Navigator.pop(context),
                            icon: const Icon(
                              Icons.search,
                              size: 30.0,
                              color: Colors.black,
                            ),
                          ),
                          IconButton(
                            onPressed: () => Navigator.pop(context),
                            icon: const Icon(
                              FontAwesomeIcons.sortAmountDown,
                              size: 25.0,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Positioned(
                  left: 20.0,
                  bottom: 20.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.destination.city,
                        style: const TextStyle(
                          fontSize: 35.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        height: 6.0,
                      ),
                      Row(
                        children: [
                          const Icon(
                            FontAwesomeIcons.locationArrow,
                            size: 15.0,
                            color: Colors.white70,
                          ),
                          const SizedBox(width: 10.0),
                          Text(
                            widget.destination.country,
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 25.0,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Positioned(
                  right: 20.0,
                  bottom: 20.0,
                  child: Icon(
                    Icons.location_on,
                    size: 30.0,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.only(top: 10.0, bottom: 15.0),
                itemCount: widget.destination.activities.length,
                itemBuilder: (BuildContext context, int index) {
                  Activity activity = widget.destination.activities[index];
                  return Stack(
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(40.0, 5.0, 20.0, 5.0),
                        height: 170.0,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(
                              100.0, 15.0, 20.0, 15.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 120.0,
                                    child: Text(
                                      activity.name,
                                      style: const TextStyle(
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        '\$${activity.price}',
                                        style: const TextStyle(
                                          fontSize: 22.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Text(
                                        'per pax',
                                        style: TextStyle(
                                          color: Colors.grey.shade400,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              Text(
                                activity.type,
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey.shade400,
                                ),
                              ),
                              const SizedBox(height: 5.0),
                              _buildRatingStars(activity.rating),
                              const SizedBox(height: 5.0),
                              Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(5.0),
                                    alignment: Alignment.center,
                                    width: 70.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.0),
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                    ),
                                    child: Text(activity.startTimes[0]),
                                  ),
                                  const SizedBox(width: 10.0),
                                  Container(
                                    padding: const EdgeInsets.all(5.0),
                                    alignment: Alignment.center,
                                    width: 70.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.0),
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                    ),
                                    child: Text(activity.startTimes[0]),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 20.0,
                        top: 15.0,
                        bottom: 15.0,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Image(
                            width: 110.0,
                            image: AssetImage(activity.imageUrl),
                            fit: BoxFit.cover,
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
