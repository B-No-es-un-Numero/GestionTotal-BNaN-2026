import { Component, inject } from '@angular/core';
import { RouterLink } from '@angular/router';
import { ClientService } from '../../../services/client-service';

@Component({
  selector: 'app-client-list-view',
  imports: [RouterLink],
  templateUrl: './client-list-view.html',
  styleUrl: './client-list-view.css',
})
export class ClientListView {
   clientList: any;
   private clientService= inject(ClientService);

  constructor(){
    this.clientList = this.clientService.getClientList().subscribe({
      next: (data) => {
        this.clientList=data;
      },
      error: (error) => console.error(error),
      complete: () => console.info('complete')
    }) 

  }

}