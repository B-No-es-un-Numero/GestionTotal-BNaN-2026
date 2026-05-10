import { Component } from '@angular/core';
import { Navbar } from '../../shared/navbar/navbar';
import { Footer } from '../../shared/footer/footer';
import { RouterLink } from '@angular/router';

@Component({
  selector: 'app-about',
  imports: [Navbar, Footer, RouterLink],
  templateUrl: './about.html',
  styleUrl: './about.css',
})
export class About {}
