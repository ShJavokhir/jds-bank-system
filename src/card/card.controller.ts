import { Controller, Post } from '@nestjs/common';

@Controller('card')
export class CardController {
  @Post('virtual')
  createVirtualCard(): any {
    return 'creating virtual card...';
  }
}
