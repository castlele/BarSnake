import SwiftUI

// MARK: - GameViewModel

final class GameViewModel: ObservableObject {

    private var preferences = PreferencesViewModel.shared

    private var initialPoint: CGPoint {
        CGPoint(x: preferences.gridCenter + Constants.corrective,
                y: preferences.gridCenter + Constants.corrective)
    }

    private let minX: CGFloat = .zero
    private let minY: CGFloat = .zero
    private var maxX: CGFloat {
        preferences.fieldSize
    }
    private var maxY: CGFloat {
        preferences.fieldSize
    }

    var timer = Timer.publish(every: Constants.rate, on: .main, in: .common).autoconnect()

    @Published var score: Int = .zero {
        didSet {
            guard score > 0 else { return }

            if score.isMultiple(of: 10) {
                rate -= Constants.rateDescrease
                timer = Timer.publish(every: rate, on: .main, in: .common).autoconnect()
            }
        }
    }
    @Published var rate = Constants.rate
    @Published var foodPosition: CGPoint = .zero
    @Published var moveDirection: MoveCommandDirection = .down
    @Published var bodyParts: [CGPoint] = []
    @Published var isGameStarted = false
    @Published var isGamePaused = false
    @Published var isGameOver = false

    // MARK: - Public methods

    func changeDirection() {
        var prev = bodyParts[0]

        // trailing side
        if prev.x > maxX {
            bodyParts[0].x = minX + Constants.corrective

        // leading side
        } else if prev.x < minX {
            bodyParts[0].x = maxX - Constants.corrective

        // bottom side
        } else if prev.y > maxY {
            bodyParts[0].y = minY + Constants.corrective

        // top side
        } else if prev.y < minY {
            bodyParts[0].y = maxY - Constants.corrective

        } else {
            switch moveDirection {
            case .up:
                bodyParts[0].y -= Constants.cellSize

            case .down:
                bodyParts[0].y += Constants.cellSize

            case .left:
                bodyParts[0].x -= Constants.cellSize

            case .right:
                bodyParts[0].x += Constants.cellSize

            @unknown default:
                break
            }
        }

        for index in 1 ..< bodyParts.count {
            let current = bodyParts[index]
            bodyParts[index] = prev
            prev = current
        }
    }

    func eatFoodIfNeeded() {
        let head = CGPoint(x: Int(bodyParts[0].x), y: Int(bodyParts[0].y))

        if head == foodPosition {
            score += 1
            bodyParts.append(bodyParts[0])
            createFoodPosition()
        }
    }

    func setGameOverIfNeeded() {
        guard bodyParts.count > 3 else { return }

        let head = bodyParts[0]

        for index in 1 ..< bodyParts.count {
            if bodyParts[index] == head {
                isGameOver = true
                return
            }
        }
    }

    // MARK: - Private methods

    private func createFoodPosition() {
        let xMultiplier = Int.random(in: Int(Constants.cellSize) ..< Int(maxX - Constants.cellSize))
        let yMultiplier = Int.random(in: Int(Constants.cellSize) ..< Int(maxY - Constants.cellSize))

        let randomX = findClosestNumber(to: xMultiplier, devidableBy: Int(Constants.cellSize)) + Int(Constants.corrective)
        let randomY = findClosestNumber(to: yMultiplier, devidableBy: Int(Constants.cellSize)) + Int(Constants.corrective)

        foodPosition = .init(x: randomX, y: randomY)
    }

    private func findClosestNumber(to num: Int, devidableBy divider: Int) -> Int {
        let quotient = num / divider
        let possibleFirst = divider * quotient
        let possibleSecont = num * divider > 0
        ? divider * (quotient + 1)
        : divider * (quotient - 1)

        if abs(num - possibleFirst) < abs(num - possibleSecont) {
            return possibleFirst
        }

        return possibleSecont
    }
}

// MARK: - GameViewModel + GameViewModelProtocol

extension GameViewModel: GameViewModelProtocol {
    func startGame() {
        restartGame()

        isGameStarted = true
    }

    func pauseGame() {
        isGamePaused.toggle()
    }

    func restartGame() {
        bodyParts.removeAll()
        bodyParts.append(initialPoint)
        isGameOver = false
        isGamePaused = false
        score = .zero

        createFoodPosition()
    }

    func backToMenu() {
        isGameStarted = false
        isGamePaused = false
        isGameOver = false
    }

    func resumeGame() {
        isGamePaused = false
        isGameOver = false
    }
}
