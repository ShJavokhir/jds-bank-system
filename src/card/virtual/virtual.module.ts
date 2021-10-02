import { Module } from '@nestjs/common';
import { VirtualService } from './virtual.service';
import { VirtualController } from './virtual.controller';
import { GeneratorService } from "../../generator/generator.service";
import { TypeOrmModule } from "@nestjs/typeorm";
import { VisaCard } from "../card.entity";
import { GeneratorModule } from "../../generator/generator.module";

@Module({
  imports: [GeneratorModule,TypeOrmModule.forFeature([VisaCard])],
  providers: [VirtualService, GeneratorService],
  controllers: [VirtualController],
})
export class VirtualModule {}
