//
//  SFEarTrainingItemsViewController.m
//  SonicFit
//
//  Created by Nihar Mehta on 1/25/14.
//  Copyright (c) 2014 FUHSD. All rights reserved.
//

#import "SFEarTrainingItemsViewController.h"
#import "SFEarTrainingExerciseViewController.h"

@interface SFEarTrainingItemsViewController ()

@end

@implementation SFEarTrainingItemsViewController

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0)
    {
        SFEarTrainingExerciseViewController *exerciseVc = [[SFEarTrainingExerciseViewController alloc] initWithNibName:@"SFEarTrainingExerciseLevel1" bundle:nil];
        exerciseVc.level = 1;
        [self.navigationController pushViewController:exerciseVc animated:YES];
    }
    else if (indexPath.row == 1)
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
        cell.textLabel.text = @"Exercise Level 1";
    }
    else if (indexPath.row == 1)
    {
        cell.textLabel.text = @"Exercise Level 2";
    }
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

- (instancetype) init
{
    self = [super initWithStyle:UITableViewStylePlain];
    if(self)
    {
        UINavigationItem *navItem = self.navigationItem;
        navItem.title = @"Ear Training";
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
