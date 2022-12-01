import UIKit

class Calendar: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UIScrollViewDelegate
{
    var month = 1
    @IBOutlet weak var manth: UILabel!
    @IBOutlet weak var tooCoolForScrool: UIScrollView!
    @IBOutlet weak var vERYCoolOutlet: UICollectionView!
    override func viewDidLoad()
    {
        vERYCoolOutlet.delegate = self
        vERYCoolOutlet.dataSource = self
        manth.text = selectMonth(input: month)
        super.viewDidLoad()
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return 35
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = vERYCoolOutlet.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath) as! CustomCollectionCell
        cell.EbicAwesimLabl.text = "\(indexPath.row + 1)"
        return cell
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
}
 
