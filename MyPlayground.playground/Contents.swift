//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

struct character {
    
    var nom:String
    var prenom:String
    var age:Int
}

let newMember = character(nom: "POINOT", prenom: "Paul-Aurian", age: 20)

func presentation ()
{
    print("Bonjour !\nJe m'appelle \(newMember.nom) \(newMember.prenom) et j'ai \(newMember.age) ans !")
}

presentation()