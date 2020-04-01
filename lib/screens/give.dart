// import 'package:flutter/material.dart';
// import '../providers/request.dart';

// class AddInputTextFieldScreen extends StatefulWidget {
//   static const routeName = '/add-edit-textfield-screen';
//   @override
//   _AddInputTextFieldScreenState createState() =>
//       _AddInputTextFieldScreenState();
// }

// class _AddInputTextFieldScreenState extends State<AddInputTextFieldScreen> {
//   final _subTitleFocus = FocusNode();
//   final _contextFocus = FocusNode();
//   final _imageURLController = TextEditingController();
//   final _imageURLFocus = FocusNode();
//   final _form = GlobalKey<FormState>();

//   var _editableStory = Request(
//   String requestName;
//   String requestDescription;
//   String address;
//   String dateTime;
//   String currentStatus;

//   );

//   var _initValues = {
//     'id': null,
//     'storyTitle': '',
//     'storySubTitle': '',
//     'storyContent': '',
//     'imageURL': '',
//     'storyTime': '',
//     'isStar': false,
//     'isBookmarked': false,
//   };

//   var _isLoading = false;

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _imageURLFocus.addListener(_updateImageURL);
//   }

//   var _isInitForDidChange = true;

//   @override
//   void didChangeDependencies() {
//     // TODO: implement didChangeDependencies
//     super.didChangeDependencies();

//     if (_isInitForDidChange) {
//       final storyID = ModalRoute.of(context).settings.arguments as String;
//       if (storyID != null) {
//         _editableStory =
//             Provider.of<Stories>(context, listen: false).findById(storyID);
//         _initValues = {
//           'id': _editableStory.id,
//           'storyTitle': _editableStory.storyTitle,
//           'storySubTitle': _editableStory.storySubTitle,
//           'storyContent': _editableStory.storyContent,
//           'imageURL': '',
//           'storyTime': _editableStory.storyTime,
//           'isStar': _editableStory.isStar,
//           'isBookmarked': _editableStory.isBookmarked,
//         };
//         _imageURLController.text = _editableStory.imageURL;
//       }
//     }
//     _isInitForDidChange = false;
//   }

//   @override
//   void dispose() {
//     // TODO: implement dispose
//     super.dispose();
//     _subTitleFocus.dispose();
//     _contextFocus.dispose();
//     _imageURLController.dispose();
//     _imageURLFocus.removeListener(_updateImageURL);
//     _imageURLFocus.dispose();
//   }

//   void _updateImageURL() {
//     if (!_imageURLFocus.hasFocus) {
//       setState(() {});
//     }
//   }

//   Future<void> _saveForm() async {
//     final _isValid = _form.currentState.validate();
//     if (!_isValid) {
//       return;
//     }

//     _form.currentState.save();
//     setState(() {
//       _isLoading = true;
//     });

//     if (_editableStory.id != null) {
//       Provider.of<Stories>(context, listen: false)
//           .updateStories(_editableStory.id, _editableStory);

//       Navigator.of(context).pop();
//     } else {
//       try {
//         await Provider.of<Stories>(context, listen: false)
//             .addStories(_editableStory);


//         Provider.of<MyUserStory>(context, listen: false).addItem(
//             _editableStory.id,
//             _editableStory.storyTitle,
//             _editableStory.storySubTitle,
//             _editableStory.storyContent,
//             _editableStory.isStar,
//             _editableStory.isBookmarked,
//             _editableStory.storyTime,
//             _editableStory.imageURL);
// print(_editableStory.id);

//       } catch (error) {
//         showDialog(
//             context: context,
//             builder: (ctx) => AlertDialog(
//                   title: Text('An Error Occured'),
//                   content: Text('Something Went Wrong'),
//                   actions: <Widget>[
//                     FlatButton(
//                         onPressed: Navigator.of(context).pop, child: Text('OK'))
//                   ],
//                 ));
//       } finally {
//         setState(() {
//           _isLoading = false;
//         });
//         Navigator.of(context).pop();
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Add Your Story'),
//         actions: <Widget>[
//           IconButton(icon: Icon(Icons.save), onPressed: _saveForm)
//         ],
//       ),
//       body:
//           //_isLoading? Center(child: CircularProgressIndicator(),) :
//           _isLoading
//               ? Center(
//                   child: CircularProgressIndicator(),
//                 )
//               : Container(
//                   decoration: BoxDecoration(
//                     gradient: LinearGradient(
//                       colors: [
//                         Color.fromRGBO(215, 117, 255, 1).withOpacity(0.5),
//                         Color.fromRGBO(255, 188, 117, 1).withOpacity(0.9),
//                       ],
//                       begin: Alignment.topLeft,
//                       end: Alignment.bottomRight,
//                       stops: [0, 1],
//                     ),
//                   ),
//                   padding: const EdgeInsets.all(16.0),
//                   child: Form(
//                     key: _form,
//                     child: ListView(
//                       children: <Widget>[
//                         //for title
//                         TextFormField(
//                           initialValue: _initValues['storyTitle'],
//                           decoration: InputDecoration(
//                             labelText: 'Title',
//                             alignLabelWithHint: false,
//                             hintText: 'Please Enter Title',
//                             hintStyle: TextStyle(
//                               color: Colors.grey,
//                             ),
//                           ),
//                           textInputAction: TextInputAction.next,
//                           onFieldSubmitted: (value) {
//                             FocusScope.of(context).requestFocus(_subTitleFocus);
//                           },
//                           onSaved: (value) {
//                             _editableStory = FtStory(
//                                 id: _editableStory.id,
//                                 storyTitle: value,
//                                 storySubTitle: _editableStory.storySubTitle,
//                                 storyContent: _editableStory.storyContent,
//                                 storyTime: _editableStory.storyTime,
//                                 imageURL: _editableStory.imageURL,
//                                 isStar: _editableStory.isStar,
//                                 isBookmarked: _editableStory.isBookmarked);

