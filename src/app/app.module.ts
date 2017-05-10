import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { HttpModule } from '@angular/http';
import { RouterModule }  from '@angular/router';

import { ApiHomeService } from './services/api-home.service';
import { ApiPageService } from './services/api-page.service';
import { ApiUserService } from './services/api-user.service';
import { SessionService } from './services/session.service';
import { SearchService } from './services/search.service';
import { UserService } from './services/user.service';
import { UserApiService } from './services/user-api.service';

import { RoutingModule } from './routing.module';

import { BaseComponent } from './base/base.component';
import { HomeComponent } from './home/home.component';
import { ApiHomeComponent } from './apiHome/apiHome.component';
import { ViewApiComponent } from './viewApi/viewApi.component';
import { CategoryComponent } from './category/category.component';
import { MenuComponent } from './menu/menu.component';
import { SearchBarComponent } from './search-bar/search-bar.component';
import { SearchPageComponent } from './search-page/search-page.component';
import { UserPageComponent } from './user-page/user-page.component';
import { UserApiComponent } from './user-api/user-api.component';
import { UserCommentsComponent } from './user-comments/user-comments.component';
import { LoginPageComponent } from './login-page/login-page.component';
import { RegistrationComponent } from './registration/registration.component';
import { NewApiComponent } from './new-api/new-api.component';

@NgModule({
  declarations: [
    BaseComponent,
    ApiHomeComponent,
    ViewApiComponent,
    HomeComponent,
    CategoryComponent,
	MenuComponent,
	SearchBarComponent,
	SearchPageComponent,
	UserPageComponent,
	UserApiComponent,
	UserCommentsComponent,
	LoginPageComponent,
	RegistrationComponent,
	NewApiComponent,
  ],
  imports: [
	RoutingModule,
    BrowserModule,
    FormsModule,
    HttpModule,
  ],
  providers: [
    ApiHomeService,
	ApiPageService,
	SessionService,
	SearchService,
	UserService
  ],
  bootstrap: [BaseComponent]
})
export class AppModule { }
