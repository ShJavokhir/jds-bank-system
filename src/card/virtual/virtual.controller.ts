import { Controller, Get, Post } from '@nestjs/common';

@Controller('card/virtual')
export class VirtualController {
  @Post('create')
  createVirtualCard(): any {
    return 'Created virtual card';
  }

  @Post('deactivate')
  deactivateVirtualCard(): any {
    return 'Virtual card deactivated';
  }

  @Post('activate')
  activateVirtualCard(): any {
    return 'Virtual card activated';
  }

  @Get('getBalance')
  getVirtualCardBalance(): any {
    return 'Card balance';
  }

  @Get('getCashback')
  getVirtualCardCashback(): any {
    return 'Card cashback';
  }

  @Post('depositMoney')
  depositMoneyVirtualCard(): any {
    return 'deposit money';
  }
}
