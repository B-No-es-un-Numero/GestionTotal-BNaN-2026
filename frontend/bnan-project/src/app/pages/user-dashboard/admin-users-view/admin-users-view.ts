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
  template: `
    
    <div class="d-flex justify-content-between align-items-center mb-3">
      <h4 class="mb-0">Gestión de Usuarios</h4>
      <button class="btn btn-sm btn-purple" (click)="newUser()">
    <i class="bi bi-plus-lg"></i> Nuevo Usuario
  </button>
    </div>

    
    <div class="mb-3">
      <div class="input-group">
        <span class="input-group-text bg-white border-end-0">
          <i class="bi bi-search"></i>
        </span>
        <input type="text" class="form-control border-start-0" placeholder="Buscar usuarios por nombre o email..." />
      </div>
    </div>

    <!-- TABLE CARD -->
    <div class="card border-0 shadow-sm">
      <div class="table-responsive">
        <table class="table align-middle mb-0">
          <thead class="bg-light">
            <tr>
              <th>ID</th>
              <th>Nombre</th>
              <th>Email</th>
              <th>Rol</th>
              <th class="text-end">Acciones</th>
            </tr>
          </thead>
          <tbody>
            @for (user of users; track user.id) {
              <tr>
                <td class="text-muted fw-bold">#{{ user.id }}</td>
                <td>{{ user.name }}</td>
                <td>{{ user.email }}</td>
                <td>
                 
                  @if (user.role === 'Admin') {
                    <span class="badge bg-primary-subtle text-primary">Administrador</span>
                  } @else {
                    <span class="badge bg-secondary-subtle text-secondary">Usuario</span>
                  }
                </td>
                <td class="text-end">
                 
                  <button class="btn btn-sm btn-outline-primary me-2" (click)="viewUser(user)">
                    <i class="bi bi-eye"></i>
                  </button>
                  <button class="btn btn-sm btn-outline-primary me-2" (click)="editUser(user)">
                    <i class="bi bi-pencil"></i>
                  </button>
                  <button class="btn btn-sm btn-outline-danger" (click)="deleteUser(user.id)">
                    <i class="bi bi-trash"></i>
                  </button>
                </td>
              </tr>
            }
          </tbody>
        </table>
      </div>
    </div>
  `
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
