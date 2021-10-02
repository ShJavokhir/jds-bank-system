import { Body, Controller, Get, Post } from "@nestjs/common";
import { VirtualService } from "./virtual.service";
import { VisaCardDto } from "../dto/visa.card.dto";

@Controller('card/virtual')
export class VirtualController {
  constructor(private virtualCardService: VirtualService ) {
  }

  @Post('create')
  createVirtualCard(): any {
    return this.virtualCardService.createVirtualVisaCard();
  }

  @Post('deactivate')
  deactivateVirtualCard(@Body() visaCard: VisaCardDto): any {
    return this.virtualCardService.deactivateCard(visaCard);
  }

  @Post('activate')
  activateVirtualVisaCard(@Body() visaCard: VisaCardDto): any {
    return this.virtualCardService.activateCard(visaCard);
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
