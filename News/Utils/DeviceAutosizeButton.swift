

import UIKit

class DeviceAutosizeButton: UIButton {

    @IBInspectable var iPhoneFontSize: CGFloat = 0 {
        didSet {
            overrideFontSize(fontSize: iPhoneFontSize)
        }
    }
    
    func overrideFontSize(fontSize: CGFloat) {
        guard let currentFontName = self.titleLabel?.font.fontName else { return }
        var calculatedFont: UIFont?
        let bounds = UIScreen.main.bounds
        let screenWidth = bounds.size.width
        let screenHeight = bounds.size.height
        let baseWidth: CGFloat = iDevice.iPhone5.width
        let baseHeight: CGFloat = iDevice.iPhone5.height
        let baseResolution: CGFloat = baseWidth * baseHeight
        let diffWidth: CGFloat = screenWidth - baseWidth
        let diffHeight: CGFloat = screenHeight - baseHeight
        let diffResolution: CGFloat = diffWidth * diffHeight
        let diffRatio: CGFloat = diffResolution / baseResolution
        var scaleFactor: CGFloat = 1 + diffRatio
        if scaleFactor > 1.5 {
            scaleFactor = 1.5
        }
        calculatedFont = UIFont(name: currentFontName, size: fontSize * scaleFactor)
        self.titleLabel?.font = calculatedFont
    }
}
