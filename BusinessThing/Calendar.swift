import UIKit

class Calendar: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UIScrollViewDelegate
{
    var sent = [Assignent]()
    var month = 0
    var dates = 31
    var globalCal = [Int]()
    @IBOutlet weak var manth: UILabel!
    @IBOutlet weak var tooCoolForScrool: UIScrollView!
    @IBOutlet weak var vERYCoolOutlet: UICollectionView!
    
    @IBOutlet weak var dateOutlet: UILabel!
    override func viewDidLoad()
    {
        vERYCoolOutlet.delegate = self
        vERYCoolOutlet.dataSource = self
        manth.text = selectMonth(input: month)
        dates = selectDates(input: month)
        let basicSet = ViewController.basicSet + ViewController.missingSet
        globalCal = findAssignments(input: basicSet)
        super.viewDidLoad()
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return dates
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        let basicSet = ViewController.basicSet + ViewController.missingSet
        sent = findAssignments(input: indexPath.row, compare: basicSet)
        if sent.isEmpty == false
        {
            performSegue(withIdentifier: "CalRedirect", sender: nil)
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        
        let cell = vERYCoolOutlet.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath) as! CustomCollectionCell
        cell.cringeDates.text = "\(indexPath.row + 1)"
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
        let basicSet = ViewController.basicSet + ViewController.missingSet
        globalCal = findAssignments(input: basicSet)
        manth.text = selectMonth(input: month)
        vERYCoolOutlet.reloadData()
    }
    func findAssignments(input: [Assignent]) -> [Int]
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
                let b = datea(input: y.due)
                if b.0 == month && b.1 == x
                {
                    total[x - 1] += 1
                }
            }
        }
        return total
    }
    func findAssignments(input: Int, compare: [Assignent]) -> [Assignent]
    {
        var returnArray = [Assignent]()
        for x in compare
        {
            let a = datea(input: x.due)
            if a.0 == month && a.1 == input + 1
            {
                returnArray.append(x)
            }
        }
        return returnArray
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
    func selectDates(input:Int) -> Int
    {
        var mVar = 0
        switch input
        {
        case 0:
            mVar = 31
        case 1:
            mVar = 28
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
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "CalRedirect"
        {
            let destination = segue.destination as! SeeAssignmentsFromCal
            destination.incoming = sent
        }
    }
    
}
 

