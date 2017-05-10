import { TestBed, inject } from '@angular/core/testing';

import { NewApiService } from './new-api.service';

describe('NewApiService', () => {
  beforeEach(() => {
    TestBed.configureTestingModule({
      providers: [NewApiService]
    });
  });

  it('should ...', inject([NewApiService], (service: NewApiService) => {
    expect(service).toBeTruthy();
  }));
});
