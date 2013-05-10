//
//  TableViewViewController.m
//  segue3
//
//  Created by mac  on 13-5-10.
//  Copyright (c) 2013年 mac . All rights reserved.
//

#import "TableViewViewController.h"
#import "TableViewDetailViewController.h"

@interface TableViewViewController ()

@end

@implementation TableViewViewController{
    NSArray *recipes;
    NSArray *searchResults;
}

@synthesize theTableView;

- (void)viewDidLoad
{
    [super viewDidLoad];
    recipes = [NSArray arrayWithObjects:@"1青椒炒蛋",@"2拍黄瓜",@"3木耳炒肉",@"4青龙过海",@"5宫保鸡丁",@"6芹菜炒肉",@"7鱼香肉丝",@"8梅菜扣肉",@"9桂林米粉",@"10老友粉",@"11螺蛳粉", nil];
  //  menuArray=[[NSMutableArray alloc]initWithObjects:@"1青椒炒蛋",@"2拍黄瓜",@"3木耳炒肉",@"4青龙过海",@"5宫保鸡丁",@"6芹菜炒肉",@"7鱼香肉丝",@"8梅菜扣肉",@"9桂林米粉",@"10老友粉",@"11螺蛳粉", nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView==self.searchDisplayController.searchResultsTableView) {
        return [searchResults count];
    }
    return [recipes count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* indentifierCell=@"myCell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:indentifierCell];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indentifierCell];
    }
    if (tableView==self.searchDisplayController.searchResultsTableView) {
        cell.textLabel.text=[searchResults objectAtIndex:indexPath.row];
    }else{
        cell.textLabel.text=[recipes objectAtIndex:indexPath.row];
    }
    return cell;
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"mySegue"]) {
        TableViewDetailViewController *detail=segue.destinationViewController;
        NSIndexPath *indexPath=nil;
        if ([self.searchDisplayController isActive]) {
            indexPath=[self.searchDisplayController.searchResultsTableView indexPathForSelectedRow];
            detail.recipesName=[searchResults objectAtIndex:indexPath.row];
        }else{
            indexPath=[self.theTableView indexPathForSelectedRow];
            detail.recipesName=[recipes objectAtIndex:indexPath.row];
        }
    }
}

-(void)filterContentForSearchText:(NSString *)searchText scope:(NSString *)scope
{
    NSPredicate *resultPredicate = [NSPredicate predicateWithFormat:@"SELF contains[cd] %@", searchText];
    
    searchResults = [recipes filteredArrayUsingPredicate:resultPredicate];
}

-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{
    [self filterContentForSearchText:searchString scope:nil];
    
    return YES;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView==self.searchDisplayController.searchResultsTableView) {
        [self performSegueWithIdentifier:@"mySegue" sender:self];
    }
}

@end
