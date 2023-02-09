//
//  Story.swift
//  PASHABankSME
//
//  Created by Javid Museyibli on 07.08.21.
//

import Foundation

public struct Story: Codable, Equatable {
    public let id: Int?
    public let titleLanguage: StoryTitle?
    public let createdAt: String?
    public let coverImageId: String?
    public let snaps: [Snap]

    var lastPlayedSnapIndex = 0
    var isCompletelyVisible = false
    var isCancelledAbruptly = false

    public func coverImageUrl(baseURL: String) -> String {
        return "\(baseURL)/v1/stories/image/\(coverImageId ?? "")"
    }

    public static func == (lhs: Story, rhs: Story) -> Bool {
        return lhs.id == rhs.id
    }

    private enum CodingKeys: String, CodingKey {
        case id, titleLanguage, createdAt, coverImageId, snaps
    }
    
    public init(
        id: Int?,
        titleLanguage: StoryTitle?,
        createdAt: String?,
        coverImageId: String?,
        snaps: [Snap],
        lastPlayedSnapIndex: Int = 0,
        isCompletelyVisible: Bool = false,
        isCancelledAbruptly: Bool = false
    ) {
        self.id = id
        self.titleLanguage = titleLanguage
        self.createdAt = createdAt
        self.coverImageId = coverImageId
        self.snaps = snaps
        self.lastPlayedSnapIndex = lastPlayedSnapIndex
        self.isCompletelyVisible = isCompletelyVisible
        self.isCancelledAbruptly = isCancelledAbruptly
    }
}
