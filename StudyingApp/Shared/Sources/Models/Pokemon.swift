//
//  File.swift
//  
//
//  Created by José Arsuaga Sotres on 06/07/24.
//

import Foundation


// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? JSONDecoder().decode(Pokemon.self, from: jsonData)

import Foundation

// MARK: - Pokemon
public struct Pokemon: Codable, Identifiable {
    public let abilities: [Ability]
    public let baseExperience: Int
    public let cries: Cries
    public let forms: [Species]
    public let gameIndices: [GameIndex]
    public let height: Int
    public let heldItems: [HeldItem]
    public let id: Int
    public let isDefault: Bool
    public let locationAreaEncounters: String
    public let moves: [Move]
    public let name: String
    public let order: Int
    public let pastAbilities, pastTypes: [JSONAny]
    public let species: Species
    public let sprites: Sprites
    public let stats: [Stat]
    public let types: [TypeElement]
    public let weight: Int

    public enum CodingKeys: String, CodingKey {
        case abilities
        case baseExperience = "base_experience"
        case cries, forms
        case gameIndices = "game_indices"
        case height
        case heldItems = "held_items"
        case id
        case isDefault = "is_default"
        case locationAreaEncounters = "location_area_encounters"
        case moves, name, order
        case pastAbilities = "past_abilities"
        case pastTypes = "past_types"
        case species, sprites, stats, types, weight
    }

    public init(
        abilities: [Ability],
        baseExperience: Int,
        cries: Cries,
        forms: [Species],
        gameIndices: [GameIndex],
        height: Int,
        heldItems: [HeldItem],
        id: Int,
        isDefault: Bool,
        locationAreaEncounters: String,
        moves: [Move],
        name: String,
        order: Int,
        pastAbilities: [JSONAny],
        pastTypes: [JSONAny],
        species: Species,
        sprites: Sprites,
        stats: [Stat],
        types: [TypeElement],
        weight: Int
    ) {
        self.abilities = abilities
        self.baseExperience = baseExperience
        self.cries = cries
        self.forms = forms
        self.gameIndices = gameIndices
        self.height = height
        self.heldItems = heldItems
        self.id = id
        self.isDefault = isDefault
        self.locationAreaEncounters = locationAreaEncounters
        self.moves = moves
        self.name = name
        self.order = order
        self.pastAbilities = pastAbilities
        self.pastTypes = pastTypes
        self.species = species
        self.sprites = sprites
        self.stats = stats
        self.types = types
        self.weight = weight
    }
}

// MARK: - Ability
public struct Ability: Codable {
    public let ability: Species
    public let isHidden: Bool
    public let slot: Int
    
    public enum CodingKeys: String, CodingKey {
        case ability
        case isHidden = "is_hidden"
        case slot
    }
    
    public init(
        ability: Species,
        isHidden: Bool,
        slot: Int
    ) {
        self.ability = ability
        self.isHidden = isHidden
        self.slot = slot
    }
}

// MARK: - Species
public struct Species: Codable {
    public let name: String
    public let url: String
    
    public init(
        name: String,
        url: String
    ) {
        self.name = name
        self.url = url
    }
}

// MARK: - Cries
public struct Cries: Codable {
    public let latest, legacy: String
    
    public init(
        latest: String,
        legacy: String
    ) {
        self.latest = latest
        self.legacy = legacy
    }
}

// MARK: - GameIndex
public struct GameIndex: Codable {
    public let gameIndex: Int
    public let version: Species
    
    public enum CodingKeys: String, CodingKey {
        case gameIndex = "game_index"
        case version
    }
    
    public init(
        gameIndex: Int,
        version: Species
    ) {
        self.gameIndex = gameIndex
        self.version = version
    }
}

// MARK: - HeldItem
public struct HeldItem: Codable {
    public let item: Species
    public let versionDetails: [VersionDetail]
    
    public enum CodingKeys: String, CodingKey {
        case item
        case versionDetails = "version_details"
    }
    
    public init(
        item: Species,
        versionDetails: [VersionDetail]
    ) {
        self.item = item
        self.versionDetails = versionDetails
    }
}

