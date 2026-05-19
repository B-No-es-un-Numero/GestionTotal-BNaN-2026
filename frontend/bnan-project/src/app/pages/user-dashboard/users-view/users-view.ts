import { CommonModule } from '@angular/common';
import { Component, signal } from '@angular/core';
import { Modal } from '../../../shared/modal/modal';
import { FormBuilder, FormGroup, FormsModule, ReactiveFormsModule, Validators } from '@angular/forms';

interface UserProps {
  id: number;
  name: string;
  email: string;
  role: string;
}

@Component({
  selector: 'app-users-view',
  imports: [CommonModule, Modal, FormsModule, ReactiveFormsModule],
  templateUrl: './users-view.html'
})
export class UsersView {
  users: UserProps[] = [
    { id: 1, name: 'Joaquín García', email: 'joaquin@bnan.com', role: 'Admin' },
    { id: 2, name: 'Lucas Martínez', email: 'lucas@bnan.com', role: 'User' },
    { id: 3, name: 'Sofía López', email: 'sofia@bnan.com', role: 'User' }
  ];
  
  userForm: FormGroup;

  isEditModalOpen = signal(false);
  isDeleteModalOpen = signal(false);
  isViewModalOpen = signal(false);isAddModalOpen = signal(false);
  selectedUser = signal<UserProps | null>(null);

  constructor(private fb: FormBuilder) {
    this.userForm = this.fb.group({
      name: ['', [Validators.required, Validators.minLength(3)]],
      email: ['', [Validators.required, Validators.email]],
      role: ['User', Validators.required]
    });
  }

  newUser() {
    this.userForm.reset({ role: 'User' });
    this.isAddModalOpen.set(true);
  }

  saveNewUser() {
    if (this.userForm.valid) {
      console.log('Simulando creación de:', this.userForm.value);
      this.closeModals();
    } else {
      this.userForm.markAllAsTouched();
    }
  }

  editUser(user: UserProps) {
    this.selectedUser.set(user);
    this.isEditModalOpen.set(true);
  }

  deleteUser(id: number) {
    this.isDeleteModalOpen.set(true);
  }

  viewUser(user: UserProps) {
    this.selectedUser.set(user);
    this.isViewModalOpen.set(true);
  }

  closeModals() {
    this.isAddModalOpen.set(false);
    this.isEditModalOpen.set(false);
    this.isViewModalOpen.set(false);
    this.isDeleteModalOpen.set(false);
  }
}
