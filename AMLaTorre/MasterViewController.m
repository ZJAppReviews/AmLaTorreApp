//
//  MasterViewController.m
//  AMLaTorre
//
//  Created by Marco on 20/11/14.
//  Copyright (c) 2014 tmac12. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"


@interface MasterViewController ()

@property NSMutableArray *objects;
@end

@implementation MasterViewController

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    self.navigationItem.leftBarButtonItem = self.editButtonItem;
//
//    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
//    self.navigationItem.rightBarButtonItem = addButton;
    
    _app = [[UIApplication sharedApplication] delegate];
    
    [self.tableView reloadData];
    
    
}

-(void)viewWillAppear:(BOOL)animated
{
    self.navigationItem.title = @"AM La Torre";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)insertNewObject:(id)sender {
    if (!self.objects) {
        self.objects = [[NSMutableArray alloc] init];
    }
    [self.objects insertObject:[NSDate date] atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        
        List *object = _app.listArray[indexPath.row];
        //NSDate *object = self.objects[indexPath.row];
        [[segue destinationViewController] setDetailItem:object];
    }
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //return self.objects.count;
    
    return [_app.listArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    List *object = _app.listArray[indexPath.row];
    NSLog(@"%@", object.avversario);
    /*
    cell.textLabel.text =  object.avversario;
    
    NSString *dataOra = object.data;
    dataOra = [dataOra stringByAppendingString:@" - "];
    dataOra = [dataOra stringByAppendingString:object.ora];
    cell.detailTextLabel.text = dataOra;
    */
    
    UILabel *avversarioLabel = (UILabel *) [cell viewWithTag:10];
    avversarioLabel.text = object.avversario;
    
    UILabel *dataLabel = (UILabel *) [cell viewWithTag:2];
    dataLabel.text = object.data;
    
    UILabel *oraLabel = (UILabel *) [cell viewWithTag:3];
    oraLabel.text = object.ora;
    
    UIImageView *immagine = (UIImageView *) [cell viewWithTag:1];
    NSString *nomeImg = @"cars.png";
    if ([object.luogo isEqualToString:@"Crespano del Grappa"]) {
        nomeImg = @"home.png";
    }
    
    immagine.image = [UIImage imageNamed:nomeImg];
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return NO;
}


@end
