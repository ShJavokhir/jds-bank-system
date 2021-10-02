import { Module } from '@nestjs/common';
import { TransactionService } from './transaction.service';
import { TransactionController } from './transaction.controller';
import { TypeOrmModule } from "@nestjs/typeorm";
import { VisaCard } from "../card/card.entity";
import { MoneyTransfer } from "./money.transfers.entity";

@Module({
  providers: [TransactionService],
  controllers: [TransactionController],
  imports: [TypeOrmModule.forFeature([MoneyTransfer,VisaCard]),]
})
export class TransactionModule {}
