export class TransferMoneyDto{
  cardToReceive: string;
  cardNumberToTransfer: string;
  cardCvvToTransfer: string;
  cardExpiryDateToTransfer: string;
  amountToTransfer: number;
}