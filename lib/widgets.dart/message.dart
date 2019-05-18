import 'package:flutter/material.dart';

class Message extends StatefulWidget {
  final String uimg, uname, lastmsg, date;
  final bool isactive;

  const Message(
      {Key key, this.uimg, this.uname, this.lastmsg, this.date, this.isactive})
      : super(key: key);

  @override
  _MessageState createState() => _MessageState();
}

class _MessageState extends State<Message> {
  @override
  Widget build(BuildContext context) {
    return Material(
          color: Colors.white,
          child: InkWell(
            highlightColor: Color.fromRGBO(220, 220, 250, .6),
            splashColor: Color.fromRGBO(230, 230, 245, .4),
            onTap: (){},
            child: Container(
          margin: EdgeInsets.only(left: 8, right: 8, top: 8,bottom: 8),
          child: Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 4, right: 12),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(widget.uimg),
                  maxRadius: 28,
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      child: Text(
                        widget.uname,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontFamily: "Baloo",fontSize: 20),
                      ),
                    ),
                    Container(
                      child: Text(
                        widget.lastmsg,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.grey),
                        
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 8, right: 12),
                child: Text("3h",style: TextStyle(color: Colors.indigo),),
              )
            ],
          ),
        ),
      ),
    );
  }
}
