import 'package:flutter/material.dart';


class MembershipScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      appBar:
      AppBar(
        elevation:0,
        centerTitle:true,
        automaticallyImplyLeading: false,
        backgroundColor:Color(0x00ffffff),
        shape:RoundedRectangleBorder(
          borderRadius:BorderRadius.zero,
        ),
        title:Text(
          "Membership",
          style:TextStyle(
            fontWeight:FontWeight.w700,
            fontStyle:FontStyle.normal,
            fontSize:20,
            color:Color(0xff000000),
          ),
        ),
        leading: Icon(
          Icons.arrow_back,
          color:Color(0xff212435),
          size:24,
        ),
      ),
      body:Padding(
        padding:EdgeInsets.all(16),
        child:
        Column(
          mainAxisAlignment:MainAxisAlignment.start,
          crossAxisAlignment:CrossAxisAlignment.center,
          mainAxisSize:MainAxisSize.max,
          children: [
            Text(
              "Choose your plan",
              textAlign: TextAlign.start,
              overflow:TextOverflow.clip,
              style:TextStyle(
                fontWeight:FontWeight.w700,
                fontStyle:FontStyle.normal,
                fontSize:16,
                color:Color(0xff000000),
              ),
            ),
            Padding(
              padding:EdgeInsets.fromLTRB(0, 16, 0, 30),
              child:Text(
                "by becoming a menber, you can read on any device, read with no Ads, and offline.",
                textAlign: TextAlign.center,
                overflow:TextOverflow.clip,
                style:TextStyle(
                  fontWeight:FontWeight.w400,
                  fontStyle:FontStyle.normal,
                  fontSize:14,
                  color:Color(0xbe8a8989),
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child:Row(
                mainAxisAlignment:MainAxisAlignment.center,
                crossAxisAlignment:CrossAxisAlignment.center,
                mainAxisSize:MainAxisSize.max,
                children:[

                  Container(
                    margin:EdgeInsets.all(0),
                    padding:EdgeInsets.all(0),
                    width:140,
                    height:180,
                    decoration: BoxDecoration(
                      color:Color(0xffffffff),
                      shape:BoxShape.rectangle,
                      borderRadius:BorderRadius.circular(12.0),
                      border:Border.all(color:Color(0xffff5630),width:1),
                    ),
                    child:

                    Column(
                      mainAxisAlignment:MainAxisAlignment.center,
                      crossAxisAlignment:CrossAxisAlignment.center,
                      mainAxisSize:MainAxisSize.max,
                      children: [
                        Container(
                          margin:EdgeInsets.all(0),
                          padding:EdgeInsets.all(0),
                          width:40,
                          height:40,
                          decoration: BoxDecoration(
                            color:Color(0xffff5630),
                            shape:BoxShape.circle,
                          ),
                          child:
                          Icon(
                            Icons.done,
                            color:Color(0xffffffff),
                            size:24,
                          ),
                        ),
                        Padding(
                          padding:EdgeInsets.fromLTRB(0, 16, 0, 0),
                          child:Text(
                            "Monthly",
                            textAlign: TextAlign.start,
                            maxLines:1,
                            overflow:TextOverflow.ellipsis,
                            style:TextStyle(
                              fontWeight:FontWeight.w700,
                              fontStyle:FontStyle.normal,
                              fontSize:14,
                              color:Color(0xff000000),
                            ),
                          ),
                        ),
                        Padding(
                          padding:EdgeInsets.fromLTRB(0, 8, 0, 0),
                          child:Text(
                            "\$9.99",
                            textAlign: TextAlign.start,
                            overflow:TextOverflow.clip,
                            style:TextStyle(
                              fontWeight:FontWeight.w400,
                              fontStyle:FontStyle.normal,
                              fontSize:14,
                              color:Color(0xff000000),
                            ),
                          ),
                        ),
                        Padding(
                          padding:EdgeInsets.fromLTRB(0, 16, 0, 0),
                          child:Text(
                            "Billed every month",
                            textAlign: TextAlign.start,
                            overflow:TextOverflow.clip,
                            style:TextStyle(
                              fontWeight:FontWeight.w400,
                              fontStyle:FontStyle.normal,
                              fontSize:14,
                              color:Color(0xbe8a8989),
                            ),
                          ),
                        ),
                      ],),
                  ),
                  Container(
                    margin:EdgeInsets.fromLTRB(16, 0, 0, 0),
                    padding:EdgeInsets.all(0),
                    width:140,
                    height:180,
                    decoration: BoxDecoration(
                      color:Color(0xffffffff),
                      shape:BoxShape.rectangle,
                      borderRadius:BorderRadius.circular(12.0),
                      border:Border.all(color:Color(0x68898989),width:1),
                    ),
                    child:

                    Column(
                      mainAxisAlignment:MainAxisAlignment.center,
                      crossAxisAlignment:CrossAxisAlignment.center,
                      mainAxisSize:MainAxisSize.max,
                      children: [
                        Container(
                          margin:EdgeInsets.all(0),
                          padding:EdgeInsets.all(0),
                          width:40,
                          height:40,
                          decoration: BoxDecoration(
                            color:Color(0x68898989),
                            shape:BoxShape.circle,
                          ),
                          child:
                          Icon(
                            Icons.done,
                            color:Color(0xffffffff),
                            size:24,
                          ),
                        ),
                        Padding(
                          padding:EdgeInsets.fromLTRB(0, 16, 0, 0),
                          child:Text(
                            "Yearly",
                            textAlign: TextAlign.start,
                            maxLines:1,
                            overflow:TextOverflow.clip,
                            style:TextStyle(
                              fontWeight:FontWeight.w700,
                              fontStyle:FontStyle.normal,
                              fontSize:14,
                              color:Color(0xff000000),
                            ),
                          ),
                        ),
                        Padding(
                          padding:EdgeInsets.fromLTRB(0, 8, 0, 0),
                          child:Text(
                            "\$4.99/month",
                            textAlign: TextAlign.start,
                            overflow:TextOverflow.clip,
                            style:TextStyle(
                              fontWeight:FontWeight.w400,
                              fontStyle:FontStyle.normal,
                              fontSize:14,
                              color:Color(0xff000000),
                            ),
                          ),
                        ),
                        Padding(
                          padding:EdgeInsets.fromLTRB(0, 16, 0, 0),
                          child:Text(
                            "Billed every 12 month",
                            textAlign: TextAlign.center,
                            overflow:TextOverflow.clip,
                            style:TextStyle(
                              fontWeight:FontWeight.w400,
                              fontStyle:FontStyle.normal,
                              fontSize:14,
                              color:Color(0xbe8a8989),
                            ),
                          ),
                        ),
                      ],),
                  ),
                ],),),
            Padding(
              padding:EdgeInsets.fromLTRB(0, 30, 0, 0),
              child:MaterialButton(
                onPressed:(){},
                color:Color(0xffff5630),
                elevation:0,
                shape:RoundedRectangleBorder(
                  borderRadius:BorderRadius.circular(12.0),
                ),
                padding:EdgeInsets.all(16),
                child:Text("Select Plan", style: TextStyle( fontSize:14,
                  fontWeight:FontWeight.w400,
                  fontStyle:FontStyle.normal,
                ),),
                textColor:Color(0xffffffff),
                height:50,
                minWidth:MediaQuery.of(context).size.width,
              ),
            ),
          ],),),
    )
    ;}
}
