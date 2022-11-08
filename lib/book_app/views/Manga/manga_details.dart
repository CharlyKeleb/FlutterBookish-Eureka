import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_web_projects/book_app/widgets/video_player.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:sizer/sizer.dart';

class Details extends StatefulWidget {
  final movie;

  const Details({this.movie, Key? key}) : super(key: key);

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  bool transition = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width > 1200 ? 320.0 : 0.0,
        ),
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              leading: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: const Icon(
                      Icons.keyboard_backspace,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              pinned: true,
              floating: false,
              elevation: 0.0,
              expandedHeight: 65.h,
              flexibleSpace: FlexibleSpaceBar(
                //   collapseMode: CollapseMode.parallax,
                title: Text(
                  widget.movie.title,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                background: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 1000),
                  child: transition
                      ? YouTubeVideoContainer(videoId: widget.movie.youtubeId ?? '2_LV8aUJ_ms')
                      : Stack(
                          children: [
                            Hero(
                              tag: widget.movie.id,
                              child: Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image:
                                        NetworkImage(widget.movie.posterImage),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: MediaQuery.of(context).size.height / 2,
                              right: MediaQuery.of(context).size.width / 2,
                              child: FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    transition = true;
                                  });
                                },
                                tooltip: 'Play',
                                backgroundColor:
                                    Theme.of(context).colorScheme.secondary,
                                child: const Center(
                                  child: Icon(
                                    Icons.play_arrow,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  if (index > 0) return null;
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        const SizedBox(height: 25.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Movie Rating: ',
                              style: TextStyle(),
                            ),
                            const SizedBox(width: 5.0),
                            RatingBarIndicator(
                              rating: widget.movie.averageRating == null
                                  ? 0.1
                                  : (double.parse(widget.movie?.averageRating ??
                                              20.0) /
                                          10) /
                                      2,
                              itemBuilder: (context, index) => const Icon(
                                CupertinoIcons.star_fill,
                                color: Colors.amber,
                              ),
                              itemCount: 5,
                              itemSize: 14.0,
                            ),
                          ],
                        ),
                        const SizedBox(height: 5.0),
                        ListTile(
                          title: Text(
                            'overview'.toUpperCase(),
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(widget.movie.description),
                        ),
                        const SizedBox(height: 5.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Age Rating:',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17.0),
                            ),
                            const SizedBox(width: 2.0),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 5.0),
                              child: Text(
                                widget.movie?.ageRatingGuide ?? "1+",
                                style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 5.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Episodes:',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17.0),
                            ),
                            const SizedBox(width: 2.0),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 3.0),
                              child: widget.movie.episodeCount == null
                                  ? Text(
                                      'Still-Filming',
                                      style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    )
                                  : Text(
                                      widget.movie.episodeCount.toString(),
                                      style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Released Date:',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17.0,
                              ),
                            ),
                            const SizedBox(width: 2.0),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 3.0),
                              child: widget.movie.endDate == null
                                  ? const Text('Not Available')
                                  : Text(
                                      DateFormat("dd/MM/yy").format(
                                        DateTime.parse(
                                          widget.movie.endDate,
                                        ),
                                      ),
                                    ),
                            ),
                          ],
                        ),
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          title: widget.movie.averageRating == null
                              ? const Text(
                                  'Popularity Rank 0.0%',
                                  style: TextStyle(fontWeight: FontWeight.w900),
                                )
                              : Text(
                                  "${"Popularity Rank".toUpperCase()}  ${widget.movie.averageRating.toString()}%",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                          subtitle: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5.0),
                            child: LinearPercentIndicator(
                              animation: true,
                              lineHeight: 15.0,
                              animationDuration: 2500,
                              percent: widget.movie.averageRating == null
                                  ? 0.0
                                  : (double.parse(widget.movie?.averageRating ??
                                              10) /
                                          100)
                                      .toDouble(),
                              barRadius: const Radius.circular(10.0),
                              progressColor: Colors.blue,
                            ),
                          ),
                        ),
                      ],
                    ),
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
