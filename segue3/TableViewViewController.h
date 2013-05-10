//
//  TableViewViewController.h
//  segue3
//
//  Created by mac  on 13-5-10.
//  Copyright (c) 2013年 mac . All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) IBOutlet UITableView *theTableView;
@end
