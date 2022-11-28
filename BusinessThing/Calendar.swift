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
        super.viewDidLoad()
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return 35
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = vERYCoolOutlet.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath) as! CustomCollectionCell
        cell.EbicAwesimLabl.text = "0"
        return cell
    }
    func selectMonth()
    {
        var mVar = ""
        switch month
        {
        case 0:
            mVar = "January"
        case 1:
            mVar = "Febuary"
        case 2:
            mVar = "March"
        }
        return mVar
    }
}
 
