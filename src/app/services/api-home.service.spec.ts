import { TestBed, inject } from '@angular/core/testing';

import { ApiHomeService } from './api-home.service';

describe('ApiHomeService', () => {
  beforeEach(() => {
    TestBed.configureTestingModule({
      providers: [ApiHomeService]
    });
  });

  it('should ...', inject([ApiHomeService], (service: ApiHomeService) => {
    expect(service).toBeTruthy();
  }));
});
