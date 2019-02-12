//
//  ExpanderContent.swift
//  AutoSizeTests
//
//  Created by Michel Anderson Lutz Teixeira on 12/02/19.
//  Copyright © 2019 Michel Anderson Lutz Teixeira. All rights reserved.
//

import UIKit


class ExpanderContent: UIStackView {

    let label1: UILabel = {
        let label1 = UILabel(frame: .zero)
        label1.text = "Lorem Ipsum"
        label1.translatesAutoresizingMaskIntoConstraints = false
        label1.textColor = .black
        label1.backgroundColor = .green
        label1.textAlignment = .left
        label1.numberOfLines = 0
        return label1
    }()

    let label2: UILabel = {
        let label2 = UILabel(frame: .zero)
        label2.text = "Lorem Ipsum 2"
        label2.translatesAutoresizingMaskIntoConstraints = false
        label2.textColor = .black
        label2.backgroundColor = .orange
        label2.textAlignment = .left
        label2.numberOfLines = 0
        return label2
    }()

    init() {
        super.init(frame: .zero)

        self.spacing = 3.0
        axis = .vertical
        distribution = .fillProportionally

        addArrangedSubview(label1)
        addArrangedSubview(label2)

        //setupViewConfiguration()
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func updateTexts() {
        label1.text = """
                    Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
        """

        label2.text = """
            It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).
        """
    }

//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
}


//extension ExpanderContent: ViewConfiguration {
//    func setupConstraints() {
//        label1.topAnchor.constraint(equalTo: topAnchor, constant: 16).isActive = true
//        label1.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
//        label1.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
////        let label1H = label1.text!.heightWithConstrainedWidth(width: ScreenManager.screenWidth() * 0.9, font: label1.font)
////        heightLabel1 = label1.heightAnchor.constraint(equalToConstant: label1H)
////        heightLabel1?.isActive = true
//
//        label2.topAnchor.constraint(equalTo: label1.bottomAnchor, constant: 16).isActive = true
//        label2.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
//        label2.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
//        label2.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16).isActive = true
////        let label2H = label2.text!.heightWithConstrainedWidth(width: ScreenManager.screenWidth() * 0.9, font: label2.font)
////        heightLabel2 = label2.heightAnchor.constraint(equalToConstant: label2H)
////        heightLabel2?.isActive = true
////        widthAnchor.constraint(equalToConstant: ScreenManager.screenWidth()).isActive = true
//    }
//
//    func buildViewHierarchy() {
//        addSubview(label1)
//        addSubview(label2)
//    }
//
//    func configureViews() {
//        backgroundColor = DevUtils.randomizedColor()
//    }
//}

import UIKit

extension UIView {
    // In order to create computed properties for extensions, we need a key to
    // store and access the stored property
    fileprivate struct AssociatedObjectKeys {
        static var tapGestureRecognizer = "MediaViewerAssociatedObjectKey_mediaViewer"
    }

    fileprivate typealias Action = (() -> Void)?

    // Set our computed property type to a closure
    fileprivate var tapGestureRecognizerAction: Action? {
        set {
            if let newValue = newValue {
                // Computed properties get stored as associated objects
                objc_setAssociatedObject(self, &AssociatedObjectKeys.tapGestureRecognizer, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
            }
        }
        get {
            let tapGestureRecognizerActionInstance = objc_getAssociatedObject(self, &AssociatedObjectKeys.tapGestureRecognizer) as? Action
            return tapGestureRecognizerActionInstance
        }
    }

    // This is the meat of the sauce, here we create the tap gesture recognizer and
    // store the closure the user passed to us in the associated object we declared above
    public func addTapGestureRecognizer(action: (() -> Void)?) {
        self.isUserInteractionEnabled = true
        self.tapGestureRecognizerAction = action
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTapGesture))
        self.addGestureRecognizer(tapGestureRecognizer)
    }

    // Every time the user taps on the UIImageView, this function gets called,
    // which triggers the closure we stored
    @objc fileprivate func handleTapGesture(sender: UITapGestureRecognizer) {
        if let action = self.tapGestureRecognizerAction {
            action?()
        } else {
            print("no action")
        }
    }

}
