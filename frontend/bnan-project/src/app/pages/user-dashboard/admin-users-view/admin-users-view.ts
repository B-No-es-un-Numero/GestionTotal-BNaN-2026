import { Component } from '@angular/core';

interface UserProps {
  id: number;
  name: string;
  email: string;
  role: string;
}

@Component({
  selector: 'app-admin-users-view',
  standalone: true,
  templateUrl: './admin-users-view.html'
})
export class AdminUsersView {
  users: UserProps[] = [
    { id: 1, name: 'Joaquín García', email: 'joaquin@bnan.com', role: 'Admin' },
    { id: 2, name: 'Lucas Martínez', email: 'lucas@bnan.com', role: 'User' },
    { id: 3, name: 'Sofía López', email: 'sofia@bnan.com', role: 'User' }
  ];

  newUser() {
    alert('Función para crear nuevo usuario');
  }

  viewUser(user: UserProps) {
    alert(`Viendo detalles de: ${user.name}`);
  }

  editUser(user: UserProps) {
    alert(`Editando a: ${user.name}`);
  }

  deleteUser(id: number) {
    if (confirm('¿Seguro que querés eliminar este usuario?')) {
      this.users = this.users.filter(u => u.id !== id);
    }
  }
}
