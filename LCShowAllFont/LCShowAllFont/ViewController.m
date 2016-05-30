//
//  ViewController.m
//  LCShowAllFont
//
//  Created by luanchen on 16/5/30.
//  Copyright © 2016年 luanchen. All rights reserved.
//

#import "ViewController.h"


#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

@interface ViewController()<UITableViewDelegate>
{
    NSMutableArray *_dataSource;
}
@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.view.frame = CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT-64);;
    
    _dataSource =[[NSMutableArray alloc]initWithArray:[UIFont familyNames]];
    
    [self.navigationItem setTitle:@"All Support Font"];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _dataSource.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray *fontNames =[[NSArray alloc]initWithArray:[UIFont fontNamesForFamilyName:[_dataSource objectAtIndex:section]]];
    return fontNames.count;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return [_dataSource objectAtIndex:section];
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"cell";
    UITableViewCell  *cell = (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        
    }
    NSInteger row = [indexPath row];
    
    
    NSArray *fontNames =[[NSArray alloc]initWithArray:[UIFont fontNamesForFamilyName:[_dataSource objectAtIndex:[indexPath section]]]];
    cell.textLabel.text =  [NSString stringWithFormat:@"abps->%@",[fontNames objectAtIndex:row]];
    cell.textLabel.font = [UIFont fontWithName:[fontNames objectAtIndex:row] size:16];
    
    cell.accessoryType=UITableViewCellStyleDefault;
    
    return cell;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}


@end