// MARK: - VersionDetail
public struct VersionDetail: Codable {
    public let rarity: Int
    public let version: Species
    
    public init(
        rarity: Int,
        version: Species
    ) {
        self.rarity = rarity
        self.version = version
    }
}

// MARK: - Move
public struct Move: Codable {
    public let move: Species
    public let versionGroupDetails: [VersionGroupDetail]
    
    public enum CodingKeys: String, CodingKey {
        case move
        case versionGroupDetails = "version_group_details"
    }
    
    public init(
        move: Species,
        versionGroupDetails: [VersionGroupDetail]
    ) {
        self.move = move
        self.versionGroupDetails = versionGroupDetails
    }
}

// MARK: - VersionGroupDetail
public struct VersionGroupDetail: Codable {
    public let levelLearnedAt: Int
    public let moveLearnMethod, versionGroup: Species
    
    public enum CodingKeys: String, CodingKey {
        case levelLearnedAt = "level_learned_at"
        case moveLearnMethod = "move_learn_method"
        case versionGroup = "version_group"
    }
    
    public init(
        levelLearnedAt: Int,
        moveLearnMethod: Species,
        versionGroup: Species
    ) {
        self.levelLearnedAt = levelLearnedAt
        self.moveLearnMethod = moveLearnMethod
        self.versionGroup = versionGroup
    }
}

// MARK: - GenerationV
public struct GenerationV: Codable {
    public let blackWhite: Sprites
    
    public enum CodingKeys: String, CodingKey {
        case blackWhite = "black-white"
    }
    
    public init(
        blackWhite: Sprites
    ) {
        self.blackWhite = blackWhite
    }
}

// MARK: - GenerationIv
public struct GenerationIv: Codable {
    public let diamondPearl, heartgoldSoulsilver, platinum: Sprites
    
    public enum CodingKeys: String, CodingKey {
        case diamondPearl = "diamond-pearl"
        case heartgoldSoulsilver = "heartgold-soulsilver"
        case platinum
    }
    
    public init(
        diamondPearl: Sprites,
        heartgoldSoulsilver: Sprites,
        platinum: Sprites
    ) {
        self.diamondPearl = diamondPearl
        self.heartgoldSoulsilver = heartgoldSoulsilver
        self.platinum = platinum
    }
}

// MARK: - Versions
public struct Versions: Codable {
    public let generationI: GenerationI
    public let generationIi: GenerationIi
    public let generationIii: GenerationIii
    public let generationIv: GenerationIv
    public let generationV: GenerationV
    public let generationVi: [String: Home]
    public let generationVii: GenerationVii
    public let generationViii: GenerationViii
    
    public enum CodingKeys: String, CodingKey {
        case generationI = "generation-i"
        case generationIi = "generation-ii"
        case generationIii = "generation-iii"
        case generationIv = "generation-iv"
        case generationV = "generation-v"
        case generationVi = "generation-vi"
        case generationVii = "generation-vii"
        case generationViii = "generation-viii"
    }
    
    public init(
        generationI: GenerationI,
        generationIi: GenerationIi,
        generationIii: GenerationIii,
        generationIv: GenerationIv,
        generationV: GenerationV,
        generationVi: [String: Home],
        generationVii: GenerationVii,
        generationViii: GenerationViii
    ) {
        self.generationI = generationI
        self.generationIi = generationIi
        self.generationIii = generationIii
        self.generationIv = generationIv
        self.generationV = generationV
        self.generationVi = generationVi
        self.generationVii = generationVii
        self.generationViii = generationViii
    }
}

// MARK: - Other
public struct Other: Codable {
    public let dreamWorld: DreamWorld
    public let home: Home
    public let officialArtwork: OfficialArtwork
    public let showdown: Sprites
    
    public enum CodingKeys: String, CodingKey {
        case dreamWorld = "dream_world"
        case home
        case officialArtwork = "official-artwork"
        case showdown
    }
    
    public init(
        dreamWorld: DreamWorld,
        home: Home,
        officialArtwork: OfficialArtwork,
        showdown: Sprites
    ) {
        self.dreamWorld = dreamWorld
        self.home = home
        self.officialArtwork = officialArtwork
        self.showdown = showdown
    }
}

