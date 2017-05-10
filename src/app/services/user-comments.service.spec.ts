import { TestBed, inject } from '@angular/core/testing';

import { UserCommentsService } from './user-comments.service';

describe('UserCommentsService', () => {
  beforeEach(() => {
    TestBed.configureTestingModule({
      providers: [UserCommentsService]
    });
  });

  it('should ...', inject([UserCommentsService], (service: UserCommentsService) => {
    expect(service).toBeTruthy();
  }));
});
