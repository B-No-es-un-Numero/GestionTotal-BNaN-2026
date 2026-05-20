import { Component, inject, OnInit, signal } from '@angular/core';
import { RouterLink } from '@angular/router';
import { ClientService } from '../../../services/client-service';

@Component({
  selector: 'app-client-list-view',
  imports: [RouterLink],
  templateUrl: './client-list-view.html',
  styleUrl: './client-list-view.css',
})
export class ClientListView implements OnInit {
   clientList= signal<any>({} as any);
   private clientService= inject(ClientService);

  ngOnInit(): void {
    this.clientService.getClientList().subscribe({
      next: (data) => {
        this.clientList.set(data);
      },
      error: (error) => console.error(error),
      complete: () => console.info('complete')
    }) 

}
}