// MARK: - Sprites
public class Sprites: Codable {
    public let backDefault: String
    public let backFemale: JSONNull?
    public let backShiny: String
    public let backShinyFemale: JSONNull?
    public let frontDefault: String
    public let frontFemale: JSONNull?
    public let frontShiny: String
    public let frontShinyFemale: JSONNull?
    public let other: Other?
    public let versions: Versions?
    public let animated: Sprites?
    
    public enum CodingKeys: String, CodingKey {
        case backDefault = "back_default"
        case backFemale = "back_female"
        case backShiny = "back_shiny"
        case backShinyFemale = "back_shiny_female"
        case frontDefault = "front_default"
        case frontFemale = "front_female"
        case frontShiny = "front_shiny"
        case frontShinyFemale = "front_shiny_female"
        case other, versions, animated
    }
    
    public init(
        backDefault: String,
        backFemale: JSONNull?,
        backShiny: String,
        backShinyFemale: JSONNull?,
        frontDefault: String,
        frontFemale: JSONNull?,
        frontShiny: String,
        frontShinyFemale: JSONNull?,
        other: Other?,
        versions: Versions?,
        animated: Sprites?
    ) {
        self.backDefault = backDefault
        self.backFemale = backFemale
        self.backShiny = backShiny
        self.backShinyFemale = backShinyFemale
        self.frontDefault = frontDefault
        self.frontFemale = frontFemale
        self.frontShiny = frontShiny
        self.frontShinyFemale = frontShinyFemale
        self.other = other
        self.versions = versions
        self.animated = animated
    }
}

// MARK: - GenerationI
public struct GenerationI: Codable {
    public let redBlue, yellow: RedBlue
    
    public enum CodingKeys: String, CodingKey {
        case redBlue = "red-blue"
        case yellow
    }
    
    public init(
        redBlue: RedBlue,
        yellow: RedBlue
    ) {
        self.redBlue = redBlue
        self.yellow = yellow
    }
}

// MARK: - RedBlue
public struct RedBlue: Codable {
    public let backDefault, backGray, backTransparent, frontDefault: String
    public let frontGray, frontTransparent: String
    
    public enum CodingKeys: String, CodingKey {
        case backDefault = "back_default"
        case backGray = "back_gray"
        case backTransparent = "back_transparent"
        case frontDefault = "front_default"
        case frontGray = "front_gray"
        case frontTransparent = "front_transparent"
    }
    
    public init(
        backDefault: String,
        backGray: String,
        backTransparent: String,
        frontDefault: String,
        frontGray: String,
        frontTransparent: String
    ) {
        self.backDefault = backDefault
        self.backGray = backGray
        self.backTransparent = backTransparent
        self.frontDefault = frontDefault
        self.frontGray = frontGray
        self.frontTransparent = frontTransparent
    }
}

// MARK: - GenerationIi
public struct GenerationIi: Codable {
    public let crystal: Crystal
    public let gold, silver: Gold
    
    public init(
        crystal: Crystal,
        gold: Gold,
        silver: Gold
    ) {
        self.crystal = crystal
        self.gold = gold
        self.silver = silver
    }
}

// MARK: - Crystal
public struct Crystal: Codable {
    public let backDefault, backShiny, backShinyTransparent, backTransparent: String
    public let frontDefault, frontShiny, frontShinyTransparent, frontTransparent: String
    
    public enum CodingKeys: String, CodingKey {
        case backDefault = "back_default"
        case backShiny = "back_shiny"
        case backShinyTransparent = "back_shiny_transparent"
        case backTransparent = "back_transparent"
        case frontDefault = "front_default"
        case frontShiny = "front_shiny"
        case frontShinyTransparent = "front_shiny_transparent"
        case frontTransparent = "front_transparent"
    }
    
    public init(
        backDefault: String,
        backShiny: String,
        backShinyTransparent: String,
        backTransparent: String,
        frontDefault: String,
        frontShiny: String,
        frontShinyTransparent: String,
        frontTransparent: String
    ) {
        self.backDefault = backDefault
        self.backShiny = backShiny
        self.backShinyTransparent = backShinyTransparent
        self.backTransparent = backTransparent
        self.frontDefault = frontDefault
        self.frontShiny = frontShiny
        self.frontShinyTransparent = frontShinyTransparent
        self.frontTransparent = frontTransparent
    }
}

