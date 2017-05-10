import { TestBed, inject } from '@angular/core/testing';

import { ApiPageService } from './api-page.service';

describe('ApiPageService', () => {
  beforeEach(() => {
    TestBed.configureTestingModule({
      providers: [ApiPageService]
    });
  });

  it('should ...', inject([ApiPageService], (service: ApiPageService) => {
    expect(service).toBeTruthy();
  }));
});
