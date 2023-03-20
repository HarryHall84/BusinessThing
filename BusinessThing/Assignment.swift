import Foundation
class Assignent
{
    public var name: String
    public var points: Int
    public var pType: Bool
    public var due: String
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
        self.time = ""
    }
}
