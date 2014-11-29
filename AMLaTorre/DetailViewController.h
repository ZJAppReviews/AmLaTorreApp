//
//  DetailViewController.h
//  AMLaTorre
//
//  Created by Marco on 20/11/14.
//  Copyright (c) 2014 tmac12. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "List.h"

@interface DetailViewController : UIViewController

@property (strong, nonatomic) List* detailItem; //id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *lblAvversario;
@property (weak, nonatomic) IBOutlet UILabel *lblOra;
@property (weak, nonatomic) IBOutlet UILabel *lblData;
@property (weak, nonatomic) IBOutlet UIImageView *imgCasaTrasferta;
@property (weak, nonatomic) IBOutlet UILabel *lblNomeGiorno;
@property (weak, nonatomic) IBOutlet UITextView *txtIndirizzoPalestra;

@end

