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
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
//    NSLog(@"pppp %i", [dictionary getNumberOfLetters]);
//    return [dictionary getNumberOfLetters];
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


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    LetraViewController *cell = [[LetraViewController alloc]initWithNibName:nil bundle:NULL];
    
    int pagina = (int)[indexPath row];
    [cell setPagina:pagina];
    
    UINavigationController *navigation = [self.tabBarController.viewControllers objectAtIndex:0];
    
    [navigation pushViewController:cell animated:YES];
    
    self.tabBarController.selectedIndex = 0;
}
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
//    if([segue.identifier isEqualToString:@"MostrarDetalhes"]){
//        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
//        AppDetalhesViewController *appView = segue.destinationViewController;
//        
//        long row = [indexPath row];
//        NSArray *aux = [NSArray arrayWithObjects:[nome objectAtIndex:row], [categoria objectAtIndex:row], [imagem objectAtIndex:row], nil];
//        appView.dados = aux;
//    }
    
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end
