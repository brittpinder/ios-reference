//
//  ViewController.swift
//  UserDefaultsDemo
//
//  Created by Brittany Pinder on 2023-06-21.
//

import UIKit

struct Keys {
    static let age = "Age"
}

class ViewController: UIViewController {

    let defaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func saveData() {
        defaults.set(25, forKey: "Age")
        defaults.set("Emily", forKey: "Name")
        defaults.set(true, forKey: "DarkMode")
        defaults.set(Date(), forKey: "LastRun")

        let genres = ["Mystery", "Historical Fiction", "Sci-Fi"]
        defaults.set(genres, forKey: "Genres")

        let ratings = ["Harry Potter": 5, "The Great Gatsby": 3]
        defaults.set(ratings, forKey: "Ratings")
    }

    func readData() {
        let age = defaults.integer(forKey: "Age")
        print(age)

        let name = defaults.string(forKey: "Name") ?? ""
        print(name)

        let darkMode = defaults.bool(forKey: "DarkMode")
        print(darkMode)

        let lastRun = defaults.object(forKey: "LastRun") as? Date ?? Date()
        print(lastRun)

        let genres = defaults.array(forKey: "Genres") as? [String] ?? [String]()
        print(genres)

        let ratings = defaults.dictionary(forKey: "Ratings") as? [String:Int] ?? [String:Int]()
        print(ratings)
    }

    func resetUserDefaults() {
        if let bundleID = Bundle.main.bundleIdentifier {
            defaults.removePersistentDomain(forName: bundleID)
        }
    }

    func removeAge() {
        defaults.removeObject(forKey: "Age")
    }

    func incorrectKeys() {
        let wrongAge = defaults.integer(forKey: "age")
        print(wrongAge)

        defaults.set(25, forKey: Keys.age)

        let correctAge = defaults.integer(forKey: Keys.age)
        print(correctAge) // 25
    }

}

