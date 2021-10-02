import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { CardModule } from './card/card.module';
import { TypeOrmModule } from '@nestjs/typeorm';
import { GeneratorModule } from './generator/generator.module';
import { TransactionModule } from './transaction/transaction.module';
import { MerchantModule } from './merchant/merchant.module';

@Module({
  imports: [
    CardModule,
    TypeOrmModule.forRoot({
      type: 'mysql',
      host: 'localhost',
      port: 3306,
      username: 'root',
      password: 'hyperea',
      database: 'jds-bank',
      autoLoadEntities: true,
      synchronize: true,
    }),
    GeneratorModule,
    TransactionModule,
    MerchantModule,
  ],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
