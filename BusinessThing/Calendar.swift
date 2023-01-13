import UIKit

class Calendar: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UIScrollViewDelegate
{
    var basicSet = [("English Assignment", 0, "Oct 5"), ("AP Gov Project", 60, "Oct 2"), ("Math Assignment", 7, "Oct 7"), ("Band Performance", 100, "Dec 12"), ("Physics Project", 40, "Jan 3"), (("Physics Assignment", 1, "Dec 6"))]
    var month = 0
    var dates = 31
    var globalCal = [Int]()
    @IBOutlet weak var manth: UILabel!
    @IBOutlet weak var tooCoolForScrool: UIScrollView!
    @IBOutlet weak var vERYCoolOutlet: UICollectionView!
    override func viewDidLoad()
    {
        vERYCoolOutlet.delegate = self
        vERYCoolOutlet.dataSource = self
        manth.text = selectMonth(input: month)
        dates = selectDates(input: month)
        globalCal = findAssignments(input: basicSet)
        super.viewDidLoad()
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return dates
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = vERYCoolOutlet.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath) as! CustomCollectionCell
        cell.EbicAwesimLabl.text = "\(globalCal[indexPath.row])"
        if globalCal[indexPath.row] > 0
        {
            cell.backgroundColor = colorPicker(selection: globalCal[indexPath.row])
        }
        else
        {
            cell.backgroundColor = #colorLiteral(red: 0.3458527327, green: 0.3793551922, blue: 0.2133879066, alpha: 0.4270567602)
        }
        return cell
    }
    func refreshTable()
    {
        dates = selectDates(input: month)
        globalCal = findAssignments(input: basicSet)
        manth.text = selectMonth(input: month)
        vERYCoolOutlet.reloadData()
    }
    func findAssignments(input: [(String, Int, String)]) -> [Int]
    {
        var total = [Int]()
        for _ in 0...dates
        {
            total.append(0)
        }
        for x in 0...total.count - 1
        {
            for y in input
            {
                let b = datea(input: y.2)
                if b.0 == month && b.1 == x
                {
                    total[x - 1] += 1
                }
            }
        }
        return total
    }
    @IBAction func back(_ sender: Any)
    {
        month -= 1
        if month < 0
        {
            month = 11
        }
        refreshTable()
    }
    @IBAction func forward(_ sender: Any)
    {
        month += 1
        if month > 11
        {
            month = 0
        }
        refreshTable()
    }
    //MARK: SPECIFIC METHOODS
    func colorPicker(selection: Int) -> UIColor
    {
        var final = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        switch selection
        {
        case 1:
            final = #colorLiteral(red: 0.3815664053, green: 0.3627296686, blue: 0.02665003203, alpha: 0.8273543792)
        case 2:
            final = #colorLiteral(red: 0.7540712953, green: 0.6603374481, blue: 0.1274352372, alpha: 1)
        case 3:
            final = #colorLiteral(red: 0.7732445002, green: 0.5389798284, blue: 0.4007730484, alpha: 1)
        case 4:
            final = #colorLiteral(red: 0.7883386016, green: 0.4059997201, blue: 0.4840556383, alpha: 1)
        case 5:
            final = #colorLiteral(red: 0.7442187667, green: 0.3898319006, blue: 0.757836163, alpha: 1)
        case 6:
            final = #colorLiteral(red: 0.09051633626, green: 0.4670876861, blue: 0.7608557343, alpha: 1)
        case 7:
            final = #colorLiteral(red: 0, green: 0.751219213, blue: 0.4739122391, alpha: 1)
        case 8:
            final = #colorLiteral(red: 0.7764415145, green: 0, blue: 0.7635830641, alpha: 1)
        case 9:
            final = #colorLiteral(red: 1, green: 0.413379848, blue: 0.34205091, alpha: 1)
        default:
            final = #colorLiteral(red: 1, green: 0, blue: 0, alpha: 1)
        }
        return final
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
    func selectDates(input:Int) -> Int
    {
        var mVar = 0
        switch input
        {
        case 0:
            mVar = 31
        case 1:
            mVar = 27
        case 2:
            mVar = 31
        case 3:
            mVar = 30
        case 4:
            mVar = 31
        case 5:
            mVar = 30
        case 6:
            mVar = 31
        case 7:
            mVar = 31
        case 8:
            mVar = 30
        case 9:
            mVar = 31
        case 10:
            mVar = 30
        case 11:
            mVar = 31
        default:
            mVar = 0
        }
        return mVar
    }
    func datea(input: String) -> (Int, Int)
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
        y.1 = Int(x[1])!
        return y;
    }
}
 