// MARK: - Gold
public struct Gold: Codable {
    public let backDefault, backShiny, frontDefault, frontShiny: String
    public let frontTransparent: String?
    
    public enum CodingKeys: String, CodingKey {
        case backDefault = "back_default"
        case backShiny = "back_shiny"
        case frontDefault = "front_default"
        case frontShiny = "front_shiny"
        case frontTransparent = "front_transparent"
    }
    
    public init(
        backDefault: String,
        backShiny: String,
        frontDefault: String,
        frontShiny: String,
        frontTransparent: String?
    ) {
        self.backDefault = backDefault
        self.backShiny = backShiny
        self.frontDefault = frontDefault
        self.frontShiny = frontShiny
        self.frontTransparent = frontTransparent
    }
}

// MARK: - GenerationIii
public struct GenerationIii: Codable {
    public let emerald: OfficialArtwork
    public let fireredLeafgreen, rubySapphire: Gold
    
    public enum CodingKeys: String, CodingKey {
        case emerald
        case fireredLeafgreen = "firered-leafgreen"
        case rubySapphire = "ruby-sapphire"
    }
    
    public init(
        emerald: OfficialArtwork,
        fireredLeafgreen: Gold,
        rubySapphire: Gold
    ) {
        self.emerald = emerald
        self.fireredLeafgreen = fireredLeafgreen
        self.rubySapphire = rubySapphire
    }
}

// MARK: - OfficialArtwork
public struct OfficialArtwork: Codable {
    public let frontDefault, frontShiny: String
    
    public enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
        case frontShiny = "front_shiny"
    }
    
    public init(
        frontDefault: String,
        frontShiny: String
    ) {
        self.frontDefault = frontDefault
        self.frontShiny = frontShiny
    }
}

// MARK: - Home
public struct Home: Codable {
    public let frontDefault: String
    public let frontFemale: JSONNull?
    public let frontShiny: String
    public let frontShinyFemale: JSONNull?
    
    public enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
        case frontFemale = "front_female"
        case frontShiny = "front_shiny"
        case frontShinyFemale = "front_shiny_female"
    }
    
    public init(
        frontDefault: String,
        frontFemale: JSONNull?,
        frontShiny: String,
        frontShinyFemale: JSONNull?
    ) {
        self.frontDefault = frontDefault
        self.frontFemale = frontFemale
        self.frontShiny = frontShiny
        self.frontShinyFemale = frontShinyFemale
    }
}

// MARK: - GenerationVii
public struct GenerationVii: Codable {
    public let icons: DreamWorld
    public let ultraSunUltraMoon: Home
    
    public enum CodingKeys: String, CodingKey {
        case icons
        case ultraSunUltraMoon = "ultra-sun-ultra-moon"
    }
    
    public init(
        icons: DreamWorld,
        ultraSunUltraMoon: Home
    ) {
        self.icons = icons
        self.ultraSunUltraMoon = ultraSunUltraMoon
    }
}

// MARK: - DreamWorld
public struct DreamWorld: Codable {
    public let frontDefault: String
    public let frontFemale: JSONNull?
    
    public enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
        case frontFemale = "front_female"
    }
    
    public init(
        frontDefault: String,
        frontFemale: JSONNull?
    ) {
        self.frontDefault = frontDefault
        self.frontFemale = frontFemale
    }
}

// MARK: - GenerationViii
public struct GenerationViii: Codable {
    public let icons: DreamWorld
    
    public init(
        icons: DreamWorld
    ) {
        self.icons = icons
    }
}

// MARK: - Stat
public struct Stat: Codable {
    public let baseStat, effort: Int
    public let stat: Species
    
    public enum CodingKeys: String, CodingKey {
        case baseStat = "base_stat"
        case effort, stat
    }
    
    public init(
        baseStat: Int,
        effort: Int,
        stat: Species
    ) {
        self.baseStat = baseStat
        self.effort = effort
        self.stat = stat
    }
}

