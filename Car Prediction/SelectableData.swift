//
//  SelctableData.swift
//  Car Prediction
//
//  Created by Yusuf Özgül on 2.12.2019.
//  Copyright © 2019 Yusuf Özgül. All rights reserved.
//

import Foundation

struct SelectableData
{
    let color = ["Mavi", "Beyaz", "Siyah", "Kırmızı", "Gri", "Füme", "Lacivert", "Turuncu", "Gümüş Gri", "Yeşil", "Bej", "Kahverengi", "Turkuaz", "Bordo", "Sarı", "Şampanya", "Mor", "Pembe"]
    let gear = ["Otomatik", "Yarı Otomatik", "Manuel"]
    let fuel = ["Dizel", "Benzin", "Benzin & LPG", "Hybrid", "Elektrik"]
    let type = ["Hatchback 5 kapı", "Hatchback 3 kapı", "Coupe", "Cabrio", "MPV", "Sedan", "Station Wagon", "Roadster", "Crossover"]
    let traction = ["Arkadan İtiş", "Önden Çekiş", "4WD (Sürekli)", "AWD (Elektronik)"]
    let company = ["BMW", "Alfa Romeo", "Aston Martin", "Bentley", "Cadillac",
                   "Chrysler", "Daihatsu", "Dodge", "DS Automobiles", "Jaguar",
                   "Lada", "Lamborghini", "Mazda", "Mini", "Mitsubishi", "Porsche",
                   "Subaru", "Suzuki", "Tata", "Tesla", "Audi", "Chevrolet",
                   "Citroën", "Dacia", "Fiat", "Ford", "Honda", "Kia",
                   "Mercedes - Benz", "Nissan", "Seat", "Skoda", "Volvo", "Opel",
                   "Volkswagen", "Renault", "Peugeot", "Toyota", "Tofaş"]
    let model = [["1 Serisi", "2 Serisi", "3 Serisi", "4 Serisi", "6 Serisi", "7 Serisi", "8 Serisi", "i Serisi", "M Serisi", "Z Serisi", "5 Serisi"],
                 ["Giulietta", "GT", "147", "146", "156", "159", "166", "145", "Spider", "MiTo", "164", "Brera", "GTV", "33", "155", "75"],
                 ["DB9", "Vantage", "DBS", "Rapide", "Cygnet", "DB11", "Vanquish", "Virage", "DB7"],
                 ["Continental", "Flying Spur", "Mulsanne", "Brooklands"],
                 ["CTS", "Eldorado", "STS", "Seville", "Fleetwood", "DeVille", "BLS", "CT6"],
                 ["300 C", "Sebring", "PT Cruiser", "Concorde", "Stratus", "300 M", "Neon", "Le Baron", "LHS", "Crossfire"],
                 ["Sirion", "Cuore", "Materia", "Applause", "Copen", "YRV", "Move", "Charade"],
                 ["Challenger", "Avenger", "Neon", "Viper", "Charger"],
                 ["DS 4", "DS 5", "DS 3"],
                 ["X-Type", "XJ", "XKR", "XE", "S-Type", "XF", "XJR", "Daimler", "F-Type", "XK8", "Sovereign", "XJS"],
                 ["Samara", "Vega", "Kalina", "VAZ", "Tavria"],
                 ["Gallardo", "Huracan", "Aventador", "Diablo"],
                 ["6", "323", "3", "Lantis", "626", "2", "MX", "5", "RX", "121", "Xedos", "929", "MPV", "Premacy"],
                 ["Cooper", "John Cooper", "Cooper S", "One", "Cooper Clubman"],
                 ["Lancer", "Colt", "Carisma", "Space Star", "Galant", "Lancer Evolution", "Attrage", "Grandis", "Eclipse", "Space Wagon", "3000GT"],
                 ["Boxster", "911", "Panamera", "Cayman", "718", "944", "928", "Taycan", "924"],
                 ["Legacy", "Impreza", "BRZ", "Vivio", "Justy", "Levorg"],
                 ["Alto", "Swift", "SX4", "Maruti", "Baleno", "Liana", "S-Cross", "Splash"],
                 ["Marina", "Indigo", "Indica", "Vista", "Manza"],
                 ["Model S", "Model X"],
                 ["A1", "A5", "A7", "A8", "A3", "A4", "A6"],
                 ["Kalos", "Lacetti", "Cruze", "Aveo"],
                 ["Xsara", "Saxo", "C5", "C4 Picasso", "C4", "C3", "C-Elysée"],
                 ["Lodgy", "Logan", "Sandero"],
                 ["500 Ailesi", "Albea", "Brava", "Bravo", "Marea", "Palio", "Punto", "Siena", "Tempra", "Tipo", "Uno", "Egea", "Linea"],
                 ["C-Max", "Escort", "Fusion", "Ka", "Mondeo", "Taunus", "Fiesta", "Focus"],
                 ["Accord", "City", "Jazz", "Civic"],
                 ["Ceed", "Cerato", "Picanto", "Rio"],
                 ["A Serisi", "B Serisi", "CLA", "CLK", "CLS", "SL", "S Serisi", "200", "230", "300", "C Serisi", "E Serisi"],
                 ["Almera", "Micra", "Note", "Primera"],
                 ["Cordoba", "Ibiza", "Leon", "Toledo"],
                 ["Fabia", "Favorit", "Felicia", "Forman", "Octavia", "Rapid", "Superb"],
                 ["S40", "S60", "S80", "V40"],
                 ["Astra", "Corsa", "Insignia", "Vectra"],
                 ["Arteon", "Bora", "Beetle", "Passat Variant", "Scirocco", "VW CC", "Golf", "Jetta", "Passat", "Polo"],
                 ["Laguna", "Symbol", "Scenic", "Clio", "Megane"],
                 ["106", "206", "206 +", "207", "208", "301", "306", "307", "308", "407", "508"],
                 ["Auris", "Avensis", "Yaris", "Corolla"],
                 ["Doğan", "Kartal", "Murat", "Serçe", "Şahin"]]
}

struct CarData
{
    var color: String?
    var gear: String?
    var fuel: String?
    var type: String?
    var traction: String?
    var company: String?
    var model: String?
    var sumKM: String?
    var year: String?
    var horsePower: String?
}
