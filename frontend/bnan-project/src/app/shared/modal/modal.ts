import { Component, input, output } from '@angular/core';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-modal',
  imports: [CommonModule],
  templateUrl: './modal.html',
  styleUrl: './modal.css',
})
export class Modal {
  title = input<string>('Información');
  size = input<'sm' | 'md' | 'lg'>('md');
  isOpen = input<boolean>(false);

  close = output<void>();

  onClose() {
    this.close.emit();
  }
}
