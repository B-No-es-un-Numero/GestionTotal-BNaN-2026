import { Routes } from '@angular/router';
import { Home } from './pages/landing/home/home';
import { About } from './pages/about/about';
import { UserDashboard } from './pages/user-dashboard/user-dashboard';
import { ClientListView } from './pages/user-dashboard/client-list-view/client-list-view';
import { ClientDetailView } from './pages/user-dashboard/client-detail-view/client-detail-view';
import { ClientForm } from './pages/user-dashboard/client-form/client-form';
import { AdminUsersView } from './pages/user-dashboard/admin-users-view/admin-users-view';
import { Login } from './pages/auth/login/login';
import { TeamMemberDetail } from './pages/team-member-detail/team-member-detail';

export const routes: Routes = [
  // { path: "registro", component: Register },
  { path: "iniciar-sesion", component: Login },
  //{ path: "dashboard", component: DashboardLayout,
  //children: [
  //{ path: 'clients', component: Clients },
  //{ path: "clients/:id", component: ClientDetail },

  // Cuando este funcional, agregar un [AdminGuard]
  //{ path: "users", component: Users},
  //{ path: "users/:id", component: UserDetail },
  //{ path: "", redirectTo: "clients", pathMatch: "full" }
  //]
  //},
  {
    path: 'dashboard',
    component: UserDashboard,
    children: [
      { path: '', redirectTo: 'clientes', pathMatch: 'full' },
      { path: 'clientes', component: ClientListView },
      { path: 'clientes-detalle/:id', component: ClientDetailView },
      { path: 'clientes-form/:id?', component: ClientForm },
      { path: 'usuarios', component: AdminUsersView }
    ],
  },
  { path: '', component: Home },
  { path: 'about', component: About },
  {path: 'about/:id',component: TeamMemberDetail},
  //{ path: "**", component: Page404 },
];
