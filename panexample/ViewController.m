//
//  ViewController.m
//  panexample
//
//  Created by MAC on 10/03/17.
//  Copyright © 2017 MAC. All rights reserved.
//

#import "ViewController.h"
#import "TableViewCell.h"
#import "secondViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *str = @"https://newsapi.org/v1/articles?source=techcrunch&apiKey=efe99de73d1d49608eb3d4e87c536b26";
    NSURL *url =[NSURL URLWithString:str];
    NSData *data =[NSData dataWithContentsOfURL:url];
    
    NSError *error;
    
    if (data == nil) {
        NSLog(@"%@", error.localizedDescription);
        
        
    }
    else{
        
        dict =[NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
        
        array =[dict objectForKey:@"articles"];
        
        
        
        
    }
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return array.count;
    
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    TableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (cell == nil) {
        cell =[[TableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    
   dict2 =[array objectAtIndex:indexPath.row];
    
    
    cell.label1.text =[dict2 objectForKey:@"author"];
    cell.label2.text =[dict2 objectForKey:@"description"];
    cell.label3.text =[dict2 objectForKey:@"title"];
    
    
    NSString *strurl =[dict2 objectForKey:@"urlToImage"];
    
    NSURL *imageurl =[NSURL URLWithString:strurl];
    
    NSData *dataimage =[NSData dataWithContentsOfURL:imageurl];
    
    UIImage *imge =[UIImage imageWithData:dataimage];
    
    cell.image.image = imge;
    
    
    return cell;
    
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [self performSegueWithIdentifier:@"seque" sender:nil];
    
    
    
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    secondViewController *second =[segue destinationViewController];
    
    second.dictlast =[array objectAtIndex:[_table indexPathForSelectedRow].row];
    
    
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)sort:(id)sender {
    
   NSSortDescriptor *descript =[NSSortDescriptor sortDescriptorWithKey:@"author" ascending:YES];
    
    NSArray *sortedarray =[array sortedArrayUsingDescriptors:@[descript]];
    
    array  =sortedarray;
    [_table reloadData];
    
}
@end
