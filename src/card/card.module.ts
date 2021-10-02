import { Module } from '@nestjs/common';
import { CardService } from './card.service';
import { CardController } from './card.controller';
import { VirtualModule } from './virtual/virtual.module';
import { TypeOrmModule } from "@nestjs/typeorm";
import { VisaCard } from './card.entity';
import { GeneratorService } from "../generator/generator.service";

@Module({
  providers: [CardService],
  controllers: [CardController],
  imports: [GeneratorService, VirtualModule, TypeOrmModule.forFeature([VisaCard])],
})
export class CardModule {}
