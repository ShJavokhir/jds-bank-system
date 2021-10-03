import { Body, Controller, Get, Post } from "@nestjs/common";
import { MerchantService } from "./merchant.service";
import { PayForGoodsDto } from "./dto/pay.for.goods.dto";
import { VisaCardDto } from "../card/dto/visa.card.dto";

@Controller('merchant')
export class MerchantController {
  constructor(private merchantService: MerchantService) {

  }

  @Post('payForGoods')
  payForGoods(@Body() payForGoodsDto: PayForGoodsDto): any {
    return this.merchantService.payForGoods(payForGoodsDto);
  }

  @Post('getPaysForGoods')
  getPaysForGoods(@Body() visaCardDto: VisaCardDto): any {
    return this.merchantService.getPaysForGoods(visaCardDto);
  }
}
