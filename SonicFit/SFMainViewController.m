//
//  SFMainViewController.m
//  SonicFitApp
//
//  Created by Nihar Mehta on 1/25/14.
//  Copyright (c) 2014 FUHSD. All rights reserved.
//

#import "SFMainViewController.h"
#import "SFEarTrainingItemsViewController.h"
#import "SFProfileViewController.h"
#import "SFEarTrainingExerciseViewController.h"

@interface SFMainViewController ()

@end

@implementation SFMainViewController

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0)
    {
        SFProfileViewController *profileViewController = [[SFProfileViewController alloc] init];
        [self.navigationController pushViewController:profileViewController animated:YES];
    }
    else if (indexPath.row == 1)
    {
        SFEarTrainingExerciseViewController *exerciseVc = [[SFEarTrainingExerciseViewController alloc] initWithNibName:@"SFEarTrainingExerciseLevel2" bundle:nil];
        exerciseVc.level = 1;
        [self.navigationController pushViewController:exerciseVc animated:YES];

//        SFEarTrainingItemsViewController *etItemsViewController = [[SFEarTrainingItemsViewController alloc] init];
//        [self.navigationController pushViewController:etItemsViewController animated:YES];
    }
    else if (indexPath.row == 2)
    {
        SFEarTrainingExerciseViewController *exerciseVc = [[SFEarTrainingExerciseViewController alloc] initWithNibName:@"SFEarTrainingExerciseLevel2" bundle:nil];
        exerciseVc.level = 2;
        [self.navigationController pushViewController:exerciseVc animated:YES];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    
//    NSArray *items = [[BNRItemStore sharedStore] allItems];
//    BNRItem *item = items[indexPath.row];
//    cell.textLabel.text = [item description];

    if (indexPath.row == 0)
    {
        cell.textLabel.text = @"Your Profile";
    }
    else if (indexPath.row == 1)
    {
        cell.textLabel.text = @"Ear Training Level 1";
    }
    else if (indexPath.row == 2)
    {
        cell.textLabel.text = @"Ear Training Level 2";
    }

    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (instancetype) init
{
    self = [super initWithStyle:UITableViewStylePlain];
    if(self)
    {
        UINavigationItem *navItem = self.navigationItem;
        navItem.title = @"SonicFit";
        
//        UIBarButtonItem *bbi = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addNewItem:)];
//        
//        navItem.rightBarButtonItem = bbi;
//        navItem.leftBarButtonItem = self.editButtonItem;
    }
    return self;
}

- (instancetype) initWithStyle:(UITableViewStyle)style
{
    return [self init];
}

- (void) viewDidLoad
{
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

@end
