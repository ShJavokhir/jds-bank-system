import { Body, Controller, Get, Post } from "@nestjs/common";
import { TransactionService } from "./transaction.service";
import { TransferMoneyDto } from "./dto/transfer.money.dto";
import { VisaCardDto } from "../card/dto/visa.card.dto";

@Controller('transaction')
export class TransactionController {
  constructor(private transactionService: TransactionService) {
  }

  @Post()
  async transferMoney(@Body() transferBodyDto: TransferMoneyDto) : Promise<any> {
    await this.transactionService.transferMoney(transferBodyDto);
    return await this.transactionService.recordMoneyTransferTransaction(transferBodyDto);
    //return 'done';
  }

  @Post('getCardTransfers')
  getCardTransfers(@Body() visaCardDto: VisaCardDto):any {
    return this.transactionService.getCardTransfers(visaCardDto);
  }

}
