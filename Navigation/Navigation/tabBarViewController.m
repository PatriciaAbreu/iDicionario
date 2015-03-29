//
//  tabBarViewController.m
//  Navigation
//
//  Created by Patricia Machado de Abreu on 19/03/15.
//  Copyright (c) 2015 Vinicius Miana. All rights reserved.
//

#import "tabBarViewController.h"
#import "LetraViewController.h"
#import "TableViewController.h"

@interface tabBarViewController ()

@end

@implementation tabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    LetraViewController *viewController = [[LetraViewController alloc] initWithNibName:nil bundle:nil];
    
    UINavigationController *navegation = [[UINavigationController alloc] initWithRootViewController:viewController];
    
    TableViewController *table = [[TableViewController alloc] init];
    
    NSArray *viewsControllers = [[NSArray alloc] initWithObjects:navegation, table, nil];
    
    [self setViewControllers:viewsControllers];
    
    navegation.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Letras" image:nil tag:1];
    table.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Lista" image:nil tag:2];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
