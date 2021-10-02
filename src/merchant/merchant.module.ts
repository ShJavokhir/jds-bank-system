import { Module } from '@nestjs/common';
import { MerchantService } from './merchant.service';
import { MerchantController } from './merchant.controller';
import { GoodsModule } from './goods/goods.module';
import { TypeOrmModule } from "@nestjs/typeorm";
import { MerchantPayments } from "./merchant.payments.entity";
import { VisaCard } from "../card/card.entity";

@Module({
  providers: [MerchantService],
  controllers: [MerchantController],
  imports: [GoodsModule, TypeOrmModule.forFeature([MerchantPayments]), TypeOrmModule.forFeature([VisaCard])]
})
export class MerchantModule {}
