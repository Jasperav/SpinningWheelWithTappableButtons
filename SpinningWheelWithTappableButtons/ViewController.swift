import UIKit

class TornadoButton: UIButton{
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        
        let pres = self.layer.presentation()!
        let suppt = self.convert(point, to: self.superview!)
        let prespt = self.superview!.layer.convert(suppt, to: pres)
        if (pres.hitTest(suppt)) != nil{
            return self
        }
        return super.hitTest(prespt, with: event)
    }
    
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        let pres = self.layer.presentation()!
        let suppt = self.convert(point, to: self.superview!)
        return (pres.hitTest(suppt)) != nil
    }
}

extension ViewController: SpinWheelControlDelegate, SpinWheelControlDataSource{
    func numberOfWedgesInSpinWheel(spinWheel: SpinWheelControl) -> UInt {
        return 10
    }
    
    func wedgeForSliceAtIndex(index: UInt) -> SpinWheelWedge {
        let wedge = SpinWheelWedge()
        return wedge
    }
}

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        spinWheel.dataSource = self
        spinWheel.delegate = self
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        spinWheel.reloadData()
    }
    @IBOutlet weak var spinWheel: SpinWheelControl!
}

