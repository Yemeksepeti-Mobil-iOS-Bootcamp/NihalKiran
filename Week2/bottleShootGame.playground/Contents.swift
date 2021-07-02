import UIKit

//MARK: Şişe vurma oyununu kodlayınız.

// range = V * V * sin(2 * teta) / 10

class Game {
    
    // player
    extension  {
        var nickname: T
        var score: U = 0
    }
    
    
    // ball thrower
    extension Int {
        var teta: Int // 0 <= teta <= 90 degrees
        var V: Int // 0 <= V <= 100 m/s
        // range = V * V * sin(2 * teta) / 10
    }
    
    
    var teta: Int // 0 <= teta <= 90 degrees
    var V: Int // 0 <= V <= 100 m/s
    // range = V * V * sin(2 * teta) / 10
    
    // bottle
    extension <T> {
        var locationBottle: Int // 0 <= locationBottle <= 1500 m
        var positionBottle: Bool //
    }
    
    
    
    func enterPlayerName(playerName: String) {
        
    }
    
    func enterBottleLocation(teta: Int) {
        
    }
    
    init(playerName: String, playerScore: Int, teta: Int, V: Int, locationBottle: Int) {
        self.nickname = playerName
        self.score = playerScore
        self.teta = teta
        self.V = V
        self.location = locationBottle
        
}









 