// MARK: - TypeElement
public struct TypeElement: Codable {
    public let slot: Int
    public let type: Species
    
    public init(
        slot: Int,
        type: Species
    ) {
        self.slot = slot
        self.type = type
    }
}

// MARK: - Encode/decode helpers

public class JSONNull: Codable, Hashable {
    
    public static func == (
        lhs: JSONNull,
        rhs: JSONNull
    ) -> Bool {
        return true
    }
    
    public var hashValue: Int {
        return 0
    }
    
    public init() {
    }
    
    public required init(
        from decoder: Decoder
    ) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(
                JSONNull.self,
                DecodingError.Context(
                    codingPath: decoder.codingPath,
                    debugDescription: "Wrong type for JSONNull"
                )
            )
        }
    }
    
    public func encode(
        to encoder: Encoder
    ) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

class JSONCodingKey: CodingKey {
    let key: String
    
    required init?(
        intValue: Int
    ) {
        return nil
    }
    
    required init?(
        stringValue: String
    ) {
        key = stringValue
    }
    
    var intValue: Int? {
        return nil
    }
    
    var stringValue: String {
        return key
    }
}

public class JSONAny: Codable {
    
    public let value: Any
    
    static func decodingError(
        forCodingPath codingPath: [CodingKey]
    ) -> DecodingError {
        let context = DecodingError.Context(
            codingPath: codingPath,
            debugDescription: "Cannot decode JSONAny"
        )
        return DecodingError.typeMismatch(
            JSONAny.self,
            context
        )
    }
    
    static func encodingError(
        forValue value: Any,
        codingPath: [CodingKey]
    ) -> EncodingError {
        let context = EncodingError.Context(
            codingPath: codingPath,
            debugDescription: "Cannot encode JSONAny"
        )
        return EncodingError.invalidValue(
            value,
            context
        )
    }
    
    static func decode(
        from container: SingleValueDecodingContainer
    ) throws -> Any {
        if let value = try? container.decode(
            Bool.self
        ) {
            return value
        }
        if let value = try? container.decode(
            Int64.self
        ) {
            return value
        }
        if let value = try? container.decode(
            Double.self
        ) {
            return value
        }
        if let value = try? container.decode(
            String.self
        ) {
            return value
        }
        if container.decodeNil() {
            return JSONNull()
        }
        throw decodingError(
            forCodingPath: container.codingPath
        )
    }
    
