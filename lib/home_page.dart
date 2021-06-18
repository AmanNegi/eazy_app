import 'package:flutter/material.dart';
import 'main.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

String loremText = """
Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.""";

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var height, width;

  Color color = Colors.black;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: 10.0, left: 15.0),
              child: Text(
                "Brand: Dennis Lingo",
                style: TextStyle(
                    color: mainColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 12),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 15.0),
              child: Text("Dennis Lingo Men's Shirt"),
            ),
            Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20.0),
                  height: 0.4 * height,
                  width: double.infinity,
                  child: Image.asset(
                    "assets/shirt.png",
                    width: double.infinity,
                    fit: BoxFit.fitWidth,
                    color: color,
                  ),
                ),
                Positioned(
                  top: 20.0,
                  right: 20.0,
                  child: CircleAvatar(
                    backgroundColor: Colors.grey.withOpacity(0.5),
                    child: IconButton(
                      color: Colors.white,
                      onPressed: () {},
                      icon: Icon(Icons.share),
                    ),
                  ),
                ),
                Positioned(
                  top: 0.1 * height,
                  right: 20.0,
                  child: CircleAvatar(
                    backgroundColor: Colors.grey.withOpacity(0.5),
                    child: IconButton(
                      color: Colors.white,
                      onPressed: () {},
                      icon: Icon(Icons.favorite_border),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  right: 20.0,
                  child: CircleAvatar(
                    backgroundColor: color,
                    child: IconButton(
                      color: Colors.white,
                      onPressed: _showDialog,
                      icon: Icon(Icons.color_lens),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              child: Row(
                children: [
                  Spacer(),
                  _buildIndicator(color: mainColor),
                  _buildIndicator(),
                  _buildIndicator(),
                  _buildIndicator(),
                  Spacer(),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10.0, left: 15.0, right: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "\$19.0",
                    style: TextStyle(
                        color: mainColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 26),
                  ),
                  Text(
                    loremText,
                    style: TextStyle(fontSize: 13),
                    maxLines: 3,
                  ),
                  Divider(),
                  Text(
                    "Available Sizes:",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                    maxLines: 3,
                  ),
                  SizedBox(height: 5.0),
                  Row(
                    children: [
                      _buildSizes("S"),
                      _buildSizes("M"),
                      _buildSizes("L"),
                      _buildSizes("XL"),
                      _buildSizes("2XL"),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20.0),
                    height: 0.07 * height,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: mainColor,
                    ),
                    child: Center(
                      child: Text(
                        "Buy now",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10.0, bottom: 30.0),
                    height: 0.07 * height,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: mainColor.withOpacity(0.6),
                    ),
                    child: Center(
                      child: Text(
                        "Add to Cart",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      elevation: 0,
      leading: IconButton(
        icon: Icon(
          Icons.menu,
          color: Colors.white,
        ),
        onPressed: () {},
      ),
      title: Text(
        "Eazy",
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.search, color: Colors.white),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.card_travel_outlined, color: Colors.white),
          onPressed: () {},
        ),
      ],
    );
  }

  Container _buildSizes(String s) {
    return Container(
      margin: EdgeInsets.only(right: 7.50),
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(3.0),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 15.0,
        vertical: 5.0,
      ),
      child: Text("$s"),
    );
  }

  Container _buildIndicator({Color color}) {
    return Container(
      margin: EdgeInsets.only(right: 5.0),
      height: 10,
      width: 10,
      decoration: BoxDecoration(
        color: color ?? Colors.grey[200],
        shape: BoxShape.circle,
      ),
    );
  }

  String _getHexCode(Color color) => color.toString().substring(
      color.toString().lastIndexOf("0x") + 4, color.toString().length - 1);

  Color _getColor(String hexCode) {
    return HexColor.fromHex("#$hexCode");
  }

  _showDialog() {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return StatefulBuilder(builder: (context, innerSetState) {
          TextEditingController textEditingController =
              TextEditingController(text: _getHexCode(color));

          textEditingController.addListener(() {});

          return Material(
            color: Colors.transparent,
            child: Dialog(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ColorPicker(
                      onColorChanged: (Color value) {
                        color = value;
                        textEditingController.text = _getHexCode(value);
                        innerSetState(() {});
                        setState(() {});
                      },
                      pickerColor: color,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextField(
                        textInputAction: TextInputAction.go,
                        onSubmitted: (String v) {
                          if (textEditingController.text.length == 6) {
                            color = _getColor(v);
                            innerSetState(() {});
                            setState(() {});
                          }
                        },
                        decoration: InputDecoration(
                          prefixText: "# ",
                        ),
                        controller: textEditingController,
                      ),
                    ),
                    Row(
                      children: [
                        Spacer(),
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 30.0,
                              vertical: 10.0,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              color: mainColor,
                            ),
                            child: Text(
                              "OK",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 15),
                      ],
                    ),
                    SizedBox(height: 15),
                  ],
                ),
              ),
            ),
          );
        });
      },
    );
  }
}

extension HexColor on Color {
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}
