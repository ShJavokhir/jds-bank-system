import { BadRequestException, Injectable, ServiceUnavailableException } from "@nestjs/common";
import { PayForGoodsDto } from "./dto/pay.for.goods.dto";
import { InjectRepository } from "@nestjs/typeorm";
import { Repository } from "typeorm";
import { MerchantPayments } from "./merchant.payments.entity";
import { VisaCard } from "../card/card.entity";
import { VisaCardDto } from "../card/dto/visa.card.dto";
import { MoneyTransfer } from "../transaction/money.transfers.entity";

const MERCHANT_COMISSION = 2; //2% comission
@Injectable()
export class MerchantService {
  constructor(@InjectRepository(MerchantPayments)
              readonly merchantPaymentsRepository: Repository<MerchantPayments>,
              @InjectRepository(VisaCard)
              readonly visaCardRepository: Repository<VisaCard>
  ) {
  }

  async payForGoods(payForGoodsDto: PayForGoodsDto):Promise<any>{
    const visaCard = new VisaCard();
    visaCard.cardNumber = payForGoodsDto.cardNumber;
    visaCard.cardCvv = payForGoodsDto.cardCvv;
    visaCard.cardExpiryDate = payForGoodsDto.cardExpiryDate;

    let visaCardInDatabase = await this.visaCardRepository.findOne(visaCard);
    if(!visaCardInDatabase) throw new BadRequestException("Your card numbers are not valid !");

    if(visaCardInDatabase.balance < payForGoodsDto.amount) throw new ServiceUnavailableException('Not enough money to transfer');

    visaCardInDatabase.balance -= payForGoodsDto.amount;
    visaCardInDatabase.cashBack += payForGoodsDto.amount * 0.015;
    console.log(payForGoodsDto.amount * 0.015);
    await this.visaCardRepository.save(visaCardInDatabase);

    const merchantPayments = new MerchantPayments();
    merchantPayments.amount = payForGoodsDto.amount;
    merchantPayments.cardNumber = payForGoodsDto.cardNumber;
    merchantPayments.goodsAccountNumber = payForGoodsDto.goodsAccountNumber;
    merchantPayments.goodsName = payForGoodsDto.goodsName;
    merchantPayments.merchantsComission = payForGoodsDto.amount*MERCHANT_COMISSION/100
    return await this.merchantPaymentsRepository.save(merchantPayments);
  }

  async getPaysForGoods(visaCardDto: VisaCardDto): Promise<any>{
    const visaCardInDatabase = await this.visaCardRepository.findOne(visaCardDto);
    if(!visaCardInDatabase) throw new BadRequestException("Your card numbers are not valid !");

    const merchantPayments = new MerchantPayments();
    merchantPayments.cardNumber = visaCardInDatabase.cardNumber;

    return await this.merchantPaymentsRepository.find(merchantPayments);
  }
}
