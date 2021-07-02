import Foundation

//MARK: Şişe vurma oyununu kodlayınız.

// player
struct Player {
    var nickname: String = "" // player nickname
    var score: Int = 0 // player score
    var playCount: Int = 0 // play count
    
    //
    mutating func throwBall(thrower: BallThrower, bottle: Bottle) {
        let effectInfo = bottle.effectiveRange()
        var range: Double = 0
        let effectRange: String = String(effectInfo.0) + " - " + String(effectInfo.1)
        
        print("Do you want to throw the ball to the bottle at the range \(effectRange) (Y/N) ?")
        let answer: String? = readLine()
        
        if answer == "Y" {
            range = thrower.throwBall()
        }
        if answer == "N" {
            let newBottle: Bottle = Bottle()
            throwBall(thrower: thrower, bottle: newBottle)
        }
            
        if range >= effectInfo.0 && range <= effectInfo.1 {
            score += 1
        }
        
        playCount -= 1
    }
    
    mutating func play(thrower: BallThrower, bottle: Bottle) {
        for _ in 0...playCount {
            self.throwBall(thrower: thrower , bottle: bottle)
        }
    }
    
    func reportScore(){
        print("\(nickname)'s score: \(score)")
    }
}

// ball thrower
struct BallThrower {
    var teta: Double = Double.random(in: 0...90) // 0 <= teta <= 90 degrees
    var V: Double = Double.random(in: 0...100) // 0 <= V <= 100 m/s
        
    func throwBall() -> Double {
        // range = V * V * sin(2 * teta) / g
        // g = 10
        let R = V * V * sin(2 * teta) / 10
        return R
    }
}

struct Bottle {
    var d = Double.random(in: 0...1500) // 0 <= d <= 1500 m bottle's center
    var delta = Double.random(in: 0.1...1) // 0.1 <= delta <= 1 m bottle's width
        
    func effectiveRange() -> (Double, Double) {
        return (d-delta , d+delta)
    }
}


class BottleShootGame {
    var player: Player = Player()
    var ballThrower: BallThrower = BallThrower()
    var bottle: Bottle = Bottle()
    
    init() {
        enterNickname()
        enterPlayCount()
        player.play(thrower: ballThrower, bottle: bottle)
        player.reportScore()
    }
    
    func enterNickname() {
        print("Please enter nickname: ")
        let nickname: String = readLine() ?? ""
        
        if nickname.isEmpty {
            enterNickname()
        } else {
            self.player.nickname = nickname
        }
    }
    
    func enterPlayCount() {
        print("Please enter play count: ")

        if let readValue = readLine() {
            let playCount: Int = Int(readValue) ?? 0
            if playCount > 0 {
                self.player.playCount = playCount
            } else {
                enterPlayCount()
            }
        } else {
            enterPlayCount()
        }
    }
}

var game = BottleShootGame()


