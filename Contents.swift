import Cocoa

//MARK: protocol
protocol Discountable {
  func applyDiscount(_ percentage: Double) -> Double
}

// MARK: Class
class Product: Discountable {
  var name: String
  var category: String
  var price: Double
  var quantity: Int
  
  init(name: String, category: String, price: Double, quantity: Int) {
    self.name = name
    self.category = category
    self.price = price
    self.quantity = quantity
  }
  
  //  MARK: Method Get Product Info
  func productInfo(){}
  
  //  MARK: Calling applyDiscount function from Discountable
  func applyDiscount(_ percentage: Double) -> Double {
    return 0.0
    
  }
}

// MARK: Class Inheritance & Polymorphism
class PerishableProduct: Product {
  var expirationDate: Date
  
  init(expirationDate: Date, name: String, category: String, price: Double, quantity: Int) {
    self.expirationDate = expirationDate
    super.init(name: name, category: category, price: price, quantity: quantity)
  }
  
  override func productInfo() {
    print("product info function")
  }
  
  //  MARK: Calling applyDiscount function from Discountable
  override func applyDiscount(_ percentage: Double) -> Double {
    return 0.0
  }
}

//  MARK: Extension
extension String {
  func isValidCategory() -> Bool {
    let validCategories = ["Electronics", "Groceries", "Clothing"]
    return validCategories.contains(self)
  }
}

// MARK: Enum with the type os Error
enum InventoryError: Error {
  case outOfStock
  case invalidCategory
  case expiredProduct
}

class InvetoryManager {
  
  func sellProduct(_ product: Product, quantity: Int) throws {
    // nge-check kalo prodcut nya outofstock
    guard product.quantity >= quantity else {
      throw InventoryError.outOfStock
    }
    //  nge-check kalo product nya valid
    guard product.category.isValidCategory() else {
      throw InventoryError.invalidCategory
    }
    
    //  nge-check kalo product sudah/belum expired
    if let perishableProduct = product as? PerishableProduct {
      let currentDate = Date()
      guard perishableProduct.expirationDate > currentDate else {
        throw InventoryError.expiredProduct
      }
    }
  }
}

//  MARK: Generic

class Box<T>{
  var item: T
  
  init(item: T) {
    self.item = item
  }
  
  func addItem(_ newItem: T) {
    self.item = newItem
  }
  
  func getItem() -> T {
    return item
  }
}

