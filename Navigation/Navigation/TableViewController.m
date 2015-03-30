//
//  TableViewController.m
//  Navigation
//
//  Created by Patricia Machado de Abreu on 19/03/15.
//  Copyright (c) 2015 Vinicius Miana. All rights reserved.
//

#import "TableViewController.h"
#import "Dictionary.h"
#import "LetraViewController.h"

@interface TableViewController ()

@end

@implementation TableViewController

@synthesize table;

Dictionary *dictionary;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    dictionary = [[Dictionary alloc]init];
//    [dictionary initPage];
    
    table.delegate = self;
    table.dataSource = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 26;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Letra"];
    
    int row = (int) indexPath.row;
    [cell.textLabel setText:[dictionary getLetterDataBasesWithPage:row]];
    [cell.detailTextLabel setText:[dictionary getTextDataBasesWithPage:row]];
    [cell.imageView setImage:[UIImage imageNamed:[dictionary getImageDataBasesWithPage:row]]];
    
    
    return cell;
}



#pragma mark - Navigation


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    LetraViewController *cell = [[LetraViewController alloc]initWithNibName:nil bundle:NULL];
    
    int pagina = (int)[indexPath row];
    [cell setPagina:pagina];
    
    UINavigationController *navigation = [self.tabBarController.viewControllers objectAtIndex:0];
    
    [navigation pushViewController:cell animated:YES];
    
    self.tabBarController.selectedIndex = 0;
}


@end
