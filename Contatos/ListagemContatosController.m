//
//  ListagemContatosController.m
//  Contatos
//
//  Created by ios2686 on 08/05/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ListagemContatosController.h"

@interface ListagemContatosController ()

@end

@implementation ListagemContatosController

@synthesize contatos;

-(void) viewDidLoad{
    self.title = @"Contatos";
    //self.contatos=[[NSMutableArray alloc] initWithObjects:@"CaelumSP", @"CaelumRJ", @"CaelumBSB", nil];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.contatos count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //static NSString *CellIdeintifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    
    cell.textLabel.text=[self.contatos objectAtIndex:indexPath.row];
    
    return cell;
}


@end
