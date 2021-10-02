import { Injectable } from '@nestjs/common';

@Injectable()
export class GeneratorService {
  generateVisaNumber(): string {
    let cardNumber = '';
    for (let i = 1; i <= 16; i++) {
      cardNumber += String(Math.floor(Math.random() * (9 - 1 + 1) + 1));
    }
    return cardNumber;
  }

  generateVisaExpiryDate(): string {
    return '05/25';
  }

  generateCVV(): string {
    return String(
      String(String(Math.floor(Math.random() * (9 - 1 + 1) + 1))) +
      String(String(Math.floor(Math.random() * (9 - 1 + 1) + 1))) +
      String(String(Math.floor(Math.random() * (9 - 1 + 1) + 1)))
    );
  }
}
