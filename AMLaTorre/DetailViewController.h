//
//  DetailViewController.h
//  AMLaTorre
//
//  Created by Marco on 20/11/14.
//  Copyright (c) 2014 tmac12. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

