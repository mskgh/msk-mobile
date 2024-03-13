import 'package:flutter/foundation.dart';

import 'CardModels.dart';


class OrganizationDataProvider extends ChangeNotifier {
  // saving created organization 
  final List<OrganizationCard> _cards = [];

  // saving pending deletion
  final List<OrganizationCard> _pendingDeletion = [];


  // saving deleted organization
  final List<OrganizationCard> _deletedCards = [];
  

  final List<OrganizationCard> _permenentDeletedCards = [];

// getters
  List<OrganizationCard> get cards => _cards;
  List<OrganizationCard> get pendingDeletion => _pendingDeletion;
  List<OrganizationCard> get deletedCards => _deletedCards;
  List<OrganizationCard> get permenentDeletedCards => _permenentDeletedCards;


  /// adding new card
  void addCard(OrganizationCard card) {
    _cards.add(card);
    notifyListeners();
  }

  /// deleting new card
  void removeCard(OrganizationCard card) {
    _cards.remove(card);
    _deletedCards.add(card); // Store the deleted card
    notifyListeners();
  }


  /// deleting Deleted organization new card
  void penddingDeletion(OrganizationCard card) {
    _deletedCards.remove(card);
    _pendingDeletion.add(card); // Store the deleted card
    notifyListeners();
  }

  /// pendding deleting new card
  void deletedOrgainization(OrganizationCard card) {
    _pendingDeletion.remove(card);
    //permenentDeletedCards.add(card); // Store the deleted card
    notifyListeners();
  }


  /// restoring deleted cars
  void restoreCard(OrganizationCard card) {
  _deletedCards.remove(card);
  _cards.add(card); // Restore the card
  notifyListeners();
}


// Update an existing organization card
 void updateCard(OrganizationCard updatedCard) {
  final index = _cards.indexWhere((card) => card.id == updatedCard.id);    
  if (index != -1) {
    _cards[index] = updatedCard;
    notifyListeners();
  }
}

}




//Busness arena
class BusinessDataProvider extends ChangeNotifier {
  final List<BusinessCard> _businessCards = [];
  final List<BusinessCard> _pendingDeletion = [];
  final List<BusinessCard> _deletion = [];

  List<BusinessCard> get bCards => _businessCards;
  List<BusinessCard> get pendingBusinessDeletion => _pendingDeletion;
  List<BusinessCard> get businessDeletion => _deletion;

  /// Add a new business card.
  void addBusiness(BusinessCard business) {
    _businessCards.add(business);
    notifyListeners();
  }

  /// Delete a business card.
  void removeCard(BusinessCard busCard) {
    _businessCards.remove(busCard);
    _deletion.add(busCard); // Move to pending deletion.
    notifyListeners();
  }

  /// Move a business card from pending deletion to deletion.
  void movePendingToDeletion(BusinessCard busCard) {
    _deletion.remove(busCard);
    _pendingDeletion.add(busCard);
    notifyListeners();
  }

   /// pendding deleting new card
  void deletedBusiness(BusinessCard busCard) {
    _pendingDeletion.remove(busCard);
    //permenentDeletedCards.add(card); // Store the deleted card
    notifyListeners();
  }


  /// Restore a deleted business card.
  void restoreBusinessCard(BusinessCard busCard) {
    _deletion.remove(busCard);
    _businessCards.add(busCard); // Restore the card
    notifyListeners();
  }

  // Update an existing organization card
 void updateCard(BusinessCard updatedCard) {
  final index = _businessCards.indexWhere((bCard) => bCard.id == updatedCard.id);    
  if (index != -1) {
    _businessCards[index] = updatedCard;
    notifyListeners();
  }
}
}




// for warehouse
class WarehouseDataProvider extends ChangeNotifier {
  final List<WarehouseCard> _warehouseCards = [];
  final List<WarehouseCard> _warehousePendingDeletion = [];
  final List<WarehouseCard> _warehouseDeletion = [];

  List<WarehouseCard> get wCards => _warehouseCards;
  List<WarehouseCard> get pendingBusinessDeletion => _warehousePendingDeletion;
  List<WarehouseCard> get businessDeletion => _warehouseDeletion;

  /// Add a new business card.
  void addWareHouse(WarehouseCard warehouseCard) {
    _warehouseCards.add(warehouseCard);
    notifyListeners();
  }

  /// Delete a business card.
  void removeWareHouse(WarehouseCard warehouseCard) {
    _warehousePendingDeletion.remove(warehouseCard);
    _warehouseDeletion.add(warehouseCard); // Move to pending deletion.
    notifyListeners();
  }

  /// Move a business card from pending deletion to deletion.
  void moveWareHousePendingToDeletion(WarehouseCard warehouseCard) {
    _warehouseDeletion.remove(warehouseCard);
    _warehousePendingDeletion.add(warehouseCard);
    notifyListeners();
  }

   /// pendding deleting new card
  void deletedBusiness(WarehouseCard warehouseCard) {
    _warehousePendingDeletion.remove(warehouseCard);
    //permenentDeletedCards.add(card); // Store the deleted card
    notifyListeners();
  }


  /// Restore a deleted business card.
  void restoreBusinessCard(WarehouseCard warehouseCard) {
    _warehouseDeletion.remove(warehouseCard);
    _warehouseCards.add(warehouseCard); // Restore the card
    notifyListeners();
  }
}



// for shops
class ShopsDataProvider extends ChangeNotifier {
  final List<ShopsCard> _shopsCards = [];
  final List<ShopsCard> _shopsPendingDeletion = [];
  final List<ShopsCard> _shopsDeletion = [];

  List<ShopsCard> get wCards => _shopsCards;
  List<ShopsCard> get pendingBusinessDeletion => _shopsPendingDeletion;
  List<ShopsCard> get businessDeletion => _shopsDeletion;

  /// Add a new business card.
  void addShops(ShopsCard shopsCard) {
    _shopsCards.add(shopsCard);
    notifyListeners();
  }

  /// Delete a business card.
  void removeShops(ShopsCard shopsCard) {
    _shopsPendingDeletion.remove(shopsCard);
    _shopsDeletion.add(shopsCard); // Move to pending deletion.
    notifyListeners();
  }

  /// Move a business card from pending deletion to deletion.
  void moveShopsPendingToDeletion(ShopsCard shopsCard) {
    _shopsDeletion.remove(shopsCard);
    _shopsPendingDeletion.add(shopsCard);
    notifyListeners();
  }

   /// pendding deleting new card
  void deletedShops(ShopsCard shopsCard) {
    _shopsPendingDeletion.remove(shopsCard);
    //permenentDeletedCards.add(card); // Store the deleted card
    notifyListeners();
  }


  /// Restore a deleted business card.
  void restoreShopsCard(ShopsCard shopsCard) {
    _shopsDeletion.remove(shopsCard);
    _shopsCards.add(shopsCard); // Restore the card
    notifyListeners();
  }
}

