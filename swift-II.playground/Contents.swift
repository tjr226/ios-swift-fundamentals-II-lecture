// ENUMS

enum RoastLevel: String {
    // enums are immutable
        case light = "Soft"
        case medium = "Medium"
        case dark = "Hard"
    
//    can also write like this
//    case light, medium, dark
}


let myRoastLevel = RoastLevel.dark
let myRoastLevel2: RoastLevel = .dark

//print(myRoastLevel.rawValue)
// prints out the string "Hard"
//print(myRoastLevel)
// prints out the string "dark"


// STRUCTS

struct Coffee {
    let name: String
    let region: String
    let roastLevel: RoastLevel
}

let bensCoffee = Coffee(name: "8 oz Americano", region: "Guatemala", roastLevel: .light)
let eugenesCoffee = Coffee(name: "Dark roast", region: "Columbia", roastLevel: .medium )

//print(bensCoffee)
//print(bensCoffee.name, bensCoffee.region)
//print(eugenesCoffee)

let coffee = Coffee(name: "Some coffee", region: "Ecuador", roastLevel: .dark)

// CLASSES
// note - classes don't give you the initializer for free
// you can write  `let var = Struct(var: "String")` without setting up that function on your own

class CoffeeShop {
    let name: String
    let address: String
    var menu: [Coffee]
    
    // initializer - way to take in external values and giving them to the class properties
    // initializers are functions
    init(name: String, address: String, menu: [Coffee]) {
        self.name = name
        self.address = address
        self.menu = menu
    }
    
    func orderMoreCoffee() {
        for coffee in self.menu {
            print("We need to order more \(coffee.name)")
        }
    }
}

let myCoffeeShop = CoffeeShop(name: "Tim's Coffee House", address: "123 Espresso Blvd", menu: [bensCoffee, eugenesCoffee, coffee])

//print(myCoffeeShop)
//print(myCoffeeShop.name)

//myCoffeeShop.orderMoreCoffee()

// Optionals - ability to give something a lack of a value, represented by nil

var firstName = "Spencer"
var middleInitial: String? = nil

var myNumber: Int? = 10
var crashMyAppNumber: Int? = nil

func triple(number: Int) -> Int {
    return number * 3
}

// If-Let statements - Optional binding
// "bind" or assign the non-nil value of the optional to a new constant, if it exists

if let unwrappedNumber = myNumber {
//    next line doesn't work, have to use the unwrappedNumber not myNumber
//    let tripleNumber = triple(number: myNumber)
    let tripleNumber = triple(number: unwrappedNumber)
    print(tripleNumber)
}

if let unwrappedNumber = crashMyAppNumber {
//    this code doesn't run
    let tripleNumber = triple(number: unwrappedNumber)
    print(tripleNumber)
}


// Forced Unwrapping
// "I am 110% sure that this optional isn't nil"
// If it is nil, your app will crash. NEVER use Forced Unwrapping

//print(triple(number: myNumber!))
//print(triple(number: crashMyAppNumber!))


struct Person {
    let name: String
    let favoriteFood: String?
}

let me = Person(name: "Tim", favoriteFood: "KBBQ")
let other = Person(name: "Unknown", favoriteFood: nil)

print(me)
print(other)

if let myFavoriteFood = me.favoriteFood {
    print(myFavoriteFood)
    // prints "KBBQ"
}

if let theirFavoriteFood = other.favoriteFood {
    print(theirFavoriteFood)
    // doesn't print anything
}
