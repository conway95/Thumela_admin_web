import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../authentication/login_screen.dart';
import '../riders/all_blocked_riders_screen.dart';
import '../riders/all_verified_riders_screen.dart';
import '../sellers/all_blocked_sellers_screen.dart';
import '../sellers/all_verified_sellers_screen.dart';
import '../users/all_blocked_users_screen.dart';
import '../users/all_verified_users_screen.dart';

class HomeScreen extends StatefulWidget
{
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}



class _HomeScreenState extends State<HomeScreen>
{
  String timeText = "";
  String dateText = "";


  String formatCurrentLiveTime(DateTime time)
  {
    return DateFormat("hh:mm:ss a").format(time);
  }

  String formatCurrentDate(DateTime date)
  {
    return DateFormat("dd MMMM, yyyy").format(date);
  }

  getCurrentLiveTime()
  {
    final DateTime timeNow = DateTime.now();
    final String liveTime = formatCurrentLiveTime(timeNow);
    final String liveDate = formatCurrentDate(timeNow);

    if(this.mounted)
    {
      setState(() {
        timeText = liveTime;
        dateText = liveDate;
      });
    }
  }

  @override
  void initState()
  {
    super.initState();

    //time
    timeText = formatCurrentLiveTime(DateTime.now());

    //date
    dateText = formatCurrentDate(DateTime.now());

    Timer.periodic(const Duration(seconds: 1), (timer)
    {
      getCurrentLiveTime();
    });
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors:
              [
                Colors.white,
                Colors.white70,
              ],
              begin: FractionalOffset(0, 0),
              end: FractionalOffset(1, 0),
              stops: [0, 1],
              tileMode: TileMode.clamp,
            ),
          ),
        ),
        title: const Text(
          "Admin Web Portal",
          style: TextStyle(
            fontSize: 20,
            letterSpacing: 3,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                timeText + "\n" + dateText,
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.pink,
                  letterSpacing: 3,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            //users activate and block accounts button ui
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //active
                ElevatedButton.icon(
                  icon: const Icon(Icons.person_add, color: Colors.black,),
                  label: Text(
                    "All Verified Users".toUpperCase() + "\n" + "Accounts".toUpperCase(),
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      letterSpacing: 3,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(40), backgroundColor: Colors.white,
                  ),
                  onPressed: ()
                  {
                    Navigator.push(context, MaterialPageRoute(builder: (c)=> const AllVerifiedUsersScreen()));
                  },
                ),

                const SizedBox(width: 20,),

                //block
                ElevatedButton.icon(
                  icon: const Icon(Icons.block_flipped, color: Colors.black,),
                  label: Text(
                    "All Blocked Users".toUpperCase() + "\n" + "Accounts".toUpperCase(),
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      letterSpacing: 3,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(40), backgroundColor: Colors.white,
                  ),
                  onPressed: ()
                  {
                    Navigator.push(context, MaterialPageRoute(builder: (c)=> const AllBlockedUsersScreen()));
                  },
                ),
              ],
            ),

            //sellers activate and block accounts button ui
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //active
                ElevatedButton.icon(
                  icon: const Icon(Icons.person_add, color: Colors.black,),
                  label: Text(
                    "All Verified Sellers".toUpperCase() + "\n" + "Accounts".toUpperCase(),
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      letterSpacing: 3,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(40), backgroundColor: Colors.white,
                  ),
                  onPressed: ()
                  {
                    Navigator.push(context, MaterialPageRoute(builder: (c)=> const AllVerifiedSellersScreen()));
                  },
                ),

                const SizedBox(width: 20,),

                //block
                ElevatedButton.icon(
                  icon: const Icon(Icons.block_flipped, color: Colors.black,),
                  label: Text(
                    "All Blocked Sellers".toUpperCase() + "\n" + "Accounts".toUpperCase(),
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      letterSpacing: 3,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(40), backgroundColor: Colors.white,
                  ),
                  onPressed: ()
                  {
                    Navigator.push(context, MaterialPageRoute(builder: (c)=> const AllBlockedSellersScreen()));
                  },
                ),
              ],
            ),

            //riders activate and block accounts button ui
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //active
                ElevatedButton.icon(
                  icon: const Icon(Icons.person_add, color: Colors.black,),
                  label: Text(
                    "All Verified Riders".toUpperCase() + "\n" + "Accounts".toUpperCase(),
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      letterSpacing: 3,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(40), backgroundColor: Colors.white,
                  ),
                  onPressed: ()
                  {
                    Navigator.push(context, MaterialPageRoute(builder: (c)=> const AllVerifiedRidersScreen()));
                  },
                ),

                const SizedBox(width: 20,),

                //block
                ElevatedButton.icon(
                  icon: const Icon(Icons.block_flipped, color: Colors.black,),
                  label: Text(
                    "All Blocked Riders".toUpperCase() + "\n" + "Accounts".toUpperCase(),
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      letterSpacing: 3,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(40), backgroundColor: Colors.white,
                  ),
                  onPressed: ()
                  {
                    Navigator.push(context, MaterialPageRoute(builder: (c)=> const AllBlockedRidersScreen()));
                  },
                ),
              ],
            ),

            //logout button
            ElevatedButton.icon(
              icon: const Icon(Icons.logout, color: Colors.black,),
              label: Text(
                "Logout".toUpperCase(),
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  letterSpacing: 3,
                ),
              ),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(40), backgroundColor: Colors.white,
              ),
              onPressed: ()
              {
                FirebaseAuth.instance.signOut();
                Navigator.push(context, MaterialPageRoute(builder: (c)=> const LoginScreen()));
              },
            ),
          ],
        ),
      ),
    );
  }
}

