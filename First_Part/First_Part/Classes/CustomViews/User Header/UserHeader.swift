//
//  UserHeader.swift
//  First_Part
//
//  Created by PavelM on 29/03/2019.
//  Copyright © 2019 PavelM. All rights reserved.
//

import UIKit

class UserHeaderView: UIView, NibLoadable {
  
  @IBOutlet private weak var avatarView: UIImageView!
  @IBOutlet private weak var userNameLabel: UILabel!
  
  
  override func awakeFromNib() {
    super.awakeFromNib()
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    avatarView.round()
  }
  

}
