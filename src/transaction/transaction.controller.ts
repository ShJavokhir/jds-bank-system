import { Body, Controller, Post } from "@nestjs/common";
import { TransactionService } from "./transaction.service";
import { TransferMoneyDto } from "./dto/transfer.money.dto";

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

}