//                             print(value);
//                             //  print(_editableStory.storyTime);
//                           },
//                           validator: (value) {
//                             if (value.isEmpty) {
//                               return 'Please provide Value';
//                             }
//                             return null;
//                           },
//                         ),
//                         SizedBox(
//                           height: 10,
//                           width: 10,
//                         ),

//                         //for Subtitle
//                         TextFormField(
//                             initialValue: _initValues['storySubTitle'],
//                             focusNode: _subTitleFocus,
//                             decoration: InputDecoration(
//                               labelText: 'Subtitle(optional)',
//                               hintText: 'Please Enter Subtitle',
//                               hintStyle: TextStyle(
//                                 color: Colors.grey,
//                               ),
//                             ),
//                             textInputAction: TextInputAction.next,
//                             onFieldSubmitted: (value) {
//                               FocusScope.of(context)
//                                   .requestFocus(_contextFocus);
//                             },
//                             onSaved: (value) {
//                               (value == null)
//                                   ? _editableStory = FtStory(
//                                       id: _editableStory.id,
//                                       storyTitle: _editableStory.storyTitle,
//                                       storySubTitle: '',
//                                       storyContent: _editableStory.storyContent,
//                                       storyTime: _editableStory.storyTime,
//                                       imageURL: _editableStory.imageURL,
//                                       isStar: _editableStory.isStar,
//                                       isBookmarked: _editableStory.isBookmarked)
//                                   : _editableStory = FtStory(
//                                       id: _editableStory.id,
//                                       storyTitle: _editableStory.storyTitle,
//                                       storySubTitle: value,
//                                       storyContent: _editableStory.storyContent,
//                                       storyTime: _editableStory.storyTime,
//                                       imageURL: _editableStory.imageURL,
//                                       isStar: _editableStory.isStar,
//                                       isBookmarked:
//                                           _editableStory.isBookmarked);
//                               print(value);
//                               //   print(_editableStory.storyTime);
//                             }),

//                         SizedBox(
//                           height: 10,
//                           width: 10,
//                         ),

//                         // For Content
//                         TextFormField(
//                           initialValue: _initValues['storyContent'],
//                           focusNode: _contextFocus,
//                           maxLines: 7,
//                           keyboardType: TextInputType.multiline,
//                           decoration: InputDecoration(
//                             enabledBorder: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(10),
//                               borderSide: BorderSide(color: Colors.grey),
//                             ),
//                             labelText: 'Content',
//                             alignLabelWithHint: true,
//                             hasFloatingPlaceholder: true,
//                             hintText: 'Please Enter Content',
//                             hintStyle: TextStyle(
//                               color: Colors.grey,
//                             ),
//                           ),
//                           textInputAction: TextInputAction.next,
//                           onSaved: (value) {
//                             _editableStory = FtStory(
//                                 id: _editableStory.id,
//                                 storyTitle: _editableStory.storyTitle,
//                                 storySubTitle: _editableStory.storySubTitle,
//                                 storyContent: value,
//                                 storyTime: DateTime.now().toString(),
//                                 imageURL: _editableStory.imageURL,
//                                 isStar: _editableStory.isStar,
//                                 isBookmarked: _editableStory.isBookmarked);
//                             print(value);
//                           },
//                           validator: (value) {
//                             if (value.isEmpty) {
//                               return 'Please provide Value';
//                             }
//                             return null;
//                           },
//                         ),
//                         SizedBox(
//                           height: 10,
//                           width: 10,
//                         ),

//                         //For Image URL
//                         Row(
//                           crossAxisAlignment: CrossAxisAlignment.end,
//                           children: <Widget>[
//                             Container(
//                               height: 100,
//                               width: 100,
//                               margin: EdgeInsets.only(top: 10, right: 10),
//                               color: Colors.red,
//                               child: _imageURLController.text.isEmpty
//                                   ? Container(
//                                       child: Text('Enter URL'),
//                                     )
//                                   : FittedBox(
//                                       child: Image.network(
//                                           _imageURLController.text),
//                                     ),
//                             ),
//                             Expanded(
//                               child: TextFormField(
//                                 //  initialValue: _initValues['imageURL'],
//                                 keyboardType: TextInputType.url,
//                                 decoration: InputDecoration(
//                                   labelText: 'ImageURL',
//                                   hintText: 'Please Enter Image URL',
//                                   hintStyle: TextStyle(
//                                     color: Colors.grey,
//                                   ),
//                                 ),
//                                 textInputAction: TextInputAction.done,
//                                 controller: _imageURLController,
//                                 onFieldSubmitted: (value) {
//                                   _saveForm();
//                                 },
//                                 onSaved: (value) {
//                                   _editableStory = FtStory(
//                                       id: _editableStory.id,
//                                       storyTitle: _editableStory.storyTitle,
//                                       storySubTitle:
//                                           _editableStory.storySubTitle,
//                                       storyContent: _editableStory.storyContent,
//                                       storyTime: DateTime.now().toString(),
//                                       imageURL: value,
//                                       isStar: _editableStory.isStar,
//                                       isBookmarked:
//                                           _editableStory.isBookmarked);
//                                   print(value);
//                                   // print(_editableStory.storyTime);
//                                 },
//                                 validator: (value) {
//                                   if (value.isEmpty) {
//                                     return 'Please provide Value';
//                                   }
//                                   return null;
//                                 },
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//     );
//   }
// }
