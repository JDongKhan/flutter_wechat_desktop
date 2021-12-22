import Cocoa
import FlutterMacOS
import bitsdojo_window_macos

class MainFlutterWindow: BitsdojoWindow {
    

    override func bitsdojo_window_configure() -> UInt {
        return BDW_CUSTOM_FRAME | BDW_HIDE_ON_STARTUP
    }
    
  override func awakeFromNib() {
    let flutterViewController = FlutterViewController.init()
    let windowFrame = self.frame
    self.contentViewController = flutterViewController
    self.setFrame(windowFrame, display: true)
//    self.setContentSize(NSSize(width: 1000, height: 800))
//    let window:NSWindow! = self.contentView?.window
//      window.styleMask.remove(.resizable)
    RegisterGeneratedPlugins(registry: flutterViewController)

    super.awakeFromNib()
  }
    
   
    
}
