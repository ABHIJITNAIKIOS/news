//
//  secondViewController.m
//  panexample
//
//  Created by MAC on 10/03/17.
//  Copyright © 2017 MAC. All rights reserved.
//

#import "secondViewController.h"
#import "secondTableViewCell.h"

@interface secondViewController ()

@end

@implementation secondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 1;
    
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    secondTableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (cell == nil) {
        cell =[[secondTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        
        
    }
    
    cell.label1.text =[_dictlast objectForKey:@"title"];
    cell.label2.text =[_dictlast objectForKey:@"author"];
    cell.label3.text =[_dictlast objectForKey:@"description"];
    cell.label1.textColor =[UIColor redColor];
    cell.label2.textColor =[UIColor redColor];
    cell.label3.textColor =[UIColor redColor];
    return cell;
    
    
    
    
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
