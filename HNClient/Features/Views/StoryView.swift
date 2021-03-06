//
//  GenericListView.swift
//  HNClient
//
//  Created by Paolo Baeli on 17/07/22.
//

import SwiftUI

struct StoryView: View {
    let story: Story
    
    private func makeAttributedString(title: String, label:String) -> AttributedString {
        
        var string = AttributedString("\(title) \(label)")
        string.foregroundColor = .black
        string.font = .system(size: 16, weight: .bold)
        
        if let range = string.range(of: label) {
            string[range].foregroundColor = .black.opacity(0.8)
            string[range].font = .system(size: 16, weight: .regular)
        }
        
        return string
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Image(systemName: "newspaper")
                Text(story.title)
                    .bold()
            }
            HStack {
                Text(makeAttributedString(title:"By:", label: story.by))
                Spacer()
                Text(makeAttributedString(title:"Score:", label: "\(story.score)"))
            }
        }
        .padding(.vertical)
    }
}



struct StoryView_Previews: PreviewProvider {
    static var previews: some View {
        StoryView(story: Story.dummyStories.first!)
    }
}
