//
//  TableViewDetailViewController.m
//  segue3
//
//  Created by mac  on 13-5-10.
//  Copyright (c) 2013年 mac . All rights reserved.
//

#import "TableViewDetailViewController.h"

@interface TableViewDetailViewController ()

@end

@implementation TableViewDetailViewController
@synthesize recipesName;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.recipLable.text=recipesName;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
