import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hotel_management_system/models/kitchen/item.dart';
import 'package:hotel_management_system/models/kitchen/menu.dart';

class VWaiterDatabase2 {

  //collection reference
  final CollectionReference menuCollection =Firestore.instance.collection('main-menu');
  final CollectionReference itemCollection =Firestore.instance.collection('items');

  // get menu list stream
  Stream<List<Menu>> get menu {
    return menuCollection.snapshots().map(menuListFromSnapshot);
  }

  //menu list from snapshot
  List<Menu> menuListFromSnapshot (QuerySnapshot snapshot) {
    return snapshot.documents.map((doc){
      // List<MenuItem> menuItems = [];

      // doc.data['menuItems'].forEach((menuItem){
      //   print(menuItem['item'].documentID);
      //   menuItems.add(
      //     MenuItem(
      //       type: menuItem['type'],
      //       itemId: menuItem['item'].documentID
      //     )
          
      //   );
      // });

      return Menu(
        category: doc.data['category'] ?? '',
        menuItems: doc.data['menuItems']  ?? ''
      );      
    }).toList();
  }

  // //get item stream
  // Stream<List<Item>> get itemList {
  //   return itemCollection.snapshots().map(itemListFromSnapshot);
  // }

  // List<Item> itemListFromSnapshot(QuerySnapshot snapshot){
  //   return snapshot.documents.map((snap){
  //     return Item(
  //       itemId: snap.documentID,
  //       available: snap.data['available'] ?? '',
  //       name: snap.data['name'] ?? '',
  //       description: snap.data['description'] ?? '',
  //       persons: snap.data['persons'] ?? '',
  //       price: snap.data['price'] ?? ''
  //     );
  //   }).toList();
  // }


  Stream<List<Item>> asStream(Menu menu) => new Stream.fromFuture(itemListFromMenu(menu));

  //get items list
  Future<List<Item>> itemListFromMenu(Menu menu) async{
    List<Item> items = [];

    for (var menuItem in menu.menuItems) {
      // DocumentReference itemRef = menuItem['item'];
      print(menuItem['item'].documentID);
      var document = menuItem['item'];
      // var document = itemCollection.document(menuItem['item'].documentID);
      
      print(menu.category);
      // print (itemRef);
      // var type = menuItem['type'];

      var snap = await document.get();
      print(snap.data['name']);
      
      if(snap.exists && snap.data['available']){
        items.add(Item(
        available: snap.data['available'] ?? '',
        name: snap.data['name'] ?? '',
        description: snap.data['description'] ?? '',
        persons: snap.data['persons'] ?? '',
        price: snap.data['price'] ?? ''
        ));
      }else{
        print("No data");
      }
    }

    return items;
  }

//---------------------------------------

// Stream getItems(Menu menu) async*
// {
//   menu.menuItems.forEach((menuItem) async* {
//      yield* itemCollection
//       .document(menuItem['item'].documentID)
//       .snapshots()
//       .map(_getItem);
//   });

// }

// Item _getItem(DocumentSnapshot snap){
//   Item item;
//   if(snap.data['available']){
//   item = Item(
//         available: snap.data['available'] ?? '',
//         name: snap.data['name'] ?? '',
//         description: snap.data['description'] ?? '',
//         persons: snap.data['persons'] ?? '',
//         price: snap.data['price'] ?? ''
//         );
//   }
//   return item;
// }



}