/*Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        titleMsg: "Admin WEB panel",
        showBackButton: false, bottom: null,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                //upload banners btn
                ElevatedButton.icon(
                    onPressed: ()
                    {

                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 117, vertical: 31),
                      backgroundColor: Colors.deepOrange,
                    ),
                    icon: const Icon(Icons.screen_share_outlined, color: Colors.white),
                    label: Text(
                    "Upload banner".toUpperCase(),
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      letterSpacing: 3,
                    ),
                  )
                ),

                const SizedBox(width: 20,),

                //upload category btn
                ElevatedButton.icon(
                    onPressed: ()
                    {

                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 110, vertical: 30),
                      backgroundColor: Colors.purpleAccent,
                    ),
                    icon: const Icon(Icons.category_outlined, color: Colors.white),
                    label: Text(
                      "Upload banner".toUpperCase(),
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        letterSpacing: 3,
                      ),
                    )
                ),

              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                // users activate and block accounts button ui
                ElevatedButton.icon(
                    onPressed: ()
                    {

                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 30),
                      backgroundColor: Colors.green,
                    ),
                    icon: const Icon(Icons.check_circle_outline, color: Colors.white),
                    label: Text(
                      "All verified users accounts".toUpperCase(),
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        letterSpacing: 3,
                      ),
                    )
                ),

                const SizedBox(width: 20,),

                //upload category btn
                ElevatedButton.icon(
                    onPressed: ()
                    {

                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 30),
                      backgroundColor: Colors.deepOrange,
                    ),
                    icon: const Icon(Icons.block_flipped, color: Colors.white),
                    label: Text(
                      "All blocked users accounts".toUpperCase(),
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        letterSpacing: 3,
                      ),
                    )
                ),

              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                //sellers activate and bl
                ElevatedButton.icon(
                    onPressed: ()
                    {

                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 30),
                      backgroundColor: Colors.purpleAccent,
                    ),
                    icon: const Icon(Icons.check_circle_outline, color: Colors.white),
                    label: Text(
                      "All verified sellers accounts".toUpperCase(),
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        letterSpacing: 3,
                      ),
                    )
                ),

                const SizedBox(width: 20,),

                //upload category btn
                ElevatedButton.icon(
                    onPressed: ()
                    {

                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 30),
                      backgroundColor: Colors.green,
                    ),
                    icon: const Icon(Icons.block_flipped, color: Colors.white),
                    label: Text(
                      "All blocked sellers accounts".toUpperCase(),
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        letterSpacing: 3,
                      ),
                    )
                ),

              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                //riders activate and block
                ElevatedButton.icon(
                    onPressed: ()
                    {

                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
                      backgroundColor: Colors.deepOrange,
                    ),
                    icon: const Icon(Icons.check_circle_outline, color: Colors.white),
                    label: Text(
                      "All verified riders accounts".toUpperCase(),
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        letterSpacing: 3,
                      ),
                    )
                ),

                const SizedBox(width: 20,),

                //upload category btn
                ElevatedButton.icon(
                    onPressed: ()
                    {

                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
                      backgroundColor: Colors.purpleAccent,
                    ),
                    icon: const Icon(Icons.block_flipped, color: Colors.white),
                    label: Text(
                      "All blocked riders accounts".toUpperCase(),
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        letterSpacing: 3,
                      ),
                    )
                ),

              ],
            ),

          ],
        ),
      ),
    );

  }
  */

