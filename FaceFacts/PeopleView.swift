//
//  PeopleView.swift
//  FaceFacts
//
//  Created by Bhavin  Oza on 2/24/24.
//

import SwiftUI
import SwiftData

struct PeopleView: View {
    
    @Environment (\.modelContext) var modelContext
    @Query var people: [Person]
    
    var body: some View {
        List {
            ForEach(people) { person in
                NavigationLink(value: person) {
                    Text(person.name)
                }
            }
            .onDelete(perform: { indexSet in
                deletePerson(at: indexSet)
            })
        }
    }
    
    init(searchString: String = "", sortOrder: [SortDescriptor<Person>] = []) {
        _people = Query(filter: #Predicate { person in
            if searchString.isEmpty {
                true
            } else {
                person.name.localizedStandardContains(searchString)
                || person.emailAddress.localizedStandardContains(searchString)
                || person.details.localizedStandardContains(searchString)
            }
        }, sort: sortOrder)
    }
    
    func deletePerson(at offSets: IndexSet) {
//        try? modelContext.delete(model: Person.self)
        
        for offSet in offSets {
            let person = people[offSet]
            modelContext.delete(person)
        }
    }
}

#Preview {
//    PeopleView()
    
    do {
        let previewer = try Previewer()
        return PeopleView()
            .modelContainer(previewer.container)
    } catch {
        return Text("Failed to create preview: \(error.localizedDescription)")
    }
}
