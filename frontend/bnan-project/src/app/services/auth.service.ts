import { Injectable } from '@angular/core';
// Aca va ir la logica de auth (login, registro, logout, etc)

@Injectable({ providedIn: 'root' })
export class AuthService {
    // Cambiar esto a 'false' para probar la vista de un usuario normal
    isAdmin: boolean = true;
}