import { Injectable, ServiceUnavailableException } from "@nestjs/common";
import { TransferMoneyDto } from "./dto/transfer.money.dto";
import { InjectRepository } from "@nestjs/typeorm";
import { VisaCard } from "../card/card.entity";
import { Repository } from "typeorm";
import { MoneyTransfer } from "./money.transfers.entity";

@Injectable()
export class TransactionService {
  constructor(@InjectRepository(MoneyTransfer)
              readonly transferRepository: Repository<MoneyTransfer>,
              @InjectRepository(VisaCard)
              readonly visaCardRepository: Repository<VisaCard>,
  ) {
  }

  async transferMoney(moneyTransferDto: TransferMoneyDto) : Promise<void> {
    let visaCardToTransfer = new VisaCard();
    const visaCardToReceive = new VisaCard();
    const moneyToTransfer = moneyTransferDto.amountToTransfer;
    visaCardToReceive.cardNumber = moneyTransferDto.cardToReceive;
    visaCardToTransfer.cardNumber = moneyTransferDto.cardNumberToTransfer;
    visaCardToTransfer.cardCvv = moneyTransferDto.cardCvvToTransfer;
    visaCardToTransfer.cardExpiryDate = moneyTransferDto.cardExpiryDateToTransfer;

    //next line is just for verify that card name is exist
    let visaCardToReceiveInDatabase = await this.visaCardRepository.findOne(visaCardToReceive);
    let visaCardInDatabase = await this.visaCardRepository.findOne(visaCardToTransfer);

    if(!visaCardToReceiveInDatabase.isActive) throw new ServiceUnavailableException('Receiver card is Deactivated');
    if(!visaCardInDatabase.isActive) throw new ServiceUnavailableException('Sender card is Deactivated');

    if(visaCardInDatabase.balance < moneyToTransfer){
      throw new ServiceUnavailableException('Not enough money to transfer');
    }
    //substract money from account
    visaCardInDatabase.balance -= moneyToTransfer;
    await this.visaCardRepository.save(visaCardInDatabase);

    //add money to receiver account
    visaCardToReceiveInDatabase.balance += moneyToTransfer;
    await this.visaCardRepository.save(visaCardToReceiveInDatabase);

  }

  async recordMoneyTransferTransaction(moneyTransferDto: TransferMoneyDto) : Promise<any> {
    const moneyTransfer = new MoneyTransfer();
    moneyTransfer.amount = moneyTransferDto.amountToTransfer;
    moneyTransfer.cardReceived = moneyTransferDto.cardToReceive;
    moneyTransfer.cardSent = moneyTransferDto.cardNumberToTransfer;
    return await this.transferRepository.save(moneyTransfer);
  }
}


