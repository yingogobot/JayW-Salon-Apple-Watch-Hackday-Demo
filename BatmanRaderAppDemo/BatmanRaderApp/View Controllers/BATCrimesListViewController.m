//
//  BATvillainListViewController.m
//  BatmanRaderApp
//
//  Created by Yin Xu on 7/1/15.
//  Copyright (c) 2015 YXApp. All rights reserved.
//

#import "BATCrimesListViewController.h"
#import "BATCrimeDetailViewController.h"
#import "BATCrimeTableViewCell.h"

#import "BATCrimesDataSource.h"

@interface BATCrimesListViewController ()

@end

@implementation BATCrimesListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerNib:[UINib nibWithNibName:@"BATCrimeTableViewCell" bundle:nil] forCellReuseIdentifier:@"BATCrimeTableViewCell"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"pushToCrimeDetailViewSegue"])
    {
        BATCrimeDetailViewController *vc = segue.destinationViewController;
        vc.crime = sender;
    }
}


#pragma mark - UITableView DataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[BATCrimesDataSource sharedInstance].crimesObjectArray count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 130;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    BATCrimeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BATCrimeTableViewCell"];
    [cell setupCellByCrime:[BATCrimesDataSource sharedInstance].crimesObjectArray[indexPath.row]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"pushToCrimeDetailViewSegue" sender:[BATCrimesDataSource sharedInstance].crimesObjectArray[indexPath.row]];
}

@end
