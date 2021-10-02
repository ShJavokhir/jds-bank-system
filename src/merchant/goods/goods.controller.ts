import { Controller, Get } from "@nestjs/common";
import { GoodsService } from "./goods.service";

@Controller('merchant/goods')
export class GoodsController {
  constructor(private goodsService: GoodsService) {

  }

  @Get()
  getAllGoods(): any {
    return this.goodsService.getAllGoods();
  }
}
