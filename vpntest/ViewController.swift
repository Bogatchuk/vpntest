import UIKit
import CoreVPN

class ViewController: UIViewController {


    var corevpnServers: CoreVPNServerModel?
    var corevpn: CoreVPN?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func connectButtonPressed(_ sender: UIButton) {
        let corevpnServers = CoreVPNServerModel(ip: "104.129.18.132", userName: "946oidjh-ubnrm9t", password: "mbqu3rj9hg", locationName: nil, locationImageLink: nil, ikev2ID: "us-central.windscribe.com", l2tpPSK: nil, vpnProtocol: "ikev2")
        
        let corevpn = CoreVPN(serviceName: "CoreVPN Test", servers: [corevpnServers], delegate: self)
        corevpn.connect()
    }
}


extension ViewController: CoreVPNDelegate {
    func serverChanged(server: CoreVPNServerModel) {}
    
    func connenctionTimeChanged(time: String) {}
    
    func connectionStateChanged(state: CoreVPNConnectionState) {
        switch state {
        case .connected:
            print("Connected")
   
        case .connecting:
            print("Connecting")

        case .disconnected:
            print("Disconnected")
            
        case .disconnecting:
            print("Connecting")
        }
    }
    
}
