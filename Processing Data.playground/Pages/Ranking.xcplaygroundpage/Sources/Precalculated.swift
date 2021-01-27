public var lowercaseCatalog: [String] {
    return showCatalog.map { $0.lowercased() }
}

func closestMatch(for string: String, from potentialMatches: [String]) -> String {
    // Initialize the best edit distance to the worst possible value
    var bestEditDistance = Int.max
    // Initialize the index of the best match to the first index
    var bestMatchIndex = 0
    
    for i in 0..<potentialMatches.count {
        // Get the edit distance from the string to the ith potential match
        
        // If the distance is better than best so far, update the best edit distance and best match index
        //----------------begin-teacher------------
        // Get the edit distance from the string to the ith potential match
        let potentialMatch = potentialMatches[i]
        let distance = editDistance(from: string, to: potentialMatch)

        // If the distance is better than best so far, update the best edit distance and best match index
        if distance < bestEditDistance {
            bestMatchIndex = i
            bestEditDistance = distance
        }
        //----------------end-teacher--------------
    }
    
    return potentialMatches[bestMatchIndex]
}

public var tabulator: Tabulator = {
    // Create a Tabulator instance.
    var t = Tabulator()
    
    for show in surveyData {
        let lowerShow = show.lowercased()
        // If the catalog contains the value, increment its count.
        if lowercaseCatalog.contains(lowerShow) {
            t.incrementCount(forValue: lowerShow)
        } else {
            // Otherwise, find the closest match for the value and increment the count for that.
            let showClosestMatch = closestMatch(for: lowerShow, from: lowercaseCatalog)
            t.incrementCount(forValue: showClosestMatch)
        }
    }
    
    return t
}()
