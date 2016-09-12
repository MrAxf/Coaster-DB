//
//  SubmarineViewController.h
//  Sonar
//
//  Created by Aula1 on 30/11/15.
//  Copyright (c) 2015 Grupo 1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddCoasterViewController.h"
#import "CoasterViewController.h"
#import "SearchViewController.h"

@protocol CoastersViewControllerDelegate

-(void) editionDidFinished;

@end

@interface CoastersViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, AddCoasterViewControllerDelegate, CoasterViewControllerDelegate, SearchViewControllerDelegate>
@property (weak, nonatomic) IBOutlet UITableView *table;
@property (nonatomic, strong) id <CoastersViewControllerDelegate> delegate;

@end
