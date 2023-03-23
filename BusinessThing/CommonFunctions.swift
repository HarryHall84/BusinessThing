import Foundation
    public func datea(input: String) -> (Int, Int)
    {
        let x = input.split(separator: " ")
        /*
         Int, Int
         .0: Month
         .1: Day
         */
        var y: (Int, Int)
        switch x[0].lowercased()
        {
        case "jan":
            y.0 = 0
        case "feb":
            y.0 = 1
        case "mar":
            y.0 = 2
        case "apr":
            y.0 = 3
        case "may":
            y.0 = 4
        case "jun":
            y.0 = 5
        case "jul":
            y.0 = 6
        case "aug":
            y.0 = 7
        case "sep":
            y.0 = 8
        case "oct":
            y.0 = 9
        case "nov":
            y.0 = 10
        case "dec":
            y.0 = 11
        default:
            y.0 = -1
        }
        if x.count > 1 && Int(x[1]) != nil
        {
            y.1 = Int(x[1]) ?? -1
        }
        else
        {
            y.1 = -1
        }
        return y;
    }
    func selectMonth(input:Int) -> String
    {
        var mVar = ""
        switch input
        {
        case 0:
            mVar = "January"
        case 1:
            mVar = "Febuary"
        case 2:
            mVar = "March"
        case 3:
            mVar = "April"
        case 4:
            mVar = "May"
        case 5:
            mVar = "June"
        case 6:
            mVar = "July"
        case 7:
            mVar = "August"
        case 8:
            mVar = "September"
        case 9:
            mVar = "October"
        case 10:
            mVar = "November"
        case 11:
            mVar = "December"
        default:
            mVar = "Undefined"
        }
        return mVar
    }
