import { Injectable } from '@angular/core';

@Injectable({ providedIn: 'root' })
export class AuthService {
    // Cambiar esto a 'false' para probar la vista de un usuario normal
    isAdmin: boolean = true;
    private readonly TOKEN_KEY = 'bnan_token';

    login(token: string): void {
        localStorage.setItem(this.TOKEN_KEY, token);
    }

    logout(): void {
        localStorage.removeItem(this.TOKEN_KEY);
    }

    getToken(): string | null {
        return localStorage.getItem(this.TOKEN_KEY);
    }

    isAuthenticated(): boolean {
        return !!this.getToken();
    }
}