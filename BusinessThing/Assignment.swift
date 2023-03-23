import Foundation
class Assignent
{
    // Format As-Is.
    public var name: String
    // No Format
    public var points: Int
    // No Format
    public var pType: Bool
    // Format As: "(Month)[Limit to 3 characters, see "datea" methood for details] (Date)"
    public var due: String
    // Format As: 
    public var time: String
    init(name: String, points: Int, pType: Bool, due: String, time: String)
    {
        self.name = name
        self.points = points
        self.pType = pType
        self.due = due
        self.time = time
    }
    init(name: String, points: Int, pType: Bool, due: String)
    {
        self.name = name
        self.points = points
        self.pType = pType
        self.due = due
        time = ""
    }
    init()
    {
        name = "Unknown Assignment"
        points = -1
        pType = false
        due = "Unasssigned"
        time = ""
    }
}
