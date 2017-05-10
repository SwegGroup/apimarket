import { NgModule } from '@angular/core';
import { Routes, RouterModule }  from '@angular/router';

import { HomeComponent } from './home/home.component';
import { CategoryComponent } from './category/category.component';
import { ViewApiComponent } from './viewApi/viewApi.component';
import { SearchPageComponent } from './search-page/search-page.component';
import { UserPageComponent } from './user-page/user-page.component';
import { UserApiComponent } from './user-api/user-api.component';
import { UserCommentsComponent } from './user-comments/user-comments.component';
import { LoginPageComponent } from './login-page/login-page.component';
import { RegistrationComponent } from './registration/registration.component'; 
import { NewApiComponent } from './new-api/new-api.component';

const routes : Routes = [
    { path: "category", component: CategoryComponent },
    { path: '', component: HomeComponent },
	{ path: 'api/:name', component: ViewApiComponent },
	{ path: 'category/:cat', component: CategoryComponent },
	{ path: 'search/:cat/:key', component: SearchPageComponent },
	{ path: 'user', component: UserPageComponent },
	{ path: 'user/userApi', component: UserApiComponent },
	{ path: 'user/comments', component: UserCommentsComponent },
	{ path: 'login', component: LoginPageComponent },
	{ path: 'registration', component: RegistrationComponent },
	{ path: 'user/newApi', component: NewApiComponent }
];

export const RoutingModule = RouterModule.forRoot(routes);

