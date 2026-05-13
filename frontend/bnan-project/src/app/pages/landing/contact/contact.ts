import { CommonModule } from '@angular/common';
import { Component } from '@angular/core';
import { FormsModule, NgForm } from '@angular/forms';

@Component({
  selector: 'app-contact',
  standalone: true,
  imports: [CommonModule, FormsModule],
  templateUrl: './contact.html',
  styleUrl: './contact.css',
})
export class Contact {
  formData = {
    name: '',
    email: '',
    company: '',
    message: ''
  };

  handleSubmit(f: NgForm) {

    
    if (f.valid) {
      console.log('Datos del formulario:', this.formData);
          alert('¡Gracias por contactarnos! Nos pondremos en contacto contigo pronto.');

          f.resetForm();
    }
  }
}
