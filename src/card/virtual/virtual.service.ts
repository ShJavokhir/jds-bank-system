import { Injectable } from '@nestjs/common';
import { InjectRepository } from "@nestjs/typeorm";
import { VisaCard } from "../card.entity";
import { Repository } from "typeorm";
import { GeneratorService } from "../../generator/generator.service";
import { VisaCardDto } from "../dto/visa.card.dto";

@Injectable()
export class VirtualService {
  constructor(
    @InjectRepository(VisaCard)
    readonly visaCardRepository: Repository<VisaCard>,
    readonly generatorService: GeneratorService
  ){}
  async createVirtualVisaCard (fullName: string) : Promise<any> {
    let visaCard = new VisaCard();
    visaCard.cardExpiryDate = this.generatorService.generateVisaExpiryDate();
    visaCard.cardNumber = this.generatorService.generateVisaNumber();
    visaCard.cardCvv = this.generatorService.generateCVV();
    visaCard.isVirtual = true;
    visaCard.isActive = true;
    visaCard.balance = 0;
    visaCard.cashBack = 0;
    visaCard.fullName = fullName;
    await this.visaCardRepository.save(visaCard);
    return visaCard;
  }

  async deactivateCard(visaCard: VisaCardDto): Promise<any>{
    let visaCardInDatabase = await this.visaCardRepository.findOne(visaCard);
    visaCardInDatabase.isActive = false;
    return await this.visaCardRepository.save(visaCardInDatabase);
  }

  async activateCard(visaCard: VisaCardDto): Promise<any>{
    let visaCardInDatabase = await this.visaCardRepository.findOne(visaCard);
    visaCardInDatabase.isActive = true;
    return await this.visaCardRepository.save(visaCardInDatabase);
  }

  async getCardInfo(visacard: VisaCardDto): Promise<any>{
    let visaCard1 = new VisaCard();
    visaCard1.cardNumber = visacard.cardNumber;
    visaCard1.cardCvv = visacard.cardCvv;
    visaCard1.cardExpiryDate = visacard.cardExpiryDate;
    return this.visaCardRepository.findOne(visaCard1);
  }

  async getBalance(visaCard: VisaCardDto): Promise<any>{
    let visaCardInDatabase = await this.visaCardRepository.findOne(visaCard);
    return {
      'balance': visaCardInDatabase.balance
    }
  }

  async getCashback(visaCard: VisaCardDto): Promise<any>{
    let visaCardInDatabase = await this.visaCardRepository.findOne(visaCard);
    return {
      'cashBack': visaCardInDatabase.cashBack
    }
  }
}