    static func decode(
        from container: inout UnkeyedDecodingContainer
    ) throws -> Any {
        if let value = try? container.decode(
            Bool.self
        ) {
            return value
        }
        if let value = try? container.decode(
            Int64.self
        ) {
            return value
        }
        if let value = try? container.decode(
            Double.self
        ) {
            return value
        }
        if let value = try? container.decode(
            String.self
        ) {
            return value
        }
        if let value = try? container.decodeNil() {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer() {
            return try decodeArray(
                from: &container
            )
        }
        if var container = try? container.nestedContainer(
            keyedBy: JSONCodingKey.self
        ) {
            return try decodeDictionary(
                from: &container
            )
        }
        throw decodingError(
            forCodingPath: container.codingPath
        )
    }
    
    static func decode(
        from container: inout KeyedDecodingContainer<JSONCodingKey>,
        forKey key: JSONCodingKey
    ) throws -> Any {
        if let value = try? container.decode(
            Bool.self,
            forKey: key
        ) {
            return value
        }
        if let value = try? container.decode(
            Int64.self,
            forKey: key
        ) {
            return value
        }
        if let value = try? container.decode(
            Double.self,
            forKey: key
        ) {
            return value
        }
        if let value = try? container.decode(
            String.self,
            forKey: key
        ) {
            return value
        }
        if let value = try? container.decodeNil(
            forKey: key
        ) {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer(
            forKey: key
        ) {
            return try decodeArray(
                from: &container
            )
        }
        if var container = try? container.nestedContainer(
            keyedBy: JSONCodingKey.self,
            forKey: key
        ) {
            return try decodeDictionary(
                from: &container
            )
        }
        throw decodingError(
            forCodingPath: container.codingPath
        )
    }
    
    static func decodeArray(
        from container: inout UnkeyedDecodingContainer
    ) throws -> [Any] {
        var arr: [Any] = []
        while !container.isAtEnd {
            let value = try decode(
                from: &container
            )
            arr.append(
                value
            )
        }
        return arr
    }
    
    static func decodeDictionary(
        from container: inout KeyedDecodingContainer<JSONCodingKey>
    ) throws -> [String: Any] {
        var dict = [String: Any]()
        for key in container.allKeys {
            let value = try decode(
                from: &container,
                forKey: key
            )
            dict[key.stringValue] = value
        }
        return dict
    }
    
    static func encode(
        to container: inout UnkeyedEncodingContainer,
        array: [Any]
    ) throws {
        for value in array {
            if let value = value as? Bool {
                try container.encode(
                    value
                )
            } else if let value = value as? Int64 {
                try container.encode(
                    value
                )
            } else if let value = value as? Double {
                try container.encode(
                    value
                )
            } else if let value = value as? String {
                try container.encode(
                    value
                )
            } else if value is JSONNull {
                try container.encodeNil()
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer()
                try encode(
                    to: &container,
                    array: value
                )
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(
                    keyedBy: JSONCodingKey.self
                )
                try encode(
                    to: &container,
                    dictionary: value
                )
            } else {
                throw encodingError(
                    forValue: value,
                    codingPath: container.codingPath
                )
            }
        }
    }
    
    static func encode(
        to container: inout KeyedEncodingContainer<JSONCodingKey>,
        dictionary: [String: Any]
    ) throws {
        for (
            key,
            value
        ) in dictionary {
            let key = JSONCodingKey(
                stringValue: key
            )!
            if let value = value as? Bool {
                try container.encode(
                    value,
                    forKey: key
                )
            } else if let value = value as? Int64 {
                try container.encode(
                    value,
                    forKey: key
                )
            } else if let value = value as? Double {
                try container.encode(
                    value,
                    forKey: key
                )
            } else if let value = value as? String {
                try container.encode(
                    value,
                    forKey: key
                )
            } else if value is JSONNull {
                try container.encodeNil(
                    forKey: key
                )
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer(
                    forKey: key
                )
                try encode(
                    to: &container,
                    array: value
                )
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(
                    keyedBy: JSONCodingKey.self,
                    forKey: key
                )
                try encode(
                    to: &container,
                    dictionary: value
                )
            } else {
                throw encodingError(
                    forValue: value,
                    codingPath: container.codingPath
                )
            }
        }
    }
    
    static func encode(
        to container: inout SingleValueEncodingContainer,
        value: Any
    ) throws {
        if let value = value as? Bool {
            try container.encode(
                value
            )
        } else if let value = value as? Int64 {
            try container.encode(
                value
            )
        } else if let value = value as? Double {
            try container.encode(
                value
            )
        } else if let value = value as? String {
            try container.encode(
                value
            )
        } else if value is JSONNull {
            try container.encodeNil()
        } else {
            throw encodingError(
                forValue: value,
                codingPath: container.codingPath
            )
        }
    }
    
    public required init(
        from decoder: Decoder
    ) throws {
        if var arrayContainer = try? decoder.unkeyedContainer() {
            self.value = try JSONAny.decodeArray(
                from: &arrayContainer
            )
        } else if var container = try? decoder.container(
            keyedBy: JSONCodingKey.self
        ) {
            self.value = try JSONAny.decodeDictionary(
                from: &container
            )
        } else {
            let container = try decoder.singleValueContainer()
            self.value = try JSONAny.decode(
                from: container
            )
        }
    }
    
    public func encode(
        to encoder: Encoder
    ) throws {
        if let arr = self.value as? [Any] {
            var container = encoder.unkeyedContainer()
            try JSONAny.encode(
                to: &container,
                array: arr
            )
        } else if let dict = self.value as? [String: Any] {
            var container = encoder.container(
                keyedBy: JSONCodingKey.self
            )
            try JSONAny.encode(
                to: &container,
                dictionary: dict
            )
        } else {
            var container = encoder.singleValueContainer()
            try JSONAny.encode(
                to: &container,
                value: self.value
            )
            }
    }
}
