import { Body, Controller, Get, Post } from "@nestjs/common";
import { VirtualService } from "./virtual.service";
import { VisaCardDto } from "../dto/visa.card.dto";

@Controller('card/virtual')
export class VirtualController {
  constructor(private virtualCardService: VirtualService ) {
  }

  @Post('getCardInfo')
  getCardInfo(@Body() visaCard: VisaCardDto) {
    return this.virtualCardService.getCardInfo(visaCard);
  }

  @Post('create')
  createVirtualCard(@Body() fullName: {fullName:string}): any {
    return this.virtualCardService.createVirtualVisaCard(fullName.fullName);
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
  getVirtualCardBalance(@Body() visaCard: VisaCardDto): any {
    return this.virtualCardService.getBalance(visaCard);
  }

  @Get('getCashback')
  getVirtualCardCashback(@Body() visaCard: VisaCardDto): any {
    return this.virtualCardService.getCashback(visaCard);
  }

  @Post('depositMoney')
  depositMoneyVirtualCard(): any {
    return 'deposit money';
  }
}
