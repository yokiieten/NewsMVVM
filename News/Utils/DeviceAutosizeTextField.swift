

import UIKit

public class DeviceAutoSizeTextField: UITextField {
    
    @IBInspectable var iPhoneFontSize: CGFloat = 0 {
        didSet {
            scaleFont(size: iPhoneFontSize)
        }
    }
    
    func scaleFont(size: CGFloat) {
        guard let currentFontName = self.font?.fontName else { return }
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
        calculatedFont = UIFont(name: currentFontName, size: size * scaleFactor)
        self.font = calculatedFont
    }
}
