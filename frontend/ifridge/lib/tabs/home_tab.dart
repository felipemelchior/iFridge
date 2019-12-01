import 'package:flutter/material.dart';

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     Widget _buildBodyBack () => Container(
       decoration: BoxDecoration(
         gradient: LinearGradient(
           colors: [
             Colors.pink,
             Colors.red,
           ],
           begin: Alignment.topLeft,
           end: Alignment.bottomRight,
         )
       ),
     );
    
    return Stack(
      children: <Widget>[
        _buildBodyBack(),
        CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              floating: true,
              snap: true,
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              flexibleSpace: FlexibleSpaceBar(
                title: const Text(
                  "iFridge",
                  style: TextStyle(
                    fontWeight: FontWeight.bold
                  ),
                  ),
                centerTitle: true,
              ),
            )
          ],
        )
      ],
    );
  }
}