import Foundation

enum UsernameError: Error {
    case tooShort
    case tooLong
    case invalidCharacter(character: Character)
}

// Throwing init() function
struct User {
    let name: String

    init(name: String) throws {
        guard name.count >= 5 else {
            throw UsernameError.tooShort
        }

        guard name.count <= 12 else {
            throw UsernameError.tooLong
        }

        for char in name {
            guard char.isLetter else {
                throw UsernameError.invalidCharacter(character: char)
            }
        }

        self.name = name
    }
}


func createUser(name: String) -> User? {
    do {
        let user = try User(name: name)
        print("Created user with name: \(user.name)")
        return user
    } catch UsernameError.tooShort {
        print("Error: Username is too short!")
    } catch UsernameError.tooLong {
        print("Error: Username is too long!")
    } catch UsernameError.invalidCharacter(let character) {
        print("Error: Please remove invalid character \(character) from username")
    } catch {
        print("Error creating user: \(error)")
    }
    return nil
}

createUser(name: "abc") // Error: Username is too short!
createUser(name: "dwightschrute") // Error: Username is too long!
createUser(name: "pam-beasley") // Error: Please remove invalid character - from username
createUser(name: "jimhalpert") // Created user with name: jimhalpert


func createUser1(name: String) throws -> User? {
    do {
        let user = try User(name: name)
        return user
    } catch UsernameError.tooShort, UsernameError.tooLong {
        print("Error: username length is either too short or too long!")
    } catch UsernameError.invalidCharacter(let character) where character.isNumber {
        print("Error: username cannot contain a number!")
    } catch is UsernameError {
        print("Error: Couldn't create username!")
    }
    return nil
}

do {
    try createUser1(name: "janice")
} catch {
    print("Unexpected non-user-name-related error occurred: \(error)")
}


// try?
enum MathError: Error {
    case divisionByZero
}

func divide(dividend: Int, divisor: Int) throws -> Int {
    guard divisor != 0 else {
        throw MathError.divisionByZero
    }
    return dividend / divisor
}

let result1 = try? divide(dividend: 6, divisor: 3)
print(result1) // Optional(2)

let result2 = try? divide(dividend: 8, divisor: 0)
print(result2) // nil

if let result = try? divide(dividend: 6, divisor: 3) {
    print(result)
} else {
    print("Division Error!")
}
// Prints: 2

if let result = try? divide(dividend: 8, divisor: 0) {
    print(result)
} else {
    print("Division Error!")
}
// Prints: Division Error!



// try!
let result = try! divide(dividend: 16, divisor: 4)
print(result) // 4



// try, try?, try!
do {
    let fileContents = try String(contentsOfFile: "input.txt")
    print(fileContents)
} catch {
    print(error.localizedDescription) // The file “input.txt” couldn’t be opened because there is no such file.
}

if let fileContents = try? String(contentsOfFile: "input.txt") {
    print(fileContents)
} else {
    print("Unable to read file")
}

//let fileContents = try! String(contentsOfFile: "input.txt") // Fatal error: 'try!' expression unexpectedly raised an error
//print(fileContents)






