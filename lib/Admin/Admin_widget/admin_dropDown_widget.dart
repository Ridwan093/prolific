import 'package:flutter/material.dart';
import 'package:prolific/fonts/font_names.dart';

class MyDropdownContainer extends StatefulWidget {
  final List<String> jobOwner;
  const MyDropdownContainer({super.key, required this.jobOwner});

  @override
  _MyDropdownContainerState createState() => _MyDropdownContainerState();
}

class _MyDropdownContainerState extends State<MyDropdownContainer>
    with SingleTickerProviderStateMixin {
  String _selectedValue = "Select";
  bool _isExpanded = false;
  AnimationController? _animationController;
  Animation<double>? _animation;
  double height = 50;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _animation = CurvedAnimation(
      parent: _animationController!,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _animationController!.dispose();
    super.dispose();
  }

  void _toggleDropdown() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _animationController!.forward();
      } else {
        _animationController!.reverse();
      }
    });
  }

  void _selectValue(String value) {
    setState(() {
      _selectedValue = value;
      _isExpanded = false;
      _animationController!.reverse();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      width: 180,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.white,
        ),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
            onTap: _toggleDropdown,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _selectedValue,
                  maxLines: 1,
                  softWrap: false,
                  textScaleFactor: 1.0,
                  textWidthBasis: TextWidthBasis.parent,
                  strutStyle: StrutStyle.disabled,
                  textDirection: TextDirection.ltr,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontFamily: shipporiAntique,
                      color: Colors.grey,
                      fontSize: 16),
                ),
                Icon(
                  _isExpanded ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                  size: 30,
                ),
              ],
            ),
          ),
          SizeTransition(
              sizeFactor: _animation!,
              child: Wrap(
                  children: widget.jobOwner
                      .map((e) => ListTile(
                            title: Text(e),
                            onTap: () => _selectValue(e),
                          ))
                      .toList())),
        ],
      ),
    );
  }
}
