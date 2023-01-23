//
//
//import UIKit
//
//final class DeviceAutosizeLabel: UILabel, HyperLabelProtocol {
//
//    @IBInspectable var iPhoneFontSize: CGFloat = 0 {
//        didSet {
//            overrideFontSize(fontSize: iPhoneFontSize)
//        }
//    }
//
//    func overrideFontSize(fontSize: CGFloat) {
//        let currentFontName = self.font.fontName
//        var calculatedFont: UIFont?
//        let bounds = UIScreen.main.bounds
//        let screenWidth = bounds.size.width
//        let screenHeight = bounds.size.height
//        let baseWidth: CGFloat = iDevice.iPhone5.width
//        let baseHeight: CGFloat = iDevice.iPhone5.height
//        let baseResolution: CGFloat = baseWidth * baseHeight
//        let diffWidth: CGFloat = screenWidth - baseWidth
//        let diffHeight: CGFloat = screenHeight - baseHeight
//        let diffResolution: CGFloat = diffWidth * diffHeight
//        let diffRatio: CGFloat = diffResolution / baseResolution
//        var scaleFactor: CGFloat = 1 + diffRatio
//        if scaleFactor > 1.5 {
//            scaleFactor = 1.5
//        }
//        calculatedFont = UIFont(name: currentFontName, size: fontSize * scaleFactor)
//        self.font = calculatedFont
//    }
//
//    var onTextDidChange: (StringChange) -> Void = { _ in }
//
//    public override var text: String? {
//        didSet {
//            self.onTextDidChange(StringChange(newValue: self.text, oldValue: oldValue))
//        }
//    }
//
//    var onAttributedTextChange: (AttributedStringChange) -> Void = { _ in }
//
//    public override var attributedText: NSAttributedString? {
//        didSet {
//            self.onAttributedTextChange(AttributedStringChange(newValue: self.attributedText, oldValue: oldValue))
//        }
//    }
//
//    func setHyperLinkLabel(linkAttributes: [NSAttributedString.Key : Any], description: String, linkStrings: [String], completionHandler: @escaping((String) -> ())) {
//        initializeHyperLink()
//        additionalLinkAttributes = linkAttributes
//        text = description
//        guard let text = self.text as NSString? else { return }
//        
//        linkStrings.forEach({ linkString in
//            let link = text.range(of: linkString)
//            self.addLink(withRange: link) { DispatchQueue.main.async { completionHandler(linkString) } }
//        })
//    }
//    
//}
