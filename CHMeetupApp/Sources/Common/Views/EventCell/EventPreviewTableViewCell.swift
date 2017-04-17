//
//  EventPreviewTableViewCell.swift
//  CHMeetupApp
//
//  Created by Alexander Zimin on 11/03/2017.
//  Copyright © 2017 CocoaHeads Community. All rights reserved.
//

import UIKit

protocol EventPreviewTableViewCellDelegate: class {
  func eventCellAcceptButtonPressed(_ eventCell: EventPreviewTableViewCell)
}

class EventPreviewTableViewCell: PlateTableViewCell {

  var isEnabledForRegistration = false {
    didSet {
      goingButton.isHidden = !isEnabledForRegistration
    }
  }

  @IBOutlet var eventImageView: UIImageView!

  @IBOutlet var nameLabel: UILabel! {
    didSet {
      nameLabel.font = UIFont.appFont(.gothamPro(size: 17))
    }
  }

  @IBOutlet var dateLabel: UILabel! {
    didSet {
      dateLabel.font = UIFont.appFont(.gothamPro(size: 15))
    }
  }

  @IBOutlet var placeLabel: UILabel! {
    didSet {
      placeLabel.font = UIFont.appFont(.gothamPro(size: 15))
    }
  }

  @IBOutlet var separationView: UIView! {
    didSet {
      separationView.backgroundColor = UIColor(.lightGray)
    }
  }

  @IBOutlet var participantsCollectionViewHeightConstraint: NSLayoutConstraint!
  @IBOutlet var participantsCollectionViewTopConstraint: NSLayoutConstraint!

  @IBOutlet var participantsCollectionView: PhotosPresentationView!

  @IBOutlet var goingButton: UIButton!

  override func awakeFromNib() {
    super.awakeFromNib()

    participantsCollectionView.delegate = self

    roundType = .all
  }

  weak var delegate: EventPreviewTableViewCellDelegate?

  var parcicipantsHeight: CGFloat {
    // 36 paricipant view height, 12 is space from top
    return 48
  }

  var goingButtonHeight: CGFloat {
    // Button with spaces height
    return 64
  }

  @IBAction fileprivate func goingButtonAction(_ sender: Any) {
    delegate?.eventCellAcceptButtonPressed(self)
  }

  // Now would calculate manually
  override func systemLayoutSizeFitting(_ targetSize: CGSize,
                                        withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority,
                                        verticalFittingPriority: UILayoutPriority) -> CGSize {
    var height: CGFloat = 266

    if isEnabledForRegistration == false {
      height -= goingButtonHeight
    }

    if participantsCollectionView.emptyImagesCollection {
      height -= parcicipantsHeight
      height -= separationView.frame.height
    }

    return CGSize(width: targetSize.width, height: height)
  }

  var isCollectionEmpty = false
}

extension EventPreviewTableViewCell: PhotosPresentationViewDelegate {
  func participantsCollectionViewWillUpdateData(view: PhotosPresentationView) {
    if isCollectionEmpty == view.emptyImagesCollection {
      return
    }
    isCollectionEmpty = view.emptyImagesCollection

    if view.emptyImagesCollection {
      separationView.isHidden = true
      participantsCollectionViewHeightConstraint.constant = 0
      participantsCollectionViewTopConstraint.constant = 0
    } else {
      participantsCollectionViewHeightConstraint.constant = 36
      participantsCollectionViewTopConstraint.constant = 12
    }
  }
}
