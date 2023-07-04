import 'package:flutter/material.dart';
import 'package:gojek/main_screen/checkout.dart';

class MenuListUnvailable extends StatelessWidget {
  final String foodImage;
  final String foodName;
  final String foodDetail;

  const MenuListUnvailable({
    Key? key,
    required this.foodImage,
    required this.foodName,
    required this.foodDetail,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      foodName,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w900,
                        color: Colors.black45,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 10),
                    Text(
                      foodDetail,
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.black45,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Out of Stock',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.red.shade900,
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: ColorFiltered(
                    colorFilter:
                        ColorFilter.mode(Colors.grey, BlendMode.saturation),
                    child: Image.asset(
                      foodImage,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}

class MenuListAvailable extends StatefulWidget {
  final String foodImage;
  final String foodName;
  final String foodDetail;
  final String foodPrice;
  final String restoName;

  MenuListAvailable({
    Key? key,
    required this.foodImage,
    required this.foodName,
    required this.foodDetail,
    required this.foodPrice,
    required this.restoName,
  }) : super(key: key);

  @override
  _MenuListAvailableState createState() => _MenuListAvailableState();
}

class _MenuListAvailableState extends State<MenuListAvailable> {
  int _quantity = 0;
  // ignore: unused_field
  double _totalPrice = 0.0;

void _incrementQuantity() {
  setState(() {
    _quantity++;
    _totalPrice = double.parse(widget.foodPrice) * _quantity;
  });
}

void _decrementQuantity() {
  setState(() {
    if (_quantity > 0) {
      _quantity--;
      _totalPrice = double.parse(widget.foodPrice) * _quantity;
    }
  });
}

  Future<void> _orderBottomModalForm(BuildContext context) async {
    await showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext bc) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Container(
              height: MediaQuery.of(bc).size.height * 0.9,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.asset(
                                  widget.foodImage,
                                  height:
                                      MediaQuery.of(context).size.height * .3,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              widget.foodName,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: 5),
                            Text(
                              widget.foodDetail,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontSize: 12),
                            ),
                            SizedBox(height: 5),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Quantity: $_quantity',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: _decrementQuantity,
                          icon: Icon(Icons.remove_circle_outline),
                        ),
                        SizedBox(width: 10),
                        Text(
                          '$_quantity',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(width: 10),
                        IconButton(
                          onPressed: _incrementQuantity,
                          icon: Icon(
                            Icons.add_circle_outline,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),

                    Text(
                      'Total Harga: Rp. $_totalPrice',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Text(
                      'Rp. ${widget.foodPrice}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        if (_quantity > 0) 
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CheckoutPage(
                                foodName: widget.foodName,
                                foodPrice: widget.foodPrice,
                                quantity: _quantity,
                                restoName: widget.restoName,
                                foodImage: widget.foodImage,
                              ),
                            ),
                          );
                        
                      },
                      child: Text(
                        'Pesan Sekarang',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all(Colors.white),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.green.shade700),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                            side: BorderSide(color: Colors.green),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            _orderBottomModalForm(context);
          },
          child: Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        widget.foodName,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w900,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 10),
                      Text(
                        widget.foodDetail,
                        style: TextStyle(
                          fontSize: 13,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Rp. ${widget.foodPrice}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.asset(
                      widget.foodImage,
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}

class RestoReviewWidget extends StatelessWidget {
  final String keterangan;
  final String iconsValue;
  final Color iconsColor;
  final IconData icons;

  RestoReviewWidget({
    Key? key,
    required this.keterangan,
    required this.iconsValue,
    required this.iconsColor,
    required this.icons,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                icons,
                color: iconsColor,
                size: 17,
              ),
              SizedBox(width: 5),
              Text(
                '$iconsValue',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              )
            ],
          ),
          SizedBox(height: 10),
          Text(
            '$keterangan',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 13),
          ),
        ],
      ),
    );
  }
}

class FavoriteButton extends StatefulWidget {
  FavoriteButton({
    Key? key,
  }) : super(key: key);

  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        setState(() {
          isFavorite = !isFavorite;
        });
      },
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        color: Colors.red,
      ),
    );
  }
}
