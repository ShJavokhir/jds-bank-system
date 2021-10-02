import { Module } from '@nestjs/common';
import { CardService } from './card.service';
import { CardController } from './card.controller';
import { VirtualModule } from './virtual/virtual.module';
import { TypeOrmModule } from "@nestjs/typeorm";
import { VisaCard } from '../card.entity';

@Module({
  providers: [CardService],
  controllers: [CardController],
  imports: [VirtualModule, TypeOrmModule.forFeature([VisaCard])],
})
export class CardModule {}
