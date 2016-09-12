//
//  SubmarineViewController.h
//  Sonar
//
//  Created by Aula1 on 30/11/15.
//  Copyright (c) 2015 Grupo 1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddSubmarineViewController.h"
#import "SamplesViewController.h"

@interface SubmarineViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, AddSubmarineViewControllerDelegate, SamplesViewControllerDelegate>
@property (weak, nonatomic) IBOutlet UITableView *table;

@end
