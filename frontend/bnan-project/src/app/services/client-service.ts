import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root',
})
export class ClientService {
  url="http://localhost:8000/api/clientes"
  constructor(private http:HttpClient){}

  public getClientList(){
    return this.http.get(this.url);
  }

}