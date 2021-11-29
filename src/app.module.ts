import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { CardModule } from './card/card.module';
import { TypeOrmModule } from '@nestjs/typeorm';
import { GeneratorModule } from './generator/generator.module';
import { TransactionModule } from './transaction/transaction.module';
import { MerchantModule } from './merchant/merchant.module';
import { VisaCard } from "./card/card.entity";

@Module({
  imports: [
    CardModule,
    TypeOrmModule.forRoot({
      type: 'sqlite',
      database: 'jds-banking',
      //entities: [VisaCard],
      synchronize: true,
      autoLoadEntities: true,
    }),
    GeneratorModule,
    TransactionModule,
    MerchantModule,
  ],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
