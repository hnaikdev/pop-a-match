//
//  Category.swift
//  Pop-A-Match
//
//  Created by Hiral Naik on 1/12/26.
//

enum Symbol: String, CaseIterable, Identifiable {
    case rewards = "Rewards & Success"
    case animals = "Animals & Nature"
    case faces = "Faces & Emotions"
    case shapes = "Shapes & Play"
    case toys = "Toys & Fun"
    case learning = "Learning & Brain"
    case controls = "Game Controls"
    case grids = "Grid & Matching UI"
    
    var id: String {
        rawValue
    }
    
    var icon: String {
        switch self {
        case .rewards: return "star.fill"
        case .animals: return "hare.fill"
        case .faces: return "face.smiling.fill"
        case .shapes: return "diamond.fill"
        case .toys: return "gamecontroller.fill"
        case .learning: return "brain.head.profile"
        case .controls: return "play.fill"
        case .grids: return "square.grid.3x3.fill"
        }
    }
    
    var symbols: [String] {
        switch self {
        case .rewards:
            return RewardSymbol.allCases.map(\.rawValue)
        case .animals:
            return AnimalSymbol.allCases.map(\.rawValue)
        case .faces:
            return FaceSymbol.allCases.map(\.rawValue)
        case .shapes:
            return ShapeSymbol.allCases.map(\.rawValue)
        case .toys:
            return ToySymbol.allCases.map(\.rawValue)
        case .learning:
            return LearningSymbol.allCases.map(\.rawValue)
        case .controls:
            return GameControlSymbol.allCases.map(\.rawValue)
        case .grids:
            return GridSymbol.allCases.map(\.rawValue)
        }
    }
    
    // MARK: - Rewards & Success
    enum RewardSymbol: String, CaseIterable {
        case star = "star"
        case starFill = "star.fill"
        case starCircle = "star.circle"
        case starCircleFill = "star.circle.fill"
        case trophy = "trophy"
        case trophyFill = "trophy.fill"
        case crown = "crown"
        case crownFill = "crown.fill"
        case medal = "medal"
        case medalFill = "medal.fill"
    }

    // MARK: - Animals & Nature
    enum AnimalSymbol: String, CaseIterable {
        case pawprint = "pawprint"
        case pawprintFill = "pawprint.fill"
        case ladybug = "ladybug"
        case ladybugFill = "ladybug.fill"
        case tortoise = "tortoise"
        case tortoiseFill = "tortoise.fill"
        case hare = "hare"
        case hareFill = "hare.fill"
        case leaf = "leaf"
        case leafFill = "leaf.fill"
    }

    // MARK: - Faces & Emotions
    enum FaceSymbol: String, CaseIterable {
        case smiling = "face.smiling"
        case smilingFill = "face.smiling.fill"
        case eyes = "eyes"
        case eye = "eye"
        case heart = "heart"
        case heartFill = "heart.fill"
        case thumbsUp = "hand.thumbsup"
        case thumbsUpFill = "hand.thumbsup.fill"
        case wave = "hand.wave"
        case waveFill = "hand.wave.fill"
    }

    // MARK: - Shapes & Play
    enum ShapeSymbol: String, CaseIterable {
        case circle = "circle"
        case circleFill = "circle.fill"
        case square = "square"
        case squareFill = "square.fill"
        case triangle = "triangle"
        case triangleFill = "triangle.fill"
        case diamond = "diamond"
        case diamondFill = "diamond.fill"
        case scribble = "scribble"
        case paintbrush = "paintbrush"
    }

    // MARK: - Toys & Fun
    enum ToySymbol: String, CaseIterable {
        case balloon = "balloon"
        case balloonFill = "balloon.fill"
        case gift = "gift"
        case giftFill = "gift.fill"
        case puzzlePiece = "puzzlepiece"
        case puzzlePieceFill = "puzzlepiece.fill"
        case gameController = "gamecontroller"
        case gameControllerFill = "gamecontroller.fill"
        case partyPopper = "party.popper"
        case sparkles = "sparkles"
    }

    // MARK: - Learning & Brain
    enum LearningSymbol: String, CaseIterable {
        case book = "book"
        case bookFill = "book.fill"
        case bookClosed = "book.closed"
        case bookClosedFill = "book.closed.fill"
        case graduationCap = "graduationcap"
        case graduationCapFill = "graduationcap.fill"
        case brain = "brain"
        case brainFill = "brain.fill"
        case lightbulb = "lightbulb"
        case lightbulbFill = "lightbulb.fill"
    }

    // MARK: - Game Controls
    enum GameControlSymbol: String, CaseIterable {
        case play = "play.circle"
        case playFill = "play.circle.fill"
        case pause = "pause.circle"
        case pauseFill = "pause.circle.fill"
        case refresh = "arrow.clockwise"
        case speaker = "speaker.wave.2"
        case speakerFill = "speaker.wave.2.fill"
        case speakerMute = "speaker.slash"
        case checkmark = "checkmark.circle.fill"
        case xmark = "xmark.circle.fill"
    }

    // MARK: - Grid & Matching UI
    enum GridSymbol: String, CaseIterable {
        case square2x2 = "square.grid.2x2"
        case square3x3 = "square.grid.3x3"
        case rectangle2x2 = "rectangle.grid.2x2"
        case rectangle3x3 = "rectangle.grid.3x3"
        case circle2x2 = "circle.grid.2x2"
        case circle3x3 = "circle.grid.3x3"
        case split2x2 = "square.split.2x2"
        case split1x2 = "square.split.1x2"
        case rectSplit2x1 = "rectangle.split.2x1"
        case rectSplit2x2 = "rectangle.split.2x2"
    }
}
