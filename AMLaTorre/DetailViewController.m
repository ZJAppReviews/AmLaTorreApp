//
//  DetailViewController.m
//  AMLaTorre
//
//  Created by Marco on 20/11/14.
//  Copyright (c) 2014 tmac12. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem {
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
            
        // Update the view.
        [self configureView];
    }
}

- (void)configureView {
    // Update the user interface for the detail item.
    
    self.navigationController.navigationBar.topItem.title = @"";
    
    self.title = _detailItem.avversario;
    
    _lblAvversario.text = _detailItem.avversario;
    
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd/MM/yyyy"];
    
    NSDate *date = [NSDate date];
    date = [dateFormatter dateFromString:_detailItem.data];
    //NSString *formattedDateString = [dateFormatter stringFromDate:date];
    NSLog(@"formattedDateString: %@", date);
    
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSInteger units = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekdayCalendarUnit;
    NSDateComponents *components = [calendar components:units fromDate:date];
    NSInteger year = [components year];
    NSInteger month=[components month];       // if necessary
    NSInteger day = [components day];
    NSInteger weekday = [components weekday]; // if necessary
    
    NSDateFormatter *weekDay = [[NSDateFormatter alloc] init] ;
    [weekDay setDateFormat:@"EEEE"];
    
    NSString *dataCompleta = [weekDay stringFromDate:date];
    _lblNomeGiorno.text = dataCompleta;
    
    _lblData.text = _detailItem.data;
    _lblOra.text = _detailItem.ora;
    //_lblIndirizzoPalestra.text = _detailItem.luogo;
    [_txtIndirizzoPalestra setText: _detailItem.luogo];
    
    NSString *nomeImg = @"cars.png";
    if ([_detailItem.luogo isEqualToString:@"Crespano del Grappa"]) {
        nomeImg = @"home.png";
    }
    
    _imgCasaTrasferta.image = [UIImage imageNamed:nomeImg];
    
    /*
    if (self.detailItem) {
        self.detailDescriptionLabel.text = [self.detailItem description];
    }
     */
}

- (void)viewDidLoad {
    //self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Indietro" style:UIBarButtonItemStylePlain target:nil action:nil];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self configureView];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
